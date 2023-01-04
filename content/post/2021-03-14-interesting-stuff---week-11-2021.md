---
type: post
layout: "post"
title: Interesting Stuff - Week 11, 2021
author: nielsb
date: 2021-03-14T07:26:59+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - Trino
  - data architecture
  - distributed computing
  - Pinot
description: Kafka & Apache Pinot, KStreams & state using RocksDB, distributed tracing, and other interesting topics.
keywords:
  - Kafka
  - Trino
  - data architecture
  - distributed computing 
  - Pinot
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

## Data Architecture

* [Building a Data Platform in 2021][1]. This post looks at building a modern, scalable data platform to power analytics and data science projects. It was a handy read for me, as we are looking at these things in [Derivco](/derivco) at the moment.
* [What Is Starburst Data And Why You Should Use It – Data Engineering Consulting][2]. Trino, (the "artist" formerly known as PrestoDB) is an open-source distributed SQL query engine for running interactive analytic queries against data sources of all sizes ranging from gigabytes to petabytes. As Trino was developed as a bare-bones SQL Engine, you'll have to manage scaling, security, monitoring, and create new connections on your own. That is where Starburst Data comes in, it makes quite a few things a lot easier for using Trino, and this post looks more in detail at what Starburst Data can do.

## Streaming

* [Under the Hood of Real-Time Analytics with Apache Kafka and Pinot][3]. Recently I have linked to posts about Apache Pinot, and I do so here again. This post looks at the inner workings of Kafka and Pinot when using them together. Very interesting!
* [Disaster Recovery for Multi-Region Kafka at Uber][4]. Uber has one of the largest deployments of Apache Kafka in the world, processing trillions of messages and multiple petabytes of data per day. They want to provide a scalable, reliable, performant, and easy-to-use messaging platform on top of Apache Kafka. This article highlights how they solved recovering from disasters like cluster downtime, and it also describes how they built a multi-region Apache Kafka infrastructure.
* [Integrating Apache Kafka Clients with CNCF Jaeger at Funding Circle Using OpenTelemetry][5]. A key challenge in a Kafka based microservice architecture is understanding the system as a whole due to the decentralized nature and constant evolution of new and existing services. This post covers the basics for understanding what options are available for Apache Kafka telemetry when it comes to distributed tracing. 
* [How to Tune RocksDB for Your Kafka Streams Application][6]. When building Kafka Streams applications holding state, Kafka Streams uses local state stores that are made fault-tolerant by associated changelog topics stored in Kafka, and RocksDB backs these stores. The blog post linked to covers key concepts that show how Kafka Streams uses RocksDB to maintain its state and how RocksDB can be tuned for Kafka Streams' state stores.

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
[netflx]: https://netflixtechblog.com/

[1]: https://towardsdatascience.com/building-a-data-platform-in-2021-b759f6470426
[2]: https://www.theseattledataguy.com/what-is-starburst-data-and-why-you-should-use-it-data-engineering-consulting/
[3]: https://www.confluent.io/blog/real-time-analytics-with-kafka-and-pinot/
[4]: https://eng.uber.com/kafka/
[5]: https://www.confluent.io/blog/integrate-kafka-and-jaeger-for-distributed-tracing-and-monitoring/
[6]: https://www.confluent.io/blog/how-to-tune-rocksdb-kafka-streams-state-stores-performance/