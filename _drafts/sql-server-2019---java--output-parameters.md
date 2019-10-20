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

* [**SQL Server 2019, Java & External Libraries - I**][5]. Part I of a couple of posts where we look at how we can deploy Java code to the database, so it can be loaded from there.
* [**Java & SQL Server 2019 Extensibility Framework: The Sequel**][1]. We look at the implications of the introduction of the Java Language Extension SDK.
* [**SQL Server 2019 Extensibility Framework & External Languages**][2]. We look at SQL Server 2019 Extensibility Framework and Language Extensions.
* [**SQL Server 2019 CTP3.2 & Java**][3]. SQL Server 2019 CTP 3.2 and Azule OpenJDK.

## Demo Code

#### Data 

In today's post, we use some data from the database. The code to insert the data is the same we used in a previous post: [**SQL Server 2019 Extensibility Framework & Java - Null Values**][4]:

```sql
USE master;
GO
SET NOCOUNT ON;
GO
DROP DATABASE IF EXISTS JavaNullDB;
GO
CREATE DATABASE JavaNullDB;
GO
USE JavaNullDB;
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

* Create a database: `JavaNullDB`.
* Create a table: `dbo.tb_NullRand10`.
* Insert some data into the table.

The data we insert is entirely random, but it gives us something to "play around" with.

Let us see what the data looks like, by executing: `SELECT RowID, x, y FROM dbo.tb_NullRand10;`:

![](/images/posts/sql-2k19-java-null2-result1.png)

**Figure 1:** *T-SQL Result*

As we see in *Figure 1*, we get back 10 rows, and rows 3, 6, and 8 contains null values.

#### Enable Java in the Database 

To use Java in the database, you need to do a couple of more things:

* Register Java as an external language in your database. The following post describes what to do: [**SQL Server 2019 Extensibility Framework & External Languages**][2].
* Create an external library in the database for the Java SDK. The post [**Java & SQL Server 2019 Extensibility Framework: The Sequel**][1] shows you how to do it.

Now, when we have a database with some data and Java enabled we, can start.

## Null Values

In the [null values post][4] mentioned above, I mentioned that there are differences between SQL Server and Java in how they handle null. So, when we call into Java from SQL Server, we may want to treat null values the same way as we do in SQL Server.

I wrote about this in the [**SQL Server 2019 Extensibility Framework & Java - Null Values**][4] post mentioned above. However, that post was written before SQL Server 2019 CTP 2.5, and Microsoft introduced the Java SDK in CTP 2.5, and certain things changed. Amongst the things that changed is the way we handle nulls when we receive datasets from SQL Server in our Java code.

Let us see how null handling works now post CTP 2.5. We use similar code to what we saw in the [null post][4] above:

``` java
public PrimitiveDataset execute(PrimitiveDataset input, 
                               LinkedHashMap<String, Object> params) {
    
  int[] inputCol1 = input.getIntColumn(0);
  int[] inputCol2 = input.getIntColumn(1);
  int[] inputCol3 = input.getIntColumn(2);

  PrimitiveDataset output = new PrimitiveDataset();

  output.addColumnMetadata(0, "RowID", Types.INTEGER, 0, 0);
  output.addColumnMetadata(1, "x", Types.INTEGER, 0, 0);
  output.addColumnMetadata(2, "y", Types.INTEGER, 0, 0);

  output.addIntColumn(0, inputCol1, null);
  output.addIntColumn(1, inputCol2, null);
  output.addIntColumn(2, inputCol3, null);
 
  return output;
}
```
**Code Snippet 2:** *Java Input & Output Data*

The code in *Code Snippet 3* "echoes" back what it receives as input dataset and we see how we:

* Load three arrays with the three columns in the dataset.
* Create a new `PrimitiveDataset` to use as the return type.
* Set metadata for the return dataset.
* Assign the columns for the return dataset.
* Return the dataset.

> **NOTE:** If you wonder about why the method is named `execute` and what the `PrmitiveDataset` is; the post [here][1] explains it.

After we have compiled and packaged the code into a `.jar` file we can deploy:

```sql
CREATE EXTERNAL LIBRARY SqlNullLib 
FROM (CONTENT = 'W:\sql-null-1.0.jar')
WITH (LANGUAGE = 'Java');
```
**Code Snippet 3:** *Deploy Java Code*

As we see in *Code Snippet 3* I named my `.jar` file `sql-null-1.0.jar` and I deployed it as an external library: `SqlNullLib`. Since I deploy to a local SQL Server instance, I can use a file location for my `.jar`. 

> **NOTE:** The [Java & External Libraries][5] post mentioned above goes into details about external libraries.

The code to execute looks something like so:

```sql
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'sql.NullValues'
, @input_data_1 = N'SELECT RowID, x, y FROM dbo.tb_NullRand10'
WITH RESULT SETS((RowID int, x int, y int))
```
**Code Snippet 4:** *Execute Code*

We see in *Code Snippet 4* how we call into the `NullValues` class in the `sql` package and how we use the same `SELECT statement that generated the resultset we saw in *Figure 1*. When we execute the code, we see:

![](/images/posts/ssql-2k19-java-null2-result2.png)

**Figure 2:** *Java Code Result*

Compare the result we see in *Figure 2* with the result in *Figure 1*, and we see the difference in the outlined rows, (3, 6, 8), and the highlighted columns, In *Figure 1* the columns are `NULL`, whereas in *Figure 2* they are `0`. So why are the columns `0`?

Well, as we said in the [null post][4], this is because the Java language extension converts the null values to the default value for the data type in question.

> **NOTE:** The Java language extension is the bridge between SQL Server and your Java code. The [**SQL Server 2019 Extensibility Framework & External Languages**][2] post covers it in some detail.

The question is, why do we care that a null value comes across as zero, at least we do not get a null exception? Let us take a look at the following Java code:

``` java
public PrimitiveDataset execute(PrimitiveDataset input, 
                                LinkedHashMap<String, Object> params) {
    
  int[] inputCol3 = input.getIntColumn(2);

  double sum = Arrays.stream(inputCol3).asDoubleStream().sum();

  double avg = sum / inputCol3.length;

  System.out.printf("Average value of y is: %f", avg);

  return null;
}
```
**Code Snippet 5:** *Average Value*

The code in *Code Snippet 5* expects the same input data as we generated in *Code Snippet 4*, and it calculates the average value of the `y` column of that dataset. When we execute the code in *Code Snippet 4*, after having compiled, packaged and deployed, (comment out `WITH RESULT SETS`), we see the result as so:

![](/images/posts/sql-2k19-java-null2-average.png )

**Figure 3:** *Result of Average Calculation*

The result in *Figure 3* looks OK, so let us see what it looks like if we run a similar query in SQL Server:

``` sql
SELECT CAST(AVG(CAST(y AS DECIMAL(4,2)))AS DECIMAL(4,2))
FROM dbo.tb_NullRand10;
```
**Code Snippet 6:** *T-SQL Average Calculation*

The result of the query in *Code Snippet 6* looks like so:

![](/images/posts/sql-2k19-java-null2-average2.png )

**Figure 4:** *Result of T-SQL Average Calculation*

We see in *Figure 4* how the result of the average calculation, (outlined in red), differs from the Java calculation. The question is why this is, it was the same data in both calculations? Well, was it; we see in *Figure 4* the highlighted part at the top: "Null value is eliminated ...". So what happens is that for certain operations SQL Server eliminates null values, as SQL Server treats nulls as unknown.

As the Java language extension converts nulls we need to handle it in our Java code.

#### Input Nulls

In the previous [null post][4] we saw that, when we want to handle null input, we use a required class level variable `inputNullMap`, which the Java language extension populates "automagically". However, after the introduction of the Java language SDK, this variable is not required any more. Even if you declared it, the Java language extension does not populate it.

So how do we then figure out whether a column has a null value? Well, since the Java language extension passes data into the `execute` method vis the `PrimitiveDataSet` class, let us have a look at the base class for `PrimitiveDataSet`: `AbstractSqlServerExtensionDataset`: 

``` java
public class AbstractSqlServerExtensionDataset {
  /**
   * Column metadata interfaces
   */
  public void addColumnMetadata(int columnId, String columnName, int columnType, int precision, int scale) {
    throw new UnsupportedOperationException("addColumnMetadata is not implemented");
  }

  ...

  public boolean[] getColumnNullMap(int columnId) {
    throw new UnsupportedOperationException("getColumnNullMap is not implemented");
  }

  ...
}
```
**Code Snippet 7:** *AbstractSqlServerExtensionDataset*

We see in *Code Snippet 7* how the `AbstractSqlServerExtensionDataset` has a section for metadata, and in that section is a method: `getColumnNullMap`. The method takes an integer as input parameter, and it returns an array of type `boolean`.

> **NOTE:** The Java SDK is open source, and you find it [here][6].

So what happens when the Java language C++ extension populates the `PrimitiveDataset` input parameter is that:

* The extension creates a `boolean` array for each column.
* The extension loops each row for each column.
* Where there is a null value, for a primitive data type, the extension assigns the default value of the data type to that column.
* When the extension comes across a null value in a column, it sets the boolean array value to `true` in the column array for that particular row.







 how the Java language extension "automagically" populates a required variable `inputNullMap`.    Let us see how we handle input nulls, like we receive when we execute the code in *Code Snippet 4*.

In the 












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
[6]: https://github.com/microsoft/sql-server-language-extensions
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