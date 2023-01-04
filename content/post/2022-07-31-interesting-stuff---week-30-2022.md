---
type: post
layout: "post"
title: Interesting Stuff - Week 30, 2022
author: nielsb
date: 2022-07-31T08:02:01+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/chess-2.jpg"
categories:
  - roundup
tags:
  - big data
  - Databricks
  - Snowflake
  - Azure Data Explorer
  - Kafka
description: Kafka & Data Mesh, CI/CD with Kafka, Azure Data Explorer book, Databricks vs. Snowflake, and other interesting topics.
keywords:
  - big data
  - Databricks
  - Snowflake
  - Azure Data Explorer
  - Kafka   
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

## Data Architecture

* [Data chess game: Databricks vs. Snowflake, part 1][1]. There is no doubt that Snowflake and Databricks compete in becoming the leading cloud data platform vendor. This post looks at these two vendors from different backgrounds (data lake and warehousing) and how they are now "duking" it out in the lakehouse.
* [Recap of Databricks Lakehouse Platform Announcements at Data and AI Summit 2022][2]. The linked post summarises the major Databricks Lakehouse Platform innovations and contributions to open source and data and AI projects announced at the Data and AI Summit 2022.

## Azure Data Explorer

* [Scalable Data Analytics with Azure Data Explorer: Modern ways to query, analyze, and perform real-time data analysis on large volumes of data][3]. A while ago, I was asked to do an editorial review of a book about **Azure data Explorer**. Well, the link here is to that book. If you are into ADX, then this book is a must-read.

## Streaming

* [4 Must-Have Tests for Your Apache Kafka CI/CD with GitHub Actions][4]. This post looks at applying GitOps principles to the development lifecycle of a Kafka client application using GitHub Actions: for testing locally and in Confluent Cloud, with and without Schema Registry, and for schema evolution. 
* [The Heart of the Data Mesh Beats Real-Time with Apache Kafka][5]. We all have heard about the "data mesh" by now. A requirement of the data mesh infrastructure is that it is real-time, reliable, and scalable. This post explores how Apache Kafka, as an open and scalable decentralized real-time platform, can be the basis of a data mesh infrastructure and – complemented by many other data platforms like a data warehouse, data lake, and lakehouse – solve real business problems.

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

[1]: https://venturebeat.com/2022/07/25/data-chess-game-databricks-vs-snowflake-part-1/
[2]: https://databricks.com/blog/2022/07/25/recap-of-databricks-lakehouse-platform-announcements-at-data-and-ai-summit-2022.htm
[3]: https://www.amazon.com/Scalable-Data-Analytics-Azure-Explorer/dp/1801078548
[4]: https://www.confluent.io/blog/apache-kafka-ci-cd-with-github/
[5]: https://www.kai-waehner.de/blog/2022/07/28/the-heart-of-the-data-mesh-beats-real-time-with-apache-kafka/
