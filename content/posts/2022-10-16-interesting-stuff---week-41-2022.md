---
type: post
layout: "post"
title: Interesting Stuff - Week 41, 2022
author: nielsb
date: 2022-10-16T11:50:52+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data architecture
  - Azure Data Explorer
  - Azure Synapse Data Explorer
  - Kafka
description: Kafka Confluent & Microsoft, data engineering terminology, load testing Azure Data Explorer, and other interesting topics.
keywords:
  - data architecture
  - Azure Data Explorer
  - Azure Synapse Data Explorer
  - Kafka   
---

![](/images/posts/intelligent-platform.jpg)

**<p style="text-align: center;"><em>Intelligent Platform</em></p>**
**<p style="text-align: center;"><em>Photo by: <a href="https://www.istockphoto.com/portfolio/AndSus"> Andrey Suslov </a> on <a href="https://www.istockphoto.com"> iStock</a> </em></p>**

Throughout the week, I read a lot of blog-posts, articles, and so forth that has to do with things that interest me:

* AI/data science
* data in general
* data architecture
* streaming
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Data Architecture

* [Data Engineering in 2022: Architectures & Terminology][1]. In this post by [Robin Moffat][rmoff], which is part of his [Data Engineering 2022][2] series, he explains some of the terminology in the data engineering field: ETL, ELT, etc. If you are into data (and who isn't), do yourself a favor and read his posts in this series.
* [Data Engineering Annotated Monthly – September 2022][3]. This is a data engineering newsletter I haven't picked up on before. It looks at recent data engineering developments and highlights new ideas from the wider community. Some very interesting links here.

## Azure Data Explorer

* [Evaluate query performance of Azure Data Explorer][4]. This post does what the title says. It looks at and provides guidance on evaluating performance through load testing your ADX cluster. It looks at what to consider when planning the test, the tools to execute the tests, and some load test results.
* [Small Capacity Synapse][5]. The cloud is great and makes things a lot easier when you want to test something. However, creating resource groups and resources can get a bit tedious, especially if you want to try something consisting of multiple components. That's where what is presented in this link comes in. It leads to a GitHub repo which provides you with ready-made scripts to spin up a Synapse environment: the **Small Capacity Synapse** sandbox environment. Awesome!

## Streaming

* [Confluent Featured Among the Initial Wave of Partners for the Microsoft Intelligent Data Platform Partner Ecosystem][6]. Back in May (2022), Microsoft introduced the [**Microsoft Intelligent Data Platform**][7], whose goal is to provide an integrated set of data services unifying databases, analytics, and governance into a seamless experience. To achieve this, Microsoft needs partners from the industry, and since May, Microsoft has been busy signing up partners. This post announces how Confluent is now one of the initial partners in **Microsoft Intelligent Data Platform**. Watch out for great things to come!

## WIND (What Is Niels Doing)

Related to the link above re. Confluent and Microsoft Intelligent Data Platform, I am doing a talk at Confluent's [Data In Motion Tour][8] in Johannesburg October 26.

I will be talking about "Real-time customer experiences with Confluent & Microsoft", a.k.a **The Road to Data in Motion with Confluent & Microsoft**. 

The event is free, so if you are in the area, swing by and say Hi! You register [here][9]. Oh did I say it is free? Yes it is free :smile:!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. Please comment on this post or [ping][ma] me if you have ideas for what to cover.

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
[netflx]: https://netflixtechblog.com/

[1]: https://rmoff.net/2022/10/02/data-engineering-in-2022-architectures-terminology/
[2]: https://rmoff.net/2022/09/14/stretching-my-legs-in-the-data-engineering-ecosystem-in-2022/
[3]: https://blog.jetbrains.com/big-data-tools/2022/10/10/data-engineering-annotated-monthly-september-2022/
[4]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/evaluate-query-performance-of-azure-data-explorer/ba-p/3618005
[5]: https://github.com/jornica/small-capacity-synapse
[6]: https://www.confluent.io/blog-v2/confluent-featured-among-the-initial-wave-of-partners-for-the-Microsoft-Intelligent-Data-Platform-Partner-Ecosystem/
[7]: https://www.microsoft.com/en-us/microsoft-cloud/solutions/intelligent-data-platform
[8]: https://events.confluent.io/datainmotiontour
[9]: https://events.confluent.io/datainmotiontour-johannesburg
