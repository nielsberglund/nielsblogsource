---
type: post
layout: "post"
title: Interesting Stuff - Week 7, 2021
author: nielsb
date: 2021-02-14T07:28:01+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - ksqlDB
  - Apache Pinot
  - Big Data
  - data lake
description: Kafka, ksqlDB, the ins & out of Data Lakes, Apache Pinot & analysis, and other interesting topics.
keywords:
  - Kafka
  - ksqlDB
  - Apache Pinot
  - Big Data
  - data lake   
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

## Data Architecture

* [Data Lake: Concepts, Characteristics, Architecture, and Case Studies][1]. This is a long post where the authors try to explain what a Data Lake is, characteristics of a Data Lake, the architecture of a Data Lake, and a lot more. It is an excellent read!

## Big Data Analytics

* [Building Latency Sensitive User Facing Analytics via Apache Pinot][2]. In this [InfoQ][iq] presentation, the presenter discusses how LinkedIn, Uber and other companies managed to have low latency for analytical database queries despite high throughput.

## Streaming

* [Introducing Confluent Platform 6.1][3]. The post linked to here announces, as the title implies, the 6.1 version of Confluent Platform. There are quite a few new exciting features in this release. What excites me the most are the enhanced functionality of ksqlDB! That is something that will help us at [Derivco](/derivco) a lot.

## WIND (What Is Niels Doing)

While writing my blog posts about the open-sourced Python SQL Server language extension, I wanted to install SQL Server on a new, clean server. I decided to do it on an Azure VM instead of "messing" with VM's on my box.

It was not as straight forward as I thought, so I am now about to finish a post about what I did. 

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


[1]: https://alibaba-cloud.medium.com/data-lake-concepts-characteristics-architecture-and-case-studies-28be1b265624
[2]: https://www.infoq.com/presentations/low-latency-high-throughput/
[3]: https://www.confluent.io/blog/introducing-confluent-platform-6-1/