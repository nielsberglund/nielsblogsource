---
type: post
layout: "post"
title: Interesting Stuff - Week 17, 2019
author: nielsb
date: 2019-04-28T08:12:38+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server 2019
  - Kafka
  - Debezium
  - Spark
  - Kubernetes
description: Kafka, Debezium .NET & Spark, SQL Serer 2019, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server 2019
  - Kafka
  - Debezium
  - Spark
  - Kubernetes   
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

## Data Science

* [Introducing .NET for Apache® Spark™ Preview][1]. What the title says! Microsoft has released a preview of .NET that you can use together with Apache Spark. It is built on the Spark interop layer, designed to provide high-performance bindings to multiple languages. Being able to write C# code for Spark is so awesome; hopefully, we can soon use it in Notebooks as well.
* [Why Kubernetes is a Great Choice for Data Scientists][2]. This is an interesting post discussing how Kubernetes can be used in a data science world.

## Streaming

* [Reliable Microservices Data Exchange With the Outbox Pattern][3]. At [work](/derivco) we have started looking at [Debezium][debz] as a way to get data from the database into other systems, and while I was investigating this, I came across the linked blog-post. If you are interested in how to turn your databases into event stream sources, then this post is a must read!

## SQL Server 2019

* [SQL Server 2019 preview release notes][4]. Earlier this week, Microsoft released SQL Server 2019 preview CTP 2.5. Some very cool new features! Go and get it!

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
[debz]: https://twitter.com/debezium

[1]: https://devblogs.microsoft.com/dotnet/introducing-net-for-apache-spark/
[2]: https://towardsdatascience.com/why-kubernetes-is-a-great-choice-for-data-scientists-e130603b9b2d
[3]: https://debezium.io/blog/2019/02/19/reliable-microservices-data-exchange-with-the-outbox-pattern/
[4]: https://docs.microsoft.com/en-us/sql/sql-server/sql-server-ver15-release-notes?view=sqlallproducts-allversions