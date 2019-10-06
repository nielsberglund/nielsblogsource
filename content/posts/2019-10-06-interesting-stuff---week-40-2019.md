---
type: post
layout: "post"
title: Interesting Stuff - Week 40, 2019
author: nielsb
date: 2019-10-06T08:09:53+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - Kafka
  - Confluent Cloud
  - Event sourcing
description: Kafka in the Cloud, Event Sourcing and other interesting topics.
keywords:
  - distributed computing
  - Kafka
  - Confluent Cloud
  - Event sourcing
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

* [Evolutionary Architecture][1]. This is an [InfoQ][iq] presentation where the presenter discusses traditional approaches of evolutionary architecture showing how to use fitness functions and transition to an evolutionary architecture even in the face of legacy systems.
* [Day Two Problems When Using CQRS and Event Sourcing][2]. This is a summary of an [InfoQ][iq] presentation where the presenter shared his experience running and evolving CQRS and event-sourced applications in production.

## Streaming

* [Free Apache Kafka as a Service with Confluent Cloud][3]. The [Kafka Summit 2019][4] was held earlier this week, and this is a post about an announcement that was made about how Confluent is now offering Confluent Cloud for free. Well, for free is not exactly true, but you get $50 off the bill each month for the first three months after you have signed up. This may not sound like much, but it goes a long way. I have signed up, so expect some posts about Kafka in the cloud going forward.
* [Real-Time Stream Analysis in Functional Reactive Programming][5]. This [InfoQ][iq] presentation discusses a reactive approach to application design, and how to account for handling events in near real-time employing the Functional Reactive Programming paradigm.
* [Jay Kreps, Confluent | Kafka Summit SF 2019 Keynote][6]. Above I mentioned [Kafka Summit 2019][4], and the YouTube video in the link is [Jay Kreps][7] keynote address. In the keynote, he explains modern stream processing, real-time databases, KSQL, and other interesting "stuff".

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

[1]: https://www.infoq.com/presentations/evolutionary-architecture
[2]: https://www.infoq.com/news/2019/09/cqrs-event-sourcing-production
[3]: https://www.confluent.io/blog/kafka-made-serverless-with-confluent-cloud
[4]: https://kafka-summit.org/events/kafka-summit-san-francisco-2019
[5]: https://www.infoq.com/presentations/stream-analysis-fp
[6]: https://www.youtube.com/watch?reload=9&v=4QoCbhsQeyE&feature=
[7]: https://www.linkedin.com/in/jaykreps/