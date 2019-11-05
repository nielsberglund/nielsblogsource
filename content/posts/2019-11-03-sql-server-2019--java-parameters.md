---
type: post
layout: "post"
title: "SQL Server 2019 & Java: Parameters"
author: nielsb
date: 2019-11-03T11:07:23+02:00
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
description: We discuss how to handle parameters between SQL Server and Java, as well as discussing the support of output parameters.
keywords:
  - SQL Server 2019
  - R
  - Python
  - Java
  - SQL Server Extensibility Framework   
---

Microsoft introduced the ability to call Java code from SQL Server in around the SQL Server 2019 CTP 2.0 release, and I have written some posts posts about this:

* [**SQL Server 2019 Extensibility Framework & Java**](/s2k19_ext_framework_java).

Throughout the CTP releases some functionality has changed, and in CTP 2.5 Microsoft introduced the Java Language Extension SDK. The Java code we write needs now to include the Java SDK and extend an abstract base from the SDK.

With the introduction of the Java Language SDK, came some changes to how you handle method parameters, and I touched upon it briefly in the [**Java & SQL Server 2019 Extensibility Framework: The Sequel**][1] post. In this post, I want to look more in detail at parameters and how to handle them.

<!--more-->

> **DISCLAIMER:** *This post contains Java code. I am not a Java guy, in fact, the only Java I have ever written is the code for the SQL Server 2019 Java posts. So, the code is not elegant in any shape or form, and I am absolutely certain it can be done in a much better way. However, this is not about Java as such, but how you call Java code from SQL Server, and what you need to implement on the Java side.*

## Java Code in SQL Refresh

If you have not done any Java code in SQL Server, or at least not recently, here are some posts which introduce you to Java in SQL Server:

* [**SQL Server 2019, Java & External Libraries - I**][5]. Part I of a couple of posts where we look at how we can deploy Java code to the database, so it can be loaded from there.
* [**Java & SQL Server 2019 Extensibility Framework: The Sequel**][1]. We look at the implications of the introduction of the Java Language Extension SDK.
* [**SQL Server 2019 Extensibility Framework & External Languages**][2]. We look at SQL Server 2019 Extensibility Framework and Language Extensions.
* [**SQL Server 2019 CTP3.2 & Java**][3]. SQL Server 2019 CTP 3.2 and Azule OpenJDK.
* [**SQL Server 2019 & Java Null Handling: Take Two**][6]. We take a second look at how to handle null values in datasets being passed to and from Java code.

## Pre-req

If you want to follow along with what we are doing in this post, you need:

* A SQL Server 2019 CTP 3.0, (or later), instance. 
* A database where you have registered Java as a language. Read [this post][2] if you are unsure how to register Java as an external language.
* The Java Language SDK deployed to the database above. [This post][1] explains how.
* Understand how to deploy Java code to the database. The post [here][5] helps with that.

You also need an editor with which you can write Java code. I am partial to **Visual Studio Code** myself, and I wrote a post about VS Code and Java [here][7]. 

## Parameter Recap

Let us take a look back at parameters to refresh our memory. 

#### BJLSDK (Before Java Language SDK) 

Before the introduction of the Java Language SDK, (before CTP 2.5), you called into a method specified in the `@script` variable of the `sp_execute_external_script`, (SPEES), procedure. You defined the parameters you wanted to send to the Java code as class variables with the same name as the SQL parameters but without the `@`:

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
**Code Snippet 1** *Call from T-SQL to Java with Parameters*

We see in *Code Snippet 1* how we want to call into the `adder` method in the `JavaTest1` class, passing in two parameters: `@x`, and `@y`. When we execute the code the Java C++ language extension gets the parameter values, and looks in the code for two class-level variables named `x`, and `y`, and assigns the values to those variables. The `adder` method then uses `x`, and `y`.

#### AJLSDK (After Java Language SDK)

I mentioned above how a couple of things changed after Microsoft introduced the Java Language SDK. One of them was that you no longer define a method in SPEES's `@script` parameter. The parameter instead defines a class you want to call into. 

The class must extend the `AbstractSqlServerExtensionExecutor` abstract base class and implement the `execute` method from the base class. The `execute` method is the method the Java C++ language extension calls into, and the signature looks like so:

```java
public AbstractSqlServerExtensionDataset execute(
                                AbstractSqlServerExtensionDataset input, 
                                LinkedHashMap<String, Object> params) {
  throw new UnsupportedOperationException("AbstractSqlServerExtensionExecutor 
                                          execute() is not implemented");
}
```
**Code Snippet 2** *The `execute` Method*

From the signature in *Code Snippet 2* we see how the `execute` method takes two parameters and has a return type. 

To call into Java after the introduction of the Java Language SDK has not changed much:

```sql
DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'sql.JavaTest1'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2   
GO
```
**Code Snippet 3:** *Call from T-SQL to Java with Parameters*

