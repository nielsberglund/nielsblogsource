---
type: post
layout: "post"
title: Interesting Stuff - Week 31, 2020
author: nielsb
date: 2020-08-02T14:17:05+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - ksqlDB
  - Flink
description: Kafka, ksqlDB and keys, Apache Flink, Derivco Webinar, and other interesting topics.
keywords:
  - Kafka
  - ksqlDB
  - Flink   
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

## Streaming

* [Data Enrichment in ksqlDB Using UDTFs][1]. A very interesting post using ksqlDB and user defined functions for monitoring purposes. I will definitely try this!
* [An Introduction to Stream Processing with Apache Flink][2]. As the title says, the post introduces Apache Flink. It presents an overview of Apache Flink and its key features for streaming applications. 
* [The Challenges of Building a Reliable Real-Time Event-Driven Ecosystem][3]. There is an increasing appetite for data delivered in real-time, and this post looks at differences between the REST model and real-time APIs.
* [Event sourcing from static data using Kafka][4]. This post looks at how we can generate events from changes to static data by using Kafka and ksqlDB. I found this post very useful!
* [How PushOwl Uses ksqlDB to Scale Their Analytics and Reporting Use Cases][5]. This is a very interesting post looking at how ksqlDB makes it easy to integrate event streaming applications into any tech stack. 
* [I've Got the Key, I've Got the Secret. Here's How Keys Work in ksqlDB 0.10.][6]. The ksqlDB release 0.10 changes and improves how keys are handled. This post looks at some of the changes.


## WIND (What Is Niels Doing)

Not so much what I am doing, but on Monday Derivco holds a webinar where the speaker is Lillian Barnard - the managing director of Microsoft SA. She'll be talking about building strong, high-performing teams as well as discussing creating diverse and inclusive workplaces. 

Sign up [here][7]!

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


[1]: https://www.confluent.io/blog/infrastructure-monitoring-with-ksqldb-udtf/
[2]: https://towardsdatascience.com/an-introduction-to-stream-processing-with-apache-flink-b4acfa58f14d
[3]: https://www.infoq.com/articles/realtime-event-driven-ecosystem/
[4]: https://medium.com/@jm4668/event-sourcing-from-static-data-using-kafka-d00069332802
[5]: https://www.confluent.io/blog/how-pushowl-uses-ksqldb-to-scale-analytics-and-reporting-use-cases/
[6]: https://www.confluent.io/blog/ksqldb-0-10-updates-key-columns/
[7]: https://derivco.co.za/webinar-with-lillian-barnard/
