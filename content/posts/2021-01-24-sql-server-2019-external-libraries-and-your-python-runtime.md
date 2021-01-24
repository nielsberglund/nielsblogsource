---
type: post
layout: "post"
title: "SQL Server 2019 External Libraries and Your Python Runtime"
author: nielsb
date: 2021-01-24T06:06:25+02:00
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
  - SQL Server External Language
description: We look at how we can create external libraries for our Python external language.
keywords:
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - Python
  - SQL Server Extensibility Framework
  - SQL Server External Language  
---

The last month or so I have written some blog posts about how Microsoft open-sourced the SQL Server language extensions for R and Python back in September 2020. These language extensions add to the Java extension which was open-sourced in March 2020. My posts have been about bringing your own Python runtime into SQL Server 2019, and the potential pitfalls you may encounter:

* [**Bring Your Own R & Python Runtimes to SQL Server Extensibility Framework**][1]
* [**Write a Python 3.9 Language Extension for SQL Server Machine Learning Services**][2]
* [**Solve Python Issues in SQL Server Machine Learning Services After Deploying Python 3.9**][3]

I have touched upon the subject of the `PYTHONHOME` environment variable in the posts, and I have said that it is not needed - **UNLESS** you want to create Python external libraries.

In this post, we look more at `PYTHONHOME` and creating external libraries.

<!--more-->

## Pre-reqs

I will not list the pre-reqs here, as all the other posts list them.

I just want to mention something important about installing Python on the SQL Server box:

* run the Python installation as Administrator.
* install Python for all users.

The reason for mentioning this is that you may get some strange errors when executing if you do not do that.

## Demo Code

The starting point for this post is that we have a Python external language created as per:

* the end of the [**Bring Your Own R & Python Runtimes to SQL Server Extensibility Framework**][1], in which case it is Python 3.7.
* or the Python externa language is based on the [**Write a Python 3.9 Language Extension for SQL Server Machine Learning Services**][2] post, where the language is Python 3.9.

Furthermore, the expectation is that the language has been created without the `PYTHONHOME` system environment variable. In this post, I am running against the extension built in the [Python 3.9 post][2].

As in the other posts, I have created the `ExtLangDB` database. This is the database the external language above is created in. I also use the "built-in" Python in SQL Server Machine Learning Services in this database.  

Now is a good time to see that everything is set up correctly. To do that we use the same code as in the other posts:

```sql
EXEC sp_execute_external_script
@language =N'<lang>',
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
**Code Snippet 1:** *Test Code*

Run the code in *Code Snippet 1*, and replace the `<lang>` placeholder first with `Python`, and then with the name you gave the external Python language. In my case, it is `p39`. Both times you run the code, all should work fine.

## Installing Packages/Modules

In R and Python, you install packages/modules typically by being on the machine in question and executing R/Python code:

```bash
# R
install.packages("<some-package>")

# Python
python.exe -m pip install <some-module>
```
**Code Snippet 2:** *Install Packages/Modules*

In *Code Snippet 2*, we see one way to install an R package and a Python module. 

What about doing if for SQL Server? Sure you can do it that way. However, you would need access to the SQL Server box, and those "pesky" administrators may not want to give you access to the box the production SQL Server sits on. What could possibly go wrong?!

So, apart from being on the actual SQL Server box itself, we can install packages by connecting to SQL Server from a remote machine and execute. The different ways are:

* RevoScale: a Microsoft proprietary technology for the Microsoft R and Python SQL Server Machine Learning services. It is exposed via `RevoScaleR` for R and `RevoScalePy` for Python. Back in 2018, I wrote about using RevoScaleR for R package installation in the post [**Installing R Packages in SQL Server Machine Learning Services - II**][5]. You execute using an R or Python client.
* [`sqlmlutils`][4]: a package which helps you execute R/Python code in SQL Server from any R/Python client.
* [`CREATE EXTERNAL LIBRARY`][6]: this installs an R package or a Python module using T-SQL DDL statements. 

The ability to using `CREATE EXTERNAL LIBRARY` for Python was introduced in SQL Server 2019.

## External Libraries

An external library is a package, module, jar file deployed to a specific database using the `CREATE EXTERNAL LIBRARY` DDL statement. The library is stored in the database and the system DMV `sys.external_libraries` exposes the installed libraries. The signature for the statement looks like so:

``` sql
CREATE EXTERNAL LIBRARY library_name  
[ AUTHORIZATION owner_name ]  
FROM (CONTENT = { <file_spec> }  
    [, PLATFORM = <platform> ]) 
