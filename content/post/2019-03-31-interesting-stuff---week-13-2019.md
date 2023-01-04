---
type: post
layout: "post"
title: Interesting Stuff - Week 13, 2019
author: nielsb
date: 2019-03-31T08:43:04+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server 2019
  - Kafka
  - KSQL
  - SQL Server 2019 Big Data Clusters 
description: Kafka, KSQL, SQL Server 2019 Big Data Clusters, and other interesting topics.
keywords: 
  - distributed computing
  - SQL Server 2019
  - Kafka
  - KSQL
  - SQL Server 2019 Big Data Clusters    
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

## Distributed Computing

* [Calvin: fast distributed transactions for partitioned database systems][1]. In this white-paper dissection by [Adrian][adcol], he looks at [Calvin][2] which is a transaction scheduling and data replication layer that uses a deterministic ordering guarantee to reduce the high contention costs associated with distributed transactions significantly.

## SQL Server

* [SQL Server 2019 community technology preview 2.4 is now available][3]. What the title says. I downloaded the CTP a couple of days ago, and when I am done with this post, I will install it. Oh, word of warning - if you want to install the **SQL Server 2019 Big Data Cluster**, please remember to uninstall and reinstall `mssqlctl`, so you get the latest version.

## Streaming

* [The Importance of Distributed Tracing for Apache-Kafka-Based Applications][4]. This blog post looks at how to instrument Kafka-based applications with distributed tracing capabilities to make dataflows between event-based components more visible. Very interesting!
* [Consuming Messages Out of Apache Kafka in a Browser][5]. The post covers what the title says; how to consume Kafka messages in a browser.
* [Exploring KSQL Stream-Stream Joins][6]. This is an excellent post by [Robin][rmoff] where he covers KSQL and stream to stream joins! I need to go off and ~~play with~~ research this now!

## WIND (*What Is Niels Doing*)

I am still working on the post about `CREATE EXTERNAL LIBRARY` in the [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) series. Expect it towards the end of this coming week.

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

[1]: https://blog.acolyer.org/2019/03/29/calvin-fast-distributed-transactions-for-partitioned-database-systems/
[2]: https://github.com/yaledb/calvin
[3]: https://cloudblogs.microsoft.com/sqlserver/2019/03/27/sql-server-2019-community-technology-preview-2-4-is-now-available/
[4]: https://www.confluent.io/blog/importance-of-distributed-tracing-for-apache-kafka-based-applications
[5]: https://www.confluent.io/blog/consuming-messages-out-of-apache-kafka-in-a-browser/2
[6]: https://rmoff.net/2019/03/28/exploring-ksql-stream-stream-joins/