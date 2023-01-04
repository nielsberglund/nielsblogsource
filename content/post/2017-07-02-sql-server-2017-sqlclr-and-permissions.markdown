---
layout: post
title: SQL Server 2017, SQLCLR and Permissions
author: nielsb
date: 2017-07-02T08:18:48+02:00
comments: true
categories:
  - SQL Server
  - SQL Server 2017
  - SQLCLR
tags:
  - SQL Server
  - SQL Server 2017
  - SQLCLR
  - permissions
  - clr strict security
  - certificates
  - TRUSTWORTHY
description: Investigation SQL Server 2017 "clr strict security" and its impact on SQLCLR
keywords:
  - SQL Server
  - SQL Server 2017
  - SQLCLR
  - permissions
  - clr strict security
  - certificates
  - TRUSTWORTHY   
---

While I was writing the post about [SQLCLR and Certificates][1], I came across some strange behavior when I accidentally ran my code on an SQL Server 2017 instance. I quickly connected back to my SQL Server 2016 instance and continued. However, afterwards I started to look into the differences between SQLCLR in SQL Server 2017 and SQL Server 2016, and this post is the result of me ~~playing around~~ investigating the changes.

<!--more-->

**UPDATE** 2017-07-23. This post has a [follow up post][4] based on changes in SQL Server 2017 RC1.

Let's start with a recap and an example

## Recap

In all versions of SQL Server from 2005 (where SQLCLR was introduced) up to 2016; when you deploy assemblies to the database and you want the assemblies to be able to execute outside of the database it is deployed to, you assign a permission set to the assembly. There are three permission sets available, ranging from not allowing you to shoot yourself in the foot to blow your head off:

* `SAFE` - the code is not doing anything that you cannot do in T-SQL. You cannot shoot yourself in the foot any more than what you can do with T-SQL. This is the default.
* `EXTERNAL_ACCESS` - you can get outside of the local database, but only via "approved" assemblies, such as `ADO.NET`, etc. You can definitely shoot yourself in the foot.
* `UNSAFE` - You can do pretty much what you want. You are free to blow your head off.

The permission set is assigned when you create the assembly:

``` sql
CREATE ASSEMBLY <some_name> 
FROM 'F:\some_path\somedll.dll'
WITH PERMISSION_SET = SAFE | EXTERNAL_ACCESS | UNSAFE;
GO
```
**Code Snippet 1:** *Creating an Assembly from Absolute Path*

In order to create an assembly with anything else than `SAFE`, the database or assembly need to have additional authorizations, and that was what my [SQLCLR and Certificates][1] post covered. 

To see what has changed in SQL Server 2017, let's look at some sample code. In *Code Snippet 1* you see some C# code that we want to deploy to a SQL Server 2017 database:

``` c#
namespace Sql2k17SqlClr
{
  public class Functions
  {
    public static int fn_clr_Adder(int x, int y)
    {
      return x + y;
    }
  }
}
```
**Code Snippet 1:** *Safe Code to be Deployed*

After having built the project with the code in *Code Snippet 1*, you would deploy it to a specific database in your SQL Server instance like so (the dll is named `Sql2k17SqlClr1.dll`):

``` sql
CREATE ASSEMBLY Sql2k17SqlClr
FROM 'W:\<path_to_dll>\Sql2k17SqlClr1.dll'
GO
```
**Code Snippet 2:** *Create Safe Assembly*

The assembly we want to create in the database is definitely a safe assembly, as it is just doing some internal calculation, and in SQL Server (pre 2017), this would deploy just fine. In SQL Server 2017 however things are different. When you run the code in *Code Snippet 2*, you will get following error:

![](/images/posts/sql2k17_safe.png)

**Figure 1:** *Error Deploying Safe Assembly*

The error you see is more or less the same you'd receive if you - in SQL Server pre 2017 - tried to deploy an assembly as `EXTERNAL_ACCESS` or `UNSAFE`. You can read more about that particular issue in my [SQLCLR and Certificates][1] post.

