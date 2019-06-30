---
type: post
layout: "post"
title: "Installing R Packages in SQL Server Machine Learning Services - IV: Permissions"
author: nielsb
date: 2019-04-21T11:15:19+02:00
comments: true
highlight: true
draft: false
categories:
  - SQL Server
  - Data Science
  - SQL Server Machine Learning Services  
tags:
  - SQL Server Machine Learning Services 
  - R
  - Python
  - CREATE EXTERNAL LIBRARY
description: "We look at permissions required when using CREATE EXTERNAL LIBRARY as well as ownership."
keywords:
  - SQL Server Machine Learning Services 
  - R
  - Python
  - CREATE EXTERNAL LIBRARY
---

This post is the fourth in a series about installing R packages in **SQL Server Machine Learning Services** (SQL Server ML Services). To see all posts in the series go to [**Install R Packages in SQL Server ML Services Series**](/sql_server_ml_services_install_packages).

Why this series came about is a colleague of mine [Dane][1] pinged me and asked if I had any advice as he had issues installing an R package into one of their SQL Server instances. I tried to help him and then thought it would make a good topic for a blog post. Of course, at that time I didn't think it would be more posts than one, but here we are.

In this post, we look at: 

* What permissions `CREATE EXTERNAL LIBRARY` requires.
* The ability to create external libraries with different owners and what impact it has.

<!--more-->

Let us do a recap to see where we are.

## Recap

In the last post; [Installing R Packages in SQL Server Machine Learning Services - III][pkg3] we looked at how to deploy R packages to SQL Server without having to have file system access to the machine SQL Server runs on. 

We achieve this by creating an external library, using a DDL statement `CREATE EXTERNAL LIBRARY`, on the database we want to use the R package on. What `CREATE EXTERNAL LIBRARY` does, is it uploads package files to a database from a file path or byte stream. The signature looks like so:

``` sql
CREATE EXTERNAL LIBRARY library_name  
[ AUTHORIZATION owner_name ]  
FROM (CONTENT = { <file_spec> }  
    [, PLATFORM = <platform> ]) 
WITH ( LANGUAGE = '<language>' )  
[ ; ] 
```
**Code Snippet 1:** *Signature CREATE EXTERNAL LIBRARY* 

The arguments we see in *Code Snippet 1* are:

* `library_name`: A unique name for the package. The unique:ness is based on the name and the principal id under which it is created. We look closer at that in this post.
* `owner_name`: This optional parameter specifies the name of the user or role that owns the external library. More about that later in this post as well.
* `file_spec`: The `file_spec` specifies the content of the package for a specific platform, and it can either be in the form of a file location (local path/network path) or a hex literal.
* `platform`: An optional parameter and right now only Windows is supported.
* `language`: Specifies the language of the package. In SQL Server 2017 the only supported language is R.

One of the examples we used throughout the post looked like this:

``` sql
CREATE EXTERNAL LIBRARY randomForest
FROM (CONTENT = 'W:\randomForest_4.6-14.zip') 
WITH (LANGUAGE = 'R'); 
```
**Code Snippet 2:** *Create External Library*

In *Code Snippet 2* we: 

* Name the external library `randomForest`.
* Indicate where the package file is (it has to be a zipped file).
* Set R as the language.

The code works fine, but the problem is that the package file has to be in a location where SQL Server can read the file, and this - most likely - requires access to the box where SQL Server is installed.

In the [previous post][pkg3] we discussed how we could create an external library from the hex-literal of the package, and we mentioned two different ways to accomplish this:

* From a local database.
* Generate binary from code.

#### Local Datbase

1. Create an external library from the R package based on the file path in a local SQL Server where we have access to the file system (like `localhost`). 
1. Get the binary representation from the `content` column in `sys.external_library_files` via some XML "magic".
1. Assign the retrieved value to the `CONTENT` parameter in `CREATE EXTERNAL LIBRARY`.
1. Execute `CREATE EXTERNAL LIBRARY`.

#### Generate from Code

1. Write script code which generates the binary representation.
1. Follow from step 3 above (local database).

Alternatively, you can connect to the database from inside the script and call `CREATE EXTERNAL LIBRARY` from the script. 

## Housekeeping

Before we "dive" into today's topics let us look at the code we use today. This section is here for those of who want to follow along in what we are doing in the post.

