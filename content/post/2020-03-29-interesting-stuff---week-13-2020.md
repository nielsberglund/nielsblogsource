---
type: post
layout: "post"
title: Interesting Stuff - Week 13, 2020
author: nielsb
date: 2020-03-29T09:58:17+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - data
  - data warehouses
  - ksqlDB
  - .NET
  - Coyote
description: ksqlDB, data warehouses, .NET & Coyote, and other interesting topics.
keywords:
  - distributed computing
  - data
  - data warehouses
  - ksqlDB
  - .NET
  - Coyote 
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

## Data

* [Building a Data Warehouse: Basic Architectural principles][1]. The post linked to here looks at an approach towards simplifying data warehousing. The post comes in "handy" as we are looking at this in [Derivco](/derivco) at the moment.

## .NET

* [Coyote: Making it easier for developers to build reliable asynchronous software][2]. This post is about Coyote, which is a programming framework for building reliable asynchronous software. It ensures the design and code remain in sync, which simplifies the addition of new features. Looks very interesting - I'll talk to some of my developers and see what they say.

## Streaming

* [ksqlDB: The Missing Link Between Real-Time Data and Big Data Streaming][3]. When processing data, the question is, what is more efficient: event streaming or batch processing. The question comes from two ideas around data analytics architecture: state orientation and event orientation The post I link to here looks at both concepts and, as this is from Confluent, it highlights the event streaming capabilities in ksqlDB.

## WIND (What Is Niels Doing)

In last weeks [roundup][4] I mentioned how South Africa had declared a national disaster and more or less put the country in lock-down. This due to the Coronavirus. Well, the "more or less" lock-down became a true lock-down last Friday (March 27), and we are no longer allowed to leave our homes, except in case of emergencies, and to purchase groceries!

We'll see how long the lock-down lasts. Initially, it is said to be for 3 weeks, but most people expect it to be longer. From a work perspective, I am lucky to be working for [Derivco](/derivco), as the company has made a tremendous effort in enabling all employees to work from home!

The blog-post I have been working on based on my conference talk *A Lap Around SQL Server 2019 Big Data Cluster* is still not done. I have a bad case of "writers' block" at the moment. Hopefully, I will get over it sooner rather than later, but do not expect this post anytime soon. Sorry about that!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me. Most importantly stay safe out there!

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


[1]: https://towardsdatascience.com/building-a-data-warehouse-basic-architectural-principles-66bd7059ffd0
[2]: https://www.microsoft.com/en-us/research/blog/coyote-making-it-easier-for-developers-to-build-reliable-asynchronous-software/
[3]: https://www.confluent.io/blog/ksqldb-real-time-data-and-big-data-streaming/
[4]: {{< relref "2020-03-22-interesting-stuff---week-12-2020.md" >}}
