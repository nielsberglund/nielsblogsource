---
type: post
layout: "post"
title: "SQL Server 2019, Java & External Libraries - I"
author: nielsb
date: 2019-03-10T10:22:51+02:00
comments: true
highlight: true
draft: false
categories:
  - SQL Server 2019
  - SQL Server Extensibility Framework
tags:
  - SQL Server 2019
  - R
  - Python
  - Java
  - SQL Server Extensibility Framework
  - CREATE EXTERNAL LIBRARY 
description: We look at how we can deploy Java code to the database, so it can be loaded from there.
keywords:
  - SQL Server 2019
  - R
  - Python
  - Java
  - SQL Server Extensibility Framework
  - CREATE EXTERNAL LIBRARY   
---

A couple of months ago I wrote a series of posts about one of the new features in SQL Server 2019; the ability to call out to Java code from inside SQL Server.

To see the posts, go to [**SQL Server 2019 Extensibility Framework & Java**](/s2k19_ext_framework_java).

In the posts, we discussed how the Java extension differs from R and Python in that R and Python are an integrated part of the SQL Server install (when enabling in-database analytics), but Java is not. In other words, the use of the Java extension requires Java to be installed beforehand, and this then has implications on permissions. We also discussed how Java is a compiled language, and we execute against a method in a class, whereas with R and Python we send a script to the external engine. The consequence of this is that when we execute Java code, we need to indicate where the compiled code resides, and those locations need specific permissions.

All this creates a level of complexity, and it would potentially be easier if we load the Java code from a well-known place, where we do not need to worry about permissions and so forth.

This post is the first of a couple where we see how new functionality in SQL Server 2019 CTP 2.3 can help.

<!--more-->

## Code & Background

Let us start with looking at the code we use today, and also remind ourselves of some of the complexities when calling Java from SQL server.

So, the code:

```java
public class Calculator {
    public static short numberOfOutputCols;
    public static int x;
    public static int y;

    static public int[] outputDataCol1;
    static public boolean[][] outputNullMap;

    public static void adder() {
        numberOfOutputCols = 1;
        outputDataCol1 = new int[1];
        outputDataCol1[0] = x + y;
        outputNullMap = new boolean[1][1];
    }

}
```
**Code Snippet 1:** *Java Calculator*

As we see in *Code Snippet 1`, the code is very simple, and we have seen variants of it in my other [Java posts](/s2k19_ext_framework_java). If you wonder about some of the variables in the code, the previous [posts](/s2k19_ext_framework_java) discuss them in detail.

To use the code from SQL Server, we compile the source file `Calculator.java`: `$ javac Calculator.java`, into a `.class` file: `Calculator.class`.
After compilation, we can now place the `Calculator.class` in any of the locations a pre-defined `CLASSPATH` environment variable points to. To call the `adder` method from inside SQL Server we execute like so:

``` sql
EXECUTE sp_execute_external_script
    @language = N'Java',
    @script = N'Calulator.adder',
    @params = N'@x int, @y int',
    @x = 21,
    @y = 21;
```
**Code Snippet 2:** *Execute from SQL Server*

By the fact that the `.class` file is in a `CLASSPATH` location, the code in *Code Snippet 2* succeeds, **IF** the right permissions exist on the location.

> **NOTE:** The required permission is `READ` for the `ALL APPLICATION PACKAGES` group.

Having the code in a `CLASSPATH` location is one way to load and execute the code. Another way is to have the code in an arbitrary location and explicitly set a parameter in the SQL call to point to that location:

``` sql
EXECUTE sp_execute_external_script
    @language = N'Java',
    @script = N'Calculator.adder',
    @params = N'@x int, @y int, @CLASSPATH nvarchar(512)',
    @x = 21,
    @y = 21,
    @CLASSPATH = N'W:\javacodepath';
