---
type: post
layout: "post"
title: Interesting Stuff - Week 32, 2022
author: nielsb
date: 2022-08-14T09:09:45+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/streaming.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Kafka
  - ksqlDB
  - SynapseML
description: Kafka & ksqlDB stream processing, Azure Data Explorer & Kafka, SynapseML & .NET, and other interesting topics.
keywords:
  - Azure Data Explorer
  - Kafka
  - ksqlDB
  - SynapseML   
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

* [Ingesting Protobuf data from Kafka to Azure Data Explorer][1]. As you know, I really like **Azure Data Explorer** and Kafka, and I have written a couple of posts about ADX and Kafka [here][2] and [here][3]. In my posts, the data I ingested was JSON. This post looks at how to ingest Protobuf data from Kafka into ADX. Very cool!

## Data architecture

* [Low-latency Streaming Data Pipelines with Delta Live Tables and Apache Kafka][4]. Another Kafka-related post (you'd almost think Kafka is popular). This post looks at building a fully managed low-latency data pipeline to ingest, cleanse, transform and improve the quality of streaming data from Apache Kafka with Delta Live Tables. We at [Derivco](/derivco) are very interested in this!

## Data Science / AI / ML

* [Artificial Intelligence for Beginners - A Curriculum][5]. The link is to a GitHub repository containing an AI course for beginners, which was put together by Microsoft. It is free and consists of a 12-week, 24-lesson curriculum. This course introduces learners to a variety of AI concepts. It looks very, very interesting. At [Derivco](/derivco), we see AI/ML as the future, and our AI/ML champion [Nadia][6] is looking at what we can do to incorporate this curriculum with what we are doing.
* [Announcing SynapseML for .NET – Large Scale ML with a Simple API][7]. SynapseML (the artist formerly known as MMLSpark) has been around for a while and is an open-source library to simplify the creation of scalable machine learning pipelines. Recently SynapseML v0.10 was released, and part of that release was a new set of .NET APIs. This post looks at those APIs and how you can build scalable and intelligent systems for solving challenges using these new APIs. Very, very interesting!

## Streaming

* [Getting Started with Stream Processing: The Ultimate Guide][8]. Regardless of your business, the ability to react in real-time has become increasingly important. We rely on streaming data to handle real-time data, and stream processing is critical to building real-time applications. This post looks at how ksqlDB can help your business create the types of applications that deliver rich, real-time customer experiences.
* [Serverless Stream Processing with Apache Kafka, Azure Functions, and ksqlDB][9]. We're continuing with the stream processing theme from above. This post looks at serverless stream processing. More specifically, serverless in Microsoft Azure. The post builds an application that integrates ksqlDB and Azure Functions, using the best functions of each to really lean into the strengths of both.

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

[1]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/ingesting-protobuf-data-from-kafka-to-azure-data-explorer/ba-p/3595793
[2]: {{< relref "2021-09-06-run-self-managed-kafka-connector-in-serverless-azure-container-instance.md" >}}
[3]: {{< relref "2021-10-27-how-to-ingest-into-azure-data-explorer-from-apache-kafka-using-kafka-connect.md" >}}
[4]: https://www.databricks.com/blog/2022/08/09/low-latency-streaming-data-pipelines-with-delta-live-tables-and-apache-kafka.html
[5]: https://github.com/microsoft/ai-for-beginners
[6]: https://www.linkedin.com/in/nadia-fick-b533478/
[7]: https://devblogs.microsoft.com/dotnet/announcing-synapseml-for-dotnet/
[8]: https://www.confluent.io/blog/stream-processing-ultimate-guide/
[9]: https://www.confluent.io/blog/serverless-stream-processing-with-apache-kafka-and-azure/
