---
type: post
layout: "post"
title: Interesting Stuff - Week 16, 2020
author: nielsb
date: 2020-04-19T09:59:40+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - Kafka
  - ksqlDB
  - Coyote
description: Kafka, monitor Kafka, ksqlDB, Coyote webinar, time series forecasting, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - Kafka
  - ksqlDB
  - Coyote   
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

## Data Science

* [Forecasting Best Practices, from Microsoft][1]. It is a long time since I have linked to something from [Revolution Analytics][re]. That is now rectified by this post where [David][revod] points to resources from Microsoft around best practices around time series forecasting. Have a look, quite a lot of cool stuff there!
* [Rendezvous Architecture for Data Science in Production][4]. In this post the author discusses one of the biggest problems in Data Science today how to productionise your models. The answer to that problem is something called the Rendezvous Architecture. 

## Distributed Computing

* [Better design, implementation, and testing of async systems with Coyote][3]. In the [Interesting Stuff - Week 13, 2020][2] I wrote about Coyote, the framework for building reliable asynchronous software. The link here is a registration page for a webinar April 30 about Coyote. If you are interested in things like async and distributed systems, then I suggest you register. See you there!

## Event Driven Architecture

* [Event-Driven Data Collection][5]. I linked to some posts about Event Driven Architecture in the [Interesting Stuff - Week 14, 2020][6] post, and the post linked to here is by the same author as the posts in the [week 14][6] roundup. In this post, the author discusses how to populate databases from event-driven data collection.

## Streaming

* [What’s New in Apache Kafka 2.5][7]. Apache Kafka version 2.5 was released earlier this week, and the post here discusses new "stuff" in the release.
* [Real-Time Small Business Intelligence with ksqlDB][8]. In this post, the author makes the point that the Kafka ecosystem is not only for the Netflix:es in this world, but that by using ksqlDB even smaller companies can gain insights into their data.
* [A quick and dirty way to monitor data arriving on Kafka][9]. The title of this post describes the post perfectly. [Robin Moffat][rmoff] shows a way to quickly and easily monitor Kafka data, and be alerted if something happens. Actually be alerted if something does not happen (data arriving).

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

[1]: https://blog.revolutionanalytics.com/2020/04/forecasting-best-practices-from-microsoft.html
[2]: {{< relref "2020-03-29-interesting-stuff---week-13-2020.md" >}}
[3]: https://note.microsoft.com/MSR-Webinar-Coyote-Registration-Live.html
[4]: https://towardsdatascience.com/rendezvous-architecture-for-data-science-in-production-79c4d48f12b
[5]: https://medium.com/phi-skills/event-driven-data-collection-d662a7db52a5
[6]: {{< relref "2020-04-05-interesting-stuff---week-14-2020.md" >}}
[7]: https://www.confluent.io/blog/apache-kafka-2-5-latest-version-updates/
[8]: https://www.confluent.io/blog/real-time-business-intelligence-using-ksqldb/
[9]: https://rmoff.net/2020/04/16/a-quick-and-dirty-way-to-monitor-data-arriving-on-kafka/
