---
title: Installing R Packages in SQL Server Machine Learning Services - I
layout: post
author: nielsb
date: 2018-06-23T13:13:58+02:00
comments: true
categories:
  - SQL Server
  - Microsoft R Server
  - Microsoft Machine Learning Server
  - Data Science
  - SQL Server R Services
  - SQL Server Machine Learning Services 
tags:
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - R
  - Python
  - Rgui
  - R Package Manager
description: How can we install R packages in SQL Server Machine Learning Services
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - R
  - Python
  - Rgui
  - R Package Manager   
---

This post was supposed to be a single post about how to install R packages in SQL Server Machine Learning Services, but once again I completely misjudged the scope of the topic. So this one post turned into a series of posts about how to install R packages in **SQL Server Machine Learning Services** and this is the first post in the series. 

To see other posts in the series go to [**Install R Packages in SQL Server ML Services Series**](/sql_server_ml_services_install_packages).

As you may know, I am in the process of writing the follow-up post to [sp_execute_external_script and SQL Compute Context - I][ctx1]. However, I have a hard time getting into the flow of things, so I use any excuse I can, to not have to write. So when [Dane Bax][1], a colleague of mine, contacted me a couple of days ago with a **SQL Server Machine Learning Services** problem, I jumped at the chance to help him, and also write a post about it.

[Dane][1] works for a sister company of [Derivco](/Derivco) as a data scientist and at both [Derivco](/Derivco) and the sister company - [Microgaming][2] we are now looking at using SQL Server Machine Learning Services.

His problem was that he wanted to use a CRAN package - `bsts` - which is not part of a standard SQL Server R installation. He tried a couple of things to get it installed but got errors, so he decided to get in touch with me. 

<!--more-->

> **NOTE:** The package name `bsts` stands for *Bayesian Structural Time Series* and it performs time series regression using dynamic linear models fit using MCMC.

## Background

First of all; why would we need to install R packages if I already have R, either on my local machine or via SQL Server ML Services? Well, the answer to that is that there are a multitude of packages "in the wild" who do not necessarily come with your R engine of choice, and `bsts` is an excellent example of this.

If you are an R developer you are probably accustomed to installing packages on your R development environment at will, and - more or less - at whatever location you choose. When using SQL Server ML Services however, it does not work like that as SQL Server cannot load packages from external libraries, even if that library is on the same computer. So when using SQL Server ML Services, you can only install packages to a default library associated with the instance.

The installation of packages can be done in different ways which is what this post is about - but before that, let us look at something somewhat different: **Rtools**.

## Rtools

The cool thing with R is that it is open source and you can run it on multiple platforms (Windows, Mac, Linux). So in essence, whatever package you want to use you can run on your platform of choice. If you install a package on Mac or Windows, R downloads and installs a pre-compiled (for your OS) packet. On Linux, R downloads the source of the package and builds it on your machine. For the build, R requires some external tools: `make`, `tar`, `gzip`, C/C++ compiler and so forth.

Why I mention this here is that certain packages do not have a binary built for Windows, and if you want to install such a package, you need to build the package from source on your environment. The problem with this is that most of the tools needed to build the package may not exist in the Windows environment.

To be able to compile from source on Windows, the people behind R have made available an installer which installs the required tools for compilation of packages: **Rtools**. So if you think that you ever need to compile an R package from source, then ensure that you have *Rtools* installed. Why I bring this up is that the `bsts` package has a dependency on a package that needs to be compiled.

#### Rtools Installation

While you can install R packages to a remote machine, keep in mind that *Rtools* is not an R package as such, and it is not installed into the engine - but onto the machine where R is. So, for us here, we need to be on the machine that hosts SQL Server ML Services and run the installation on that machine.

We need first to download the installer for *Rtools*, and when you browse to the [download page][3], you see there are multiple versions dependent on what version of R you have. To find the R version of your SQL Server ML Services installation you can run following code:

```sql
EXEC sp_execute_external_script
                  @language = N'R' ,
                  @script = N'print(R.Version()$version)'
```
**Code Snippet 1:** *Retrieve R Version*

When I run the code in *Code Snippet 1* on my SQL Server ML Services instance, I see that the R version is `3.3.3`, so I download `Rtools35.exe` to my SQL Server machine and run the installer. By default *Rtools* installs to `C:\RTools` and R looks for compilers in the default installation path. If you install anywhere else, you have to point R to the path of `gcc`, `g++` and `ld`, by setting a variable called BINPREF. *Rtools* installation instructions discuss this in detail. During the install ensure you check the checkbox for "Add rtools to system PATH":

![](/images/posts/sql_ml_install_r_pckgs_rtools_path.png)

**Figure 1:** *Adding Rtools to PATH*

After having checked the box for editing the PATH as in *Figure 1*, click through and let the install finish. After installation, it is a good practice to check that the PATH is set. You can do this by running `RTerm.exe` (on the SQL Server box) and execute `Sys.getenv('PATH')` from RTerm's command prompt. You find `RTerm.exe` at the `R_SERVICES\bin\x64` directory under the path to the SQL Server instance. For example: `C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\R_SERVICES\bin\x64`. 

