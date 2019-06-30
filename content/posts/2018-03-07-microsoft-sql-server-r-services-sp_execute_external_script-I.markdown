---
layout: post
title: Microsoft SQL Server R Services - sp_execute_external_script - I
author: nielsb
date: 2018-03-07T19:37:31+02:00
comments: true
categories:
  - SQL Server
  - SQL Server R Services Series
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Microsoft R Server
  - Data Science  
tags:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - Launchpad
  - Process Monitor
  - SqlSatellite
  - WireShark
  - sp_execute_external_script
description: A lowdown of sp_execute_external_script and its different parameters, using Process Monitor and WireShark
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - Launchpad
  - Process Monitor
  - SqlSatellite
  - WireShark
  - sp_execute_external_script   
---

This is the 22:nd post in a series about **Microsoft SQL Server R Services**. This journey started about a year ago when I thought it would be a good idea to write a couple of blog posts about, what then went under the name of, Microsoft SQL Server 2016 R Services. Never in my wildest fantasies did I think I would write over 20 posts.

> **NOTE:** Since the introduction of Microsoft SQL Server R Services, it has been renamed to **Microsoft SQL Server Machine Learning Services**.

To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

This series began with a discussion about how to install Microsoft SQL Server R Services and continued with the internals of how it works internally in SQL Server and the launchpad service. Throughout the series, we have used `sp_execute_external_script` when investigating what goes on. So, I thought that having a couple of posts looking at `sp_execute_external_script` would be a good way to finish this series off, and this post is the first of three about `sp_execute_external_script`.

<!--more-->

## Housekeeping 

Before we "dive" into today's topics let us look at the code and the tools we use today. This section is here for those of who want to follow along in what we are doing in the post.

#### Helper Tools

To help us figure out the things we want, we use *Process Monitor*, and *WireShark*: 

* *Process Monitor*, is used it to filter TCP traffic. If you want to refresh your memory about how to do it, we covered that in [Internals - X][si10] as well as in [Internals - XIV][si14].
* I use *WireShark* for network packet sniffing. If you want a refresher about *WireShark*, we covered the setup and so forth in [Internals - X][si10].

#### Code

The code below sets up the database and creates some tables with some data. The data is based on the [*Iris*][1] dataset:

```sql
USE master;
GO

DROP DATABASE IF EXISTS IrisTestDb;
CREATE DATABASE IrisTestDb;

USE IrisTestDb;
GO

DROP TABLE IF EXISTS dbo.tb_irisdata_full;
CREATE TABLE dbo.tb_irisdata_full 
(
  RowID int identity primary key, SepalLength float not null, 
  SepalWidth float not null, PetalLength float not null, 
  PetalWidth float not null, Species varchar(100) null
);
GO

DROP TABLE IF EXISTS dbo.tb_irisdata_even;
CREATE TABLE dbo.tb_irisdata_even 
(
  RowID int identity primary key, SepalLength float not null, 
  SepalWidth float not null, PetalLength float not null, 
  PetalWidth float not null, Species varchar(100) null
);
GO

DROP TABLE IF EXISTS dbo.tb_irisdata_uneven;
CREATE TABLE dbo.tb_irisdata_uneven 
(
  RowID int identity primary key, SepalLength float not null, 
  SepalWidth float not null, PetalLength float not null, 
  PetalWidth float not null, Species varchar(100) null
);
GO

INSERT INTO dbo.tb_irisdata_full( SepalLength, SepalWidth, 
                                  PetalLength, PetalWidth, Species)
EXECUTE sp_execute_external_script
  @language = N'R'
  , @script = N'iris_data <- iris;'
  , @input_data_1 = N''
  , @output_data_1_name = N'iris_data';

--split up the Iris data
INSERT INTO dbo.tb_irisdata_even( SepalLength, SepalWidth, 
                                  PetalLength, PetalWidth, Species)
SELECT SepalLength, SepalWidth, PetalLength, PetalWidth, Species 
FROM dbo.tb_irisdata_full
WHERE RowID % 2 = 0

INSERT INTO dbo.tb_irisdata_uneven( SepalLength, SepalWidth, 
                                    PetalLength, PetalWidth, Species)
SELECT SepalLength, SepalWidth, PetalLength, PetalWidth, Species 
FROM dbo.tb_irisdata_full
WHERE RowID % 2 = 1

/*
SELECT * FROM dbo.tb_irisdata_full
SELECT * FROM dbo.tb_irisdata_even
SELECT * FROM dbo.tb_irisdata_uneven
*/

```
**Code Snippet 1:** *Creating Database Objects and Generating Data*

