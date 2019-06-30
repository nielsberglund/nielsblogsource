---
layout: post
title: Interesting Stuff - Week 16
author: nielsb
date: 2018-04-22T16:45:06+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - Azure
  - Azure Machine Learning
  - Azure Data Lake Store
  - Azure Data Lake Analytics
  - Azure Data Factory
  - SQLCLR
  - kafka
  - KSQL
  - .NET Core 2.1
description: Confluent Platform 4.1 and KSQL in Kafka, cool SQLCLR things, .NET Core 2.1, Azure Global Boot Camp and other cool stuff!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - Azure
  - Azure Machine Learning
  - Azure Data Lake Store
  - Azure Data Lake Analytics
  - Azure Data Factory
  - SQLCLR
  - kafka
  - KSQL
  - .NET Core 2.1  
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

## SQL Server

* [Calling Http endpoints in T-SQL using CURL extension][1]. Seeing that I think SQLCLR is the best thing (almost) since sliced bread, it is cool to read this blog-post by [Jovan][jovpop] about how you can use `CURL` from SQLCLR. I do however have a couple of comments about the post, but I will save them for a post of my own.

## Distributed Computing

* [Managing Data in Microservices][2]. An article based on a presentation at QCon in San Francisco 2017. The article is about how to separate out monolithic databases into individual data sources for microservices.  

## .NET

* [Performance Improvements in .NET Core 2.1][3]. .NET Core 2.1 is about to be released, and this post looks at some of the performance improvements in this release.

## Streaming

* [Confluent Platform 4.1 with Production-Ready KSQL Now Available][4]. This post announces the release of **Confluent Platform 4.1**. The BIG thing (for me) is the inclusion of KSQL: the ability to write SQL queries against the event data in Kafka. Very, very cool!

## Big Data

* [Iterative development and debugging using Data Factory][5]. A blog post about how **Azure Data Factory** now allows you to do debugging of your data pipelines.

## Azure Global Boot Camp 2018

Yesterday, April 21 2018, all Azure communities came together again in the sixth great [Global Azure Bootcamp][6] event! In Durban, we had a great event arranged by, a fellow MVP, [Lawrance Reddy][lawr]. The turnout was really good, and everyone seemed to have had a great time. Yours truly presented two talks (the links are for the slide decks):

* [Azure Machine Learning Labs with Ninja Niels](/downloads/presentations/azureglobalbootcamp_2k18/azure_ml.pdf). Don't blame me for the title, [Lawrance][lawr] insisted. Anyway, this talk was a gentle introduction to Azure Machine Learning and Azure Machine Learning Studio.
* [Go Big or Go Home: Big Data Analytics & Azure Data Lake](/downloads/presentations/azureglobalbootcamp_2k18/azure_datalake.pdf). This presentation was a short introduction to Azure Data Lake Store and Azure Data Lake Analytics.

If you download the slide decks from the links above, do not expect to get much out of them. The slides were there for background information, and most of the talks were demos.

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
[lawr]: https://twitter.com/bytezn


[1]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2018/04/17/calling-http-endpoints-in-t-sql-using-curl-extension/
[2]: https://www.infoq.com/articles/managing-data-microservices
[3]: https://blogs.msdn.microsoft.com/dotnet/2018/04/18/performance-improvements-in-net-core-2-1/
[4]: https://www.confluent.io/blog/confluent-platform-4-1-with-production-ready-ksql-now-available/
[5]: https://azure.microsoft.com/en-us/blog/iteratively-develop-and-debug-your-etl-elt-workflows-using-data-factory/
[6]: https://global.azurebootcamp.net/