> **NOTE:** Just a word of caution here. When I installed `Rtools35.exe` I had to manually add to PATH the path to the compilers: `C:\Rtools\mingw_64\bin`. So look out for that .

You should also check that you can call the C++ compiler: `system('g++ -v')` (this is how I realised the path was not correct). That should result in something like:

![](/images/posts/sql_ml_install_r_pckgs_rtools_g++.png)

**Figure 2:** *Checking for C++ Compiler*

If everything looks OK, *Rtools* have now been installed, and the various instances of R (from SQL Server ML instances) can share the *Rtools* toolchain.

## R Packages Installation

When we install R packages for SQL Server ML Services we install them on a per SQL Server instance, and we can install these packages different in ways:

* R packet managers.
* T-SQL.
* RevoScaleR.

Regardless how we install the packages, they can only be installed to the default packet library for that instance. The file system folder for this library has restricted access and to write to this folder you need admin rights. Well, that is not entirely correct - with some configuration changes even non-admin can install packages via T-SQL and RevoScaleR. However, as we see later, the installation is against the current database.

#### R Code for Installation

Before we look at the ways we can install and the tools for installation; what does the code we use to do the installation look like?

As you probably know, the way to install R packages is through the `install.packages` command. The command has quite a few parameters as you can see [here][4], but when I install packages I use only a few of the parameters, regardless of the way I install the package:

```r
# get the library path
libPath <- .libPaths()[1]
install.packages("pkg_name", lib = libPath, 
                  repos = "url_for_the_repo", 
                  dependencies = TRUE)
``` 
**Code Snippet 2:** *Install Packages Command*

In *Code Snippet 2* we see how I first retrieve the library path. This is where I install the package to, and once again - I can only install to the default instance directory. Then in the `install.packages` call I use these parameters:

* First parameter is always the name of the package(s) to install.
* `lib`: is for the library folder to install to.
* `repos`: the base URL(s) of the repositories to use. If left out, the repo used is the Microsoft MRAN repo, which may not be what you want.
* `dependencies`: indicating whether to also install missing packages which these packages depend on/link to/import/suggest (and so on recursively).

So that is the code for installation of packages. What if you want to see what packages are installed on a particular instance of SQL Server ML Services? For that you can execute something like so from **SQL Server Management Studio** (SSMS):

```sql
EXEC sp_execute_external_script 
                    @language = N'R', 
                    @script = N'
                    OutputDataSet <- data.frame(
                    installed.packages()[,c("Package", "Version", 
                                        "Depends", "License", 
                                        "Built", "LibPath")]);'
WITH RESULT SETS ((Package nvarchar(255), Version nvarchar(100), 
                   Depends nvarchar(4000), License nvarchar(1000), 
                   Built nvarchar(100), LibPath nvarchar(2000)));
```
**Code Snippet 3:** *Retrieve Installed R Packages*

So now when we have seen some code how to install packages (and also see what packages already exists), in this post let us look at using R packet managers for the installation.

## R Packet Managers

What is an R packet manager? It is an R command line tool or GUI installed on the SQL Server Machine Learning Services machine that can run with elevated permissions and target the R engine for the instance on which you want to install the package. The easiest is to use either of the R tools that come as part as part of SQL Server's R service:

* The command line tool: `Rterm.exe`.
* The GUI: `Rgui.exe`.

Once again you need to be able to run them with elevated access, so you need admin rights on the machine, and they can only run locally.

So let us say that [Dane][1] (from above) wants to install the `bsts` package mentioned above and he has admin rights on the machine SQL Server is installed on. The choice he has is to use `Rterm.exe` or `Rgui.exe`. Dane is not really into command line, so he uses `Rgui.exe`:

* He logs onto the SQL Server machine either directly or via *Terminal Services*.
* He navigates to where `Rgui.exe` is (the same path as above for `Rterm.exe`).
* He right clicks on `Rgui.exe`:

![](/images/posts/sql_ml_install_r_pckgs_rgui.png)

**Figure 3:** *Run Rgui as Admin*

When he clicks on "Run as administrator" the Rgui application starts up in the context of the R engine of the instance of SQL Server ML Services:

![](/images/posts/sql_ml_install_r_pckgs_rgui2.png)

**Figure 4:** *Rgui*

In the R Console in Rgui Dane now enters this code:

```r
> libPath <- .libPaths()[1]
> install.packages("bsts", repos = "https://cloud.r-project.org/", 
+                  dependencies=TRUE, lib = libPath);
```
**Code Snippet 4:** *Install bsts*

In *Code Snippet 4* we see that Dane uses the open source *CRAN* repo which hosts `bsts`. When he executes the code, it looks like so:

![](/images/posts/sql_ml_install_r_pckgs.png)

**Figure 4:** *Execute install.packages*

At the highlighted question in *Figure 4* (at the bottom) it is best to answer no. Even though Dane said no to compilations, quite a lot of compilations happens for the `Boom` package:

