---
type: post
layout: "post"
title: Interesting Stuff - Week 45, 2019
author: nielsb
date: 2019-11-10T09:26:05+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server 2019
  - Azure Data Studio
  - Azure Synapse Analytics
  - Kafka
description: Kafka, the wonders of Azure Synapse Analytics, Event Hubs and Dapr, and other interesting topics.
keywords:
  - distributed computing
  - SQL Server 2019
  - Azure Data Studio
  - Azure Synapse Analytics
  - Kafka   
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

## Distributed Computing

* [Tutorial: Using Azure Event Hubs with the Dapr framework][2]. A while ago, Microsoft introduced [Dapr][1], (Distributed Application Runtime), which is an event-driven, portable runtime for building microservices on cloud and edge. The post linked to here walks through an example of how to integrate Azure Event Hubs with Dapr.
* [A Quick Introduction to Service Meshes][3]. This article explores the basics of service mesh use-cases and architecture. It gives you an understanding of whether a service mesh is the right solution for you and your organization.
* [Thoughts on Event Driven Architectures][4]. For you who follow my "ramblings" here on my blog, you have probably noticed that I am quite partial to streaming and events. So it should not come as a big surprise that I really liked the post linked to, where the author posts his thoughts around event driven architectures.

## SQL Server 2019

* [SQL Server 2019 is now generally available][5]. The title says it all! At the MS Ignite conference in Orlando, Microsoft announced that SQL Server 2019 is now generally available - it is released!
* [The November 2019 release of Azure Data Studio is now available][6]. Another one of those "the title says it all" posts. Also at Ignite Microsoft announced the November version of Azure Data Studio. There are some exciting features in the release:

    * Deploy SQL Server 2019 Big Data Clusters with the Big Data Clusters deploy wizard.
    * Manage SQL Server 2019 Big Data Clusters health with the controller dashboard. 
    * Jupyter Book support. Read more about Jupyter Books [here][7].

* [Simply unmatched, truly limitless: Announcing Azure Synapse Analytics][8]. This was an announcement at Ignite that very few saw coming. Azure Synapse is formerly known as Azure SQL Data Warehouse, but it is so much more. It brings together enterprise data warehousing and Big Data analytics in a truly transparent way. There is an excellent introductory video [here][9] if you want to know more about Azure Synapse

## Streaming

* [How to Use Single Message Transforms in Kafka Connect][10]. When you use Kafka Connect to stream data from source to sink, you may want to transform records as they flow through. The Kafka Connect API provides a simple interface for doing this: the Single Message Transforms API. This post covers how to use the API.

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

[1]: https://dapr.io/
[2]: https://itnext.io/tutorial-using-azure-event-hubs-with-the-dapr-framework-81c749b66dcf
[3]: https://medium.com/swlh/a-quick-introduction-to-service-meshes-c4c47c6894b1
[4]: https://medium.com/@nwillc/thoughts-on-event-driven-architectures-cbf31c553f4
[5]: https://cloudblogs.microsoft.com/sqlserver/2019/11/04/sql-server-2019-is-now-generally-available/
[6]: https://cloudblogs.microsoft.com/sqlserver/2019/11/05/the-november-2019-release-of-azure-data-studio-is-now-available/
[7]: https://jupyterbook.org/intro.html
[8]: https://azure.microsoft.com/en-us/blog/simply-unmatched-truly-limitless-announcing-azure-synapse-analytics/
[9]: https://www.youtube.com/watch?v=tMYOi5E14eU
[10]: https://www.confluent.io/blog/kafka-connect-single-message-transformation-tutorial-with-examples
