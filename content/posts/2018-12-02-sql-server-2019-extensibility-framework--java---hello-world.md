---
type: post
layout: "post"
title: "SQL Server 2019 Extensibility Framework & Java - Hello World"
author: nielsb
date: 2018-12-02T09:36:34+02:00
comments: true
highlight: true
draft: false
categories:
  - SQL Server 2019
  - SQL Server Machine Learning Services
  - SQL Server Extensibility Framework 
tags:
  - SQL Server 2019
  - SQL Server Machine Learning Services 
  - R
  - Python
  - Java
description: We look at how we install and enable Java extensions in SQL Server 2019, and a couple of simple Java methods.
keywords:
  - SQL Server 2019
  - SQL Server Machine Learning Services 
  - R
  - Python
  - Java   
---

The SQL Server 2016 release introduced the **SQL Server Extensibility Framework** (EF), which gives us the ability to, from inside SQL Server, execute code in an external language runtime environment. SQL Server 2016 supports R as external runtime, and Microsoft added Python to supported runtimes in the SQL Server 2017 release. The important part about the EF is that the runtime is outside of the core database engine, but we call it from inside SQL Server via the stored procedure `sp_execute_external_script`. We can push data from SQL Server queries to the external runtime, and consume data, (resultsets, output parameters) from the external runtime back in SQL Server.  

> **NOTE:** You can read more about the actual implementation of the external runtimes and `sp_execute_external_script` in my [SQL Server R Services Series](/sql_server_2k16_r_services) posts.

In SQL Server 2019 Microsoft added the ability to execute custom Java code along the same lines we execute R and Python, and this blog post intends to give an introduction of how to install and enable the Java extension, as well as execute some very basic Java code. In future posts, I drill down how to pass data back and forth between SQL Server and Java.

To see what other posts there are in the series, go to [**SQL Server 2019 Extensibility Framework & Java**](/s2k19_ext_framework_java).

<!--more-->

There may very well be future posts discussing how the internals differ between Java and R/Python, but I want to talk about that a little bit in this post as well, as it has an impact on how we write and call Java code. 

## R/Python Basics

In my [SQL Server R Services](/sql_server_2k16_r_services) series  talked about the components which make up **SQL Server Machine Learning Services**, and we saw how the flow when we execute an external script, looks something like so: 

![](/images/posts/sql_2k19_java_intro_flow1.png)

**Figure 1:** *Components & Flow*

We see in *Figure 1* what happens when we execute an R or Python script:

* Inside SQL Server we execute `sp_execute_external_script` and we send in the language as a parameter.
* A connection happens to the *Launchpad* service and the service calls into an R or Python launcher (based on the `@language` parameter).
* The launcher launches either the R or Python process.
* Through a proprietary link dll, the *BxlServer* process gets launched.
* In the process is the `SqlSatellite.dll` which handles data transfers.

In the case of either R or Python, the execution of the script happens in the *BxlServer* process. A couple of things to keep in mind for later when we look at what we do when executing Java code:

* R/Python gets installed when we install SQL Server and choose In-Database machine learning. As R/Python is installed together with SQL Server, SQL gets implicit permissions to the R/Python exe's.
* Even though we install open source versions of R/Python, they come together with proprietary dll's and exe's.
* When we execute external scripts, we execute just that - scripts, and we pass in the code in the `sp_execute_external_script` call. 

Before we look at a how Java compares to the above, let us look at how we install and enable the Java extension.

## Installing Java Extensions

The way we install and enable Java on SQL Server differs depending on if you run SQL Server on Windows or Linux.

#### Windows

You enable the ability to execute Java code, the same way as you do with R/Python. At install time, or when you add features, you check the *Machine Learning Services (In-Database)* checkbox:

![](/images/posts/sql_2k19_java_intro_install1.png)

**Figure 2:** *Enable In-Database Machine Learning*

