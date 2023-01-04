---
type: post
layout: "post"
title: Interesting Stuff - Week 35, 2021
author: nielsb
date: 2021-08-29T13:37:54+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - kafka
  - ksqldb
  - Azure Data Explorer
  - big data
description: Kafka, ksqlDB internals, Data Platform Summit 2021, time series in ADX, and other interesting topics!
keywords:
  - kafka
  - ksqldb
  - Azure Data Explorer
  - big data   
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

## Big Data / Machine Learning

* [Churn Prediction With BigQueryML to Increase Mobile Game Revenue][1]. Seeing what we do at [Derivco](/derivco), this post is exciting. The post looks at how machine learning can identify high-value mobile game players dangerously close to churning. Very interesting!

## Data Architecture

* [Five Predictions for the Future of the Modern Data Stack][2]. This post looks at the developments of the modern data stack and the bright side of "Modern Data Stack V2", focusing on AI, Data Sharing, Data Governance, Streaming & Application Serving.

## Azure Data Explorer

* [Timeseries Analytics Capabilities, and Azure Data Explorer (ADX)][3]. I guess that for you who read my blog, it doesn't come as a surprise that I have a thing for Azure Data Explorer. The post here looks at time-series analytics and explores the types of core functionality typical for time-series data processing applications. It further looks at how functionality built into ADX aligns exceptionally well to meet these challenges head-on.

## Streaming

* [Real-time anomaly detection with Apache Kafka and Python][4]. In this post, the author looks at making real-time anomaly predictions over streaming data coming from Kafka using Python.
* [How ksqlDB Works: Internal Architecture and Advanced Features][5]. To effectively use ksqlDB, you should, apart from being familiar with its features and syntax, also have an understanding of what's happening "under the cover" of ksqlDB. This post covers some of the "under the cover" topics as well as points to resources at [Confluent Developer][6].

## WIND (What Is Niels Doing)

By now, you probably know that I:

![](/images/posts/Neils_Berglund_Breakout_Session.jpg)

**Figure 1:** *Breakout Session*

Yes, as we see in *Figure 1* I am presenting at the [**2021 Data Platform Summit**][12]:

* [**How to do Real-Time Analytics Using Apache Kafka and Azure Data Explorer**][7]. We are looking at how to stream events from Apache Kafka to Azure Data Explorer and perform user-facing analytics in near real-time.

I mentioned in a previous roundup how the organizers have managed to increase the capacity of the virtual platform to 10,000! So, they have opened up **FREE** booking for **LIVE** attendance for a limited time. They have an internal quota, and once that is full, the free booking will close.  So, what are you waiting for? Hurry up to [**register for FREE**][8]!

Oh, I am not only doing the conference session above, but also a post-conference training class; 4 hours per day over 2 days:

* [**Big Data & Analytics with SQL Server 2019 Big Data Cluster**][9].

There are still a couple of seats (virtual) available for my class, so - if you are interested - register [here][9].

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

[1]: https://rudderstack.com/blog/churn-prediction-with-bigqueryml
[2]: https://medium.com/@jordan_volz/five-predictions-for-the-future-of-the-modern-data-stack-435b4e911413
[3]: https://mrfoxsql.wordpress.com/2021/08/25/timeseries-analytics-capabilities-and-azure-data-explorer-adx/
[4]: https://towardsdatascience.com/real-time-anomaly-detection-with-apache-kafka-and-python-3a40281c01c9
[5]: https://www.confluent.io/blog/ksqldb-architecture-and-advanced-features/
[6]: https://developer.confluent.io/learn-kafka/inside-ksqldb/streaming-architecture/
[7]: https://dataplatformgeeks.com/dps2021/sessions-agenda-schedule/
[8]: https://dataplatformgeeks.com/dps2021/complimentary-registration
[9]: https://dataplatformgeeks.com/dps2021/product/big-data-analytics-with-sql-server-2019-big-data-cluster-by-niels-berglund/
[12]: https://dataplatformgeeks.com/dps2021/
