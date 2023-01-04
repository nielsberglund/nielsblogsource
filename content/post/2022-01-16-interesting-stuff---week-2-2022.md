---
type: post
layout: "post"
title: Interesting Stuff - Week 2, 2022
author: nielsb
date: 2022-01-16T08:56:07+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data architecture
  - Azure Data Explorer
  - Kafka
  - ksqlDB
  - Databricks
  - Event Hubs
  - Debezium
  - Kafka Connect
description: Kafka, ksqlDB recipes, Debezium & Event Hubs, Data Sharding tech, and other interesting topics.
keywords:
  - data architecture
  - Azure Data Explorer
  - Kafka
  - ksqlDB
  - Databricks
  - Event Hubs
  - Debezium
  - Kafka Connect   
---
![](/images/posts/monitoring-1.jpg)

*Photo by <a href="https://unsplash.com/@dawson2406?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Stephen Dawson</a> on <a href="https://unsplash.com/s/photos/technical?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>*

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

## Data & Data Architecture

* [The State of Data Infrastructure Landscape in 2022 and Beyond][1]. This post looks at the evolution of the data infrastructure landscape over the last decade. It then goes on to look at key trends and what can be expected from now and onwards. 
* [The Next Evolution of the Database Sharding Architecture][2]. In this [InfoQ][iq] article, the author discusses the data sharding architecture patterns in a distributed database system. She explains how the Apache ShardingSphere project solves the data sharding challenges. Also discussed are two practical examples of how to create a distributed database and an encrypted table with DistSQL. Very, very interesting!

## Azure Data Explorer

* [Big Data Analytics using Azure Data Explorer][3]. Learn from the masters of Azure Data Explorer. This link is to register for an Azure Data Explorer talk by the Azure Data Explorer gurus [Minni Walia][4] and Uri Barash[5]. Read the abstract on the [sign-up page][3] to see all the goodies you'll hear about. See you there!
* [Azure Data Explorer offers on AMD SKUs][6]. The post linked to covers "what it says on the tin"; it talks about how we can now run Azure Data Explorer on AMD SKUs. This is cool as we can now gain higher performance while keeping the costs low.

## Streaming

* [Confluent Streaming for Databricks: Build Scalable Real-time Applications on the Lakehouse][7]. This post is about the fully managed Confluent connector against Databricks Delta Lake: the ability to ingest directly into Delta Lake tables from Kafka topics. I got really excited when I saw this post because this would solve some issues for us: us as in [Derivco](/derivco). Unfortunately, we cannot use it yet, as it is AWS only - for now. Regardless of that, this is really cool!
* [Announcing ksqlDB 0.23.1][8]. A new version of ksqlDB is out in the wild! Some of the new exciting features are: perform pull queries on streams, access topic partition and offset through pseudo-columns, and use grace periods when joining streams. All very cool!
* [Scaling Kafka Consumer for Billions of Events][9]. This post provides a "ton" of helpful information about configuring Kafka consumers for optimal throughput. I have made this post a mandatory read for my developers that write Kafka applications.
* [Transform your Kafka data into real-time insights][10]. The post looks at ksqlDB recipes for the most popular stream processing use cases. Each recipe provides a set of ksqlDB queries you can run to process real-time data streams and take immediate action. 

## WIND (What Is Niels Doing)

In last week's roundup, I mentioned how I had started writing a post using Debezium and Kafka Connect to publish events to Event Hubs. The one blog post turned into two, and I published both during last week:

* [How to Stream Data to Event Hubs from Databases Using Kafka Connect & Debezium in Docker - I][11]. In this post I looked at the configuration of Kafka Connect in `docker-compose.yml` to enable connection to Event Hubs.
* [How to Stream Data to Event Hubs from Databases Using Kafka Connect & Debezium in Docker - II][12]. This, the second post, concluded the "adventure" of streaming data to Eent Hubs using Debezium and Kafka Connect. More specifically, I looked at the configuration of the Debezium connector and the various properties required to push data to Event Hubs.

When I started with the two posts above I was not 100% sure it would work (publishing to Event Hubs using Kafka Connect). Fortunately it turned out that, yes - you can use Kafka Connect to publish to Event Hubs.

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

[1]: https://medium.com/event-driven-utopia/the-state-of-data-infrastructure-landscape-in-2022-and-beyond-c57b9f85505c
[2]: https://www.infoq.com/articles/next-evolution-of-database-sharding-architecture/
[3]: https://www.meetup.com/data-platform-downunder-meetup-group/events/283207013/
[4]: https://www.linkedin.com/in/minni-walia-17968521/
[5]: https://www.linkedin.com/in/uri-barash-7820594/
[6]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/azure-data-explorer-offers-on-amd-skus/ba-p/3033197
[7]: https://databricks.com/blog/2022/01/13/confluent-streaming-for-databricks-build-scalable-real-time-applications-on-the-lakehouse.html
[8]: https://www.confluent.io/blog/ksqldb-0-23-1-features-updates/
[9]: https://medium.com/paypal-tech/kafka-consumer-benchmarking-c726fbe4000
[10]: https://developer.confluent.io/ksqldb-recipes/
[11]: {{< relref "2022-01-10-how-to-stream-data-to-event-hubs-from-databases-using-kafka-connect--debezium-in-docker---i.md" >}}
[12]: {{< relref "2022-01-14-how-to-stream-data-to-event-hubs-from-databases-using-kafka-connect--debezium-in-docker---ii.md" >}}
