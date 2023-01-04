---
type: post
layout: "post"
title: Interesting Stuff - Week 26, 2020
author: nielsb
date: 2020-06-28T10:04:18+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server
  - SQL Server 2019 Big Data Cluster
  - kafka
  - ksqlDB
description: Kafka, ksqlDB, Apache Ignite, Big Data Cluster on Open Shift, and other interesting topics.
keywords:
  - distributed computing
  - SQL Server
  - SQL Server 2019 Big Data Cluster
  - kafka
  - ksqlDB   
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

## SQL Server

* [Apache Spark Connector for SQL Server and Azure SQL is now open source][1]. As the title says, the post announces the open-sourcing of the Spark Connector for SQL Server. From the post: *The Apache Spark Connector for SQL Server and Azure SQL is a high-performance connector that enables you to use transactional data in big data analytics and persists results for ad-hoc queries or reporting. The connector allows you to use any SQL database, on-premises or in the cloud, as an input data source or output data sink for Spark jobs.* This is very, very cool!
* [Expanding SQL Server Big Data Clusters capabilities, now on Red Hat OpenShift][2]. As you probably know, I have an interest in SQL Server 2019 Big Data Cluster. One of the questions that often come up is if one can run it on RedHat OpenShift, and the answer to that has been no, you cannot. That is until now, with the release of SQL Server cumulative update 5, (CU5). The post linked to here discusses it more in detail. Watch this space for a post about how to install the BDC on the RedHat OpenShift platform.

## Distributed Systems

* [Cure your FOMO — what is Apache Ignite in 5 minutes][3]. The post linked to here is about Apache Ignite which is essentially an in-memory data-grid/in-memory cache layer. It looks interesting, and let's see if we can do something with it at [Derivco](/derivco).

## Streaming

* [Announcing ksqlDB 0.10.0][4]. This post discusses the new release of ksqlDB. There are quite a few new interesting features, that I am looking forward to testing! Let us hope they will have a .NET client soon in addition to the Java client.
* [Unifying Streams and State: The Seamless Path to Real-Time][5]. This post and the accompanying video looks at how easy it is to do stream processing applications with Confluent Cloud and ksqlDB. Very cool!

## WIND (What Is Niels Doing)

These are nervous times! No, not because of COVID-19, but something much more serious: it is renewal time for MVP! July first all MVP's will know whether they have been renewed for another year. I have a funny feeling that I haven't done enough, but I guess we'll see on Wednesday! 

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


[1]: https://cloudblogs.microsoft.com/sqlserver/2020/06/22/apache-spark-connector-for-sql-server-and-azure-sql-is-now-open-source/
[2]: https://cloudblogs.microsoft.com/sqlserver/2020/06/23/expanding-sql-server-big-data-clusters-capabilities-now-on-red-hat-openshift/
[3]: https://blog.softwaremill.com/cure-your-fomo-apache-ignite-in-5-minutes-550d84b10ce3
[4]: https://www.confluent.io/blog/ksqldb-0-10-0-latest-features-updates/
[5]: https://www.confluent.io/blog/unifying-streams-and-state-seamless-path-to-real-time/
