---
type: post
layout: "post"
title: Interesting Stuff - Week 14, 2021
author: nielsb
date: 2021-04-04T12:11:33+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - machine learning
  - feature stores
  - Kafka
  - delta lake
description: Kafka & ZooKeper, Kafka Prometheus & Graphana, Delta Lake, Machine Learning & Feature Stores, and other interesting topics.
keywords:
  - machine learning
  - feature stores
  - Kafka
  - delta lake   
---

Throughout the week, I read a lot of blog posts, articles, and so forth that has to do with things that interest me:

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

## Machine Learning / Data Science / AI

* [Building Real-Time ML Pipelines with a Feature Store][1]. The term Feature Store is gaining popularity in the Machine Learning world. It is - as the name implies - something that stores feature data. However, it also runs pipelines that transform raw data into feature values, and it serves feature data for training and inference purposes. Most feature stores are batch-oriented, but they must move beyond batch and also become able to handle real-time data. This blog post looks at transitioning from batch to real-time.
* [Data + AI Summit Is Back][2]. This post leads to a link for registration for the North American leg of [Data + AI Summit][3]. The schedule looks awesome, and I'll definitely register! 

## Data Architecture

* [Open sourcing Querybook, Pinterest's collaborative big data hub][4]. Pinterest is a data-driven company, and it is more important than ever for teams to be able to compose queries, create analyses, and collaborate with one another. To enable that, Pinterest built Querybook. This post looks at what Querybook is and how they got to the point of open-sourcing it.
* [Top Questions from Customers about Delta Lake][5]. Databricks Delta Lake is a hot topic, and many people have questions about it. This post aims to answer some of those questions.

## Streaming

* [Apache Kafka Made Simple: A First Glimpse of a Kafka Without ZooKeeper][6]. There has been lots of talk about removing ZooKeeper as a dependency for Kafka. Finally, we are almost there, and the upcoming Kafka release will have the ability to run without ZooKeeper - yay! The blog post linked to looks at the implications of the removal and its impact on - among other things - scalability and performance (spoiler alert: improvements!). Very cool "stuff"!
* [Monitoring Your Event Streams: Integrating Confluent with Prometheus and Grafana][7]. Managing and monitoring a system like Kafka, is not and easy feat. But there are help; this is part 1 of a three-part blog series that will explain how to effectively monitor your event streams. This post looks at integration with third party tools such as Prometheus and Grafana. 

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
[netflx]: https://netflixtechblog.com/

[1]: https://medium.com/data-for-ai/building-real-time-ml-pipelines-with-a-feature-store-9f90091eeb4
[2]: https://databricks.com/blog/2021/04/02/data-ai-summit-is-back.html
[3]: https://databricks.com/dataaisummit/north-america-2021
[4]: https://medium.com/pinterest-engineering/open-sourcing-querybook-pinterests-collaborative-big-data-hub-ba2605558883
[5]: https://databricks.com/blog/2021/03/31/top-questions-from-customers-about-delta-lake.html
[6]: https://www.confluent.io/blog/kafka-without-zookeeper-a-sneak-peek/
[7]: https://www.confluent.io/blog/monitor-kafka-clusters-with-prometheus-grafana-and-confluent/