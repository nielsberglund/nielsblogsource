---
type: post
layout: "post"
title: Interesting Stuff - Week 20, 2021
author: nielsb
date: 2021-05-16T08:36:10+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - big data cluster
  - SQL Server
  - Kafka
  - dps2021
description: Kafka on Kubernetes, data from Kafka to data-lakes, Data Platform Summit 2021, and other interesting topics.
keywords:
  - big data cluster
  - SQL Server
  - Kafka
  - dps2021   
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

## Databases

* [Change Data Capture for Distributed Databases @Netflix][1]. In this [Infoq][iq] presentation, the presenter covers the challenges associated with capturing CDC events from Cassandra, discussing the Flink ecosystem and the use of RocksDB. Very interesting!

## Streaming

* [Why query planning for streaming systems is hard][2]. This post looks at some of the issues of doing query plans for streaming systems. Really interesting, and I would like to hear more about this.
* [Cooling down hot data: From Kafka to Athena][3]. The post linked to looks at how to move data from online Kafka Clusters to a data lake for long term data retention, analytics, legal requirements, and as input for machine learning. 
* [Introducing Confluent for Kubernetes][4]. This post looks at Confluent for Kubernetes (CFK), a cloud-native control plane for deploying and managing Confluent in private cloud environments. It provides a standard and simple interface to customize, deploy, and manage Confluent Platform through declarative APIs.

## WIND (What Is Niels Doing)

A couple of days ago, I received some very good news:

![](/images/posts/data-summit-2021.jpg)

**Figure 1:** *Big Data & Analytics*

As you see in *Figure 1* I will be giving a training class at the 2021 Data Platform Summit. The class is **Big Data & Analytics with SQL Server 2019 Big Data Cluster**. So right now, I am creating the content for that class - it will be awesome.

If you are interested, [sign up][5] for the class. When signing up, you also get free access to the Summit! Hope to see you there!

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

[1]: https://www.infoq.com/presentations/netflix-cdc-events-cassandra/
[2]: https://scattered-thoughts.net/writing/why-query-planning-for-streaming-systems-is-hard/
[3]: https://medium.com/leboncoin-engineering-blog/cooling-down-hot-data-from-kafka-to-athena-5918a628bd98
[4]: https://www.confluent.io/blog/confluent-for-kubernetes-offers-cloud-native-kafka-automation/
[5]: http://bit.ly/dps_2021

