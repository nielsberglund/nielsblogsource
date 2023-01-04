---
type: post
layout: "post"
title: Interesting Stuff - Week 29, 2019
author: nielsb
date: 2019-07-21T06:16:02+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - SQL Server 2019
  - machine learning
  - Kafka
  - Java
description: Push data to Kafka from SQL Server, data architecture and data architects, plus other interesting topics.
keywords:
  - data science
  - SQL Server 2019
  - machine learning
  - Kafka
  - Java   
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

## Data Science / Machine Learning

* [Announcing ML.NET 1.2 and Model Builder updates (Machine Learning for .NET)][1]. So, [ML.NET][2] has come a long way since its inception, and I have covered it on and off in these roundups during the last year or so. In the linked blog post, Microsoft introduces ML.NET 1.2, with some cool new features. I particularly like the time series support and the updates to Model Builder.

## Misc.

* [Implementing new tech in your company is tougher than you think][3]. The topic of this blog post is close to my heart; getting new technologies into a company. The post talks about some of the "barriers to entry" when it comes to new tech. Well worth a read! 
* [Enterprise Data Architecture][4]. This post is a white paper about data architecture and data architects. It tries to define what data architecture is and what it means to be a data architect. Very interesting!

## SQL Server 2019

* [Set Your SQL Server Data Free with Kafka: Extensibility Framework][5]. In this post by yours truly I look at how we can push data from SQL Server 2019 to Apache Kafka by the use of SQL Server Extensibility Framework, and the Java language extension.

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

[1]: https://devblogs.microsoft.com/dotnet/announcing-ml-net-1-2-and-model-builder-updates-machine-learning-for-net/
[2]: https://dotnet.microsoft.com/apps/machinelearning-ai/ml-dotnet
[3]: https://medium.com/it-dead-inside/implementing-new-tech-in-your-company-is-tougher-than-you-think-e5ff7f887bff
[4]: https://medium.com/@rusty.alderson/enterprise-data-architecture-c5c579b54abe
[5]: {{< relref "2019-07-16-set-your-sql-server-data-free-using-kafka-extensibility-framework.md" >}}
