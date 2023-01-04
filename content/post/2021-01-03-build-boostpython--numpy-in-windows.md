---
type: post
layout: "post"
title: Build Boost.Python & Numpy in Windows
author: nielsb
date: 2021-01-03T13:50:55+02:00
comments: true
highlight: true
draft: false
categories:
  - SQL Server 2019
  - SQL Server Machine Learning Services
  - SQL Server Extensibility Framework
tags:
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - Python
  - SQL Server Extensibility Framework
  - Boost
description: How to build Boost.Python with the view to be able to create a Python SQL Language extension.
keywords:
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - Python
  - SQL Server Extensibility Framework
  - Boost   
---

In this post, we look at how to build `Boost.Python` and `Numpy`. We look at it from a perspective where we want to use what we build as part of a bridge between SQL Server 2019 and Python. However, if you are not interested in SQL, the post should still give you some - hopefully - useful information.

Please note that I am a SQL dude, and my knowledge of Boost, Python and Numpy is limited at best. So take this post for what it is; the steps I took to successfully build `Boost.Python` and `Numpy` on a Windows box.

<!--more-->

## Background

In my post, [**Bring Your Own R & Python Runtimes to SQL Server Extensibility Framework**][1] I wrote about how we can use other R and Python runtimes in SQL Server Machine Learning Services than the ones that come "out of the box". In the post, I wrote that if you want to bring a Python runtime other than version 3.7.x, (like 3.8, 3.9, etc.), you need to build your own bridge; a SQL Server Python language extension.

A language extension is a C++ dll acting as a bridge between SQL Server and an external runtime - in this case Python. To interact between C++ and Python you often use Boost, and for the SQL Server Python extension, Boost libraries are required.

## Pre-reqs

What do we need to do this:

* Python: I have Python 3.9.1 installed together with `numpy`.
* Boost: well, that's fairly obvious. I downloaded Boost 1.75.0 from [Boost Downloads][2].
* A C++ compiler, (a `toolset` in Boost speak). I use the compiler from Visual Studio 2019 - in Boost it is defined as `msvc-14.2`.

Obviously, if you want to use what we do here to build a Python SQL Server Language Extension, you need the source code for the language extensions and SQL Server. That will be covered in a future post.

Now, let's get on with it.

## Boost

Boost is a set of C++ libraries complementing the C++ standard libraries. The Boost libraries provide support for tasks and structures such as linear algebra, pseudorandom number generation, multithreading, image processing, regular expressions, and unit testing.

Boost also allows us to interact between C++ and Python, via `Boost.Python`. In the Python extension, Boost is used - among other things - to interact with the runtime, execute scripts as well as to interact with `numpy`.

Most of the Boost libraries are pre-built, however, `Boost.Python` needs to be built before we can use it. Initially, I thought "how hard can it be to build this", well - it turned out a lot more complicated than I imagined. This, in my opinion, is due to that the Boost documentation is less than stellar, which is one big reason I wrote this post.

#### Boost Installation

There is no installation file as such, I just unzipped the file I downloaded above to a location on my box: `C:\`:

![](/images/posts/byor-python-boost1.png)

**Figure 1:** *Boost Install*

We see in *Figure 1* the Boost installation. The question now is what we do with it? We know from above that we somehow have to build `Boost.Python`, but what do we build with? 

#### Bootstrap

It turns out that you have to bootstrap the Boost build engine, `Boost.Build`. On Windows, you do that by running the `bootstrap.bat` file, outlined in red in *Figure 1*:

```bash
c:\boost_1_75_0>.\bootstrap.bat vc142
```
**Code Snippet 1:** *Bootstrap Boost Build Engine*

In *Code Snippet 1* we see how I from command prompt have `cd`:ed into the Boost directory. I indicate that I want to use the Visual Studio 2019 toolset by defining the `vc142` flag. When I execute the script, some information is output to the console, and when the script has finished, I see:

![](/images/posts/byor-python-boost2.png)

**Figure 2:** *Boost Install*

In *Figure 2* I have a couple of things outlined in red and yellow:

* What is outlined in red is the command you use to build with Boost: `b2.exe`. That is the executable created by `bootstrap.bat`.
* Outlined in yellow is a configuration file. You configure your builds using - among other things - configuration files which are `.jam` files. This file `project-config.jam` is used for project-specific configuration.

Let's talk configuration.

#### Configuration

Above I mentioned the `project-config.jam` file created when you run the bootstrap script. There are two more configuration files used by `b2.exe`:

* `site-config.jam`: usually installed and maintained by a system administrator. Not installed by default.
* `user-config.jam`: for the user to configure, not installed by default. It usually defines the available compilers and other tools. We'll create the file to indicate what version of Python to compile against.

Create a file in your home directory and name it `user-config.jam`. Edit it to look like so:

``` py
using python 
   : 3.9
   : C:\\Python39\\python.exe
   : C:\\Python39\\include #directory that contains pyconfig.h
   : C:\\Python39\\libs    #directory that contains python39.lib
   ;