In *Figure 2* we see how I have in the *Feature Selection* dialog checked the Machine Learning Services checkbox only. To enable Java, I do not need to choose either R or Python, the "top-level" *Machine Learning Services* is enough. Checking that, ensures that the required components, (*Launchpad*, and so on), gets installed.

> **NOTE:** A future post covers the various components.

When you install/add *Machine Learning Services* on Windows, you need to be aware that Java not gets installed. See below for more about that.

#### Linux

When we install SQL Server on Linux, we do not have a "nice" UI, but we install via the shell. Similarly, when you want to install *Machine Learning Services* you do it via the shell. So to install only the Java extension you:

```bash
sudo apt-get install mssql-server-extensibility-java
```
**Code Snippet 1:** *Install Java Extension on Linux*

In *Code Snippet 1* we see how I use the Ubuntu package manager to install the Java extension on an already installed *SQL Server on Linux* instance. Of course, you can install the instance as well as the Java extension in one go:

```bash
sudo apt-get install mssql-server mssql-server-extensibility-java
```
**Code Snippet 2:** *Install SQL Server and Java Extension Together*

A difference between the install on Linux vs the Windows install is that on Linux Java 1.8.x gets installed if it is not already on the box.

#### Enabling External Scripts

On both Windows and Java we need to enable the execution of external scripts after installation:

```sql
EXEC sp_configure 'external scripts enabled', 1
RECONFIGURE WITH OVERRIDE
```
**Code Snippet 3:** *Enable External Scripts*

You may remember that when we executed the code in *Code Snippet 3* in SQL Server 2016, and 2017 we had to restart the SQL Server instance afterwards to make the change "stick". In SQL Server 2019 that is no longer necessary, (at least from CTP 2.1 and later), you just run the code and the setting changes!

## Windows and Java

When we run `mssql-server-extensibility-java` as in *Code Snippet 1* (or *Code Snippet 2*), I mentioned that Java 1.8.x gets installed if it is not already on the box. The installation also takes care of permissions as well as paths to the JVM. On Windows, this is not the case, so in this section, I talk a little bit about what you need to do if you are on Windows. More specifically we discuss Java versions, environment variables, and permissions.

> **NOTE:** If you are on Linux have a look below where I mention `CLASSPATH.`

#### Java Version

As enabling *Machine Learning Services* does not install Java (on Windows), you need to ensure you already have a compatible version of Java on the box, or that you install one. On Windows, the suggestion for CTP 2.0 was version 1.10.x. However, Oracle no longer supports that Java version, so for CTP 2.1 the recommended version is 1.8.x, which is the same version recommended for SQL Server 2019 on Linux.

#### Environment Variables

When you do a typical installation of Java on Windows, you (or the installation program) also set some environment variables, so that applications can find the various Java dependencies: 

* Set the `Path` environment variable to point to the `bin` directory of the JDK or JRE installation.
* Create a `JAVA_HOME` environment variable pointing to the JDK/JRE top-level directory.

When installing Java 1.8.x to use by *Machine Learning Services* you do not need the `JAVA_HOME` variable. However, other applications may need it, so I suggest you set it unless it is already set. 

One crucial thing to be aware of is that the `Path` variable needs to be extended to include the directory where the `jvm.dll` exists. So, even if the `Path` includes the JDK/JRE `bin` directory, you need to edit the path to include the directory where the `jvm.dll` exists. The easiest way to do it (once again, this is Windows) is to use the UI: **Control Panel->All Control Panel Items->System->Advanced System Setttings->Environment Variables->System Variables->Path->Edit**:

![](/images/posts/sql_2k19_java_intro_path.png)

**Figure 3:** *Set Path*

We see in *Figure 3* how I in the *Edit environment variable* dialog:

* Click *New* (outlined in blue).
* Add the path in the text box (highlighted in red).

I then click *Ok* in the various screens to exit out of there. 

So far in this section, the discussion has been around things related to Java on Windows. The next thing I want to mention is as equally relevant for Windows as for Linux, and it is the Java `CLASSPATH` environment variable.

