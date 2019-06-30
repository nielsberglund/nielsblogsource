---
layout: post
title: Interesting Stuff - Week 20
author: nielsb
date: 2017-05-21T20:08:21+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - Microsoft Azure
  - Azure Cosmos DB
  - Kafka
  - Flink
  - SQL Server 2017
  - SQL Serer R Services
  - Facebook Prophet
description: This week we look at SQL Server 2017 CTP 2.1, Apache Flink, Kafka, Azure Cosmos DB, Facebook Prophet and other "cool" stuff.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - Microsoft Azure
  - Azure Cosmos DB
  - Kafka
  - Flink
  - SQL Server 2017
  - SQL Serer R Services
  - Facebook Prophet  
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, for the week just gone by. 

<!--more-->

## SQL Server

* [SQL Server 2017 CTP 2.1 now available][1]. The title says it all. CTP 2.1 of SQL Server 2017 has been released.
* [Try new SQL Server command line tools to generate T-SQL scripts and monitor Dynamic Management Views][2]. Microsoft has released for public preview two new command line tools for SQL Server:
    * mssql-scripter: generate `CREATE` and `INSERT` T-SQL scripts for database objects in SQL Server, Azure SQL DB, and Azure SQL DW from the command line.
    * DBFS: exposing live data from SQL Server Dynamic Management Views (DMVs) as virtual files in a virtual directory on Linux operating systems

## Streaming

* [Introducing Official Docker Images for Apache Flink][3]. From Flink version 1.2.1, Flink will have an official Docker image. This should make it a lot easier to get up and running with Apache Flink.
* [Confluent Cloud, Apache Kafka as a Service in AWS][4]. Somewhat in the same vein as the Apache Flink above, this is about deploying Kafka based solutions in Amazon Web Services through Confluent Cloud. The really interesting bit for me is that they are planning to do this for Microsoft Azure as well.

## Cloud

* [With Cosmos DB, Microsoft wants to build one database to rule them all][5]. A Microsoft Build 2017, Microsoft introduced the successor to Document DB, Azure Cosmos DB. This post is Tech Crunch's take on Cosmos DB.
* [A technical overview of Azure Cosmos DB][6]. More about Azure Cosmos DB. This post drills down in the tech behind Cosmos DB. It is very, very interesting!

## Data Science

* [R and Python support now built in to Visual Studio 2017][7]. The latest version of Visual Studio 2017 now has built-in support for programming in R and Python! It is exposed as a "Data Science Workload".
* [R in Financial Services: Challenges and Opportunities][8]. Theis blog-post from the guys at [Revolution Analytics][re] links to a presentation about R in financial services from the New York R Conference earlier this year. I found the presentation really good, and picked up some useful "stuff".

## Shameless Self Promotion

I've been "sort of" productive, and managed to get two blog-posts out there (not bad if I may say so myself):

* [Microsoft SQL Server R Services - Internals VI][si6]. In this internals post I drill down, and look at the directories being created when executing an external script in SQL Serer R Services.
* [Facebook Prophet and Microsoft R Server][9]. Earlier in the week there was a question on the Microsoft R Server forum, about using Facebook Prophet (time series analysis and prediction) with Microsoft R Server and SQL Server R Services. I found the question interesting and decided to test it out. This post is the result of the testing I did.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: https://blogs.technet.microsoft.com/dataplatforminsider/2017/05/17/sql-server-2017-ctp-2-1-now-available/
[2]: https://blogs.technet.microsoft.com/dataplatforminsider/2017/05/17/try-new-sql-server-command-line-tools-to-generate-t-sql-scripts-and-monitor-dynamic-management-views/
[3]: https://data-artisans.com/blog/official-docker-images-apache-flink
[4]: https://www.infoq.com/news/2017/05/Confluent-Cloud-Kafka-AWS
[5]: https://techcrunch.com/2017/05/10/with-cosmos-db-microsoft-wants-to-build-one-database-to-rule-them-all/
[6]: https://azure.microsoft.com/en-us/blog/a-technical-overview-of-azure-cosmos-db
[7]: http://blog.revolutionanalytics.com/2017/05/r-and-python-support-now-built-in-to-visual-studio-2017.html
[8]: http://blog.revolutionanalytics.com/2017/05/r-in-financial-services-presentation.html
[9]: {{< relref "2017-05-20-facebook-prophet-and-microsoft-r-server.markdown" >}}
[si6]: {{< relref "2017-05-16-microsoft-sql-server-r-services---internals-vi.markdown" >}}
