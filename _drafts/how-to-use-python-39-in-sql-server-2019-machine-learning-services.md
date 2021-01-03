---
type: post
layout: "post"
title: How to Use Python 3.9 in SQL Server 2019 Machine Learning Services
author: nielsb
date: 
comments: true
highlight: true
draft: true
categories:
  - SQL Server 2019
  - SQL Server Machine Learning Services
  - SQL Server Extensibility Framework
tags:
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - R
  - Python
  - Java
  - SQL Server Extensibility Framework
description: 
keywords:
  -   
---

In my post, [**Bring Your Own R & Python Runtimes to SQL Server Extensibility Framework**][1] I wrote about how we can use other R and Python runtimes in SQL Server Machine Learning Services than the ones that come "out of the box". In the post, I wrote that if you want to bring a Python runtime other than version 3.7.x, (like 3.8, 3.9, etc.), you need to build your own Python language extension.

I wrote that we'd look at how to do that in a future post, and this is that post. When I wrote that we'd look at this in a future post, I thought to myself; "how hard can it be?". Well, it turned out it was somewhat more complicated than what I anticipated. So, if you are interested - read on!

<!--more-->

## Background

As I wrote in the [post mentioned above][1], Microsoft open-sourced R and Python language extensions in September 2020. This allows us to bring our own R/Python runtime to SQL Server 2019, (CU3+), and use those runtimes in SQL Server Machine Learning Services. We may want to do this because we want to use a later version of the runtime.

Language extensions are C++ dll's acting as a bridge between SQL Server and the external runtime. The language extensions implement the [Extensibility Framework API for SQL Server][2]

In the post we looked at using Python 3.7.9, and what we did was:

* installed Python 3.7.9
* after the installation of Python we installed the `pandas` module, as it is not installed by default: `pip install pandas`.
* created a system environment variable `PYTHONHOME` pointing to the install directory of Python 3.7.9.
* assigned read and write permissions for the SQL Server instance-specific *Launchpad* service, and the `ALL APPLICATION PACKAGES` group to the Python install directory.
* downloaded the Python language extension zip file to a location accessible by SQL Server.

After we downloaded the language extension, we created an external language based on the extension:

```sql
USE ExtLangDB;
GO

CREATE EXTERNAL LANGUAGE p379
FROM (CONTENT = 'W:\python-lang-extension-windows.zip'
      , FILE_NAME = 'pythonextension.dll');
GO
```
**Code Snippet 1:** *Create Python Language*

We see in *Code Snippet 1* how we:

* create the language in a database named `ExtLangDB`.
* give the language the name of `p379`. We cannot use the name Python, (or R if it is an R extension), as it is a reserved keyword.
* point to the path of the zip file.
* indicate what file in the zip file is the extension dll.

After having created the language, we used it:

``` sql
EXEC sp_execute_external_script
@language =N'p379',
@script=N'
import pandas as pd
import sys
df = pd.DataFrame(columns=["Version"])
ver = sys.version
df = df.append({"Version": ver}, ignore_index=True)
OutputDataSet = df'
WITH RESULT SETS (([Python Version] nvarchar(256)));
```
**Code Snippet 2:** *Version Check Python*

The code in *Code Snippet 2* outputs the Python version we execute against, and by setting the `@language` parameter to `p379`, we ensure we use the language we created in *Code Snippet 1*. When we run the code, we see `3.7.9` being output.

That's how we used another runtime than the one coming with SQL Server. However, when we tried to do the same with Python 3.9, we failed, as - as mentioned above - the Python language extension is version bound to Python 3.7.x. All we need is to re-build the existing Python extension, and - as I said above- how hard can that be, the code is open-source after all.

## Pre-reqs

Let us look at what we need to do this. The list is much the same as in the [previous post][1]:

* SQL Server CU3+. Ensure that *Machine Learning Services and Language Extensions* are installed, and execution of external scripts are enabled, (all this is covered in detail in the [last post][1]). In this post, we use the same database as in the last post `ExtLangDB`.
* Python; instead of Python 3.7.9, we use Python 3.9.1. Download and install it. Create the `PYTHONHOME` system variable pointing to the Python installation, and install `pandas`: `pip install pandas`. We also need `numpy` if Python does not have it: `pip install numpy`.

In the last post, we downloaded the zip file for the Python language extension, but in this post, we will build from source, so we need other things as well. 

We start with cloning the GitHub repo for [SQL Server Language extensions][3]. When you drill down into the [root for the Python extension][4], there is a `README.md` file that explains the steps and what is needed to build the Python extension.

> **NOTE:** Reading the steps was made me believe this would be "easy piecey". Color me "stupid".

When looking at the page/document, and the instructions for building for Windows, we see there are some pre-reqs:

