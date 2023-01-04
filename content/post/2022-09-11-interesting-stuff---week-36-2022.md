---
type: post
layout: "post"
title: Interesting Stuff - Week 36, 2022
author: nielsb
date: 2022-09-11T08:14:11+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/deepmind.jpg"
categories:
  - roundup
tags:
  - machine learning
  - AI
  - Azure Data Explorer
  - Kafka
  - KStreams
description: Kafka KStreams & .NET, cool reinforcement learning, Kusto emulator, Niels at DPS 2022, and other interesting topics.
keywords:
  - machine learning
  - AI
  - Azure Data Explorer
  - Kafka
  - KStreams  
---

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

## Machine Learning / AI

* [A game-theoretic approach to provably correct and scalable offline RL][1]. This post looks at reinforcement learning (RL) and a way to design a systematic and provably correct way to create offline RL algorithms that can learn good policies with state-of-the-art empirical performance.

## Azure Data Explorer

* [Generally available: Kusto Emulator][2]. This is awesome! Microsoft has released a Docker image exposing the Kusto Query Engine endpoint in Azure Data Explorer. This means we can now create databases, and ingest and query data in a local environment!

## Streaming

* [IoT Real-Time Analytics — WAGO PLC with Databricks Auto Loader][3]. Databricks Auto Loader allows you to stream or incrementally ingest and transform files from a data lake. This post looks at a solution whereby IoT messages are sent to an Azure IoT hub and ingested in Azure Data Lake Storage (ADLS). From ADLS, the data is streamed into Azure Databricks Delta Tables using Databricks Auto Loader. Very interesting, this may be something for us at [Derivco](/derivco)!
* [Welcome to Streamiz.Kafka.Net][4]. If you have used Kafka, you are probably aware of KStreams, the library to create stream processing applications. You are also most likely aware that KStreams is Java/Scala only. That is about to change now with Streamiz, a .NET stream processing library for Kafka, i.e. similar to KStreams. It is in active development, and if you are into Kafka, stream processing and .NET, I urge you to look at it.

## WIND (What Is Niels Doing)

I am prepping for this:

{{< youtube KZbMtYmM-2o >}}

Yes, on September 22 at 12:30 UTC, I deliver the session **ksqlDB - The Real Time Streaming Database** at [**Data Platform Summit 2022**][5].

The conference is free; you register [here][6].

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

[1]: https://www.microsoft.com/en-us/research/blog/a-game-theoretic-approach-to-provably-correct-and-scalable-offline-rl/
[2]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/generally-available-kusto-emulator/ba-p/3616093
[3]: https://pub.towardsai.net/iot-real-time-analytics-wago-plc-with-databricks-auto-loader-4cd9d3c8de15
[4]: https://lgouellec.github.io/kafka-streams-dotnet/
[5]: https://dataplatformgeeks.com/dps2022/
[6]: https://dataplatformgeeks.com/dps2022/booking/

