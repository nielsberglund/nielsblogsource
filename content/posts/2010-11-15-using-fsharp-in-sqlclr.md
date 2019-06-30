---
layout: post
title: "Using F# in SQLCLR"
author: nielsb
date: 2010-11-15T09:27:56+02:00
categories: [.NET, SQL Server]
tags: [F#, SQLCLR]
comments: true
---

Recently I have become very interested in F# and I am at the moment trying to get to grips with it. It is definitely a different beast than C#, but so far I like it - a lot!

Anyway, I am a SQL nerd, and many moons ago I was very heavily involved in SQLCLR (for you who don't know what that is; it is the ability to run .NET code inside the SQL Server engine. It was first introduced with SQL Server 2005). So I thought it would be a "giggle" to see if I could get some F# code running inside SQL Server.

<!--more-->

I created the simplest of the simple F# dll's. SQLCLR requires you have a public class and your publicly exposed SQLCLR methods to be static, so my F# code looked like so:

``` fsharp 
namespace ManagedData.Samples.FSharp
  type SqlClr =
    static member Adder a b = a + b
    static member Factorial n =
      match n with
      | 0 ->; 1
      | _ -> n * (SqlClr.Factorial( n - 1))
```
As you can see my class is extremely advanced (not); it has two methods:

* The canonical `Adder` method (every SQLCLR dll has to have an `Adder` method, it's the law - nah, I'm just kidding), which takes two integers and returns an integer.
* A factorial method, which takes an integer and calculates the factorial from that.

By the way, any pointers about how to write efficient F# code are very welcome .

Having written and compiled the code, it was time to deploy! When running .NET code in SQL Server, you need to deploy your assembly to the database you want to execute your code in, and SQL Server will actually load the assembly from the database. In fact most assemblies are loaded from the database, even quite a few of Microsoft's own system assemblies which normally are loaded from the GAC. There are only about 13 system assemblies that are allowed to be loaded from the GAC these are known as the "blessed list". You also need to create T-SQL wrapper objects (procedures, functions, triggers, etc.) around the methods you want to publicly expose.

In my SQL Server 2008R2 instance I created a database in which I wanted my F# assembly to, and then it was time to deploy. You can deploy in several ways, the easiest is something like this (in the database you want to use):

```sql
CREATE ASSEMBLY fsasm
FROM 'c:\\repos\\F#\\testcode\\fssqlclr\\fslib\bin\\debug\\fslib.dll'
WITH permission_set = SAFE;
GO
```
The problem with the code above is that F# projects have a dependency on the assembly `FSharp.Core.dll`, so when I tried to deploy my assembly as per above, I got an exception. What I had to do was to deploy `FSharp.Core.dll` to my database first:

```sql
CREATE ASSEMBLY fsasm
FROM 'C:\\path to ...\\FSharp.Core.dll'
WITH permission_set = UNSAFE;
GO
```
Notice the use of `permission_set = UNSAFE`, this is to tell SQL Server that I know what I am doing and SQL Server should keep from doing a lot if validation. When I had catalogued the `FSharp.Core.dll` assembly I had no problems deploying my assembly to the database.

All there remained to do now was to create the T-SQL wrapper object(s) around my F# methods. This is done with "normal" `CREATE ...` syntax. The code for my factorial looks like so:

```sql
CREATE FUNCTION FsFactorial(@x int)
RETURNS int
EXTERNAL NAME fsasm.[ManagedData.Samples.FSharp.SqlClr].Factorial;
GO
```
This also went without problems, so now it is "crunch-time". Can I execute a F# method in SQLCLR?

```sql
SELECT dbo.FsFactorial(4);
```
Lo and behold, it executed and I received 24 back! I had just now executed F# running inside SQL Server!!

So, what does this prove? Nothing really, it was just an exercise from me to see if it could be done. However, F# is really suitable for quite a few tasks you would want to use SQLCLR for, so it now gives a database developer another tool in his tool-belt.

If anyone is interested in the full code for this, please drop me a comment and I'll email it to you.
