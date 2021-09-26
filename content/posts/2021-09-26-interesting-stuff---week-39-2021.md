---
type: post
layout: "post"
title: Interesting Stuff - Week 39, 2021
author: nielsb
date: 2021-09-26T10:49:18+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - kafka
  - ksqldb
  - databricks
  - azure data explorer
  - kappa
description: Kafka 3.0, ksqlDB 0.21, Kappa vs. Lambda, Azure Data Explorer, Azure Databricks, and other interesting topics!
keywords:
  - kafka
  - ksqldb
  - databricks
  - azure data explorer
  - kappa   
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

## Streaming

* [Understanding Materialized Views — 3 : Stream-Table Joins with CDC][2]. In a roundup a couple of weeks ago, I linked to a post about materialized views, and I wrote how I couldn't wait for a follow-up post. Well, here it is. In this post, the author looks at joining streams with lookup tables to create materialized views. Very cool!
* [What's New in Apache Kafka 3.0.0][3]. I guess the title says it all. Apache Kafka version 3.0 has just been released, and this blog post looks at some of the new features, fixes, and improvements.
* [How to Load Test Your Kafka Producers and Consumers using k6][4]. A couple of weeks ago, I came across [k6][5], a modern load testing framework for both developers as testers. I thought it would be cool if I somehow could load-test Kafka producers and consumers in the framework. Well, I can now do it, and the post I have linked to discusses the newly developed Kafka k6 extension: xk6-kafka. I cannot wait to put it through its paces.
* [Announcing ksqlDB 0.21.0][6]. Above I linked to the announcement of Kafka 3.0. This post discusses the new ksqlDB 0.21.0 release and looks at some of the new features.
* [Kappa Architecture is Mainstream Replacing Lambda][7]. In this post, the author looks at the benefits the Kappa architecture provides over the Lambda architecture. One of the major, major benefits is a much simpler infrastructure.

## WIND (What Is Niels Doing)

Right now, I am "prepping" for two conference talks this coming week:

* [**Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer**][8]: On Wednesday (Sept 29), I deliver this presentation which is an overview of **Azure Data Explorer**, and how it is ideal for near-real-time analytics of huge volumes of data.
* [**Improve Customer Lifetime Value using Azure Databricks & Delta Lake**][9]. Then on Thursday (Sept 30), I present how you can calculate and improve Customer Lifetime Value (CLV) using Azure Databricks.

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

[1]: {{< relref "2021-09-12-interesting-stuff---week-37-2021.md" >}}
[2]: https://medium.com/event-driven-utopia/understanding-materialized-views-3-stream-table-joins-with-cdc-77591d2d6fa0
[3]: https://www.confluent.io/blog/apache-kafka-3-0-major-improvements-and-new-features/
[4]: https://k6.io/blog/load-test-your-kafka-producers-and-consumers-using-k6/
[5]: https://k6.io/
[6]: https://www.confluent.io/blog/announcing-ksqldb-0-21-new-features-major-upgrades/
[7]: https://www.kai-waehner.de/blog/2021/09/23/real-time-kappa-architecture-mainstream-replacing-batch-lambda/
[8]: https://datadrivencommunity.com/speaker-NielsBerglund-session.html
[9]: https://azurebootcamp.co.za/