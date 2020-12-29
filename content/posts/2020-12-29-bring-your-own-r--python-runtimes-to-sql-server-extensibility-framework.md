---
type: post
layout: "post"
title: Bring Your Own R & Python Runtimes to SQL Server Extensibility Framework
author: nielsb
date: 2020-12-29T12:47:45+02:00
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
  - R
  - Python
  - Java
  - SQL Server Extensibility Framework
  - SQL Server External Languages
description: We look at how you can bring your own R or Python runtime to SQL Server Machine Learning Services.
keywords:
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - R
  - Python
  - Java
  - SQL Server Extensibility Framework
  - SQL Server External Languages   
---

Back in the day I wrote quite a few blog posts about [**SQL Server Machine Learning Services**][1] as well as [**SQL Server Extensibility Framework**][2], and [**External Languages**][2]. **SQL Server Machine Learning Services** is very cool, but a complaint has been that you are restricted in what versions of R and Python you use.

In September 2020, Microsoft [announced][6] that they have open-sourced the technology behind SQL Server Extensibility Framework. As a result, we can now bring our own versions of R and Python to SQL Server 2019. 

> **NOTE:** To bring your own R/Python you need SQL Server 2019 CU3 or above.

In this blog post, we look at how to do that.

<!--more-->

## Background

In SQL Server 2016, Microsoft introduced SQL Server R Services. From inside SQL Server, that allowed you to call to the R engine via a special procedure, `sp_execute_external_script`, and execute R scripts.  

In SQL Server 2017, Microsoft added Python as an external language and renamed SQL Server R Services to SQL Server Machine Learning Services. As with R, you execute your Python scripts using `sp_execute_external_script`.

Both the R runtime and the Python runtime are part of the SQL Server install, but they run as an external process. The runtimes are based on the open-source versions, but they have some Microsoft proprietary additions. The communication between SQL Server and the external engine goes over the *Launchpad* service:

![](/images/posts/byor-r-and-p-launchpad1.png)

**Figure 1:** *External Script and Language*

We see in *Figure 1* how:

1. We execute the procedure `sp_execute_external_script`, notice the `@language` parameter.
1. That calls into the *Launchpad* service.
1. The *Launchpad* service passes the script into the relevant launcher based on the `@language` parameter in `sp_execute_external_script`. The knowledge of what launcher to call lives inside of the *Launchpad* service.
1. The launcher dll, a C++ dll, loads the relevant external engine and passes the script to the engine and executes.

If you want to know more about R and Python's implementation in SQL Server, I suggest you look at the link above about [**SQL Server Machine Learning Services**][1].

#### Java

In CTP 2.0 of SQL Server 2019, Microsoft made Java publicly available as an external language together with R and Python. Having Java as an external language may not seem that much different from R/Python, but there are some differences:

* Java is a compiled language, where we call into a specific method. R/Python are scripting languages where we send a script to the engine.
* R/Python are part of the SQL Server install, together with launcher dll's and so forth. There is an equivalent of a launcher dll for Java, (`javaextension.dll`), which calls into the JVM. The difference here between R/Python and Java is that the JVM is not part of the SQL Server install but must be installed separately.

Microsoft could have done with the Java integration in SQL Server 2019 to just treat it as R/Python, and "hardcode" Java as a language in the *Launchpad* service and let the *Launchpad* service call the `javaextension.dll`.  

However, Microsoft did not "hack" the *Launchpad* service, but what they did was, with the view to "properly" expose an extensibility framework with multiple external languages, that they introduced a new "host" for external languages: `ExtHost.exe`. The *Launchpad* service calls this host for all languages except the built-in R/Python:

![](/images/posts/byor-r-and-p-launchpad2.png)

**Figure 2:** *External Host*

In *Figure 2* we see how:

1. We execute the procedure `sp_execute_external_script`, with `Java` being the value of the `@language` parameter.
1. The proc calls into the *Launchpad* service as above.
1. Since the `@language` parameter is not `R` or `Python`, the *Launchpad* service call into `ExtHost.exe`.
1. The `ExtHost.exe` calls a well-known entry point in the language extension dll.
1. The language extension dll loads the external runtime and executes the code.