The code in *Code Snippet 1* should be fairly self explanatory. The reason why we split up the full Iris dataset is to later on in this post handle multiple datasets.

## sp_execute_external_script

The first thing to do is to remind ourselves why we need `sp_execute_external_script` at all? Well, as opposed to SQLCLR, the external script engine is not embedded in SQL Server, but sits outside of SQL Server and runs in its own process - it is, (wait for it...), external :). So, if the external engine runs outside of SQL Server there needs to be a bridge between SQL and the engine - and `sp_execute_external_script` is that bridge.

In most of the blog posts in this series we have used `sp_execute_external_script` something like so (or with variants thereof):

``` sql
EXEC sp_execute_external_script  @language =N'R', 
                                 @script=N'OutputDataSet<-InputDataSet', 
                                 @input_data_1 =N'SELECT 42' 
      WITH RESULT SETS (([TheAnswer] int not null));  
GO 
```
**Code Snippet 2:** *Use of sp_execute_external_script*

When we compare *Code Snippet 2* with what the full signature of `sp_execute_external_script`, as in *Code Snippet 3*, we see that we have used `sp_execute_external_script` in a somewhat simplistic way:

``` sql
sp_execute_external_script 
             @language = N'language', 
             @script = N'script', 
             [ @input_data_1 = ] 'input_data_1' 
             [ , @input_data_1_name = ] N'input_data_1_name' ] 
             [ , @output_data_1_name = N'output_data_1_name' ] 
             [ , @parallel = 0 | 1 ] 
             [ , @params = ] N'@parameter_name data_type [ OUT | OUTPUT ] [ ,...n ]' 
             [ , @parameter1 = ] 'value1' [ OUT | OUTPUT ] [ ,...n ] 
[ WITH <execute_option> ] 
[;] 
```
**Code Snippet 3:** *Full Signature of sp_execute_external_script*

In a majority of the blog posts, the only parameters used are: `@language`, `@script` and sometimes `@input_data_1`, but as we see in *Code Snippet 3*, there are more:

* `@language`
* `@script`
* `@input_data_1`
* `@input_data_1_name`
* `@output_data_1_name`
* `@parallel`
* `@params`
* `@parameter1`

So, what are these parameters intended use? Let us find out.

## `@language`

By now we should know what the `@language` parameter is for. It is to tell the launchpad service which launcher dll to initialise, which in turn targets the correct external engine. At the time of writing, there are two external engines which we can use; R and Python, and I would expect Microsoft to add other engines over time. From my side, I would love to see being able to call into .NET - outside of the SQL Engine.

![](/images/posts/sql_r_services_ect_script1.png)

**Figure 1:** *External Script and Language*

*Figure 1* illustrates how the launchpad service chooses which launcher dll to launch based on the `@language` parameter.

> **NOTE:** [Microsoft SQL Server R Services - Internals II][si2] covers more about the launchpad service and different types of launchers.

The `@language` parameter is a required parameter.

## `@script`

The `@script` parameter defines the code the external engine executes, and is a required parameter:

```sql
EXEC sp_execute_external_script
                  @language = N'R',
                  @script = N'
                    iris_dataset <- iris
                    setosa <- iris[iris$Species == "setosa",]
                    meanSepWidth <- mean(setosa$Sepal.Width)
                    cat(paste("Seposa sepal mean width: ", meanSepWidth))';
```
**Code Snippet 4:** *Example of @script Parameter*

In *Code Snippet 4* we use the [*Iris*][1] dataset, and we calculate the mean of the [sepal][2] width for the setosa species. We pass the script as a literal in the `@script` parameter. Passing the script as a literal is quite common, and you can see it in most examples of `sp_execute_external_script`. It is however not required to pass the script as a literal; it can be passed as a variable as well as loaded from a source file. Code snippets 5 and 7 show examples of this:

```sql
DECLARE @scriptParam nvarchar(max) =  
                    N'iris_dataset <- iris
                    setosa <- iris[iris$Species == "setosa",]
                    meanSepWidth <- mean(setosa$Sepal.Width)
                    cat(paste("Seposa sepal mean width: ", meanSepWidth))';

EXEC sp_execute_external_script
                      @language = N'R',
                      @script = @scriptParam;
```
**Code Snippet 5:** *Script Passed in via a Variable*

