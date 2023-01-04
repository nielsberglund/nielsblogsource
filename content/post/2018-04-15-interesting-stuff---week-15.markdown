---
layout: post
title: Interesting Stuff - Week 15
author: nielsb
date: 2018-04-15T10:20:37+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - Service Fabric
  - kafka
  - Elasticsearch
  - Azure Global Bootcamp
  - Microsoft Machine Learning Server
  - RevoScaleR
description: Chaos in Service Fabric, scaling Elasticsearch, 100 billion events per day and Kafka, RevoScaleR and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - Service Fabric
  - kafka
  - Elasticsearch
  - Azure Global Bootcamp
  - Microsoft Machine Learning Server
  - RevoScaleR   
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

* [Induce controlled Chaos in Service Fabric clusters][1]. A blog-post about Service Fabric Chaos. Chaos simulates intermittent, interleaved faults (both graceful and ungraceful) throughout the cluster over extended periods of time. Service Fabric Chaos allows developers to be able to test the stability of their services while the underlying unreliable infrastructure is going through complicated state transitions due to faults. 

## Streaming

* [Scaling Uber's Elasticsearch Clusters][2]. An [InfoQ][iq] presentation about how Uber scaled its Elasticsearch clusters as well as its ingestion pipelines for ingestions, queries, data storage, and operations.
* [Cloud-native and Scalable Kafka Architecture][3]. Another presentation from [InfoQ][iq]. This presentation is about how Netflix addresses the issues of stability and scalability in a cloud environment by having many smaller and mostly immutable Kafka clusters with limited state changes.
* [Give Meaning To 100 Billion Events A Day - The Analytics Pipeline At Teads][4]. An article about how [Teads][5] orchestrates Kafka, Dataflow and BigQuery together to ingest and transform a large stream of events (close to 100 billion per day). A very interesting read!

## Data Science

* [Running Pleasingly Parallel workloads using rxExecBy on Spark, SQL, Local and Localpar compute contexts][6]. A blog-post about `rxExecBy` which is a new **RevoScaleR** function introduced in **Microsoft Machine Learning Server 9.1**. The function can be used to partition input data source by keys and apply user-defined functions on individual partitions. 

## Upcoming Conferences

* [Azure Global Boot-Camp 2018 Durban][7]. On April 21, 2018, all Azure communities will come together once again in the sixth great [Global Azure Bootcamp][8] event! If you are in the Durban area, please join up and come and learn about all things Azure. Here in Durban, [Lawrance][lawr], who is a fellow MVP - but in the Azure space, arranges it. Yours truly presents two talks; one about Azure ML and the other about Azure Data Lake.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com

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
[benstop]: https://twitter.com/
[conflu]: https://twitter.com/confluentinc

[1]: https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-controlled-chaos
[2]: https://www.infoq.com/presentations/uber-elasticsearch-clusters
[3]: https://www.infoq.com/presentations/cloud-native-kafka-netflix
[4]: http://highscalability.com/blog/2018/4/9/give-meaning-to-100-billion-events-a-day-the-analytics-pipel.html
[5]: https://teads.tv/
[6]: https://blogs.msdn.microsoft.com/mlserver/2017/04/12/pleasingly-parallel-using-rxexecby/
[7]: https://www.meetup.com/Azure-Transformation-Labs/events/248443776/
[8]: https://global.azurebootcamp.net/

