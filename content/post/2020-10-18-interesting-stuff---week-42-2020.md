---
type: post
layout: "post"
title: Interesting Stuff - Week 42, 2020
author: nielsb
date: 2020-10-18T08:55:21+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - Kubernetes
  - Kafka
  - ksqlDB
  - KStreams
description: Kafka, ksqlDB, analytics using Druid and KStreams, Kubernetes and chaos, and other interesting topics.
keywords:
  - distributed computing
  - Kubernetes
  - Kafka
  - ksqlDB
  - KStreams   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* Kafka, Kafka, and Kafka
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending.

<!--more-->

## Distributed Computing

* [Introduction to Kraken, a Chaos Tool for OpenShift/Kubernetes][1]. As the title of this post says, it introduces a Kubernetes tool which by you can chaos test your Kubernetes cluster. It looks quite interesting and useful, and I have forwarded the post to the guys at [Derivco](/derivco) looking at Kubernetes.

## Streaming

* [Building a Lambda Architecture with Druid and Kafka Streams][2]. The post linked to here looks at how to use [Druid][4] together with KStreams to build a real-time analytical framework. Really interesting "stuff"!
* [How Real-Time Materialized Views Work with ksqlDB, Animated][3]. The post delivers precisely what the title says: it looks at how materialized views work in ksqlDB. I really like the animations in the post, very cool!
* [Real Time APIs in the Context of Apache Kafka][5]. This [InfoQ][iq] article by the Kafka Guru [Robin Moffat][rmoff] looks at how events together with real-time APIs can be used as the foundation for applications which are flexible yet performant; loosely-coupled yet efficient. Apache Kafka offers a scalable event streaming platform with which you can build applications around the powerful concept of events.     
* [Top 5 Things Every Kafka Developer Should Know][6]. I believe that a developer, to be a good developer, should have an in-depth knowledge of the technologies he/she is working with. If you are using Kafka, then the post linked to here gives you a good start in understanding Kafka.

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


[1]: https://www.openshift.com/blog/introduction-to-kraken-a-chaos-tool-for-openshift/kubernetes
[2]: https://www.fullcontact.com/blog/2020/10/08/building-a-lambda-architecture-with-druid-and-kafka-streams/
[3]: https://www.confluent.io/blog/how-real-time-materialized-views-work-with-ksqldb/
[4]: https://druid.apache.org/
[5]: https://www.infoq.com/articles/real-time-api-kafka/
[6]: https://www.confluent.io/blog/5-things-every-kafka-developer-should-know/
