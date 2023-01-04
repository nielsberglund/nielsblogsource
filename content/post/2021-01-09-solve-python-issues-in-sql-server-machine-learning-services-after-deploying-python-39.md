---
type: post
layout: "post"
title: Solve Python Issues in SQL Server Machine Learning Services After Deploying Python 3.9
author: nielsb
date: 2021-01-09T11:38:09+02:00
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
description: We look at how we can solve Python issues in SQL server after having deployed a new Python language. 
keywords:
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - Python
  - SQL Server Extensibility Framework   
---

In September 2020, Microsoft open-sourced SQL Server Machine Learning Services, (SQLMLS), language extensions for R and Python. If you want more information, here are some blog posts I have written about it:

* [**Bring Your Own R & Python Runtimes to SQL Server Extensibility Framework**][1]
* [**Write a Python 3.9 Language Extension for SQL Server Machine Learning Services**][3]

In the [last post][3], which looks at using Python 3.9 in SQL Server Machine Learning Services, I wrote this at the very end:

*It looks like all is good, but maybe not? In a future post we'll look at an issue we have introduced - but for now, let us bask in the glory of having created a new Python language extension.*

In the post, we wrote a new language extension to handle Python 3.9, and that just worked fine. However, when I was doing some other things, I noticed some side effects, and in this post, we look at those side effects and how to solve them.

> **NOTE:** The two posts mentioned above has been updated as a result of this post. If you now follow the posts above you may not see the errors we discuss here.

<!--more-->

## Pre-reqs

Before we dive in, let us look at the pre-reqs (if you want to follow along).

In this post, I am not going into detail about language extensions and external languages and such. If you are unsure about this, please read the posts linked to above.

#### Environment Variables

If you followed along in post about Python 3.9 and created the `PYTHONHOME` environment variable, please delete it. After you have deleted it restart the *Launchpad* service for the SQL Server instance where you run the code.

#### SQL Server

We need SQL Server CU3+ with *Machine Learning Services and Language Extensions* installed together with Python. Execution of external scripts needs to be enabled as well. You also need a database where to deploy the external languages to. In this post I use a database called `ExtLangDB`:

```sql
USE Master;
GO

DROP DATABASE IF EXISTS ExtLangDB;
GO

CREATE DATABASE ExtLangDB;
GO
```
**Code Snippet 1:** *Create Database*

Since in my previous posts I have used the same database name we see in *Code Snippet 1* we see how I drop the database if it exists before I create it. I do this to clear out any old "cruft" in the db.

> **NOTE:** Above I say *Machine Learning Services and Language Extensions* installed together with Python. I mean that, during the installation of SQL and when you tick the box for *Machine Learning Services and Language Extensions*, you also choose Python. I refer to this as *PythonSQLMLS* - Python for SQL Server Machine Learning Services, the "native" Python.

Let us make sure that everything looks OK in your database:

```sql
USE ExtLangDB;
GO

SELECT * FROM sys.EXTERNAL_LANGUAGES
```
**Code Snippet 2:** *Make Sure All is OK*

In *Code Snippet 2* we look for what external languages we have installed, and the result is like so:

![](/images/posts/fix-python-ext-langs.png)

**Figure 1:** *External Languages*

OK, so according to *Figure 1* all seems OK in the database. We have both R, and Python outlined in red, installed as part of *Machine Learning Services and Language Extensions*.

The last thing we want to do related to SQL Server is to install Python 3.7.9, and Python 3.9.1 on the SQL Server box. Both installations need `pandas`, and Python needs to be added to the `PATH`, (root directory, and `.\Scripts` directory). The Python installations need to be done with administrator permissions: "Run as administrator".

#### Language Extensions

We need the open-sourced Microsoft Python language extension, which you download from [here][4], (click on "Python language extension"). As I mentioned in [this post][1], it supports Python 3.7.x. In the rest of this post, I call it the *Python37* extension.

We also need an extension for Python 3.9. You can follow my post [here][3], and build it yourself. If you don't feel like building it, you can download the extension we built in the [post][3] in the previous sentence from [here](/downloads/fixpython/python-lang-extension-windows-3.9.zip). Going forward I call this extension *Python39*.

After downloading/building, place them in a location from where SQL Server can access them, and name them so you can see who is who.

## PythonSQLMLS

Let us make sure that the "native" Python, the one that comes as part of SQLMLS, (seen in *Figure 1*), works correctly in our database:

```sql
EXEC sp_execute_external_script
@language =N'Python',
@script=N'
import pandas as pd
import sys
df = pd.DataFrame(columns=["Version"])
ver = sys.version
pth = sys.executable
df = df.append({"Version": ver}, ignore_index=True)
OutputDataSet = df'
WITH RESULT SETS (([Python Version] nvarchar(256)));

```
**Code Snippet 3:** *Get Path & Executable*

