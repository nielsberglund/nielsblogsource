---
type: post
layout: "post"
title: Interesting Stuff - Week 21, 2022
author: nielsb
date: 2022-05-29T13:13:28+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - MacBook
  - Python
  - Azure Data Explorer
  - Kafka
  - EventHubs
description: Kafka & what is new in 3.2, Azure EventHubs Premium for performance, Predictive scaling in Azure Data Explorer, and other interesting topics.
keywords:
  - MacBook
  - Python
  - Azure Data Explorer
  - Kafka 
  - EventHubs  
---

![](/images/posts/snake.jpg)

**anaConda** *Photo by <a href="https://unsplash.com/@sharonmccutcheon?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Sharon McCutcheon</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>*

Throughout the week, I read a lot of blog-posts, articles, and so forth that has to do with things that interest me:

* AI/data science
* data in general
* data architecture
* streaming
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Misc.

* [How to Manage Conda Environments on an Apple Silicon M1 Mac][1]. As I mentioned in a [previous roundup][2], I have switched over to the "dark side" for my travel laptop - I did get myself a MacBook Pro. Coming from a Windows background setting it up and configuring it is sometimes a chore, so I tend to save links to blog posts/articles covering setup/configuration of a Mac. This link is such a post, and it looks at how to manage different Python environments using Conda.
* [Microsoft Build event announcements][3]. Last week (May 24 - 26), Microsoft held its annual Build conference. Many interesting things were announced, and the post linked to looks at some of the data platform announcements. One "biggie" is that SQL Server 2022 has been released into Public Preview.

## Azure Data Explorer

* [Deleting individual records in a table][3]. You who read my blog probably know that I like **Azure Data Explorer**. You also may know that my background is SQL Server. I mention my SQL Server background because sometimes doing things in ADX is somewhat different from what you'd do in SQL Server. An example of this is deleting records. That is what this post looks at. It covers deleting individual records from a table and how it works behind the scenes.
* [Optimized autoscale – predictive planning][5]. Azure Data Explorer has supported autoscaling (out and in) for quite some time. The autoscaling has been reactive, i.e. the scaling is delayed and requires time to alleviate the pressure off the cluster. This post looks at predictive autoscaling. It was recently added, and it tracks main metrics and builds a usage pattern. This allows ADX to plan cluster scale out and scale in ahead of time to further improve cluster performance while reducing cost.

## Streaming

* [Benchmarking Azure Event Hubs Premium for Kafka and AMQP workloads][6]. Microsoft recently announced the general availability of Azure Event Hubs Premium. It is a new product tier meant to support high-end event streaming scenarios. This post benchmarks this new product tier against Kafka, and the numbers are quite interesting. It is probably worth having a look at Azure Event Hubs Premium.
* [What's New in Apache Kafka 3.2.0][7]. The title of this post kind if gives it away. Yes, the post looks at some of the new and improved features in the 3.2 release of Apache Kafka. What is of particular interest to me is the new features in KStreams. I hope they will make way for new functionality in ksqlDB as well.

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

[1]: https://towardsdatascience.com/how-to-manage-conda-environments-on-an-apple-silicon-m1-mac-1e29cb3bad12
[2]: https://nielsberglund.com/2022/04/03/interesting-stuff---week-13-2022/
[3]: https://www.jamesserra.com/archive/2022/05/microsoft-build-event-announcements-4/
[4]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/deleting-individual-records-in-a-table/ba-p/3166847
[5]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/optimized-autoscale-predictive-planning/ba-p/3413543
[6]: https://techcommunity.microsoft.com/t5/messaging-on-azure-blog/benchmarking-azure-event-hubs-premium-for-kafka-and-amqp/ba-p/3377483
[7]: https://www.confluent.io/blog/apache-kafka-3-2-0-new-features-and-updates/
