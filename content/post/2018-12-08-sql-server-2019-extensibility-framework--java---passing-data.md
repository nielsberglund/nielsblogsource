---
type: post
layout: "post"
title: "SQL Server 2019 Extensibility Framework & Java - Passing Data"
author: nielsb
date: 2018-12-08T19:52:11+02:00
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
description: Look at how to pass data back and forth between SQL Server 2019 and Java.
keywords:
  - SQL Server 2019
  - SQL Server Machine Learning Services 
  - R
  - Python
  - Java   
---

This post is the second post in a series about SQL Server 2019 Extensibility Framework and the Java language extensions. In the first post, [SQL Server 2019 Extensibility Framework & Java - Hello World][1], we looked at how to install and enable the Java language extensions, and we also wrote some pretty basic Java code to ensure it all worked.

To see what other posts there are in the series, go to [**SQL Server 2019 Extensibility Framework & Java**](/s2k19_ext_framework_java).

In this post we look at how we can pass data back and forth between SQL Server and Java.

<!--more-->

## Recap

Let us just look back and refresh our memories about what we discussed in the previous [post][1].

* On Windows you install and enable the Java language extensions when enabling the *Machine Learning Services* feature during setup or when adding features.
* For CTP 2.1 the supported Java version on both Linux and Windows is 1.8.x.
* Java does not get automatically installed on Windows when you install and enable the Java language extensions (on Linux it does). So unless 1.8.x is already installed you need to install it.
* On Windows the `Path` environment variable needs to extend to the directory where the `jvm.dll` is located.
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

Based on the points above we saw some Java code looking like so:

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
**Code Snippet 1:** *Basic Java Code*

In *Code Snippet 1* we see the required `numberOfOutputCols` class member, together with class members for the two parameters used in the `adder` method. We also see that we do not pass back the result of the `adder` method as there is no support for output parameters (in this post we cover how we can pass data back to SQL).

We call the code in *Code Snippet 1* from SQL like so:

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
**Code Snippet 2:** *Execute Java from SQL*

To call the code in *Code Snippet 1* I execute what we see in *Code Snippet 2*:

* I indicate that I want to call into Java: `@language = N'Java'`.
* The method I want to call is set in the `@script` parameter.
* The Java class members `x` and `y` is defined in the `@params` parameter as SQL parameters `@x`, and `@y`.
* I have added the `@x`, and `@y` parameters as named parameters and assigned them some values.

So, that was what we discussed in the previous post. Towards the end of this post, we revisit the code above.

## Demo Data 

In today's post, we use some data from the database, so let us set up the necessary database, tables, and load data into the tables:

```sql
USE master;
GO
SET NOCOUNT ON;
GO
DROP DATABASE IF EXISTS JavaTest;
GO
CREATE DATABASE JavaTest;
GO
USE JavaTest;
GO

DROP TABLE IF EXISTS dbo.tb_Rand100
CREATE TABLE dbo.tb_Rand100(RowID int identity primary key, y int, 
                          rand1 int, rand2 int);

INSERT INTO dbo.tb_Rand100(y, rand1, rand2)
SELECT TOP(100) CAST(ABS(CHECKSUM(NEWID())) % 14 AS int) 
  , CAST(ABS(CHECKSUM(NEWID())) % 20 AS int)
  , CAST(ABS(CHECKSUM(NEWID())) % 25 AS int)
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4;
GO
```
**Code Snippet 3:** *Create Database Objects*

We see from *Code Snippet 3* how we:

* Create a database: `JavaTest`.
* Create a table: `dbo.tb_Rand100`.
* Insert some data into the table.

The data we insert is entirely random, but it gives us something to "play around" with. Now, when we have a database and some data let us get started.

## Data Passing in R/Python

We start by looking at how we pass data when we use R/Python in **SQL Server Machine Learning Services**. In [Microsoft SQL Server R Services: sp_execute_external_script - I][sext1] I discussed, among other things, how we use named parameters to refer to data pushed into the external engine from SQL Server as well as data returned to SQL Server. 

The parameter's default names are `InputDataSet` and `OutputDataSet`, and a simple example looks like so:

```sql
EXEC sp_execute_external_script 
      @language = N'Python'
    , @script = N'OutputDataSet = InputDataSet'
    , @input_data_1 = N'SELECT RowID, y, rand1 
                        FROM dbo.tb_Rand100';  
```
**Code Snippet 4:** *Passing Data In and Out*