One difference in the error message you see in *Figure 1*, and what you would have received in pre SQL Server 2017 versions, is: "*the 'clr strict security' option of sp_configure is set to 1*". You may think; "what is this, I have never seen that in other SQL Server versions". You are absolutely correct, so let's look at that  - and we'll start with **Code Access Security** (**CAS**)

## Code Access Security

CAS is a security technology developed to provide the ability to protect system resources when a .NET assembly is executed. Such system resources could be: local files, files on a remote file system, registry keys, databases, printers and so on. CAS, in essence, was used to enforce security boundaries based on code origination or other identity aspects, and SQL Server's `PERMISSION_SET` relied on the CAS security boundaries. That was how SQLCLR assemblies which only performed "safe" operations did not need any further authorizations.

In recent versions of the .NET framework (around version 4.5), Microsoft has changed the relation between CAS and security boundaries, and CAS is no longer supported as a boundary! From a SQLCLR perspective that is a real "bummer", as theoretically there is no control over what an assembly can and cannot do (whereas before `PERMISSION_SET` controlled the abilities). 

> **NOTE:** The above statement about no control what an assembly can and cannot do is not entirely correct as we will see further down.

### `clr strict security`

With the changes of the implications of CAS, and in order to enhance the security of CLR assemblies, Microsoft has in SQL Server 2017 introduced an `sp_configure` option called `clr strict security`, which by default is set to 1 (on). When the setting is on, SQL Server treats all assemblies (`SAFE`, `EXTERNAL_ACCESS`, `UNSAFE`) as if they were marked `UNSAFE`. The implication of this is that you must either:

* Set the database to be `TRUSTWORTHY`, *OR*
* Sign the assembly with a certificate that has a corresponding login with `UNSAFE ASSEMBLY` permission, *OR*
* Sign the assembly with an asymmetric key that has a corresponding login with `UNSAFE ASSEMBLY` permission.

If you changed the `clr strict security` option to 0, the code in *Code Snippet 2*, would work just fine. Likewise, if you didn't change the option, but instead set `TRUSTWORTHY ON` on the database, it would also work. 

## Assembly Authorization

So, where are we? In order to create a safe assembly we now need to authorize it as we would an `EXTERNAL_ACCESS` or `UNSAFE`, so let's do that to the assembly that the code in *Code Snippet 2* represents. We could do it by setting `TRUSTWORTHY` to `ON` for the database, and you who read my [SQLCLR and Certificates][1] post know that I do not think that setting `TRUSTWORTHY` to `ON` is like "opening the gates to hell", so I would not have an issue with doing that - even on a production database. That is however a discussion for another day, so let us do it by using a certificate. 

To recap from the [SQLCLR and Certificates][1] post, to use a certificate you'd:

* Create a certificate, if you don't already have one.
* Create a `.pfx` file from the certificate. Pfx stands for Personal Information Exchange, and we'll use it to sign your assembly.
* Sign the dll with the `.pfx` file.
* In the database create a SQL Server certificate from the original certificate.
* In the database create login from the certificate.
* Grant the login `UNSAFE ASSEMBLY`.
* Create the dll in the database.

I already have a certificate and a `.pfx` file created from when I wrote the [SQLCLR and Certificates][1] post, so I'll re-use those and go ahead and sign the assembly with the `.pfx` file:

``` cpp
signtool sign /f NielsTestPfx.pfx 
              /p testPwd Sql2k17SqlClr1.dll
```
**Code Snippet 3:** *Sign the dll Using signtool.exe*

The `/p` flag in *Code Snippet 3* defines the password of your `.pfx` file. After having signed the dll, I create the SQL Server certificate, from the original certificate:

``` sql
USE master;
GO
CREATE CERTIFICATE NielsTestCert
FROM FILE = 'W:\<path_to_cert>\NielsTestCert.cer';
GO
```
**Code Snippet 4:** *Create a SQL Server Certificate*

When the certificate is created we can create a login from the certificate, and `GRANT` the login `UNSAFE` assembly permissions:

``` sql
CREATE LOGIN login_NielsTestCert 
FROM CERTIFICATE NielsTestCert
GO

GRANT UNSAFE ASSEMBLY TO login_NielsTestCert;
GO
```
**Code Snippet 5:** *Create a SQL Server Login and Grant Permissions*