So, in *Code Snippet 5* we see how the script is passed in as a variable (`@scriptParam`). A use case for this can be that you have scripts stored in a table in a database, and when you want to execute the script you load the particular script into a variable.

Onto loading a script via a source file; let us assume we have an R source file named `iris_r.r` with code like so:

```r
iris_dataset <- iris
setosa <- iris[iris$Species == "setosa",]
meanSepWidth <- mean(setosa$Sepal.Width)
cat(paste("Seposa sepal mean width: ", meanSepWidth))
```
**Code Snippet 6:** *R Source File Content*

The file is at: `c:\rscripts`. The way to execute `sp_execute_external_script` based on this looks like so:
                      
```sql
EXEC sp_execute_external_script
                      @language = N'R',
                      @script = N'source("c:/rscripts/iris_r.r")';
```
**Code Snippet 7:** *Script Passed in Through Source File*

We see in *Code Snippet 7* how we use the R command `source` to load the source code. The `source` command causes R to accept its input from the named file. Input is read and parsed from that file until the end of the file is reached, then the parsed expressions are evaluated sequentially in the chosen environment. When you use the `source` command, like in *Code Snippet 7*, the file path needs to be accessible by the external engine.

You may note how, in *Code Snippet 7*, the file path is defined like you would do in Linux: `c:/rscripts/iris_r.r`. To do it this way is not required, you can use Windows path definitions, but you have to escape the `\`, like this: `c:\\rscripts\\iris_r.r`. 

Oh, something to keep in mind is that the values for `@language`, `@script`, `@input_data_1`, `@input_data_1_name`, `@output_data_1_name` and `@params` all have to be explicit `nvarchar`. What I mean with that is when you assign a value to the particular parameter, it has to be `DECLARE`:ed as an `nvarchar`. An example of this is *Code Snippet 5* and the `@scriptParam` parameter. If the parameter value is not `DECLARE`:ed as an `nvarchar`, it has to prepended with `N` as we see for example in *Code Snippet 7*: `@language = N'R'` and `@script = N'source("c:/rscripts/iris_r.r")`. If you do not `DECLARE` or prepend with `N` you get an error like this:

![](/images/posts/sql_r_services_ext_script_nvarchar_error.png)

**Figure 2:** *Error non nvarchar Parameter Value*

One final thing about the `@script` parameter. Remember how we, back in [Internals - X][si10], discussed how SQL Server sends the actual script to the SqlSatellite via a socket connection? When we supply the script through a file name, the data sent is: `source("c:/rscripts/iris_r.r")`. It may be obvious, but I thought I would mention it regardless.

> **NOTE:** Later on in this post we talk some more about what SQL Server sends to the SqlSatellite.

## `@input_data_1`

The `@input_data_1` parameter, which is optional, specifies the input data used by the external script. You can only use a T-SQL `SELECT` statement to generate the data; so no stored procedure calls, but `SELECT` against views or table-valued functions work fine:

```sql
EXEC sp_execute_external_script
            @language = N'R',
            @script = N'
                iris_dataset <- InputDataSet
                setosa <- iris_dataset[iris_dataset$Species == "setosa",]
                meanSepWidth <- mean(setosa$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanSepWidth))',
            @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full'
```
**Code Snippet 8:** *Using @input_data_1 with straight SELECT*

In *Code Snippet 8* wee set how the `@input_data_1` parameter contains a `SELECT` statement against the `dbo.tb_irisdata_full` table, and the statement executes during the `sp_execute_external_script` execution (in [Internals - XIII][si13] we discussed when the statement was executed). The dataset generated by the query is referred to in the script as `InputDataSet`, and we discuss the naming later in this post. The `SELECT` does not have to be against a table, it can be, as I mentioned above, against a view or a user-defined function as well.

So this is straight-forward so far, but what about if you need multiple datasets loaded into the external engine? My first thought when I saw `sp_execute_external_script` and the `@input_data_1` parameter, was that if there is an `@input_data_1` parameter, then there surely must be `@input_data_2`, `@input_data_n` parameters as well. Well, there are not, bummer, so what do we do?

