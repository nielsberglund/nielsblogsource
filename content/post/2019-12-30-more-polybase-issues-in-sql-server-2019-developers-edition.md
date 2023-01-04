---
type: post
layout: "post"
title: More PolyBase Issues in SQL Server 2019 Developers Edition
author: nielsb
date: 2019-12-30T18:26:55+02:00
comments: true
highlight: true
draft: false
categories:
  - SQL Server 2019
  - Polybase
tags:
  - SQL Server 2019
  - Polybase
description: Here we look at how to fix weird error messages when we want to create External Tables
keywords:
  - SQL Server 2019
  - Polybase  
---

A couple of weeks ago, I published the post [**Fix PolyBase in SQL Server 2019 Developers Edition**][1]. In the post, I discussed how to fix an issue in SQL Server 2019 Developers edition, where the PolyBase services do not start up after installation.

The fix in the post works fine, i.e. the services start after the fix. However some days after I published the post there was a question on a SQL Server 2019 forum, where the poster says he cannot create an external file format on the SQL Server 2019 Developer Edition. Sure enough, when I tried to do the same on my "fixed" instance, I could not either. 

So in this post, I look at how to fix that second issue.

<!--more-->

## Demo Data / Code

The following code is for you who want to follow along and try it out for yourselves:

``` sql
CREATE DATABASE MyOraSourceDB;
GO

USE MyOraSourceDB;
GO

CREATE TABLE emp
(  
  EMPNO int primary key, 
  ENAME nvarchar(50), 
  JOB nvarchar(50), 
  MGR int, 
  HIREDATE date, 
  SAL int, 
  COMM int, 
  DEPTNO int
);

INSERT INTO emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES (7369,'SMITH','CLERK',7902, '1980-12-17',800,null,20)
, (7521,'WARD','SALESMAN',7698,'1981-02-20',1250,500,30)
,(7499,'ALLEN','SALESMAN',7698,'1981-02-22',1600,300,30)
,(7566,'JONES','MANAGER',7839,'1981-04-02',2975,null,20)
,(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30)
,(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,null,30)
,(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,null,10)
,(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,null,20)
,(7839,'KING','PRESIDENT',null,'1981-11-17',5000,null,10)
,(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30)
,(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,null,20)
,(7900,'JAMES','CLERK',7698,'1981-12-03',950,null,30)
,(7902,'FORD','ANALYST',7566,'1981-12-03',3000,null,20)
,(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);
```
**Code Snippet 1:** *Create Source Database*

The code in *Code Snippet 1* creates a database and a table with some data. The database is what we use as the source database. Typically for demo purposes, I use an Oracle database as the source, but for this, we use a local SQL Server database.

We also need a database which we work from, i.e. the target database:

``` sql
CREATE DATABASE MyTargetDB;
GO
```
**Code Snippet 2:** *Create Target Database*

In *Code Snippet 2* we see how I create the database we will work in. For now, we only create the database, and later we add "stuff".

## External Table

PolyBase enables a database in a SQL Server instance to process Transact-SQL queries that read data from external data sources. The data in the remote data source is exposed via external table(s).

In our case, we emulate a remote Oracle database through our `MyOraSourceDB` database, and the data source is the `emp` table. What we want to do is to query the "remote" `emp` table from inside the `MyTargetDB`. To do this, we create an external table targeting the `emp` table in the `MyOraSourceDB` database.

The signature for `CREATE EXTERNAL TABLE` looks like so:

``` sql
CREATE EXTERNAL TABLE { database_name.schema_name.table_name | 
                        schema_name.table_name | 
                        table_name }
    ( <column_definition> [ ,...n ] )
    WITH (
        LOCATION = 'folder_or_filepath',
        DATA_SOURCE = external_data_source_name
        [ , FILE_FORMAT = external_file_format_name ]
        [ , <reject_options> [ ,...n ] ]
    )
[;]
```
**Code Snippet 3:** *Create External Table*

We see in *Code Snippet 3* the main portion of `CREATE EXTERNAL TABLE`. Notice the `DATA_SOURCE`, and `FILE_FORMAT` arguments.

#### DATA_SOURCE

Specifies the name of the external data source that contains the location of the external data. External data sources can be:

* Hadoop, (SQL Server 2016+).
* Azure Blob Storage, (SQL Server 2016+).
* SQL Server, (SQL Server 2019+).
* Oracle, (SQL Server 2019+).
* Teradata, (SQL Server 2019+).
* Mongo DB, (SQL Server 2019+).
* Cosmos DB, (SQL Server 2019+).
* Generic ODBC sources, (only in SQL Server 2019 Windows).

The signature of `CREATE EXTERNAL DATA SOURCE` is as follows:

``` sql
CREATE EXTERNAL DATA SOURCE <data_source_name>  
WITH
(    
  LOCATION                  = '<prefix>://<path>[:<port>]'
  [,   CONNECTION_OPTIONS        = '<name_value_pairs>']
  [,   CREDENTIAL                = <credential_name> ]
  [,   PUSHDOWN                  = ON | OFF]
  [,   TYPE                      = HADOOP | BLOB_STORAGE ]
  [,   RESOURCE_MANAGER_LOCATION = '<resource_manager>[:<port>]'
)
[;]
```
**Code Snippet 4:** *Create External Data Source - I*

In *Code Snippet 4* we see that most of `Create External Data Source` arguments are optional. In our code further below, we use `LOCATION` and `CREDENTIAL`.

#### FILE_FORMAT

The `CREATE EXTERNAL FILE FORMAT` specifies the layout of the data referenced by an external table. You use this for external tables, not referencing relational data.

The command differs depending on the actual remote file format. The code the poster used in the forum, mentioned above, looked like so:

``` sql
CREATE EXTERNAL FILE FORMAT csv_file
WITH 
(
  FORMAT_TYPE = DELIMITEDTEXT,
  FORMAT_OPTIONS
  (
    FIELD_TERMINATOR = ',',
    STRING_DELIMITER = '"'
  )
);
```
**Code Snippet 5:** *Create External File Format*

As we see in *Code Snippet 5*, the poster wanted to define the format for `.csv` files. He: 

* Named the format: `csv_file`.
* Defined the type: `DELIMITEDTEXT`.
* Defined what terminates a field, and what delimits a string.

A bit further down we see what happened when the poster wanted to execute the statement.

## The Issue(s)

Let us look at the issue which occurred for the forum post as well for me. When we execute the code in *Code Snippet 5* we see the following:

![](/images/posts/sql-pb-issues2-syntax1.png)

**Figure 1:** *Incorrect Syntax*

What we see in *Figure 1*, *incorrect syntax exception*, is strange, as I have executed the same code in a SQL Server 2019 Big Data Cluster, (BDC), without any issues, and the forum poster executed the same in SQL Server 2019 Enterprise Edition also without any issues.

Ok, but what about creating an external table against a relational data source - where we do not need to define an external file format? Let us go back to the databases we created above, and - in the `MyTargetDB` - create an external table against the `emp` table in `MyOraSourceDB`. We start with the external data source:

``` sql
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '<some-secret-password>';
GO

CREATE DATABASE SCOPED CREDENTIAL [oracleCred]
WITH IDENTITY = N'sa', SECRET = N'<some-other-secret-password>';

CREATE EXTERNAL DATA SOURCE OraConnection
WITH 
( 
  LOCATION = 'sqlserver://localhost',
  CREDENTIAL = [oracleCred]
);
```
**Code Snippet 6:** *Create External Data Source - II*

You may wonder why we, in *Code Snippet 6*, create a master key and a scoped credential? Well, we create the credential as the "remote" data source, in this case, the `MyOraSourceDB` requires authentication. The master key is required to protect the scoped credential.

> **NOTE:** If the database in question already have a master key, you do not need to create a new.

As for creating the data source we:

* Give it a name.
* Sets the location. The `sqlserver` prefix indicates this is a SQL Server instance.
* Assign the credential created above.