WITH ( LANGUAGE = '<language>' )  
[ ; ] 
```
**Code Snippet 3:** *Signature CREATE EXTERNAL LIBARY*

The arguments we see in *Code Snippet 3* are:

* `library_name`: A unique name for the package. When I say the package name has to be unique, the unique:ness is based on the name and the principal id under which it is created.
* `owner_name`: This optional parameter specifies the name of the user or role that owns the external library.
* `file_spec`: The `file_spec` specifies the package's content for a specific platform, and it can either be in the form of a file location (local path/network path) or a hex literal. If `file_spec` is a path, then the path needs to be readable by SQL Server. For R/Python and any languages created from the R/Python language extensions, the package/module needs to be inside a zipped archive file.
* `platform`: The `PLATFORM` parameter, which defines the platform for the content of the library. The `PLATFORM` parameter defaults to the platform SQL Server runs on, (Windows or Linux).
* `language`: Specifies the language of the package. This is either R or Python for the SQL Server machine learning languages or the name you created your external language as.

Let us see how this works. What we will do is download a Python package that we want to create as an external library. The package is `text-tools`.

#### text-tools

The `text-tools` package contains various tools for manipulating text. To use it, we download the `.whl` file from [here][7]. After downloading the package, we need to put it into a zipped archive file. My zipped file is named `text_tools-1.0.0-py3-none-any.zip`. As we want to install from a file path the zip file needs to be placed in a location where SQL Server can read it.

#### Installation

Before we do any installation, let's check what external libraries we have in the database already:

```sql
USE ExtLangDB
GO

SELECT * FROM sys.external_libraries
```
**Code Snippet 4:** *Retrieve External Libraries*

When I run the code in *Code Snippet 4* I am not getting any results back as `ExtLangDB` is a newly created database.

OK then, let's get on with it. We first want to install the `text-tools` package for the SQL Server Machine Learning Services Python:

``` sql
CREATE EXTERNAL LIBRARY text_tools
FROM (CONTENT = 'W:\text_tools-1.0.0-py3-none-any.zip')
WITH (LANGUAGE = 'Python');
```
**Code Snippet 5:** *Create text-tools for Python*

In *Code Snippet 5* we see how I:

* give the library the name of `text_tools`.

> **NOTE:** When you create the external library for SQL Server Machine Learning Services Python, the name must match the module name you use in your Python script. When you create the library for your "own" Python, the name does not matter.

* indicate that this library is for the "built-in" Python, (`LANGUAGE=Python`).

After I execute the code in *Code Snippet 5* I run the code in *Code Snippet 4*, and now I get:

![](/images/posts/ext-lib-py-external-library-python.png)

**Figure 1:** *Python External Library*

As we see in *Figure 1* we now have an external library for Python. The question is now if we can use it, and to do that we will use a method in `text-tools` called `find_best_string`. The method finds the best matching string in a larger string. It returns either the first match or all matches, and their match value:

``` sql
EXEC sp_execute_external_script
@language =N'Python',
@script=N'

from text_tools.finders import find_best_string

corpus = "is simply dummy text of the printing and typesetting 
industry. Lorem Ipsum has been the industry''s standard dummy 
text ever since the 1500s."

query = "Ipsum"

first_match = find_best_string(query, corpus, flex = 2)

print(first_match)
'
```
**Code Snippet 6:** *Execute using Python*

In *Code Snippet 6* we see how we:

* import `find_best_string` from `text_tools.finders`.
* set the variable `corpus` to be the string we want to search for.
* set `query` to the string we look for.

We then call the method with the `query`, and `corpus` as parameters, and the result looks like so:

![](/images/posts/ext-lib-py-find-best-string-1.png)

**Figure 2:** *Result*

In *Figure 2* (outlined in red), we see that we get back the string that matches the best and the match value, cool!

Now, what if we do this using "our own" Python. When I say "our own" I refer to the Python external language mentioned in the *Demo Code* section above.

I mentioned above how I use Python 3.9 as the external language. If you remember from the [Write a Python 3.9 Language Extension ...][2], I recompiled the language extension source code against Python 3.9, and then created the language as so:

```sql
USE ExtLangDB;
GO

CREATE EXTERNAL LANGUAGE p39
FROM (CONTENT = 'W:\python-lang-extension.zip'
      , FILE_NAME = 'pythonextension.dll');
