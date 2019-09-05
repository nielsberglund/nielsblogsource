---
type: post
layout: "post"
title: Interesting Stuff - Week 32, 2019
author: nielsb
date: 2019-08-11T16:07:14+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server
  - Kafka
  - KSQL
  - Maven
description: "Kafka, KSQL & KStreams, SQL Server, and other interesting topics."
keywords:
  - distributed computing
  - SQL Server
  - Kafka
  - KSQL
  - Maven   
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

## SQL Server

* [Introducing Distributed transaction functionality on SQL Server 2017 on Linux starting with CU16][1]. When Microsoft introduced SQL Server on Linux, distributed transactions were not supported, as it required windows components. This blog post announces that Microsoft has managed to integrate the Distributed Transaction Coordinator with SQLPAL for SQL Server 2017 CU16, which means that SQL Server 2017 CU16+ now supports distributed transactions even on Linux.

## Streaming

* [KSQL UDFs and UDAFs Made Easy][2]. This blog post shows how easy it is to create custom KSQL user defined functions, and user defined aggregate functions with the new Maven archetype for UDFs/UDAFs. 
* [Automated Prize Draws with Kafka][3]. This is an excellent article covering how Sky Betting & Gaming uses Kafka in one of their promotional applications.
* [Announcing Tutorials for Apache Kafka][4]. This is an announcement of Kafka Tutorials: a collection of common event streaming use cases, with each tutorial featuring an example scenario and several complete code solutions. I so have bookmarked the site!

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

[1]: https://techcommunity.microsoft.com/t5/SQL-Server/Introducing-Distributed-transaction-functionality-on-SQL-Server/ba-p/786632
[2]: https://www.confluent.io/blog/kafka-ksql-udf-udaf-with-maven-made-easy
[3]: https://sbg.technology/2019/08/09/automated-prize-draws-kafka/
[4]: https://www.confluent.io/blog/announcing-apache-kafka-tutorials
