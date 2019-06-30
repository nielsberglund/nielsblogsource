---
type: post
layout: "post"
title: Interesting Stuff - Week 48
author: nielsb
date: 2018-12-02T14:43:12+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - Kafka
  - databricks
  - Flink
  - dA Platform
  - Java
  - Azure serverless
description: Flink, Kafka, Azure Kubernetes, SQL Server 2019 & Java, and other interesting topics!
keywords:
  - data science
  - distributed computing
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - Kafka
  - databricks
  - Flink
  - dA Platform
  - Java
  - Azure serverless   
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

* [Considering Azure Functions for a serverless data streaming scenario][1]. A blog post which describes a solution of using Azure server-less to create a data pipeline to detect fraudulent transactions. Quite a lot of exciting technologies/solutions!
* [Getting Started with data Artisans Platform on Azure Kubernetes Service][3]. The [dA Platform][2] is a production-ready stream processing infrastructure that includes open-source Apache Flink, and it is purpose-built for the stateful stream processing architecture. This blog post discusses how to get the dA Platform up and running on Azure Kubernetes Service.

## Streaming

* [What’s new in the latest Apache Flink 1.7.0 release][4]. As per the title. This blog post mentions some new functionality in the 1.7.0 release of Apache Flink. The new `MATCH_RECOGNIZE` functionality looks very juicy!
* [Apache Avro as a Built-in Data Source in Apache Spark 2.4][5]. Starting from the Apache Spark 2.4 release, Spark provides built-in support for reading and writing Avro data. This blog post examines the functionality in detail.
* [3 Ways to Prepare for Disaster Recovery in Multi-Datacenter Apache Kafka Deployments][6]. What it says in the title - how we can prepare for disaster recovery in Kafka environments. 

## SQL Server 2019

* [SQL Server 2019 Extensibility Framework & Java - Hello World][7]. In the roundup for last [week][8] I wrote how I was working on a blog post about the new Java functionality in SQL Server 2019. This is it. In this post I take a look at how to install and enable the Java extensions. The post finishes with some very simple Java code which I execute from SQL Server. Do not be surprised if more posts comes shortly about Java.

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
[dataart]: https://twitter.com/dataArtisans

[1]: https://azure.microsoft.com/en-us/blog/considering-azure-functions-for-a-serverless-data-streaming-scenario/
[2]: https://data-artisans.com/download
[3]: https://data-artisans.com/blog/getting-started-data-artisans-platform-azure-kubernetes-service
[4]: https://data-artisans.com/blog/apache-flink-1-7-0-release
[5]: https://databricks.com/blog/2018/11/30/apache-avro-as-a-built-in-data-source-in-apache-spark-2-4.html
[6]: https://www.confluent.io/blog/3-ways-prepare-disaster-recovery-multi-datacenter-apache-kafka-deployments
[7]: {{< relref "2018-12-02-sql-server-2019-extensibility-framework--java---hello-world.md" >}}
[8]: {{< relref "2018-11-25-interesting-stuff---week-47.md" >}}
