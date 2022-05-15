---
type: post
layout: "post"
title: Interesting Stuff - Week 19, 2022
author: nielsb
date: 2022-05-15T09:34:48+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Azure IoT
  - Azure Synapse
  - Kafka
description: Kafka in retail, Azure Digital Twins & Synapse & Azure Data Explorer, Software performance, and other interesting topics!
keywords:
  - Azure Data Explorer
  - Azure IoT
  - Azure Synapse
  - Kafka   
---

![](/images/posts/digital-twin.jpg)

**IoT & Digital Twin**

Throughout the week, I read a lot of blog-posts, articles, and so forth that has to do with things that interest me:

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

## Misc.

* [Meet Quamina][1]. A very interesting post by [Tim Bray][2] about [Quamina][3], a super fast pattern-matching library!
* [Reflections on software performance][4]. In this post, the author reflects on some of the lessons learned while writing performant software and working with rather a lot more not-so-performant software. I found the conclusion of the post very interesting: *we underrate performance when designing and building software. We have become accustomed to casually giving up factors [of performance] of two or ten or more with our choices of tools and libraries without asking if the benefits are worth it.*

## Azure Data Explorer

* [Azure Digital Twins and Azure Synapse integration][5]. Azure Digital Twins now integrates with Azure Data Explorer and Azure Synapse, allowing you to find insights from time-series history of digital twins combined and correlated with other data. This YouTube video looks at the integration and also provides a short demo.

## Streaming

* [How Walmart Uses Apache Kafka for Real-Time Replenishment at Scale][6]. As a retailer, both real-time inventory and real-time replenishment are vital. This post looks at Walmart's journey with Kafka and highlights the real-time replenishment use case they are currently using it for. 

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

[1]: https://www.tbray.org/ongoing/When/202x/2022/05/12/Quamina
[2]: https://en.wikipedia.org/wiki/Tim_Bray
[3]: https://github.com/timbray/quamina
[4]: https://blog.nelhage.com/post/reflections-on-performance/
[5]: https://youtu.be/Ky52OQVwckw
[6]: https://www.confluent.io/blog/how-walmart-uses-kafka-for-real-time-omnichannel-replenishment/