```
**Code Snippet 2:** *Configuration File*

We see in *Code Snippet 2* how we indicate where to find the Python executable, Python header files, and Python lib files.hr 

> **NOTE:** Defining the Python version is not really necessary if you have only one Python version installed.

Now when we have a configuration, it is time to build.

#### Build

As mentioned above to build, we run `b2.exe`. If we were to `cd` into the Boost install directory and just do: `b2`, then we would build everything - and it would take a while. Here we are only interested in building Python, so we need to limit what `b2` does.

After browsing for information around Boost, I started with something like so:

```bash
b2 --with-python --prefix=c:\\boost175 address-model=64 \
                 variant=release link=static threading=multi \
                 runtime-link=shared install
```
**Code Snippet 3:** *Build Take 1*

Let's look at the code in *Code Snippet 3*, and see what it means:

* `--with-python`: limit the build to only build Python. This will also include `numpy`.
* `--prefix`: where to build to. In *Code Snippet 3* I want everything built to be placed in a root directory: `c:\\boost175`. Notice for the files to be put into this directory, the `install` flag needs to be set.
* `address-model=64`: specifies if 32-bit or 64-bit code should be generated by the compiler. In my case I want 64-bit.
* `variant=release`: specifies release or debug, or both.
* `link=static`: defines whether to create `static` or `shared` libraries. For the Python extension, we want `static`. Read more about `static` vs. `shared` [here][3].
* `threading=multi`: threading model.
* `runtime-link=shared`: determines if shared or static version of C and C++ runtimes should be used.
* `install`: ensures that the built files are put into the `--prefix` directory.

Running the code we see in *Code Snippet 3* "spews" out a lot of information to the console, and if something is not working correctly, it can be difficult to see what is going wrong, due to the amount of data being output.

An example of something going wrong was when I initially ran this code on Windows 10; the `boost175` directory was created as expected. However, when I drilled down in the directory, I saw only a Python lib file, but no Numpy lib file. I knew there should be both Python and Numpy files, so something was clearly not right. 

After tearing my hair out for quite a while, I came across the [B2 User Manual][4], and [invocation options][5]. In there, I found two option flags:

* `--debug-configuration`: this flag tells `b2` to produce debug information about the loading of `b2` and toolset files.
* `-d0`: suppresses all informational messages.

```bash
b2 --with-python --prefix=c:\\boost175 \
                 --debug-configuration \
                 -d0 \
                 address-model=64 \
                 variant=release link=static threading=multi \
                 runtime-link=shared install
```
**Code Snippet 4:** *Build Take 2*

When I ran the build as in *Code Snippet 4* it produced some useful output:

![](/images/posts/byor-python-numpy-error.png)

**Figure 3:** *Numpy Error*

We see in *Figure 3* (outlined in red) a bug in Windows 10 2004/20H2, (from build 19041.488), impacting Numpy. It is fixed from build 20270 and upwards. However, that build is still not generally available, (you can get it from Windows Insiders Dev channel). Microsoft estimates a fix will be rolled out sometimes in January 2021. If you are affected by this and you can not get a Windows 10 Dev build  you can solve it by downgrading `numpy` to version 1.19.3: `pip install --upgrade numpy==1.19.3`.

> **NOTE:** The link [here][6] has more information about the bug.

I have since then upgraded to the latest Windows Dev build and when I run the code, everything works fine:

![](/images/posts/byor-python-lib-files.png)

**Figure 4:** *Lib Files*

In *Figure 4* we see how we have lib files for both Python and Numpy! Success!

When you look at the console output when you do the build you may see something like so:

![](/images/posts/byor-python-boost-arch.png)

**Figure 5:** *Boost Address Model & Architecture*

Hmm, that does not look right. In the code we definitely said `address-model=64`, but in the output, it says 32 bit. It turns out this is a bug in the build output, so nothing to worry about. 

## Summary

We have in this post looked at how to build `Boost.Python`, and `Numpy` on a Windows 10 box:

1. Ensure we have Python and Numpy installed.
1. Download Boost and unzip.
1. Ensure you have a C++ compiler installed.
1. Run the `bootstrap.bat` script, and optionally define the compiler, (`toolset`).
1. Execute `b2.exe` as per *Code Snippet 4* to build `Boost.Python` and `Numpy`.

You can now start to use the libs created. In a future post we'll see how to create the SQL Server Python extension, using the files above.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[1]: {{< relref "2020-12-29-bring-your-own-r--python-runtimes-to-sql-server-extensibility-framework.md" >}} 
[2]: https://www.boost.org/users/download/
[3]: https://www.boost.org/doc/libs/1_75_0/libs/python/doc/html/building/choosing_a_boost_python_library_.html
[4]: https://boostorg.github.io/build/manual/develop/index.html
[5]: https://boostorg.github.io/build/manual/develop/index.html#bbv2.overview.invocation.options
[6]: https://developercommunity.visualstudio.com/content/problem/1207405/fmod-after-an-update-to-windows-2004-is-causing-a.html