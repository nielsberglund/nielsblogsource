---
type: post
layout: "post"
title: Interesting Stuff - Week 17, 2023
author: nielsb
date: 2023-04-30T15:58:01+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-17-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-17-23.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - data science
  - Databricks
  - real-time analytics
description: The man that beat roulette, hooking up Azure Data Explorer and Kafka, real-time machine learning pipelines. Spark loader for Hugging Face datasets, processing data from multiple streaming platforms using Delta Live Tables and the real-time streaming ecosystem.
---

This week: beating roulette, hooking up Azure Data Explorer and Kafka. Real-time machine learning pipelines.  

Spark loader for Hugging Face datasets, processing data from multiple streaming platforms using Delta Live Tables and the real-time streaming ecosystem. 

<!--more-->

## Misc.

* [THE GAMBLER WHO BEAT ROULETTE][2]. OK, this is not online gambling, but the story is fascinating. How a guy figured out how to beat roulette without any computers or anything. Well worth a read.

## Azure Data Explorer

* [Stream Data from Kafka to Azure Data Explorer][1]. As you know, I am a big fan of Apache Kafka and **Azure Data Explorer** (ADX). I have written several blog posts about these two technologies, and I have a section about setting up Kafka and ADX in each post. I thought it would be beneficial to summarise the details, and the repo linked to and its `README.md` file is that summary. 

## AI/ML

* [Real Time ML Pipelines Using Quix with Tomáš Neubauer][3]. This is an [InfoQ][iq] podcast where Tomáš Neubauer talks about Quix Streams, an open-source Python library that simplifies real-time machine learning pipelines. Tomáš will discuss various architectural designs, their pros and cons, and some actual use cases. Very interesting!
* [Databricks ❤️ Hugging Face][4]. This is a blog post from Databricks about how they have contributed a Spark loader for Hugging Face datasets. Hugging Face is a company with a large dataset collection for NLP. The datasets are available in various formats, including CSV, JSON, and Parquet. The blog post shows how to use the Spark loader to load the datasets into Spark DataFrames.

## Streaming

* [Processing data simultaneously from multiple streaming platforms using Delta Live Tables][5]. This is a blog post from Databricks about using Delta Live Tables to process data from multiple streaming platforms. The blog post shows how to use Delta Live Tables to process data from Kafka, Azure Event Hubs, and Azure IoT Hub. The blog post also shows how to use Delta Live Tables to process data from multiple streaming platforms simultaneously.
* [Real-Time Streaming Ecosystem Part 1][6]. This post is number one in a series about the real-time streaming ecosystem. In this post, the author has compiled all the open source and vendor real-time solutions into an end-to-end real-time analytical use case. The post is very interesting, and I look forward to the series's next posts.

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

[1]: https://github.com/nielsberglund/stream-kafka-adx
[2]: https://www.bloomberg.com/features/2023-how-to-beat-roulette-gambler-figures-it-out/
[3]: https://www.infoq.com/podcasts/quix-real-time-ml-pipelines/
[4]: https://www.databricks.com/blog/contributing-spark-loader-for-hugging-face-datasets
[5]: https://www.databricks.com/blog/processing-data-simultaneously-multiple-streaming-platforms-using-delta-live-tables
[6]: https://hubertdulay.substack.com/p/real-time-streaming-ecosystem-part
