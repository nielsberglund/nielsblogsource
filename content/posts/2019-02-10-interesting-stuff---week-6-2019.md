---
type: post
layout: "post"
title: Interesting Stuff - Week 6, 2019
author: nielsb
date: 2019-02-10T08:37:39+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server 2019
  - Kafka
  - Azure Databricks
  - .NET
  - SQL Server 2019 Big Data Clusters
description: Weekly roundup of what interesting stuff I have read in blogs etc.
keywords:
  - data science
  - distributed computing
  - SQL Server 2019
  - Kafka
  - Azure Databricks
  - .NET
  - SQL Server 2019 Big Data Clusters   
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

## Distributed Computing

* [O’Reilly Publishes “The State of Microservices Maturity” Report][1]. This is an [InfoQ][iq] article discussing a report by O'Reilly about microservices. In the report, O'Reilly concludes that microservices are evolving into a trend and that DevOps and microservices feed off each other.
* [Point-to-Point Messaging Architecture - The Reactive Endgame][2]. This is an [InfoQ][iq] presentation where the presenters explore the current state of messaging architecture and provide an R&D perspective on the future of distributed systems.

## .NET

* [C# Futures: Lambda Attributes][3]. In this article [InfoQ][iq] looks at a proposal for adding attributes to lambdas and anonymous functions.

## Azure

* [Solving a common corporate conundrum: Making sense of all that data][4]. This post discusses the newly announced Azure Data Explorer and its capabilities of analyzing 1 billion records of streaming data per second, as well as data stored in Azure Data Lake Storage.
* [High-Performance Modern Data Warehousing with Azure Databricks and Azure SQL Data Warehouse][5]. This blog post discusses how we can use Azure Data Factory, Azure Data Lake Storage together with Azure Databricks to load data into Azure SQL Data Warehouse for analysis, etc.

## Data Science

* [Announcing ML.NET 0.10 – Machine Learning for .NET][6]. This post does what the title says; it announces the release of ML.NET 0.10. Read the post to see what new features are part of this release.
* [Machine Learning with Python, Jupyter, KSQL and TensorFlow][7]. As it says in this post: "This blog post focuses on how the Kafka ecosystem can help solve the impedance mismatch between data scientists, data engineers and production engineers.".

## Streaming

* [Processing trillions of events per day with Apache Kafka on Azure][8]. This is cool; the post talks about the optimal setup to run one of the largest Kafka deployments in the world, and achieve a throughput of trillion events per day.
* [A Beginner’s Perspective on Kafka Streams: Building Real-Time Walkthrough Detection][9]. In retail, it is essential to detect when a customer walks in or out of a store. This blog post discusses how a company used Kafka and KSQL to be able to react quicker and with more accuracy.

## SQL Server 2019

* [SQL Server Big Data Clusters Workshop at SQL Bits][10]. UK's leading SQL Server conference [SQLBits][11] takes place in Manchester at the end of February. If you are attending, don't miss [Buck Woody's][buckw] one day SQL Server 2019 Big Data Cluster workshop. Buck knows what he talks about and he also has members of the SQL Server 2019 Big Data Cluster team on-site. I wish I could be there!

## Azure Force Recon

Speaking about conferences and SQL Server Big Data Clusters; February 23 the first of many [Azure tactical bootcamps][12] is being held here in Durban, and I have the privilege to do a presentation: [Live and Die with your Data][13], where I talk about SQL Server 2019 Big Data Clusters. So, if you do not have anything else to do, sign up and learn about Azure!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/
[charlblog]: https://charlla.com/

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
[tylert]: https://twitter.com/tyler_treat
[andrewng]: https://twitter.com/AndrewYNg
[lawr]: https://twitter.com/bytezn
[jue]: https://twitter.com/b0rk
[yan]: https://twitter.com/theburningmonk
[danny]: https://twitter.com/g9yuayon
[rmoff]: https://twitter.com/rmoff
[ryansw]: https://twitter.com/ryanswanstrom
[pabloc]: https://twitter.com/pabloc_ds
[mklep]: https://twitter.com/martinkl
[mdavey]: https://twitter.com/matt_davey
[jboner]: https://twitter.com/jboner
[joeduff]: https://twitter.com/funcOfJoe
[charl]: https://twitter.com/charllamprecht
[dbricks]: https://twitter.com/databricks
[adsit]: https://twitter.com/SitnikAdam
[vicky]: https://twitter.com/vickyharp
[dscentral]: https://twitter.com/DataScienceCtrl
[natemc]: https://twitter.com/natemcmaster

[1]: https://www.infoq.com/news/2019/02/Oreilly-microservices-maturity
[2]: https://www.infoq.com/presentations/messaging-architecture-future
[3]: https://www.infoq.com/news/2019/02/CSharp-Lambda-Attributes
[4]: https://blogs.microsoft.com/ai/azure-data-explorer-lake-storage/
[5]: https://databricks.com/blog/2019/02/07/high-performance-modern-data-warehousing-with-azure-databricks-and-azure-sql-dw.html
[6]: https://blogs.msdn.microsoft.com/dotnet/2019/02/07/announcing-ml-net-0-10-machine-learning-for-net/
[7]: https://www.confluent.io/blog/machine-learning-with-python-jupyter-ksql-tensorflow
[8]: https://azure.microsoft.com/en-us/blog/processing-trillions-of-events-per-day-with-apache-kafka-on-azure/
[9]: https://www.confluent.io/blog/beginners-perspective-kafka-streams-building-real-time-walkthrough-detection
[10]: https://buckwoody.wordpress.com/2019/02/02/sql-server-big-data-clusters-workshop-at-sql-bits/
[11]: https://sqlbits.com/
[12]: https://www.meetup.com/Azure-Transformation-Labs/events/258705868/
[13]: https://www.linkedin.com/feed/update/activity:6500043306041384960/
