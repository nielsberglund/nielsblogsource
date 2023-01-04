---
type: post
layout: "post"
title: Interesting Stuff - Week 47, 2019
author: nielsb
date: 2019-11-24T08:37:03+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server 2019 Big Data Cluster
  - Kafka
  - KSQL
  - ksqlDB
description: "Kafka & ksqlDB, SQL Server 2019 Big Data Cluster, Azure Data Studio, and other interesting topics."
keywords:
  - distributed computing
  - SQL Server 2019 Big Data Cluster
  - Kafka
  - KSQL
  - ksqlDB   
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

* [The Future of Chaos Engineering: In Pursuit of the Unknown Unknowns][1]. This is an [InfoQ][iq] presentation where the presenter discusses how chaos and resilience practices must evolve to keep pace with the challenges of growing complexity.

## SQL Server 2019

* [Fix PolyBase in SQL Server 2019 Developers Edition][2]. This post is by yours truly, discussing how to fix an issue with PolyBase not starting up correctly after installing SQL Server 2019 Developers Edition.

## Streaming

* [Real-World Data Stream Processing][3]. In this post, the author discusses using streaming technologies with Kafka, Spark, and Cassandra to gain insights on data.
* [Introducing ksqlDB][4]. This post discusses [**ksqlDB**][5], the latest release of KSQL. There are essentially two new features in the release, but they are so far-reaching that Confluent decided to rename KSQL to **ksqlDB**. I will keep an eye on what Confluent is doing in this space - I think we will see loads of interesting "stuff" happening!
* [Kafka Streams and ksqlDB Compared – How to Choose][6]. So, KSQL and **ksqlDB**, (as per above), uses the Kafka Streams API, (KStreams), under the covers. This blog-post discusses when to use KStreams vs **ksqlDB**.
* [ksqlDB Demo | The Event Streaming Database in Action][7]. Here is a **ksqlDB** demo video to round off the **ksqlDB** coverage with.

## WIND (What Is Niels Doing)

The first week of December, I am delivering two webinars for [DataPlatformGeeks][8]:

**3rd December:**

* [A Lap Around SQL Server 2019 Big Data Cluster][9]. An overview of SQL Server 2019 Big Data Cluster.

**5th December:**

* [Azure Data Studio and SQL Server 2019 Big Data Cluster][10]. We look at using Azure Data Studio to deploy and manage a SQL Server 2019 Big Data Cluster.

The webinars are free, so if you have time, register and join the fun! Notice that the times in the links above are Indian Standard Time, so 3 pm IST is 09:30, (am), UTC.

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
[ads]: https://twitter.com/azuredatastudio

[1]: https://www.infoq.com/presentations/conde-nast-chaos-resilience/
[2]: {{< relref "2019-11-20-fix-polybase-in-sql-server-2019-developers-edition.md" >}}
[3]: https://medium.com/trending-information-technologies/stream-processing-17384a23111f
[4]: https://www.confluent.io/blog/intro-to-ksqldb-sql-database-streaming/
[5]: https://ksqldb.io/
[6]: https://www.confluent.io/blog/kafka-streams-vs-ksqldb-compared/
[7]: https://www.youtube.com/watch?v=D5QMqapzX8o
[8]: https://www.dataplatformgeeks.com/
[9]: https://www.dataplatformgeeks.com/events/dpg-webinar-03rd-december-2019-0300-pm-0400-pm-ist-niels-berglund-a-lap-around-sql-server-2019-big-data-cluster/
[10]: https://www.dataplatformgeeks.com/events/dpg-webinar-05th-december-2019-0300-pm-0400-pm-ist-niels-berglund-azure-data-studio-and-sql-server-2019-big-data-cluster/