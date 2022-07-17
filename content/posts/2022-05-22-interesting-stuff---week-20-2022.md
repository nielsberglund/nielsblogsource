---
type: post
layout: "post"
title: Interesting Stuff - Week 20, 2022
author: nielsb
date: 2022-05-22T10:40:58+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - Confluent Cloud
  - Databricks
description: Kafka & Confluent Cloud with Databricks, streaming analytics with Delta Live tables & Databricks SQL, and other interesting topics!
keywords:
  - Kafka
  - Confluent Cloud
  - Databricks  
---

![](/images/posts/warehouse.png)

**Warehouse** *Photo by <a href="https://unsplash.com/@jezar?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Jezael Melgoza</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>*

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

## Misc.

* [Five Simple Steps for Implementing a Star Schema in Databricks With Delta Lake][2]. At [Derivco](/derivco), we are starting to implement Databricks and Delta Live tables. This post, looking at simple tips and tricks for getting the best performance from Delta Lake star schema databases used in data warehouses and data marts, comes therefore at the right time.

## Streaming

* [How I Built A Streaming Analytics App With SQL and Delta Live Tables][1]. In this post, the author describes how easy it is to build a production-ready streaming analytics application with Delta Live Tables and Databricks SQL.
* [Build Scalable Real-time Applications on the Lakehouse Using Confluent & Databricks, Part 2][3]. In this post, which is a continuation of [the post here][4], you learn more about the Confluent Connector for Databricks, streamlining the creation of real-time apps in AWS for data analytics use cases. Even though the examples use AWS, you can easily do this in Azure as well.

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

[1]: https://databricks.com/blog/2022/05/19/how-i-built-a-streaming-analytics-app-with-sql-and-delta-live-tables.html
[2]: https://databricks.com/blog/2022/05/20/five-simple-steps-for-implementing-a-star-schema-in-databricks-with-delta-lake.html
[3]: https://databricks.com/blog/2022/05/17/build-scalable-real-time-applications-on-the-lakehouse-using-confluent-databricks-part-2.html
[4]: https://databricks.com/blog/2022/01/13/confluent-streaming-for-databricks-build-scalable-real-time-applications-on-the-lakehouse.html