A thought would be to try and execute multiple statements from the same parameter and then in the script, parse out the different datasets, something like this: `@input_data_1 = N'SELECT * FROM dbo.tb_irisdata_even; SELECT * FROM dbo.tb_irisdata_uneven'. Good suggestion but no cigar, because when you try - this happens:

![](/images/posts/sql_r_services_ext_script_multi_error.png)

**Figure 3:** *Multi Statement Error*

The error we see in *Figure 3* is not very descriptive, but what it means is that you cannot have multiple `SELECT` statements generating **multiple** datasets. What you can do however is to use `UNION` or `UNION ALL`:

```sql
EXEC sp_execute_external_script
            @language = N'R',
            @script = N'
                iris_dataset <- InputDataSet
                setosa <- iris_dataset[iris_dataset$Species == "setosa",]
                meanSepWidth <- mean(setosa$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanSepWidth))',
            @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_even UNION ALL 
                              SELECT * FROM dbo.tb_irisdata_uneven';
```
**Code Snippet 9:** *SELECT with UNION ALL*

The code in *Code Snippet 9* uses the `UNION ALL` to combine the results of two or more queries into a single dataset. However, as useful as that is, sometimes that does not work: what if the two queries do not contain the same data types, or if you need two (or more) individual data-sets? In that case, the solution is to retrieve data from inside the script (in addition to the input data from `@input_data_1`). 

To retrieve data from within the external script, we can use `ODBC` (in R it is the `RODBC` package) or the highly optimized Microsoft [**`RevoScaleR`**][3] package. In the following example I use `RevoScaleR`:

```sql
EXEC sp_execute_external_script
        @language = N'R',
        @script = N'
          # set up connection string       
          sqlConnString <- "Driver=SQL Server;server=win10-dev;
                            database=IrisTestDb;uid=<some_uid>;pwd=<some_pwd>"
          
          # define the data
          mydata <- RxSqlServerData(table = NULL, 
                                    sqlQuery = "SELECT * 
                                    FROM dbo.tb_irisdata_uneven", 
                                    connectionString = sqlConnString)

          # open the dataset
          rxOpen(mydata)

          # read the data
          iris_uneven <- rxReadNext(mydata)
          versicolor <- iris_uneven[iris_uneven$Species == "versicolor",]
          meanSepWidthVersi <- mean(versicolor$SepalWidth)
          
          # get the data from the input data set
          iris_dataset <- InputDataSet
          setosa <- iris_dataset[iris_dataset$Species == "setosa",]
          meanSepWidth <- mean(setosa$SepalWidth)

          # output the data
          cat(paste("Seposa sepal mean width:", meanSepWidth, ".", 
                     "Versicolor sepal mean width:", meanSepWidthVersi))',
        @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_even';
```
**Code Snippet 10:** *Multiple Data Sets using RevoScaleR*

The code in *Code Snippet 10* shows how we read in data within the script by the use of `RevoScaleR` functionality together with the data from the `@input_data_1` parameter, and how we subsequently calculate `mean` on the two data-sets.

Cool, we have now seen how we pass data into the external script via the `@input_data_1` parameter, and how multiple data-sets can be used by querying data from inside the script. What about returning data to the caller, you know - like we quite often do from stored procedures?

## `@input_data_1_name` & `@output_data_1_name`

You may now wonder what this section has to do with returning data to the caller? Don't worry; we get there soon! 

So, there are some parameters in `sp_execute_external_script` that we have not used yet, and `@input_data_1_name` and `@output_data_1_name`, which both are optional, are two of them.

#### `@input_data_1_name`

We use this parameter to explicitly name the variable in the script that contains the data we pass into the external engine. But, hang on, we have not used the `@input_data_1_name` parameter in the various examples in this post where we pass data to the engine, and it still works? Ah, look in code snippets 8, 9 and 10, and you see a line of code: `iris_dataset <- InputDataSet`. Here `InputDataSet` defines the input data, and it so happens that the default value of `@input_data_1_name` is `InputDataSet`. 

So, let us see what happens if we change some things. Copy the code in *Code Snippet 8* and change it to this:

```sql
EXEC sp_execute_external_script
            @language = N'R',
            @script = N'
                iris_dataset <- InputDataSet
                setosa <- iris_dataset[iris_dataset$Species == "setosa",]
                meanSepWidth <- mean(setosa$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanSepWidth))',
            @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full',
            @input_data_1_name = N'MyDataSet'
