---
type: page
layout: "page"
title: "SQL Server 2019 Extensibility Framework & Java"
showcomments: false
showfeedplug: false
---

This is a collection of posts about the Java language extensions introduced in **SQL Server 2019**. In other words, how we can execute Java code from inside SQL Server 2019.

## Table of Content

* [SQL Server 2019 Extensibility Framework & Java - Hello World][1]: We looked at installing and enabling the Java extension, as well as some very basic Java code.
* [SQL Server 2019 Extensibility Framework & Java - Passing Data][2]: In this post, we discussed what is required to pass data back and forth between SQL Server and Java.
* [SQL Server 2019 Extensibility Framework & Java - Null Values][3]: This, the [Null Values][3], post is a follow up to the [Passing Data][2] post, and we look at how to handle `null` values in data passed to Java.
* [SQL Server 2019 Extensibility Framework & Java - Misc. "Stuff"][4]: We look at SQL Server 2019 Java Extensions, and Java packages, the CLASSPATH and JAR files.
* [SQL Server 2019, Java & External Libraries - I][5]: Part I of a couple of posts where we look at how we can deploy Java code to the database, so it can be loaded from there.
* [SQL Server 2019, Java & External Libraries - II][6]: Part II of a couple of posts where we look at how we can deploy Java code to the database, so it can be loaded from there. In this post we look at how to use `CREATE EXTERNAL LIBRARY` to deploy Java code without having access to SQL Server's filesystem.
* [Java & SQL Server 2019 Extensibility Framework: The Sequel][7]. We look at the implications of the introduction of the Java Language Extension SDK.
* [SQL Server 2019 Extensibility Framework & External Languages][8]. We look at SQL Server 2019 Extensibility Framework and Language Extensions.
* [SQL Server 2019 CTP3.2 & Java][9]. SQL Server 2019 CTP 3.2 and Azule OpenJDK.
* [SQL Server 2019 & Java Null Handling: Take Two][10]. We take a second look at how to handle null values in datasets being passed to and from Java code.




[1]: {{< relref "2018-12-02-sql-server-2019-extensibility-framework--java---hello-world.md" >}}
[2]: {{< relref "2018-12-08-sql-server-2019-extensibility-framework--java---passing-data.md" >}}
[3]: {{< relref "2018-12-19-sql-server-2019-extensibility-framework--java---null-values.md" >}}
[4]: {{< relref "2018-12-30-sql-server-2019-extensibility-framework--java---misc-stuff.md" >}}
[5]: {{< relref "2019-03-10-sql-server-2019-java--external-libraries---i.md" >}}
[6]: {{< relref "2019-03-17-sql-server-2019-java--external-libraries---ii.md" >}}
[7]: {{< relref "2019-05-26-java--sql-server-2019-extensibility-framework-the-sequel.md" >}}
[8]: {{< relref "2019-06-06-sql-server-2019-extensibility-framework--external-languages.md" >}}
[9]: {{< relref "2019-08-03-sql-server-2019-ctp32--java.md" >}}
[10]: {{< relref "2019-10-26-sql-server-2019--java-null-handling-take-two.md" >}}
