---
type: post
layout: "post"
title: Interesting Stuff - Week 26, 2021
author: nielsb
date: 2021-06-27T09:21:01+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - databricks
  - delta lake
  - lakehouse
  - Kafka
  - data mesh
description: Kafka in Data Mesh Architecture, Delta Lake Book, Geospatial & Azure Data Explorer, and other interesting topics!
keywords:
  - databricks
  - delta lake
  - lakehouse
  - Kafka
  - data mesh   
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

This blog-post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Machine Learning / AI

* [Need for Data-centric ML Platforms][1]. When we do ML projects, it comes naturally to have a model-centric approach to the project. This Databricks blog post argues that having a data-centric view increases the chances for success. Very interesting! 

## Big Data

* [Azure Data Explorer and the Kusto Query Language][2]. This blog post is part one of a two-part series looking at Azure Data Explorer (ADX) and Kusto; its query language. This post introduces ADX and looks briefly into what you can do with Kusto. After having read this post, I look forward to part two!
* [Update on geospatial functions][4]. In last weeks [roundup][3], I mentioned a post about geospatial functions in Apache Pinot. The post I link to is also about geospatial functions, but this time in Azure Data Explorer. Man, you can do some cool stuff with geospatial queries!
* [Get Your Free Copy of Delta Lake: The Definitive Guide (Early Release)][5]. Databricks has for a long time been talking about the Lakehouse architecture and how their Delta Lake table format can help create Lakehouses. This post announces the first book about Delta Lake and Lakehouses. I have already downloaded the book, and I suggest you do the same. 

## Streaming / Data Architecture

* [Saxo Bank's Best Practices for a Distributed Domain-Driven Architecture Founded on the Data Mesh][6]. I have covered posts about the Data Mesh in quite a few previous roundups, and this post is another one around data meshes. It looks at how Saxo Bank in Denmark has moved to a domain-driven data architecture with Kafka as an integral part and the lessons learned/best practices. The post also contains very, very useful references! The post is a must-read if you are interested in data architecture!

## WIND (What Is Niels Doing)

![](/images/posts/Neils_Berglund_IAmSpeaking.jpg)

**Figure 1:** *I Am Speaking*

As I mentioned in the [roundup][7] for week 24, I am speaking about Apache Kafka and Azure Data Explorer at the [**2021 Data Platform Summit**][8]. So right now, I am researching and prepping for that.

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

[1]: https://databricks.com/blog/2021/06/23/need-for-data-centric-ml-platforms.html
[2]: https://www.sqlshack.com/azure-data-explorer-and-the-kusto-query-language/
[3]: {{< relref "2021-06-20-interesting-stuff---week-25-2021.md" >}}
[4]: https://techcommunity.microsoft.com/t5/azure-data-explorer/update-on-geospatial-functions/ba-p/2446350
[5]: https://databricks.com/blog/2021/06/22/get-your-free-copy-of-delta-lake-the-definitive-guide-early-release.html
[6]: https://www.confluent.io/blog/distributed-domain-driven-architecture-data-mesh-best-practices/
[7]: {{< relref "2021-06-13-interesting-stuff---week-24-2021.md" >}}
[8]: https://dataplatformgeeks.com/dps2021/