```
**Code Snippet 11:** *Invalid Input Name*

As you see in *Code Snippet 11* we assign a name to the `@input_data_1_name` parameter, but in the script we still use `InputDataSet`. When we execute the following error happens:

![](/images/posts/sql_r_services_ext_script_input_name_error.png)

**Figure 4:** *Non Existent Input Data Object*

So the error is that the script cannot find the `InputDataSet` object. Change the line: `iris_dataset <- InputDataSet` to: `iris_dataset <- MyDataSet`, and execute again. Now all is OK.

How does the script know what the input data is, e.g. how does it know in *Code Snippet 11* that the data belongs to the `MyDataSet` variable? Well this comes back to, at least indirectly, what we discussed in [Internals - X][si10] and how SQL Server sent the script, plus other information, to the SqlSatellite.

Just for fun, let us revisit some of what we did in [Internals - X][si10]:

* Run *Process Monitor* as admin and load the filter we used in [Internals - X][si10] where we filtered for `TCP Receive` for `BxlServer.exe`.
* Execute the code in *Code Snippet 8* and look at the output from *Process Monitor* to see what packets SQL Server sends:

![](/images/posts/sql_r_services_ext_script_procmon1.png)

**Figure 4:** *Process Monitor Output*

The outlined packet in *Figure 4* is the packet containing the script SQL Server sent to the SqlSatallite. Notice the size of the packet and also make a note of the `Path` column and the last value (in the figure it is 50887). That value is the port with which SQL Server communicates with the SqlSatellite. We use this now in *WireShark* to try and see if we can get any more information about what is happening.

So, let us switch over to *WireShark*:

* Run *WireShark* as admin.
* Choose the network adapter to "sniff" on. See [Internals - X][si10] for discussion around loop-back adapters etc.
* Set a display filter on the port SQL Server listens on (the port you saw in the `Path` column). In this case, we want to sniff outgoing packets, and - if we used what we saw in *Figure 4* - the filter should subsequently be: `tcp.srcport==50887`.
* Apply the filter.

Execute the code in *Code Snippet 8* again, and look at the output from *WireShark*. In the output is a packet with the same length as the highlighted packet in *Figure 4*. This packet is the packet SQL Server sends to the SqlSatellite with the script (as discussed above). When we look at the data part of that packet as a hex dump, the 64 first bytes look like this: 

```c++
01 00 05 80 48 03 00 00  5c 46 19 98 6a 3f 9a 4f   ....H... \F..j?.O
9d b6 25 1f 62 7f 8b 50  00 00 06 00 00 00 00 00   ..%.b..P ........
00 00 00 00 1a 00 49 00  6e 00 70 00 75 00 74 00   ......I. n.p.u.t.
44 00 61 00 74 00 61 00  53 00 65 00 74 00 00 00   D.a.t.a. S.e.t...
```
**Code Snippet 12:** *WireShark Output I*

In *Code Snippet 8* we did not define a name for the input data set, but in the script, we used `InputDataSet` as a variable name - as that is the default. When looking at the hex dump in *Code Snippet 12* we see the name `InputDataSet` 38 bytes into the packet. So it looks like the name we give the data set is being part of the script data SQL Server sends to the SqlSatellite. We can potentially prove that theory by executing the code in *Code Snippet 11* (remember to change the code that refers to the data set to: `iris_dataset <- MyDataSet`) and see what *WireShark* outputs:

```c++
01 00 05 80 3c 03 00 00  82 a4 40 22 b4 3a 05 4b   ....<... ..@".:.K
9a d0 03 f2 df 19 96 4f  00 00 06 00 00 00 00 00   .......O ........
00 00 00 00 14 00 4d 00  79 00 44 00 61 00 74 00   ......M. y.D.a.t.
61 00 53 00 65 00 74 00  00 00 1c 00 4f 00 75 00   a.S.e.t. ....
```
**Code Snippet 13:** *WireShark Output II*

Ok, so when we look at the code in *Code Snippet 13* we see how the input data set name that we assigned through the `@input_data_1_name` parameter is part of the packet. 

So we can answer the question how the script knows what variable contains input data by pointing to how SQL Server passes the name of the input data variable as part of the script. Worth noticing is how, in the two packets above, at 36 bytes into the packet, the size of the variable name (in double bytes) plus two bytes are defined. In *Code Snippet 12* it is hex: `1a` (decimal 26) , and in *Code Snippet 13* it is hex: `14` (decimal 20).

#### `@output_data_1_name`

Finally, we get to how the script knows to return resultsets to the caller. Let us assume that you want to do some calculations on the data passed in through the `MyDataSet` variable in *Code Snippet 11* and then return that data. Maybe something like so:

```sql
EXEC sp_execute_external_script
      @language = N'R',
      @script = N'
          iris_dataset <- MyDataSet
          setosa <- iris_dataset[iris_dataset$Species == "setosa",]
          meanSepWidth <- mean(setosa$SepalWidth)
          cat(paste("Seposa sepal mean width: ", meanSepWidth))
          multiplier <- 5
          iris_dataset$SepalLength <- iris_dataset$SepalLength * multiplier
          OutputDataSet <- data.frame(iris_dataset$SepalLength)',
      @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full',
      @input_data_1_name = N'MyDataSet'
