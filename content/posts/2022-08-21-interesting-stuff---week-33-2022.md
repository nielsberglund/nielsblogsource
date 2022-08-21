---
type: post
layout: "post"
title: Interesting Stuff - Week 33, 2022
author: nielsb
date: 2022-08-21T12:37:51+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Kafka
  - Azure Functions
description: Kafka triggers & Azure Functions, Kafka transactional workloads, awesome Azure Data Explorer performance, and other interesting topics!
keywords:
  - Azure Data Explorer
  - Kafka
  - Azure Functions   
---

![](/images/posts/benchmark.jpg)

**<p style="text-align: center;">Benchmark</p>**
**<p style="text-align: center;">Photo by <a href="https://unsplash.com/es/@manlyx?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Aliaksei Ramanouski</a> on <a href="https://unsplash.com/s/photos/benchmark?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a></p>**

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

## Azure Data Explorer

* [Azure Data Explorer: Log and telemetry analytics benchmark][1]. WOW - the numbers for **Azure Data Explorer** are pretty awesome! What I am talking about is this post that looks at benchmark numbers for **Azure Data Explorer**, Snowflake and Big Query. Since it is a Microsoft post, you'd expect that ADX would come out looking quite good - but this good?! 

## Streaming

* [Announcing GA launch of Kafka Trigger extension on Azure Functions][2]. The link here is from June; I am unsure if I have shared it before. Regardless, the post is worth sharing again, as it announces the release of Kafka triggers for Azure Serverless Functions. The Kafka trigger enables you to invoke functions in response to messages in Kafka topics and lets you write values/messages out to Kafka topics using an output binding. We have just started using it here at [Derivco](/derivco) in a very cool project where we consume and publish to topics in Confluent Cloud. 
* [Analytics vs. Transactions in Data Streaming with Apache Kafka][3]. When thinking of Kafka and data, one often sees Kafka used for analytical purposes of data. This post looks at using Kafka for transactional workloads in resilient, mission-critical architectures. 

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

[1]: https://azure.microsoft.com/en-us/blog/azure-data-explorer-log-and-telemetry-analytics-benchmark/
[2]: https://techcommunity.microsoft.com/t5/apps-on-azure-blog/announcing-ga-launch-of-kafka-trigger-extension-on-azure/ba-p/3499015
[3]: https://www.kai-waehner.de/blog/2022/03/09/analytics-vs-transactions-api-data-streaming-with-apache-kafka/