```sql
USE master;
GO

DROP DATABASE IF EXISTS DataScienceDB;
GO

IF EXISTS(SELECT 1 FROM sys.server_principals WHERE name = 'dane')
BEGIN
  DROP LOGIN dane;
END

CREATE LOGIN dane
WITH PASSWORD = 'password1234$';

IF EXISTS(SELECT 1 FROM sys.server_principals WHERE name = 'nielsb')
BEGIN
  DROP LOGIN nielsb;
END

CREATE LOGIN nielsb
WITH PASSWORD = 'password1234$';

CREATE DATABASE DataScienceDB;
GO

USE DataScienceDB;
GO

CREATE USER dane
FROM LOGIN dane;

CREATE USER nielsb
FROM LOGIN nielsb;

ALTER ROLE db_owner
  ADD MEMBER nielsb;
GO

USE master;
GO

GRANT EXECUTE ON sp_execute_external_script TO public;
GO

USE DataScienceDB;
GO

GRANT EXECUTE ANY EXTERNAL SCRIPT TO dane;
GRANT EXECUTE ANY EXTERNAL SCRIPT TO nielsb;
GO

USE DataScienceDB;
GO
```
**Code Snippet 3:** *Create Logins, Database and Users*

In *Code Snippet 3* we create some logins as well as a database and in that database users for the logins. As you see, we do continue with the "theme" of Dane the data scientist wanting to do "stuff" in the database. As `nielsb` is seen to be "trustworthy" (take that Dane), we add him to the `db_owner` role.

In the last part of *Code Snippet 3* we assign some permissions to `sp_execute_external_script`, as we did in the post [sp_execute_external_script and Permissions][perm].

Oh, and if you want to follow along, ensure you download the `randomForest` package from [here][3].

## Permissions

Let us look at what permissions we need when creating an external library. Here is what we do:

* Log on to SQL Server and the `DataScienceDB` database as `sa`.
* Drop the `randomForest` external library if you have created it: `DROP EXTERNAL LIBRARY randomForest`.
* Restart the *Launchpad* service, this is to clean up properly.

After we restart the *Launchpad* service we want to create an external library as the user `dane`:

``` sql
EXECUTE AS USER = 'dane';

CREATE EXTERNAL LIBRARY randomForest
FROM (CONTENT = 'W:\randomForest_4.6-14.zip') 
WITH (LANGUAGE = 'R');
```
**Code Snippet 4:** *Creating External Library as Dane*

In *Code Snippet 4* we see how we emulate being logged in as user `dane`: `EXECUTE AS USER = 'dane'` and how we then execute. Unfortunately, when we run the code we get an error:

![](/images/posts/sql_ml_install_r_pckgs4_perm_error1.png)

**Figure 1:** *Permission Error*

In *Figure 1* we see that `dane` does not have permission to `CREATE EXTERNAL LIBRARY`. We can fix that quickly:

``` sql
REVERT

GRANT CREATE EXTERNAL LIBRARY TO Dane;

EXECUTE AS USER = 'dane';

CREATE EXTERNAL LIBRARY randomForest
FROM (CONTENT = 'W:\randomForest_4.6-14.zip') 
WITH (LANGUAGE = 'R');
```
**Code Snippet 5:** *Grant Permissions*

In *Code Snippet 5* we:

* `REVERT` back from the `dane` user to `sa`.
* `GRANT` permissions to `dane` to create external libraries.
* Switch back to `dane`.
* Execute as `dane`.

However, when we execute as `dane` we get another error:

![](/images/posts/sql_ml_install_r_pckgs4_perm_error2.png)

**Figure 2:** *Impersonation Error*

We have moved past the permission error, as we in *Figure 2* see that we do not get the permission error, but we get another error, something about impersonation. What is this about, can it be related to what roles `dane` is in (remember he is only part of `PUBLIC`)? Let us test that theory, and let us use `nielsb` who is more trusted than `dane`, and is part of `db_owner`.

So what we do is we copy the code in *Code Snippet 5*, but replace `EXECUTE AS USER = 'dane'` with `EXECUTE AS USER = 'nielsb'`. The assumption is that being part of `db_owner` should fix this, but when `nielsb` executes he gets the same error as in *Figure 2*.

> **NOTE:** Notice that we did not have to give `nielsb` explicit permissions to create external libraries. He has those permissions implicitly just by being part of the `db_owner` role.

The problem we run into here is that even if you have the correct permissions to create an external library, you do not have the correct permissions to execute something that reads from the file system. So how do we solve this, we have two options:

1. Add the user to the `sysadmin` server role.
1. Create the external library from the package hex-literal.

Option 1 is quick and dirty, but I would not recommend it (`dane` as `sysadmin`???!!!). Option 2 is better and seeing that you most likely use hex-literal anyway when you deploy to a remote SQL Server it makes sense.

So if you want to follow along in this post, I recommend you go and read up on, in [Installing R Packages in SQL Server Machine Learning Services - III][pkg3], how to generate a hex literal from an R Package. We continue when you are back.