GO
```
**Code Snippet 7:** *Create External Language*

We see in *Code Snippet 7* how I created the language and gave it the name `p39`. We ensure all works OK by changing the `@language` parameter in *Code Snippet 1* to `@language=p39` and then execute. Yes, it works just fine. To ensure that we have not caused any "drama" with SQL Server Machine Learning Services Python, we can change back the language to `Python` and execute. This works fine as well.

As the above worked, let us now create the `text-tools` package as an external library for our newly created language: `p39`:

``` sql
CREATE EXTERNAL LIBRARY text_tools_p39
FROM (CONTENT = 'W:\text_tools-1.0.0-py3-none-any.zip')
WITH (LANGUAGE = 'p39');
```
**Code Snippet 8:** *Create text-tools for p39*

The code we see in *Code Snippet 8* looks the same as what we see in *Code Snippet 5*, except for:

* the name is now just a string. If I try to name it as in *Code Snippet 5* I get an error saying there is already an external library with that name and the same owner. As mentioned above, for external languages, we can give the library an arbitrary name.
* the `LANGUAGE` parameter points to the language we created in `Code Snippet 7`.

After we run the code in *Code Snippet 8* we check that all is OK by executing `SELECT * FROM sys.external_libraries`:

![](/images/posts/ext-lib-py-external-library-py39.png)

**Figure 3:** *External Libraries*

It seems that we succeeded in creating the external library as we see, outlined in red, in *Figure 3* the library we just created. Right, so let's run the code in *Code Snippet 6*, but use `@language=p39` instead, and watch the awesomeness:

![](/images/posts/ext-lib-py-pyhome-error.png)

**Figure 4:** *PYTHONHOME Error*

Eish, the awesomeness turned out to be not so awesome after all. We got a big fat error as in *Figure 4*. OK, I suppose that if you have read the previous posts, this error might not be that unexpected. This as I wrote about how the `PYTHONHOME` environment variable is not needed **UNLESS** you create an external library.

> **NOTE:** Eish is South African slang, and it can express anything from excitement to horror.

Oh, you may wonder why we could create the external library, as in *Code Snippet 8*, but when we tried to run it we failed? The short answer is to think about creating external libraries like you create stored procedures. When you run `CREATE PROCEDURE` the procedure is "registered", it is not until you execute against it, it is being "compiled". The same thing is true for external libraries. We will talk about external libraries in more detail and explain what happened here in a future post.

Another question that may "pop up" is why we could execute using the "built-in" Python language without having `PYTHONHOME` set? The short answer is that I have no clue. I assume it has to do with the tight integration between Python and SQL Server.

## The Fix

I see `PYTHONHOME` as "the gift that keeps giving", but not in a good way! Let us see what we can do to fix this.

#### Set the Environment Variable

One way to fix this would be to set the `PYTHONHOME` system environment variable. We create a new system environment variable, we name it `PYTHONHOME`, and we set the variable value to the Python directory:

![](/images/posts/byor-r-and-p-pythonhome.png)

**Figure 5:** *PYTHONHOME Environment Variable*

The figure above is from a previous post, where I created `PYTHONHOME` to point to my Python 3.7 installation. In my case with Python 3.9, I point it to my Python 3.9 installation: `C:\Python39`. Having done that, I restart the *Launchpad* service and execute the code again:

``` bash
STDOUT message(s) from external script: Processing c:\program files
\microsoft sql server\mssql15.inst2\mssql\externallibraries\5\65538
\1\tmp\text_tools-1.0.0-py3-none-any.whl 
Installing collected packages: text-tools 
Successfully installed text-tools-1.0.0

