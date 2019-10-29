---
type: post
layout: "post"
title: "SQL Server 2019 & Java: Parameters"
author: nielsb
date: 
comments: true
highlight: true
draft: true
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
description: 
keywords:
  -   
---

Microsoft introduced the ability to call Java code from SQL Server in around the SQL Server 2019 CTP 2.0 release, and I have written some posts posts about this:

* [**SQL Server 2019 Extensibility Framework & Java**](/s2k19_ext_framework_java).

Throughout the CTP releases some functionality has changed, and in CTP 2.5 Microsoft introduced the Java Language Extension SDK. The Java code we write needs now to include the Java SDK and also extend an abstract base from the SDK.

With the introduction of the Java Language SDK, came some changes to how you handle method parameters, and I touched upon it briefly in the [**Java & SQL Server 2019 Extensibility Framework: The Sequel**][1] post. In this post, I want to look more in detail at parameters and how to handle them.

<!--more-->

## Java Code in SQL Refresh

If you have not done any Java code in SQL Server, or at least not recently, here are some posts which introduce you to Java in SQL Server:

* [**SQL Server 2019, Java & External Libraries - I**][5]. Part I of a couple of posts where we look at how we can deploy Java code to the database, so it can be loaded from there.
* [**Java & SQL Server 2019 Extensibility Framework: The Sequel**][1]. We look at the implications of the introduction of the Java Language Extension SDK.
* [**SQL Server 2019 Extensibility Framework & External Languages**][2]. We look at SQL Server 2019 Extensibility Framework and Language Extensions.
* [**SQL Server 2019 CTP3.2 & Java**][3]. SQL Server 2019 CTP 3.2 and Azule OpenJDK.
* [**SQL Server 2019 & Java Null Handling: Take Two**][6]. We take a second look at how to handle null values in datasets being passed to and from Java code.

## Parameter Recap

Let us take a lok back at parameters to refresh our memory. Pre CTP 2.5, (and the Java Language SDK), you declared parameters as class variables with the same name as the SQL parameters but without the `@`. The Java C++ language extension then populated the values from the input. We declare the parameters like so:

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

We see in *Code Snippet 1* how we have declared two parameters: `@x`, and `@y`. When we execute the code the Java C++ language extension gets the parameter values, and, pre CTP 2.5, looks in the code for two class level variables named `x`, and `y`, and assigns the values to those variables.

The way we call into Java after the introduction of the Java Language SDK is that we call into a class extending `AbstractSqlServerExtensionExecutor`. The Java C++ language extension executes the `execute` method which we need to implement. 

The `execute` method signature looks like so:

```java

```




![](/images/posts/<image_name_incl_ext>)

**Figure 1:** **

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright


<!--
  post reference
  [pkg1]: {{< relref "" >}}
-->  



[1]: {{< relref "2019-05-26-java--sql-server-2019-extensibility-framework-the-sequel.md" >}}
[2]: {{< relref "2019-06-06-sql-server-2019-extensibility-framework--external-languages.md" >}}
[3]: {{< relref "2019-08-03-sql-server-2019-ctp32--java.md" >}}
[4]: {{< relref "2018-12-19-sql-server-2019-extensibility-framework--java---null-values.md" >}}
[5]: {{< relref "2019-03-10-sql-server-2019-java--external-libraries---i.md" >}}
[6]: {{< relref "2019-10-26-sql-server-2019--java-null-handling-take-two.md" >}}
[7]: 
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:   

<!--
[series1]: <> [SQL Server R Services](/series/sql_server_2k16_r_services)
[series2]: <> [Install R Packages in SQL Server ML Services](/series/sql_server_ml_services_install_packages)
[series3]: <> [sp_execute_external_script and SQL Server Compute Context](/series/spees_and_sql_compute_context)
-->

<!--
[findstr]: <> findstr /I \<word_to_find\> *
-->