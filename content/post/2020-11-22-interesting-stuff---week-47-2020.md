---
type: post
layout: "post"
title: Interesting Stuff - Week 47, 2020
author: nielsb
date: 2020-11-22T08:52:30+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - kafka
  - ksqlDB
  - kubernetes
  - SQL Server
description: Kafka & retries, distributed ksqlDB, distributed systems course, Data Platform Summit 2020, and other interesting topics!
keywords:
  - distributed computing
  - kafka
  - ksqlDB
  - kubernetes
  - SQL Server   
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

## Azure Data Studio

* [Building and sharing Jupyter Books in Azure Data Studio][1]. We all should know by now that Azure Data Studio allows us to use Jupyter notebooks. This post looks at how we can not only use Jupyter books but also create and share them. Very cool!

## Distributed Computing

* [Autoscaling in Kubernetes: A Primer on Autoscaling][2]. This post is the first in a series looking at application autoscaling in Kubernetes. I was going to write that I really look forward to the second instalment when I realized it already had been [published][3]! Awesome!
* [New courses on distributed systems and elliptic curve cryptography][4]. As the title says; Martin Kleppman of [Designing Data-Intensive Applications][5] fame have released some new training courses. I am very interested in the distributed systems course; the videos look awesome! This course is a must for anyone interested in distributed systems!
* [Distributed Systems and Asynchronous I/O][6]. The post linked to here looks at how different forms of handling I/O affect the performance, availability, and fault-tolerance of network applications.

## Streaming

* [If You’re Using Kafka With Your Microservices, You’re Probably Handling Retries Wrong][7]. In this excellent article, the author looks at various ways of handling retries in Kafka. The article presents a potential solution together with the downsides of that particular solution. As I said in the beginning - this is an excellent article!
* [How Real-Time Stream Processing Safely Scales with ksqlDB, Animated][8]. This post is the third in a series around ksqlDB and how it executes stateless and stateful operations. The two previous posts have looked at a single server setup. This post looks at how stateless and stateful operations work when ksqlDB is deployed with many servers, and more importantly, how it linearly scales the work it is performing—even in the presence of faults.
* [Analysing historical and live data with ksqlDB and Elastic Cloud][9]. This is a great post by [Robin Moffat][rmoff]. He looks at how you can take "messy and imperfect" data, (think CSV), from a "raw data" Kafka topic, re-format it, and make it presentable with ksqlDB, push it into another topic, and from there stream it into an analytical dashboard. Awesome stuff!

## WIND (What Is Niels Doing)

Don't forget Data Platform Summit 2020.

![](/images/posts/dps_2020.png)

I am super excited to be speaking at the [**Data Platform Virtual Summit 2020**][10]:

![](/images/posts/Niels_Berglund.jpg)

and as you see in the figure above, my presentation is about Kafka and SQL Server.

The **Data Platform Virtual Summit 2020**, (DPS), is a 100% technical learning event with 200 Breakout Sessions, 30 Training Classes, 72 hours of non-stop conference sessions. DPS 2020 is the largest online learning event on Microsoft Azure Data, Analytics & Artificial Intelligence. Delegates get the recordings at no extra cost, which is quite a wonderful thing. Also, the conference virtual platform looks amazing, [take a look][11].

If you want to attend and hear industry experts talk about really exciting stuff you can [book here][12]. Oh, and the coolest thing is that as I am a speaker I get a discount code to hand out to you guys! Use the discount code **DPSSPEAKER** to book your seat at **55%** off.

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


[1]: https://cloudblogs.microsoft.com/sqlserver/2020/11/16/building-and-sharing-jupyter-books-in-azure-data-studio/
[2]: https://medium.com/expedia-group-tech/autoscaling-in-kubernetes-a-primer-on-autoscaling-7b8f0f95a928
[3]: https://medium.com/expedia-group-tech/autoscaling-in-kubernetes-options-features-and-use-cases-c8a6ce145957
[4]: https://martin.kleppmann.com/2020/11/18/distributed-systems-and-elliptic-curves.html
[5]: http://dataintensive.net/
[6]: https://medium.com/swlh/distributed-systems-and-asynchronous-i-o-ef0f27655ce5
[7]: https://medium.com/@dt_23597/if-youre-using-kafka-with-your-microservices-you-re-probably-handling-retries-wrong-8492890899fa
[8]: https://www.confluent.io/blog/how-real-time-stream-processing-safely-scales-with-ksqldb/
[9]: https://www.confluent.io/blog/using-kafka-ksqldb-kibana-to-stream-data-and-get-real-time-analytics/
[10]: https://dataplatformgeeks.com/dps2020/
[11]: https://www.linkedin.com/posts/amitbansal2010_dps2020-sqlserver-powerbi-activity-6728885748755374080-a8QL/
[12]: https://dataplatformgeeks.com/dps2020/booking/
