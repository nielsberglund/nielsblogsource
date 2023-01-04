---
layout: post
title: Interesting Stuff - Week 32
author: nielsb
date: 2018-08-12T12:02:02+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - flink
  - Azure Cosmos DB
  - Databricks
description: Kafka, Flink, Databricks, use Kafka to server ML models, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - flink
  - Azure Cosmos DB
  - Databricks   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending.

<!--more-->

## Distributed Computing

* [The many faces of consistency][1]. A blog post by [Murat][murba] where he dissects a white paper about consistency. The paper talks about two types of consistency: *state* and *operation*. Seeing that Murat now does sabbatical work at Microsoft (see below), he compares the two consistency types with what Cosmos DB provides. The post is a must read if you are the least interested in distributed computing and consistency.

## Cloud / Big Data

* [Globally replicated data lakes with LiveData using WANdisco on Azure][3]. The post discusses how you can achieve globally replicated Azure Data Lakes. The replication can be both hybrid: on-prem to Azure as well as Azure to Azure.
* [Cloud data and AI services training roundup August 2018][4]. This post lists some free data and AI training sessions.
* [Azure Cosmos DB][5]. This post by [Murat][murba] is about his first impressions of Azure Cosmos DB. Murat has taken a sabbatical and spends a year at Microsoft in the Cosmos DB team. I look forward to more posts by Murat about Cosmos DB, and other Azure related topics.

## Misc.

* [HowTo - Docker on Windows][6]. My mate and colleague, [Charl][charl] continues his blogging journey. This post is how to run Docker on Windows.

## Streaming

* [Streaming Data Dominates: Over 2000 Developers Say “Only Batch” Is Almost Extinct][7]. A survey by [Lightbend][8], (formerly known as [Typesafe][9]), makes it clear that developers now moves more and more towards real-time processing as opposed to batch. That, my friends, is music to my ears!
* [Apache Flink 1.6.0: What’s new in the latest Apache Flink release][10]. What the title says; this is a post detailing some of the new features in the Flink 1.6.0 release.
* [Getting Started with Apache Kafka and Kubernetes][11]. A blog-post about the work done to enable Kafka to run on Kubernetes. The post points to a white paper: [Run Confluent Platform on Kubernetes Using Best Practices][12] which is really good!
* [Kafka Streams in Action][13]. A post about the upcoming book: [Kafka Streams in Action][14]. Apart from announcing the book, the post also contains the foreword to the book. This book is a must if you are interested in Kafka Streams!
* [Building a Real-Time Attribution Pipeline with Databricks Delta][15]. this blog post looks at how to use the Databricks DataFrame API to build Structured Streaming applications and use Databricks Delta to query the streams in near-real-time.

## Data Science / AI

* [Model Serving: Stream Processing vs. RPC/REST With Java, gRPC, Apache Kafka, TensorFlow][16]. A short and sweet blog-post comparing stream processing applications with a model serving infrastructure, like **TensorFlow Serving**, for serving machine learning models.
* [IEEE Language Rankings 2018][17]. A post by [David][revod] about the latest IEEE Spectrum language rankings.
* [Scalable IoT ML Platform with Apache Kafka + Deep Learning + MQTT][18]. This post describes a hybrid machine learning infrastructure leveraging Apache Kafka as a scalable central nervous system. Very interesting!

## SQL Server Machine Learning Services

I have started on the third post in the [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) series. I hope to be able to publish it in a week or so.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

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

[1]: http://muratbuffalo.blogspot.com/2018/08/the-many-faces-of-consistency.html
[2]: https://www.wandisco.com/
[3]: https://azure.microsoft.com/en-us/blog/globally-replicated-data-lakes-with-livedata-using-wandisco-on-azure/
[4]: https://cloudblogs.microsoft.com/sqlserver/2018/08/09/cloud-data-and-ai-services-training-roundup-august-2018/
[5]: http://muratbuffalo.blogspot.com/2018/08/azure-cosmos-db.html
[6]: https://charlla.com/howto-docker-on-windows/
[7]: https://www.lightbend.com/blog/streaming-data-dominates-over-2000-developers-say-only-batch-is-almost-extinct
[8]: https://www.lightbend.com/
[9]: https://en.wikipedia.org/wiki/Lightbend
[10]: https://data-artisans.com/blog/apache-flink-1-6-0-whats-new-in-the-latest-apache-flink-release
[11]: https://www.confluent.io/blog/getting-started-apache-kafka-kubernetes/
[12]: https://www.confluent.io/resources/recommendations-for-deploying-apache-kafka-on-kubernetes
[13]: https://www.confluent.io/blog/kafka-streams-action
[14]: https://www.manning.com/books/kafka-streams-in-action
[15]: https://databricks.com/blog/2018/08/09/building-a-real-time-attribution-pipeline-with-databricks-delta.html
[16]: https://dzone.com/articles/model-serving-stream-processing-vs-rpc-rest-with-j
[17]: http://blog.revolutionanalytics.com/2018/08/ieee-language-rankings-2018.html
[18]: https://www.datasciencecentral.com/profiles/blogs/scalable-iot-ml-platform-with-apache-kafka-deep-learning-mqtt