The Python code in *Code Snippet 4* pushes data into the Python engine via `InputDataSet`, and `OutputDataSet` echoes the data back to SQL Server. Why this works is because R/Python are aware of these parameters, thanks to "helper" components, (`SqlSatellite.dll` and friends), shipped together and "baked" into R/Python. In essence, there is a very tight integration with the external runtime which makes this possible.

## Data Passing in Java Extensions

In Java, there are also helper components, (a topic for future posts), but the integration is not as tight, so when we want to pass data into and out of Java we need to code somewhat more explicit to make data passing possible.

In our Java code, we need to represent the data passed in and out as class member column arrays. You define in your classes, one array per column passed in, and one array per column returned. These column arrays are some of the "magic" members I mentioned above, and they are the equivalent to `InputDataSet`, and `OutputDataSet`.

The components that are part of the Java extension need to know about these members as the components either populate them when pushing data into Java or read from them when returning data from Java. The way that the components know about the members is based on a naming standard.

#### Pushing Data into Java

When pushing data into Java and using that data, we need to define two `public static` class members:

* **`inputDataColN`**: array variable representing the input columns, where *N* is the column number (1 based).
* **`inputNullMap`**: two dimensional `boolean` array variable, indicating whether a column value is `null`.

The calling components populate the variables for input data automatically, and you just need to initialize the arrays with a size greater than 0. Let us look at an example based on the `SELECT` statement in *Code Snippet 4*, where we want to push data into Java:

```java
public class DataPassing {
  static public int[] inputDataCol1 = new int[1];
  static public int[] inputDataCol2 = new int[1];
  static public int[] inputDataCol3 = new int[1];

  static public boolean[][] inputNullMap = new boolean[1][1];

  static public short numberOfOutputCols;

  public static void foo() {
    
    for(int x = 0; x < inputDataCol1.length; x++) {
      System.out.printf("Row %d:\t\t%d\t %d\t %d\n", x+1, 
                          inputDataCol1[x], 
                          inputDataCol2[x], 
                          inputDataCol3[x]);
    }
  }
}
```
**Code Snippet 5:** *Input Data*

In *Code Snippet 5* we see how we:

* Declare and initialize three `int` arrays representing the three columns we expect from the `SELECT` statement.
* Declare and initialize a `boolean` array for null mapping.
* Declare the `numberOfOutputCols` variable which always is required.

In the `foo` method we loop the three input arrays and print them out. We see that we do not have to populate the arrays as something else, (some component), does that for us. To make the code callable from SQL Server we:

* Copy the code in *Code Snippet 5* to a file: `DataPassing.java`.
* We compile it like so: `javac DataPassing.java`, which results in a `.class` file: `DataPassing.class`
* We copy the `.class` file to the location of `CLASSPATH`.

With the `.class` file in the `CLASSPATH` location we call it from SQL Server:

```sql
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'DataPassing.foo'
, @input_data_1 = N'SELECT TOP(10) RowID, y, rand1 
                    FROM dbo.tb_Rand100';
```
**Code Snippet 6:** *Execute & Push Data to Java*

The code in *Code Snippet 6* follows what we discussed in [SQL Server 2019 Extensibility Framework & Java - Hello World][1], and the summary section above. When we execute it we see this:

![](/images/posts/sql_2k19_java_intro_exec_input.png)

**Figure 1:** *Result of Exec*

In *Figure 1* we see the result of the `printf` statement in *Code Snippet 5*. Printing data to the console is probably not what we want to do in a "proper" application, so let us see how we can return data from Java back to SQL.

#### Returning Data from Java

When returning data from our Java method(s), we use column array class members, similar to the ones we use when passing data into Java:

* **`outputDataColN`**: array variable representing the output columns, where *N* is the column number (1 based).
* **`numberofOutputCols`**: we discussed this variable in the summary section above. It represents the number of columns returned from Java, and it is always required - regardless if you return columns or not.
* **`outputNullMap`**: two dimensional `boolean` array variable, indicating whether a column value is `null`.

There are a couple of differences between the variables used for input data and the above output variables:

* You need to populate the variables yourself.
* You initialize the variables right before you use them.

So, if we wanted to have a method, `bar`, "echoing" back the input dataset, similar to what we see in *Code Snippet, 4 the code looks like so:

```java
public class DataPassing {
  //input data variables as per above
  ...

  //output variables
  static public int[] outputDataCol1;
  static public int[] outputDataCol2;
  static public int[] outputDataCol3;
  static public boolean[][] outputNullMap;

  static public short numberOfOutputCols;

  public static void bar() {
    
    int numRows = inputDataCol1.length;
    numberOfOutputCols = 3;

    outputDataCol1 = new int[numRows];
    outputDataCol2 = new int[numRows];
    outputDataCol3 = new int[numRows];

    for(int x = 0; x < numRows; x++) {
      outputDataCol1[x] = inputDataCol1[x];
      outputDataCol2[x] = inputDataCol2[x];
      outputDataCol3[x] = inputDataCol3[x];
    }

    outputNullMap = new boolean[numberOfOutputCols][numRows];
  }

 public static void foo() {...}

```
**Code Snippet 7:** *Output Data*

In *Code Snippet 7* we see how I:

* Declare the output variables as class members.
* Set the `numberOfOutputCols` variable. I do not get any data back without setting this variable, 
* Instantiate output variables in the method, based on the number of columns and number of rows.
* Copy the input dataset into the output variables.
* Instantiate the null map variable.

After I have compiled the code and moved the `.class` file to the `CLASSPATH` location, I execute as in *Code Snippet 6*, but with one difference: the `@script` parameter now points to the `bar` method: `@script = N'DataPassing.bar'`:

![](/images/posts/sql_2k19_java_intro_exec_output.png)

**Figure 2:** *Output Dataset*

We see in *Figure 2* how the data is returned to SQL Server and presented as a result set. If you compare what you see in *Figure 2* with what you see in *Figure 1*, you see the data is identical.

Cool, we have now seen how we pass datasets in and out of Java and how we use the different class arrays. Actually, that is not entirely true; we have not discussed the null map variables at all, other than saying what they are and that they need to be instantiated. We answer the questions about how and why to use them in the next post.

## Input & Output Parameters

In the previous post, (and in the recap above), we said that Java methods we use from SQL Server cannot have parameters and they must be `void`. In the recap section, we saw how we tried to work around those restrictions by having class member variables, etc.

With what we now know, we can re-write the Java code to something like so:

```java
public class Calculator {
  static public int[] inputDataCol1 = new int[1];
  static public int[] inputDataCol2 = new int[1];
  static public boolean[][] inputNullMap = new boolean[1][1];

  static public int[] outputDataCol1;
  static public boolean[][] outputNullMap;

  static public short numberOfOutputCols;

  public static void adder() {
    
    int x = inputDataCol1[0];
    int y = inputDataCol2[0];

    numberOfOutputCols = 1;

    outputDataCol1 = new int[1];
    outputDataCol1[0] = x + y;

    outputNullMap = new boolean[1][1];
  }
}
```
**Code Snippet 8:** *New Adder*

In this new code we see in *Code Snippet 8* we:

* Receive a one row, two column data set in the class.
* Parse out the two columns, as `x`, and `y`, from the data coming in.
* Return a one row, one column dataset back to SQL Server with the result of `x+y`.

The SQL code to call into this Java code looks like so:

```sql
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'Calculator.adder'
, @input_data_1 = N'SELECT 21, 21'; 
```
**Code Snippet 9:** *Execute the Adder Method*

The result returned when we execute the code in *Code Snippet 9* is as follows:

![](/images/posts/ql_2k19_java_intro_exec_output_param.png)

**Figure 3:** *Output Parameter*

In this section, we saw how we can work around, (somewhat), the restrictions that exist at the moment when calling Java code from SQL Server.

## Summary

In this post, we looked at how we pass data back and forth between SQL Server and Java. In the Java extensions we do not have the `InputDataSet`, and `OutputDataSet` variables, so we need to define class member arrays for the columns we send in and pass back out, as well as a variable indicating the number of columns we return:

* `**inputDataCol*N***: array variable representing the input columns, where *N* is the column number (1 based).
* `**outputDataCol*N***`: array variable representing the output columns, where *N* is the column number (1 based).
* `**numberofOutputCols**`: it represents the number of columns returned from Java, and it is always required - regardless if you return columns or not.

In addition to these variables we need two variables mapping null values:

* `**inputNullMap**`: two dimensional `boolean` array variable, indicating whether a column value is `null`.
* `**outputNullMap**`: two dimensional `boolean` array variable, indicating whether a column value is `null`.

All the `input*xxx*` variables get populated automatically, whereas you need to populate the `output*xxx*` variables in the code.

In the next post we discuss more about the null map variables.

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
[sext1]: {{< relref "2018-03-07-microsoft-sql-server-r-services-sp_execute_external_script-I.markdown" >}}