```
**Code Snippet 3:** *Using @CLASSPATH Parameter*

In *Code Snippet 3* we see how we set a parameter `CLASSPATH` to point to where the code is. The permission requirements for this scenario are the same as for when we have a defined `CLASSPATH`: the location need `READ` permission for the `ALL APPLICATION PACKAGES` group.

> **NOTE:** You may wonder where the `CLASSPATH` parameter in *Code Snippet 3* comes from, as it is not part of the signature of `sp_execute_external_script`? This parameter is a well-known parameter for the SQL Server Java language extension, and if this parameter exists the extension sets the `--classpath` option in the `java` command.

In the code snippets above we execute against `.class` files. In the "real world" however you are unlikely to do that, but instead, you use `.jar` files. So let us see how we do that from SQL Server. First, we compile the `.java` source, followed by creating the `.jar`:

```java
$ javac .\Calculator.java
$ jar -cf MyCalcJar.jar .\Calculator.class
```
**Code Snippet 4:** *Create a jar File*

After we have created the `MyCalcJar.jar` as in *Code Snippet 4*, we copy the `.jar` to either the `CLASSPATH` location or an arbitrary location. To execute we call it like so:

```sql
EXECUTE sp_execute_external_script
@language = N'Java',
@script = N'Calculator.adder',
@params = N'@x int, @y int, @CLASSPATH nvarchar(max)',
@x = 21,
@y = 21,
@CLASSPATH = N'W:\javacodepath\MyCalcJar.jar'
```
**Code Snippet 5:** *Execute Against a jar File*

We see in *Code Snippet 5* how we when we execute against a `.jar` need to: 

* Set the path to the `.jar`, using the using the `CLASSPATH` parameter. This is required **even** if the `.jar` is in the actual `CLASSPATH`. 
* Include the name of the `.jar` file.

We also need to ensure that the permissions mentioned above exist where ever the `.jar` is.

So the examples above re-enforce what we mentioned in the beginning, Java incurs some complexity which we do not have when executing R/Python code:

* Where to load the code from.
* Permissions on said location.

Apart from pointing out the complexities at the beginning of this post I also mentioned that new functionality in SQL Server 2019 CTP 2.3 helps to solve this. That functionality is the ability to create external libraries.

## External Libraries

External libraries in SQL Server enables the ability to load artefacts needed for any new language runtimes and OS platforms supported by SQL Server from the database. For example, if you need an R package that is not part of the default install of the engine you can upload to the database the particular R package as an external library and use it from the database in question. An external library is similar to a CLR assembly in that the actual library exists in the database as a byte-stream ~~and SQL Server loads it from the database~~.

> **EDIT (2019-04-10):** *It so turns out that what I wrote about SQL Server loading from the database is not correct. It loads the package(s) from the external library path.  See [Installing R Packages in SQL Server Machine Learning Services - III][pkg3] for more around this.

You create an external library in a similar to how you create a CLR assembly; you use a DDL statement `CREATE EXTERNAL LIBRARY`:

```sql
CREATE EXTERNAL LIBRARY library_name  
[ AUTHORIZATION owner_name ]  
FROM <file_spec> [ ,...2 ]  
WITH ( LANGUAGE = <language> )  
[ ; ]  
```
**Code Snippet 6:** *Signature CREATE EXTERNAL LIBRARY*

In *Code Snippet 6* we see the signature for `CREATE EXTERNAL LIBRARY`. We see only the main parts:

* `library_name` - the name we want the library to have. When we create an external library for Java code we can assign any name we want. However, when we create an external library for R, the name must be the same as what we refer to the package when we load it in the external script.
* `owner_name` - optional, and it specifies the name of the user or role that owns the external library.
* `file_spec` - this is the content of the package/code. For Java it has to be a `.jar` file, or a `.zip` file with relevant `.class` files in it. The `file_spec` can be either a path to the file, or a byte array. Part of the `file_spec` is also the platform on which SQL Server is running. For now, only Windows is supported.
* `language` - the language of the package/code.

> **NOTE:** I mentioned above that we see the main parts of `CREATE EXTERNAL LIBRARY`, and we have not drilled down in detail. If you are interested in the details look [here][1].

To see this in practice, we need first to create a database: `CREATE DATABASE JavaTest`, (we can obviously use an existing db as well). Then, based on the code in *Code Snippet 4* and *Code Snippet 5*, the call to create an external library for our calculator looks like so:

```sql
USE JavaTest;
GO

