---
type: post
layout: "post"
title: Interesting Stuff - Week 41
author: nielsb
date: 2018-10-14T08:03:37+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - flink
  - Azure Serverless
  - ML.NET
description: Flink, Kafka, Azure Serverless functions, ML.NET and other interesting topics!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - flink
  - Azure Serverless
  - ML.NET   
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

## Azure

* [A fast, serverless, big data pipeline powered by a single Azure Function][1]. This is a blog post about how to use Azure Serverless functions to build highly performant data pipelines. At work, we are looking at implementing something similar.

## Distributed Computing

* [Everything is broken][2]. This is a very cool post by [Murat][murba] where he lists some very relevant quotes/statements from a recent [Everything Is Broken][3] meetup he attended. Some of the quotes I particularly liked:

    * *Without observability you don't have chaos engineering, you have a chaos.*
    * *You don't know what you don't know, so dashboards are very limited utility. Dashboards are only for anticipated cases: every dashboard is an artifact of past failures. There are too many dashboards, and they are too slow.*
    * *prerequisites for chaos engineering:*
        
        1. *monitoring & observability*
        2. *on-call & incident management*
        3. *know the cost of your downtime per hour (British Airlines's 1 day outage costed $150 millon)*
    * *How to choose a chaos experiment?*
        
        * *identify top 5 critical systems*
        * *choose 1 system*
        * *whiteboard the system*
        * *select attack: resource/state/network*
        * *determine scope*

## Data Science

* [Announcing ML.NET 0.6 (Machine Learning .NET)][4]. Microsoft just released ML.NET 0.6, and this post highlights some of the new enhancements.

## Streaming

* [Machine learning & Kafka KSQL stream processing — bug me when I’ve left the heater on][5]. I like this post as it combines two of my favorite topics: Streaming and Machine Learning. So anyway, the post is about how you can, by using Kafka and Machine Learning, monitor household power usage and alert when something out of the ordinary occurs.
* [An introduction to ACID guarantees and transaction processing][6]. A while ago dataArtisans introduced serializable, distributed ACID transactions directly on data streams in Flink. This post here talks about the foundations of the capability.
* [KSQL Recipes Available Now in the Stream Processing Cookbook][7]. A post which introduces the "KSQL Cookbook": a collection of "recipes" designed to help people build event-driven, real-time systems. 
* [How Apache Flink manages Kafka consumer offsets][8]. This post explains with a step-by-step example of how Apache Flink works with Apache Kafka to ensure that records from Kafka topics are processed with exactly-once guarantees.

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

[1]: https://azure.microsoft.com/en-us/blog/a-fast-serverless-big-data-pipeline-powered-by-a-single-azure-function/
[2]: https://muratbuffalo.blogspot.com/2018/10/everything-is-broken.html
[3]: https://www.meetup.com/Everything-Is-Broken/events/251899676/
[4]: https://blogs.msdn.microsoft.com/dotnet/2018/10/08/announcing-ml-net-0-6-machine-learning-net/
[5]: https://medium.com/@simon.aubury/machine-learning-kafka-ksql-stream-processing-bug-me-when-ive-left-the-heater-on-bd47540cd1e8
[6]: https://data-artisans.com/blog/an-introduction-to-acid-guarantees-and-transaction-processing
[7]: https://www.confluent.io/blog/ksql-recipes-available-now-stream-processing-cookbook
[8]: https://data-artisans.com/blog/how-apache-flink-manages-kafka-consumer-offsets