```
**Code Snippet 14:** *Return a Result Set*

When you execute the code in *Code Snippet 14*, part of the resultset looks like this:

![](/images/posts/sql_r_services_ext_script_output1.png)

**Figure 5:** *Result Set*

In *Figure 5* we see how a resultset comes back, and looking at the code in *Code Snippet 14*, and knowing about `InputDataSet`, we assume that the reason a resultset comes back is that of the `OutputDataSet` variable in the script. It turns out that assumption is correct.

Similar to the input data variable and its default name, the output data variable has a default name: `OutputDataSet`. You can change this name by setting the `@output_data_1_name` variable to a name of your choice, and reference that name in the script:

```sql
EXEC sp_execute_external_script
      @language = N'R',
      @script = N'
          iris_dataset <- MyDataSet
          setosa <- iris_dataset[iris_dataset$Species == "setosa",]
          meanSepWidth <- mean(setosa$SepalWidth)
          cat(paste("Seposa sepal mean width: ", meanSepWidth))
          multiplier <- 5
          iris_dataset$SepalLength <- iris_dataset$SepalLength * multiplier
          SepalLengthMult <- data.frame(iris_dataset$SepalLength)',
      @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full',
      @input_data_1_name = N'MyDataSet',
      @output_data_1_name = N'SepalLengthMult';
```
**Code Snippet 15:** *Customised Result Set Name*

In *Code Snippet 15* we changed the name of the output data variable to `SepalLengthMult` and referenced it in the script.

The script engine (and script) knows about the variable name in the same way as it does for the input data variable - it is part of the script packet that SQL Server sends to the SqlSatellite. Below is a partial hex dump of the packet SQL Server sends when we execute the code in *Code Snippet 15*:

```c++
01 00 05 80 66 04 00 00  e5 fe 5a d3 1f e3 7d 4a   ....f... ..Z...}J
8e 68 95 ee 31 59 75 38  00 00 06 00 00 00 00 00   .h..1Yu8 ........
00 00 00 00 14 00 4d 00  79 00 44 00 61 00 74 00   ......M. y.D.a.t.
61 00 53 00 65 00 74 00  00 00 20 00 53 00 65 00   a.S.e.t. .. .S.e.
70 00 61 00 6c 00 4c 00  65 00 6e 00 67 00 74 00   p.a.l.L. e.n.g.t.
68 00 4d 00 75 00 6c 00  74 00 00 00 38 01 00 00   h.M.u.l. t...8...
```
**Code Snippet 16:** *WireShark Output OutputData*

In the hex dump in *Code Snippet 16* we see the name of the output dataset variable starting at byte 60. We can also see at byte 58 how the length of the output data variable is defined, plus two bytes: hex `20`.

So, `@output_data_1_name` specifies the name of the variable in the external script that contains the data to be returned to SQL Server when the stored procedure completes. There is an implicit expectation of the data type of the output; for R the expectation is a data frame, and for Python, it is a pandas data frame.

Oh, a last thing about the output data. When you look at *Figure 5* you see that the resultset has no column names. By default `sp_execute_external_script` returns resultsets with unnamed columns as column names within a script are local. If you want to name columns you use the `WITH RESULTS SET` clause of the `EXECUTE`:

```sql
EXEC sp_execute_external_script
      @language = N'R',
      @script = N'
          iris_dataset <- MyDataSet
          setosa <- iris_dataset[iris_dataset$Species == "setosa",]
          meanSepWidth <- mean(setosa$SepalWidth)
          cat(paste("Seposa sepal mean width: ", meanSepWidth))
          multiplier <- 5
          iris_dataset$SepalLength <- iris_dataset$SepalLength * multiplier
          SepalLengthMult <- data.frame(iris_dataset$SepalLength)',
      @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full',
      @input_data_1_name = N'MyDataSet',
      @output_data_1_name = N'SepalLengthMult'