* CMake for Windows. CMake is an open-source, cross-platform family of tools designed to build, test and package software. I install it via Chocolatey: `choco install cmake -y', alternatively, you can download it from [here][5]. Create a system environment variable `CMAKE_ROOT` pointing at the install directory of CMake. On my box, it is `C:\Program Files\CMake`.
* Boost Python. We'll talk more about Boost below.
* C++ tools for CMake. On the page it says you get it from "Build Tools for Visual Studio 2017", I am using "Build Tools for Visual Studio 2019" instead. Whichever you use, install by following the instructions on the page.

Now, let's get into it.

## Boost

Boost is a set of C++ libraries complementing the C++ standard libraries. The Boost libraries provide support for tasks and structures such as linear algebra, pseudorandom number generation, multithreading, image processing, regular expressions, and unit testing.

Boost also allows us to interact between C++ and Python, via `Boost.Python`. In the Python extension, Boost is used - among other things - to interact with the runtime, execute, scripts as well as to interact with `numpy`.

Most of the Boost libraries are pre-built, however `Boost.Python` needs to be built before we can use it. That's where many of my problems started, as the documentation for Boost is c*ap, (at least I found it to be less than stellar).

Anyway, let's get Boost. I downloaded the latest version, (1.75.0 at the time of writing), from [Boost Downloads][6]. There is no installation file as such, you just unzip the file to a location on your box. I placed it in `C:\`:

![](/images/posts/byor-python-boost1.png)

**Figure 1:** *Boost Install*

We see in *Figure 1* the Boost installation. The question now is what we do with it, we know from above that we somehow have to build `Boost.Python`, but what do we build with? 

#### Bootstrap

It turns out that you have to bootstrap the Boost build engine, `Boost.Build`. On Windows, you do that by running the `bootstrap.bat` file, outlined in red in *Figure 1*:

```bash
c:\boost_1_75_0>.\bootstrap.bat
```
**Code Snippet 3:** *Boostrap Boost Build Engine*

In *Code Snippet 3* we see how I from command prompt have `cd`:ed into the Boost directory. When I execute the script, some information is output to the console, and when the script has finished, I see:

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

``` text
using python 
   : 3.9
   : C:\\Python39\\python.exe
   : C:\\Python39\\include #directory that contains pyconfig.h
   : C:\\Python39\\libs    #directory that contains python39.lib
   : <toolset>msvc 
   ;
```
**Code Snippet 4:** *Configuration File*

We see in *Code Snippet 4* how we indicate where to find the Python executable, Python header files, and Python lib files. We also say what `toolset` to use. In this case it is not really necessary as the `project-config.jam` file contains that information as well.

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
**Code Snippet 5:** *Build Take 1*

Let's look at the code in *Code Snippet 5*, and see what it means:

* `--with-python`: limit the build to only build Python. This will also include `numpy`.
* `--prefix`: where to build to. In *Code Snippet 5* I want everything built to be placed in a root directory: `c:\\boost175`. Notice for the files to be put into this directory, the `install` flag needs to be set.
* `address-model=64`: specifies if 32-bit or 64-bit code should be generated by the compiler. In my case I want 64-bit.
* `variant=release`: specifies release or debug, or both.
* `link=static`: defines whether to create `static` or `shared` libraries. For the Python extension, we want `static`.
* `threading=multi`: threading model.
* `runtime-link=shared`: determines if shared or static version of C and C++ runtimes should be used.
* `install`: ensures that the built files are put into the `--prefix` directory.

When I ran the code in *Code Snippet 5*, a lot of information was "spewed" out to the console, and the `boost175` directory was created. However, when I drilled down in the directory, I saw a Python lib file, but no Numpy lib file. I knew there should be both Python and Numpy files, so something was clearly not right. 

After tearing my hair out for quite a while, I came across the [B2 User Manual][7], and [invocation options][8]. In there, I found two option flags:

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
**Code Snippet 6:** *Build Take 2*

Running the build as in *Code Snippet 6* produces some useful output:

![](/images/posts/byor-python-numpy-error.png)

**Figure 3:** *Numpy Error*

Aha, what we see in *Figure 3*, (outlined in red), is the same issue I mentioned in the [**Bring Your Own R & Python Runtimes to SQL Server Extensibility Framework**][1] post. The issue is there is a bug in the Windows 20H2 runtime which causes a particular call in Numpy 1.19.4 to fail. The easiest way to solve it is to downgrade Numpy: `pip install --upgrade numpy==1.19.3`. 

When we now run the code everything should work:

![](/images/posts/byor-python-lib-files.png)

**Figure 4:** *Lib Files*

In *Figure 4* we see how we have lib files for both Python and Numpy!











![](/images/posts/<image_name_incl_ext>)

**Figure 1:** **

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright


<!--
  post reference
  [pkg1]: {{< relref "" >}}
-->  



[1]: {{< relref "2020-12-29-bring-your-own-r--python-runtimes-to-sql-server-extensibility-framework.md" >}} 
[2]: https://docs.microsoft.com/en-us/sql/language-extensions/reference/extensibility-framework-api?view=sql-server-ver15
[3]: https://github.com/microsoft/sql-server-language-extensions.git
[4]: https://github.com/microsoft/sql-server-language-extensions/tree/master/language-extensions/python
[5]: https://cmake.org/download/
[6]: https://www.boost.org/users/download/
[7]: https://boostorg.github.io/build/manual/develop/index.html
[8]: https://boostorg.github.io/build/manual/develop/index.html#bbv2.overview.invocation.options
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:   

<!--
[series1]: <> [SQL Server R Services](/series/sql_server_2k16_r_services)
[series2]: <> [Install R Packages in SQL Server ML Services](/series/sql_server_ml_services_install_packages)
[series3]: <> [sp_execute_external_script and SQL Server Compute Context](/series/spees_and_sql_compute_context)
-->

<!--
[findstr]: <> findstr /I \<word_to_find\> *
-->