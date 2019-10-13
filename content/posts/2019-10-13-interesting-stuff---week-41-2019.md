---
type: post
layout: "post"
title: Interesting Stuff - Week 41, 2019
author: nielsb
date: 2019-10-13T16:09:41+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - databricks
  - spark
  - flink
  - kafka
  - data science
  - machine learning
description: Kafka, Kafka Summit videos, Databricks, Flink, and other interesting topics.
keywords:
  - databricks
  - spark
  - flink
  - kafka
  - data science
  - machine learning   
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

* [Democratizing Financial Time Series Analysis with Databricks][1]. This is a very interesting post, in that it discusses how to develop financial time series analysis faster using Apache Spark, (well actually Databricks), and Koalas.

## Streaming

* [Announcing Stateful Functions: Distributed State, Uncomplicated][2]. This post from Ververica, (previously dataArtisans), discusses Stateful Functions which is an open-source framework that reduces the complexity of building and orchestrating distributed stateful applications at scale.
* [Kafka Summit San Francisco 2019 Session Videos][3]. The [Kafka Summit San Francisco 2019][4] finished last week, (October 1). The organizers have done a tremendous job and managed to put all session videos online. The post I linked to has links videos for all sessions, as well as a top ten list of sessions. Next weekend will be a Kafka Summit videos binge for me!
* [Opportunities and Pitfalls of Event-driven Utopia][5]. This is an [InfoQ][iq] presentation where the presenter goes over the concepts, the advantages, and the pitfalls of event-driven utopia. He shares real-life stories or points to source code examples.
* [Kafka Connect and Elasticsearch][6]. This post by [Robin Moffat][rmoff] discusses recent changes in Elasticsearch and the Kafka Connector for Elastic and what you can do to fix some of the errors you may encounter due to the changes.

## WIND (What Is Niels Doing)

Towards the end of last year, I wrote a post about how to handle null values when calling from SQL Server into Java, (and the reverse). Since then, Microsoft released the [Java Extensibility SDK][7], and some things changed. I am now working on a follow-up post where I look at how to handle null values post the Java Extensibility SDK. Expect it to be published in a week or so.

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

[1]: https://databricks.com/blog/2019/10/09/democratizing-financial-time-series-analysis-with-databricks.html
[2]: https://www.ververica.com/blog/announcing-stateful-functions-distributed-state-uncomplicated
[3]: https://www.confluent.io/blog/kafka-summit-san-francisco-2019-session-videos
[4]: https://kafka-summit.org/events/kafka-summit-san-francisco-2019/
[5]: https://www.infoq.com/presentations/event-driven-benefits-pitfalls
[6]: https://rmoff.net/2019/10/07/kafka-connect-and-elasticsearch/
[7]: {{< relref "2019-05-26-java--sql-server-2019-extensibility-framework-the-sequel.md" >}}
