---
type: post
layout: "post"
title: "SQL Server 2019 CTP3.2 & Java"
author: nielsb
date: 2019-08-03T06:55:33+02:00
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
description: SQL Server 2019 CTP 3.2 and Azule OpenJDK. 
keywords:
  - SQL Server 2019
  - R
  - Python
  - Java
  - SQL Server Extensibility Framework   
---

It seems that for each new SQL Server 2019 CTP release, there are changes to the Java extensions, and CTP 3.2 is no exception. Well, that is not exactly true as in CTP 3.2 release the changes are not about the extension and how we write code, but Java itself.

One of the [announcements][1] of what is new in CTP 3.2 was that SQL Server now includes [Azul System's][2] Zulu Embedded right out of the box for all scenarios where we use Java in SQL Server, including Java extensibility. 

So, in this post, we look at the impact, (if any), this has to how we use the Java extensibility framework in SQL Server 2019.

<!--more-->

First of all, I find Microsoft's change of stance related to Java very interesting as I remember back in the day the [battle][3] between Sun and Microsoft regarding Java and the subsequent Java vs .NET "war". 

> **NOTE:** Around 1995/96 I attended a Microsoft event in London where Microsoft introduced what was to be Visual J++. It went under the code name "Jakarta". The MS people presenting at the conference explained why they chose that name: *Jakarta is the capital of Java*. That was not entirely true as Jakarta is the capital of Indonesia, but Java is the largest island, so...

Anyway, let us get on with it, and see what happens when we install SQL Server 2019 CTP 3.2.

## Installation

You may remember from [SQL Server 2019 Extensibility Framework & Java - Hello World][5] that to enable Java in SQL Server 2019; you have to - during installation - choose the *Machine Learning Services* feature:

![](/images/posts/sql_2k19_java_intro_install1.png)

**Figure 1:** *Enable In-Database Machine Learning*

In *Figure 1* we have chosen *Machine Learning Services* which ensures that the required components, (*Launchpad*, and so on), gets installed. In pre-CTP 3.2, we had to - in addition to choosing *Machine Learning Services* - also ensure that Java is installed on the box where we install the SQL Server instance.

> **NOTE:** We also need to do other "stuff" if we want to enable Java, and I cover that below.

When we install SQL Server CTP 3.2, we see something like so:

![](/images/posts/s2k19_ctp32_java.png)

**Figure 2:** *Java Feature Selection*

What we see in *Figure 2* is:

* The *Machine Learning Services* feature is now named *Machine Learning Services and Language Extensions*.
* Java appears as a feature in the same way as R/Python.

We choose Java as a feature, as in *Figure 2*, and after feature rules and instance configuration, we come to a new dialog; *Java Install Location*:

![](/images/posts/s2k19_ctp32_java2.png)

**Figure 3:** *Java Install Location*

In the dialog, we see in *Figure 3*, how we have the ability to choose to install the Azule Zulu OpenJDK which is part of the SQL Server install. We choose the OpenJDK and continue with the installation.

Eventually the installation finish, and if we look in the installation path of the instance we just installed, we see:

![](/images/posts/s2k19_ctp32_openjdk.png)

**Figure 4:** *Azule Zulu OpenJDK*

If we drill down in the `AZUL-OpenJDK-JRE` directory, we see it is the directory for the Java JRE. So we now have Java installed, and theoretically, we should be able to execute Java code, exactly as we execute R/Python?

## Post Install

Well, to execute Java code is not as straightforward as in the previous paragraph even though Java is now installed. We still have to do some things:

* Enable external scripts: `EXEC sp_configure 'external scripts enabled', 1`
* Register Java as an external language in the database from where you want to execute your code: `CREATE EXTERNAL LANGUAGE ...`. Read more about it in [SQL Server 2019 Extensibility Framework & External Languages][6].
* Deploy the Java external language extension SDK to the database above: `CREATE EXTERNAL LIBRARY ...`. Refer to [Java & SQL Server 2019 Extensibility Framework: The Sequel][7] for more about that.

When the above is done, we deploy our code either via `CREATE EXTERNAL LIBRARY ...`, or have our code available in the `CLASSPATH`. Having done that we should be able to execute:

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
**Code Snippet 1:** *Execute Java Code*

In *Code Snippet 1* we see that we want to `EXEC sp_execute_external_script` against some Java code deployed as a `.jar`, (this is the same code as in the [external languages][6] post). However, when we execute the result is like so:

![](/images/posts/s2k19_ctp32_exec1.png)

**Figure 5:** *Missing Environment Variable*

So even though we explicitly said during the SQL installation that we want to use the included Java and it got installed, we still need to set the `JRE_HOME` variable. The installation does not do that for us.

After we have created the `JRE_HOME` environment variable and set it to point to the `AZUL-OpenJDK-JRE` directory we see in *Figure 4*, we need to restart the *Launchpad* service, and then we can execute the code in *Code Snippet 1* again:

![](/images/posts/s2k19_ctp32_exec2.png)

**Figure 6:** *Success*

Now everything works as we see in *Figure 6*. 

## Scenarios

Even though we explicitly choose the included Java in the installation, we still need to set up Java as in pre-CTP 3.2, so what does this give us? 

It gives us peace of mind! Remember that Oracle is phasing out free support for Java, and I wonder how interested they are in solving issues with Java on SQL Server. If we use open source OpenJDK, we rely on the community for support, which may not be ideal in an enterprise production environment. So by using the included Java, we are guaranteed enterprise support - peace of mind!

Does this then mean that we need to use the included Java? Not at all! Below follows some scenarios/options. All require what we did above; create external language, deploy the SDK, deploy your code:

* Enable *Machine Learning Services and Language Extensions* only, (no Java): Ensure that your `JRE_HOME` environment variable points to whatever Java JRE you want to use.
* Enable *Machine Learning Services and Language Extensions* including Java, (as per above): The `JRE_HOME` variable can point to some other Java JRE than Azul, even though the Azul JDK gets installed.

What happens if I enable Java, but instead of choosing the included JRE as in *Figure 3*, I choose the second option: I provide the location of a different JRE? For Java in *Machine Learning Services and Language Extensions* that has no effect. You need to, as in all other scenarios, point the `JRE_HOME` variable to a valid JRE directory.

> **NOTE:** It is good practice to whenever you change, (or first set), the `JRE_HOME` variable to restart the *Launchpad* service.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[1]: https://cloudblogs.microsoft.com/sqlserver/2019/07/24/free-supported-java-in-sql-server-2019-is-now-available/
[2]: https://www.azul.com/
[3]: https://en.wikipedia.org/wiki/Microsoft_Java_Virtual_Machine
[4]: https://www.cnet.com/news/ms-debuts-visual-j/
[5]: {{< relref "2018-12-02-sql-server-2019-extensibility-framework--java---hello-world.md" >}}
[6]: {{< relref "2019-06-06-sql-server-2019-extensibility-framework--external-languages.md" >}}
[7]: {{< relref "2019-05-26-java--sql-server-2019-extensibility-framework-the-sequel.md" >}}
