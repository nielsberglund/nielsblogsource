---
type: post
layout: "post"
title: Interesting Stuff - Week 6, 2022
author: nielsb
date: 2022-02-13T17:27:47+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - databricks
  - delta live
  - Apache Spark
  - Spark Streaming
  - ksqlDB
description: Kafka & ksqlDB architecture, Databricks Delta Live tables & CDC, Databricks & Spark streaming, and other interesting topics.
keywords:
  - databricks
  - delta live
  - Apache Spark
  - Spark Streaming
  - ksqlDB   
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

## Big Data

* [Databricks Delta Live Tables Announces Support for Simplified Change Data Capture][1]. I don't know what category this post falls under, but Big Data sounds OK:ish, so that's where it ends up. Anyway, the post looks at [Delta Live][2] table's support for CDC. Cool stuff!

## Streaming

* [Structured Streaming: A Year in Review][3]. This post gives an overview of all the new Structured Streaming features developed in 2021 for Databricks and Apache Spark. As you see, it is quite a lot!
* [Introducing ksqlDB][4]. The post linked to is from back in November 2019, and I must have missed it then. I came across it as I was "researching" ksqlDB (read browsing). The post introduces pull queries and Kafka Connect connector management from inside ksqlDB. As cool as that is, that was not what caught my eye. No, what I found interesting was the section around ksqlDB's internal architecture, very cool!

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

[1]: https://databricks.com/blog/2022/02/10/databricks-delta-live-tables-announces-support-for-simplified-change-data-capture.html
[2]: https://databricks.com/product/delta-live-tables
[3]: https://databricks.com/blog/2022/02/07/structured-streaming-a-year-in-review.html
[4]: https://www.confluent.io/blog/intro-to-ksqldb-sql-database-streaming/
