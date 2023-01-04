---
layout: post
title: Installing R Packages in SQL Server Machine Learning Services - II
author: nielsb
date: 2018-06-30T16:57:01+02:00
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
  - RevoScaleR
  - rxInstallPackages
  - RegisterRext.exe
description: We continue looking at installing R packages. This post is all about using RevoScaleR functionality.
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - R
  - Python
  - RevoScaleR
  - rxInstallPackages 
  - RegisterRext.exe  
---

This post is the second post in a series about installing R packages in SQL Server Machine Learning Services.

To see all posts in the series go to [**Install R Packages in SQL Server ML Services Series**](/sql_server_ml_services_install_packages).

Why this series came about is a colleague of mine [Dane][1] pinged me and asked if I had any advice as he had issues installing an R package into one of their SQL Server instances. I tried to help him and then thought it would make a good topic for a blog post. Of course, at that time I didn't think it would be more posts than one, but here we are.

<!--more-->

## Recap

In [Installing R Packages in SQL Server Machine Learning Services - I][pkg1] we introduced [Dane][1] and how he wanted to install some R packages into SQL Server Machine Learning Service instance. I said that before you start installing packages into SQL Server Machine Learning Services, you should make sure you have **Rtools** installed on the machine SQL Server ML Services runs on.

You need *RTools* if you ever need to compile R packages from source, as *Rtools* contains compilers and utilities to do this. You do not install *Rtools* for each SQL Server ML Services instance you have on the server, but just once, and you need to install it from an account with elevated permissions.

In the first post I said that there were three ways to install packages into SQL Server ML Services:

* R packet managers
* T-SQL
* RevoScaleR

So in the first post, I covered R packet managers, where an R packet manager is an R command line tool or GUI installed on the SQL Server Machine Learning Services machine. The packet manager should be run with elevated permissions and target the R engine for the instance on which you want to install the package. The easiest is to use either of the R tools that come as part as part of SQL Server's R service:

* The command line tool: `Rterm.exe`.
* The GUI: `Rgui.exe`.

These two packet managers lives in the `\\<path_to_SQL_Server_instance>\R_SERVICES\bin\x64` directory. When you install packages via an R packet manager, they can only be installed to the default packet library for that instance. The file system folder for this library has restricted access and to write to this folder you need elevated permissions. Typical code for installing packages from a packet manager can look like so:

```r
# get the library path
libPath <- .libPaths()[1]
install.packages("pkg_name", lib = libPath, 
                  repos = "url_for_the_repo", 
                  dependencies = TRUE)
``` 
**Code Snippet 1:** *Install Packages Command*

In *Code Snippet 1* we see how I first retrieve the library path. The library path is where I install the package to, and once again - I can only install to the default instance directory. Then in the `install.packages` call I use these parameters:

* First parameter is always the name of the package(s) to install.
* `lib`: is for the library folder to install to.
* `repos`: the base URL(s) of the repositories to use. If left out, the repo used is the Microsoft MRAN repo, which may not be what you want.
* `dependencies`: indicating whether to also install missing packages which these packages depend on/link to/import/suggest (and so on recursively).

The big drawback with using an R packet manager is that the user who does it need to be able to run the chosen packet manager from an elevated prompt and from the box SQL Server is installed on! 

In this post, we look at how we can install without being admin, and without having to be logged onto the box as admin.

## Housekeeping

Before we "dive" into today's topics let us look at the code we use today. This section is here for those of who want to follow along in what we are doing in the post.

