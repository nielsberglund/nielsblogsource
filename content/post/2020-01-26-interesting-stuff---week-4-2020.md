---
type: post
layout: "post"
title: Interesting Stuff - Week 4, 2020
author: nielsb
date: 2020-01-26T07:55:14+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server
  - Kafka
  - Kubernetes
  - Microsoft Ignite The Tour
description: Kafka, Flink, Kubernetes, Microsoft Ignite The Tour in Johannesburg, and other interesting topics.
keywords:
  - SQL Server
  - Kafka
  - Kubernetes
  - Microsoft Ignite The Tour   
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

* [Getting Started With Istio][1]. This post by [Emil][emilk] is an excellent writeup of [Istio][2], the open source service-mesh for distributed micro-services. I found the article very informative, as all the other articles [Emil][emilk] publishes.

## Streaming

* [How SK telecom democratizes streaming data with FLOW and Flink][3]. The post linked to here is how SK Telecom, the South Korean telecommunications company, has built a graphical frontend tool for creating Flink queries through drag and drop. The tool looks amazing, and hopefully, SK Telecom open sources it at some stage.
* [Featuring Apache Kafka in the Netflix Studio and Finance World][4]. This is a very interesting post about how Netflix uses Kafka as its platform of choice when working with events. 
* [Using graph algorithms to optimize Kafka operations, Part 1][5]. In this post, the Logging Platform team at Pinterest discusses how they use graph algorithms to handle their Kafka clusters and handle problems.
* [Designing a Production-Ready Kappa Architecture for Timely Data Stream Processing][6]. A couple of Years ago [Jay Kreps][jayk] who is CEO of Confluent and one of the original developers of Kafka, suggested an alternative to the Lambda architecture, and he called it [Kappa][7]. The post linked to discusses how Uber implements Kappa in production. A very interesting read!

## Microsoft Ignite The Tour | Johannesburg

Microsoft's [Ignite conference][26] took place in November last year, and now, (as they did last year), Microsoft takes Ignite on the road: [Microsoft Ignite The Tour][24].

The tour comes to [Johannesburg January 30 - 31][25], and I am lucky enough to present at the event. I am doing three presentations, and also some community "booth duty":

* [A Lap Around SQL Server Big Data Cluster][20]
* [Simplify and Scale Your Data Pipelines with Azure Delta Lake][21]
* [Improve Customer Lifetime Value using Azure Databricks & Delta Lake][22]

The conference is free of charge, so [register][23] now and come and say Hi!

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
[jayk]: https://twitter.com/jaykreps


[1]: https://medium.com/swlh/getting-started-with-istio-524628c025
[2]: https://cloud.google.com/istio/
[3]: https://www.ververica.com/blog/how-sk-telecom-democratizes-streaming-data-with-flow-and-flink
[4]: https://www.confluent.io/blog/how-kafka-is-used-by-netflix/
[5]: https://medium.com/pinterest-engineering/using-graph-algorithms-to-optimize-kafka-operations-part-1-abbabd606a25
[6]: https://eng.uber.com/kappa-architecture-data-stream-processing/
[7]: https://www.oreilly.com/radar/questioning-the-lambda-architecture/

[20]: https://johannesburg.myignitetour.techcommunity.microsoft.com/sessions/91139?source=sessions
[21]: https://johannesburg.myignitetour.techcommunity.microsoft.com/sessions/91141?source=sessions
[22]: https://johannesburg.myignitetour.techcommunity.microsoft.com/sessions/91140?source=sessions
[23]: https://register.msignite-the-tour.microsoft.com/johannesburg
[24]: https://www.microsoft.com/en-za/ignite-the-tour/
[25]: https://www.microsoft.com/en-za/ignite-the-tour/johannesburg
[26]: https://news.microsoft.com/ignite2019/