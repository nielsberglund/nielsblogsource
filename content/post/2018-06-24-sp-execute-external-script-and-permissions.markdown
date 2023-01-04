---
layout: post
title: sp_execute_external_script and Permissions
author: nielsb
date: 2018-06-24T14:36:36+02:00
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
  - sp_execute_external_script
  - SQL Server Permissions
description: We look at what permissions a non-admin user needs to execute sp_execute_external_script
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - R
  - Python
  - sp_execute_external_script
  - SQL Server Permissions   
---

This post will (hopefully) be short and sweet. It came about as I was testing out "stuff" for the [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) series of posts and I could not get it to work as I had expected. 

<!--more-->

## Background

Usually, when I work with **SQL Server Machine Learning Services**, I execute code in the context of admin (yeah I know, do not do that :)). In the [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) series I used non-admin accounts, and all of a sudden nothing worked.

I tried to research (read Google) the issue, but I could not find a definitive answer, just tidbits here and there. So when I finally realised what the issues were, I decided to write a blog post about it.

## Housekeeping

As in quite a few of my other blog posts, here follows some code to set things up if you want to follow along.

#### Code

This is the code to "set the scene":

```sql
IF NOT EXISTS(SELECT 1 FROM sys.server_principals 
              WHERE name = 'user1')
BEGIN
  CREATE LOGIN user1
  WITH PASSWORD = 'password1234$';
END

DROP DATABASE IF EXISTS PermissionDB;
GO

CREATE DATABASE PermissionDB;
GO

USE PermissionDB;
GO

CREATE USER user1
FROM LOGIN user1;
GO
```
**Code Snippet 1:** *Create Login, Database and User*

In *Code Snippet 1* we create a login, a database, and then we create a user for the login in the database.

> **NOTE:** Below you see in quite a few places the abbreviation SPEES. That is short for `sp_excute_external_script`.

## Permissions

What we see in *Code Snippet 1* is that we have not assigned `user1` to any particular roles on either the server or the database, so `user1` has whatever default permissions he gets during creation. Let us look in *SSMS* UI and see what server level roles `user1` belongs to:

![](/images/posts/sql_ml_speess_permissions1.png)

**Figure 1:** *Roles User1*

In *Figure 1* we see how `user1` belongs to the server role `public`, and that is the only role he belongs to. So what if we have code like so:

```sql
--uncomment the following and execute
--to execute as user1
--EXECUTE AS USER = 'user1';
--GO

EXECUTE sp_execute_external_script
             @language = N'R'
           , @script = N'
               d<-42
               OutputDataSet <- as.data.frame(d)'

--to switch back from user1 uncomment and execute
--the following
--REVERT
```
**Code Snippet 2:** *Simple Test Code*

The code in *Code Snippet 2* allows you to switch between admin/sa and `user1` without having to log in as `user1`. 

If someone with sufficient permissions ran the code in *Code Snippet 2*, the result looks like so:

![](/images/posts/sql_ml_spees_sa_exec.png)

**Figure 2:** *sa Executes SPEES*

As we see in *Figure 2* we get back [*The Answer to the Ultimate Question of Life, the Universe and Everything.*][1], but if `user1` runs the same code, the result is:

![](/images/posts/sql_ml_spees_sa_exec_error1.png)

**Figure 3:** *SPEES Execution Error*

Oh, dear me, `user1` receives a permission denied exception! Well, from what we know about SQL Server and permissions it probably was not that unexpected. No problem, we know about SQL Server permissions, so we realise we probably have to `GRANT EXECUTE` permissions on *SPEES* to `user1` (or `public`):

```sql
GRANT EXECUTE ON sp_execute_external_script to user1;
```
**Code Snippet 3:** *Grant Execute Permission*

Being in the database where `user1` exists and executing the code in *Code Snippet 3* as admin/sa - what could possibly go wrong:

![](/images/posts/sql_ml_spees_perm_grant_error1.png)

**Figure 4:** *Grant Permission Error*

Oops, something did go wrong, as it turns out that if you try to grant permissions on extended stored procedures, which *SPEES* is, you need to do it from the `master` database. Cool, let us switch to master and do it there. Well, if you try to do that - then you get another error: the user does not exist in `master`, sigh!

At this stage you have a couple of options:

