---
type: post
layout: "post"
title: Interesting Stuff - Week 8, 2019
author: nielsb
date: 2019-02-24T10:08:50+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - streaming
  - flink
description: Weekly roundup of what interesting stuff I have read in blogs etc.
keywords:
  - streaming
  - flink   
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

For some reason I did not find that much interesting to me this week, but here is what caught my eye.

## Streaming

* [Batch as a Special Case of Streaming and Alibaba's contribution of Blink][1]. This post discusses the in-house improvements to Flink batch processing Alibaba has done and contributed to open source. Oh, when you read the post, and you wonder what Ververica is, read [this post][2]. 
* [Patterns of Streaming Applications][3]. This presentation from [InfoQ][iq] talks about a blueprint for streaming data architectures and a review of desirable features of a streaming engine. The presentation also discusses streaming application patterns and anti-patterns, and use cases and concrete examples using Apache Flink.
* [The Whys and Hows of Database Streaming][4]. This [InfoQ][iq] presentation discusses how database streaming is becoming more and more essential and the many functions that database streaming serves. The presentation also covers challenges faced with streaming peer-to-peer distributed databases. 

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

[1]: https://www.ververica.com/blog/batch-as-a-special-case-of-streaming-and-alibabas-contribution-of-blink
[2]: https://www.ververica.com/blog/introducing-our-new-name
[3]: https://www.infoq.com/presentations/apache-flink-streaming-app
[4]: https://www.infoq.com/presentations/wepay-database-streaming