Remember what I mentioned above; when we use R or Python in *Machine Learning Services* we send in the script to execute as a parameter in the call. For Java, we execute against compiled code, and somehow we need to let the external engine know where the code is. That is where the `CLASSPATH` variable comes in. The `CLASSPATH` variable is there so that the Java Compiler and Java Runtime can find Java classes referenced in your program. It maintains a list of directories (containing many Java class files) and JAR file (a single-file archive of Java classes).

To create the `CLASSPATH` variable on Windows I use the UI: **Control Panel->All Control Panel Items->System->Advanced System Setttings->Environment Variables->System Variables**, and click *New* in the *Environment Variables* dialog:

![](/images/posts/sql_2k19_java_intro_classpathpath.png)

**Figure 4:** *Create CLASSPATH Windows*

In *Figure 4*, after clicking *New*:

* I entered `CLASSPATH` in the *Variable name* text box (outlined in blue).
* In the *Variable value* text box, (outlined in red), I entered the actual path where my compiled java code is located. 

If the `CLASSPATH` variable already exists, but you want your code in another location than where the variable points to, you can add a new path to the existing. In Windows, you delimit the paths with a semi-colon, and in Linux with a colon. 

For completeness let us see how you create/set the `CLASSPATH` in Linux: 

```bash
export CLASSPATH="/path/to/directory:/path/to/directory2:$CLASSPATH"
```
**Code Snippet 4:** *Setting CLASSPATH in Linux*

The code we see in *Code Snippet 4* adds two new directories to the existing `CLASSPATH` variable, delimited with colons.

> **NOTE:** It is not absolutely necessary to have the `CLASSPATH` variable set. In [SQL Server 2019 Extensibility Framework & Java - Misc. 'Stuff'][1] we see how we can do without it.

#### Permissions

The last thing we need to do is to set permissions on the `CLASSPATH` directory.

> **NOTE:** The following is based on what I found using CTP 2.1. This may change in future releases.

On Windows, right click on the directory(s) in the `CLASSPATH`, followed by **Properties->Security**, and you see something like so:

![](/images/posts/sql_2k19_java_intro_classpathpath_sec1.png)

**Figure 5:** *Security Tab for CLASSPATH*

In *Figure 5* we see how we are in the *Security* tab, and from here we can **Edit->Add** permissions, which gives us the ability to add permissions for users/groups:

![](/images/posts/sql_2k19_java_intro_classpathpath_sec2.png)

**Figure 6:** *Security Tab for CLASSPATH*

The group we want to add permissions for is `ALL APPLICATION PACKAGES`, as we see in *Figure 6*. Clicking *OK* allows us to assign the permissions needed:

![](/images/posts/sql_2k19_java_intro_classpathpath_sec3.png)

**Figure 7:** *Security Tab for CLASSPATH*

The required permission needed for `ALL APPLICATION PACKAGES` is `Read` as in *Figure 7*. After we click *OK* out of the dialogs, we are finally ready to write and execute code on Windows.

On Linux you need to give read and execute permissions on the `CLASSPATH` directory to the `mssql_satellite` user.

## Java Code

There are certain things to think about when we write Java code which we want to call from SQL Server:

* We have no way, from calling from SQL Server to `new` "up" a class to get a reference to the class and call methods on that reference.
* All methods called from SQL Server need to be `public static`. This is similar to SQLCLR. However, static methods can `new` "up" a class and call methods on the reference.
* The static methods can not have a return type, they need to be `public static void`.
* The methods must be parameterless!
* No support for output parameters.

The two first points above are probably not that too much of a hindrance, after all, this is the same as with SQLCLR. The last three, however, is more of a pain, and shortly we see how we work around the parameterless restriction.

So, let us write some code, and we start with "Hello World":

```java
public class JavaTest1{
  
  public static void helloWorld() {
    System.out.print("Hello World from SQL Java");
  }
}
```
**Code Snippet 5:** *Java Hello World - I*

