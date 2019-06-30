---
type: post
layout: "post"
title: Interesting Stuff - Week 14, 2019
author: nielsb
date: 2019-04-07T19:33:23+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - Kafka
  - KSQL
  - Kafka Streams
description: Kafka, KSQL, Kafka streams, and other interesting topics.
keywords:
  - distributed computing
  - Kafka
  - KSQL
  - Kafka Streams   
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

* [Building a Reliable Cloud-Based Bank in Java][1]. This is an [InfoQ][iq] presentation discussing the experience of Starling Bank, a mobile-only, cloud-based bank that launched in the UK in 2017. The presenter looks at the system architecture of the bank, the design principles that give them the ability to release quickly and reliably, and why they decided to build the back end using Java.

## Streaming

* [Introducing Confluent Platform 5.2][2]. During the week Confluent announced the release of Confluent Platform 5., and with it some exciting new features:

    * Confluent Platform is free for single node clusters, it is like a developer edition!
    * The `librdkafka` library is now in version 1.0. That is interesting as it brings this library closer to parity with the Java client for Kafka.
    * New and enhanced query expressions in KSQL.
* [Putting Events in Their Place with Dynamic Routing][3]. This is a blog post about how Kafka Streams are a powerful way to enrich data streaming through event-driven architectures. We can dynamically route events to topics, even pulling in the output topic information from another end data system.
* [KSQL: What’s New in 5.2][1]. As I mentioned above, there are new features in KSQL 5.2, and in this blog post [Robin][rmoff] discusses some of them!

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

[1]: https://www.infoq.com/presentations/starling-bank
[2]: https://www.confluent.io/blog/introducing-confluent-platform-5-2
[3]: https://www.confluent.io/blog/putting-events-in-their-place-with-dynamic-routing
[4]: https://www.confluent.io/blog/ksql-whats-new-in-5-2
