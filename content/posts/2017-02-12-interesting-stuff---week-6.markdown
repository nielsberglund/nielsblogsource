---
layout: post
title: Interesting Stuff - Week 6
author: nielsb
date: 2017-02-12T06:32:10+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQLCLR
  - R
  - RabbitMQ
  - Microsoft R Services
description: Weekly roundup of what interesting stuff I have found.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQLCLR
  - R
  - RabbitMQ
  - Microsoft R Services   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that have been most interesting to me, this week. 

<!--more-->

This week has been somewhat hectic work-wise, so I have not read as much as I have wanted, but this is what I found.

## Streaming

* [Apache Flink Community Announces 1.2.0 Release][2]. **Flink** is a high-performing stream processing framework. They have now released version 1.2, which adds really exciting new functionality to the engine.
* [Hazelcast Release Jet, Open-Source Stream Processing Engine][3]. While we are on the subject of stream processing engines, this article is about a new stream processing engine that has some new innovative thinking in the way it works.

## Distributed Computing

* [Virtual Panel: Microservices in Practice][4]. Panel discussion about the state of art of Microservices, and how they are likely to evolve.

## SQL Server

* [Extreme 25x compression of JSON data using CLUSTERED COLUMNSTORE INDEXES][5]. In [last weeks roundup][6], I pointed out a [post][7] by Jovan Popovic about JSON data and Clustered Column Store Indexes. This weeks post drills further into it and shows how you can get really impressive compression of the data. 
* [Exporting tables from SQL Server in json line-delimited format using BCP.exe][8]. More by Jovan. This time how SQL Server can be used to export content of tables into line-delimited JSON format.
* [SQL Server First Responder Kit][9]. Through an [article][10] in [InfoQ][11], I came across this very handy tool for anyone that has to do any kind of work with SQL Server.

## Data Science

* [Build an intelligent app with SQL Server and R][12]. By now it should be pretty clear that SQL Server 2016, has some very impressive capabilities when it comes to Data Science. This post outlines how to get started and building a predictive model, using SQL Server 2016 and **R**.
* [Retail customer analytics with SQL Server R Services][13]. More about SQL Server and R. This time about analytics of retail customers.
* [Machine Learning Your Way to Smarter API Error Responses][14]. Presentation about how Machine Learning can be used to help you understand malformed API requests and to be able to respond with a best fit response, as well as capturing the user errors for future responses.
* [Machine Learning and End-to-End Data Analysis Processes in Spark Using Python and R][15]. Presentation by Debraj GuhaThakurta from the Microsoft Azure Machine Learning group, where he talks about machine learning and data analysis processes in Spark using Python and R.

## Big Data and Data Lakes

* [Load Data from Azure Data Lake into Azure SQL Data Warehouse at 3TB/Hour][16]. Post about how to use SQL Server Data Warehouse PolyBase support to load data from Azure Data Lake Storage into SQL Server Data Warehouse.

## Shameless Self Promotion

So this is my shameless self promotion part, where I point out posts I have written etc. 

* [RabbitMQ - SQL Server][17]. Post about how to send data from SQL Server to RabbitMQ.
* [satRday - Cape Town][18]. This is the second satRday conference ever - worldwide! My talk is about Microsoft R Server, and how it compares to CRAN R. I do believe there are still available seats, so come by and say Hi!

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[de]: (/derivco)
[1]: https://blog.acolyer.org
[2]: http://data-artisans.com/apache-flink-1-2-0/
[3]: https://www.infoq.com/news/2017/02/HazlecastJetOSS
[4]: https://www.infoq.com/articles/microservices-in-practice
[5]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/02/09/extreme-25x-compression-of-json-data-using-clustered-columnstore-indexes/
[6]: {{< relref "2017-02-05-interesting-stuff---week-5.markdown" >}}
[7]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/02/02/json-data-in-clustered-column-store-indexes/
[8]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/02/09/exporting-tables-from-sql-server-in-json-line-delimited-format-using-bcp-exe/
[9]: https://github.com/BrentOzarULTD/SQL-Server-First-Responder-Kit
[10]: https://www.infoq.com/news/2017/02/SQL-First-Responder
[11]: https://www.infoq.com/news/
[12]: https://www.microsoft.com/en-us/sql-server/developer-get-started/r
[13]: http://blog.revolutionanalytics.com/2017/02/retail-applications-with-microsoft-r.html
[14]: https://www.infoq.com/presentations/machine-learning-api-response
[15]: https://www.infoq.com/presentations/big-data-spark-python-r
[16]: https://blogs.technet.microsoft.com/machinelearning/2017/02/09/load-data-from-azure-data-lake-into-azure-sql-data-warehouse-at-3tbhour/
[17]: {{< relref "2017-02-11-rabbitmq---sql-server.markdown" >}}
[18]: http://capetown2017.satrdays.org/
