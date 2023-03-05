---
type: post
layout: "post"
title: Interesting Stuff - Week 9, 2023
author: nielsb
date: 2023-03-05T08:31:23+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-09-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-09-23.jpg"
categories:
  - roundup
tags:
  - AI/ML
  - OpenAI
  - Kafka
  - Kafka Streams
  - Azure Data Explorer
description: "This weekly roundup covers prompt engineering for Generative AI. I also cover stream processing vs real-time OLAP DBs; using Kafka and other open-source technologies to build AWS data lakes. To finish off: Spark Structured Streaming and REST APIs."
---

This week it is mostly streaming related "stuff" that has caught my eye. Regardless of that, we start with some Generative AI - or rather prompt engineering, where I link to a post around different types of "frameworks" for prompt engineering. When you read the post you will see why "frameworks" are in quotes.

From that we go into streaming "land" and look at stream processing vs. real-time OLAP databases. There's an interesting article about building data lakes on AWS using open-source technologies. I round off the streaming with a post about Spark Structured Streaming and REST APIs. 

<!--more-->

## AI/ML

* [Learn To Master Prompt Engineering With This Singular (Triple) Framework][1]. Lately, there has been a lot of "noise" around prompt engineering (I have linked to posts about it [here][1] and [here][2]). This post covers several aspects of prompt engineering, including the importance of understanding the task at hand, selecting the right dataset, and evaluating the model's performance. The post also looks at different types of "frameworks" for prompt engineering. Very interesting.

## Streaming

* [Stream Processing vs Real-time OLAP vs Streaming Database][4]. This post examines the differences and similarities between stream processing and real-time OLAP databases. The post also provides an overview of the different tools and technologies available for implementing each technique, such as Apache Kafka for Stream Processing and Apache Druid for Real-time OLAP. I found the post good! My only "gripe" was that the author didn't include **Azure Data Explorer** in the mix.
* [Building Data Lakes on AWS with Kafka Connect, Debezium, Apicurio Registry, and Apache Hudi][5]. As the title implies, the linked post provides a comprehensive guide to building a data lake on AWS using several open-source tools. The post is a must-read for those interested in data management and analysis.
* [Scalable Spark Structured Streaming for REST API Destinations][6]. Spark Structured Streaming is the engine at the foundation of data streaming on the Databricks Lakehouse Platform. This post describes using Spark Structured Streaming to build a REST API by mapping HTTP requests to Spark Structured Streaming queries. The post discusses how to do this in theory and provides an example of using the API to process real-time data from Twitter. Very cool!

## WIND (What Is Niels Doing)

I am still working on the next post in the [**Develop a Real-Time Leaderboard Using Kafka and Azure Data Explorer**][7] series. It is going slower than expected since "real work" has a way of rearing its "ugly" head :smile:. I hope to publish the post by the end of this coming week.

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

[1]: https://thealgorithmicbridge.substack.com/p/learn-to-master-prompt-engineering
[2]: {{< relref "2023-02-12-interesting-stuff---week-6-2023.md" >}}
[3]: {{< relref "2023-02-26-interesting-stuff---week-8-2023.md" >}}
[4]: https://hubertdulay.substack.com/p/stream-processing-vs-real-time-olap
[5]: https://itnext.io/building-data-lakes-on-aws-with-kafka-connect-debezium-apicurio-registry-and-apache-hudi-b4da0268dce
[6]: https://www.databricks.com/blog/2023/03/02/scalable-spark-structured-streaming-rest-api-destinations.html
[7]: {{< relref "2023-02-26-develop-a-real-time-leaderboard-using-kafka-and-azure-data-explorer---prelude.md" >}}