```sql
IF NOT EXISTS(SELECT 1 FROM sys.server_principals 
              WHERE name = 'dane')
BEGIN
  CREATE LOGIN dane
  WITH PASSWORD = 'password1234$';
END

IF NOT EXISTS(SELECT 1 FROM sys.server_principals 
              WHERE name = 'nielsb')
BEGIN
  CREATE LOGIN nielsb
  WITH PASSWORD = 'password1234$';
END

IF NOT EXISTS(SELECT 1 FROM sys.server_principals 
              WHERE name = 'user1')
BEGIN
  CREATE LOGIN user1
  WITH PASSWORD = 'password1234$';
END

IF NOT EXISTS(SELECT 1 FROM sys.server_principals 
              WHERE name = 'user2')
BEGIN
  CREATE LOGIN user2
  WITH PASSWORD = 'password1234$';
END

IF NOT EXISTS(SELECT 1 FROM sys.server_principals 
              WHERE name = 'user3')
BEGIN
  CREATE LOGIN user3
  WITH PASSWORD = 'password1234$';
END

DROP DATABASE IF EXISTS DataScienceDB;
GO

CREATE DATABASE DataScienceDB;
GO

USE DataScienceDB;
GO

CREATE USER dane
FROM LOGIN dane;

CREATE USER nielsb
FROM LOGIN nielsb;

CREATE USER user1
FROM LOGIN user1;

CREATE USER user2
FROM LOGIN user2;

CREATE USER user3
FROM LOGIN user3;
GO

ALTER ROLE db_owner
  ADD MEMBER nielsb;
GO
```
**Code Snippet 2:** *Create Logins, Database and Users*

In *Code Snippet 2* we create some logins as well as a database and in that database users for the logins. As you see, we do continue with the "theme" of Dane the data scientist wanting to do "stuff" in the database. As `nielsb` is seen to be "trustworthy" (take that Dane), we add him to the `db_owner` role.

## Permissions and sp_execute_external_script

This topic is not directly related to installing R packages via RevoScaleR, but unless you get the permissions right for users that want to call `sp_execute_external_script` (SPEES), the rest of the post will not make any sense anyhow. Fortunately I wrote a [blog post][perm] about *SPEES* and the permissions required, so let us follow what is in that post and set the permissions for the users we created in *Code Snippet 2*. The code below must be run by `sysadmin`:

```sql
-- the grant to execute SPEES to public only 
-- needs to be run once on the instance
USE master;
GO

GRANT EXECUTE ON sp_execute_external_script TO public;
GO

USE DataScienceDB;
GO

GRANT EXECUTE ANY EXTERNAL SCRIPT TO dane;
GRANT EXECUTE ANY EXTERNAL SCRIPT TO user1;
GRANT EXECUTE ANY EXTERNAL SCRIPT TO user2;
GRANT EXECUTE ANY EXTERNAL SCRIPT TO user3;
GO
```
**Code Snippet 3:** *Grant Execute Permissions to Users*

We see how the code in *Code Snippet 3* first, from within the `master` database, grants execution rights on *SPEES* to `public`. This only needs to be run once, and arguably this should be part of enabling *SPEES*.

We then switch over to the database where the users exist, and we grant the `EXECUTE ANY EXTERNAL SCRIPT` rights to the individual users that should be able to use *SPEES*. However, what about `nielsb`, should he not be granted the permission as well? No, as he is part of `db_owner` he automatically has the necessary permissions. 

## RevoScaleR Package Management

In the recap above I mentioned about being able to install from a remote box and not being an admin on the SQL Server box, and that is what RevoScaleR gives you. RevoScaleR 9.0.1 and later includes functions for R package management where these functions can be used by remote, non-administrators to install packages on SQL Server without direct access to the server. To install you can use both remote R clients as well as `sp_execute_external_script` from *SSMS*. To install using RevoScaleR functions you need to execute inside a **SQL Server Compute Context** (SQLCC). 

> **NOTE:** To read more about *SQLCC* look at the [sp_execute_external_script and SQL Compute Context - I][ctx1] post.

Remember from my [*SQLCC* post][ctx1] how we set up an *SQLCC*:

```r
# set up the connection string
sqlServerConnString <- "Driver=SQL Server;server=<instance>;
                        database=<the_db>;
                        uid=<the user id>;pwd=<the password>"

# set up a compute context
sqlCtx <- RxInSqlServer(connectionString = sqlServerConnString, 
                        numTasks = 1)
# set the compute context to be the sql context
rxSetComputeContext(sqlCtx)
```
**Code Snippet 4:** *R Code - SQL Server Compute Context*

