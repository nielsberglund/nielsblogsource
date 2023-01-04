---
type: post
layout: "post"
title: Interesting Stuff - Week 27, 2022
author: nielsb
date: 2022-07-10T09:58:43+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - MVP
  - Databricks
  - Delta Lake
  - Azure Data Explorer
  - Kafka
  - Synapse Data Explorer
description: Kafka & ingestion into data lakes, Delta Lake open-sourced, Niels renewed as MVP, and other interesting topics.
keywords:
  - MVP
  - Databricks
  - Delta Lake
  - Azure Data Explorer
  - Kafka
  - Synapse Data Explorer   
---

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

## Data Architecture / Big Data

* [From Data Warehouse to Data Lake to Data Lakehouse][1]. As the title implies, this post looks at Data Warehouses, Data Lakes and Data Lakehouses. It starts with an overview of the different Data Store technologies to see the whole picture and to understand what has changed and what has not. The post then looks at what's for what, what you need, and the advantages and limitations of Data Warehouses, Data Lakes, and Data Lakehouses. Oh, and as a part of the post, the author builds a Data Lakehouse. Very cool!
* [Open Sourcing All of Delta Lake][2]. So, as the title says, Databricks Delta Lake has now been fully open-sourced. This post looks at the reasoning behind it and what it means for the data community going forward.
* [The Data Engineering Pipeline][3]. Data Engineers are at the heart of the engine room of any data-driven company. In this post, the author provides a high-level overview of the Data Engineering Pipeline, including best practices and tools to help drive data-driven organizations.

## Azure Data Explorer

* [Aviation flight data analytics with Azure Synapse platform][4]. This post looks at flight data analytics use cases specific to the aviation industry. The interesting thing for me here is the usage of Synapse Data Explorer, the "brother" of **Azure Data Explorer**. It is fascinating to see how much "cool stuff" can be done with a powerful analytics engine - Synapse Data Explorer - and the query language Kusto!

## Streaming

* [Data Streaming for Data Ingestion into the Data Warehouse and Data Lake][5]. This post is the second in a series exploring concepts, features, and trade-offs of a modern data stack using a data warehouse, data lake, and data streaming together. You find the first part [here][6]. In this post, the author looks at how data streaming technologies are a perfect fit for data ingestion into data warehouses, data lakes, etc. This post came at the precisely right time as we at [Derivco](/derivco) are looking at this (ingestion into data lakes) now.

## WIND (What Is Niels Doing)

In the beginning of July MVP's around the world are on tenterhooks, as it is MVP renewal time: "will I be an MVP for another year?". After the "judgement" you then see the LinkedIn feed be flooded by MVP's posts how happy they are that have been renewed. Last year was a bit silly seeing all the posts, since everyone was renewed automatically, and we knew about it beforehand.

![](/images/posts/mvp-renewal-2022-2.png)

**Figure 1:** *MVP SWAG*

With all that said, as you can see from the picture above, I was renewed! Yay!! 

At the same time of renewal, but entirely independent, I received this:

![](/images/posts/mvp-swag-2022-1.jpg)

**Figure 2:** *MVP SWAG*

Yup, MVP SWAG: hoodie, coffee cup and a Thank You card! Very cool, THANK YOU, Microsoft and the MVP Program!

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

[1]: https://towardsdatascience.com/from-data-warehouse-to-data-lake-to-data-lakehouse-44ca03e0d624
[2]: https://databricks.com/blog/2022/06/30/open-sourcing-all-of-delta-lake.html
[3]: https://pub.towardsai.net/the-data-engineering-pipeline-6f7a306fcfdc
[4]: https://www.linkedin.com/pulse/aviation-flight-data-analytics-azure-synapse-platform-debananda-ghosh/
[5]: https://www.kai-waehner.de/blog/2022/07/05/data-streaming-for-data-ingestion-into-data-warehouse-and-data-lake/
[6]: https://www.kai-waehner.de/blog/2022/06/27/data-warehouse-vs-data-lake-vs-data-streaming-friends-enemies-frenemies/
