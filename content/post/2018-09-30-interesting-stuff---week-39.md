---
type: post
layout: "post"
title: Interesting Stuff - Week 39
author: nielsb
date: 2018-09-30T13:13:43+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - Azure Databricks Delta
  - Azure Data Studio
  - SQL Server 2019 for Linux
  - SQL Server Big Data Clusters
description: Kafka streams, Azure Databricks Delta, lots  of SQL Server 2019, and other interesting topics!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - Azure Databricks Delta
  - Azure Data Studio
  - SQL Server 2019 for Linux
  - SQL Server Big Data Clusters   
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

## .NET

* [Profiling .NET Code with BenchmarkDotNet][1]. If you want to benchmark your .NET code, you probably use [BenchMarkDotNet][2] (if you do not, you should). The man behind BenchMarkDotNet is [Adam Sitnik][adsit], and in the linked blog post he announces how you, soon, can use the EtwProfiler to profile benchmarked code! Very cool!

## Databases

* [The design and implementation of modern column-oriented database systems][3]. In this post, [Adrian][adcol] dissects a white paper about column-oriented databases. Having worked a little bit with SQL Server's column store indexes, it is very cool to get the "lowdown" on the design behind it.

## Azure Cloud

* [Azure Databricks – Delta in preview, 9 regions added, and other exciting announcements][4]. A blog post announcing that Azure Databricks Delta is available in preview. This is very interesting since I have been "chomping at the bits", to do some tests with Databricks Delta.
* [Spark Debugging and Diagnosis Toolset for Azure HDInsight][5]. This post is another announcement from Microsoft. This time it is how **Spark Diagnosis Toolset for HDInsight** is now available in preview. The toolset allows you to identify low parallelization, to detect data skew and run data skew analysis, and quite a lot more.

## Streaming

* [Real-Time Presence Detection at Scale with Apache Kafka on AWS][6]. This post discusses how [Zenreach][7] has implemented a framework for real-time presence detection, using Kafka Streams.
* [State TTL for Apache Flink: How to Limit the Lifetime of State][8]. Instead of me summarising the post, I shamelessly copy the opening paragraph: *A common requirement for many stateful streaming applications is the ability to control how long application state can be accessed (e.g., due to legal regulations like GDPR) and when to discard it. This blog post introduces the state time-to-live (TTL) feature that was added to Apache Flink with the 1.6.0 release*. It is very, very interesting. I need to start to play around with Flink!
* [Troubleshooting KSQL – Part 1: Why Isn’t My KSQL Query Returning Data?][9]. The obligatory Kafka link. The post is the first in a series how to troubleshoot KSQL. This and future posts in the series is, and, will be required reading for our Kafka team!

## SQL Server

* [Azure Data Studio for SQL Server][10]. A post by [Vicky Harp][vicky]. Vicky is Principal Program Manager Lead at Microsoft for SQL Server tooling, and in the post, she introduces **Azure Data Studio** (the artist formerly known as SQL Operations Studio). Azure Data Studio is a new cross-platform desktop environment for both on-premises and cloud data platforms on Windows, MacOS, and Linux. 
* [SQL Server 2019 preview combines SQL Server and Apache Spark to create a unified data platform][11]. An announcement by Microsoft how SQL Server 2019 comes with support for both Spark as well as Hadoop File System (HDFS). We do live in exciting times!
* [Introducing Microsoft SQL Server 2019 Big Data Clusters][12]. This post builds on top of the post above. It discusses how we can create big data clusters utilising the support in SQL Server 2019 of Spark and HDFS.
* [What is New in SQL Server 2019 Public Preview][13]. A post by yours truly. I do a quick look at what is new in SQL Server 2019, and I especially look at the Java language extension.
* [SQL Server 2019 for Linux in Docker on Windows][14]. Another post my myself. Since SQL Server 2019 for Linux now have support for SQL Server Machine Learning Services, I want to have a look at how it works. For that I obviously need it installed and I decided to install it as a Docker for Windows container. The post walks through what I did to get it installed. The post also discusses Azure Data Studio briefly.

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

[1]: https://adamsitnik.com/ETW-Profiler/
[2]: https://benchmarkdotnet.org/
[3]: https://blog.acolyer.org/2018/09/26/the-design-and-implementation-of-modern-column-oriented-database-systems/
[4]: https://azure.microsoft.com/en-us/blog/azure-databricks-delta-in-preview-9-regions-added-and-other-exciting-announcements/
[5]: https://azure.microsoft.com/en-us/blog/spark-debugging-and-diagnosis-toolset-for-azure-hdinsight/
[6]: https://www.confluent.io/blog/real-time-presence-detection-apache-kafka-aws
[7]: https://www.zenreach.com/
[8]: https://data-artisans.com/blog/state-ttl-for-apache-flink-how-to-limit-the-lifetime-of-state
[9]: https://www.confluent.io/blog/troubleshooting-ksql-part-1
[10]: https://cloudblogs.microsoft.com/sqlserver/2018/09/25/azure-data-studio-for-sql-server/
[11]: https://cloudblogs.microsoft.com/sqlserver/2018/09/24/sql-server-2019-preview-combines-sql-server-and-apache-spark-to-create-a-unified-data-platform/
[12]: https://cloudblogs.microsoft.com/sqlserver/2018/09/25/introducing-microsoft-sql-server-2019-big-data-clusters/
[13]: {{< relref "2018-09-24-sql-server-2019-public-preview.md" >}}
[14]: {{< relref "sql-server-2019-for-linux-in-docker-on-windows.md" >}}
