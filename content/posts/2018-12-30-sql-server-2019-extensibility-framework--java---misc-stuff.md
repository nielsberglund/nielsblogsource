---
type: post
layout: "post"
title: "SQL Server 2019 Extensibility Framework & Java - Misc. 'Stuff'"
author: nielsb
date: 2018-12-30T12:24:53+02:00
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
  - Java packages
  - JAR files
description: We look at SQL Server 2019 Java Extensions, and Java packages, the CLASSPATH and JAR files!
keywords:
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - R
  - Python
  - Java
  - SQL Server Extensibility Framework
  - Java packages
  - JAR files  
---

This post is the fourth post in a series where I look at the Java extension in SQL Server, i.e. the ability to execute Java code from inside SQL Server.

To see what other posts there are in the series, go to [**SQL Server 2019 Extensibility Framework & Java**](/s2k19_ext_framework_java).

This fourth post acts as a "roundup" of miscellaneous "stuff" I did not cover in the three previous posts, and some of the things we look at are:

* Java packages.
* The `CLASSPATH` environment variable.
* JAR files.

Ok, let us get into it.

<!--more-->

> **DISCLAIMER:** *This post contains Java code. I am not a Java guy, in fact, the only Java I have ever written is the code in this post and the previous **SQL Server 2019 Java** posts. So, the code is not elegant in any shape or form, and I am absolutely certain it can be done in a much better way. However, this is not about Java as such, but how you call Java code from SQL Server, and what you need to implement on the Java side.*

## Java Packages

We use packages in Java to prevent naming conflicts, to control access, to make searching/locating and usage of classes, interfaces, enumerations and annotations easier, etc. A Java package is somewhat similar to a .NET namespace in that it can be used to group "like-minded" classes etc. together.

In [SQL Server 2019 Extensibility Framework & Java - Hello World][1] we saw some code looking like so:

```java
public class JavaTest1 {
  public static short numberOfOutputCols;
  public static int x;
  public static int y;

  public static void adder() {
    System.out.printf("The result of adding %d and %d = %d", x, y, x + y);   
  }

  public static void helloWorld() {
    System.out.print("Hello World from SQL Java");
  }
}
```
**Code Snippet 1:** *Sample Code*

As we see in *Code Snippet 1*, we have one class: `JavaTest1` with two methods:

* The method `adder` which adds two integers together.
* The `helloWorld` method which says hello.

Let us break out the `adder` method, and put it into a class of its own - `Calculator`:

```java
public class Calculator {
  public static short numberOfOutputCols;
  public static int x;
  public static int y;

  public static void adder() {
    System.out.printf("The result of adding %d and %d = %d", 
                        x, y, x + y);
  }
}
```
**Code Snippet 2:** *Calculator - I*

We assume the code in *Code Snippet 2* is in a source file: `Calculator.java`. We then compile the code into a `.class` file: `javac Calculator.java`, and after the compile, we move the `Calculator.class` to the `CLASSPATH` location.

> **NOTE:** If you wonder why the `adder` method has no parameters, why we have two class members, `x` and `y`, and what is this `CLASSPATH` thing about, go back to [SQL Server 2019 Extensibility Framework & Java - Hello World][1] where it is all explained.

To execute the code in *Code Snippet 2* we use more or less the same code as in [Hello World][1]:

```sql
DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'Calculator.adder'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2 
```
**Code Snippet 3:** *Execute adder Method*

In *Code Snippet 3* we see how we send in two parameters to the java code, and how we call the `Calculator.adder` method. All works ok, and we get back a result. This application is now deployed, but after a while someone creates a new and better calculator:

```java
public class Calculator {
  public static short numberOfOutputCols;
  public static int x;
  public static int y;

  static public int[] outputDataCol1;
  static public boolean[][] outputNullMap;

  static public short numberOfOutputCols;

  public static void adder() {

    numberOfOutputCols = 1;

    outputDataCol1 = new int[1];
    outputDataCol1[0] = x + y;

    outputNullMap = new boolean[1][1];

  }
}
```
**Code Snippet 4:** *Calculator - II*

