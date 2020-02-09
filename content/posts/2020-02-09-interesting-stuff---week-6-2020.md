---
type: post
layout: "post"
title: Interesting Stuff - Week 6, 2020
author: nielsb
date: 2020-02-09T06:06:11+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - Azure SQL Server
  - Kafka
  - ksqlDB
description: Kafka, ksqlDB, Azure SQL Hyperscale, and other interesting topics!
keywords:
  - distributed computing
  - Azure SQL Server
  - Kafka
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

## Azure SQL Server

* [Autoscaling Azure SQL Hyperscale][1]. Azure SQL Hyperscale is the latest architectural model fro Azure SQL Database. It allows for a complete separation of compute nodes and storage nodes, which makes it possible to independently scale each service, making Hyperscale more flexible and elastic. The article linked to here describes how it is possible to implement a solution to automatically scale Azure SQL Hyperscale database up or down, to dynamically and automatically adapt to different workload levels.

## Streaming

* [Building a Materialized Cache with ksqlDB][2]. This post is excellent, and the title says it all: how to create materialized caches using Kafka and ksqlDB! At [Derivco](/derivco) we are looking at this right now, so the post came in the right time.
* [Primitive Keys in ksqlDB][3]. In this post [Robin Moffat][rmoff] looks at a new feature in ksqlDB 0.7: support for message keys as primitive data types other than just strings. This new feature is very welcome, especially for us who stream database data into ksqlDB where the keys are integers. 
* [Keystone Real-time Stream Processing Platform][4]. The article linked to here is from the [Netflix Tech Blog][5], and it discusses one of Netflix's system for real-time stream processing. As with the post mentioned above about materialized caches this post gives us at [Derivco](/derivco) some food for thoughts. 

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
[emilk]: https://twitter.com/IsTheArchitect


[1]: https://techcommunity.microsoft.com/t5/azure-sql-database/autoscaling-azure-sql-hyperscale/ba-p/1149025
[2]: https://www.confluent.io/blog/build-materialized-cache-with-ksqldb/
[3]: https://rmoff.net/2020/02/07/primitive-keys-in-ksqldb/
[4]: https://netflixtechblog.com/keystone-real-time-stream-processing-platform-a3ee651812a
[5]: https://netflixtechblog.com/