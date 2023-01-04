---
type: post
layout: "post"
title: Interesting Stuff - Week 11, 2022
author: nielsb
date: 2022-03-20T08:30:37+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server
  - ksqlDB
description: Kafka & new features in ksqlDB 0.24.0, how to run MSDTC and SQL server in containers on Kubernetes, and other interesting stuff.
keywords:
  - SQL Server
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

This blog post is the "roundup" of the things that have been most interesting to me for the week just ending. This week, there hasn't been that much that has caught my eye, but here it is.

<!--more-->

## SQL Server

* [Configure MSDTC to run Distributed transactions for SQL Server Linux Containers on Azure Kubernetes][1]. This blog post does exactly what it says. It discusses setting up and configuring SQL Server and MS DTC to run in containers on the Kubernetes platform. I have been working with SQL Server since version 4.x (I believe it was 4.2), and a couple of years back, I would never have thought we'd see SQL running on Linux, never mind on Kubernetes! As Bob Dylan sang, ["The Times They Are A-Changin'"][2].

## Streaming

* [Announcing ksqlDB 0.24.0][3]. Another post doing what the title says. This post looks at some of the new features in ksqlDB 0.24.0. The post also shows some examples of how to use them. I am quite interested in the ability to access record data headers from within ksqlDB. Very cool! Another interesting feature is the new functions aiding in processing JSON-formatted strings.

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

[1]: https://techcommunity.microsoft.com/t5/sql-server-blog/configure-msdtc-to-run-distributed-transactions-for-sql-server/ba-p/3259913
[2]: https://youtu.be/90WD_ats6eE
[3]: https://www.confluent.io/blog/announcing-ksqldb-0-24-0/
