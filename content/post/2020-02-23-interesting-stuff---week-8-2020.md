---
type: post
layout: "post"
title: Interesting Stuff - Week 8, 2020
author: nielsb
date: 2020-02-23T06:46:33+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server 2019 Big Data Cluster
  - Kafka
  - Event-driven architecture
  - Data Platform Geeks
description: Kafka, event driven architecture, SQL Server 2019 Big Data Cluster, and other interesting topics.
keywords:
  - distributed computing
  - SQL Server 2019 Big Data Cluster
  - Kafka
  - Event-driven architecture
  - Data Platform Geeks   
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

* [Anatomy of Cascading Failure][1]. In the [InfoQ][iq] article linked to here, the author discusses what a cascading failure is, and some anti-patterns around cascading failures. If you work with distributed systems, then you should really read this article.

# Streaming

* [Monolith to Event-Driven Microservices with Apache Kafka][2]. The post in the link talks about the advantages of event-driven systems, and how one can gradually evolve to an event-driven system from a monolith. 
* [The Kongo Problem: Building a Scalable IoT Application with Apache Kafka][3]. This [InfoQ][iq] article discusses scalability and Kafka. The article is based on a series of blog posts, where the first post is [here][4]. 

## WIND (What Is Niels Doing)

Back in December, I did two webinars for [DataPlatformGeeks][8], and you can read more about it [here][5].

Next week I am doing two more:

**February 25**

* [Data Virtualization in SQL Server 2019 Big Data Cluster][9]. Where we look at how we do data virtualization in SQL Server 2019 Big Data Cluster.

**February 27**

* [Deep Dives into the Storage and Data Pools in SQL Server 2019 Big Data Cluster][10]. A closer look at the storage and data pools in SQL Server 2019 Big Data Cluster.

The webinars are free, so if you have time, register and join the fun! Notice that the times in the links above are Indian Standard Time, so 3 pm IST is 09:30 am, UTC.

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


[1]: https://www.infoq.com/articles/anatomy-cascading-failure
[2]: https://medium.com/@dev.anowak/monolith-to-event-driven-microservices-with-apache-kafka-6e4abe171cbb
[3]: https://www.infoq.com/articles/building-scalable-iot-application-with-apache-kafka/
[4]: https://www.instaclustr.com/instaclustr-kongo-iot-logistics-streaming-demo-application/
[5]: {{< relref "2019-12-08-interesting-stuff---week-49-2019.md">}}
[8]: https://www.dataplatformgeeks.com/
[9]: https://www.dataplatformgeeks.com/events/dpg-webinar-25th-february-2020-0300-pm-0400-pm-ist-niels-berglund-data-virtualization-in-sql-server-2019-big-data-cluster/
[10]: https://www.dataplatformgeeks.com/events/dpg-webinar-27th-february-2020-0300-pm-0400-pm-ist-niels-berglund-deep-dives-into-the-storage-and-data-pools-in-sql-server-2019-big-data-cluster/


