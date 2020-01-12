---
type: post
layout: "post"
title: Interesting Stuff - Week 2, 2020
author: nielsb
date: 2020-01-12T08:04:28+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - machine learning
  - Kafka
  - ksqlDB
  - VS Code
  - Docker
description: Kafka, ksqlDB, data literacy, VS Code & Docker, MS Ignite The Tour, and other interesting topics.
keywords:
  - data science
  - machine learning
  - Kafka
  - ksqlDB
  - VS Code
  - Docker   
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

## Data Science / Machine Learning

* [Open Sourcing Manifold, a Visual Debugging Tool for Machine Learning][1]. An interesting blog post, discussing Uber's visual debugging tool for machine learning. A couple of guys at [Derivco](/derivco) has started looking at it and is quite impressed.
* [Data Literacy][2]. In this blog post, [Buck Woody][buckw], ("Mr Data Science" at Microsoft), announces a series of posts covering Data Literacy. If you are into data, read the posts - it is well worth it!

## VS Code

* [Create a Reproducible Dev Environment with VS Code][3]. This blog post covers how you can create dev environments quickly using VS Code and Docker. Seeing how I struggle with setting up dev environments, this post comes in really handy!

## Streaming

* [Streaming messages from RabbitMQ into Kafka with Kafka Connect][4]. This is an interesting post by [Robin Moffat][rmoff], where he looks at getting messages from RabbitMQ in Kafka. Seeing that we, ([Derivco](/derivco)), are starting our Kafka journey and we have quite a lot of Rabbit instances this post comes in very handy!
* [Exploring ksqlDB window start time][5]. This is another interesting post by [Robin][rmoff]. In this post, he covers how time windows behave in ksqlDB.

## Microsoft Ignite The Tour | Johannesburg

Microsoft's [Ignite conference][6] took place in November last year, and now, (as they did last year), Microsoft takes Ignite on the road: [Microsoft Ignite The Tour][7].

The tour comes to [Johannesburg January 30 - 31][8], and I am lucky enough to present at the event. I am doing three presentations, and also some community "booth duty":

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


[1]: https://eng.uber.com/manifold-open-source/
[2]: https://buckwoody.wordpress.com/2020/01/06/data-literacy/
[3]: https://medium.com/swlh/create-a-reproducible-dev-environment-with-vs-code-fd89285644da
[4]: https://rmoff.net/2020/01/08/streaming-messages-from-rabbitmq-into-kafka-with-kafka-connect/
[5]: https://rmoff.net/2020/01/09/exploring-ksqldb-window-start-time/
[6]: https://news.microsoft.com/ignite2019/
[7]: https://www.microsoft.com/en-za/ignite-the-tour/
[8]: https://www.microsoft.com/en-za/ignite-the-tour/johannesburg
[20]: https://johannesburg.myignitetour.techcommunity.microsoft.com/sessions/91139?source=sessions
[21]: https://johannesburg.myignitetour.techcommunity.microsoft.com/sessions/91141?source=sessions
[22]: https://johannesburg.myignitetour.techcommunity.microsoft.com/sessions/91140?source=sessions
[23]: https://register.msignite-the-tour.microsoft.com/johannesburg