In *Code Snippet 5* we see your typical "Hello World" Java application. Copy the code into a file and name the file `JavaTest1.java`. Then compile it into a `class` file:

```bash
javac JavaTest1.java
```
**Code Snippet 6:** *Compile Java Code*

After executing the code in *Code Snippet 6*, copy the `class` file to the location of your `CLASSPATH` variable. When the `class` file is in the `CLASSPATH` directory, we try and call it from SQL:

```sql
EXEC sp_execute_external_script 
                  @language = N'Java'
                , @script = N'JavaTest1.helloWorld'
```
**Code Snippet 7:** *Execute Hello World*

The only real difference we see in *Code Snippet 7* when executing Java code, compared to R/Python is that we call into the method we want to execute as opposed to send in the script.

> **NOTE:** If you want a refresher about `sp_execute_external_script`, have a look at these three blog posts:

> * [Microsoft SQL Server R Services: sp_execute_external_script - I][sext1]
> * [Microsoft SQL Server R Services - sp_execute_external_script - II][sext2]
> * [Microsoft SQL Server R Services: sp_execute_external_script - III][sext3]

So, the code in *Code Snippet 7* looks very straightforward, but when we execute, the result is this:

![](/images/posts/sql_2k19_java_intro_error1.png)

**Figure 8:** *Execution Exception*

Hmm, in *Figure 8* we see an exception about how we miss a member `numberOfOutputCols` in the class. What is this? So, in R/Python, there is a much "tighter" integration between SQL Server and the external runtime than between SQL Server and Java. Also, once again, with Java, we execute already compiled code whereas we in R/Python execute scripts. This all means that we don't have the same control over the runtime in Java, and we need to use "magic" variables to indicate to Java what we want to do. The `numberOfOutputCols` variable is such a variable, and the components that call into Java expects to find this variable. In this case, the variable is not there, so, therefore, the exception. However, take a look at the exception. Before the `Error: ...`, we do see the output from `System.out.print`, so all is not lost :).

> **NOTE:** As I mentioned above, in future blog posts I cover the various components that make the Java integration work.

#### numberOfOutputCols

Above I said that `numberOfOutputCols` is a "magic" variable and that there are others as well. In future posts we cover the others, here we look at what `numberOfOutputCols` does. 

First, all the "magic" variables have to do with passing of data between SQL Server and Java, and `numberOfOutputCols` indicates the number of columns you return to the calling code. In our code in *Code Snippet 5* we do not return anything, but the variable is still expected to be there. So, let us change the code slightly:

```java
public class JavaTest1{
  public static short numberOfOutputCols;
  public static void helloWorld() {
    System.out.print("Hello World from SQL Java");
  }
}
```
**Code Snippet 8:** *Java Hello World - II*

In *Code Snippet 8* I added `numberOfOutputCols` as a class member. I recompile the code and copy the `class` file to `CLASSPATH`, and when I execute as in *Code Snippet 7*, all works! Yes, I have successfully executed my first Java application from inside SQL Server.

> **NOTE:** The `numberOfOutputCols` variables has to be declared as `public static` and `short` as data type. Any other data type, and you get an exception.

That was easy, what about something slightly more complicated, like a method expecting parameters?

#### Method Parameters

We want to add some basic calculator capabilities to our `JavaTest1` class because it is almost a law that after the obligatory "Hello World" application we need to write an adder method :). A typical Java `adder` method might look like so:

```java
public static int adder(int x, int y) {
  return x + y;
}
```
**Code Snippet 9:** *Java Adder*

The problem with the code above, (if we want to use it from SQL Server), is twofold:

* It expects parameters to be passed in to the `adder` method.
* It has a return type (`int`).

So how do we turn the code in *Code Snippet 9* into something we can execute from SQL Server?

We need to figure out what to do with the parameters (`x` and `y`), and the return type. The parameters cannot be parameters in the method, but potentially variables in the class. As for the return type, for now, we just print the result:

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
**Code Snippet 10:** *Java Adder Using Class Variables*