In *Code Snippet 4* we see how we set up an *SQLCC* by defining a connection string which then implies that any R package installation is specific to a SQL Server instance as well as a database.

#### Configuration

Above I wrote that even non-admins could install R packages but that requires configuration and to use RevoScaleR you need to enable remote management of R packages both on the SQL Server instance as well as for a particular database. To enable, an admin on the SQL Server box uses a RevoScaleR command line utility: `RegisterRext.exe`. The same utility can also be used to disable package management on a database and/or instance level. 

The location for `RegisterRext.exe` is at: `<path_to_sql_instance>\R_SERVICES\library\RevoScaleR\rxLibs\x64\RegisterRext.exe` and when you run it you need to run it as admin. These are the available commands when executing:

* `/install` - copies the launcher binaries to the right location for a SQL server instance. Not applicable in this post.
* `/uninstall` - removes the launcher binaries from the SQL server instance. Not applicable in this post.
* `/installpkgmgmt` - installs package management support for given SQL server instance and database also if specified.
* `/uninstallpkgmgmt` - uninstalls package management support from given SQL server instance and database also if specified.
* `/installrts` - installs real time scoring support for given SQL server instance and database. Topic for a future post.
* `/uninstallrts` - uninstalls real time scoring support for given SQL server instance and database. Topic for a future post.

We send in parameters to tell RegisterRext where to execute:

* `/instance:value` is an optional parameter, we use `<value>` as the instance name, else the commands are performed on the default instance. Please note that the name is just that; not `/instance:server_name\instance_name` but `/instance:instance_name`. It took me a while to figure that out.
* `/database:value` is an optional parameter where `<value>` indicates what database to run on.  
* `/user:username` is an optional parameter, and we use the `<username`> specified to connect via the SQL authentication mode. Note that once this parameter is specified, `/password:<value>` is a required parameter.
* `/password: * | <password>` is a required parameter once the `/user` parameter is provided. You can use `/password:*` in order to be prompted for the password when running the tool instead of providing it in cleartext as a parameter. Note that providing the password without the user is ignored.

If no username and password is supplied, then Windows authentication is used (in the context of the user which is logged on to the SQL Server box and runs `RegisterRext.exe`).

Let us go back to [Dane][1] and his situation and see what we can do. Admin of the SQL Server instance Dane ~~plays on~~ works hard on has created a database for Dane with a lot of data where Dane now want to do data science "things". Part of the things Dane want to do requires packages that are not part of a SQL Server ML Services installation.

So the admin decides to enable Dane's database for remote package management. As this is the first time a database on the instance is enabled, the admin needs to enable the instance itself before the database.

To enable the instance a user with admin rights on the box, logs on and runs `RegisterRext.exe` from an elevated command prompt:

```bash
> RegisterRext.exe /installpkgmgmt
```
**Code Snippet 5:** *Enable Default Instance*

