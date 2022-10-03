---
type: post
layout: "post"
title: Interesting Stuff - Week 39, 2022
author: nielsb
date: 2022-10-02T09:24:03+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - Azure Data Explorer
  - kafka
description: Kafka & Terraform, distributed system architecture, Protobuf - Kafka & Azure Data Explorer, and other interesting topics.
keywords:
  - distributed computing
  - Azure Data Explorer
  - kafka   
---

![](/images/posts/terraform.jpg)

**<p style="text-align: center;"><em>Terra</em></p>**
**<p style="text-align: center;"><em>Credit:<a href="https://www.istockphoto.com/portfolio/3000ad"> 300ad</a></em></p>**

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

## Distributed Systems

* [An overview of distributed systems architectures][1]. This post is the second in a series on system design. I found this post really useful as an introduction. Very good! Also, look at the links at the right of the post - some excellent "stuff" in there!

## Azure Data Explorer

* [Ingesting Protobuf data from Kafka to Azure Data Explorer][2]. So, we all know about Protocol buffers (Protobuf) and how it is a language and platform-neutral extensible mechanism for serializing and deserializing structured data. The Protobuf protocol is becoming increasingly popular in the IoT world, especially since Apache Kafka supports Protobuf. In the IoT world, we also see **Azure Data Explorer** being popular as the choice for data processing and analytics. To ingest data from Kafka into Azure Data Explorer, we use the ADX Kafka sink connector. This post looks at how to set up and configure the ADX Kafka sink connector for ingesting Protobuf serialized data.

## Streaming

* [Comparing Stateful Stream Processing and Streaming Databases][3]. When you build an event-driven stream processing system, the question is whether you should use a stateful stream processor or a streaming database. This post aims to clarify stream processing vs streaming database. After reading the post, you should know how these technologies work internally, their differences, and when to use them.
* [Getting Started with the Confluent Terraform Provider][4]. Terraform is an open-source infrastructure-as-code tool that lets you build, change, and version your cloud or on-prem data infrastructure safely and efficiently. Back in July, Confluent announced support for a Terraform provider for Confluent Cloud. This post takes a closer look at what the provider supports and how to use it. 
* [Exploring Popular Open-source Stream Processing Technologies: Part 1 of 2][5]. This post is part 1 of a two-part series demonstrating stream processing using: Apache Spark Structured Streaming, Apache Kafka Streams, Apache Flink, and Apache Pinot with Apache Superset! The post is awesome! Part of what makes it extraordinary is the accompanying [**Streaming Synthetic Sales Data Generator**][6], a Python project for generating synthetic data. I have forked the project and will use it whenever I need to generate streaming data.

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

[1]: https://learncsdesigns.medium.com/an-overview-of-distributed-systems-architectures-4719692f8558
[2]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/ingesting-protobuf-data-from-kafka-to-azure-data-explorer/ba-p/3595793
[3]: https://medium.com/event-driven-utopia/comparing-stateful-stream-processing-and-streaming-databases-c8c670f3f4bb
[4]: https://www.confluent.io/blog/confluent-terraform-provider-intro/
[5]: https://itnext.io/exploring-popular-open-source-stream-processing-technologies-part-1-of-2-31069337ba0e
[6]: https://github.com/garystafford/streaming-sales-generator
