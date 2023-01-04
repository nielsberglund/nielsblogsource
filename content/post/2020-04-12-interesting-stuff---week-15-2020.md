---
type: post
layout: "post"
title: Interesting Stuff - Week 15, 2020
author: nielsb
date: 2020-04-12T09:27:47+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - Kafka
  - ksqlDB
  - message tracing
description: Kafka and how acks work, KSQL in the cloud, KStreams, and other interesting topics.
keywords:
  - distributed computing
  - Kafka
  - ksqlDB
  - message tracing   
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

## Streaming

* [Kafka Acks Explained][1]. The post here covers in detail how acks in Kafka works, and what the two config options `acks` and `min.insync.replicas` does. Very informative! 
* [Confluent Cloud KSQL is Now Available][2]. Finally! The post title says it all. KSQL and ksqlDB are now generally available in Confluent Cloud. That is so cool!
* [Preventing Fraud and Fighting Account Takeovers with Kafka Streams][3]. This is an awesome post, looking at how Kafka streams can be used in a fraud preventing scenario. Quite a lot of useful ideas in the post!
* [Inca — Message Tracing and Loss Detection For Streaming Data @Netflix][4]. I don't know how I have not seen this post earlier. Well, anyway, the post gives a good overview of how Netflix does message loss detection and tracing of their streaming events.

## WIND (What Is Niels Doing)

Had a nice Easter dinner yesterday - Happy Easter, everyone!

Still in lock-down. The lock-down period here in SA was a couple of days ago extended to the end of April! Let's hope the lock-down has an\ positive impact!  

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me. Most importantly, stay safe out there!

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


[1]: https://medium.com/better-programming/kafka-acks-explained-c0515b3b707e
[2]: https://www.confluent.io/blog/confluent-cloud-ksql-as-a-service/
[3]: https://www.confluent.io/blog/fraud-prevention-and-threat-detection-with-kafka-streams/
[4]: https://medium.com/@NetflixTechBlog/inca-message-tracing-and-loss-detection-for-streaming-data-netflix-de4836fc38c9
