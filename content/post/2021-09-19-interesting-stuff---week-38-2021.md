---
type: post
layout: "post"
title: Interesting Stuff - Week 38, 2021
author: nielsb
date: 2021-09-19T10:37:19+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - pinot
  - databricks
  - kafka
description: Kafka Summit highlights, Kafka & stream governance, Databricks regulatory reporting, and other interesting topics!
keywords:
  - pinot
  - databricks
  - kafka   
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

## Big Data

* [Launching at LinkedIn: The Story of Apache Pinot][1]. This is the story of how Apache Pinot started from a "simple" beginning at LinkedIn, how it grew over time to being adopted at Uber. Very interesting!
* [Timeliness and Reliability in the Transmission of Regulatory Reports][2]. Regulations impact more and more companies. Part of most regulations is the requirement to create reports for the regulators. God knows that we at [Derivco](/derivco) feel the pain around this subject. The post linked to here demonstrates the benefits of the Databricks Lakehouse architecture in the ingestion, processing, validation and transmission of regulatory data.

## Streaming

* [Confluent Unlocks the Full Power of Event Streams with Stream Governance][3]. Data governance has become a requirement for most organizations, and the organizations have adopted the governance tools needed to manage their data. However, most of the tools are built for data at rest. What about streaming data? In this blog post, Confluent announces the release of their Stream Governance Suite, a set of tools allowing you to govern your streaming data. This is something we have wished for here at [Derivco](/derivco)!
* [Kafka Summit Americas 2021 Recap][4]. This year's final Kafka Summit (Kafka Summit Americas) was a wrap earlier this week. The blog post lists some of the highlights of the summit. Have a look and see what catches your interest!

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

[1]: https://www.startree.ai/blogs/launching-at-linkedin-the-story-of-apache-pinot/
[2]: https://databricks.com/blog/2021/09/17/timeliness-and-reliability-in-the-transmission-of-regulatory-reports.html
[3]: https://www.confluent.io/blog/governing-data-with-confluent-stream-governance/
[4]: https://www.confluent.io/blog/kafka-summit-americas-2021-recap/