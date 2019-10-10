---
type: post
layout: "post"
title: "SQL Server 2019 - Java Null Handling & Output Parameters"
author: nielsb
date: 
comments: true
highlight: true
draft: true
categories:
  - SQL Server 2019
  - SQL Server Extensibility Framework
tags:
  - SQL Server 2019
  - R
  - Python
  - Java
  - SQL Server Extensibility Framework
description: 
keywords:
  -   
---

You who read my blog know that during the last year, (or so), I have been writing about SQL Server 2019 and the ability to call into Java code from SQL Server:

* [**SQL Server 2019 Extensibility Framework & Java**](/s2k19_ext_framework_java).

It has been a fascinating "journey", since SQL Server 2019 is still in preview, and there have been changes in how you call Java code along the way. In this post, we look at some relatively recent changes for:

* Null handling.
* Output parameters.

<!--more-->

## Previous Posts

If you have not done any Java code in SQL Server, or at least not recently, here are a couple of posts which introduces you to Java in SQL Server:

* [**Java & SQL Server 2019 Extensibility Framework: The Sequel**][1]. We look at the implications of the introduction of the Java Language Extension SDK.
* [**SQL Server 2019 Extensibility Framework & External Languages**][2]. We look at SQL Server 2019 Extensibility Framework and Language Extensions.
* [**SQL Server 2019 CTP3.2 & Java**][3]. SQL Server 2019 CTP 3.2 and Azule OpenJDK.

## Demo Code

## Demo Data 

In today's post, we use some data from the database. The code is the same we used in a previous post: [**SQL Server 2019 Extensibility Framework & Java - Null Values**][4]:

```sql
USE master;
GO
SET NOCOUNT ON;
GO
DROP DATABASE IF EXISTS JavaTestDB;
GO
CREATE DATABASE JavaTestDB;
GO
USE JavaTestDB;
GO
DROP TABLE IF EXISTS dbo.tb_NullRand10
CREATE TABLE dbo.tb_NullRand10(RowID int identity primary key, 
                          x int, y int, col1 nvarchar(50));
GO
INSERT INTO dbo.tb_NullRand10(x, y, col1)
SELECT TOP(10) CAST(ABS(CHECKSUM(NEWID())) % 14 AS int) 
  , CAST(ABS(CHECKSUM(NEWID())) % 20 AS int)
  , N'Hello ' + CAST(CAST(ABS(CHECKSUM(NEWID())) % 25 AS int) AS nvarchar(50))
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4;
GO
UPDATE dbo.tb_NullRand10
  SET y = NULL
WHERE RowId = 3
UPDATE dbo.tb_NullRand10
  SET Col1 = NULL
WHERE RowId = 5    
UPDATE dbo.tb_NullRand10
  SET x = NULL
WHERE RowId = 6 
UPDATE dbo.tb_NullRand10
  SET y = NULL
WHERE RowId = 8  
UPDATE dbo.tb_NullRand10
  SET col1 = NULL
WHERE RowId = 9 
GO
```
**Code Snippet 1:** *Create Database Objects*

We see from *Code Snippet 1 * how we:

* Create a database: `JavaTestDB`.
* Create a table: `dbo.tb_NullRand10`.
* Insert some data into the table.

The data we insert is entirely random, but it gives us something to "play around" with. Now, when we have a database and some data let us get started.

## Null Values

In the [null values post][4] mentioned above, I mentioned that there are differences between SQL Server and Java in how they handle null. So, when we call into Java from SQL Server, we may want to treat null values the same way as we do in SQL Server.  



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
[5]:
[6]:
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