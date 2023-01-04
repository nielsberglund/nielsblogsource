---
type: post
layout: "post"
title: Interesting Stuff - Week 2, 2019
author: nielsb
date: 2019-01-13T19:43:46+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2019
  - kafka
  - Databricks
  - Azure Data Studio
  - .NET
description: Kafka, SQL Server 2019 Big Data Clusters, .NET, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2019
  - kafka
  - Databricks
  - Azure Data Studio
  - .NET   
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

## .NET

* [Article Series - .NET Core - 2nd Series][1]. An [InfoQ][iq] series, exploring some of the benefits of .NET Core and how it can help traditional .NET developers and all technologists that need to bring robust, performant and economical solutions to market.
* [Profiling Concurrent .NET Code with BenchmarkDotNet and visualizing it with Concurrency Visualizer][2]. A blog post by [Adam Sitnik][adsit] who is .NET Mr Performance. In the post, he talks about how to profile multithreaded .NET code using [BenchmarkDotNet][4] and [Concurrency Visualizer][3]. If you are a .NET developer, do yourself a favor and follow [Adam][adsit]. 

## Streaming

* [Getting Your Feet Wet with Stream Processing – Part 1: Tutorial for Developing Streaming Applications][5]. The first part of a two-part blog series about developing and validating real-time streaming applications. This part is an introduction to streaming application development.

## Data Science

* [Introducing Databricks Runtime 5.1 for Machine Learning][6]. A blog post which introduces the latest beta release of Databricks runtime for Machine Learning (version 5.1). The release includes some of the best frameworks for deep learning.

## SQL Server 2019

* [How to automate machine learning on SQL Server 2019 big data clusters][7]. This post explores how to use automated machine learning (AutoML) to create new machine learning models over data in SQL Server 2019 big data clusters.
* [The January release of Azure Data Studio][8]. A post announcing the latest release of [Azure Data Studio][10]. Go and download it from [here][9].

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

[1]: https://www.infoq.com/articles/dotnet-core-article-second-series
[2]: https://adamsitnik.com/ConcurrencyVisualizer-Profiler/
[3]: https://marketplace.visualstudio.com/items?itemName=Diagnostics.ConcurrencyVisualizer2017
[4]: https://benchmarkdotnet.org/
[5]: https://www.confluent.io/blog/stream-processing-part-1-tutorial-developing-streaming-applications
[6]: https://databricks.com/blog/2019/01/07/introducing-databricks-runtime-5-1-for-machine-learning.html
[7]: https://cloudblogs.microsoft.com/sqlserver/2019/01/09/how-to-automate-machine-learning-on-sql-server-2019-big-data-clusters/
[8]: https://cloudblogs.microsoft.com/sqlserver/2019/01/09/the-january-release-of-azure-data-studio-is-now-available/
[9]: https://docs.microsoft.com/en-us/sql/azure-data-studio/download?view=sql-server-ver15
[10]: https://github.com/microsoft/azuredatastudio