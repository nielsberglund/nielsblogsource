---
type: post
layout: "post"
title: Interesting Stuff - Week 34, 2019
author: nielsb
date: 2019-08-25T19:51:11+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server
  - SQL Server 2019
  - SQL Server 2019 Big Data Cluster
  - Kafka
  - Kubernetes
  - SQL Saturday
description: "Kafka & transactions, SQL Server 2019 Big Data Cluster, SQL Server 2019 RC1, and other interesting topics."
keywords:
  - distributed computing
  - SQL Server
  - SQL Server 2019
  - SQL Server 2019 Big Data Cluster
  - Kafka
  - Kubernetes
  - SQL Saturday   
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

## Misc.

* [What to Do When You've Inherited Dysfunctional Code][1]. This is a very interesting post about what you can do when you have inherited "crap" code. Code that makes no logical sense and is coded in a way that resembles a drunk and disoriented spider trying to build a web.

## Distributed Computing

* [The State of Serverless Computing][2]. This is an [InfoQ][iq] presentation where the presenter briefly discusses both the benefits and shortcomings of existing serverless offerings. He then projects forward to the future and highlights challenges that must be overcome to realize truly general-purpose serverless computing, as well as our efforts to get there.
* [Multi-Tenancy in Kubernetes][3]. This is another [InfoQ][iq] presentation. In this presentation the presenter discusses both the mechanics and the implications of cluster sharing on cost, isolation, and operational efficiency, including use cases, even challenging ones.

## SQL Server 2019

* [SQL Server 2019 release candidate is now available][4]. Boys and girls, start your engines - we are getting closer. Closer to the release of SQL Server 2019! This post announces, as the title implies, that RC1 of SQL Server 2019 has been released, go and get it! Worth noting, however, is that SQL Server 2019 Big Data Cluster has not reached RC1 stage yet. RC1 for SQL Server 2019 Big Data Cluster will come a little bit later.

## Streaming

* [Building Transactional Systems Using Apache Kafka][5]. This article presents an event-based architecture that retains most transactional properties as provided by an RDBMS while leveraging Apache Kafka® as a scalable and highly available single source of truth.

## SQL Saturday

It is late August, and I am in a state of panic! Why, well - the conference season is upon us, and I have months, and months ago, submitted some talks and workshops - and now it is time to get those talks and workshops ready. In other words, I am burning the midnight oil.

Me together with a colleague - [Andrew Collier][acoll] - delivers a one day workshop: **A Day of SQL Server 2019 Big Data Cluster**, where we drill into - you guessed it - SQL Server 2019 Big Data Cluster. We do that Friday, September 6 in Johannesburg, and Friday, September 13 in Cape Town.

If you are interested to understand what SQL Server 2019 Big Data Cluster is all about, please register for Johannesburg [here][6], or Cape Town [here][7]. It will be a blast - I promise!

In Johannesburg, I deliver on Saturday, (September 7), two talks:

* [What is the PiRate, Snake, and Cup of Coffee Doing in My Database?][8]. A talk about the SQL Server Extensibility Framework and how you can use R, Python and Java from inside SQL Server.
* [A Lap Around SQL Server Big Data Cluster][9]. This session gives you an overview of what a SQL Server Big Data Cluster is, and what you can do with it. We look at the various components, (Kubernetes, Spark, HDFS, PolyBase, etc.), and what you can do with them.

For Cape Town, the Saturday schedule is not ready yet, but I have no doubt that I will deliver one or two talks.

I hope to see you there!

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
[acoll]: https://twiter.com/datawookie

[1]: https://medium.com/better-programming/what-to-do-when-youve-inherited-dysfunctional-code-e09822656b3a
[2]: https://www.infoq.com/presentations/state-serverless-computing
[3]: https://www.infoq.com/presentations/multi-tenancy-kubernetes
[4]: https://cloudblogs.microsoft.com/sqlserver/2019/08/21/sql-server-2019-release-candidate-is-now-available/
[5]: https://www.confluent.io/blog/transactional-systems-with-apache-kafka
[6]: https://www.quicket.co.za/events/81482-a-day-of-sql-server-2019-big-data-cluster-with-neils-berglund-and-andrew-collier#/
[7]: https://www.quicket.co.za/events/80996-sqlsaturday-cape-town-2019-precon-with-neils-berglund-mvp-and-andrew-collier-sq/#/
[8]: https://www.sqlsaturday.com/903/Sessions/Details.aspx?sid=95909
[9]: https://www.sqlsaturday.com/903/Sessions/Details.aspx?sid=95908