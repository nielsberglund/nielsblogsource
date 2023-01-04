---
layout: post
title: Interesting Stuff - Week 29
author: nielsb
date: 2018-07-22T16:06:58+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - Databricks
  - R
  - Python
description: Kafka, Push Messaging at Netflix, Databricks, and R vs Python.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - Databricks
  - R
  - Python   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending. Unfortunately there was not much that caught my eye this week, so this is a short post.

<!--more-->

## Distributed Computing

* [Scaling Push Messaging for Millions of Devices @Netflix - Susheel Aroskar at QCon NY][1]. An [InfoQ][iq] article about Zuul Push, which is a high performance asynchronous service based on Apache Netty, a non-blocking I/O (NIO)-based network application framework. The technology handles more than 5.5 million connected clients at peak. 

## Streaming

* [Apache Kafka vs. Enterprise Service Bus (ESB)—Friends, Enemies, or Frenemies?][2]. A blog post showing why so many enterprises leverage the open source ecosystem of Apache Kafka for successful integration of different legacy and modern applications, and how this differs but also complements existing integration solutions like ESB or ETL tools.
* [Simplify Streaming Stock Data Analysis Using Databricks Delta][3]. A post about how Databricks Delta helps solving many of the pain points of building a streaming system to analyze stock data in real-time.

## Data Science

* [Python vs (and) R for Data Science][4]. This post acts as a guide for those wishing to choose between Python and R Programming languages for Data Science.

## SQL Server Machine Learning Services

I am ~~busy~~ struggling with writing a couple of posts in the [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) series, as well as the [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) series. I do hope to have at least one out in a weeks time (or so).

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/

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

[1]: https://www.infoq.com/news/2018/07/zuul-push-messaging
[2]: https://www.confluent.io/blog/apache-kafka-vs-enterprise-service-bus-esb-friends-enemies-or-frenemies/
[3]: https://databricks.com/blog/2018/07/19/simplify-streaming-stock-data-analysis-using-databricks-delta.html
[4]: https://blog.usejournal.com/python-vs-and-r-for-data-science-833b48ccc91d

<!-- [series1]: <> [SQL Server R Services](/sql_server_2k16_r_services) -->
<!-- [series2]: <> [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) -->
<!-- [series3]: <> [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) -->

<!-- [findstr]: <> findstr /I <word_to_find> * -->
