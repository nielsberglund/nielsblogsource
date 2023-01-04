---
type: post
layout: "post"
title: Interesting Stuff - Week 23, 2021
author: nielsb
date: 2021-06-06T08:28:23+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - kafka
  - ksqldb
  - databricks
  - azuredataexplorer
description: Kafka 2 Kafka, ksqlDB pattern matching, Databricks Accelerators, Azure Data Explorer, and other interesting topics.
keywords:
  - data science
  - kafka
  - ksqldb
  - databricks
  - azuredataexplorer   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth that has to do with things that interest me:

* AI/data science
* data in general
* data architecture
* streaming
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Machine Learning / AI

* [Jump Start Your Data Projects with Pre-Built Solution Accelerators][1]. There is pressure on data science teams/data engineers/etc., to deliver value fast. However, it takes time to research, build data pipelines, models, etc., and this can suck up momentum. To help to overcome these obstacles, Databricks introduces in this blog post [**Databricks Solution Accelerators**][2]. These accelerators are fully-functional pre-built code to tackle the most common and high-impact use cases for data scientists, data engineers, etc.

## Streaming

* [New Smart App: Kafka to Kafka Bridge][3]. This post introduces the **Kafka to Kafka Bridge**. The bridge allows you to create message bridges between topics of the same or different Kafka brokers. We have developed something similar here at [Derivco](/derivco), but I will definitely check this out!
* [Detecting Patterns of Behaviour in Streaming Maritime AIS Data with Confluent][4]. This is part two in a blog series on streaming a data feed Apache Kafka (the first part is [here][5]). This post looks at how **ksqlDB** can be used to do aggregations and pattern matching against a data feed. Very cool!

## WIND (What Is Niels Doing)

Apart from working on my [**Big Data & Analytics with SQL Server 2019 Big Data Cluster**][6] training class for the [**2021 Data Platform Summit**][7], I have started looking into [**Azure Data Explorer**][8]. 

Azure Data Explorer is a fast, fully managed data analytics service for real-time analysis on large volumes of data streaming from applications, websites, IoT devices, and more. I am looking into it because I am thinking of creating some presentations for upcoming conferences and maybe a training class. Watch this space!

Oh, and don't forget - if you [sign up][6] for my training class, mentioned above, at the **2021 Data Platform Summit**, you get free access to the summit itself!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. Please comment on this post or [ping][ma] me if you have ideas for what to cover.

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
[emilk]: https://twitter.com/IsTheArchitect
[netflx]: https://netflixtechblog.com/

[1]: https://databricks.com/blog/2021/06/02/jump-start-your-data-projects-with-pre-built-solution-accelerators.html
[2]: https://databricks.com/solutions/accelerators
[3]: https://blog.flowdirector.io/new-smart-app-kafka-to-kafka-bridge-788883a68e63
[4]: https://www.confluent.io/blog/streaming-data-with-confluent-and-ksqldb-for-new-use-cases-with-ais/
[5]: https://www.confluent.io/blog/streaming-etl-and-analytics-for-real-time-location-tracking/
[6]: https://dataplatformgeeks.com/dps2021/product/big-data-analytics-with-sql-server-2019-big-data-cluster-by-niels-berglund/
[7]: https://dataplatformgeeks.com/dps2021/
[8]: https://docs.microsoft.com/en-us/azure/data-explorer/data-explorer-overview
