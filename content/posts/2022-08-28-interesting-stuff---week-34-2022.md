---
type: post
layout: "post"
title: Interesting Stuff - Week 34, 2022
author: nielsb
date: 2022-08-28T10:41:25+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Azure Data Explorer
  - AWS S3
  - data pipelines
  - Kafka
  - machinelearning
description: Kafka & streaming ML, declarative data pipelines, ingest data into Azure Data Explorer from Amazon S3, and other interesting topics.
keywords:
  - Azure Data Explorer
  - AWS S3
  - data pipelines
  - Kafka
  - machinelearning   
---

![](/images/posts/streaming-particles.jpg)

**<p style="text-align: center;"><em>Photo Credit: <a href="https://www.istockphoto.com/portfolio/KBDS">KBDS</a> on <a href="https://www.istockphoto.com/">iStock</a></em></p>**

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

* [Azure Data Explorer supports native ingestion from Amazon S3][1]. The title of this post says it all. The post announces a new feature of **Azure Data Explorer**, the ability to ingest into ADX from Amazon S3.

## Data Architecture

* [Automating data pipelines: How Upsolver aims to reduce complexity][2]. Today, when you create a data pipeline, you most likely code the pipeline and its intricacies manually. The post linked to looks at, instead of coding data pipelines manually, how you can do it in a declarative way, handling transformations etc.

## Streaming

* [Streaming-First Infrastructure for Real-Time Machine Learning][3]. This article covers the benefits of streaming-first infrastructure for two scenarios of real-time ML. First is online prediction, where a model can receive a request and make predictions as soon as the request arrives. The second is continual learning when machine learning models can adapt to changes in production data distributions. Very, very cool! We have just now started looking at it at [Derivco](/derivco).
* [Machine Learning Streaming with Kafka, Debezium, and BentoML][4]. This post looks at using modern data-related tools to integrate a Machine Learning model with a "production" database. This is so we can make real-time predictions as new records are added.

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

[1]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/azure-data-explorer-supports-native-ingestion-from-amazon-s3/ba-p/3606746
[2]: https://venturebeat.com/data-infrastructure/upsolver-simplifies-data-pipelines
[3]: https://www.infoq.com/articles/streaming-first-real-time-ml
[4]: https://towardsdatascience.com/machine-learning-streaming-with-kafka-debezium-and-bentoml-c5f3996afe8f
