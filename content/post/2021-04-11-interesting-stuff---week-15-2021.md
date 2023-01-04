---
type: post
layout: "post"
title: Interesting Stuff - Week 15, 2021
author: nielsb
date: 2021-04-11T10:05:00+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server 2019 Big Data Cluster
  - data architecture
  - Kafka
  - Apache Pinot
description: Kafka & data quality, upserts in Apache Pinot, SQL Server 2019 Big Data Cluster CU10, and other interesting topics.
keywords:
  - SQL Server 2019 Big Data Cluster
  - data architecture
  - Kafka
  - Apache Pinot   
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

## SQL Server 2019 Big Data Cluster

* [What's new with SQL Server Big Data Clusters—CU10 release][1]. This post announces the release of SQL Server 2019 Big Data Cluster CU10 and some of the new and improved functionality. As soon as I have time, I will install it and "take it for a ride".

## Data Architecture

* [Data Discovery: The Future of Data Catalogs for Data Lakes][2]. The post linked to here discusses how we can prevent our data lakes from becoming data swamps. The key to this is data discovery and data catalogs. I like this post, and it has given me a lot to think about.

## Streaming

* [Introduction to Upserts in Apache Pinot][3]. In version 0.6 of Apache Pinot, a new feature was made available for stream ingestion, allowing you to upsert events from an immutable log. You may be familiar with upserts from the database world, however in Apache Pinot, an upsert is somewhat different than what you have in a database, and this post looks at what it is and why it is exciting.
* [Integrating whylogs into your Kafka ML Pipeline][4]. WhyLogs is an open-source data quality library that uses advanced data science statistics to log and monitor data used in AI/ML applications. This blog post looks at how we can integrate WhyLogs in Kafka to evaluate, monitor and detect statistical anomalies in streaming data. This is very interesting!

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
[netflx]: https://netflixtechblog.com/

[1]: https://cloudblogs.microsoft.com/sqlserver/2021/04/07/whats-new-with-sql-server-big-data-clusters-cu10-release/
[2]: https://towardsdatascience.com/data-discovery-the-future-of-data-catalogs-for-data-lakes-7b50e2e8cb28
[3]: https://medium.com/apache-pinot-developer-blog/introduction-to-upserts-in-apache-pinot-987c12149d93
[4]: https://whylabs.ai/blog/posts/integrating-whylogs-into-your-kafka-ml-pipeline
