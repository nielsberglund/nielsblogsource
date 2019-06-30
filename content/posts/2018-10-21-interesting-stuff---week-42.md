---
type: post
layout: "post"
title: Interesting Stuff - Week 42
author: nielsb
date: 2018-10-21T19:19:43+02:00
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
  - hadoop
  - Azure Functions
description: Kafka, watermarks in Flink, Uber and Hadoop, event driven architecture, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - flink
  - hadoop
  - Azure Functions   
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

* [Guidance for library authors][1]. This blog post announces the publication of the **.NET Library Guidance**. It’s brand new set of articles for .NET developers who want to create high-quality libraries for .NET.

## Azure

* [Automating Release Notes with Azure Functions][2]. This post is a walk through how Azure Functions and Azure Blob Storage can help generate release notes.

## Big Data

* [Uber’s Big Data Platform: 100+ Petabytes with Minute Latency][3]. This article looks in-depth at Uber's Hadoop platform and how the platform allows for analysis of over 100 petabytes of data with minimal latency.

## Data Science

* [How to Choose a Machine Learning Model – Some Guidelines][4]. This blog post explores some broad guidelines for selecting machine learning models.

## Streaming

* [Event Driven 2.0][5]. In this article [Ben Stopford][benstop] discusses the next generation of event-driven architecture. 
* [Jay Kreps | Kafka Summit SF 2018 Keynote (Kafka and Event-Oriented Architecture)][6]. The San Francisco [Kafka Summit 2018][7] was held October 16 - 17, and this video is Jay Kreps keynote.
* [Martin Kleppmann | Kafka Summit SF 2018 Keynote (Is Kafka a Database?)][8]. Another [Kafka Summit 2018][7] keynote video. This is [Martin Kleppmann][mklep] comparing Kafka to databases.  
* [Apache Kafka: Ten Best Practices to Optimize Your Deployment][9]. An [InfoQ][iq] article discussing the latest Kafka best practices for developers to manage the data streaming platform more effectively. Best practices include log configuration, proper hardware usage, Zookeeper configuration, replication factor, and partition count.
* [Watermarks in Apache Flink Made Easy][10]. This blog post looks at how watermarks work in Flink.

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

[1]: https://blogs.msdn.microsoft.com/dotnet/2018/10/15/guidance-for-library-authors/
[2]: https://blogs.msdn.microsoft.com/dotnet/2018/10/16/automating-release-notes-with-azure-functions/
[3]: https://eng.uber.com/uber-big-data-platform/
[4]: https://www.datasciencecentral.com/profiles/blogs/how-to-choose-a-machine-learning-model-some-guidelines
[5]: https://www.confluent.io/blog/event-driven-2-0
[6]: https://www.youtube.com/watch?v=HeNegOzjnJY&feature=em-uploademail
[7]: https://kafka-summit.org/events/kafka-summit-san-francisco-2018/
[8]: https://www.youtube.com/watch?v=v2RJQELoM6Y&feature=em-uploademail
[9]: https://www.infoq.com/articles/apache-kafka-best-practices-to-optimize-your-deployment
[10]: https://data-artisans.com/blog/watermarks-in-apache-flink-made-easy
