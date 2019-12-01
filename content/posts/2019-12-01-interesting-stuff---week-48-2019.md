---
type: post
layout: "post"
title: Interesting Stuff - Week 48, 2019
author: nielsb
date: 2019-12-01T08:03:26+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - ksqlDB
  - Azure
  - Azure Arc
  - Hadoop
  - SQL Server Big Data Cluster
description: Kafka, ksqlDB & doughnuts, Azure Arc, Hadoop, and other interesting topics
keywords:
  - Kafka
  - ksqlDB
  - Azure
  - Azure Arc
  - Hadoop
  - SQL Server Big Data Cluster  
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

## Azure

* [Azure Arc for data services, including SQL and PostgreSQL][1]. At [Microsoft Ignite][3] earlier this year, Microsoft introduced [Azure Arc][2], a service which enables deployment of Azure services anywhere and extends Azure management to any infrastructure. In the video linked to here [Travis Wright][travw] takes a deep-dive into Azure Data Services as part of Azure Arc. He shows how you can provision and manage SQL Server or PostgreSQL databases regardless if they are on-prem, in Azure, or in any other data centers. Very, very Powerful!

## Big Data

* [Big Data From B to A: The Hadoop Distributed Filesystem — HDFS][4]. If you work with or are interested in Big Data, you have most likely heard of Hadoop File System, (HDFS). The blog post linked to here discusses HDFS and looks at the design, architecture, and the data flow.

## Streaming

* [Introduction to Event Streaming with Kafka and Kafdrop][5]. This post I link to here is an awesome introduction to Kafka and event streaming. I recommend the post highly!   
* [Kafka Donuts - on KSQLDB - #1][6]. In las weeks [roundup][7] I covered the [introduction of **ksqlDB**][8]. My good friend, and colleague, [Charl Lamprecht][charl] who loves Kafka almost as much as he loves doughnuts had dive into how **ksqlDB** works and the post I link to here is the result. Please go ahead and read it - it gives you a good insight into **ksqlDB**!

## WIND (What Is Niels Doing)

This coming week I am delivering two webinars for [DataPlatformGeeks][8]:

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
[travw]: https://twitter.com/radtravis

[1]: https://www.youtube.com/watch?v=ddo3e0IxAAA
[2]: https://azure.microsoft.com/en-us/services/azure-arc/
[3]: https://www.microsoft.com/en-us/ignite
[4]: https://towardsdatascience.com/big-data-from-b-to-a-the-hadoop-distributed-filesystem-hdfs-992612cbf8aa
[5]: https://towardsdatascience.com/https-medium-com-ekoutanov-introduction-to-event-streaming-with-kafka-and-kafdrop-303d5d0ceeec
[6]: https://charlla.com/building-a-donut-shop-on-ksqldb/
[7]: {{< relref "2019-11-24-interesting-stuff---week-47-2019.md" >}}
[8]: https://www.dataplatformgeeks.com/
[9]: https://www.dataplatformgeeks.com/events/dpg-webinar-03rd-december-2019-0300-pm-0400-pm-ist-niels-berglund-a-lap-around-sql-server-2019-big-data-cluster/
[10]: https://www.dataplatformgeeks.com/events/dpg-webinar-05th-december-2019-0300-pm-0400-pm-ist-niels-berglund-azure-data-studio-and-sql-server-2019-big-data-cluster/
[11]: https://www.confluent.io/blog/intro-to-ksqldb-sql-database-streaming/

