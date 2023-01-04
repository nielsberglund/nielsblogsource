---
type: post
layout: "post"
title: Interesting Stuff - Week 43, 2020
author: nielsb
date: 2020-10-25T09:35:38+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - Kafka
  - ksqlDB
  - Pinot
  - Kubernetes
  - Big Data
description: Kafka, the many uses of ksqlDB, how to trace events, Pinot for big data analytics, and other interesting topics.
keywords:
  - distributed computing
  - Kafka
  - ksqlDB
  - Pinot
  - Kubernetes
  - Big Data   
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

* [Chaos Engineering on Kubernetes : Chaos Mesh Generally Available with v1.0][1]. In [last weeks roundup][2], I wrote about Kraken, a chaos tool for OpenShift/Kubernetes. This week and in this [InfoQ][iq] article, we look at another chaos tool; Chaos Mesh.

## Big Data Analytics

* [Operating Apache Pinot @ Uber Scale][5]. Apache Pinot is a distributed OLAP system designed for performing low latency analytical queries on really Big Data. The post linked to here looks at how Uber is using Pinot, and how the underlying architecture looks like.

## Streaming

* [Lessons Learned from Evolving a Risk Management Platform to Event Streaming][6]. This post looks at how a retailer uses Kafka and event streaming to perform risk management. Very cool!
* [Building Netflix’s Distributed Tracing Infrastructure][3]. This post looks at the underlying architecture/components for Netflix tracing framework [Edgar][4]. It is a very interesting and informative post! Let us see if we can do something similar at [Derivco](/derivco).
* [Bounding ksqlDB Memory Usage][7]. This post which looks at how one can solve unbounded ksqlDB memory growth comes at the right time for us at [Derivco](/derivco), as we have experienced this problem in ksqlDB.
* [Intrusion Detection with ksqlDB][8]. We know that ksqlDB can be used for many things and the post linked to here looks at how to use ksqlDB to detect network intrusions. Really, really cool!

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


[1]: https://www.infoq.com/news/2020/10/kubernetes-chaos-mesh-ga/
[2]: {{< relref "2020-10-18-interesting-stuff---week-42-2020.md" >}}
[3]: https://netflixtechblog.com/building-netflixs-distributed-tracing-infrastructure-bb856c319304
[4]: https://netflixtechblog.com/edgar-solving-mysteries-faster-with-observability-e1a76302c71f
[5]: https://eng.uber.com/operating-apache-pinot/
[6]: https://www.confluent.io/blog/real-time-risk-management-with-kafka-and-event-streaming/
[7]: https://www.confluent.io/blog/bounding-ksqldb-memory-usage/
[8]: https://www.confluent.io/blog/build-a-intrusion-detection-using-ksqldb/
