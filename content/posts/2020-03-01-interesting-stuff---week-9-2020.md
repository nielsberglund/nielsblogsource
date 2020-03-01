---
type: post
layout: "post"
title: Interesting Stuff - Week 9, 2020
author: nielsb
date: 2020-03-01T07:53:45+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - Kafka
  - Spark ML
  - data platform geeks
description: Kafka, SparkML, data architecture, Data Platform Geeks, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - Kafka
  - Spark ML
  - data platform geeks   
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

## Azure

* [Tips for Creating Custom Azure DevOps Build Tasks][1]. At [Derivco](/derivco) we have started using Azure DevOps in earnest, so this post by Travis comes in real handy.

## Big Data

* [Data Mesh Paradigm Shift in Data Platform Architecture][4]. In my weekly roundup for [week 5][2], I mentioned a post about the state of today's [data architecture][3]. The [InfoQ][iq] presentation I link to here, is done by the same person that wrote the post, and the presentation is essentially the content of the blog post, (or the other way around :)).

## Machine Learning / Data Science

* [How to embed a Spark ML Model as a Kafka Real-Time Streaming Application for Production Deployment][9]. This is a very interesting post. As the title says, it covers the use of Spark ML together with Kafka, and how a streaming application can make ML predictions in real-time.

## Streaming

* [How to implement retry logic with Spring Kafka][5]. An informative post with ideas on how to implement retry logic, (exactly as the title says).
* [99th Percentile Latency at Scale with Apache Kafka][6]. The post linked to here is a must-read for you who want to get the best performance out of your Kafka clusters. The post discusses how to configure Kafka to minimize latency.
* [Introducing Confluent Developer][7]. In this post, Confluent's director of developer relations, [Tim Berglund][timber], introduces the goto place for everything Kafka - [Confluent Developer][8]. I've had a look over the weekend, and it is a treasure trove of material to go through if you are into Kafka.

## WIND (What Is Niels Doing)

The title in this section is not entirely correct as this is not so much about what I am doing right now as it is what I did the week just passed.

Anyway, the week just passed, I did two webinars for [**DataPlatformGeeks**][10], (DPG):

* [Data Virtualization in SQL Server 2019 Big Data Cluster][12]. Where we look at how we do data virtualization in SQL Server 2019 Big Data Cluster.
* [Deep Dives into the Storage and Data Pools in SQL Server 2019 Big Data Cluster][13]. A closer look at the storage and data pools in SQL Server 2019 Big Data Cluster.

I recommend all of you to [register][11] with DPG, as they have a plethora of free learning resources! Oh, and they also run a yearly conference; [Data Platform Summit][14]. I hope to be able to deliver a couple of sessions at the conference this year.

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
[adsit]: https://twitter.com/SitnikAdam
[vicky]: https://twitter.com/vickyharp
[dscentral]: https://twitter.com/DataScienceCtrl
[natemc]: https://twitter.com/natemcmaster
[ads]: https://twitter.com/azuredatastudio
[travw]: https://twitter.com/radtravis
[emilk]: https://twitter.com/IsTheArchitect
[timber]: https://twitter.com/tlberglund


[1]: https://www.paraesthesia.com/archive/2020/02/25/tips-for-custom-azure-devops-build-tasks/
[2]: {{< relref "2020-02-02-interesting-stuff---week-5-2020.md" >}}
[3]: https://martinfowler.com/articles/data-monolith-to-mesh.html
[4]: https://www.infoq.com/presentations/data-mesh-paradigm/
[5]: https://medium.com/trendyol-tech/how-to-implement-retry-logic-with-spring-kafka-710b51501ce2
[6]: https://www.confluent.io/blog/configure-kafka-to-minimize-latency/
[7]: https://www.confluent.io/blog/confluent-developer-offers-kafka-tutorials-resources-guides/
[8]: https://developer.confluent.io/
[9]: https://towardsdatascience.com/how-to-embed-a-spark-ml-model-as-a-kafka-real-time-streaming-application-for-production-deployment-933aecb79f3f
[10]: https://www.dataplatformgeeks.com/
[11]: https://www.dataplatformgeeks.com/registration
[12]: https://www.dataplatformgeeks.com/videos/data-virtualization-in-sql-server-2019-big-data-cluster-by-niels-berglund-recorded-webinar/
[13]: https://www.dataplatformgeeks.com/videos/deep-dives-into-the-storage-and-data-pools-in-sql-server-2019-big-data-cluster-by-niels-berglund-recorded-webinar/
[14]: https://www.dps10.com/
