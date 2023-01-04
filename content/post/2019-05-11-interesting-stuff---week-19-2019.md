---
type: post
layout: "post"
title: Interesting Stuff - Week 19, 2019
author: nielsb
date: 2019-05-11T06:39:50+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - .NET Core
  - Kafka
  - Spark
  - KafkaSummit
description: Kafka & Events, ML.NET, .NET Core, Spark, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - .NET Core
  - Kafka
  - Spark   
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

* [.NET Core is the Future of .NET][1]. .NET is Dead! Long Live .NET! Somewhat melodramatic, but anyway. So, in this blog post Microsoft announces what almost everyone already knew - that .NET Framework 4.8 is the last major version of .NET Framework. Going forward Microsoft's efforts will be on .NET Core.   
* [Introducing .NET 5][2]. Hot on the heels of the blog post above, announcing the death of .NET Framework, comes this post, laying out the future of .NET Core, .NET 5.
* [Introducing diagnostics improvements in .NET Core 3.0][6]. Yet another .NET Core post. This post discusses a suite of tools that utilize new features in the .NET runtime that makes it easier to diagnose and solve performance problems.

## Data Science / Machine Learning

* [Announcing ML.NET 1.0][3]. I have during the last months now and then posted in these "roundups" about new releases of ML.NET. Microsoft has now released version 1.0 with a lot of interesting new features, and that is what this post is about.
* [Productionizing H2O Models with Apache Spark][7]. This is an [InfoQ][iq] presentation demonstrating the creation of pipelines integrating H2O machine learning models and their deployments using Scala or Python.

## Streaming

* [Event Streams and Workflow Engines – Kafka and Zeebe][4]. An [InfoQ][iq] discussing how Kafka fits in an Event-Driven Architecture, and how workflow engines can handle complex business processes. The article also mentioned how Zeebe, a new highly scalable workflow engine, can be used with Kafka.
* [Apache Kafka Data Access Semantics: Consumers and Membership][5]. This is an article discussing in detail how the Kafka consumer works. It also talks about consumer groups, how their state is saved, and consistency is ensured. It discusses how consumer groups are managed in a distributed way, and finally, the article looks at the rebalance protocol.
* [Journey to Event Driven – Part 4: Four Pillars of Event Streaming Microservices][8]. This is the fourth "episode" in the "Journey to Event Driven". This time the discussion is around the four individual parts that make up event streaming. I cannot wait to hear more about it next week at the Kafka Summit in London!

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

[1]: https://devblogs.microsoft.com/dotnet/net-core-is-the-future-of-net/
[2]: https://devblogs.microsoft.com/dotnet/introducing-net-5/
[3]: https://devblogs.microsoft.com/dotnet/announcing-ml-net-1-0/
[4]: https://www.infoq.com/news/2019/05/kafka-zeebe-streams-workflows
[5]: https://www.confluent.io/blog/apache-kafka-data-access-semantics-consumers-and-membership
[6]: https://devblogs.microsoft.com/dotnet/introducing-diagnostics-improvements-in-net-core-3-0/
[7]: https://www.infoq.com/presentations/h2o-model-spark
[8]: https://www.confluent.io/blog/journey-to-event-driven-part-4-four-pillars-of-event-streaming-microservices