In *Code Snippet 5* we enable packet management on the default instance (as that is where Dane's database is), and we enable it using Windows Authentication. Regardless of type of authentication, the user has to have `VIEW SERVER STATE` permissions on the SQL Server instance. The output from *Code Snippet 5* is like so (edited for readability):

```bash 
>RegisterRExt /installpkgmgmt

Source directory to pick the RExtension binaries determined 
to be "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\
R_SERVICES\library\RevoScaleR\rxLibs\x64\".

Connecting to SQL server...

Sql server binn directory is 
"C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Binn".

Stopping service MSSQLLaunchpad...
Copied RLauncher.dll from C:\Program Files\Microsoft SQL Server\
MSSQL14.MSSQLSERVER\R_SERVICES\library\RevoScaleR\rxLibs\x64\ 
to C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Binn.

Installing SQL R services package management for instance ''

Installing version 1.0 artifacts

Creating package management account MSSQLSERVERPKG...

Saving package management user account configuration...

Working directory long path:'C:\Program Files\Microsoft SQL Server\
MSSQL14.MSSQLSERVER\MSSQL\ExtensibilityData' and short path:
'C:\PROGRA~1\MICROS~1\MSSQL1~1.MSS\MSSQL\EXTENS~1'.

Working directory long path:'C:\Program Files\Microsoft SQL Server\
MSSQL14.MSSQLSERVER\MSSQL\ExtensibilityData' and short path:
'C:\PROGRA~1\MICROS~1\MSSQL1~1.MSS\MSSQL\EXTENS~1'.

Working directory long path:'C:\Program Files\Microsoft SQL Server\
MSSQL14.MSSQLSERVER\MSSQL\ExtensibilityData' and short path:
'C:\PROGRA~1\MICROS~1\MSSQL1~1.MSS\MSSQL\EXTENS~1'.

Configuring security for folder C:\Program Files\Microsoft SQL Server\
MSSQL14.MSSQLSERVER\MSSQL\ExtensibilityData...

SQL R services package management installed successfully.

Starting service MSSQLLaunchpad...
```
**Code Snippet 6:** *Output Enable Instance*

A couple of interesting points from what we see in *Code Snippet 6*:

* The launchpad service is stopped when the install process starts and at the end restarted.
* The install process creates a new packet management account. This account appears together with the worker accounts in the *user accounts* pool that you find in the `ExtensibilityData` folder.

> **NOTE:** As the instance only is enabled once, this could potentially be part of when we enable an instance for external scripts.

Having enabled the instance, admin can now go ahead and enable the database:

```bash
> RegisterRext.exe /installpkgmgmt /database:DataScienceDB
```
**Code Snippet 7:** *Enable Database*

In *Code Snippet 7* we see how we enable packet management on the `DataScienceDB` database, once again using Windows Authentication. Whereas enabling an instance requires `VIEW SERVER STATE` permissions for the authenticated user, when enabling a database the user needs both `VIEW SERVER STATE` as well as being part of the `db_owner` database role. 

The output from *Code Snippet 7* is like so:

```bash
>RegisterRExt /installpkgmgmt /database:DataScienceDB

Source directory to pick the RExtension binaries determined 
to be "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\
R_SERVICES\library\RevoScaleR\rxLibs\x64\".

Connecting to SQL server...

Sql server binn directory is "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Binn".

Installing SQL R services package management for database 'DataScienceDB'

Installing version 1.0 artifacts

Working directory long path:'C:\Program Files\Microsoft SQL Server\
MSSQL14.MSSQLSERVER\MSSQL\ExtensibilityData' and short path:
'C:\PROGRA~1\MICROS~1\MSSQL1~1.MSS\MSSQL\EXTENS~1'.

Creating package management folder C:\Program Files\Microsoft SQL Server\
MSSQL14.MSSQLSERVER\MSSQL\ExtensibilityData\
rpkgs\4ecd5724-d180-47da-a8e0-01d6c1b9bd0f...

Creating package management table rpackages...

Creating package management role rpkgs-users...

Creating package management role rpkgs-private...

Creating package management role rpkgs-shared...

Creating package management stored procedures ...

Installing version 1.1 artifacts

Altering package management table rpackages to include attributes flags...

Creating package management stored procedures ...

SQL R services package management installed successfully for database 'DataScienceDB'
```
**Code Snippet 8:** *Output Enable Database*

As with the output from enabling an instance (*Code Snippet 6*) we see some interesting things in *Code Snippet 8* for when enabling a database, and we see how the process:

* Creates a table: `rpackages`.
* Creates roles.
* Creates stored procedures:

![](/images/posts/sql_ml_install_r_pckgs_procedures.png)

**Figure 1:** *Stored Procedures Created*

In *Figure 1* we see the procedures that the enabling process created. In a future post, we talk more about these procedures

## RevoScaleR Functions, Scopes & Roles

RevoScaleR exposes functions similar to CRAN R functions for package management:

* `rxSqlLibPaths`: Retrieves the path of the instance library on the remote server.
* `rxFindPackage`: retrieves the path for one or more packages on the remote SQL Server.
* `rxInstallPackages`: Install packages and their dependencies in an SQLCC from a remote client. You can specify which repo to install from or also install from locally saved zipped packages. 
* `rxInstalledPackages`:  Retrieves a list of packages installed in the specified compute context.
* `rxSyncPackages`:  Copy information about a package library between the file system and database.
* `rxRemovePackages`:  Removes packages from a specified compute context. It also removes dependencies if other packages on SQL Server no longer use them.

Back to our "hero" Dane. Admin has just told him that the SQL Server instance together with his database are now package management enabled, so he can begin to do his awesome "stuff". So what Dane first want to do is to see what packages are available to him in his database, and he does not really want to use *SSMS*, but instead use his R client of choice; Visual Studio together with **Microsoft R Client**:

![](/images/posts/sql_ml_install_r_pckgs_VS1.png)

**Figure 2:** *Visual Studio with Microsoft R Client*

In *Figure 2* we see how Dane's R project in Visual Studio targets  Microsoft R Client. Dane now wants to use the following code to see packages available on his database:

```r
> sqlCCConnString <- "Driver=SQL Server; server=<server_name>; 
                     database=daneb; uid=daneb; pwd=<danes_pwd>"
> sqlCC <- RxInSqlServer(connectionString = sqlCCConnString, numTasks = 1)
> rxSetComputeContext(sqlCC)
> sqlPackages <- rxInstalledPackages(computeContext = sqlCC)
> sqlPackages
```
**Code Snippet 9:**

In *Code Snippet 9* we see how Dane:

* Sets up a connection string pointing to his database for the SQLCC.
* Creates the SQLCC and sets it.
* Calls `rxInstalledPackages` to retrieve packages.

When Dane executes the code in *Code Snippet 9* it does not go as he wants - he gets an error at the `rxInstalledPackages` call:

```r
Error in rxCheckPackageManagementVersion
     (connectionString = computeContext@connectionString) : 
  The package management feature is not enabled for the current 
  user or not supported on SQL Server version 14.0.1000.169
```
**Code Snippet 10:** *Execution Error*

Hmm, the error we see in *Code Snippet 10* says something about "The package management feature is not enabled..."  What is this all about?

#### Scopes & Roles

The error above is related to what happened when we enabled the database. Remember how the process created roles in the database and the user that tries to execute some of the package management functions need to be in some of the roles unless the user is part of `db_owner`. In *Code Snippet 8* we see the roles, and there is a role named `rpkgs-users`. When I see that role, it seems like a good candidate for Dane to be part of, so I add Dane to the role:

```sql
ALTER ROLE [rpkgs-users] 
  ADD MEMBER dane;
```
**Code Snippet 11:** *Add Member to Role*

Notice in *Code Snippet 11* how I have to enclose the role name in brackets([]) as the name has a hyphen in it. When Dane now tries to execute the code:  

![](/images/posts/sql_ml_install_r_pckgs_scope_error.png)

**Figure 3:** *Error*
 
Ok, we seem to be a little bit further than before, and it seems we now can execute, but there is still an error, and it looks related to "scope", whatever that is.

Scopes has to do with installation of packages via the *SQLCC* and the usage of those packages. There are two scopes:

* Shared: shares packages with other users in the database. 
* Private: accessible only to the user installing the package.

Scope and the roles we see above are related in that the roles define what the user can do and in what scope:

* `rpkgs-users`: users in this role can use packages installed by users belonging to the `rpkgs-shared` role. Cannot read via the `rx...` functions.
* `rpkgs-private`: this role has all permissions as the `rpkgs-users` role has. A user in this role can furthermore, install, remove and use private packages installed by the user in question.
* `rpkgs-shared`: The same permissions as the `rpkgs-private` role. Users in this role can install, remove, and use shared packages.

So, let us now see what we can do with these roles:

```sql
ALTER ROLE [rpkgs-users] 
  ADD MEMBER user1;

ALTER ROLE [rpkgs-shared] 
  ADD MEMBER dane;

ALTER ROLE [rpkgs-shared] 
  ADD MEMBER user2;

ALTER ROLE [rpkgs-private] 
  ADD MEMBER user3;

```
**Code Snippet 12:** *Add Users to Roles*

After we have added users to various roles, let us see what happens when different users want to install packages.

## RevoScaleR Package Installation

In the following examples, I have chosen a package `abc` mostly due to it not having too many dependencies, which makes it quicker to install. The `abc` package contains tools for "Approximate Bayesian Computation" (ABC). 

Something to think about are the versions of *RevoScaleR* on your development box vs the version on the remote SQL Server. My, admittedly, limited investigations lead me to believe that the version on the local machine cannot be an earlier version than on the remote SQL Server. If the version is earlier on the local machine, you get permission errors. From what I can tell, the local version can be the same, or newer.

Ok, so to install packages we use `rxInstallPackagaes()`:

```r
rxInstallPackages(pkgs, skipMissing = FALSE, 
                  repos = getOption("repos"), 
                  verbose = getOption("verbose"), 
                  scope = "private", owner = '', 
                  computeContext = rxGetOption("computeContext"))
``` 
**Code Snippet 13:** *Signature rxInstallPackages*

Let us look at the parameters we see in *Code Snippet 13*:

**`pkgs`:**

String array of the packages you want to download and install. By default, it downloads the latest version of the package(s). When installing through an **SQLCC** the arrays can be .zip files as well as URL's, `http://` and `file://`. If the URL is a file, the location must be available to SQL Server.

**`skipMissing`:**

Boolean (`TRUE`, `FALSE`) indicating whether not to download dependent packages. The argument defaults to false.


**`repos`:**

String array of base URL's of repos to use. It defaults to the MRAN repo. If you want to install from local files `repos` has to be explicitly set to `NULL`. 

**`verbose`:**

Boolean (`TRUE`, `FALSE`) indicating whether to output progress during installation.

**`scope`:**

Related to what I said above about `scope`. The `scope` argument indicates whether to install packages, so they are available for other users on the database: `shared`, or only accessible to the user calling `rxInstallPackages`: `private`. The default value is `private`. To install to `shared` scope the user has to be in the `rpkgs-shared` or `db_owner` role.

**`owner`:**

A user in the `db_owner` role can install packages on behalf of other users, and set the `owner` parameter to a valid database user account.

**`computeContext`:**

The compute context to install under.

#### Install Already

Finally, we can talk about actually installing a package. Dane now wants to install the `abc` package:

```r
sqlCCConnString <- "Driver=SQL Server; 
                    server=192.168.57.3;
                    database=DataScienceDB; 
                    uid=dane; pwd=password1234$"
sqlCC <- RxInSqlServer(connectionString = sqlCCConnString, numTasks = 1)
rxSetComputeContext(sqlCC)
pkgs <- c("abc")
rxInstallPackages(pkgs = pkgs, verbose = TRUE, computeContext = sqlCC)
```
**Code Snippet 14:** *Install R Package*

In *Code Snippet 14* we see how Dane:

* Sets up the connection string for the *SQLCC*.
* Created the *SQLCC* and sets it.
* Defines the package(s): `pkgs <- c("abc")`.

When he calls `rxInstallPackages`, he follows the progress in the Visual Studio R interactive window:

![](/images/posts/sql_ml_install_r_pckgs2_install_progress.png)

**Figure 4:** *Installation Progress*

Dane sees in *Figure 4* how the various packages needed for `abc` downloads and subsequently installed. After a couple of minutes the installation is completed:

![](/images/posts/sql_ml_install_r_pckgs2_install_fiished.png)

**Figure 5:** *Installation Finished*

After the installation has finished, let us see how it works.

#### Usage

So in *Figure 5* we see that the installation finished successfully. Dane wants now to start using the new packages he installed in SQL Server, and for testing purposes, he uses the `abc.data` package (installed as a dependency of the `abc` package):

```sql
EXEC sp_execute_external_script 
         @language = N'R',
         @script = N'
                library("abc.data")
                data(human)
                OutputDataSet <-  data.frame(stat.voight)'
WITH RESULT SETS(([pi] float, [TajD.m] float, [TajD.v] float ))
```
**Code Snippet 15:** *Using R Package*

In *Code Snippet 15* it is assumed that Dane has logged in as himself and we see how Dane uses [`human`][2] which is a set of R objects containing observed data from three human populations. The call `data(human)`, loads in four R objects and Dane is interested in `stat.voight`, which is a data frame with 3 rows and 3 columns. The data frame contains the observed summary statistics for three human populations. In his code, Dane outputs the `stat.voight` data frame. However, when Dane executes the code, this happens:

![](/images/posts/sql_ml_install_r_pckgs2_error_exec1.png)

**Figure 6:** *Package does not Exist*

Hmm, what happened here? We know that Dane installed the package, so why does he get an exception that the package does not exist? The reason is that the package he installed is not installed in the R engine, but installed on the database and is not visible. To be able to use the package Dane needs to execute under the *SQLCC*. 

> **NOTE:** In future posts we talk more about where the packages are installed and how they get loaded etc.

So, how does Dane make the `abc.data` package execute in the *SQLCC*. Well, the `abc.data` package does not know about *SQLCC*, so Dane needs to use a RevoScaleR wrapper function: `rxExec`. The `rxExec` function allows distributed execution of a function, and the signature looks like so:

```r
rxExec(FUN,   ...  , elemArgs, elemType = "nodes", 
       oncePerElem = FALSE, timesToRun = -1L,
       packagesToLoad = NULL, execObjects = NULL, 
       taskChunkSize = NULL, quote = FALSE, 
       consoleOutput = NULL, autoCleanup = NULL, 
       continueOnFailure = TRUE, RNGseed = NULL, 
       RNGkind = NULL, foreachOpts = NULL)

```
**Code Snippet 16:** *Signature of rxExec*

In *Code Snippet 16* we see `rxExec`'s signature. In a future post we look at `rxExec` in more detail, but for now what interests us are the two first parameters:

* `FUN`: The function to execute.
* `...`: Arguments passed to the function (`FUN`).

The first parameter is the function we want `rxExec` to execute and the second parameter passes in the argument(s) the function requires. So, if we go back to what Dane wants to do, he re-writes his code like so:

```sql
EXEC sp_execute_external_script 
 @language = N'R',
 @script = N'
   # define a function to be passed to rxExec
   usePackageInRxFunction <- function()
   {
     library("abc.data")
     data(human)
     return(stat.voight)
   }
   # the "normal" SQLCC stuff
   sqlCCConnString <- "Driver=SQL Server; server=.; 
                       database=DataScienceDB; 
                       uid=dane; pwd=password1234$"
   sqlCC <- RxInSqlServer(connectionString = sqlCCConnString, 
                          numTasks = 1)
   rxSetComputeContext(sqlCC)

   ret <- rxExec(usePackageInRxFunction)
   OutputDataSet <- data.frame(ret)'
WITH RESULT SETS(([pi] float, [TajD.m] float, [TajD.v] float ))
```
**Code Snippet 17:** *Executing in SQLCC*

We see how Dane in *Code Snippet 17*:

* Creates a function `usePackageInRxFunction` where he does the `abc.data` related work. 
* Creates and sets up the *SQLCC*.
* Calls `rxExec` with `usePackageInRxFunction` as argument.
* Returns a data set.

When Dane executes the code the result is:

![](/images/posts/sql_ml_install_r_pckgs2_exec_success1.png)

**Figure 7:** *Success*

So, everything works fine, and Dane gets a result back. What happens if someone else wants to execute the same code, for example, `nielsb` who is in the `db_owner` role? The only thing `nielsb` changes is the `sqlCCConnString` parameter:

```sql
 sqlCCConnString <- "Driver=SQL Server; server=.; 
                       database=DataScienceDB; 
                       uid=nielsb; pwd=password1234$"
```
**Code Snippet 18:** *SQLCC Connectionstring for nielsb*

When `nielsb` executes the code in *Code Snippet 17* but with the `sqlCCConnString` parameter looking like in *Code Snippet 18* the outcome is:

![](/images/posts/sql_ml_install_r_pckgs2_error_exec2.png)

**Figure 7:** *No Package Exception*

Hmm, that is strange - we know Dane installed the package (and he just used it), so it has to exist. Dane is part of the `rpkgs-shared` role so he has permissions to create shared packages? The reason here is even though Dane was in `rpkgs-shared` role when he ran `rxInstallPackages` (*Code Snippet 14*) he did not define the scope for the package. Remember when we looked at the signature and the arguments for `rxInstallPackages` in *Code Snippet 13* we said that default value for the `scope` argument is `private` and that is how the package is installed regardless of what role Dane is in.

So to finish off, let `user2` who is in `rpkgs-shared` install the same packages in `shared` scope. Does that work, can you have the same packages installed multiple times? Yes, you can in that you can have the same packages installed in both `private` as well as `shared` scope. So `user2` executes this code:

```r
sqlCCConnString <- "Driver=SQL Server; 
                    server=192.168.57.3;
                    database=DataScienceDB; 
                    uid=user2; pwd=password1234$"
sqlCC <- RxInSqlServer(connectionString = sqlCCConnString, numTasks = 1)
rxSetComputeContext(sqlCC)
pkgs <- c("abc")
rxInstallPackages(pkgs = pkgs, verbose = TRUE, scope = "shared", computeContext = sqlCC)
```
**Code Snippet 19:** *Install R Package*

The only changes here in *Code Snippet 19* compared to the code in *Code Snippet 14* are the user id (`uid` -obviously), and `scope = "shared"` in the `rxInstallPackages` call. The `abc` package is now installed in `shared` scope, and anyone in any of the `rpkgs-...` roles can use the package.

## Summary

This turned out to be a much longer post than I thought it would be, and there are still topics related to RevoScaleR installation functionality that I want to cover, but that comes in future posts.

So, here is what we covered:

* To use RevoScaleR for package installation both the SQL Server instance as well as the database need to be enabled for package management. You enable package management via `RegisterRExt.exe` tool and the `/installpkgmgmt` option. There are additional flags for database enabling, authentication and so forth.
* When enabling the database the process creates a table, stored procedures and roles.
* For a user to be able to install packages he needs to have necessary permissions on `sp_execute_external_script1 as well as the `EXECUTE ANY EXTERNAL SCRIPT` permission. He also needs to be in a role which allows him to install packages.
* The roles that the enabling process creates are: `rpkgs-users`, `rpkgs-private` and `rpkgs-shared`.
* The roles which allows the user to install packages are `rpkgs-private` and `rpkgs-shared` (and `db_owner`).
* The roles define the scope of the installed packages: `private` and `shared`.
* When a user installs a package with `private` scope, only he can see and use the package.
* If the user installs a package with `shared` scope, all users in any of the roles, including `rpkgs-users` can use that package. The user needs to be in the `rpkgs-shared` (or `db_owner`) to install a `shared` package.
* You use the function `rxInstallPackages` to install a package, and the function needs to run in an *SQLCC*.
* When the user calls `rxInstallPackages` he needs to define which scope the package has through the `scope` argument. If the `scope` is not defined, it defaults to `private`.
* To use a package, either in `private` or `shared` scope, the code needs to run in *SQLCC*.
* For a package that has no knowledge about *SQLCC*, the functions in the package can be run via `rxExec`.

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
[2]: https://www.rdocumentation.org/packages/abc.data/versions/1.0/topics/human

[pkg1]: {{< relref "2018-06-23-installing-r-packages-in-sql-server-machine-learning-services---i.markdown" >}}
[perm]: {{< relref "2018-06-24-sp-execute-external-script-and-permissions.markdown" >}}
