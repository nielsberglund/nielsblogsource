---
type: post
layout: "post"
title: Interesting Stuff - Week 44, 2019
author: nielsb
date: 2019-11-03T16:45:41+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server 2019
  - SQL Server Extensibility Framework
  - Kafka  
description: SQL Server 2019 Big Data Cluster, SQL Server 2019 learning resources, Kafka & data pipelines, and other interesting topics.
keywords:
  - distributed computing
  - SQL Server 2019
  - SQL Server Extensibility Framework
  - Kafka    
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

## Database Technology

* [How We Built a Vectorized SQL Engine][1]. This post by [Cockroach Labs][1] discusses how they re-wrote their SQL execution engine to get better performance for analytical type of workloads, (read: queries).

## SQL Server 2019

* [Introducing the SQL Server 2019 video learning series][2]. This post by Microsoft's [Bob Ward][bobw] points to resources for learning more about SQL Server 2019.
* [Unify your data lakes with HDFS tiering in SQL Server Big Data Clusters][4]. What is HDFS tiering in SQL Server Big Data Cluster? Well, this post by [Nellie Gustafsson][nellieg] explains what it is and how to do it. It also has a link to a video about it. Great stuff!
* [SQL Server 2019 & Java: Parameters][5]. My, my: haven't I been a "busy bee". Earlier today I published this post about how to handle parameters between SQL Server 2019 and your Java code.

## Streaming

* [Creating a Real-Time Flight-info Data Pipeline with StreamSets, Kafka, ElasticSearch and Kibana][6]. The title says it all. This is an awesome post about creating data pipelines. It is a must-read!

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
[nellieg]: https://twitter.com/nelliegson

[1]: https://www.cockroachlabs.com/blog/how-we-built-a-vectorized-sql-engine/
[2]: https://www.cockroachlabs.com/
[3]: https://cloudblogs.microsoft.com/sqlserver/2019/10/28/introducing-the-sql-server-2019-video-learning-series/
[4]: https://cloudblogs.microsoft.com/sqlserver/2019/10/31/unify-your-data-lakes-with-hdfs-tiering-in-sql-server-big-data-clusters/
[5]: {{< relref "2019-11-03-sql-server-2019--java-parameters.md" >}}
[6]: https://itnext.io/creating-a-real-time-flight-info-data-pipeline-with-streamsets-kafka-elasticsearch-and-kibana-dc40868c1021