The new and better calculator, as we see in *Code Snippet 4*, still takes two class members, but now returns the result as a one column resultset. As we did with the code in *Code Snippet 2* we put it into a source file, `Calculator.java` and compile it into `Calculator.class`. Ok, so far so good. However, what if we try and copy the `.class` file to the `CLASSPATH` location, then we overwrite the existing `Calculator.class`. Not good!

This issue can potentially be resolved by having multiple `CLASSPATH` locations and copy the `.class` file to another location, but doing it that way would not guarantee which version of the application we call. That's where Java packages come to the rescue. Change the code in *Code Snippet 4* slightly:

```java
package mycalculator
public class Calculator {
  
  ...

  public static void adder() {
    '''
  }
}
```
**Code Snippet 5:** *Calculator & Package*

In *Code Snippet 5* we added at the top of the source file: `package mycalculator`. Ok, so what does this do? Let us experiment:

* Compile `Calculator.java` as usual (the edited one).
* Rename the `Calculator.class` file in the `CLASSPATH` location to something different, (like `Calcuator.xxx`).

After copying the newly compiled `Calculator.class` to the `CLASSPATH` location, execute the code in *Code Snippet 3* again and see if it works:

![](/images/posts/sql_2k19_java_misc_error1.png)

**Figure 1:** *Cannot Find Class*

So that didn't work! We see in *Figure 1* how we get an exception, saying something about not finding class `Calculator`. Seeing that the code now includes a package name, and reading-up some more about packages, maybe I should include the package name as well in the `@script` parameter: `@script = N'mycalculator.Calculator.adder`. 

When we try that it still does not work, but I get a somewhat different error message: `... Failed to find class mycalculator/Calculator`. That error message almost seems like a path. Let us create a directory in the `CLASSPATH` location named as our package, `mycalculator`, and move the `.class` file to there, and see what happens when we execute (still with `@script = N'mycalculator.Calculator.adder`):

![](/images/posts/sql_2k19_java_misc_pkg_success.png)

**Figure 2:** *Package Success*

As we see in *Figure 2*, it works! So, if you compile into packages you need to:

* Place the code in a directory named as the package in the `CLASSPATH` location.
* Execute the code with the package name in the `@script` variable: `@script=N'packagename.ClassName.methodName`.

> **NOTE:** The Java compiler can automatically create the directory for the package by using the `-d` option. If you are new to Java (like me), I can recommend [this site][4] to read more about packages.

## CLASSPATH

In [SQL Server 2019 Extensibility Framework & Java - Hello World][1] we discussed the `CLASSPATH` environment variable briefly. We said that the `CLASSPATH` variable is there so that the Java Compiler and Java Runtime can find Java classes referenced in your program. It maintains a list of directories (containing many Java class files) and JAR file (a single-file archive of Java classes), and in all of the SQL 2019 Java posts we have copied our `.class` files to the location of the `CLASSPATH` variable.

However, when you execute a Java application from the command line you do not have to rely on the `CLASSPATH` variable, but you can define where to find the application by the `-cp` option: 

```bash
W:\>java -cp .\nielsb-work\GitHub-Repos\nielsberglund.com \
               \_code\sql_2k19_java_misc\java Calculator`.
```
**Code Snippet 6:** *Usage of -cp Option* 

In *Code Snippet 6* we see how we, from the root of `W:\`, call the `Calculator` application by setting the `-cp` option to where the application is.

> **NOTE:** When calling the application as in *Code Snippet 6*, the application has to have a `main` method: `public static void main(String[] args)`.

When executing `sp_execute_external_script` we have the same functionality. We do this by defining, in `sp_execute_external_script`'s `@params` parameter list, a parameter `@CLASSPATH`, something like so:

```sql
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'some_method'
, @params = N'@CLASSPATH nvarchar(256)'
, @CLASSPATH = N'my_path_to_app`

