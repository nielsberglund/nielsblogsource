---
type: post
layout: "post"
title: Interesting Stuff - Week 42, 2021
author: nielsb
date: 2021-10-17T08:52:05+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Databricks
  - Apache Spark
  - Kafka
  - ksqlDB
  - machine learning
  - R
description: Kafka connectors, kafka & machine learning, ingestion into Azure Data Explorer, and other interesting topics!
keywords:
  - Azure Data Explorer
  - Databricks
  - Apache Spark
  - Kafka
  - ksqlDB
  - machine learning
  - R  
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

## Azure Data Explorer

* [Azure Data Explorer Shorts: Managed Ingestion][1]. An excellent short (~9 minutes) video explaining the ins and outs of data ingestion into **Azure Data Explorer**.

## Streaming

* [Apache Kafka and R: Real-Time Prediction and Model (Re)training][2]. This blog post looks at how KStreams, ksqlDB, and R can be used to create a data pipeline in which a machine learning model is applied to streaming data. The post also looks at how the model can be automatically retrained once the prediction results exceed a certain threshold. Very Cool!
* [Native Support of Session Window in Spark Structured Streaming][3]. The post linked to, looks at a new window type in the upcoming Apache Spark 3.2 version. Before Spark 3.2, Spark supported tumbling and sliding windows. In the 3.2 version, the session window is introduced. The interesting thing with a session window is that it has a dynamic size of window length depending on the input.
* [Introducing Single Message Transforms and New Connector Features on Confluent Cloud][4]. Part of Confluent cloud is managed Kafka Connect connectors, and this post announces new features for most of the managed connectors. I am quite "chuffed" about seeing Single Message Transforms as one such new feature.

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

[1]: https://youtu.be/52dPYC1V5a0
[2]: https://www.confluent.io/blog/how-baader-built-a-predictive-analytics-machine-learning-system-with-kafka-and-rstudio/
[3]: https://databricks.com/blog/2021/10/12/native-support-of-session-window-in-spark-structured-streaming.html
[4]: https://www.confluent.io/blog/new-confluent-cloud-connector-features-and-single-message-transforms/
