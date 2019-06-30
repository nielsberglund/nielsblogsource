---
layout: post
title: Interesting Stuff - Week 14
author: nielsb
date: 2018-04-08T16:04:25+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - Azure Global Bootcamp
  - Azure DataBricks
  - Azure Data Lake
  - SQL Server Machine Learning Services
  - Kubernetes
description: A look at PerfView, time series forecasting, Azure DataBricks and Data Lake, Azure Global Boot-Camp and some other interesting things.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - Azure Global Bootcamp
  - Azure DataBricks
  - Azure Data Lake
  - SQL Server Machine Learning Services
  - Kubernetes   
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

* [Reverse engineering the Notability file format][1]. I came across [Julia][jue]'s blog a couple of weeks ago, and it is awesome for a tech-nerd like myself. This particular post "speaks" to me after my [**Internals**][si1] posts where I to a small extent reversed engineered how SQL Server R Services works.

## .NET

* [PerfView: The Ultimate .NET Performance Tool][2]. An [InfoQ][iq] presentation about **PerfView**. PerfView is an open source tool for .NET performance diagnosis in production environments. PerfView is ideal if you want to systematically measure and improve CPU time, wall-clock time, and memory usage.

## Streaming

* [What is the best event source for doing pub-sub with AWS Lambda?][3]. In this post, [Yan][yan] compares and contrasts some of the options for implementing messaging patterns such as pub-sub with AWS Lambda (server-less). A very informative read!
* [Streaming: Danny Yuan on Real-Time, Time Series Forecasting @Uber][4]. An [InfoQ][iq] podcast where [Danny Yuan][danny] (Real-time Streaming/Forecasting Lead @Uber) talks about building a real-time streaming platform with a significant focus on forecasting. Awesome quote: *"If you want to start leveraging machine learning, developers just need to start doing."*. This is a must listen!

## Data Science

* [How Booking.com Uses Kubernetes for Machine Learning][5]. Another piece from [InfoQ][iq]. This time an article about how Booking.com scale machine learning (ML) models for recommending destinations and accommodation to their customers using Kubernetes. This post is a must-read!
* [Ingest, prepare, and transform using Azure Databricks and Data Factory][6]. A post about how to, using Azure DataBricks and Azure Data Factory, do ETL/ELT via data pipelines.

## Upcoming Conferences

* [Azure Global Boot-Camp 2018 Durban][7]. On April 21, 2018, all Azure communities will come together once again in the sixth great [Global Azure Bootcamp][8] event! If you are in the Durban area, please join up and come and learn about all things Azure. Here in Durban, [Lawrance][lawr], who is a fellow MVP - but in the Azure space, arranges it. Yours truly presents two talks; one about Azure ML and the other about Azure Data Lake.

## SQL Server Machine Learning Services

* [SQL Server Machine Learning Services and Extended Events][xe]. A couple of weeks there was a post on one of the internal MVP forums discussing SQL Server XEvents. I decided to look into how XEvents worked with SQL Server Machine Learning Services, and this post is what I came up with.

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
[jue]: https://twitter.com/b0rk
[yan]: https://twitter.com/theburningmonk
[danny]: https://twitter.com/g9yuayon
[lawr]: https://twitter.com/bytezn

[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[xe]: {{< relref "2018-04-08-sql-server-machine-learning-services-and-extended-events.markdown" >}}


[1]: https://jvns.ca/blog/2018/03/31/reverse-engineering-notability-format/
[2]: https://www.infoq.com/presentations/perfview-net
[3]: https://theburningmonk.com/2018/04/what-is-the-best-event-source-for-doing-pub-sub-with-aws-lambda/
[4]: https://www.infoq.com/podcasts/Danny-Yuan-uber
[5]: https://www.infoq.com/news/2018/04/booking-kubernetes-machine-learn
[6]: https://azure.microsoft.com/en-us/blog/operationalize-azure-databricks-notebooks-using-data-factory/
[7]: https://www.meetup.com/Azure-Transformation-Labs/events/248443776/
[8]: https://global.azurebootcamp.net/
