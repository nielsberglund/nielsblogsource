---
type: post
layout: "post"
title: Interesting Stuff - Week 10, 2020
author: nielsb
date: 2020-03-08T12:44:22+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - Kafka
  - Kubernetes
  - Zookeeper
  - Druid
description: Kafka, Kubernetes, Druid, data pipelines, and other interesting topics.
keywords:
  - distributed computing
  - Kafka
  - Kubernetes
  - Zookeeper
  - Druid   
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

## .NET

* [How to Develop and Debug ASP.NET Core Applications in Kubernetes][1]. This is an interesting post looking at developing ASP.NET Core applications for Kubernetes using a tool/framework called [Okteto][2].

## Misc.

* [Mock APIs vs. Real Backends – Getting the Best of Both Worlds][4]. The post linked to here from the Confluent discusses whether to mock or not and if you can do both. 

## Streaming

* [How Netflix uses Druid for Real-time Insights to Ensure a High-Quality Experience][3]. A few years ago we looked at Druid in [Derivco](/derivco) and evaluated if we could use it. Nothing came out of it, but from reading this post, maybe we should look again.
* [Architecture for High-Throughput Low-Latency Big Data Pipeline on Cloud][5]. Don't let the title of this post fool you; this is not cloud specific. The post discusses tools and techniques for building data pipelines for Big Data.
* [Kafka Needs No Keeper][6]. In this [InfoQ][iq] presentation, the presenter talks about the ongoing effort to replace the use of Zookeeper in Kafka: the reasons for why it should be done and how it will work.

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


[1]: https://medium.com/okteto/how-to-develop-and-debug-asp-net-core-applications-in-kubernetes-e2d1fe62068f
[2]: https://github.com/okteto/okteto
[3]: https://netflixtechblog.com/how-netflix-uses-druid-for-real-time-insights-to-ensure-a-high-quality-experience-19e1e8568d06
[4]: https://www.confluent.io/blog/choosing-between-mock-api-and-real-backend/
[5]: https://towardsdatascience.com/scalable-efficient-big-data-analytics-machine-learning-pipeline-architecture-on-cloud-4d59efc092b5
[6]: https://www.infoq.com/presentations/kafka-zookeeper/
