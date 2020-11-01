---
type: post
layout: "post"
title: Interesting Stuff - Week 44, 2020
author: nielsb
date: 2020-11-01T11:01:29+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - Kafka
description: Kafka, Kafka and Machine Learning, NGINX service mesh, concensus algorithms, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - Kafka  
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

* [Helios: hyperscale indexing for the cloud & edge – part 1][1]. In this post [Adrian][adcol] from the [morning paper][mp] dissects a white-paper about Helios. Helios is a distributed, highly-scalable system used at Microsoft for flexible ingestion, indexing, and aggregation of large streams of real-time data that is designed to plug into relational engines. Adrian is as thorough as usual, and the conclusions he draws are very interesting. I can't wait for part 2.

## Distributed Systems

* [How I am learning distributed systems][2]. This post looks, from one person's perspective, how one can learn to design distributed systems. What is interesting in this post is the use of [Raft][3], (no, not Raft the game - but the consensus algorithm), as a learning tool. I will definitely point to this post as a learning resource for my developers.
* [NGINX Steps into the Service Mesh Fray Promising a Simpler Alternative][4]. The post linked to here points discusses how NGINX introduces its own service mesh: [NGINX Service Mesh][5], (NSM). It promises to be less complicated than ISTIO, so I will definitely have a look.

## Streaming

* [Preparing Your Clients and Tools for KIP-500: ZooKeeper Removal from Apache Kafka][6]. The Kafka community has for quite a while been talking about removing the dependency of ZooKeeper, (ZK), from Kafka, and it seems we are getting closer. In the post I have linked to here, the author looks at what is needed to do in Kafka consumers so that nothing "bad" happens when ZK is eventually removed.
* [Streaming Machine Learning with Kafka-native Model Deployment][7]. Kafka is used more and more for real-time machine learning purposes, and we are moving towards Kafka as a native streaming model server. This blog post explores the architectures and trade-offs between various options for model deployment with Kafka.

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


[1]: https://blog.acolyer.org/2020/10/26/helios-part-1/
[2]: https://medium.com/@polyglot_factotum/how-i-am-learning-distributed-systems-7eb69b4b51bd
[3]: https://raft.github.io/
[4]: https://thenewstack.io/nginx-steps-into-the-service-mesh-fray-promising-a-simpler-alternative/
[5]: https://www.nginx.com/products/nginx-service-mesh
[6]: https://www.confluent.io/blog/how-to-prepare-for-kip-500-kafka-zookeeper-removal-guide/
[7]: https://www.kai-waehner.de/blog/2020/10/27/streaming-machine-learning-kafka-native-model-server-deployment-rpc-embedded-streams/
