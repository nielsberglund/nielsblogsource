---
type: post
layout: "post"
title: Interesting Stuff - Week 18, 2021
author: nielsb
date: 2021-05-02T07:55:53+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server
  - Kafka
  - ksqlDB
  - SQL external languages
  - Pinot
description: Handle Kafka outages, new version ksqlDB, ONNX as SQL External Language, and other interesting topics.
keywords:
  - SQL Server
  - Kafka
  - ksqlDB
  - SQL external languages
  - Pinot   
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

## SQL Server

* [Inference of ML Models in SQL Server via External Languages][1]. SQL Server 2019 introduced the notion of External Languages, whereby we can execute calls against an external language, (Java, Python, etc.), from inside SQL Server. This post looks at scoring of ONNX models where ONXX has been registered as an external language. Very cool!

## Data Analytics

* [Deploying Apache Pinot at a Large Retail Chain][2]. The post linked to here looks at the use of Apache Pinot at a large retailer and how it is used to some of the big challenges around data analytics.

## Streaming

* [Announcing ksqlDB 0.17.0][3]. The title of this post says it all; it looks at the latest release of ksqlDB! Reading the post, there are quite a few interesting new features in this release. Personally, I am quite excited about the ability to do table scans! At [Derivco](/derivco), we have waited for that for a while.
* [How to Survive a Kafka Outage][4]. Another post where the title says it all. The post looks at various types of potential Kafka outages and options to handle the outages.

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

[1]: https://techcommunity.microsoft.com/t5/sql-server/inference-of-ml-models-in-sql-server-via-external-languages/ba-p/2216226
[2]: https://medium.com/apache-pinot-developer-blog/deploying-apache-pinot-at-a-large-retail-chain-42aed2921a38
[3]: https://www.confluent.io/blog/announcing-ksqldb-0-17-0-new-features-and-updates/
[4]: https://www.confluent.io/blog/how-to-survive-a-kafka-outage/