OK, the above does not seem that different from R/Python, but hang on a minute? With R and Python the *Launchpad* service knows about the launchers, (language extension dll's), what about step 4 above; how does the *ExternalHost* know which language extension to call?

#### External Language

The answer to the question above is `EXTERNAL LANGUAGE`. When Microsoft introduced Java, they also introduced the notion of an external language. The external language is the path, (or bytes), to a zip file containing the language extension dll. So in the case of Java, it is the path to the zip file where `javaextension.dll` is:

``` sql
CREATE EXTERNAL LANGUAGE Java
FROM (CONTENT = 'W:\javaextension.zip'
      , FILE_NAME = 'javaextension.dll');
GO
```
**Code Snippet 1:** *Creating External Language*

In *Code Snippet 1*, we set the file name in the `FILE_NAME` parameter because the zip file may contain multiple files and the file name defines the language extension. 

When Microsoft introduced external languages, they also introduced some new system catalog views:

* `sys.external_languages` - contains a row for each external language in the database.
* `sys.external_language_files` - contains a row for each external language extension file in the database.

You use the catalog views above to see what external languages exist in a database.

> **NOTE:** External languages are database scoped.

The [**External Languages**][2] link above has links to blog posts to get more information about external languages.

#### Recap

So to recap the *Background*:

* The R and Python runtimes have Microsoft specific additions, and they are installed together with SQL Server. The launchers are closed source C++ dll's.
* The Java language extension, ("launcher"), is closed source - but you are not tied to a Java version. Well, the version has to be 8+.
* When using Java, the language extension needs to be registered and tied to the language.

This was the "lie of the land" up until September this year, (2020).

## Open Source

When Java became a supported language in SQL Server 2019, Microsoft mentioned that communication between *ExternalHost* and the language extension should be based on an API, regardless of the external language. The API is the [Extensibility Framework API for SQL Server][9]. Having an API ensures simplicity and ease of use for the extension developer.

From the paragraph above, one can assume that Microsoft would like to see 3rd party development of language extensions. That assumption turned out to be accurate as, mentioned above, Microsoft open-sourced the [Java language extension][3], together with the [include files for the extension API][4], in September 2020! This means that anyone interested can now create a language extension for their own favorite language!

However, open sourcing the Java extension was not the only thing Microsoft did. They also created and open-sourced language extensions for R and Python! 

> **NOTE:** Microsoft did not open-source the R and Python launcher dll's, but they developed new extensions which do not require the Microsoft implementation of the R and Python runtimes.

So, if you are on SQL Server 2019 CU3+, you can now bring your own R and Python runtimes to SQL server. In the rest of this post, we look at bringing a Python runtime to SQL Server 2019.

> **NOTE:** In this post we bring our own Python runtime, but there is no difference if you want to install an R runtime instead.

## Pre-reqs

Before we dive into the "nitty-gritty", let's look at what you need in order to bring your own Python runtime to SQL server.

#### SQL Server 2019

Well, duh - that's quite obvious. However, don't forget you need to be on CU3 or above, (in this post I use CU4). Ensure that *Machine Learning Services and Language Extensions* are installed, (or part of the installation):

![](/images/posts/byor-r-and-p-install.png)

**Figure 3:** *Installation Machine Learning Services and Language Extensions*

As we will use our own Python runtime, we only check the *Machine Learning Services and Language Extensions* checkbox during installation or upgrade, as in *Figure 3*. That ensures that the *Launchpad* service and `ExtHost.exe` are installed.

> **NOTE:** If you already have installed the Microsoft R/Python runtimes the necessary, Microsoft proprietary, extensions are there. Also, you can run "your" R/Python runtime side by side with the Microsoft ones.

If this is a new installation of SQL Server you also need to enable the execution of external scripts:

```sql
EXEC sp_configure 'external scripts enabled', 1
RECONFIGURE WITH OVERRIDE;
```
**Code Snippet 2:** *Enable Execution of External Scripts*

As we see in *Code Snippet 2* we use `sp_configure` to enable external script execution.

When we use external languages; Java, etc., the languages are databased scoped. So the code we see in *Code Snippet 1* needs to be run in any database you want to use Java.

Let us create a database to use for our Python runtime:

```sql
USE Master;
GO

IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'ExtLangDB')
BEGIN
  DROP DATABASE 'ExtLangDB'
END
GO

CREATE DATABASE ExtLangDB;
GO
```
**Code Snippet 3:** *Creating Database*

After creating the database, as in *Code Snippet 3*, we can look at Python's base requirements.

#### Python

Another duh! But, let us talk about why we would like to use a different runtime. One reason could be using a more recent version of the runtime than the Microsoft provided runtime. I mentioned above that I am using SQL Server 2019 CU4 in this post. When I installed SQL Server, I chose to install the Microsoft provided runtimes for R and Python. I check the version like so:

``` sql
EXEC sp_execute_external_script
@language =N'Python',
@script=N'
import pandas as pd
import sys
df = pd.DataFrame(columns=["Version"])
ver = sys.version
df = df.append({"Version": ver}, ignore_index=True)
OutputDataSet = df'
WITH RESULT SETS (([Python Version] nvarchar(256)));
```
**Code Snippet 4:** *Version Check Python*

In *Code Snippet 4* I use Python's `sys.version` to get the version, and I add that to data frame. The data frame is then assigned to the return dataset represented by `OutputDataSet`. The result when we execute:

![](/images/posts/byor-r-and-p-python-version-l.png)

**Figure 4:** *Python Version*

The version of Python, as we see in *Figure 4* is 3.7.1. For some reason or another, I would like to use 3.7.9. So we need to ensure we have Python 3.7.9 [downloaded][6] and installed.

After you have installed Python install the `pandas` module, as it is not installed by default: `pip install pandas`.

## Python Language Extension

As mentioned above, the language extensions for Java, R, and Python are open-sourced, so you can download the source code and build them yourself. However, for now, we'll use [prebuilt binaries][7].

Browse to the Python language extension page, and download the version for your platform. For me, it is `python-lang-extension-windows.zip`.

> **NOTE:** On the page there are both release and debug versions of the extension. Use the release version in production!

Download to somewhere SQL Server has access to. In my case, I downloaded it to the root of my `w:\` drive.

When the extension is downloaded, it is time to register/install the extension.

## Installation

Before we register the extension, let us see what the zip file contains:

![](/images/posts/byor-r-and-p-python-pythonextension.png)

**Figure 5:** *Python Extension*

When I open the zip file I see it contains one file, `pythonextension.dll` - as in *Figure 5*. Knowing the file name is good as we need to supply that when we register the external extension, like in *Code Snippet 1*.

So, let's do it, let's register the Python extension in the database we created in *Code Snippet 3*:

```sql
USE ExtLangDB;
GO

CREATE EXTERNAL LANGUAGE p379
FROM (CONTENT = 'W:\python-lang-extension-windows.zip'
      , FILE_NAME = 'pythonextension.dll');
GO
```
**Code Snippet 5:** *Create Python Language*

In *Code Snippet 5* we see how I:

* name the language `p379`. I cannot name it Python, or R, as they are reserved for Microsoft R and Python.
* point to the path of the zip file.
* say what file in the zip file is the extension dll.

After I have executed the code I can check that it succeeded by: `SELECT * FROM sys.external_languages`:

![](/images/posts/byor-r-and-p-python-ext-langs.png)

**Figure 6:** *External Languages*

We can see from *Figure 6*, (outlined in red), that we succeeded in creating our own Python based external language. We also see R and Python as external languages. 

> **NOTE:** You see R and Python as external languages regardless if you have installed them or not. Even if you haven't ticked the box for *Machine Learning Services and Language Extensions* checkbox, you will see R and Python. 

Cool, let us execute the code in *Code Snippet 4*, and see what happens. Before we run the code, change the `@language` parameter to be `p379` instead of `Python`, and then execute.

Hmm, bummer we get a very un-informative error along the lines of:

![](/images/posts/byor-r-and-p-python-exec-error2.png)

**Figure 7:** *Error*

In *Figure 7* we see the error message with a result of `0x8004004`. The `HRESULT 0x8004004` is `E_ABORT`, which doesn't really tell us anything - I did say the error was not very informative.

So, it turns out that when installing Python, (as well as R), we need to do some extra steps so the *Launchpad* service and *ExtHost* can do its things.

#### Path & Permissions

When we execute `sp_execute_external_script` and after *ExternalHost* has loaded the python extension dll, the extension needs to know where Python is installed, so it looks for an environment variable named `PYTHONHOME`. So the first thing we need to do is to create that variable as a system variable:

![](/images/posts/byor-r-and-p-pythonhome.png)

**Figure 8:** *Create PYTHONHOME*

In *Figure 8*, we see how I set the value of `PYTHONHOME` to where Python is installed. The *Launchpad* service needs to read and write to the Python directory, so we need to set permissions for that:

```bash
icacls "%PYTHONHOME%" /grant "NT Service\MSSQLLAUNCHPAD$INST2":(OI)(CI)RX /T
```
**Code Snippet 6:** *Grant Permissions to Launchpad*

We need to run the code in *Code Snippet 6* from an elevated command prompt. It has to be command prompt, PowerShell will not work. Notice in *Code Snippet 6* how I define the instance with `$instance_name`. If you do this for the default instance the command is without `$instance_name`, like so: `icacls "%PYTHONHOME%" /grant "NT Service\MSSQLLAUNCHPAD":(OI)(CI)RX /T`.

Having granted read and execute access to the *Launchpad* service for the instance, we do the same for the `SID` `S-1-15-2-1`:

```bash
icacls "%PYTHONHOME%" /grant *S-1-15-2-1:(OI)(CI)RX /T
```
**Code Snippet 7:** *Grant Permissions to ALL APPLICATION PACKAGES*

The code, which needs to be run from an elevated command prompt,  in *Code Snippet 7* grants read and execute permissions to `ALL APPLICATION PACKAGES`. 

> **NOTE:** You can read more about `ALL APPLICATION PACKAGES`, and why we need it, [here][8].

After you have granted the necessary permissions, restart the *Launchpad* service, and rerun the code:

![](/images/posts/byor-r-and-p-python-version-2.png)

**Figure 9:** *Python 3.7.9*

Wohoo, as we see in *Figure 9*, it works! We are now using version 3.7.9 of Python! 

> **NOTE:** If you run the code on a Windows 10 20H2 version you may get an error along the lines of *The current Numpy installation (<path to numpy) fails to pass a sanity check due to a bug in the windows runtime*. As the error says, it is an issue with Windows and `Numpy`. The easiest way to fix it is to downgrade `Numpy` to version `1.19.3`. You do it like so: `pip install --upgrade numpy==1.19.3`.

We are almost ready for a summary, but one last thing.

#### Python Extension and Python Versions

Cool, so above we've seen how I can bring my own Python runtime, and in this case, it was 3.7.9. What about if I wanted a later version, let's say 3.9?

It so happens that I have Python 3.9.0 installed on my machine, so I:

* change `PYTHONHOME` to point to where 3.9 is.
* apply the necessary permissions for the *Launchpad* service and `ALL APPLICATION PACKAGES`.

However, when I execute the code as previous, I get the same error as in *Figure 7*. This is because the Python language extension is Python version-specific, and the release we use here is for Python 3.7.x. For other versions of Python (3.8, 3.9, etc.) you must modify and rebuild the Python Extension binaries. Look out for a future post around targeting different Python versions.

The R and Java extensions are not version specific.

## Summary

In this post, we discussed how Microsoft has open-sourced language extensions for R, Python and Java, which means we can bring our own R and Python runtimes. We mentioned how the language extensions are C++ dll's implementing the [Extensibility Framework API for SQL Server][9].

We looked at using a later version of Python, (3.7.9), than the Python version included in SQL Server Machine Learning Services. To use another version, after we have installed the version in question we:

* download the Python language extension.
* create a system environment variable `PYTHONHOME` pointing to the install directory of the version.
* assign read and write permissions for the SQL Server instance-specific *Launchpad* service, and the `ALL APPLICATION PACKAGES` group.
* create an external language using the `CREATE EXTERNAL LANGUAGE` syntax, with a unique name, (we cannot name it Python/R).

When we've done the above, we can execute using `sp_execute_external_script`. 

The Python differs from the R and Java extensions in that it is version-specific. The extension we have used here are tied to Python runtimes 3.7.x. For other Python version, we need to modify and rebuild. 

Oh, and if you want to bring your own version of R, you do it in the same was we did here with Python.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright


[1]: https://nielsberglund.com/categories/sql-server-machine-learning-services/
[2]: https://nielsberglund.com/categories/sql-server-extensibility-framework/
[3]: https://github.com/microsoft/sql-server-language-extensions/tree/master/language-extensions/java
[4]: https://github.com/microsoft/sql-server-language-extensions/tree/master/extension-host/include
[5]: https://www.python.org/ftp/python/3.7.9/python-3.7.9-amd64.exe
[6]: https://cloudblogs.microsoft.com/sqlserver/2020/09/24/open-sourcing-the-r-and-python-language-extensions-for-sql-server/
[7]: https://github.com/microsoft/sql-server-language-extensions/releases
[8]: https://docs.microsoft.com/en-us/sql/machine-learning/install/sql-server-machine-learning-services-2019?view=sql-server-ver15
[9]: https://docs.microsoft.com/en-us/sql/language-extensions/reference/extensibility-framework-api?view=sql-server-ver15
