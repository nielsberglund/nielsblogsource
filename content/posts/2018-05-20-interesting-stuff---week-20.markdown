---
layout: post
title: Interesting Stuff - Week 20
author: nielsb
date: 2018-05-20T18:33:35+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - ksql
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Python
  - PyTorch
  - Azure
  - Azure Data Fabric
description: Kafka, Azure Data Fabric, Azure Signal R, PyTorch and other interesting things!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - ksql
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Python
  - PyTorch
  - Azure
  - Azure Data Fabric   
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

## Streaming

* [Visualizations on Apache Kafka Made Easy with KSQL][1]. Not a week without one or more Kafka related posts. This blog-post is about how to get started with processing streaming data with Confluent KSQL and visualizing it using the [Arcadia Data][2] platform. The post contains quite a few links to interesting demos.

## Cloud / Big Data

* [Enhance productivity using Azure Data Factory Visual Tools][3]. A blog-post about ADF Visual Tools where the primary goal of the ADF visual tools is to allow you to be productive with ADF by getting pipelines up and running quickly without requiring to write a single line of code. It looks quite impressive, and this is another thing I really need to have a look at.
* [Microsoft Announces Preview of Azure SignalR Service][4]. An [InfoQ][iq] article about how Microsoft recently announced a public preview of the Azure SignalR Service. SignalR has been available for download as a separate ASP.NET library, but this is the first time it has been available as a fully-managed service. Exciting stuff!

## Data Science

* [Developing Data and ML Pipelines at Stitch Fix][5]. An [InfoQ][5] presentation about how Stitch Fix develops, schedules, and maintains their data and ML pipelines. Very interesting, it sure gave me some ideas!
* [PyTorch 1.0 Announced for Research and Production AI Projects][6]. This links to another [InfoQ][iq] article. This article is about the introduction of PyTorch 1.0 and its new capabilities.
* [Getting Started with Machine Learning Services in SQL Server][7]. A blog-post which serves as an introduction to SQL Server Machine Learning Services. It looks somewhat like my [SQL Server R Services](/sql_server_2k16_r_services), but this post has links to videos. Awesome!

## SQL Server Machine Learning Services

* [sp_execute_external_script and SQL Compute Context - I][ctx1]. I finally managed to finish the post about `sp_execute_external_script` and **SQL Server Compute Context** (SQLCC). That is the good news; the bad news is that I realised that there are quite a few things I do not understand about SQLCC, so I need to investigate more and also write more posts about SQLCC. Sigh - that is life!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com

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


[series]: <> (/series/sql_server_2k16_r_services)

[ctx1]: {{< relref "2018-05-20-sp-execute-external-script-and-sql-compute-context.markdown" >}}

[1]: https://www.confluent.io/blog/visualizations-on-apache-kafka-made-easy-with-ksql/
[2]: https://www.arcadiadata.com/
[3]: https://azure.microsoft.com/en-us/blog/enhance-productivity-using-azure-data-factory-visual-tools/
[4]: https://www.infoq.com/news/2018/05/azure-signalr-preview
[5]: https://www.infoq.com/presentations/data-ml-pipelines-stitchfix
[6]: https://www.infoq.com/news/2018/05/PyTorch-AI
[7]: https://blogs.msdn.microsoft.com/mlserver/2018/05/18/getting-started-with-machine-learning-services-in-sql-server/