* ~~Add the login for the user to the `sysadmin` role, or the user to the `db_owner` role in the actual database.~~ No do not do that, I am only kidding! Do.Not.Do.That!
* Create the user in `master` and grant the permission. That would work.
* Grant the permission to `public`.

Both options above (I do not count `sysadmin`, `db_owner`) have drawbacks:

* Create the user in `master`: you now have a user in master, and the question is what "shenanigans" the user can do.
* Grant permission to `public`: anyone can potentially execute *SPEES*, not ideal.

For reasons that become clear later I go with granting permission to `public`:

```sql
USE master
GRANT EXECUTE ON sp_execute_external_script to public;
```
**Code Snippet 4:** *Granting Permission to Public*

After admin/sa runs the code in *Code Snippet 4*, `user1` can now execute the code in *Code Snippet 2* and we should see *The Answer ...*:

![](/images/posts/sql_ml_spees_sa_exec_error2.png)

**Figure 5:** *SPEES Execution Error*

[Eish][2], what goes on here? We did grant the permission in *Code Snippet 4*, so what now? Hmm, if we compare the errors, we see that they are slightly different. The error before granting the permission is something like: "The EXECUTE permission was denied ...", whereas the error after granting the permission is like: "The user does not have permission ...". It seems that the code in *Code Snippet 4* did something, but we still miss a piece (or multiple) of the puzzle, and it is permissions related. What permission(s) is the question?

So I decided to try a "brute force attack"; find all built in permissions in SQL Server, browse through them and see if I see something promising. For this, I used a SQL Server function: `sys.fn_builtin_permissions`, which - when executed - returns a description of the built-in permissions hierarchy of the server:

```sql
SELECT * FROM fn_builtin_permissions('database')
```
**Code Snippet 5:** *Retrieve All Functions*

The parameter (`database`) in *Code Snippet 5* indicates what permissions I want back. In this case, I want all permissions on a database level. When I ran the code in *Code Snippet 5* the function call returned 78 rows, and towards the end of the result I saw something promising:

![](/images/posts/sql_ml_spees_permissions.png)

**Figure 6:** *SPEES Execution Error* 

The highligthed part in *Figure 6* looks very interesting. I wonder what happens if I do something like this as admin/sa in the database the user is in:

```sql
GRANT EXECUTE ANY EXTERNAL SCRIPT TO user1
```
**Code Snippet 5:** *Grant External Script*

The code in *Code Snippet 5* ran without any issues, and `user1` can then try following code:

```sql
SELECT SUSER_NAME()
EXECUTE sp_execute_external_script
             @language = N'R'
           , @script = N'
               d<-42
               OutputDataSet <- as.data.frame(d)'
```
**Code Snippet 6:** *Another Try by user1*

The `SELECT SUSER_NAME()` in *Code Snippet 6* is there to verify that it is the correct user executing. The result when `user1` executes looks like so:

![](/images/posts/sql_ml_spees_user1_exec.png)

**Figure 6:** *Successful Execution* 

So that was the missing link: `GRANT EXECUTE ANY EXTERNAL SCRIPT TO ...`, and to tell the truth; afterwards, I have seen a few posts on the net mentioning `EXECUTE ANY EXTERNAL SCRIPT`.

One more thing: above I mentioned that I favour granting the `EXECUTE` on *SPEES* to `public` instead of adding the user to `master`. The reason for this is what we just have seen: yes you do a "blanket" `GRANT` by granting `public`, but a user still needs to be granted `EXECUTE ANY EXTERNAL SCRIPT` before he can "go wild". That gives admins/dba's some control over who can execute *SPEES*.

## Summary

To allow a non-admin database user to execute `sp_execute_external_script` you need to:

* Grant `public` execute permissions on `sp_execute_external_script`, and you do it in `master`. Obviously, you only need to do it once.
* Grant `EXECUTE ANY EXTERNAL SCRIPT` to the user in the different databases he needs to execute *SPEES* in.

That is it!

One final thing: if you want to read more about `sp_execute_external_script`, [SQL Server R Services](/sql_server_2k16_r_services) series has some posts.

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

<!-- [series1]: <> (/sql_server_2k16_r_services) -->
<!-- [series2]: <> (/sql_server_ml_services_install_packages) -->

[1]: https://www.independent.co.uk/life-style/history/42-the-answer-to-life-the-universe-and-everything-2205734.html
[2]: https://en.oxforddictionaries.com/definition/eish
