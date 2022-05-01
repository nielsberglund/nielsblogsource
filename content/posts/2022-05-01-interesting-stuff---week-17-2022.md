---
type: post
layout: "post"
title: Interesting Stuff - Week 17, 2022
author: nielsb
date: 2022-05-01T08:35:51+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Azure Data Explorer
  - ksqlDB
  - Apache Flink
  - Python
description: Kafka & clickstream analysis in ksqlDB, F1 telemetry & Azure Data Explorer, IoT & Azure Data Explorer, and other interesting topics!
keywords:
  - Azure Data Explorer
  - ksqlDB
  - Apache Flink
  - Python   
---
![](/images/posts/f1.jpg)
**F1** *Photo by [gustavo Campos][6] on [Unsplash][7]*

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

## Event Driven Architecture

* [Event-based Architectures: The Hard Parts][1]. This is an [InfoQ][iq] panel discussion where the panellists discuss the real hard parts of event-driven systems. Very interesting!

## Azure Data Explorer

* [F1 telemetry analysis with Azure Data Explorer (ADX)][2]. You who follow my blog know that I like **Azure Data Explorer** and what one can do with it. However, you may not know that I am also quite interested in Formula 1 (F1). So seeing the title of the linked post certainly got my interest! The post looks at how you can emulate F1 telemetry using XBox, and ingest sensor events into Azure Data Explorer for further analysis. I found it very, very cool! Now, maybe I need to get an XBox!
* [Use Azure Data Explorer to Simplify the Industrial IoT Data Journey][3]. **Azure Data Explorer** is the perfect tool to analyze IoT data. It is also well equipped for processing data pre-ingestion using its *update policy* functionality. This post looks at exactly that: ingesting IoT data into a staging table and then processing the data for ingestion into the final table(s).

## Streaming

* [Building a Credit Card Fraud Detection Online Training Pipeline with River ML and Apache Flink][4]. This post looks at writing real-time Python and Apache Flink applications to train and use Machine Learning models.
* [Real-Time Clickstream Analysis using KsqlDB][5]. As the title implies, this post looks at performing click-stream analysis using ksqlDB.

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

[1]: https://www.infoq.com/presentations/event-driven-arch-challenges/
[2]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/f1-telemetry-analysis-with-azure-data-explorer-adx/ba-p/3283911
[3]: https://techcommunity.microsoft.com/t5/internet-of-things-blog/use-azure-data-explorer-to-simplify-the-industrial-iot-data/ba-p/3292116
[4]: https://towardsdatascience.com/building-a-credit-card-fraud-detection-online-training-pipeline-with-river-ml-and-apache-flink-25549b89583d
[5]: https://medium.com/@datacouch/real-time-clickstream-analysis-using-ksqldb-ccd7f8a65bea
[6]: https://unsplash.com/@gustavocpo
[7]: https://unsplash.com/
