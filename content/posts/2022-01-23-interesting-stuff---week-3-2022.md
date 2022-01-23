---
type: post
layout: "post"
title: Interesting Stuff - Week 3, 2022
author: nielsb
date: 2022-01-23T08:40:56+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - databases
  - Kafka
  - ksqlDB
  - Confluent Cloud
  - Azure Data Explorer
  - SQLBits 2022
description: Kafka, ksqlDB, Confluent Cloud, real-time OLAP databases, Azure Data Explorer at SQLBits 2022, and other interesting topics.
keywords:
  - databases
  - Kafka
  - ksqlDB
  - Confluent Cloud
  - Azure Data Explorer
  - SQLBits 2022   
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

## Databases

* [CIDR 2022 Conference][2]. The Conference on Innovative Data Systems Research (CIDR) is a systems-oriented conference emphasizing the systems architecture perspective. CIDR 2022 was held a couple of weeks ago, and the link is to the table of content, which has links to the given talks. There are some very interesting presentations there.
* [Trip.com：StarRocks efficiently supports high concurrent queries, dramatically reduces labor and hardware cost][3]. The last few years have seen an emergence of real-time distributed OLAP datastore's; Druid, Apache Pinot, Clickhouse, etc. The link here is a post about StarRocks, a fairly new entry into the market. The post compares StarRocks with ClickHouse, and StarRocks comes out quite favourable.

## Streaming

* [Announcing the Confluent Q1 '22 Launch][4]. This blog post announces new features for Confluent Cloud being launched in Q1 2022. One new "feature" that I like is the new Confluent CLI `confluent v2`. With `confluent v2`, I no longer need separate CLI's for on-prem and cloud!
* [Introduction to Streaming Data Pipelines with Apache Kafka and ksqlDB][5]. This blog post describes the elements involved in setting up a Kafka-based data pipeline: connecting data entities together; streaming data from source(s) into the middle of the pipeline; filtering, joining, and enriching the data with ksqlDB. Cool stuff! 

## WIND (What Is Niels Doing)

If you read my [roundup from week 49 last year][6], you do know:

![](/images/posts/sqlbits-precon-adx.png)

**Figure 1:** *SQLBITS 2022 - A Day of Azure Data Explorer*

Yes, I am presenting a one-day training class about Azure Data Explorer at SQLBits 2022. Referring back to what I am doing, I did a promo video for my class last evening, so go to [**A Day of Azure Data Explorer**][1] and have a look. Then [**register**][7] for [**SQLBits 2022**][7].

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

[1]: https://youtu.be/wQwQIy_wwes
[2]: http://cidrdb.org/cidr2022/program.html
[3]: https://starrocks.medium.com/trip-com-starrocks-efficiently-supports-high-concurrent-queries-dramatically-reduces-labor-and-1e1921dd6bf8
[4]: https://www.confluent.io/blog/real-time-data-integrations-at-scale-with-confluent-q1-22-launch/
[5]: https://www.confluent.io/blog/streaming-data-pipeline-with-apache-kafka-and-ksqldb/
[6]: {{< relref "2021-12-05-interesting-stuff---week-49-2021.md" >}}
[7]: https://register.sqlbits.com/event/36db4730-583c-49c1-adcf-f76432bb6580/summary
