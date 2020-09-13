---
type: post
layout: "post"
title: Interesting Stuff - Week 37, 2020
author: nielsb
date: 2020-09-13T09:38:45+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server 2019 Big Data Cluster
  - Derivco Webinar
  - Kafka
description: Kafka & machine learning, priority messages in Kafka, Derivco webinar about Big Data Cluster, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server 2019 Big Data Cluster
  - Derivco Webinar
  - Kafka   
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

* [Distributed Programming, Hash Tables, and Fun!][1]. In this [InfoQ][iq] presentation, the presenters demonstrate how they built a distributed hash-table video-sharing system, the technical hurdles encountered, and the pros/cons of using functional languages to do so. Very interesting!

## Machine Learning

* [Cheat Sheets for AI, Neural Networks, Machine Learning, Deep Learning & Big Data][2]. Cheat sheets are good, and I certainly need them. The post linked to gives, according to the post, *the most complete list of best AI cheat sheets*. I don't know about that, but there are some quite cool cheat sheets in there.
* [Using TensorFlow to make predictions from Kafka events][3]. This is a very interesting post, looking at how you can use Kafka and TensorFlow together to make machine learning predictions around sensor events.

## Streaming

* [Implementing Message Prioritization in Apache Kafka][4]. This post came at the exact right time, as I have been battling with how to implement priority messages in Kafka. In Rabbit, which we used previously, it was easy. In Kafka not so much. So reading about "bucketing" saved the day!

## WIND (What Is Niels Doing)

In [last weeks roundup][5] I said how I was going to do a **Derivco Webinar** this week about **SQL Server 2019 Big Data Cluster**. Well, I did it September 10, it went off without a "hitch", and - if I can say it myself - it was a lot of fun. If you are interested in seeing it, you find it on the Derivco YouTube channel [here][6].

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


[1]: https://www.infoq.com/presentations/distributed-video-sharing-demo/
[2]: https://becominghuman.ai/cheat-sheets-for-ai-neural-networks-machine-learning-deep-learning-big-data-678c51b4b463
[3]: https://dalelane.co.uk/blog/?p=4124
[4]: https://www.confluent.io/blog/prioritize-messages-in-kafka/
[5]: {{< relref "2020-09-06-interesting-stuff---week-36-2020.md" >}}
[6]: https://www.youtube.com/watch?v=EyCsQP5VJhU
