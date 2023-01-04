---
layout: post
title: Interesting Stuff - Week 12
author: nielsb
date: 2018-03-25T11:12:17+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2017
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Microsoft Machine Learning Server
  - kafka
  - spark
  - Azure Databricks
  - EventHubs
description: Resource usage in SQL Server, EventHubs and Spark, Azure Databricks, and a lot of other interesting things!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2017
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Microsoft Machine Learning Server
  - kafka
  - spark
  - Azure Databricks
  - EventHubs   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending.

<!--more-->

## SQL Server

* [SQL Server 2017 Improved Resource Usage On Smaller Machines][1]. Bob Dorr talks about improvements he did in SQL Server 2017 CU4 to improve resource usage on smaller machines. Some interesting tidbits about SQLCLR and garbage collection!
* [SSMS 17.6 is now available: Managed Instance and many bug fixes][2]. A blog post announcing the release of **SQL Server Management Studio** (SSMS) 17.6. Go and grab it before Microsoft runs out of stock!

## .NET

* [Exploring the internals of the .NET Runtime][3]. An excellent blog post by [Matthew][mattw] how he drills down into and figures out how the .NET runtime works. A bonus to this post is the link to the [**Book of the Runtime**][4].

## Distributed Computing

* [Anatomical similarities and differences between Paxos and blockchain consensus protocols][5]. An interesting blog post by [Murat][murba] where he compares the [**Paxos**][6] protocol with blockchain consensus protocols.

## Streaming

* [Devoxx 2017 – Rethinking Services With Stateful Streams][7]. A presentation from [Devoxx][8] 2017, where [Ben Stopford][benstop] talks about microservices and streaming using Kafka. This presentation is a must watch if you do microservices!
* [Azure Event Hubs integration with Apache Spark now generally available][9]. This post is an announcement from the Microsoft Azure EventHub team that integration between EventHubs and Apache Spark in Azure is now available across regions. The Spark integration is cool, but I would like to see integration with Apache Flink as well.
* [KSQL in Action: Enriching CSV Events with Data from RDBMS into AWS][11]. In last weeks [roundup][wr11_18] I linked to a [post][10] by [Robin Moffat][rmoff] where he discussed Apache Kafka integration with relational databases. In this link, [Robin][rmoff] takes the database integration a step further and shows how we can enrich streaming data with database data in real-time!

## Data Science

* [Azure Databricks, industry-leading analytics platform powered by Apache Spark][12]. Another Azure announcement: this is about how **Azure Databricks** - an Apache Spark based analytics platform optimised for Azure - is now available across regions in Azure.
* [R and Docker][13]. In the [roundup][wr11_18] from last week I linked to a [post][14] about Data Science and Docker, and in this post from [David][revod], he talks about R and Docker images.

## SQL Server R Services

Over one year and 24 posts later I have finally finished my **Microsoft SQL Server R Services** series, and the last post was:

* [Microsoft SQL Server R Services: sp_execute_external_script - III][sext3]. In this post I discussed parallelism when executing `sp_execute_external_script`. If I may say so myself, I quite liked it!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com

[jovpop]: https://twitter.com/JovanPop_MSFT
[bobw]: https://twitter.com/bobwardms
[revod]: https://twitter.com/revodavid
[lonny]: https://twitter.com/sqL_handLe
[ewtw]: https://twitter.com/sqlOnIce
[buckw]: https://twitter.com/BuckWoodyMSFT
[mattw]: https://twitter.com/matthewwarren
[murba]: https://twitter.com/muratdemirbas
[daveda]: https://twitter.com/davidthecoder
[adcol]: https://twitter.com/adriancolyer
[jesrod]: https://twitter.com/jrdothoughts
[tomaz]: https://twitter.com/tomaz_tsql
[dataart]: https://twitter.com/dataartisans
[luis]: https://twitter.com/luis_de_sousa
[benstop]: https://twitter.com/benstopford
[conflu]: https://twitter.com/confluentinc
[rmoff]: https://twitter.com/rmoff

[wr11_18]: {{< relref "2018-03-18-interesting-stuff---week-11.markdown" >}}

[sext3]: {{< relref "2018-03-21-microsoft-sql-server-r-services---sp-execute-external-script---iii.markdown" >}}



[1]: https://blogs.msdn.microsoft.com/bobsql/2018/03/18/sql-server-2017-improved-resource-usage-on-smaller-machines/
[2]: https://blogs.technet.microsoft.com/dataplatforminsider/2018/03/20/ssms-17-6-is-now-available-managed-instance-and-many-bug-fixes/
[3]: http://mattwarren.org/2018/03/23/Exploring-the-internals-of-the-.NET-Runtime/
[4]: https://github.com/dotnet/coreclr/tree/master/Documentation/botr
[5]: http://muratbuffalo.blogspot.co.za/2018/03/anatomical-similarities-and-differences.html
[6]: https://en.wikipedia.org/wiki/Paxos_(computer_science)
[7]: http://www.benstopford.com/2017/05/12/devoxx-london-2017-rethinking-services-stateful-streams/
[8]: https://en.wikipedia.org/wiki/Devoxx
[9]: https://azure.microsoft.com/en-us/blog/azure-event-hubs-integration-with-apache-spark-now-generally-available/
[10]: https://www.confluent.io/no-more-silos-how-to-integrate-your-databases-with-apache-kafka-and-cdc
[11]: https://www.confluent.io/blog/ksql-in-action-enriching-csv-events-with-data-from-rdbms-into-AWS/
[12]: https://azure.microsoft.com/en-us/blog/azure-databricks-industry-leading-analytics-platform-powered-by-apache-spark/
[13]: http://blog.revolutionanalytics.com/2018/03/r-and-docker.html
[14]: https://blogs.technet.microsoft.com/machinelearning/2018/03/15/demystifying-docker-for-data-scientists-a-docker-tutorial-for-your-deep-learning-projects/