WITH RESULT SETS ((LengthMultiplied float));
```
**Code Snippet 17:** *Define Column Name*

In *Code Snippet 17* we defined the column coming back with a name of `LengthMultiplied` and that the column should have a data type of `float`. When we execute the code we see this:

![](/images/posts/sql_r_services_ext_script_output2.png)

**Figure 6:** *Result Set*

Looking at *Figure 6* we see how we received a result set consisting of one column named `LengthMultiplied`. `WITH RESULT SETS` is not something specific for `sp_execute_external_script` but an option on the `EXECUTE` statement. If you are interested in what happens when you execute `sp_execute_external_script` with the `WITH RESULT SETS` option, I covered it in [Internals - XVIII][si18].

## Summary 

In this post we have looked at some of the parameters `sp_execute_external_script` expects:

* `@language` - tells the launchpad service what external engine to use. At the moment R and Python are supported.
* `@script` - defines the script which the external engine executes. The script can be loaded as a literal value, a parameter or through the R `source(file_name)` command.
* `@input_data_1` - specifies the input data used by the external script in the form of a Transact-SQL query (`SELECT` only, no procedure calls). The query can only generate one dataset. If more datasets are required, they have to be retrieved from inside the script.
* `@input_data_1_name` - specifies the name of the variable used to represent the query defined by @input_data_1. The parameter is optional, and defaults to `InputDataset`.
* `@output_data_1_name` - specifies the name of the variable in the external script that contains the data to be returned to SQL Server when the stored procedure completes. The parameter is optional, and defaults to `OutputDataSet`.

All of the above parameter values have to be of the  `NVARCHAR` data type.

In next blog post we cover some of the remaining parameters for `sp_execute_external_script`.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright



[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[si2]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
[si3]: {{< relref "2017-04-13-microsoft-sql-server-r-services---internals-iii.markdown" >}}
[si4]: {{< relref "2017-04-23-microsoft-sql-server-r-services---internals-iv.markdown" >}}
[si5]: {{< relref "2017-05-01-microsoft-sql-server-r-services---internals-v.markdown" >}}
[si6]: {{< relref "2017-05-16-microsoft-sql-server-r-services---internals-vi.markdown" >}}
[si7]: {{< relref "2017-07-11-microsoft-sql-server-r-services---internals-vii.markdown" >}}
[si8]: {{< relref "2017-07-22-microsoft-sql-server-r-services---internals-viii.markdown" >}}
[si9]: {{< relref "2017-08-18-microsoft-sql-server-r-services---internals-ix.markdown" >}}
[si10]: {{< relref "2017-08-29-microsoft-sql-server-r-services---internals-x.markdown" >}}
[si11]: {{< relref "2017-10-20-microsoft-sql-server-r-services---internals-xi.markdown" >}}
[si12]: {{< relref "2017-10-31-microsoft-sql-server-r-services---internals-xii.markdown" >}}
[si13]: {{< relref "2017-11-11-microsoft-sql-server-r-services---internals-xiii.markdown" >}}
[si14]: {{< relref "2017-11-25-microsoft-sql-server-r-services---internals-xiv.markdown" >}}
[si15]: {{< relref "2017-12-02-microsoft-sql-server-r-services---internals-xv.markdown" >}}
[si16]: {{< relref "2017-12-24--microsoft-sql-server-r-services---internals-xvi.markdown" >}}
[si17]: {{< relref "2018-01-03-microsoft-sql-server-r-services---internals-xvii.markdown" >}}
[si18]: {{< relref "2018-01-10-microsoft-sql-server-r-services---internals-xviii.markdown" >}}
[si19]: {{< relref "2018-01-20-microsoft-sql-server-r-services---internals-xix.markdown" >}}
[si20]: {{< relref "2018-02-02-microsoft-sql-server-r-services---internals-xx.markdown" >}}



[1]: https://en.wikipedia.org/wiki/Iris_flower_data_set
[2]: https://en.wikipedia.org/wiki/Sepal
[3]: https://docs.microsoft.com/en-us/machine-learning-server/r-reference/revoscaler/revoscaler
