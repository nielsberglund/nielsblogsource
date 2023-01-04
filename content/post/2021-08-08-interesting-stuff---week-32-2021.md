---
type: post
layout: "post"
title: Interesting Stuff - Week 32, 2021
author: nielsb
date: 2021-08-08T09:09:24+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - big data
  - analytics
  - apache pinot
  - kafka
  - CDC
  - Debezium
description: Kafka learning center, Apache Pinot and user-facing analytics, Data Platform Summit, and other interesting topics.
keywords:
  - big data
  - analytics
  - apache pinot
  - kafka
  - CDC
  - Debezium   
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

## Big Data / Data Analytics

* [Building a Low-Latency Fitness Leaderboard with Apache Pinot][1]. The terms user-facing/site-facing analytics are "popping up" more and more. When I first heard it, I was pretty confused (pretty typical for me) about what it means - analytics is analytics, after all. But when reading this post, it dawned on me what it is. However, I won't "spoil" the explanation here. Apart from explaining what user-facing analytics mean, this post covers using Apache Pinot to ingest fitness band events from a Kafka topic and make them available for immediate querying. Very cool!
* ['Orders Near You' and User-Facing Analytics on Real-Time Geospatial Data][2]. When it rains, it pours, hey? Another post about user-facing analytics and Apache Pinot. In this post, Uber explains the implementation of the 'Orders Near You' feature and how they generate insights across geospatial data.
* [Uber's Finance Computation Platform][3]. For a company of Uber's size and scale, it is required to have robust, accurate, and compliant accounting and analytics. The post looks at how they built their own in-house platform - the Finance Computation Platform - to meet their demanding requirements.

## Streaming

* [The New One-Stop Shop for Learning Apache Kafka][4]. This is awesome, awesome, awesome! Did I say it was awesome? OK, Niels, calm down - what is this? The post announces an all-new website dedicated to Apache Kafka, event streaming, and associated cloud technologies. As the title says, the site is really a one-stop-shop for everything Kafka! Have a look at the various courses they offer - it is a gold mine!

## WIND (What Is Niels Doing)

Well, apart from spending waaaayyy too much time on [**Confluent Developer**][6], I am prepping for the upcoming [**2021 Data Platform Summit**][12] where I am doing one conference presentation:

* **How to do Real-Time Analytics Using Apache Kafka and Azure Data Explorer**: This session shows how to do near-real-time analysis on data streaming from Apache Kafka (running on Confluent Cloud in Azure) using Azure Data Explorer.

In addition to the session above, I am also doing an eight-hour post-con training class (split over two days):

* [**Big Data & Analytics with SQL Server 2019 Big Data Cluster**][13]: This training covers big data, data virtualization and analytics in SQL Server 2019 Big Data cluster. There are still some seats left, so you can [sign up here][13] if you are interested. Apart from getting to know BDC, an added benefit of signing up is getting a free submission to the summit!

Lately, I have been investigating SQL Server CDC and the use of Debezium to publish data from SQL Server. For my investigations, I have used Kafka running in Docker. Every time I have set this up, I have struggled with deploying the Debezium SQL Server Connector to the Kafka Connect container. I finally decided to write a blog post about so I have something to go back to for next time, and I published the post yesterday:

* [**How to Deploy the Debezium SQL Server Connector to Docker**][5]

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

[1]: https://medium.com/event-driven-utopia/building-a-low-latency-fitness-leaderboard-with-apache-pinot-40a4da672cf0
[2]: https://eng.uber.com/orders-near-you/
[3]: https://eng.uber.com/ubers-finance-computation-platform/
[4]: https://www.confluent.io/blog/confluent-developer-launches-free-apache-kafka-courses-and-tutorials-online/
[5]: {{< relref "2021-08-07-how-to-deploy-the-debezium-sql-server-connector-to-docker.md" >}}
[6]: https://developer.confluent.io/
[12]: https://dataplatformgeeks.com/dps2021/
[13]: https://dataplatformgeeks.com/dps2021/product/big-data-analytics-with-sql-server-2019-big-data-cluster-by-niels-berglund/
