---
type: post
layout: "post"
title: Interesting Stuff - Week 38, 2019
author: nielsb
date: 2019-09-22T17:01:04+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - kubernetes
  - kafka
  - VLDB
description: Kafka, Kubernetes, VLDB 2019, and other interesting topics.
keywords:
  - distributed computing
  - kubernetes
  - kafka
  - VLDB   
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

## Databases

* [Even more amazing papers at VLDB 2019 (that I didn't have space to cover yet)][1]. The [VLDB (Very Large Databases)][2] was held at the end of August, and as usual, quite a lot of white papers were presented at the conference. [Adrian][adcol] has during the last week, dissected some of them. In this post, he lists some of the papers he didn't dissect but still finds interesting. There are some nuggets in the list!

## Distributed Computing

* [Introducing Maesh: A Service Mesh for Kubernetes][3]. This article is an [InfoQ][iq] article about Maesh. Maesh is an open source service mesh written in Golang and built on top of the reverse proxy and load balancer Traefik. Maesh promises to provide a lightweight service mesh solution that is easy to get started with and to roll out across a microservice application.
* [Essential Kubernetes Resources][4]. This post covers a list of Kubernetes resources related to security, resilience, and availability best practices.

## Streaming

* [Built-In Multi-Region Replication with Confluent Platform 5.4-preview][5]. This post covers new functionality in Confluent Platform 5.4: the ability to replicate data across data center regions. Very interesting!
* [KIP-500: Apache Kafka Without ZooKeeper ft. Colin McCabe and Jason Gustafson][6]. The link here is to a podcast, where [Tim Berglund][timber] talks with a couple of Kafka engineers and discusses new functionality coming to Kafka where Kafka do not need ZooKeeper any more.

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
[timber]: https://twitter.com/tlberglund

[1]: https://blog.acolyer.org/2019/09/20/even-more-amazing-papers-at-vldb/
[2]: https://en.wikipedia.org/wiki/International_Conference_on_Very_Large_Data_Bases
[3]: https://www.infoq.com/news/2019/09/maesh-kube-service-mesh
[4]: https://medium.com/better-programming/essential-kubernetes-resources-2ccb250bcf44
[5]: https://www.confluent.io/blog/multi-region-data-replication
[6]: https://www.buzzsprout.com/186154/1720903-kip-500-apache-kafka-without-zookeeper-ft-colin-mccabe-and-jason-gustafson