STDOUT message(s) from external script: ('ipsum', 1.0)
```
**Code Snippet 9:** *Result*

The output from running the code looks something like what we see in *Code Snippet 9*:

* first something about where it is installed from. Subsequent executions of the code will not show this.
* then the result. The result matches what we see in *Figure 2*.

That's cool - we can use our external library. However, if we now went back and executed any code, for example, what we see in *Code Snippet 1*, using `@language=Python` we would fail. We discussed why in the [**Solve Python Issues in SQL Server Machine Learning Services After Deploying Python 3.9**][3] post. 

After we have executed against the external library for the first time, one potential solution is to remove the `PYTHONHOME` environment variable and restart the *Launchpad* service. That works but is not very practical or sustainable. So we need something else.

#### Source Code Change

As we were getting an error about not finding the environment variable, (*Figure 5*), we can assume that something in the source code is looking for that particular variable. 

In the [Write a Python 3.9 Language Extension ...][2] post, we cloned the GitHub library with the Python language extension source code. Then we recompiled the code to cater for Python 3.9, and that is the language extension used in this post. Having the source code, we can look for where the variable is used and change the name.

If we search for `PYTHONHOME` in the source code we find it in the method `PythonExtensionUtils::GetPathToPython()` in the source file `PythonExtensionUtils_win.cpp`:

![](/images/posts/ext-lib-py-get-pyhome.png)

**Figure 6:** *PYTHONHOME Error*

The code in *Figure 6* looks up the environment variable, and we see the variable name outlined in red. We can change that name to something arbitrarily, `PYTHONHOME39` for example and:

* recompile the code.
* delete the `PYTHONHOME` variable.
* create a new system environment variable named as per what we changed it to in the code.
* restart the *Launchpad* service.
* drop the external library.
* drop the language.
* create the language again based on the recompiled dll.
* create the library.

When we execute the code after doing the above steps, we get the result as we see in *Code Snippet 9*, **AND** we can also execute any code using the `Python` language with no errors. Win!

To change the source code works, but it may be too convoluted - especially if you are not a C++ developer. So let us look at another option.

#### CREATE EXTERNAL LANGUAGE

In *Code Snippet 7* we see how we create the external language, and we have used similar code in the previous posts. It turns out that in the `FROM(...)` clause, we can have a couple of more parameters other than `CONTENT` and `FILE_NAME`. One of those parameters is `ENVIRONMENT_VARIABLES`. The `ENVIRONMENT_VARIABLES` parameter allows us to provide a set of environment variables to the external language runtime. If we do this, the environment variable is not in global scope, but bound to that particular language, in that specific database:

``` sql
USE ExtLangDB;
GO

ALTER EXTERNAL LANGUAGE p39
SET 
(
  CONTENT = 'W:\python-lang-extension.zip'
  , FILE_NAME = 'pythonextension.dll'
  , ENVIRONMENT_VARIABLES = N'{"PYTHONHOME":"C:\\Python39"}'
);
GO
```
**Code Snippet 10:** *Alter the External Language*

Instead of doing a `CREATE EXTERNAL LANGUAGE` and having to drop the external library and the language, we can `ALTER` the language as in *Code Snippet 10*. The assumption before we run the code above is that we are back to where we are at *Figure 4*. We have:

* created the language as in *Code Snippet 7*.
* created the external library, (*Code Snippet 8*).
* executed the code and received the error as in *Figure 4*.

With the above requirements met, we can now run the code in *Code Snippet 10*. After running the code, we execute the code in *Code Snippet 6* with the `@language` parameter set to `p39`. And it works! Furthermore, executing with the `@language` set to `Python` also works!

## Summary

To create external libraries for external languages, not the "built-in" Python, the `PYTHONHOME` systems environment variable needs to be set. Having that variable set causes issues for both the "built-in" Python and other Python external languages based on earlier/later versions of Python other than the version we created the external library for.

In this post we looked at how we can work around that problem, and we saw following options:

* create the environment variable but delete it after the first execution of code using the external library. Not practical, nor sustainable.
* create a new environment variable with a different name. Change the source code where the variable name is defined to use the new name, and recompile it.
* define the variable using the `ENVIRONMENT_VARIABLES` in `CREATE/EDIT EXTERNAL LANGUAGE`. 

Of the three options above, the last seems to be the most practical and least invasive.

Finally, as mentioned previously in the post, a future post or posts will look into how creating external libraries work for external languages.

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
[2]: {{< relref "2021-01-05-write-a-python-39-language-extension-for-sql-server-machine-learning-services.md" >}}
[3]: {{< relref "2021-01-09-solve-python-issues-in-sql-server-machine-learning-services-after-deploying-python-39.md" >}}
[4]: https://docs.microsoft.com/en-us/sql/machine-learning/package-management/install-additional-python-packages-on-sql-server?view=sql-server-ver15
[5]: {{< relref "2018-06-30-installing-r-packages-in-sql-server-machine-learning-services---ii.markdown" >}}
[6]: https://docs.microsoft.com/en-us/sql/t-sql/statements/create-external-library-transact-sql?view=sql-server-ver15
[7]: https://pypi.org/project/text-tools/#files
