---
layout: post
title: Interesting Stuff - Week 19
author: nielsb
date: 2018-05-13T20:09:52+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - kafka
  - Azure Event Hubs
  - Azure Stream Analytics
description: Kafka, kafka and more kafka, Azure Stream Analytics, Azure Event Hubs and Kafka, Uber and machine learning and other interesting things.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - kafka
  - Azure Event Hubs
  - Azure Stream Analytics   
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

* [Crash! Bang! Wallop! Practice makes perfect][1]. A very interesting blog post about how **Sky Betting & Gaming** conducts *Chaos* and *Disaster Recovery* testing.
* [Book Review and Q&A: Microservices and Containers by Parminder Singh Kocher][2]. An [InfoQ][iq] book review of **Microservices and Containers**. The book provides a deep dive into the central concepts, patterns and technologies used to implement modern, highly available, highly scalable cloud-native applications.

## Streaming

* [Level Up Your KSQL][3]. A blog post announcing a video series to skill up on KSQL. This is a must watch if you are interested Kafka!
* [4 new features now available in Azure Stream Analytics][4]. This post announces four new features in Azure Stream Analytics. Of the new features, I am most excited about the `SessionWindow` feature. The `SessionWindow` allows users to filter out periods of time where there is no data. The new feature does this by creating dynamic temporal windows of variable sizes based on the batches of incoming data. 
* [Rounding Up Kafka Summit London 2018][5]. This post is not so much a roundup as an announcement that videos are now available for the recently concluded Kafka 2018 summit. Now I know what to do with all the free time I have - watch Kafka videos!
* [Azure Event Hubs for Kafka Ecosystems in public preview][6]. This is so very exciting! The ability to integrate Kafka with Azure Event Hubs.

## Data Science

* [Introducing ML.NET: Cross-platform, Proven and Open Source Machine Learning Framework][7]. A blog post announcing ML.NET: a cross-platform, open source machine learning framework. ML.NET allows .NET developers to develop their models and infuse custom ML into their applications without prior expertise in developing or tuning machine learning models.
* [Open-Source Machine Learning in Azure][8]. This post by [David][revod] is about a presentation he gave at Microsoft Build 2018 about how you can take your open-source tools and workflows you already use for machine learning and data science and easily transition them to the Azure cloud to take advantage of its capacity and scale.
* [Relationships in Data Analysis][9].  A thought-provoking post about how data analysis is very much dependent upon human relationships.
* [What’s New in Azure Machine Learning?][10]. An [InfoQ][iq] summary from Microsoft Build 2018 about new features in Azure Machine Learning. There are quite a few new cool things coming.
* [Machine Learning Pipeline for Real-time Forecasting @Uber Marketplace][11]. An [InfoQ][iq] presentation where [Danny Yuan]  discusses how Uber is using ML to improve their forecasting models, the architecture of their ML platform and lessons learned running it in production. I got so many cool ideas seeing this presentation.

## Durban Azure User Group

Last Wednesday (May 9) The Durban Azure User Group had its monthly meetup, and I did a presentation:

* [Get Insight Into and Analyze Your Data with Azure EventHubs & Stream Analytics][12]. As the title says, the presentation was bout Azure Event Hubs and Azure Stream Analytics. For you who attended (and everyone else as well), there is a zip file to download [here](/downloads/presentations/azureusergroup/azureusergroup_2018-05-09.zip), which contains the slide deck in pdf format and a text file with various resource links.

## SQL Server Machine Learning Services

I am still working on the post to correct the errors I had in the post; [sp_execute_external_script - III][sext3] in the [SQL Server R Services](/sql_server_2k16_r_services) series. Please, bear with me!

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


[1]: https://engineering.skybettingandgaming.com/2018/05/04/firedrills-in-core/
[2]: https://www.infoq.com/articles/microservices-and-containers-book-review
[3]: https://www.confluent.io/blog/level-up-your-ksql/
[4]: https://azure.microsoft.com/en-us/blog/4-new-features-now-available-in-azure-stream-analytics/
[5]: https://www.confluent.io/blog/rounding-up-kafka-summit-london-2018/
[6]: https://azure.microsoft.com/en-us/blog/azure-event-hubs-for-kafka-ecosystems-in-public-preview/
[7]: https://blogs.msdn.microsoft.com/dotnet/2018/05/07/introducing-ml-net-cross-platform-proven-and-open-source-machine-learning-framework/
[8]: http://blog.revolutionanalytics.com/2018/05/open-source-machine-learning-in-azure.html
[9]: https://simplystatistics.org/2018/04/30/relationships-in-data-analysis/
[10]: https://www.infoq.com/news/2018/05/Azure-Machine-Learning-New
[11]: https://www.infoq.com/presentations/uber-ml-architecture-models
[12]: https://www.meetup.com/Azure-Transformation-Labs/events/250299101

