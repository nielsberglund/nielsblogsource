---
type: post
layout: "post"
title: Interesting Stuff - Week 21, 2020
author: nielsb
date: 2020-05-24T06:51:36+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server
  - Machine Learning
  - Azure Data Studio
  - kafka
  - ksqlDB
  - Azure
  - flink
description: Kafka, ksqlDB, Derivco Tech Thursday, Apache Flink, and other interesting topics.
keywords:
  - distributed computing
  - SQL Server
  - Machine Learning
  - Azure Data Studio
  - kafka
  - ksqlDB
  - Azure
  - flink   
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

* [SLOG: serializable, low-latency, geo-replicated transactions][1]. In this blog post [Murat][murba] dissects a white paper about how one can in a distributed system avoid the tradeoff of giving up one of serializability, low latency writes, or high transactional throughput. [Murat][murba] does a great job dissecting a complex topic and make it understandable.

## SQL Server

* [Machine Learning extension (preview) for Azure Data Studio][3]. The May 2020 release of Azure Data Studio was [announced][2] a week or so ago, and in that release was an extension for Machine Learning. The link here is to the documentation of the extension. It looks interesting, and I'll try to take it for a "spin" as soon as I get time.

## Streaming

* [How GoDaddy uses Flink to run real time streaming pipelines][4]. This post, as the title says, looks at data pipelines at GoDaddy, and how they use Apache Flink in conjunction with other tools to create and run those pipelines. What I found especially interesting in the post was the description of how they deployed a new pipeline into production. That is something I will copy and try to implement at [Derivco](/derivco).

## WIND (What Is Niels Doing)

On Tuesday, (May 26), I am co-hosting the first [**The Azure Sketches, Architect Series**][5] webinar together with Gordon Beeming and Lawrance Reddy. This series will use a combination of traditional drawing & sketching with actual solution building to help reinforce the thought process in building Azure solutions and all of the dependencies in between. If you are interested, [here][5] is the link for registration.

Thursday, May 28, I do another first, the first-ever Derivco Webinar. [Charl Lamprecht][charl], who is Derivco's Kafka Guru, and I are delivering a webinar about Kafka and ksqlDB: **Conquer Your Data with Kafka and ksqlDB**. If you are interested, you can register [here][6].

I hope to see you at either of these events!

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


[1]: http://muratbuffalo.blogspot.com/2020/05/slog-serializable-low-latency-geo.html
[2]: https://cloudblogs.microsoft.com/sqlserver/2020/05/20/the-may-2020-release-of-azure-data-studio-is-now-available/
[3]: https://docs.microsoft.com/en-us/sql/azure-data-studio/machine-learning-extension?view=sql-server-ver15
[4]: https://www.ververica.com/blog/how-godaddy-uses-flink-to-run-real-time-streaming-pipelines
[5]: https://www.meetup.com/Azure-Transformation-Labs/events/270689806/
[6]: https://derivco.co.za/derivco-webinar/