Welcome back! 

After having read the [post][pkg3] above we now have a hex-literal for the `randomForest` package. Let `dane` use that to create an external library from:

```sql
REVERT

EXECUTE AS USER = 'dane';

DECLARE @hexLit varbinary(max) = 
0x504B03040A00000000009982964C0000000000000000000000000D00000072...
4154494f4e95514d6f83300c3d0f89ff60e504520b1dbd4c953854d5a61dda1e...
...

CREATE EXTERNAL LIBRARY randomForest
FROM (CONTENT = @hexLit)
WITH (LANGUAGE = 'R');
GO

SELECT * FROM sys.external_libraries
```
**Code Snippet 6:**  *Create External Library from Hex Literal Variable*

In *Code Snippet 6* we see how we: 

* Emulate `dane`.
* Assign the hex-literal value to the variable. 
* Call `CREATE EXTERNAL LIBRARY`. 

All works OK, but the last `SELECT` does not return anything. Did we silently fail? Let us try to find out:

```sql
REVERT

SELECT * FROM sys.external_libraries
```
**Code Snippet 7:**  *Retrieving External Libraries as sa*

We see in *Code Snippet 7* how:

* We`REVERT` back to `sa.` 
* We do a `SELECT` against `sys.external_libraries`. 

When we run the code, the result is like so:

![](/images/posts/sql_ml_install_r_pckgs4_view_libs1.png)

**Figure 3:** *Result of Selecting as sa*

Aha, *Figure 3* shows us that `dane` managed to create the external library, cool! If we now want to drop the library, only `dane` can do that, and he needs to have `ALTER EXTERNAL LIBRARY` permissions. We discuss more why `dane` is the only one that can drop the library later in this post, together with why I have outlined three of the columns in *Figure 3*.

> **NOTE:** The reason `dane` does not get any results when he tries to `SELECT` against `sys.external_libraries` is because of a bug in SQL Server 2017. That particular bug is fixed in CU2, so it should not be an issue.

#### Permissions Summary

Let us do a quick summary of what we have discussed so far:

* To create an external library from a hex-literal you need to be part of the `db_owner` role, or have explicit `CREATE EXTERNAL LIBRARY` permissions.
* To create an external library from a file path you need to be part of the `sysadmin` server role.

## Authorization & Ownership

Now, when `dane` has created an external library let us just check that `dane` actually can use it:

```sql
REVERT

EXECUTE AS USER = 'dane';

EXEC sp_execute_external_script 
                    @language = N'R', 
                    @script = N'library("randomForest")'
```
**Code Snippet 8:** *Execute as dane Using External Library*

When we run the code in *Code Snippet 8* it all works! Let us now see what happens when `sa` tries to execute:

```sql
REVERT

EXEC sp_execute_external_script 
                    @language = N'R', 
                    @script = N'library("randomForest")'
```
**Code Snippet 9:** *Execute as sa Using External Library*

We see in *Code Snippet 9* how we `REVERT` back to `sa`, (as that was what we logged in as), and we then call `sp_execute_external_script`. However, when we execute, the result is:

![](/images/posts/sql_ml_install_r_pckgs4_exec_error1.png)

**Figure 4:** *Error When Executing as sa*

That is strange, the error we see in *Figure 4* says that the `randomForest` package does not exist, even though *Figure 3* shows it. The reason for this can be explained by looking at *Figure 3* more closely, and especially the three outlined columns: `principal_id`, `scope`, and `scope_desc`.

We see in *Figure 3* how the `principal_id` column, (outlined in red), has a value of 5, which happens to be the database principal id of `dane`. When you create an external library, and you do not specifically set a value for `owner_name` you become the owner. So what about the two columns outlined in yellow; `scope`, and `scope_desc`. They define who can use the library, and any library with an owner other than `dbo` is private, which means that only the owner can use it. So that explains, (from above), why only `dane` can drop the library.

So what about `nielsb`, he is part of the `db_owner` role, what happens when he creates an external library? Well, do what we did in *Code Snippet 6*, but replace `EXECUTE AS USER = 'dane'` with `EXECUTE AS USER = 'nielsb'`, and run the code. Since `nielsb` is part of `db_owner` the `SELECT` statement works and returns this:

![](/images/posts/sql_ml_install_r_pckgs4_view_libs2.png)

**Figure 5:** *Multiple Libraries - I*

We now have two `randomForest` libraries, as we see in *Figure 5*, and these two libraries have different owners as we see from the `principal_id` (5 for `dane`, and 6 for `nielsb`). They are both `PRIVATE` in scope, so only `dane` can use the external library with an id of 1, and `nielsb` only the library with an id of 2. If `sa` tried to run the code in *Code Snippet 9* it would fail as in *Figure 4*.

