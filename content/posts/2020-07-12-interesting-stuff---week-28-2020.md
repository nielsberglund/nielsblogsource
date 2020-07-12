---
type: post
layout: "post"
title: Interesting Stuff - Week 28, 2020
author: nielsb
date: 2020-07-12T07:13:58+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - machine learning
  - kafka
  - big data
  - SQL Server
description: Kafka & schema registry, Azure Databricks, Delta Lake, trends in big data, and other interesting topics.
keywords:
  - data science
  - machine learning
  - kafka
  - big data
  - SQL Server   
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

## Machine Learning

* [COVID-19 data analytics and reporting with Azure Databricks and Azure SQL][1]. This post demonstrates the integration between Azure Databricks and Azure SQL to deliver insights and data visualizations using a publicly available COVID-19 dataset. Very interesting!
* [Deep Learning With Apache Spark — Part 1][2]. If you are interested in Apache Spark, then this post is for you. It is the first post in a series on how to do Distributed Deep Learning with Apache Spark. This post looks at the basics of Spark and Deep Learning, plus a little bit more.

## Big Data

* [Why Delta Lake ? How Change Data Capture (CDC) gets benefits from Delta Lake][3]. The post here looks at how the Delta Lake can overcome some of the inherent problems with today's data lakes.
* [5 TRENDS IN BIG DATA AND SQL TO BE EXCITED ABOUT IN 2020][4]. This post summarizes some of the major trends currently occurring in the SQL and data analytics world. It looks at how SQL is becoming more collaborative and open, and how the majority of databases we use are open source or switching to open source.

## Streaming

* [Putting Several Event Types in the Same Topic – Revisited][5]. This post looks at how we can put different event types in the same topic using a new Schema Registry feature introduced in Confluent Platform 5.5: schema references. I wonder whether this changes how we at [Derivco](/derivco) deal with event types and topics?

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
[travw]: https://twitter.com/radtravis
[emilk]: https://twitter.com/IsTheArchitect


[1]: https://techcommunity.microsoft.com/t5/azure-sql-database/covid-19-data-analytics-and-reporting-with-azure-databricks-and/ba-p/1505849
[2]: https://towardsdatascience.com/deep-learning-with-apache-spark-part-1-6d397c16abd
[3]: https://medium.com/swlh/what-is-and-why-delta-lake-how-change-data-capture-cdc-gets-benefits-from-delta-lake-fb177bdab8bc
[4]: https://www.theseattledataguy.com/5-trends-in-big-data-and-sql-to-be-excited-about-in-2020/
[5]: https://www.confluent.io/blog/multiple-event-types-in-the-same-kafka-topic/