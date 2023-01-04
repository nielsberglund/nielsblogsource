---
type: post
layout: "post"
title: Interesting Stuff - Week 26, 2019
author: nielsb
date: 2019-06-30T08:40:49+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server 2019
  - Kafka
  - .NET
description: Kafka & microservices, Kafka client for .NET, SQL Server 2019 and other interesting topics.
keywords:
  - distributed computing
  - SQL Server 2019
  - Kafka
  - .NET   
---

I cannot believe we have reached half year mark already - week 26!

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending.

<!--more-->

## SQL Server 2019

* [SQL Server 2019 CTP 3.0 plus P startup option (for experimentation only)][1]. This is a very interesting post by [Lonny][lonny] where he discusses some new startup options in SQL Server. More specifically how you can, at startup time, have SQL Server create an arbitrary number of schedulers. Very cool!

## .NET

* [Designing the .NET API for Apache Kafka][2]. I debated with myself whether this post belonged under .NET or Streaming, as you see .NET won. Anyway, this post is about the Confluent .NET Kafka client and the work that has gone into it. Now, if we could get a .NET implementation of the Kafka Streams API as well, #justsaying!

## Streaming

* [Manually delete a connector from Kafka Connect][3]. This is a handy post by [Robin][rmoff], looking at how one can manually delete Kafka connectors. I have said it before, and I say it again - if you are interested in Kafka, [Robin][rmoff]'s [blog][4] **MUST** be in your reading list.
* [Microservices, Apache Kafka, and Domain-Driven Design][5]. I must say that this post came at the exact right time for me, as what it covers: Kafka as a backbone for microservices architectures, is what I am looking at right now! Excellent!

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

[1]: http://sql-sasquatch.blogspot.com/2019/06/sql-server-2019-ctp-30-plus-p-startup.html
[2]: https://www.confluent.io/blog/designing-the-net-api-for-apache-kafka
[3]: https://rmoff.net/2019/06/23/manually-delete-a-connector-from-kafka-connect/
[4]: https://rmoff.net/
[5]: https://www.confluent.io/blog/microservices-apache-kafka-domain-driven-design