> **NOTE:** If the remote data source had been an Oracle server, the `LOCATION` would be like: `oracle://[IP-address]'.

All this seems correct, however, when we execute the code in *Code Snippet 6* we get:

![](/images/posts/sql-pb-issues2-type-generic.png)

**Figure 2:** *Type Generic not Supported*

The exception we see in *Figure 2* is, once again, strange, as when I run the same code in SQL Server 2019 BDC it works fine. What is going on here?

## Solution

Above we have seen two instances of where we received exceptions for operations in SQL Server 2019 Developers Edition that works fine in other editions, (BDC, Enterprise, etc.). 

As Developers edition is equivalent to Enterprise edition, PolyBase should just work. When I looked into these issues, the only explanation I could come up with was that some settings differ during setup between Developer and Enterprise Edition, (and BDC for that matter).

So what I did was that I connected to my BDC, and looked at the configuration:

``` sql
SELECT name, value, value_in_use, description 
FROM sys.configurations
where name like '%polybase%'
```
**Code Snippet 7:** *Get Config Detail for PolyBase*

When I executed the code on my BDC instance the result looked like so:

![](/images/posts/sql-pb-issues2-bdc-pb-config.png)

**Figure 3:** *BDC PolyBase Config*

We see in *Figure 3* how all PolyBase related configuration settings are enabled. Now, what if we run the code in *Code Snippet 7* on my local Developer edition:

![](/images/posts/sql-pb-issues2-bdc-pb-config2.png)

**Figure 4:** *Local Developer Edition PolyBase Config*

Oh, notice in *Figure 4*, outlined in red, how PolyBase is **NOT** enabled. That certainly looks like a smoking gun. So, let us enable PolyBase:

``` sql
EXEC sp_configure 'polybase enabled', 1
RECONFIGURE WITH OVERRIDE;
```
**Code Snippet 8:** *Enable PolyBase*

After I execute the code in *Code Snippet 8* and run `EXEC sp_configure 'polybase enabled'` I see:

![](/images/posts/sql-pb-issues2-pb-enabled.png)

**Figure 5:** *Local Developer Edition PolyBase Config*

Yay, seeing *Figure 5*, it looks like PolyBase is enabled. To try it out, run the code in *Code Snippet 5*. When I run it I get:

![](/images/posts/sql-pb-issues2-success1.png)

**Figure 6:** *Command Completed Successfully*

As we see in *Figure 6*, it looks like all is OK.

Let us now go to the code for the external data source and see what happens when we try to create it. So I execute the `CREATE EXTERNAL DATA_SOURCE` part of *Code Snippet 6*, and that succeeds as well.

Cool, so we have the external data source. Now it is time for the external table:

``` sql
CREATE EXTERNAL TABLE [dbo].[emp_ora]
(
  [EMPNO] int NOT NULL,
  [ENAME] NVARCHAR(50),
  [JOB] NVARCHAR(50),
  [MGR] int,
  [HIREDATE] DATE,
  [SAL] int,
  [COMM] int,
  [DEPTNO] int
)
WITH (LOCATION = N'[MyOraSourceDB].[dbo].[emp]', 
      DATA_SOURCE = [OraConnection]);
```
**Code Snippet 9:** *External Table*

In *Code Snippet 9* we see how we use more or less the same DDL as for the original, remote, table. The only difference is that we define a location which is `database.schema.tablename`, as well as the data source. After we execute the code in *Code Snippet 9*, we can query the table: `SELECT * FROM dbo.emp_ora`:

![](/images/posts/sql-pb-issues2-query.png)

**Figure 7:** *Query Result*

We see in *Figure 7* the first 5 rows in the external table. However, the data is not persisted in the external table; it is loaded from the remote table. We can prove that by executing: `EXEC sp_spaceused 'dbo.emp_ora'`:

![](/images/posts/sql-pb-issues2-space.png)

**Figure 8:** *Space Used*

As we see in *Figure 8* the table has no rows!

## Summary

In the [**Fix PolyBase in SQL Server 2019 Developers Edition**][1] post we saw how to fix the issue when the PolyBase services do not start up after installation of SQL Server 2019 Developers Edition.

In this post, we looked at how to fix the errors we see in *Figure 1* and *Figure 2* when we try to either create an external file format or an external data source.

The solution is simple: `EXEC sp_configure 'polybase enabled', 1` followed by `RECONFIGURE WITH OVERRIDE`.

Yes, the fix is simple, but I cannot help but think that the error messages could be more descriptive.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[1]: {{< relref "2019-11-20-fix-polybase-in-sql-server-2019-developers-edition.md" >}}
