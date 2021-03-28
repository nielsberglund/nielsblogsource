---
type: post
layout: "post"
title: Interesting Stuff - Week 13, 2021
author: nielsb
date: 2021-03-28T09:41:52+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - machine learning
  - Dapr
  - distributed computing
  - SQL Server
  - Kubernetes
description: Kafka & event driven arch., Feature stores for Machine Learning, SQL Server & Kubernetes, data architecture, and other interesting topics.
keywords:
  - machine learning
  - Dapr
  - distributed computing
  - SQL Server
  - Kubernetes   
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

## Distributed Computing

* [5 Reasons Why You Should Use Microsoft Dapr to Build Event-driven Microservices][1]. Dapr is a portable, event-driven runtime, and it helps developers build event-driven, resilient distributed applications. As the name implies, the post linked to looks at some of the reasons to use [Dapr][2].
* [Alibaba Cloud Uses Dapr to Support Its Business Growth][3]. I doubt that the Alibaba crowd read the post above, but they use Dapr extensively. This [InfoQ][iq] post looks at some of the reasons why Alibaba chose Dapr. Quite interesting read!
* [Sundial: Fault-tolerant Clock Synchronization for Datacenters][4]. The post linked to here gives an excellent explanation of time synchronization challenges and fundamental techniques to achieve precise time synchronization in data centers. 

## SQL Server

* [Configure SQL Server AG (Read-Scale) for SQL Containers deployed on Kubernetes using Helm][5]. This post looks at how to setup Always On Availability Group (AG) between SQL instances deployed as SQL containers on Kubernetes. As a SQL old-timer, I still can't believe we can run SQL on Linux and in Kubernetes!

## Data Architecture

* [Catching Data In a Data Mesh: Principles (Part I)][6]. This post is part of a series intending to give an in-depth view of how the Data Mesh architectural paradigm helps to build a data platform. This is part one, explaining the thinking about the mesh and the guiding principles for the implementation. After reading this post, be sure to read [part two][7] as well.
* [Making Data Lakehouse real yet effective][8]. In previous roundups, I have linked to posts about data warehouses, data lakes, data lakehouses, etc. The post I link to here tries to explore and explain how all this hangs together.
* [Feature Store: Data Platform for Machine Learning][9]. Feature stores are a relatively recent "innovation" in the Machine Learning world. A feature store is a data system that runs data pipelines that transform raw data into feature values, stores and manages the feature data, and serves feature data consistently for training and inference purposes. The post I link to here surveys the leading feature stores. As a side note: if you want to read more about feature stores, browse over to [Feature Store for ML][10].

## Streaming

* [Integrating Azure and Confluent: Real-Time Search Powered by Azure Cache for Redis, Spring Cloud][11]. This article looks at an architecture pattern that transforms an existing traditional transaction system into a real-time data processing system. Don't get hung up on the components used (Redis Cache, Spring Cloud), as what the article covers is applicable for different tech-stacks as well.
* [Event-Driven Architecture Demo][12]. As the title says, this post looks at a completely event-driven system, incorporating Kafka and GraphQL. Very cool!

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

[1]: https://medium.com/event-driven-utopia/5-reasons-why-you-should-use-microsoft-dapr-to-build-event-driven-microservices-cb2202c579a0
[2]: https://dapr.io/
[3]: https://www.infoq.com/news/2021/03/alibaba-dapr/
[4]: http://muratbuffalo.blogspot.com/2021/03/sundial-fault-tolerant-clock.html
[5]: https://techcommunity.microsoft.com/t5/sql-server/configure-sql-server-ag-read-scale-for-sql-containers-deployed/ba-p/2224742
[6]: https://medium.com/nerd-for-tech/catching-data-in-a-data-mesh-principles-part-i-2b2e11e9e33a
[7]: https://medium.com/codex/catching-data-in-a-data-mesh-applied-part-ii-114cae4d139a
[8]: https://rpradeepmenon.medium.com/making-data-lakehouse-real-yet-effective-f09e84fae0fa
[9]: https://towardsdatascience.com/feature-store-data-platform-for-machine-learning-455122c48229
[10]: https://www.featurestore.org/
[11]: https://www.confluent.io/blog/real-time-search-and-analytics-with-confluent-cloud-azure-redis-spring-cloud/
[12]: https://levelup.gitconnected.com/event-driven-architecture-demo-29f5649144b7
