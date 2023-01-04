---
type: post
layout: "post"
title: Interesting Stuff - Week 46, 2021
author: nielsb
date: 2021-11-14T08:50:09+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - machine learning
  - Azure Databricks
  - Azure Synapse
  - Azure Data Explorer
  - Kafka
  - Python
description: Kafka & cluster linking, Azure Data Explorer & Apache Spark, Chaos in Azure, and other interesting topics.
keywords:
  - machine learning
  - Azure Databricks
  - Azure Synapse
  - Azure Data Explorer
  - Kafka
  - Python   
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

This blog-post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Distributed Computing

* [Azure Chaos Studio][1]. At [Microsoft Ignite][2], a week or two ago, Microsoft announced the public preview of **Azure Chaos Studio**. Azure Chaos Studio is a fully-managed experimentation service to help customers track, measure, and mitigate faults with controlled chaos engineering to improve the resilience of their cloud applications. This looks very interesting, and we will definitely have a look at it.

## Azure Data Explorer

* [Long-term security log retention with Azure Data Explorer][3]. Having access to long-term security logs is essential. Querying long-term logs is critical for identifying the impact of threats and investigating illicit access attempts. This post outlines a solution for long-term retention of security logs where Azure Data Explorer is at the core of the architecture. 
* [Query past data with hot windows][4]. Azure Data Explorer has the notion of hot and cold data. Hot data is stored on SSD's on cluster nodes, whereas cold data is stored in Azure Blob Storage. Hot data offers the best query performance: an order of magnitude more performant than cold data. Sometimes you may want to query the hot data together with some of the cold. This post looks recently added functionality to Azure Data Explorer, creating a time window in the past which we want to be part of the hot data: Hot Window.  
* [Train your Model on Spark/Databricks, score it on ADX][5]. Recently, I have been doing conference talks around Azure Databricks and Apache Spark and Azure Data Explorer. How cool would it be if you could combine the two?! The post linked to does just that. It looks at training and creating Machine Learning models using Azure Databricks and Spark and then using those models from Azure Data Explorer. Very cool! Oh, BTW - with Azure Data Explorer Pool's being made available in Azure Synapse, you no longer need Azure Databricks. You can do the same thing with Azure Synapse Analytics. The [**Azure Synapse Analytics - Operationalize your Spark ML model into Data Explorer pool for scoring**][4] post looks at that.

## Streaming

* [Building Real-Time Hybrid Architectures with Cluster Linking and Confluent Platform 7.0][6]. Confluent recently released [**Confluent Platform 7.0**][7], and this post looks at one of the new features in detail, the ability to directly connect clusters and mirror topics from one cluster to another: [**Cluster Linking**][8]. This is something that we at [Derivco](/derivco) are really interested in.

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

[1]: https://azure.microsoft.com/en-us/services/chaos-studio/
[2]: https://myignite.microsoft.com/home
[3]: https://docs.microsoft.com/en-us/azure/architecture/example-scenario/security/security-log-retention-azure-data-explorer
[4]: https://techcommunity.microsoft.com/t5/azure-data-explorer/query-past-data-with-hot-windows/ba-p/2848114
[5]: https://techcommunity.microsoft.com/t5/azure-data-explorer/train-your-model-on-spark-databricks-score-it-on-adx/ba-p/2098522
[6]: https://www.confluent.io/blog/introducing-confluent-platform-7-0/
[7]: https://www.confluent.io/product/confluent-platform/
[8]: https://docs.confluent.io/platform/current/multi-dc-deployments/cluster-linking/index.html