After the login has been created and the `UNSAFE ASSEMBLY` permission granted to the login, the code in *Code Snippet 2*, should just work. Oh, don't forget to switch back from `master` to the database where you want to create the assembly.

We can then finally create a T-SQL wrapper function against the `fn_clr_Adder` method:

``` sql
CREATE FUNCTION dbo.fn_clr_Adder(@x int, @y int)
RETURNS int
EXTERNAL NAME Sql2k17SqlClr.[Sql2k17SqlClr.Functions].fn_clr_Adder
GO
```
**Code Snippet 6:** *Create T-SQL Wrapper Function*

To check that it all works, run: `SELECT dbo.fn_clr_Adder(21,21)` and the [*Answer to the Ultimate Question of Life, the Universe, and Everything*][2] should be returned to you.

So far this does not seem too bad, OK - so for a `SAFE` assembly we need to sign the assembly and have a login with `UNSAFE ASSEMBLY` permissions granted (or have `TRUSTWORTHY` on). 

## Confusion About `SAFE` Assemblies

Since the introduction of `clr strict security` there has been some confusion about how `SAFE` assemblies will behave, and part of this confusion can be attributed to the [documentation][3] around `clr strict security`. Specifically this statement: *A CLR assembly created with PERMISSION_SET = SAFE may be able to access external system resources, call unmanaged code, and acquire sysadmin privileges.*. When reading that statement, my understanding is that if I create an assembly as `SAFE` I could potentially do `UNSAFE` operations.

Let us test this out, and create a second dll `Sql2k17SqlClr2.dll`, where the code looks like so:

``` c#
using System.Threading;
using System.Threading.Tasks;

namespace Sql2k17SqlClr
{
  public class Functions
  {
    public static int fn_clr_Adder(int x, int y)
    {
      return x + y;
    }

    public static int fn_clr_LongRunningAdder(int x, int y)
    {

      var t = Task.Factory.StartNew(() => LongRunning(x, y));
      return t.Result;
    }

    static int LongRunning(int x, int y)
    {
      var wait = (x + y) * 100;
      Thread.Sleep(wait);
      return x + y;

    }
  }
}
```
**Code Snippet 7:** *Safe and Unsafe Behavior*

As you see in *Code Snippet 7*, we have our trusted `fn_clr_Adder` method, which is as safe as you can get. But, we also have the `fn_clr_LongRunningAdder` method which uses a `Task` for calling into another method and this is definitely `UNSAFE`. So what will happen here if we, after having built and signed the dll, create the assembly as `SAFE`:

``` sql
CREATE ASSEMBLY Sql2k17SqlClr2
FROM 'W:\\<path_to_dll>\\Sql2k17SqlClr2.dll'
WITH PERMISSION_SET = SAFE;
GO
```
**Code Snippet 8:** *Create Safe Assembly with Unsafe Method*

Running the code in *Code Snippet 8* should work, and it would also have worked in previous versions of SQL Server. We can now create a T-SQL wrapper function around the `fn_clr_LongRunningAdder` method (the method using `UNSAFE` resources):

``` sql
CREATE FUNCTION dbo.fn_clr_LongRunningAdder(@x int, @y int)
RETURNS int
EXTERNAL NAME Sql2k17SqlClr2.[Sql2k17SqlClr.Functions].fn_clr_LongRunningAdder
GO
```
**Code Snippet 9:** *Create an Unsafe T-SQL Wrapper Function*

When I execute `SELECT dbo.fn_clr_LongRunningAdder(21, 21)` I would expect - having read the statement above - that this would work. However, on my SQL Server 2017 instance (CTP 2.1), I receive an error:

![](/images/posts/sql2k17_safe_unsafe.png)

**Figure 2:** *Error Executing UNSAFE Function in SAFE Assembly*

So, `HostProtection` kicks in and says that I do not have necessary permissions to do the operation. In previous SQL Server versions this would happen if you hadn't assigned the correct `PERMISSION_SET` to the assembly when it was created. So, let us drop the function and the assembly, and recreate the assembly with `PERMISSION_SET = UNSAFE`, and recreate the wrapper function:

