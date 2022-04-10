---
type: post
layout: "post"
title: Interesting Stuff - Week 14, 2022
author: nielsb
date: 2022-04-10T12:49:21+01:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - Azure Data Explorer
  - Kafka
  - Confluent Cloud
  - Azure Synapse
description: Kafka & gaming apps, ingest data into Azure Synapse from Confluent Cloud, and other interesting topics!
keywords:
  - data science
  - Azure Data Explorer
  - Kafka
  - Confluent Cloud
  - Azure Synapse   
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

## Machine Learning

* [6 Time Series Predictive Tasks You Should Know About][1]. Recently I have gotten interested in Time Series analysis because of the Time Series capabilities in **Azure Data Explorer** and **KQL** (Kusto Query Language). Therefore this post comes at an opportune time as it describes predictive tasks that can be put together with time-series data sets.

## Big Data

* [Announcing General Availability of Databricks' Delta Live Tables (DLT)][2]. This post talks about the launch of Databricks' Delta Live Tables and how it simplifies streaming and batch ETL for data, analytics and AI applications.

## Streaming

* [Building a Dependable Real-Time Betting App with Confluent Cloud and Ably][3]. As you probably know by now, I work for [**Derivco**](/derivco), and at Derivco, we develop software for online gaming. That's why this post is so interesting, as it looks at how to build a dependable real-time betting experience by combining the power of Confluent Cloud with the capabilities of the [Ably][4] edge messaging platform.
* [Migrating Data to Azure Synapse with Confluent's Fully Managed Connector to Unlock Real-Time Advanced Analytics][5]. This is another really interesting post for us at Derivco, as we are underway to implement an enterprise data lake using Azure. As part of the data lake, we are looking at Azure Synapse. So, reading this post about how Confluent integrates with Azure Synapse and enables real-time data processing and advanced analytics in Azure is very cool!

## ~ Finally

That's all for this week. I hope you enjoy what I put together. Please comment on this post or [ping][ma] me if you have ideas for what to cover.

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

[1]: https://towardsdatascience.com/6-time-series-predictive-tasks-you-should-know-about-b899fb83b6bf
[2]: https://databricks.com/blog/2022/04/05/announcing-generally-availability-of-databricks-delta-live-tables-dlt.html
[3]: https://www.confluent.io/blog/real-time-betting-platform-with-confluent-cloud-and-ably/
[4]: https://ably.com/
[5]: https://www.confluent.io/blog/real-time-data-integration-analytics-confluent-azure-synapse-connector/
