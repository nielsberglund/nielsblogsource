---
type: post
layout: "post"
title: Interesting Stuff - Week 25, 2021
author: nielsb
date: 2021-06-20T07:52:57+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Big Data
  - Apache Pinot
  - Databricks
  - Delta Lake
  - Kafka
  - Derivco
description: Kafka & Consistency & Completeness, Apache Pinot & Geospatial, Derivco Tech-Thursday, and other interesting topics! 
keywords:
  - Big Data
  - Apache Pinot
  - Databricks
  - Delta Lake
  - Kafka
  - Derivco   
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

## Big Data

* [Announcing Photon Public Preview: The Next Generation Query Engine on the Databricks Lakehouse Platform][1]. This post looks at the new vectorized query engine on Databricks; Photon. It is included as part of a new high-performance runtime designed to run SQL workloads faster and reduce the total cost per workload.
* [Introduction to Geospatial Queries in Apache Pinot][2]. Geospatial data has become increasingly important when analyzing Big Data. Deriving insights from timely and accurate geospatial data can enable mission-critical use cases in organizations and give them a competitive edge. Geospatial support has recently been added to Apache Pinot, and this post looks at the challenges of analyzing geospatial at scale and how it is implemented in Apache Pinot.

## Streaming

* [Gently down the stream: A gentle introduction to Apache Kafka][3]. This is a fantastic introduction to Kafka! Nothing more needs to be said!
* [Consistency and Completeness: Rethinking Distributed Stream Processing in Apache Kafka][4]. As the title implies, this post looks at how Consistency and Completeness are implemented in Apache Kafka and Kafka Streams. Very interesting!

## WIND (What Is Niels Doing)

* [Revolutionise how you develop software with GitHub][5]. This is not so much what I am doing, but what a colleague and mate is doing. [Gordon Beeming][7], Microsoft MVP and Devops guru, is doing a [Derivco](/derivco) Tech-Thursday Webinar Thursday, June 24. Gordon looks at some new GitHub features in the webinar, allowing you to deliver more value to your customers. The webinar is public, and you can sign up [here][6]. Don't miss it!

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

[1]: https://databricks.com/blog/2021/06/17/announcing-photon-public-preview-the-next-generation-query-engine-on-the-databricks-lakehouse-platform.html
[2]: https://medium.com/apache-pinot-developer-blog/introduction-to-geospatial-queries-in-apache-pinot-b63e2362e2a9
[3]: https://www.gentlydownthe.stream/
[4]: https://www.confluent.io/blog/rethinking-distributed-stream-processing-in-kafka/
[5]: https://www.linkedin.com/posts/derivco_derivco-tech-thursday-webinar-activity-6811654769594253312-PGbL/
[6]: https://derivco.co.za/tech-thursday-webinar/
[7]: https://gordonbeeming.xyz/