The only real difference between *Code Snippet 3* and *Code Snippet 2* is that the `@script` parameter is now `package.class`, instead of `class.method`.

For the parameters the Java C++ language extension creates a new instance of a `LinkedHashMap` and populates it with the parameter names, (sans `@`), and the values. 

## Parameters

Having the recap out of the way, let us see how we handle the parameters in our Java code. Let us first start with some skeleton code:

``` java
package sql;

import com.microsoft.sqlserver.javalangextension.*;
import java.util.LinkedHashMap;

public class JavaTest1 extends AbstractSqlServerExtensionExecutor {

  public JavaTest1() {
    executorExtensionVersion = SQLSERVER_JAVA_LANG_EXTENSION_V1;
    executorInputDatasetClassName = PrimitiveDataset.class.getName();
    executorOutputDatasetClassName = PrimitiveDataset.class.getName();
  }

  public PrimitiveDataset execute(PrimitiveDataset input, 
                                  LinkedHashMap<String, Object> params) {
    
    return null;

  }
}
``` 
**Code Snippet 4:** *Java Starter Code*

We see in *Code Snippet 4* that we have a class, `JavaTest1`, which extends the `AbstractSqlServerExtensionExecutor` class. In the constructor, we set some required class members, and the `execute` method is empty.

> **NOTE:** The post [**Java & SQL Server 2019 Extensibility Framework: The Sequel**][1] explains about the constructor in *Code Snippet 4*.

The code we want to write is to handle the parameters we send in when we execute the code in *Code Snippet 3*, and in our code, we want to add the two parameters together. With that in mind, our code looks like so:

``` java
public PrimitiveDataset execute(PrimitiveDataset input, 
                                LinkedHashMap<String, Object> params) {

  int x = (int)params.get("x");
  int y = (int)params.get("y");
  System.out.printf("The result of adding %d and %d = %d", x, y, x + y);
  return null;
}
```
**Code Snippet 5:** *Handle Parameters*

We see in *Code Snippet 5* how we handle the parameters that come in from SQL Server:

* As we said above, the Java C++ language extension populates the `LinkedHashMap` with the parameters from SQL Server, so we retrieve the `x` and `y` using the `get` method. As the `get` method returns an object, we cast it to `int`.
* We then add `x` and `y` together and we call `printf` to show the result.

After we compile and package the code into a `.jar` file we deploy to our database:

``` sql
CREATE EXTERNAL LIBRARY SqlParamLib 
FROM (CONTENT = 'W:\sql-params-1.0.jar')
WITH (LANGUAGE = 'Java');
```
**Code Snippet 6:** *Deploy to the Database*

From *Code Snippet 6* we see how I deploy to my SQL Server based on a file-path: `W:\sql-params-1.0.jar`, and how I indicate that what I deploy is Java code: `LANGUAGE = 'Java'`. The post [**SQL Server 2019, Java & External Libraries - I**][5] covers in detail how to deploy Java code to SQL Server.

> **NOTE:** I can use a file path when I deploy as my SQL Server is on my local machine.

When we have deployed as in *Code Snippet 6* we execute the code in *Code Snippet 3*:

![](/images/posts/sql-2k19-java-params-add.png)

**Figure 1:** *Add Result*

In *Figure 1* we see that our code worked, cool!

#### Null Values

Now then, what if one of the parameters in *Code Snippet 3* is not `DECLARE`:ed and set, but instead generated by something, (perhaps a `SELECT`), and it doesn't have a value:

``` sql
DECLARE @p1 int;
DECLARE @p2 int;

SELECT @p1 = null, @p2 = 21;

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'sql.JavaTest1'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2   
GO
```
**Code Snippet 7:** *Null Parameter*

In *Code Snippet 7* we see how we retrieve the values of the two parameters, and one is null, (no value). Let us see what happens when we execute the code:

![](/images/posts/sql-2k19-java-params-null.png)

**Figure 2:** *Null Parameter*

Hmm, not good, we get a `NullPointerException` as we see in *Figure 2*. As a Java developer, this is what you would expect, whereas if we executed similar code in T-SQL, it would work - but the result would be `NULL`. I wrote [here][6] about null handling in datasets, and how there is a "convenience" method `getColumnNullMap` which indicates null values for a column in the dataset.

Unfortunately, we do not have the same for parameters, so we need to handle it ourselves. Since the parameter value's type in the `LinkedHashMap` is an `Object`, we should be able to do a null check quite easily before we do the cast. Alternatively, we can use the primitive type's wrapper class to accomplish the same thing:

``` java
public PrimitiveDataset execute(PrimitiveDataset input, 
                                LinkedHashMap<String, Object> params) {

  boolean isNull = false;

  Integer x = (Integer)params.get("x");
  Integer y = (Integer)params.get("y");

  if(x == null || y == null) {
    isNull = true;
  }

  if(isNull) {
    String xStr = x != null ? x.toString() : "null";
    String yStr = y != null ? y.toString() : "null";
    System.out.printf("The result of adding %s and %s = %s", 
                       xStr, yStr, "null");
  }
  else {
    System.out.printf("The result of adding %d and %d = %d", 
                       x, y, x + y);
  }

  return null;
}
```
**Code Snippet 8:** *Handle Null Parameter*

In *Code Snippet 8* we see an example of how we can handle null parameters. As you see in the code snippet, we use the `Integer` wrapper class for `int`. Our logic is that if we get a null value, then the result should also be null.

#### Output Parameters

In SQL Server, when we execute a procedure, we can return values as output parameters, and the way we indicate that a parameter is for output is by using the `OUT` statement:

``` sql
DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
DECLARE @ret int;
EXEC dbo.pr_MyAdder @x = @p1,
                    @y = @p2,
                    @retVal = @ret OUT;
SELECT @ret AS ReturnValue;                    
```                    
**Code Snippet 9:** *Output Parameters - I* 

We see in *Code Snippet 9* how we assign `@ret` as an output parameter and then select the value after the execution of the procedure.

How do we do this in Java? Well, initially output parameters were not supported, but that changed with SQL Server CTP 3.0, (or 3.1). The reason why output parameters were not supported was that the Java C++ language extension did not have an implementation for output parameters. However, as I said above - that changed in CTP 3.0/3.1, and output parameters are now part of the `LinkedHashMap` parameter.

The Java C++ language extension populates, as I said above, the `LinkedHashMap` and since it is a reference type when the call returns the Java C++ language extension loops through the parameters and outputs the parameters adorned with `OUT`, (or `OUTPUT`).

The code to implement output parameters in our Java code looks like so:

``` java
public PrimitiveDataset execute(PrimitiveDataset input, 
                                LinkedHashMap<String, Object> params) {

  boolean isNull = false;

  Integer x = (Integer)params.get("x");
  Integer y = (Integer)params.get("y");
  Integer retVal = (Integer)params.get("retVal");

  if(x == null || y == null) {
    isNull = true;
  }

  if(isNull) {
    params.put("retVal", null);
  }
  else {
    params.put("retVal", x + y);
  }

  return null;
}
```
**Code Snippet 10:** *Output Parameters in Java*

We see in *Code Snippet 10* how we have changed the Java code to return the result of the addition of `x` and `y` as an output parameter. We retrieve the `x` and `y` values as before, and dependent on whether `x` or `y` is null or not we either `put` the `retVal` parameter as `null` or the result of the addition.

> **NOTE:** It is not necessary to retrieve the `retVal` parameter as in *Code Snippet 10* since in this case, it is a pure output parameter. SQL Server, however, allows output parameters both to be used as in as out. So in your Java code, you may get a value coming in for an output parameter.

The SQL code to execute against the code in *Code Snippet 10* looks like so:

``` sql
DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
DECLARE @ret int;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'sql.JavaTest1'
, @params = N'@x int, @y int, @retVal int OUT'
, @x = @p1
, @y = @p2  
, @retVal = @ret OUT;

SELECT @ret AS ReturnValue;
GO
```
**Code Snippet 11:** *Output Parameters - II*

We see in *Code Snippet 11* how we:

* Declare a third parameter`@ret`.
* In the `@params` parameter we define the `@retVal` parameter.
* Assign `@ret` to `@retVal`.

The result of executing the code in *Code Snippet 11* is:

![](/images/posts/sql-2k19-java-params-outputparam.png)

**Figure 3:** *Output Parameter*

As we see in *Figure 3* it works. If we were to send in null for `@x` or `@y`, we get back `NULL` in the `SELECT`.

## Summary

In this post, we saw how to handle parameters, and we said:

* The `LinkedHashMap` parameter in the `execute` method exposes parameters.
* For primitive data type parameters, we can use Java's wrapper classes to handle null values.
* The Java C++ language extension handles now output parameters.
* We assign a value to an output parameter by doing a `put`. 
 
## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[1]: {{< relref "2019-05-26-java--sql-server-2019-extensibility-framework-the-sequel.md" >}}
[2]: {{< relref "2019-06-06-sql-server-2019-extensibility-framework--external-languages.md" >}}
[3]: {{< relref "2019-08-03-sql-server-2019-ctp32--java.md" >}}
[4]: {{< relref "2018-12-19-sql-server-2019-extensibility-framework--java---null-values.md" >}}
[5]: {{< relref "2019-03-10-sql-server-2019-java--external-libraries---i.md" >}}
[6]: {{< relref "2019-10-26-sql-server-2019--java-null-handling-take-two.md" >}}
[7]: {{< relref "2019-01-17-sql-server-2019--java-with-visual-studio-code.md" >}}