![](/images/posts/sql_ml_install_r_pckgs_compile.png)

**Figure 5:** *C++ Compilation*

The installation process runs for quite a while, due to the compilation of the `Boom` package, but eventually, it finishes:

![](/images/posts/sql_ml_install_r_pckgs_success.png)

**Figure 6:** *Install Success*

Dane can now check and see if the `bsts` package has installed and he executes the code in *Code Snippet 3* to verify that `bsts` is indeed installed together with the dependent packages. To further confirm that the package exists and functions he can try to load it from *SSMS*:

```sql
EXEC sp_execute_external_script
                  @language = N'R' ,
                  @script = N'library("bsts")'
``` 
**Code Snippet 8:** *Loading the bsts Library*

Executing the code in *Code Snippet 8* results in:

![](/images/posts/sql_ml_install_r_pckgs_loading_bsts.png)

**Figure 7:** *Loading bsts*

From *Figure 7* it seems that everything has worked, sweet!

That is cool, no?! Well, there is one drawback with this: Dane has to have admin rights on the SQL Server box and, no offense Dane, but who in their right minds would give Dane those rights on a production SQL Server box!

Jokes aside, using an R packet manager may be too inconvenient, e.g. anytime a developer want to install packages, someone with admin rights on the box needs to install said packages. In coming posts we look at other options for installing packages.

## Summary

In this post we covered:

* When you install packages sometimes they require compilation. For that, **Rtools** should be on the box where SQL Server ML Services lives.
* There are multiple ways we can install packages:
    * R packet managers.
    * T-SQL.
    * RevoScaleR.
* An R packet manager is an R command line tool or GUI installed on the SQL Server Machine Learning Services machine that can run with elevated permissions and target the R engine for the instance on which you want to install the package. 
* SQL Server ML Services ships with two R packet manager: `Rterm.exe` and `Rgui.exe`.
* These two packet managers lives in `\\<path_to_SQL_Server_instance>\R_SERVICES\bin\x64`.
* When using a packet manager to install a package, you run the packet manager from an elevated command prompt.
* You can use the R command `install.packages` to install a package from the package manager.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright


[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[si2]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
[si3]: {{< relref "2017-04-13-microsoft-sql-server-r-services---internals-iii.markdown" >}}
[si4]: {{< relref "2017-04-23-microsoft-sql-server-r-services---internals-iv.markdown" >}}
[si5]: {{< relref "2017-05-01-microsoft-sql-server-r-services---internals-v.markdown" >}}
[si6]: {{< relref "2017-05-16-microsoft-sql-server-r-services---internals-vi.markdown" >}}
[si7]: {{< relref "2017-07-11-microsoft-sql-server-r-services---internals-vii.markdown" >}}
[si8]: {{< relref "2017-07-22-microsoft-sql-server-r-services---internals-viii.markdown" >}}
[si9]: {{< relref "2017-08-18-microsoft-sql-server-r-services---internals-ix.markdown" >}}
[si10]: {{< relref "2017-08-29-microsoft-sql-server-r-services---internals-x.markdown" >}}
[si11]: {{< relref "2017-10-20-microsoft-sql-server-r-services---internals-xi.markdown" >}}
[si12]: {{< relref "2017-10-31-microsoft-sql-server-r-services---internals-xii.markdown" >}}
[si13]: {{< relref "2017-11-11-microsoft-sql-server-r-services---internals-xiii.markdown" >}}
[si14]: {{< relref "2017-11-25-microsoft-sql-server-r-services---internals-xiv.markdown" >}}
[si15]: {{< relref "2017-12-02-microsoft-sql-server-r-services---internals-xv.markdown" >}}
[si16]: {{< relref "2017-12-24--microsoft-sql-server-r-services---internals-xvi.markdown" >}}
[si17]: {{< relref "2018-01-03-microsoft-sql-server-r-services---internals-xvii.markdown" >}}
[si18]: {{< relref "2018-01-10-microsoft-sql-server-r-services---internals-xviii.markdown" >}}
[si19]: {{< relref "2018-01-20-microsoft-sql-server-r-services---internals-xix.markdown" >}}
[si20]: {{< relref "2018-02-02-microsoft-sql-server-r-services---internals-xx.markdown" >}}
[sext1]: {{< relref "2018-03-07-microsoft-sql-server-r-services-sp_execute_external_script-I.markdown" >}}
[sext2]: {{< relref "2018-03-11-microsoft-sql-server-r-services---sp-execute-external-script---ii.markdown" >}}
[sext3]: {{< relref "2018-03-21-microsoft-sql-server-r-services---sp-execute-external-script---iii.markdown" >}}

[ctx1]: {{< relref "2018-05-20-sp-execute-external-script-and-sql-compute-context.markdown" >}}

[1]: https://www.linkedin.com/in/dane-bax/
[2]: https://www.microgaming.co.uk/
[3]: https://cran.r-project.org/bin/windows/Rtools/index.html
[4]: https://www.rdocumentation.org/packages/utils/versions/3.5.0/topics/install.packages