The code we see in *Code Snippet 3* is the same as in the previous posts.

You see in *Code Snippet 3* how the `@language` parameter is set to `Python`. That indicates using the Python installed as part of *Machine Learning Services and Language Extensions* when we check the Python check-box, (*PythonSQLMLS*).

The result of running the code in *Code Snippet 3* is like so:

![](/images/posts/byor-r-and-p-python-version-l.png)

**Figure 2:** *Python SQLMLS*

We see in *Figure 2* how the SQLMLS Python is version 3.7.1.

## Python 3.7 as Language Extension

We did the same as above in the [Bring Your Own R & Python Runtimes to SQL Server Extensibility Framework][1], and we then continued with creating an external language from the [Microsoft Python language extension][4]:

```sql
USE ExtLangDB;
GO

CREATE EXTERNAL LANGUAGE p37
FROM (CONTENT = 'W:\python-lang-extension-windows-3.7.zip'
      , FILE_NAME = 'pythonextension.dll');
GO
```
**Code Snippet 4:** *Create Python 3.7 External Language*

In *Code Snippet 4* we see how:

* we create an external language with the name of `p37`. We cannot use `Python` as it is a reserved word.
* I renamed the Microsoft language extension to `python-lang-extension-windows-3.7.zip`.

We check that the creation of `p37` succeeded by executing the code in *Code Snippet 2*. In the result, we should now see `p37` in addition to what we see in *Figure 1*.

When we see that we indeed have a new external language we:

* create a system environment variable `PYTHONHOME` pointing to the Python 3.7 install directory on the SQL box (in my case `C:\Python37`). This is required as per the [Microsoft documentation][5]. We'll see later that this may not be required.
* assign read and write permissions to the *Launchpad* server for the SQL Server instance and `ALL APPLICATIONS GROUP`. The permissions are given to the root directory and underlying files and directories of `PYTHONHOME`, (read more about assigning permissions in [this post][1]).

Having created the `PYTHONHOME` variable, we restart the *Launchpad* service. We are now ready to execute the code in *Code Snippet 3*, but we need to change the `@language` parameter to `p37` instead of `Python`. 

The result we get back when executing the code should look like so:

![](/images/posts/byor-r-and-p-python-version-2.png)

**Figure 3:** *Python 3.7.9 External Language*

Yay, we see from *Figure 3* how we now execute against Python 3.7.9 instead of 3.7.1. So yes, we are executing against another Python runtime than *PythonSQLMLS*.

If you get an error when you execute the code and the error looks something like this: "A <your-language-name> script error occurred during execution of 'sp_execute_external_script' with HRESULT 0x80004004.", the most common causes for this are:

* Your Python installation is not on the `PATH`.
* Permissions have not been set on the Python directories and files.

Cool, we have now executed using a later version of the Python runtime than what is installed through SQLMLS. That's where we finished the [Bring Your Own R & Python Runtimes to SQL Server Extensibility Framework][1] post.

What we didn't do was to see what happens if we now want to run the code in *Code Snippet 3* and use *PythonSQLMLS*, (`@language=Python`):

![](/images/posts/fix-python-sqlmls-error1.png)

**Figure 4:** *Python Error - I*

This.Is.Not.Good! We get a `ModuleNotFoundError`, as in *Figure 4*, and the module we cannot find is `revoscalepy`, which one of the proprietary Microsoft Python modules. 

What we see here is one of the side effects I observed when doing my previous blog posts. We'll come back to this after looking at using the Python 3.9.1 runtime.

## Python 3.9 as Language Extension

In the [Write a Python 3.9 Language Extension for SQL Server Machine Learning Services][3] post we said that the Microsoft open-sourced language extension can only be used for Python 3.7.x. If we want to use another runtime, like 3.9.x, we need to re-compile the source code against the Python version we want to use. In the [post][3] we did that and saw how we executed against Python 3.9.1.

For Python 3.9.1, let us do what we did above with 3.7.9:

* create an external language. Let's call it `p39`, based on the extension for Python 3.9.1 I built, which is [here][].
* change/create the `PYTHONHOME` variable to point to the Python 3.9 installation.
* assign the necessary permissions against the root directory, subdirectories, and Python 3.9 installation files.
* restart the *Launchpad* service.
* change the @language parameter in *Code Snippet 3* to `@language=p39`.

When we run the code, we see:

![](/images/posts/py39-ext-exec-success.png)

**Figure 5:** *Python Version*

In *Figure 5* we see, as we did in the [Python 3.9 post][3], how we get back Python 3.9.1. We are running against the Python 3.9 runtime. Awesome!

