---
type: post
layout: "post"
title: Interesting Stuff - Week 28, 2022
author: nielsb
date: 2022-07-17T12:50:50+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/risk-management.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Kafka
  - Databricks
description: Kafka & Confluent Stream Catalog, Databricks & Kafka to handle risk management, Azure Data Explorer workshop videos, and other interesting topics.
keywords:
  - Azure Data Explorer
  - Kafka
  - Databricks   
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

## Azure Data Explorer

* [Continuous export for Azure Application Insights using Azure Data Explorer (Kusto)][1]. If you "live in Azure-land", you probably use Application Insights to collect data for analysis. The analysis in App Insight is based on the Kusto engine but does not have all bells and whistles. To do more advanced analytics of your App Insights data, you should export your data to **Azure Data Explorer** (ADX). This post discusses a pattern for continuously streaming data from Application Insights data to ADX.
* [Usage examples for Azure Data Explorer connector to Power Automate][2]. I love **Azure Data Explorer** (heh- who would have thunk), but there is some "stuff" that frustrates me. Among them is that it is hard (neigh impossible) to do things based on scheduled tasks, triggers, etc. Well, neigh impossible until you read this Microsoft doc. This document looks at how to "hook up" [Microsoft Power Automate][3] to ADX, and it also includes several typical Power Automate connector usage examples. Very cool!
* [Azure Data Explorer L300 Workshop][4]. A couple of weeks ago, the Azure Data Explorer PM (Program Manager) team held a workshop spread over three days (around 2 - 3 hours per day). The workshop covered **a lot**, and the good thing was that it was recorded. The link here is to the YouTube playlist of the workshop. If you are interested in ADX, you **must** have a look!

## Streaming

* [Using Spark Structured Streaming to Scale Your Analytics][5]. This post looks at how a Databricks customer leverages Structured Streaming and the Databricks Lakehouse Platform to scale its analytics and keep its data products up to date.
* [How to Find, Share, and Understand Your Data Streams with Stream Catalog][6]. If you want to get the most out of your data, it is vital to be able to discover, understand, organize and reuse your data. These requirements have led to the notion of a data catalogue. The post linked to looks at the Confluent Stream Catalog, what it is and what you can do with it.
* [ML Prediction on Streaming Data Using Kafka Streams][7]. This post looks at how you can boost the performance of your Python-trained ML models by serving them over a Kafka streaming platform in a Scala application.
* [How streaming data and a lakehouse paradigm can help manage risk in volatile trading markets][8]. In financial markets, managing risk is a must. It is the key to success if you can do it well. The post linked to, looks at how you can ingest and process large amounts of raw data to compute real-time portfolio valuations, risk metrics, and more using integrated technology from Confluent and Databricks. Very interesting!

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

[1]: https://whitepages.tygraph.com/2022/07/continuous-export-for-azure-application-insights-using-azure-data-explorer-kusto/
[2]: https://docs.microsoft.com/en-us/azure/data-explorer/flow-usage
[3]: https://powerautomate.microsoft.com/
[4]: https://www.youtube.com/playlist?list=PLwyttaal5U3r9jnHSaGT75sRqSfNDrX11
[5]: https://databricks.com/blog/2022/07/14/using-spark-structured-streaming-to-scale-your-analytics.html
[6]: https://www.confluent.io/blog/share-find-understand-data-streams-stream-catalog/
[7]: https://towardsdatascience.com/ml-prediction-on-streaming-data-using-kafka-streams-1e4ebd21008
[8]: https://www.confluent.io/blog/risk-management-with-confluent-databricks-data-streaming-analytics/
