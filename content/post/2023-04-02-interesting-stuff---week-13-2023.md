---
type: post
layout: "post"
title: Interesting Stuff - Week 13, 2023
author: nielsb
date: 2023-04-02T14:30:42+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-13-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-13-23.jpg"
categories:
  - roundup
tags:
  - data science
  - Python
  - Polars
  - Azure Data Explorer
  - Kafka
description: "This week: be cool, read about Polar vs Pandas. How to ingest data into ADX. On the streaming side really interesting about how to do Canary releases for streaming platforms. Also something extremely interesting: Machine Learning and Data Streaming!"
---

Some interesting stuff this week: a "cool" post about Polar bears vs Pandas, no doubt who'll win. Read about how to ingest data into **Azure Data Explorer** - very interesting. On the streaming side really interesting about how to do Canary releases for streaming platforms. Also something extremely interesting: Machine Learning and Data Streaming! Have fun!!

<!--more-->

## AI/ML

* [The 3 Reasons Why I Have Permanently Switched From Pandas To Polars][1]. In this post, the author shares their experience of switching from the Python library Pandas to the newer and faster Rust-based library called Polars for data manipulation and analysis. The author outlines three main reasons for the switch: the performance benefits of Polars, better memory management capabilities, and more modern and concise syntax. The author also provides some code examples and benchmarks to demonstrate the superiority of Polars over Pandas in certain use cases.

## Azure Data Explorer

* [Programmatically ingest data into Azure Data Explorer][2]. Since, as you probably know by now :smile:, I am "fond" of Azure Data Explorer, this post was very interesting. In the post, the author discusses how to programmatically ingest data into Azure Data Explorer (ADX). The author explains the ADX data model and how data can be stored in tables and databases. The post includes code examples and step-by-step instructions on setting up the necessary environment and configurations for the script to work. The author also provides tips and best practices for data ingestion into ADX. 

## Streaming

* [Canary release with Kafka][3]. The author discusses implementing a canary release strategy for data streaming in this blog post. The author describes how to set up a canary release pipeline using Kafka by creating two separate Kafka topics for the canary and production environments and routing a portion of the traffic to the canary topic. Very interesting!
* [Uniting the Machine Learning and Data Streaming Ecosystems - Part 1][4]. The author discusses integrating machine learning (ML) and real-time data streaming using Apache Kafka and its ecosystem in this post. The post first outlines the benefits of combining ML with streaming data, such as improved prediction accuracy and real-time decision-making capabilities. The author then describes how Kafka can be a central platform for collecting, processing and delivering streaming data to ML models using the Kafka Connect framework and the KSQL streaming SQL engine. This post is extremely interesting for us at [Derivco](/derivco) right now! 

## WIND (What Is Niels Doing)

Earlier today, I finished the third post in the **Develop a Real-Time Leaderboard Using Kafka and Azure Data Explorer** series. It is not published yet; I need to give it a "once-over". Expect the post to be published in a couple of days.

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

[1]: https://benfeifke.com/posts/the-3-reasons-why-i-switched-from-pandas-to-polars-20230328/
[2]: https://sandervandevelde.wordpress.com/2023/03/23/programmatically-ingest-data-into-azure-data-explorer/
[3]: https://dev.to/bleporini/canary-release-with-kafka-1h89
[4]: https://www.confluent.io/blog/uniting-machine-learning-data-streaming-1/
