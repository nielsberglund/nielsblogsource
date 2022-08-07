---
type: post
layout: "post"
title: Interesting Stuff - Week 31, 2022
author: nielsb
date: 2022-08-07T09:39:14+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Azure Data Explorer
  - deep learning
  - Azure
  - data mesh
  - kafka
description: Kafka & modernizing databases, build a data mesh on Azure, Netflix data mesh, and other interesting topics.
keywords:
  - Azure Data Explorer
  - deep learning
  - Azure
  - data mesh
  - kafka   
---

![](/images/posts/deep-learning.jpg)

**<p style="text-align: center;">Deep Learning</p>**

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

## Azure Data Explorer

* [Use fresh and unlimited volume of ADX data (Kusto) from your favorite analytic tool - Excel pivot][1]. For a while, Excel has had the ability to query data in **Azure Data Explorer** - yay! The slightly negative aspect of this was that typically data in ADX is counted in billions, and to query the data in Excel, you had to bring the data into Excel first - goodbye memory! The post linked to looks at a way to query ADX data in real-time without importing any data and without any volume limitations.

## Data Science / Machine Learning / AI

* [6 Papers Every Modern Data Scientist Must Read][2]. This post brings up a point which is very dear to me - that to be on top of your chosen technologies, you need to understand the foundation and building blocks of said technologies. Anyway, the technology referred to in this post is deep learning, and the post lists white papers covering some of the most essential modern fundamentals of Deep Learning everyone in the field show be familiar with.

## Data Architecture / Big Data

* [Building a Data Mesh Architecture in Azure – Part 13 – How To Organise Data Domains In Practice][3]. This post is part of a series on how to build a Data Mesh on Azure. As the post's subtitle implies, this "episode" looks at data domains. Use [this link][4] if you are interested in reading more in this series. As a side note - there has been quite a debate ([link here][5]) around this implementation vs. the original data mesh "principles" as outlined by Zhamak Dehghani [here][6].
* [Announcing the Preview of Serverless Compute for Databricks SQL on Azure Databricks][7]. Databricks SQL is a serverless data warehouse on the Databricks Lakehouse Platform. It was initially previewed in late 2020, and this post announces the public preview on Azure. We at [Derivco](/derivco) have been waiting for this!

## Streaming

* [Getting Started with Database Modernization][8]. Before you read the post linked to, I suggest you read [Accelerate Cloud Database Modernizations and Migrations with Confluent][9], which starts looking at the journey to easily migrate data to any cloud database for real-time data streaming, integration, and analytics. I suggest you read that post before this because this post builds on that one and looks at the steps you need to take to get started on your database modernization journey.
* [Data Mesh — A Data Movement and Processing Platform @ Netflix][10]. Another post about Data Mesh, but in this case, the Data Mesh is not what we would think it is, i.e. what's mentioned above. Data Mesh is the Netflix Data Mesh, a fully managed streaming data pipeline product. The Data Mesh was introduced around a year ago. Since then, it has evolved, and this post is the first in a series covering different aspects of Data Mesh and lessons learned throughout the journey.

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

[1]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/use-fresh-and-unlimited-volume-of-adx-data-kusto-from-your/ba-p/3588894
[2]: https://towardsdatascience.com/6-papers-every-modern-data-scientist-must-read-1d0e708becd
[3]: https://mrpaulandrew.com/2022/08/01/building-a-data-mesh-architecture-in-azure-part-13-how-to-organise-data-domains-in-practice/
[4]: https://mrpaulandrew.com/tag/data-mesh-vs-azure/
[5]: https://www.linkedin.com/feed/update/urn:li:activity:6919930275212726272/
[6]: https://martinfowler.com/articles/data-mesh-principles.html
[7]: https://www.databricks.com/blog/2022/08/03/announcing-the-preview-of-serverless-compute-for-databricks-sql-on-azure-databricks.html
[8]: https://www.confluent.io/blog/database-modernization-integrate-data-with-any-cloud/
[9]: https://www.confluent.io/blog/cloud-data-migrations-database-modernization-with-confluent/
[10]: https://netflixtechblog.com/data-mesh-a-data-movement-and-processing-platform-netflix-1288bcab2873