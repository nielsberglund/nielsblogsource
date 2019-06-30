---
layout: post
title: Interesting Stuff - Week 41
author: nielsb
date: 2017-10-13T06:27:44+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2017
  - SSMS
  - TDSP
  - kafka
  - flink
  - AthenaX
description: Apache Kafka and Flink in the news, AthenaX, and other interesting things
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2017
  - SSMS
  - TDSP
  - kafka
  - flink
  - AthenaX  
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, for the week just gone by. This week, the roundup comes a bit early due to me having to go abroad at the weekend for a week. 

<!--more-->

## .NET

* [.NET Core and .NET Standard: What Is the Difference?][1]. An article from [InfoQ][iq] discussing the differences between .NET Core, and .NET Standard.

## SQL Server

* [What’s new in SQL Server Management Studio 17.3][2]. SQL Server 2017 was released during [Microsoft Ignite][3] a couple of weeks ago. This week the latest version of **SQL Server Management Studio** (**SSMS**) was released. This blogpost looks at what is new in the latest SSMS version.

## Databases

* [Is Facebook replacing its MySQL database with something more dynamic][4]. This post speculates whether Facebook is about to replace their MySql databases, and it talks about Facebook's in-house NoSql database; **Apollo**.

## Streaming

The "war" between Apache Kafka and Apache Flink of which has the best SQL implementation for streaming data continues (I wrote about it in the roundups for week [35][wr35] and [36][wr36]). This week there has been posts about SQL for streaming data from both Kafka as well as Flink.

* [Uber Introduces Open Source AthenaX, A Streaming SQL Platform Powered By Apache Flink][5]. This is very awesome. Uber has open sourced its streaming analytics platform [AthenaX][6]. This is definitely something we at [Derivco](/Derivco) will have a very close look at.
* [Using Kafka Streams API for predictive budgeting][7]. A post how Pinterest uses Kafka Streams API to provide inflight spend data to thousands of ads servers in mere seconds.
* [Getting Started Analyzing Twitter Data in Apache Kafka through KSQL][8]. How to use [KSQL][9] (KSQL is the open source streaming SQL engine for Apache Kafka) to query, analyse and transform data in Kafka. 

## Data Science

* [The Microsoft Team Data Science Process (TDSP) – Recent Updates][10]. [Microsoft Team Data Science Process (TDSP)][11] is an agile, iterative data science methodology to deliver predictive analytics solutions and intelligent applications efficiently. Its first version was released in September 2016. This post provides an overview of recent developments involving TDSP, including recent releases and how its adoption has gone since the first public release.
* [Create an Azure Machine Learning Web Service with Python and Azure DSVM][12]. A short and sweet tutorial how to use Python together with the Azure Data Science Virtual Machine (DSVM).

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: https://www.infoq.com/news/2017/10/dotnet-core-standard-difference
[2]: https://blogs.technet.microsoft.com/dataplatforminsider/2017/10/10/whats-new-in-sql-server-management-studio-17-3/
[3]: https://www.microsoft.com/en-us/ignite/default.aspx
[4]: http://opensourceforu.com/2017/10/facebook-replacing-mysql-database-something-dynamic/
[wr35]: {{< relref "2017-09-03-interesting-stuff---week-35.markdown" >}}
[wr36]: {{< relref "2017-09-10-interesting-stuff---week-36.markdown" >}}
[5]: https://data-artisans.com/blog/uber-introduces-open-source-athenax-streaming-sql-platform-apache-flink
[6]: https://github.com/uber/AthenaX
[7]: https://medium.com/@Pinterest_Engineering/using-kafka-streams-api-for-predictive-budgeting-9f58d206c996
[8]: https://www.confluent.io/blog/using-ksql-to-analyse-query-and-transform-data-in-kafka
[9]: https://github.com/confluentinc/ksql/
[10]: https://blogs.technet.microsoft.com/machinelearning/2017/10/09/the-microsoft-team-data-science-process-tdsp-recent-updates/
[11]: https://docs.microsoft.com/en-us/azure/machine-learning/team-data-science-process/overview
[12]: https://medium.com/towards-data-science/create-an-azure-machine-learning-web-service-with-python-and-azure-dsvm-f7a16a925c4b
