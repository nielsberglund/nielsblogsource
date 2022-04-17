---
type: post
layout: "post"
title: Interesting Stuff - Week 15, 2022
author: nielsb
date: 2022-04-17T16:52:11+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - machine learning
  - feature store
  - kafka
  - trino
  - Azure Data Explorer
  - KQL
description: Kafka internals, Kafka & Trino @ Uber, Feathr feature store, IoT & Azure Data Explorer, and other interesting topics.
keywords:
  - data science
  - machine learning
  - feature store
  - kafka
  - trino
  - Azure Data Explorer
  - KQL  
---

![](/images/posts/feather.png)

Photo by <a href="https://unsplash.com/@lettis?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Letti Schm</a> on <a href="https://unsplash.com/collections/1992753/feathers?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>

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

## Data / Data Science / Machine Learning

* [Feathr: LinkedIn's feature store is now available on Azure][1]. In Data Science / Machine Learning, you have the concept of a **Feature Store**. The Feature Store is a place where features are centralized in an organization so they can be reused, served in a synchronous way between offline and online environments, and served in real-time with low latency. **Feathr** is the feature store that has been used in production and battle-tested in LinkedIn for over 6 years. It has now been open-sourced and made available on Azure. This blog post looks closer at what Feathr is and how you can get started with it. 
* [Data Mesh Observability Pattern][2]. The Data Mesh Observability Pattern helps you understand the state of your Data Mesh, the movement of its data, and its usage patterns. This blog post looks at how this pattern works and why it is crucial to the success of your enterprise Data Mesh.

## Azure Data Explorer

* [Send data from Node-RED to free Azure Data Explorer (Kusto)][3]. Node-RED is a flow-based development tool for visual programming, and it provides a browser-based editor that makes it easy to wire together flows. The flows are connected through nodes. This article describes how to send data directly from Node-RED to Azure Data Explorer using the new Node-RED to Kusto node.
* [Obfuscate strings in KQL queries][4]. This post does what it says "on the tin". It looks at obfuscating strings in KQL queries in **Azure Data Explorer** to avoid displaying sensitive information when someone is reviewing executed queries.

## Streaming

* [How Apache Kafka Works: An Introduction to Kafka's Internals][5]. You can be a decent developer without knowing/understanding the inner workings of your chosen technology(s). However, if you want to be great, it is a must to understand the underlying "plumbing". This post announces a Kafka Internals course by Jun Rao. Jun was one of the original developers of Kafka and is co-founder of Confluent - he knows what he is talking about. If you are interested in Kafka, I urge you to have a look at that course.
* [Presto® on Apache Kafka At Uber Scale][6]. This post looks at how Uber has connected Kafka and Presto together to enable a lightweight, interactive SQL query directly over Kafka via Presto at Uber scale.

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

[1]: https://azure.microsoft.com/en-gb/blog/feathr-linkedin-s-feature-store-is-now-available-on-azure/
[2]: https://towardsdatascience.com/data-mesh-observability-pattern-467438627572
[3]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/send-data-from-node-red-to-free-azure-data-explorer-kusto/ba-p/3282874
[4]: https://zimmergren.net/obfuscate-strings-in-kql-queries-adx/
[5]: https://www.confluent.io/blog/apache-kafka-architecture-and-internals-by-jun-rao/
[6]: https://eng.uber.com/presto-on-apache-kafka-at-uber-scale/
