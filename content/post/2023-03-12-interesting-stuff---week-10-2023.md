---
type: post
layout: "post"
title: Interesting Stuff - Week 10, 2023
author: nielsb
date: 2023-03-12T08:33:19+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-10-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-10-23.jpg"
categories:
  - roundup
tags:
  - streaming
  - Kafka
  - Flink
description: Streaming, streaming, and more streaming. We start with an excellent introduction to Flink, followed by a look at the potential consequences of Confluent's acquisition of Immerok. I finish off with a link to a post looking at the benefits of event streaming.
---

This week only streaming topics.

You see an excellent introduction to Apache Flink, followed by more Flink. In this case, it is related to Confluent's acquisition of Immerok and how this has the potential of "shaking" up the stream processing market. 

I finish off with a link to a post looking at the benefits of event streaming. Quite interesting!

<!--more-->

## Streaming

* [Apache Flink - A Solution for Real-Time Analytics][1]. This post provides an introduction to Apache Flink. It explains how Flink differs from batch processing frameworks and other stream processing systems and highlights its advantages, such as fault tolerance, low latency, and support for complex event processing. The post provides several examples of how Flink can be used for real-time analytics, such as fraud detection, predictive maintenance, and real-time recommendations.
* [The Stream Processing Shuffle][2]. This post discusses Confluent's acquisition of Immerok and how it has disrupted the real-time streaming market and put competitors in a position where they must reposition themselves to either take advantage or avoid irrelevancy. The post argues that Confluent must now reposition itself as an Apache Flink and Kafka company without losing its core Apache Kafka identity. The acquisition has also validated Flink as the definitive solution for stream processing, but Kafka and ksqlDB still have an advantage in real-time analytical use cases.
* [Real-Time or Real Value? Assessing the Benefits of Event Streaming][3]. The post discusses the benefits of using event streaming as a way to handle data in real-time. It starts by explaining what event streaming is and how it works, emphasizing that it's a way of processing data as a continuous stream of events rather than as discrete batches. The post also provides examples of industries already using event streaming, such as finance and transportation. It outlines the different use cases for event streaming, such as real-time analytics and fraud detection.

## WIND (What Is Niels Doing)

So in [last week's roundup][4], I mentioned I had hopes for having the next post in the [**Develop a Real-Time Leaderboard Using Kafka and Azure Data Explorer**][5] series out by the end of this week. As things are going right now, I doubt it will happen :frowning:. 

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

[1]: https://www.velotio.com/engineering-blog/apache-flink-a-solution-for-real-time-analytics
[2]: https://hubertdulay.substack.com/p/the-stream-processing-shuffle
[3]: https://www.confluent.io/blog/benefits-of-event-streaming/
[4]: {{< relref "2023-03-05-interesting-stuff---week-9-2023.md" >}}
[5]: {{< relref "2023-02-26-develop-a-real-time-leaderboard-using-kafka-and-azure-data-explorer---prelude.md" >}}
