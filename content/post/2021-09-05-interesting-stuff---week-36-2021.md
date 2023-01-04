---
type: post
layout: "post"
title: Interesting Stuff - Week 36, 2021
author: nielsb
date: 2021-09-05T10:38:44+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - windows terminal
  - distributed computing
description: Kafka & async. consumer, Windows Terminal bling, fallacies around distribued computing, and other interesting topics.
keywords:
  - Kafka
  - windows terminal
  - distributed computing   
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

## Misc.

* [My Ultimate PowerShell prompt with Oh My Posh and the Windows Terminal][1]. I certainly hope that [Scott Hanselman][2] doesn't need an introduction, but if you haven't heard of him, [here][3] is the link to his blog. Anyway, he has blogged a bit about setting up the Windows terminal, so it looks cool. The post I link to here is the latest and greatest in setting up your terminal. 

## Distributed Computing

* [Navigating the 8 fallacies of distributed computing][4]. This post reviews the eight fallacies of distributed computing and provides several hints at how to handle them. I think I'll, in my next job interview, ask some questions about the eight fallacies!

## Streaming

* [Enabling Seamless Kafka Async Queuing with Consumer Proxy][5]. This post from Uber discusses how Kafka being a stream-oriented system, where message order is assumed in the system's design, can hinder certain message delivery patterns. The post talks about how more than 300 microservices at Uber are leveraging Kafka for pub-sub message queueing between microservices and how Uber developed the Consumer Proxy to work around some of the drawbacks with Kafka's message order oriented design.

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

[1]: https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal
[2]: https://www.hanselman.com/
[3]: https://www.hanselman.com/blog
[4]: https://ably.com/blog/8-fallacies-of-distributed-computing
[5]: https://eng.uber.com/kafka-async-queuing-with-consumer-proxy/