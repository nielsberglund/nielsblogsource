---
type: post
layout: "post"
title: Interesting Stuff - Week 17, 2021
author: nielsb
date: 2021-04-25T08:21:37+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data-lake-table-formats
  - sql-engines
  - Kafka
description: Kafka version without ZooKeeper, table formats for data lakes, SQL engines, and other interesting topics.
keywords:
  - data-lake-table-formats
  - sql-engines
  - Kafka   
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

* [Hudi, Iceberg and Delta Lake: Data Lake Table Formats Compared][1]. This blog post compares the lake formats Hudi, Iceberg, and Delta Lake on their platform compatibility, performance & throughput, and concurrency. Interesting! 
* [Benchmarking SQL engines for Data Serving: PrestoDb, Trino, and Redshift][2]. The linked-to post benchmarks the SQL engines, Redshift, Trino & Presto. Read the post for some interesting findings.

## Streaming

* [2021 Q1 roundup][3]. The author of this post is a freelance researcher, and he is doing quite a lot of work related to streaming. This post is a roundup of what he has done during the first quarter of this year. There are some very interesting pieces in there!
* [What's New in Apache Kafka 2.8][4]. This post, as the title implies, announces the latest version of Apache Kafka: 2.8. Ok, so what is the big deal with that? The big deal is that this version is the first version where you can run Kafka without ZooKeeper! This is not recommended for production, but you can definitely test it out!

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

[1]: https://lakefs.io/hudi-iceberg-and-delta-lake-data-lake-table-formats-compared/
[2]: https://medium.com/explorium-ai/benchmarking-sql-engines-for-data-serving-prestodb-trino-and-redshift-1c5f16d6e5da
[3]: https://scattered-thoughts.net/writing/2021-q1-roundup/
[4]: https://www.confluent.io/blog/kafka-2-8-0-features-and-improvements-with-early-access-to-kip-500/
