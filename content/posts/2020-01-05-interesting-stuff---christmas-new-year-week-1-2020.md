---
type: post
layout: "post"
title: Interesting Stuff - Christmas, New Year, Week 1, 2020
author: nielsb
date: 2020-01-05T09:24:49+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - .NET
  - Kafka
  - ksqlDB
  - data science
  - Kubernetes
  - distributed computing
description: Kafka, testing KStream apps, Kubernetes, and other interesting topics.
keywords:
  - .NET
  - Kafka
  - ksqlDB
  - data science
  - Kubernetes
  - distributed computing  
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that have been most interesting to me over the Christmas and New Year period 2019, and the first week of 2020.

<!--more-->

## .NET

* [Optimizing garbage collection in a high load .NET service][1]. The blog post I link to is an awesome post about how to track down memory issues which impacts the performance of your .NET application. If you write .NET applications, please go ahead and read this post.

## Data & Databases

* [Uber’s Data Platform in 2019: Transforming Information to Intelligence][6]. This is a very interesting post, discussing how Uber is handling data and the infrastructure for data. One of the things I found interesting was how they use data science for infrastructure.
* [DBLog: A Generic Change-Data-Capture Framework][2]. This post is about **DBLog**, which is Netflix "homegrown" Change Data Capture, (CDC), framework. What is interesting is that **DBLog** is developed as a framework, and you can "plug in" different data sources. I am looking forward to when it becomes open source!

## Distributed Computing

* [Kubernetes Video Series][3]. What I link to here is not a blog post, but a playlist of Kubernetes videos ranging from the very basic to more advanced.
* [Microservice Observability, Part 2: Evolutionary Patterns for Solving Observability Problems][4]. This is the second post in a series, covering microservices and observability. If you develop microservices, do yourself a favor and read this series. It is well worth it!

## Streaming

* [What's New in Apache Kafka 2.4][5]. Apache Kafka 2.4 was released a couple of weeks ago, and this post lists new and improved functionality in the release. There are quite a few "juicy" things in there!
* [Testing Kafka Streams Using TestInputTopic and TestOutputTopic][7]. Above I mentioned about new features in Apache Kafka 2.4, and this post looks at one of the new features. The feature is the ability to easier test Kafka Streams via a couple of new classes: `TestInputTopic` and `TestOutputTopic`.
* [Beyond Microservices: Streams, State and Scalability][8]. This is an [InfoQ][iq] presentation where the presenter discusses how microservices evolved in the last few years. 
* [Exploring ksqlDB with Twitter Data][9]. A while ago Confluent released **ksqlDB**, the evolution of KSQL. In this post. [Robin Moffat][rmoff] looks at using **ksqlDB** to connect to a live Twitter feed and do "cool stuff".

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


[1]: https://medium.com/swlh/optimizing-garbage-collection-in-a-high-load-net-web-service-3bb620b444a7
[2]: https://medium.com/netflix-techblog/dblog-a-generic-change-data-capture-framework-69351fb9099b
[3]: https://www.youtube.com/playlist?list=PLLasX02E8BPCrIhFrc_ZiINhbRkYMKdPT
[4]: https://bravenewgeek.com/microservice-observability-part-2-evolutionary-patterns-for-solving-observability-problems/
[5]: https://www.confluent.io/blog/apache-kafka-2-4-latest-version-updates/
[6]: https://eng.uber.com/uber-data-platform-2019/
[7]: https://www.confluent.io/blog/test-kafka-streams-with-topologytestdriver/
[8]: https://www.infoq.com/presentations/microservices-streams-state-scalability/
[9]: https://www.confluent.io/blog/stream-processing-twitter-data-with-ksqldb/