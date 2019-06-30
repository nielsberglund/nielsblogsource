---
layout: post
title: Microsoft SQL Server 2016 R Services Installation
author: nielsb
date: 2017-03-04T10:19:22+02:00
comments: true
categories:
  - SQL Server
  - Microsoft R Server
  - Data Science
  - SQL Server R Services Series
  - SQL Server R Services
  - SQL Server Machine Learning Services
tags:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - RevoScaleR
  - Python
  - Julia
description: SQL Server R Services series. This first post look at installation of SQL Server R Services.
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - RevoScaleR
  - Python
  - Julia   
---

A couple of weeks beck I wrote a [blog-post where I compared CRAN R with Microsoft R Server][5]. The comparison was basically how large data sets are handled. In the post I mentioned that SQL Server 2016 (and later) is the delivery mechanism for Microsoft R Server on the Windows platform. In this post we will look at how to install and enable SQL Server R Services.

This post is the first in a series of posts about SQL Server R Services and to see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

<!--more-->

In the "Microsoft R Server" post I wrote that CRAN R, as good as it is, in certain scenarios it is less then ideal:

* Data movement - the data you work with has to be moved from source to your machine.
* Operationalization - having created an awesome model, how do you put it in production.
* Scale / performance - R is single threaded and all data has to be in memory.

SQL Server R Services addresses these issues, which we will see later. For now let us see what SQL Server R Services is.

## Introduction

Back in 2015 Microsoft bought Revolution Analytics. Revolution Analytics is a company who developed a big data, large scale multiprocessor computing, and multi-core functionality version of R: **Revolution R Enterprise**, which Microsoft re-branded to Microsoft R Server. At the heart of Microsoft R Server is RevoscaleR; an R package providing both High Performance Computing (HPC) and High Performance Analytics (HPA) capabilities for R.  HPC allows distribution of the execution of essentially any R function across cores and nodes, and deliver the results back to the user, whereas HPA adds the ability to handle very large datasets (Big Data).

SQL Server R Services is the conduit between SQL Server and Microsoft R Server, and allows the execution of R code from inside SQL Server. Hmm, execution of R code from inside SQL Server, let's think about the implications of being able to do that, and put that in relation to the CRAN R issues above:

* A data scientist can theoretically create his model(s) from inside the database. If the source of the data is the database, there are no movement of data.
* The model(s) can be stored in the database and subsequently be used to analyze/predict new data. For example, a stored procedure can be created to output predictions. All of a sudden the issue of operationalization has been solved.
* SQL Server is multi-threaded and supports parallelism, which should take care of the scale and performance issues in R. Furthermore the various RevoScaleR functions are optimized for multi-threading as well as large data volumes. 

> **NOTE:** If you are executing R code from an IDE (and not from inside SQL Server), you can still have your code execute on SQL Server by using an RevoScaleR feature; the *compute context*. The *compute context* is not "in scope" for this blog-post, but you can read more about it [here][1].     

## Installation

The SQL Server R Services has to be explicitly installed in SQL Server, it is not like SQLCLR - which just needs to be enabled. Installing SQL Server R Service can be done when installing a new SQL Server instance or it can be added afterwards as a new feature. Here we'll see how we install the R Services together with a new instance of SQL Server:

![](/images/posts/sql_installation_type.png)

**Figure 1:** *SQL Server Installation Type*

In *Figure 1* we are choosing to do a new installation of SQL Server. We then choose what features we want installed:

![](/images/posts/sql_r_services_in_db.png)

**Figure 2:** *Features to Install*

When you install SQL Server 2016, you find a new feature under the *Database Engine Services*: *R Services (In-Database)*, as in Figure 2. This is the install option when you want to integrate with R from within SQL Server. In the *Feature Selection* dialog, under *Shared Features* you also have *R Server (Standalone)*, what is that all about:

![](/images/posts/sql_windows_r_server.png)

**Figure 3:** *Windows R Server*

SQL Server 2016 acts as the delivery mechanism for Microsoft R Server on Windows, and the *R Server* feature allows you to install Microsoft R Server independent of SQL Server. For example, if a data scientist want to run R on his or her own machine.

> **NOTE:** You may wonder why, in *Figure 3*, the check box for R Server is checked, but "dimmed" out? This is because, on this particular machine, I have already installed the standalone R Server once.

Go ahead and install after you have chosen the various features to install on your new instance. After successful installation we should check and make sure everything works, but before that let's talk about a couple of very important pieces of the SQL Server R Services "puzzle".

## SQL Server Launchpad

Let us start with the launchpad service. After installation, if you go to *Services*, you will see your newly installed SQL Server instance *SQL Server (InstanceName)*, but also a new service which hasn't been in earlier versions of SQL Server; the Launchpad service. You can see it in *Figure 4* below:

![](/images/posts/sql_launchpad.png)