The above makes sense, kind of. The question is why the library `nielsb` created is `PRIVATE` as `nielsb` belongs to the `db_owner` role? The answer is what I wrote above, about not setting a value for `owner_name`. As `nielsb` did not indicate an owner name, he became the owner, and any libraries not owned by the `dbo` principal is always `PRIVATE`. However, seeing that `nielsb` is in the `db_owner` role, he can run some code like this:

``` sql
REVERT

EXECUTE AS USER = 'nielsb';

DECLARE @hexLit varbinary(max) = 
0x504B03040A00000000009982964C0000000000000000000000000D00000072...
4154494f4e95514d6f83300c3d0f89ff60e504520b1dbd4c953854d5a61dda1e...
...

CREATE EXTERNAL LIBRARY randomForest
AUTHORIZATION dbo
FROM (CONTENT = @hexLit)
WITH (LANGUAGE = 'R');
GO

SELECT * FROM sys.external_libraries
```
**Code Snippet 10:** *Create External Library with dbo as Owner*

In *Code Snippet 10* we see how we set the `owner_name` to `dbo`, and when we run the code the result of the `SELECT` is like so:

![](/images/posts/sql_ml_install_r_pckgs4_view_libs3.png)

**Figure 6:** *Multiple Libraries - II*

We see *Figure 6* 3 libraries and the last one has a `principal_id` of 1 (`dbo`), and the scope is `PUBLIC`. If you want to you can `REVERT` back to `sa` and execute the code in *Code Snippet 9*. This time it works, as one of the `randomForest` libraries are `PUBLIC`.

> **NOTE:** No, `dane` cannot set the `owner_name` to `dbo` as he does not have sufficient privileges, (he is not part of `db_owner`).

We have now three different libraries with the same name, how does the engine know what library to load, and from where? That is a good question, let us run some code we used in the [previous post][pkg3]:

```sql
EXEC sp_execute_external_script 
                    @language = N'R', 
                    @script = N'
                    OutputDataSet <- data.frame(
                    installed.packages()[,c("Package", "LibPath")]);'
WITH RESULT SETS ((Package nvarchar(255), LibPath nvarchar(2000)));
```
**Code Snippet 11:** *View R Packages*

The code in *Code Snippet 11* retrieves installed R packages, and if we run the code as `sa` we get the following result:

![](/images/posts/sql_ml_install_r_pckgs4_lib_path1.png)

**Figure 7:** *Randomforest Library Path for sa*

What is interesting in *Figure 7* is that we only see one `randomForest` library, whereas if we execute the same code as `dane` we see:

![](/images/posts/sql_ml_install_r_pckgs4_lib_path2.png)

**Figure 8:** *Randomforest Library Path for dane*

When we look at *Figure 8* we see two different library paths (where the package is) for the two `randomForest` packages. We see how they differ based on database id, (5 in both cases), and principal id, where the first one has a principal id of 5, (`dane`), and the second 1, (`dbo`). What we have seen here explains the error we saw in *Figure 4* when we tried to execute as `sa` - the package was not available to `sa`. We can also assume that packages load based on principal id, and the resolution logic and order is like so:

1. Load a package which matches on name and principal id.
1. Load a package which matches on name and is public.
1. Load a package which matches on name and is located in the default library path.

## Summary

In this post, we looked at permissions required when creating external libraries, and also ownership of the libraries.

To create an external library, you need to have explicit `CREATE EXTERNAL LIBRARY` permissions, or be - at least - part of the `db_owner` role. If you want to create a library based on a package path, instead of a hex-literal, you need to also to be in the `sysadmin` server role.

When you create an external library the library is owned by you, and can only be used by you - it is `PRIVATE`. However, if you set the `owner_name` to `dbo`, the library is `PUBLIC` and can be used by any user.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[1]: https://www.linkedin.com/in/dane-bax/
[2]: {{< relref "2019-03-17-sql-server-2019-java--external-libraries---ii.md" >}}
[3]: https://cran.r-project.org/bin/windows/contrib/3.6/randomForest_4.6-14.zip

[pkg1]: {{< relref "2018-06-23-installing-r-packages-in-sql-server-machine-learning-services---i.markdown" >}}
[pkg2]: {{< relref "2018-06-30-installing-r-packages-in-sql-server-machine-learning-services---ii.markdown" >}}

[perm]: {{< relref "2018-06-24-sp-execute-external-script-and-permissions.markdown" >}}
[pkg3]: {{< relref "2019-04-10-installing-r-packages-in-sql-server-machine-learning-services---iii.md" >}}
