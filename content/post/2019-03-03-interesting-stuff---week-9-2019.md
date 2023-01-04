---
type: post
layout: "post"
title: Interesting Stuff - Week 9, 2019
author: nielsb
date: 2019-03-03T10:54:21+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server 2019
  - Kafka
  - Flink
description: Kafka, Flink, SQL Server 2019 CTP2.3, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server 2019
  - Kafka
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

## Distributed Computing

* [Achieving High Throughput with Reliability in Transactional Systems][2]. This presentation from [InfoQ][iq] discusses architecting and designing a high performance, throughput & data processing transactional system and real-time access to large datasets via APIs.
* [Getting from Monolith to Microservices][3]. This [InfoQ][iq] presentation looks at strategies to break a monolith, from the front-end to the back, including database refactoring and analysis tools to see dependencies in legacy code.

## Data Science

* [Training Your First Classifier with Spark and Scala][1]. This post is an excellent introduction to machine learning with Spark and Scala. 

## Streaming

* [Monitoring Apache Flink Applications 101][4]. This blog post provides an introduction to Apache Flink’s built-in monitoring and metrics system, that allows developers to monitor their Flink jobs effectively.
* [Journey to Event Driven – Part 3: The Affinity Between Events, Streams and Serverless][5]. This post is the third part in the [Journey to Eventdriven][6] series, and it looks at how event-driven streaming architectures fit with serverless.

## SQL Server 2019

* [SQL Server 2019 community technology preview 2.3 is now available][7]. What the title of the post says: CTP2.3 of SQL Server 2019 is now available for download. I have already downloaded and installed the Windows version, and right now I am in the process of installing the SQL Server 2019 Big Data Cluster on Azure Kubernetes Service. Happy Days!

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

[1]: https://towardsdatascience.com/training-your-first-classifier-with-spark-and-scala-893d7c6f7d88
[2]: https://www.infoq.com/presentations/architecting-transactional-system
[3]: https://www.infoq.com/presentations/monolith-microservices-refactoring-analysis-tools
[4]: https://www.ververica.com/blog/monitoring-apache-flink-applications-101
[5]: https://www.confluent.io/blog/journey-to-event-driven-part-3-affinity-between-events-streams-serverless
[6]: https://www.confluent.io/blog/journey-to-event-driven-part-1-why-event-first-thinking-changes-everything
[7]: https://cloudblogs.microsoft.com/sqlserver/2019/03/01/sql-server-2019-community-technology-preview-2-3-is-now-available/