**Figure 4:** *Windows R Server*

In the *Introduction* section I wrote how SQL Server R Services is the conduit between SQL Server and Microsoft R Server, and the launchpad service plays a big part of this. The service acts as a "routing" mechanism between SQL Server and external languages/runtimes. The responsibility of the launchpad service is to "spin up" and calling into the correct runtime when calling from inside SQL Server.

> **NOTE:** Right now, the only "runtime"/language supported by the launchpad service is R.

Another piece of the "puzzle" is the the extended stored procedure: `sp_execute_external_script`

## sp_execute_external_script

This is the procedure that will be used when executing R code inside SQL Server. The procedure will call into the launchpad service, and have the launchpad service "route" the call to the correct runtime.

The syntax for the procedure as copied from [MSDN][2], looks like so:

``` sql
sp_execute_external_script 
             @language = N'language', 
             @script = N'script', 
             @input_data_1 = ] 'input_data_1' 
             [ , @input_data_1_name = ] N'input_data_1_name' ] 
             [ , @output_data_1_name = 'output_data_1_name' ] 
             [ , @parallel = 0 | 1 ] 
             [ , @params = ] N'@parameter_name data_type [ OUT | OUTPUT ] [ ,...n ]' 
             [ , @parameter1 = ] 'value1' [ OUT | OUTPUT ] [ ,...n ] 
[ WITH <execute_option> ] 
[;] 

<execute_option>::= 
{ 
  { RESULT SETS UNDEFINED } 
  | { RESULT SETS NONE } 
  | { RESULT SETS ( <result_sets_definition> ) } 
}  

<result_sets_definition> ::=  
{ 
  (
    { column_name 
      data_type 
      [ COLLATE collation_name ] 
      [ NULL | NOT NULL ] } 
      [,...n ]  
  ) 
  | AS OBJECT 
      [ db_name . [ schema_name ] . | schema_name . ] 
      {table_name | view_name | table_valued_function_name } 
  | AS TYPE [ schema_name.]table_type_name 
}
```
**Code Snippet 1:** *Syntax of sp_execute_external_script*

If you look at the syntax and thinks it looks convoluted, you are right. But do not worry, in a future blog-post we will look more in detail at what `sp_execute_external_script` does, and further down in this post we will see a very simple example of it. One thing to notice though is the first parameter in the proc: `@language`. This parameter defines the language/runtime, and as mentioned a couple of times before, right now the only language/runtime supported is R. There are rumors that [Python][3] will be supported in the future, as well as [Julia][4].

## Making Sure it Works

Now when we have installed the SQL Server R Services, and also have had a (very) short introduction to some of the "moving parts", let's enable SQL Server R Services, and execute something to actually see it works. 

### Enable SQL Server R Services

Enable, what do you mean enable? I have just installed it, isn't that enough? No it is not, after installation you need to enable the services. This is a bit like what you do with SQLCLR, you are enabling the execution of SQLCLR on the instance. Here you enable the execution of external scripts. To enable external scripts you change the configuration of the SQL Server instance you are on:

``` sql
EXEC sp_configure  'external scripts enabled', 1 
RECONFIGURE  WITH OVERRIDE  
```
**Code Snippet 2:** *Execute sp_configure*

When you have executed the code as in *Code Snippet 2*, you might think all is good. Unfortunately it is not, you now have to restart the instance of SQL Server! However, after the restart you can test and see that it works.

### Executing R Script

To test it out we will execute a very simple R script:

``` sql
EXEC sp_execute_external_script  @language =N'R', 
                                 @script=N'OutputDataSet<-InputDataSet', 
                                 @input_data_1 =N'SELECT 42' 
      WITH RESULT SETS (([TheAnswer] int not null));  
GO 
```
**Code Snippet 3:** *Test That R Installation Works*

Let's look at the various parts of the code in *Code Snippet 3*:

* We start with the `@language` parameter. We now know that it should be R.
* Then we define the `@script` parameter. This is where our R code will go. In the code we are saying that output data (`OutputDataSet`) is whatever coming in (`InputDataSet`).
* In `@inout_data_1` we define the input dataset
* We finally "formats" the output in the `WITH RESULT SETS ...` part.

When you execute the code, the output should be like so:

![](/images/posts/r_result_set.png)

**Figure 5:** *Result of Execution of R Script*

Congratulations, you have now executed R code inside SQL Server. How cool is that?! 

In future blog-posts we will look at:

* How things work under the cover
* What exactly is `sp_execute_external_script`
* Some real world examples

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[1]: https://msdn.microsoft.com/microsoft-r/scaler/rxcomputecontext
[2]: https://msdn.microsoft.com/en-us/library/mt604368.aspx
[3]: https://www.python.org/
[4]: http://julialang.org/
[5]: {{< relref "2017-02-25-microsoft-r-server.markdown" >}}