```
**Code Snippet 7:** *Execute with Classpath*

So, we see, in *Code Snippet 7*, how we define the `@CLASSPATH` parameter, and set it to a value. The parameter is a well-known parameter to the Java extension components, and they know how to handle it. The `@CLASSPATH` parameter is similar to `@r_rowsPerRead`, for the R/Python components. In [Microsoft SQL Server R Services: sp_execute_external_script - III][sext3] you can read more about `@r_rowsPerRead`.

> **NOTE:** The `@r_rowsPerRead` parameter is not supported in the Java extensions.

To see how to use the `@CLASSPATH` parameter, (and some "gotchas"), we create two almost identical applications:

```java
// this is the first app
public class Hello {
  
  public static short numberOfOutputCols;
  public static void world() {
    System.out.print("Hello World 1 from SQL Java");
  }
}

// this is the second app
public class Hello {
  
  public static short numberOfOutputCols;
  public static void world() {
    System.out.print("Hello World 2 from SQL Java");
  }
}
```
**Code Snippet 8:** *Java Apps*

In *Code Snippet 8* we see both applications (I put them in one code snippet to save space). The only difference between them is what we print out to the "console". Copy the two classes into two separate source files (`Hello.java`), compile and copy the first `Hello.class` to the location which the `@CLASSPATH` environment variable points to. Create a new directory, (`testpath` or something like so), and copy the second `Hello.class` to that directory.

To be sure that we start afresh, restart the *Launchpad* service, and then execute:

```sql
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'Hello.world'
```
**Code Snippet 9:** *Execute against CLASSPATH Environment Variable*

The code in *Code Snippet 9* succeeds and returns `Hello World 1 from SQL Java`, cool. When we executed, the Java runtime found the code in the `CLASSPATH` location. 

Rename the `Hello.class` file in the `CLASSPATH` location to something like `Hello2.xxx`, and now we use code like so:

```sql
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'Hello.world'
, @params = N'@CLASSPATH nvarchar(256)
, @CLASSPATH = N'C:/testpath'
```
**Code Snippet 10:** *Execute with *CLASSPATH* Parameter*

In *Code Snippet 10* we see how we have defined the `@CLASSPATH` parameter and set it to the directory where our second Java app is. When we execute the code in *Code Snippet 10*, we get a surprise:

![](/images/posts/sql_2k19_java_misc_classpath_error.png)

**Figure 3:** *Exception*

Hmm, we get an exception, and the exception says something about not being able to find the class (outlined in red). What is that all about, we know that the `.class` file contains the class and the method? The issue we see here is related to something we discussed in [SQL Server 2019 Extensibility Framework & Java - Hello World][1], more specifically permissions. Remember how we said that we need to give the `ALL APPLICATION PACKAGES` group `READ` permissions on the `CLASSPATH` directory. The same is true for the directory(is) you define in the `@CLASSPATH` parameter. So what we need to do is assign `READ` permissions to the `ALL APPLICATION PACKAGES` group, and that should then fix it.

Before we do that, however, go to the `CLASSPATH` location where you have the renamed `Hello.class` application, and rename it back to its original name. Then execute the code in *Code Snippet 10* as it stands. Notice how the execution succeeds, and you get `Hello World 1 from SQL Java` as output. This indicates that when we execute, we first try and find the application in the `@CLASSPATH` parameter location, and if that does not succeed we try in the `CLASSPATH` environment variable location. With this in mind the exception we received in *Figure 3* makes somewhat more sense:

* We first tried to execute against the code in the `@CLASSPATH` parameter location.
* An exception was thrown before we could execute the actual code.
* We fell back to the `CLASSPATH` environment variable location.
* We didn't find the class (as we renamed it).
* We throw the exception we see in *Figure 3*.

Ok, so now we can go ahead and assign the `ALL APPLICATION PACKAGES` group `READ` permissions on the location of the `@CLASSPATH` parameter, and then execute the code in *Code Snippet 10* again:

![](/images/posts/sql_2k19_java_misc_classpath_success.png)

**Figure 4:** *Success*

We see in *Figure 4* how we get the expected output back when we execute. Assigning the right permissions fixes it as we expected.

> **NOTE:** In future SQL Server 2019 CTP releases (and RTM) we most likely will not need to bother with either `CLASSPATH` or `@CLASSPATH` as there will be a way to upload JAR files (see below) to the database, and the code gets loaded from there. This is somewhat similar to what we do with SQLCLR today, as well as external libraries for R (`CREATE EXTERNAL LIBRARY...`).

## JAR Files

So far, in this post as well as previous posts about **SQL Server 2019 Java** extensions, we have dealt with individual `.class` files, and since the code has just been simple snippets of test code it's okay. In a production environment, outside of SQL Server you would most likely use **JAR** files, as it is common practice and it makes the overall experience more manageable.

JAR stands for **J**ava **AR**chive and is a package file format typically used to aggregate many Java class files and associated metadata and resources (text, images, etc.) into one file for distribution.

To see how this works in SQL Server we start with the `Calculator` class we see in *Code Snippet 2*. Compile it into a class file: `javac Calculator.java`. After compilation, we have a `Calculator.class`, and we want to create a JAR file containing that `Calculator.class` file:

```bash
jar cvf testjar1.jar Calculator.class
```
**Code Snippet 11:** *Create JAR File*

To create a JAR file, we use something called the *Java Archive Tool* which is part of the Java Development Kit (JDK). To invoke the *Java Archive Tool*, we use the `jar` command as we see in *Code Snippet 11*. The options and arguments following the `jar` command in *Code Snippet 11* are (the following is taken from the [Oracle Java Documentation][5]):

* The `c` option indicates that you want to create a JAR file.
* The `v` option produces verbose output while the JAR file builds.
* The `f` option indicates that you want the output to go to a file.
* Following `cvf` is the name of the JAR file you want created.
* The last argument is a space-separated list of one or more files that you want to include in your JAR file. This can contain the `*` wildcard symbol as well as name of directories. 

When I run the code in *Code Snippet 11* I see:

```bash
W:\path_to_my_source_code>jar cvf testjar1.jar Calculator.class
added manifest
adding: Calculator.class(in = 656) (out= 426)(deflated 35%)
```
**Code Snippet 12:** *Output Create JAR File*

In *Code Snippet 12* we see how a manifest file is added, together with the `.class` file. We also see how the `.class` file is compressed. The manifest file is not required as such, and you can use the `M` option to indicate you do not want a manifest file. So now we have a JAR file, what do we do with it?

To begin with, delete everything you have in the `CLASSPATH` location, and also in where `@CLASSPATH` (*Code Snippet 10*) points to. Then copy the `.jar` file created in *Code Snippet 12* to the `CLASSPATH` location. The JAR file contains the `Calculator` class from *Code Snippet 2*, and we may expect to be able to call it as in *Code Snippet 3*. However, when we execute the code we get the same error as in *Figure 1*: `... Failed to find class ...`. So apparently we cannot call a method in a JAR file the same way as in a `.class` file. That makes sense when we see how to call an application in a JAR file from the command line:

```bash
java -jar <jar_file>
```
**Code Snippet 13:** *Calling a JAR File Application*

In *Code Snippet 13* we see how we tell the Java launcher, (`java`), that the application is packaged in a `.jar` file by using the `-jar` flag, and we also point to the actual file. To do this in SQL Server, we need to give the full path to the JAR file in the `@CLASSPATH` variable:

```sql
DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'Calculator.adder'
, @params = N'@CLASSPATH nvarchar(256), @x int, @y int'
, @CLASSPATH = N'C:/javacodepath/testjar1.jar'
, @x = @p1
, @y = @p2 
```  
**Code Snippet 14:** *Calling a Method in a JAR File*

We see in *Code Snippet 14* how we use the `@CLASSPATH` parameter to indicate what JAR file our method is in,  and when we run the code, we get the expected result back.

So what about the scenario when we have a couple of `.class` files and one (or more) is part of a package, like what we discussed related to *Code Snippet 5*? We have:

* The `Calculator` class as in *Code Snippet 2*, compiled to `Calculator.class`.
* The `Calculator` class in a package `mycalculator`, compiled to a separate `Calculator.class`.

Remember what we said above how packages need their own directories, and the `.class` file(s) being inside that directory. I have a directory layout like so:

![](/images/posts/sql_2k19_java_misc_jar_directories.png)

**Figure 5:** *Project Directory Layout*

We see in *Figure 5* how I have a "top" level directory `calcproj`, and in that directory, I have the `.class` file for the `Calculator` class we see in *Code Snippet 2*. Under the `calcproj` directory I have a directory named as the package in *Code Snippet 5*, and inside that directory is the `.class` file for the *Code Snippet 5* `Calculator` class. To create the `.jar` file I run some code like so:

```bash
W:\<path>\calcproj>jar cvfM testjar1.jar *
adding: Calculator.class(in = 656) (out= 426)(deflated 35%)
adding: mycalculator/(in = 0) (out= 0)(stored 0%)
adding: mycalculator/Calculator.class(in = 475) (out= 334) (deflated 29%)
```                                             
**Code Snippet 15:** *Create JAR File*

There are a couple of things to look at in *Code Snippet 15*:

* I use a wildcard in the `jar` command, and this recursively adds `.class` files and directories to the `.jar` file.
* In the output we see how the `mycalculator` directory gets added together with the `Calculator.class` file.

To check that what we see in *Code Snippet 15* is correct we can inspect a `.jar` file by executing: `jar tf testjar1.jar`:

```bash
W:\<path>\calcproj>jar tf testjar1.jar
Calculator.class
mycalculator/
mycalculator/Calculator.class
```
**Code Snippet 16:** *Inspecting JAR File*

What we see in *Code Snippet 16* verifies the output in *Code Snippet 15*. 

After copying the `.jar` file to the location in *Code Snippet 14* (and overwriting the file there) we can execute as usual (including the path to the `.jar` file), and see how it all works:

* `@script=N'Calculator.adder`
* `@script=N'mycalculator.Calculator.adder`

