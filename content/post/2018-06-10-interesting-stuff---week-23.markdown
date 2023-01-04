---
layout: post
title: Interesting Stuff - Week 23
author: nielsb
date: 2018-06-10T10:10:24+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Azure Data Lake Analytics
  - ServiceFabric
  - Kafka
description: ServiceFabric white paper, Kafka videos, Azure Data Lake Analytics, FASTER, and other interesting things!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Azure Data Lake Analytics
  - ServiceFabric
  - Kafka   
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

* [ServiceFabric: a distributed platform for building microservices in the cloud][1]. **Service Fabric** (SF) is Microsoft's platform to support microservices applications both in the cloud as well as on-prem. In this blog post [Adrian][adcol] dissects a white paper about the internal workings of Service Fabric. As we in [Derivco](/Derivco) are using SF I have made this white paper recommended reading for my developers.

## Streaming

* [Confluent Kafka Videos][2]. This link is to a YouTube video library of Kafka videos. If you are interested in Kafka, then I recommend you watch these videos.

## Big Data / Cloud

* [Process more files than ever and use Parquet with Azure Data Lake Analytics][3]. A blog post about how Azure Data Analytics now has capabilities for processing files of any formats including Parquet at tremendous scale.
* [Microsoft Unveils FASTER – a key-value store for large state management][4]. **FASTER** is a new embedded key-value store invented by Microsoft Research, and this blog post discusses how FASTER works.

## Data Science

* [Understanding ML/DL Models using Interactive Visualization Techniques][5]. A presentation via [InfoQ][iq] about how to use visualisation techniques to better understand machine learning and deep learning models. When I shared this with the data scientists at [Derivco](/Derivco), they were keen on testing it out themselves.
* [Announcing ML.NET 0.2][6]. A blog post announcing version 0.2 of **ML.NET**, the .NET based cross-platform, open source machine learning framework. This release adds new ML tasks like clustering, making it easier to validate models, and also a brand-new repo for [ML.NET samples][7]. Check it out!
* [Introducing MLflow: an Open Source Machine Learning Platform][8]. A blog post about **MLFlow**: an open source platform designed to manage the entire machine learning lifecycle and work with any machine learning library. It looks quite interesting, and at some stage, I may have a go at it.
* [Tools to Put Deep Learning Models in Production][9]. A presentation about how Booking.com supports data scientists by making it easy to put their models in production, and how they optimise their model prediction infrastructure for latency or throughput.
* [Free E-Book: A Developer’s Guide to Building AI Applications][10]. A free e-book (requires registration though) which walks you through the process of building intelligent cloud-based bots.

## SQL Server Machine Learning Services

I am still busy writing the follow-up post to my [sp_execute_external_script and SQL Compute Context - I][ctx1] post from three weeks ago. The post is supposed to be about why executing code in the **SQL Server Compute Context** gives so much better performance than when executing in the local context. Initially, I thought it was straightforward; boy was I wrong.

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

[1]: https://blog.acolyer.org/2018/06/05/servicefabric-a-distributed-platform-for-building-microservices-in-the-cloud/
[2]: https://www.youtube.com/channel/UCmZz-Gj3caLLzEWBtbYUXaA
[3]: https://azure.microsoft.com/en-us/blog/process-more-files-than-ever-and-use-parquet-with-azure-data-lake-analytics/
[4]: https://www.microsoft.com/en-us/research/blog/microsoft-unveils-faster-key-value-store-large-state-management/
[5]: https://www.infoq.com/presentations/ml-dl-visualization
[6]: https://blogs.msdn.microsoft.com/dotnet/2018/06/05/announcing-ml-net-0-2/
[7]: https://github.com/dotnet/machinelearning/tree/master/test/Microsoft.ML.Tests
[8]: https://databricks.com/blog/2018/06/05/introducing-mlflow-an-open-source-machine-learning-platform.html
[9]: https://www.infoq.com/presentations/booking-dl-models
[10]: https://blogs.technet.microsoft.com/machinelearning/2018/06/04/free-e-book-a-developers-guide-to-building-ai-applications/