``` sql
DROP FUNCTION dbo.fn_clr_LongRunningAdder
DROP ASSEMBLY Sql2k17SqlClr2
GO

CREATE ASSEMBLY Sql2k17SqlClr2
FROM 'W:\\<path_to_dll>\\Sql2k17SqlClr2.dll'
WITH PERMISSION_SET = UNSAFE;
GO

CREATE FUNCTION dbo.fn_clr_LongRunningAdder(@x int, @y int)
RETURNS int
EXTERNAL NAME Sql2k17SqlClr2.[Sql2k17SqlClr.Functions].fn_clr_LongRunningAdder
GO
```
**Code Snippet 10:** *Create the Assembly as UNSAFE*

Now when I execute `SELECT dbo.fn_clr_LongRunningAdder(21, 21)`, it all works as expected. So it seems that `PERMISSION_SET` still has a role to play, at least in this scenario.

### Referenced Assemblies

So what about if I have a `SAFE` assembly which references an `UNSAFE` assembly, and calls into an `UNSAFE` method?

I created a third dll: `Sql2k17SqlClr3.dll`, which has a method that calls into the `fn_clr_LongRunningAdder` method in the `UNSAFE` assembly `Sql2k17SqlClr2.dll`:

``` c#
namespace Sql2k17SqlClr3
{
  public class Functions
  {
    public static int fn_clr_Adder(int x, int y)
    {
      return Sql2k17SqlClr.Functions.fn_clr_LongRunningAdder(x, y);
    }
  }
}
```
**Code Snippet 11:** *Method Calling Into UNSAFE Method*

After having built and signed the dll, I deployed it to the database with `PERMISSION_SET = SAFE`, and created a T-SQL wrapper function around the `fn_clr_Adder` method. This is what was returned when executing the function:

![](/images/posts/sql2k17_safe_unsafe.png)

**Figure 3:** *Error Calling Into UNSAFE Assembly From SAFE*

Also in the case of referenced assemblies, it seems that `PERMISSION_SET` plays a role. This was confirmed when I dropped and recreated the `Sql2k17SqlClr3.dll` with `PERMISSION_SET = UNSAFE`. When I at that stage executed the wrapper function, all worked OK!

## Summary

In SQL Server 2017, Microsoft now by default requires that all type of assemblies (`SAFE`, `EXTERNAL_ACCESS`, `UNSAFE`) are authorized for `UNSAFE` access, by:

* The database is set to be `TRUSTWORTHY`, *OR*
* The assembly is signed with a certificate that has a corresponding login with `UNSAFE ASSEMBLY` permission, *OR*
* The assembly is signed with an asymmetric key that has a corresponding login with `UNSAFE ASSEMBLY` permission.

The above requirement is handled by a new configure option: `clr strict security`. The documentation around this option is, at least at the moment, somewhat mis-leading as it implies that `PERMISSION_SET` no longer has an impact on the behavior of an assembly.

The tests above shows however that if you want to do an `UNSAFE` operation, the assembly has to be created with `PERMISSION_SET = UNSAFE`. So what I wrote in the beginning of this post: *"From a SQLCLR perspective that is a real "bummer", as theoretically there is no control over what an assembly can and cannot do (whereas before `PERMISSION_SET` controlled the abilities)."*, does not seem to be correct. 

Bear in mind that I am running SQL Server 2017 CTP 2.1, and things may change. I'll try and dig in some more in this, and if I find out something I will edit this post.

**EDIT:** Things changed in SQL Server 2017 RC1. I have written about the changes in the [SQL Server 2017 SQLCLR - Whitelisting Assemblies][4] post.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: {{< relref "2017-07-01-sqlclr--certificates.markdown" >}}
[2]: https://en.wikipedia.org/wiki/42_(number)
[3]: https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/clr-strict-security
[4]: {{< relref "2017-07-23-sql-server-2017-sqlclr-white-listing-assemblies.markdown" >}}
