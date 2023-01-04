---
type: post
layout: "post"
title: Interesting Stuff - Week 33, 2020
author: nielsb
date: 2020-08-16T09:54:48+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - Kafka
  - ksqlDB
  - Azure Data Studio
  - Azure Sketches
description: Internals of Kafka & ksqlDB, monitoring at Netflix, Azure Data Studio, Azure Sketches, and other interesting topics.
keywords:
  - distributed computing
  - Kafka
  - ksqlDB
  - Azure Data Studio
  - Azure Sketches   
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

## Azure Data Studio

* [The August 2020 release of Azure Data Studio is now available][1]. As the title says, a new version of Azure Data Studio. There are quite a few Jupyter Notebooks enhancements in this release. Now I am waiting for the ability to execute individual lines of code in a Notebook cell.

## Distributed Computing

* [Telltale: Netflix Application Monitoring Simplified][2]. This post about monitoring at Netflix came at a really good time for me, as at [Derivco](/derivco) we are looking at improving our monitoring. So the post gives me food for thought.
* [Patterns of Distributed Systems][3]. This article came to my attention thanks to a colleague of mine - thanks, [Scott][4]! It discusses patterns for distributed systems, and how we can build up an understanding of how to better understand, communicate and teach distributed system design.

## Streaming

* [The Curious Incident of the State Store in Recovery in ksqlDB][5]. This is a great article looking at the inner workings of ksqlDB. It is a must-read for anyone working with ksqlDB, (IMHO).
* [Multi-Threaded Message Consumption with the Apache Kafka Consumer][6]. Kafka consumers are not thread-safe, so you need to be very careful if you want to implement a multi-threaded consumer. The article linked to here drills down into the internals of Kafka consumers, and looks at how to create a multi-threaded consumer.

## WIND (What Is Niels Doing)

We are still in lockdown, but from tomorrow the restrictions are eased somewhat:

* Intra-province travel is allowed.
* Bars and restaurants can sell alcohol.
* Alcohol and cigarettes can be sold.

Even though the restrictions are eased, I gather it will be a long time before we'll be back in the office. Oh, well - it is what it is.

On Tuesday, (Aug 18), I co-host the 4th installment of [Azure Sketches][7]. In this session, we share our expertise and experience if you want to deliver remote working solutions to help inside a global pandemic. Fast, Remote, Agile Application and desktop solutions delivered through Azure. NGOs and Non-Profits are welcome.

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


[1]: https://cloudblogs.microsoft.com/sqlserver/2020/08/12/the-august-2020-release-of-azure-data-studio-is-now-available/
[2]: https://netflixtechblog.com/telltale-netflix-application-monitoring-simplified-5c08bfa780ba
[3]: https://martinfowler.com/articles/patterns-of-distributed-systems/
[4]: https://www.linkedin.com/in/scott-dukes-aaa49154/
[5]: https://www.confluent.io/blog/ksqldb-state-stores-in-recovery/
[6]: https://www.confluent.io/blog/kafka-consumer-multi-threaded-messaging/
[7]: https://www.meetup.com/Azure-Transformation-Labs/events/272339566/
