---
type: post
layout: "post"
title: Interesting Stuff - Week 7, 2020
author: nielsb
date: 2020-02-16T07:30:30+02:00
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
description: Microsoft Application Inspector, ksqlDB, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - Kafka
  - ksqlDB   
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

## Misc.

* [Microsoft Releases Application Inspector, a Tool for Examining Code Security][1]. This [InfoQ][iq] article discusses **Microsoft Application Inspector** a source code analyzer with some interesting features. The application not only detects "poor" programming practices, but it also surfaces and reports interesting characteristics the code that would be difficult/time-consuming to identify.

## Data Science / Machine Learning

* [ZeRO & DeepSpeed: New system optimizations enable training models with over 100 billion parameters][2]. The blog post linked to here looks at ZeRO, ( Zero Redundancy Optimizer), which is a memory optimization technology for large-scale distributed deep learning. From the post: *ZeRO can train deep learning models with 100 billion parameters on the current generation of GPU clusters at three to five times the throughput of the current best system.* Wowza! Those are large numbers!

## Streaming

* [Domain Events versus Change Data Capture][3]. The topics of change data capture and event-based systems come more and more up in various discussions. In the linked post, the author looks at these topics and explains the differences as well as when to use what.
* [Announcing ksqlDB 0.7.0][4]. In [last weeks roundup][5] I covered a [post][6] by [Robin Moffat][rmoff] where he looked at a new feature in the upcoming ksqlDB 0.7 release. The post linked to here is the official announcement of ksqlDB 0.7. There are quite a few new interesting features in the release, and us at [Derivco](/derivco) will definitely look at the release. 
* [Integrating Elasticsearch and ksqlDB for Powerful Data Enrichment and Analytics][7]. In the post linked to here, the author looks at how we can use both Elasticsearch and ksqlDB to get more intelligence from your streaming data.

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


[1]: https://www.infoq.com/news/2020/02/Microsoft-Application-Inspector
[2]: https://www.microsoft.com/en-us/research/blog/zero-deepspeed-new-system-optimizations-enable-training-models-with-over-100-billion-parameters/
[3]: https://medium.com/swlh/domain-events-versus-change-data-capture-e426772f76e5
[4]: https://www.confluent.io/blog/ksqldb-0-7-0-feature-updates/
[5]: {{< relref "2020-02-09-interesting-stuff---week-6-2020.md" >}}
[6]: https://rmoff.net/2020/02/07/primitive-keys-in-ksqldb/
[7]: https://www.confluent.io/blog/elasticsearch-ksqldb-integration-for-data-enrichment-and-analytics/