---
type: post
layout: "post"
title: Interesting Stuff - Week 21, 2021
author: nielsb
date: 2021-05-23T08:34:42+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - big data
  - data lakehouses
  - kafka
  - apache pinot
description: Kafka & error handling, Kafka & Apache Pinot, Data Platform Summit 2021, and other interesting topics.
keywords:
  - big data
  - data lakehouses
  - kafka
  - apache pinot   
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

## Data Architecture

* [Evolution to the Data Lakehouse][1]. Data lakehouses have been a hot topic the last year or two, and Databricks, with its lakehouse implementation Delta Lake has been at the forefront. The post linked to looks - as the title implies - at the evolution from data warehouses to data lakes to data lakehouses. Very interesting!

## Streaming

* [6 Event-Driven Architecture Patterns — Part 1][2]. This post is the first of two. The author looks at key patterns of event-driven messaging designs that have facilitated creating a robust distributed system that can easily handle increasing traffic and storage needs. The second part of the series is [here][3].
* ["Harder, Better, Faster, Stronger": Apache Pinot as a Kafka Consumer and Datastore for Fast On-the-Fly Aggregations][4]. You who read my blog have probably noticed that I am quite partial to Kafka and Apache Pinot. Well, in this blog post, we get the best of both worlds. It covers how to use Apache Pinot to do aggregations in "near" real-time. I found the post very interesting.
* [Error Handling Patterns for Apache Kafka Applications][5]. In one of the teams I worked at in [Derivco](/derivco), we had a saying when we were going to do something we were not 100% sure of: *How hard can it be, what can possibly go wrong?*. In some cases, quite a lot could go wrong, and if we look at distributed systems, what can go wrong often goes wrong. This blog post covers different ways to handle errors and retries in event streaming applications. 

## ~ Finally

![](/images/posts/data-summit-2021.jpg)

**Figure 1:** *Big Data & Analytics*

Don't forget to [sign up][6] for my **Big Data & Analytics with SQL Server 2019 Big Data Cluster** class at the [**2021 Data Platform Summit**][7]!

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

[1]: https://databricks.com/blog/2021/05/19/evolution-to-the-data-lakehouse.html
[2]: https://medium.com/wix-engineering/6-event-driven-architecture-patterns-part-1-93758b253f47
[3]: https://medium.com/wix-engineering/6-event-driven-architecture-patterns-part-2-455cc73b22e1
[4]: https://mert.codes/harder-better-faster-stronger-apache-pinot-as-a-kafka-consumer-and-datastore-for-fast-7df25bcc7d02
[5]: https://www.confluent.io/blog/error-handling-patterns-in-kafka/
[6]: http://bit.ly/dps_2021
[7]: https://dataplatformgeeks.com/dps2021/