CREATE EXTERNAL LIBRARY myCalc
FROM (CONTENT = 'W:\javacodepath\MyCalcJar.jar')
WITH (LANGUAGE = 'Java');
```
**Code Snippet 7:** *Create External Library*

What we see in *Code Snippet 7* is how we create an external library named `myCalc`, where the external library is based on a `.jar` file at `W:\javacodepath\MyCalcJar.jar`. The last thing we do is to indicate that the language is `Java`. As the only platform supported right now is Windows, we do not bother with the `PLATFORM` parameter. 

To verify this works after we execute the code in *Code Snippet 7* we use exactly the same code as in *Code Snippet 2*:

```sql
USE JavaTest;
GO

EXECUTE sp_execute_external_script
@language = N'Java',
@script = N'Calculator.adder',
@params = N'@x int, @y int',
@x = 21,
@y = 21;
```
**Code Snippet 8:** *Execute Java Code Loaded from Database*

In *Code Snippet 8* we see how we no longer define the `.jar` file as a parameter, (what we had to do in *Code Snippet 5*), but when we execute all works OK.

The question is now where the `.jar`,(or `.zip`), loads from. The answer to that is, (like with SQLCLR), that it loads from system tables in the database. When we create an SQLCLR assembly in a database, SQL Server stores the assembly in system tables, and we use catalog views to view the assemblies: `sys.assemblies`, `sys.assembly_files`, and so on. External libraries do not use the same underlying tables or catalog views, but to see the external libraries you use:

* `sys.external_libraries` - contains a row for each external library that has been uploaded into the database.
* `sys.external_library_files` - lists a row for each file in the external library.
* `sys.external_libraries_installed` - shows what libraries have been loaded, e.g. used.

An example of this:

```sql
SELECT el.name, el.[language], ef.content
FROM sys.external_libraries el
JOIN sys.external_library_files ef
  ON el.external_library_id = ef.external_library_id
```
**Code Snippet 9:** *View External Libraries*

When we run the code in *Code Snippet 9* we get:

![](/images/posts/sql_2k19_java_view_ext_lib.png)

**Figure 1:** *External Libraries View*

We see in *Figure 1* some information about the external library. The `content` column outlined in red is interesting in that it contains the binary representation of the external library.

## Summary

In this post, we saw how we can make the use of Java in SQL Server somewhat less complex (permissions, code paths, etc.), by using external libraries.

To be able to use external libraries for your Java code, the code need be packaged either in a `.jar` file, or your class files need to be archived into a `.zip` file.

We create the external library using the DDL statement `CREATE EXTERNAL LIBRARY` where we:

* Define a name for the library.
* Indicate where the `.jar` or `.zip` file is.
* Set the language to Java.

When we execute against the code we no longer need to have the code copied to the `CLASSPATH` or define a `@CLASSPATH` parameter, and no special permissions are required. Well, you need permissions to execute `sp_execute_external_script` but apart from that nothing else.

When we call `sp_execute_external_script` SQL Server loads the code from a system table, and we can view what external libraries exist in the database by using the `sys.external_libraries` and `sys.external_library_files` catalog views.

As good as all this sounds, there is one minor, (well perhaps not so minor), detail to be aware of: the way we create external libraries in this post - from a file path - requires SQL Server to be able to read from that path. In a production environment that may not be possible, so in a future post we look at how to overcome that. 

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[1]: https://docs.microsoft.com/en-us/sql/t-sql/statements/create-external-library-transact-sql?view=sql-server-ver15
[pkg3]: {{< relref "2019-04-10-installing-r-packages-in-sql-server-machine-learning-services---iii.md" >}}