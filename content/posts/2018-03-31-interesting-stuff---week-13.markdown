---
layout: post
title: Interesting Stuff - Week 13
author: nielsb
date: 2018-03-31T19:12:05+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - AI
  - flink
  - dA Platform
  - key-value store
description: dataArtisans dA Platform is released, patterns for Big Data in Azure, a great video series about he Microsoft Artificial Intelligence suite, and other cool stuff!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - AI
  - flink
  - dA Platform
  - key-value store  
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

## Azure Cloud

* [Implementation patterns for big data and data warehouse on Azure][1]. A blog post which lists some patterns and tools for big data as well as data warehouses in the Azure world. When I read it, I was surprised to see no mention of Azure Data Lake in the different patterns. I wrote a comment and asked about it, and received the answer that Azure Data Lake was a possibility instead of Azure Blob Store.

## Streaming

* [Full Stream Ahead! dA Platform is Generally Available and Ready for Download][2]. This blog post announces the general availability of the [**dA Platform**][3] from dataArtisans. This is very exciting news, and I am so eager to test it out.

## Databases

* [Anna: A KVS for any scale][4]. A dissection, done by [Adrian][adcol] of a white-paper about a new key-value store system: Anna. Anna is a partitioned and multi-mastered system, which achieves high performance and elasticity via wait-free execution and coordination-free consistency. Very exciting stuff!

## Data Science & AI

* [Artificial Intelligence and Machine Learning for the SWE][5]. An [InfoQ][iq] presentation by Rob Harrop where he describes his journey from traditional Software Engineer to AI/ML Engineer, and his experience building a development team with ML as the foundation.
* [Introduction to the Microsoft AI Platform][6]. An excellent video series by [Buck Woody][buckw], where he covers the Microsoft Artificial Intelligence suite of tools and services. This is a must watch!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com

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

[1]: https://azure.microsoft.com/en-us/blog/implementation-patterns-for-big-data-and-data-warehouse-on-azure/
[2]: https://data-artisans.com/blog/da-platform-with-apache-flink-general-availability
[3]: https://data-artisans.com/blog/da-platform-stateful-stream-processing-with-apache-flink-made-easier
[4]: https://blog.acolyer.org/2018/03/27/anna-a-kvs-for-any-scale/
[5]: https://www.infoq.com/presentations/ai-ml-swe
[6]: https://blogs.msdn.microsoft.com/buckwoody/2018/03/27/introduction-to-the-microsoft-ai-platform/