What happens if we now change back and execute with `@language=Python`, or `@language=p37`:

```bash
STDERR message(s) from external script: 
Fatal Python error: init_sys_streams: can't initialize 
sys standard streams Traceback (most recent call last): 
File "C:\Python39\lib\io.py", line 54, in ImportError: 
cannot import name 'open_code' from 'io' (unknown location)
```
**Code Snippet 5:** *Python Error - II*

Once again - not good! As we see in *Code Snippet 5* we get a new error back saying something about not initialising something.

The question now is if this elated to Python in SQL Server only, or to Python in general on the SQL Server box?

## Python Stand-alone

As Python 3.9 seems to work, let us just confirm that. From command prompt we `cd` into the Python 3.9 installation. For me, it looks like: `cd C:\Python39`.

In there, we execute:

```bash
.\python.exe -c "import sys; print(sys.version);"
```
**Code Snippet 6:** *Execute Python 3.9 from Command Prompt"

In *Code Snippet 6* we see how we want to execute some Python code that prints out the Python version we execute. When we run the code, we get back the same we see in *Figure 5*. So that works.

What about Python 3.7? We do the same:

* `cd` into the Python 3.7 installation, (for me: `C:\Python37`).
* execute the code in *Code Snippet 6*.

Hmm, that - once again - does not look good:

![](/images/posts/fix-python-python37-error1.png )

**Figure 6:** *Python Error - III*

We see in *Figure 6* how we get exactly the same error as in *Code Snippet 5*. What is going on here?

## PYTHONHOME

A clue to the issue is highlighted in yellow in *Figure 6*: `File "C:\Python39\lib\io.py"`. We are executing against Python 3.7, but for some reason Python tries to touch a file in the Python 3.9 `lib` directory. Huh?

The culprit here is the `PYTHONHOME` system environment variable we created. We created it as the documentation around the Python language extension states it is required. 

The `PYTHONHOME` system environment variable is a well known variable to the Python engine. The variable changes the location of the standard Python libraries. In the example where the variable was set to Python 3.9 and we executed against the Python 3.7 executable, Python tried to load files from the 3.9 installation. Now we have a version mismatch, and that's why we got the error.

In the *PythonSQLMLS* example where the variable was set to Python 3.7, we still got an error, why is that? In this case, the *PythonSQLMLS* runtime tried to load a Microsoft specific module that does not exist in the "normal" Python 3.7 runtime. 

## Solution

How do we solve this? Well, above I say that the `PYTHONHOME` system environment variable is required. That is not entirely true. It is required if you want to create an external library for your language. If you only want to execute Python code, then you don't need it. Having Python on the `PATH` is required though in either case.

So to confirm that I am not lying, (too much), to you let's go ahead and:

* delete the `PYTHONHOME` system environment variable.
* restart the *Launchpad* service.

When we now execute the code in *Code Snippet 3* with the `@language` parameter being `Python`, `p37`, and `p39` respectively we see the expected result for all three executions!

But what do we do if we also want to create external libraries for for example Python 3.9, and at the same time in the database where we want to create the external library also need to execute *PythonSQLMLS* code?

In that case, we can not use `PYTHONHOME` as an environment variable, so we need to create a variable with a random name pointing to the Python extension.

Having done that we:

* go to the source code for the extension. 
* change the variable name in the method where it is used: `std::string PythonExtensionUtils::GetPathToPython()`. This is in the source file `PythonExtensionUtils_win.cpp`, (remember, I do this for SQL on Windows).
* recompile the extension, and redeploy.

In a future post, we will look more in detail at how to do this.

## Summary

This post came about as I saw strange errors after having deployed Python language extensions. Well, what I saw was that if I deployed a Python 3.7 extension, (*Python37*), I could not execute code with the "native" Python for SQL Server Machine Learning Services, (*PythonSQLMLS*). If I deployed an extension for Python 3.9, I could not execute code for either *PythonSQLMLS*, or *Python37*.

Based on the errors we received, we determined the issue was with the `PYTHONHOME` system environment variable. The official Microsoft documentation says this variable needs to be set for the Python extension. That requirement is only partially true, yes - it needs to be set if you want to create an external library for the language extension. However, if you just want to execute code, it is not needed.

> **NOTE:** Something that is not entirely clear in the official documentation is that the Python installation needs to be on the `PATH` in either case.

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
[2]: {{< relref "2021-01-03-build-boostpython--numpy-in-windows.md" >}}
[3]: {{< relref "2021-01-05-write-a-python-39-language-extension-for-sql-server-machine-learning-services.md" >}}
[4]: https://github.com/microsoft/sql-server-language-extensions/releases
[5]: https://docs.microsoft.com/en-us/sql/machine-learning/install/custom-runtime-python
