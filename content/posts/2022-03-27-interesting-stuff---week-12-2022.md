---
type: post
layout: "post"
title: Interesting Stuff - Week 12, 2022
author: nielsb
date: 2022-03-27T08:32:00+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Kafka
  - KRaft
  - Azure Synapse Analytics
  - Lakehouse
description: Kafka ZooKeeper & KRaft, Azure Data Explorer one click policies, Synapse & Lakehouse architecture, and other interesting topics.
keywords:
  - Azure Data Explorer
  - Kafka
  - KRaft
  - Azure Synapse Analytics
  - Lakehouse   
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

## Azure Data Explorer

* [(Preview) Configure ADX table retention, caching and batching policies via one-click][1]. This post looks at something I just came across the other day when I edited the lab exercises for my one day Azure Data Explorer training class *A Day of Azure Data Explorer*. So what the post covers and I found out was how you can configure retention, batching & caching policies for tables & materialized views via one click. Quite cool!

## Big Data

* [BUILDING THE LAKEHOUSE ARCHITECTURE WITH AZURE SYNAPSE ANALYTICS][2]. As the title says, this post looks at using the full range of Synapse services to build a lake house architecture on top of Azure Databricks Delta Lake tables.
* [Orchestrate Operations, Validations, and Approvals on Data Entities with Azure Purview Workflows][3]. Azure Purview is a data governance service from Microsoft that automates the discovery and cataloging of data. It went into General Availability (GA) in October 2021. Recently Microsoft released as a preview Azure Purview Workflows. This article looks into the Purview Workflows and what you can do with them.

## Streaming

* [Build a real-time data analytics pipeline with Airbyte, Kafka, and Pinot][4]. This post looks at using Airbyte, Kafka and Pinot for building analytics dash boards for user-facing analysis. Very interesting!
* [Why ZooKeeper Was Replaced with KRaft – The Log of All Logs][5]. Anyone interested in Kafka probably now knows how ZooKeeper is being replaced by a Raft based quorum protocol. This post explores the rationale behind the replacement, examines why Raft was utilized and altered to become KRaft and describes the new Quorum Controller built on top of KRaft protocols.

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

[1]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/preview-configure-adx-table-retention-caching-and-batching/ba-p/3262352
[2]: https://sqlofthenorth.blog/2022/03/10/building-the-lakehouse-architecture-with-synapse-analytics/
[3]: https://www.infoq.com/news/2022/03/azure-purview-workflows-preview/
[4]: https://medium.com/event-driven-utopia/build-a-real-time-data-analytics-pipeline-with-airbyte-kafka-and-pinot-c9ff3c42dcf2
[5]: https://www.confluent.io/blog/why-replace-zookeeper-with-kafka-raft-the-log-of-all-logs/
