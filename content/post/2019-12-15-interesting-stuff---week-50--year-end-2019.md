---
type: post
layout: "post"
title: Interesting Stuff - Week 50 & Year End, 2019
author: nielsb
date: 2019-12-15T07:21:12+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server
  - SQL Server 2019
  - Kafka
  - Kubernetes
  - ksqlDB
description: Kafka, ksqlDB, Kubernetes, SQL Server 2019 on Linux, and other interesting topics!
keywords:
  - distributed computing
  - SQL Server
  - SQL Server 2019
  - Kafka
  - Kubernetes
  - ksqlDB   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending.

> **NOTE:** *It is now coming up on Christmas and New Year, and I will take a break with these posts and come back in the beginning of next year.*

<!--more-->

## Big Data

* [Should you move your Big Data and Data Lake to the Cloud][1]. The post linked to here discusses the pros and cons of running your data lake(s) in the "cloud". Interesting read!

## SQL Server 2019

* [Tools and commands for running SQL Server 2019 on Linux][2]. This post is about running Microsoft SQL Server 2019 on Linux. It provides necessary information that is good to know before upgrading or migrating SQL Server onto Linux.

## Distributed Computing

* [Creating a Kubernetes lab for Windows Users][3]. This is a "cool" post discussing how to set up Kubernetes on Windows using Minikube.
* [Monoliths, Microservices, Events, Functions: What It Takes to Go Through the Transformation][4]. This is an [InfoQ][iq] presentation discussing lessons learned building apps in a distributed environment.
* [Building Reactive Pipelines: How to Go from Scalable Apps to (Ridiculously) Scalable Systems][5]. The [InfoQ][iq] presentation linked to here discusses and demos reactive and highly scalable microservices built with Project Reactor using RabbitMQ, Apache Kafka, and Spring Cloud Stream.

## Streaming

* [Transferring Avro Schemas Across Schema Registries with Kafka Connect][6]. The tutorial linked to here discusses how to replicate Avro schemas across independent Kafka Schema Registry clusters without overwriting any schemas. This is being made possible through the help of a custom Kafka Connect Single Message Transform (SMT). Very interesting read!
* [Kafdrop: An Open-Source Kafka UI][7]. This post by [Emil][emilk] looks at an open-source Kafka Web UI: **Kafdrop**. Kafdrop looks very promising, and I'll definitely check it out. As a side note; you should really [follow Emil][8], he posts awesome articles around event-driven architecture and microservices.
* [Kafka Donuts - on KSQLDB - #2][9]. The second post by my friend and colleague [Charl][charl] about donuts and **ksqlDB**. You find the first post [here][10].

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


[1]: https://medium.com/adaltas/should-you-move-your-big-data-and-data-lake-to-the-cloud-c26f6e1975c0
[2]: https://cloudblogs.microsoft.com/sqlserver/2019/12/11/tools-and-commands-for-running-sql-server-2019-on-linux/
[3]: https://medium.com/swlh/running-a-kubernetes-lab-for-windows-users-7ba2400216ad?
[4]: https://www.infoq.com/presentations/building-microservices-events-functions/
[5]: https://www.infoq.com/presentations/spring-reactor-microservices/
[6]: https://www.confluent.io/blog/kafka-connect-tutorial-transfer-avro-schemas-across-schema-registry-clusters/
[7]: https://towardsdatascience.com/kafdrop-e869e5490d62
[8]: https://medium.com/@ekoutanov
[9]: https://charlla.com/kafka-donuts-on-ksqldb-2/
[10]: https://charlla.com/building-a-donut-shop-on-ksqldb/