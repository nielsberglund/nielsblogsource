---
type: post
layout: "post"
title: Interesting Stuff - Week 24, 2020
author: nielsb
date: 2020-06-14T09:27:04+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - Big Data
  - kafka
  - ksqldb
  - Hudi
description: Kafka, ksqlDB, Apache Hudi, distributed systems, Azure Sketches, and other interesting topics.
keywords:
  - distributed computing
  - Big Data
  - kafka
  - ksqldb
  - Hudi   
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

## Big Data

* [Building a Large-scale Transactional Data Lake at Uber Using Apache Hudi][1]. Hudi, developed by Uber, is similar to [Delta Lake][2] in that it enables ACID semantics, (plus more), on data lakes. This post describes Uber's journey to building, releasing, and optimizing Apache Hudi.

## Distributed Computing

* [Learning about distributed systems: where to start?][3]. This post by [Murat][murba] looks at resources to really learn and understand distributed computing. I urge you to look and read the resources [Murat][murba] lists!

## Streaming

* [Databases and Stream Processing: A Future of Consolidation][4]. In this [InfoQ][iq] presentation, the presenter digs into why both stream processors and databases are necessary from a technical standpoint but also by exploring industry trends that make consolidation in the future far more likely. He examines how these trends map onto common approaches from active databases like MongoDB to streaming solutions like Flink, Kafka Streams or ksqlDB.
* [Use Cases and Architectures for Apache Kafka and Event Streaming in the Gaming Industry][5]. Do.Not.Miss.This! The link here is for the registration page for a Confluent event where [Kai Wähner][kaiw] looks at how Kafka and Confluent Cloud provides a scalable, reliable and efficient infrastructure to make gamers happy and gaming companies successful. 

## WIND (What Is Niels Doing)

Lockdown, lockdown, lockdown! What I would not give to be able to go out and have dinner with good friends at a restaurant right now!

Apart from that, things are not that bad. I am still working on the follow-up to the [**A Lap Around SQL Server 2019 Big Data Cluster: Background & Technology**][6] post. The upcoming post looks at the architecture. So when will it be published you may ask - I have no idea!

On Wednesday, (June 17), I am co-hosting the second [**The Azure Sketches, Architect Series**][7] webinar together with Gordon Beeming and Lawrance Reddy. We use a combination of traditional drawing & sketching with actual solution building to help reinforce the thought process in building Azure solutions and all of the dependencies in between. If you are interested, [here][7] is the link for registration.

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
[kaiw]: https://twitter.com/KaiWaehner


[1]: https://eng.uber.com/apache-hudi-graduation/
[2]: https://databricks.com/product/delta-lake-on-databricks
[3]: https://muratbuffalo.blogspot.com/2020/06/learning-about-distributed-systems.html
[4]: https://www.infoq.com/presentations/streaming-databases/
[5]: https://events.confluent.io/usecasesandarchitecturesforapa
[6]: {{< relref "2020-04-26-a-lap-around-sql-server-2019-big-data-cluster.md" >}}
[7]: https://www.meetup.com/Azure-Transformation-Labs/events/271102120/