Before I summarize this post, a couple of points about JAR files:

* The location of the JAR file can be wherever Java can get to it.
* The directory where the JAR file needs the usual permissions: `READ` for the `ALL APPLICATION PACKAGES` group.
* The JAR file does not need to be named `.jar`, it can have any extension or even no extension at all.
* If the JAR file is not found where `@CLASSPATH` parameter says it is, Java fallbacks to the `CLASSPATH` and tries to find the class and method as per the `@script` parameter. It does NOT try and find the JAR file.

## Summary

In this blog post we discussed:

* Java packages
* Classpaths
* JAR files

#### Java Packages

We use Java packages to avoid naming conflicts and to keep "like-minded" things together. The compiled `.class` file needs to be in a subdirectory with the same name as the package, and we call it from SQL Server as so: `@script = N'packagename.classname.methodname`. If the package is like `p1.p2`, then we need two directories `p1/p2` and call it like: `@script = N'p1.p2.classname.methodname'`.

#### Classpaths

In [SQL Server 2019 Extensibility Framework & Java - Hello World][1] we discussed the `CLASSPATH` environment variable and said it indicated to Java where our applications are located. In this post, we saw how we could have our applications at other locations and indicate where they are by using the `@CLASSPATH` parameter. When using the `@CLASSPATH` parameter, we need to ensure that the path has the right permissions: `READ` for the `ALL APPLICATION PACKAGES` group.

If we cannot find the method (`ClassName.method`) in the location indicated by the `@CLASSPATH` parameter, we fall back to the location of the `CLASSPATH` environment variable.

#### JAR Files

We use JAR files to typically aggregate many Java class files and associated metadata and resources into one file for distribution. When we use JAR files from SQL Server, we need to explicitly set the path to the JAR file (including the filename) via the `@CLASSPATH` parameter.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright


[1]: {{< relref "2018-12-02-sql-server-2019-extensibility-framework--java---hello-world.md" >}}
[2]: {{< relref "2018-12-08-sql-server-2019-extensibility-framework--java---passing-data.md" >}}
[3]: {{< relref "2018-12-19-sql-server-2019-extensibility-framework--java---null-values.md" >}}
[4]: https://www.guru99.com/java-packages.html
[5]: https://docs.oracle.com/javase/tutorial/deployment/jar/build.html
[sext3]: {{< relref "2018-03-21-microsoft-sql-server-r-services---sp-execute-external-script---iii.markdown" >}}
