---
type: post
layout: "post"
title: Interesting Stuff - Week 19, 2021
author: nielsb
date: 2021-05-09T07:07:52+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - machine learning
  - Kafka
  - ksqlDB
description: Kafka and routing messages using ksqlDB, integration of event driven architecture, and other interesting topics.
keywords:
  - machine learning
  - Kafka
  - ksqlDB  
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

This blog-post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Machine Learning

* [Optimal Feature Discovery: Better, Leaner Machine Learning Models Through Information Theory][1]. This post talks about an approach at Uber called Optimal Feature Discovery. It searches for the most compact set of features out of all available at Uber for a given model, both boosting accuracy and reducing feature count at the same time.  

## Databases

* [Why a Serverless Data API Might be Your Next Database][2]. This [InfoQ][iq] article discusses database as a service (DBaaS) and serverless data API for cloud-based data management.

## Streaming

* [EDA implementation — Integration scenarios][3]. The post linked to is a follow up to [Applying Event-Driven Architecture in Digital Transformation Projects][4], which discussed a generic architecture for event-driven architecture (EDA) based systems. This post explores implementation approaches for such event-driven systems by focusing on specific products and their interactions.
* [Streaming ETL with Confluent: Routing and Fan-Out of Apache Kafka Messages with ksqlDB][5]. This post looks at how we can use ksqlDB for message routing. I quite liked the post, and I will definitely see if we can implement some of this at [Derivco](/derivco).

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

[1]: https://eng.uber.com/optimal-feature-discovery-ml/
[2]: https://www.infoq.com/articles/serverless-data-api/
[3]: https://chathura-ekanayake.medium.com/eda-implementation-integration-scenarios-66895923439
[4]: https://chathura-ekanayake.medium.com/applying-event-driven-architecture-in-digital-transformation-projects-acbcb27440af
[5]: https://www.confluent.io/blog/streaming-etl-with-confluent-kafka-message-routing-and-fan-out/
