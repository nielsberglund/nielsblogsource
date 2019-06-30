---
type: post
layout: "post"
title: Interesting Stuff - Week 44
author: nielsb
date: 2018-11-04T18:54:29+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - kafka
  - ksql
  - SQL Server 2019 Big Data Cluster
description: Kafka and detecting fraud, Azure Stream Analytics, SQL Server 2019 Big Data Cluster and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - kafka
  - ksql
  - SQL Server 2019 Big Data Cluster   
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

* [Local testing with live data means faster development with Azure Stream Analytics][1]. An Azure Stream Analytics (ASA) announcement of a new feature which lets you test your ASA queries locally while using live data streams from cloud sources such as Azure Event Hubs, IoT Hub or Blob storage!
* [ATM Fraud Detection with Apache Kafka and KSQL][2]. A blog post by [Robin Moffat][rmoff] discussing how, by using Kafka and KSQL, you can take a stream of inbound ATM transactions and easily set up an application to detect transactions that look fraudulent. Awesome!
* [Noria: dynamic, partially-stateful data-flow for high-performance web applications][3]. [Adrian][adcol] dissects a white-paper about Noria: a new streaming data-flow system designed to act as a fast storage backend for read-heavy web applications. It acts like a database but precomputes and caches relational query results so that reads are blazingly fast. 

## Distributed Computing

* [The FuzzyLog: a partially ordered shared log][4]. Another white-paper dissected by [Adrian][adcol]. This time it is about FuzzyLog and the FuzzyLog abstraction which extends the shared log approach to partial orders, allowing applications to scale linearly without sacrificing transactional guarantees, and switch seamlessly between these guarantees when the network partitions and heals.

## WIND (What Is Niels Doing)

I am still trying to get to grips with **SQL Server 2019 Big Data Cluster**, and now I better sort it out as I on Wednesday (November 7), is supposed to give a presentation about [Building a SQL 2019 Big Data Cluster on Azure Kubernetes Service][5]. If you are in Durban, please come by and say Hi!

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

[1]: https://azure.microsoft.com/en-us/blog/local-testing-with-live-data-means-faster-development-with-azure-stream-analytics-2/
[2]: https://www.confluent.io/blog/atm-fraud-detection-apache-kafka-ksql
[3]: https://blog.acolyer.org/2018/10/29/noria-dynamic-partially-stateful-data-flow-for-high-performance-web-applications/
[4]: https://blog.acolyer.org/2018/11/02/the-fuzzylog-a-partially-ordered-shared-log/
[5]: https://www.meetup.com/Azure-Transformation-Labs/events/255690875/?rv=ea1_v2&_xtd=gatlbWFpbF9jbGlja9oAJGRjZmM2OTBjLWEwNTgtNDRjZi1iOWQyLWI5YzMyZTM1YmIzMg