The code in *Code Snippet 10*, looks like it should work, so recompile and place the compiled code in `CLASSPATH`. We can now execute, but the question is how we pass in the parameters, and how the Java code knows what they are?

In [Microsoft SQL Server R Services - sp_execute_external_script - II][sext2] I wrote about parameters for scripts when we execute `sp_execute_external_script`:

* For parameters in R/Python scripts we declare them in SQL appending `@` to the R/Python name.
* We define the SQL parameters in `sp_execute_external_script`'s `@params` parameter.
* We add the SQL parameters as named parameters in `sp_execute_external_script`.

For Java code we do the same, so the SQL code looks something like so:

```sql
DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'JavaTest1.adder'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2   
GO
```
**Code Snippet 11:** *Execute SQL Code with Parameters*

As we see in *Code Snippet 11*, I have added the Java `x` and `y` class members to the `@params` parameter as SQL parameters: `@x` and `@y`. I then add the `@x` and `@y` parameters as named parameters, and assign them values from the declared parameters `@p1` and `@p2`. When I execute the code in *Code Snippet 11*, I see this:

![](/images/posts/sql_2k19_java_intro_exec_params.png)

**Figure 9:** *Execution with Parameters*

As we see in *Figure 9* it works and, outlined in red, we get the result printed out. Happy Times! 

## Summary

In this post we saw how we install and enable the Java extensions for SQL Server 2019:

* On Windows you install them via the *Machine Learning Services* feature during setup or when adding features.
* In Linux you install by installing the package: `mssql-server-extensibility-java`.
* Unless the `external scripts enabled` configuration option is already enabled you need to enable it as in *Code Snippet 3*.
* The Java supported version on both Windows and Linux is version 1.8.x (at least for CTP 2.1).
* On Linux, when you install the `mssql-server-extensibility-java` package, the correct Java version gets installed if it is not on the box already.
* On Windows, you have to install the correct version manually if it is not installed.
* On Windows, the `Path` system environment variable needs to be extended to include the directory where `jvm.dll` exists.
* It is good practice to create an environment variable called `CLASSPATH` which indicates where your compiled Java code exists.
* On Windows you need to give `Read` permissions on the `CLASSPATH` directory to `ALL APPLICATION PACKAGES`.
* On Linux you need to give `Read` and `Execute` permissions on the on the `CLASSPATH` directory to the `mssql_satellite` user.

So, when the Java extensions are enabled we can write and execute Java code:

* We execute Java code from SQL Server using `sp_execute_external_script`.
* We define the class and method we call in the `@script` parameter.
* All methods called from SQL Server need to be `public static`.
* The static methods can not have a return type, they need to be `public static void`.
* The methods must be parameterless.
* No support for output parameters.
* The code needs to contain "magic" `public static` class members.
* One such member is `numberOfOutputCols` which is always required. It has to be declared as: `public static short numberOfOutputCols;`.
* Even though the methods must be parameterless we can pass in parameters as class members.
* We refer to the class member parameters in SQL with the same name as the Java names but appended with `@`.
* We define the SQL parameters in `sp_execute_external_script`'s `@params` parameter.
* We add the SQL parameters as named parameters in `sp_execute_external_script`.

So far, the code we have used is very simple. In the next post we look at how we can return data to the caller, and how we pass data sets around.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[sext1]: {{< relref "2018-03-07-microsoft-sql-server-r-services-sp_execute_external_script-I.markdown" >}}
[sext2]: {{< relref "2018-03-11-microsoft-sql-server-r-services---sp-execute-external-script---ii.markdown" >}}
[sext3]: {{< relref "2018-03-21-microsoft-sql-server-r-services---sp-execute-external-script---iii.markdown" >}}

[1]: {{< relref "2018-12-30-sql-server-2019-extensibility-framework--java---misc-stuff.md" >}}