---
type: post
layout: "post"
title: Interesting Stuff - Week 42, 2019
author: nielsb
date: 2019-10-20T08:40:13+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server
  - Kafka
  - Confluent Cloud
  - Debezium
description: Kafka, Confluent Cloud, JSON in SQL Server and other interesting topics.
keywords:
  - distributed computing
  - SQL Server
  - Kafka
  - Confluent Cloud
  - Debezium 
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

## .NET

* [.NET Core Worker Service as Windows Service or Linux Daemons][1]. This post discusses a new .NET Core 3 application template called "Worker Service". The template makes it easy to write Windows Services or Linux Daemons.

## SQL Server

* [JSON in your Azure SQL Database? Let’s benchmark some options!][2]. This Microsoft post discusses and benchmarks options on how to handle JSON in SQL Server.
* [Optimize OLTP Performance with SQL Server on Azure VM][3]. This article shares recommendations on how to optimize SQL Server performance on Azure VMs. The article is based on performance testing with a somewhat scaled-down [TPC-E][4] benchmark. 

## Streaming

* [Skipping bad records with the Kafka Connect JDBC sink connector][5]. This post by the Kafka guru [Robin Moffat][rmoff] discusses how to handle bad records when using the JDBC sink connector in Kafka Connect. Very interesting!
* [KCACHE: AN IN-MEMORY CACHE BACKED BY KAFKA][6]. This post details how you can have an in-memory cache backed by Kafka. Excellent!
* [Using Kafka Connect and Debezium with Confluent Cloud][7]. This is yet another awesome post by [Robin][rmoff]. One where he discusses how you can use Debezium together with Confluent Cloud.

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

[1]: https://levelup.gitconnected.com/net-core-worker-service-as-windows-service-or-linux-daemons-a9579a540b77
[2]: https://techcommunity.microsoft.com/t5/SQL-Customer-Success-Engineering/JSON-in-your-Azure-SQL-Database-Let-s-benchmark-some-options/ba-p/909131
[3]: https://techcommunity.microsoft.com/t5/SQL-Server/Optimize-OLTP-Performance-with-SQL-Server-on-Azure-VM/ba-p/916794
[4]: http://www.tpc.org/tpce/default.asp
[5]: https://rmoff.net/2019/10/15/skipping-bad-records-with-the-kafka-connect-jdbc-sink-connector/
[6]: https://yokota.blog/2018/11/19/kcache-an-in-memory-cache-backed-by-kafka/
[7]: https://rmoff.net/2019/10/16/using-kafka-connect-and-debezium-with-confluent-cloud/
