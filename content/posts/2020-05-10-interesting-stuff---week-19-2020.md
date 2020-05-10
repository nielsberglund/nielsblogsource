---
type: post
layout: "post"
title: Interesting Stuff - Week 19, 2020
author: nielsb
date: 2020-05-10T10:16:08+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - big data
  - distributed computing
  - SQL Server
  - Kafka
  - ksqlDB
description: Kafka, ksqlDB, data quality, data lakes, domain driven design, and other interesting topics.
keywords:
  - big data
  - distributed computing
  - SQL Server
  - Kafka
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

* [Announcing mssql-cli is now generally available on macOS and Linux][1]. `mssql-cli` is an open-source and cross-platform command-line tool to manage SQL Server on-prem and on the cloud. It has some cool features such as Intellisense and syntax highlighting. The blog post linked to here announces, among other things, the availability of `mssql-cli` on Linux and Mac. I have used it a bit, and it is quite awesome!

## .NET

* [High Five with .NET 5][2]. This post looks at the upcoming .NET 5 - the successor to .NET Core - and some of the features it brings.

## Domain Driven Design

* [DDD for microservices][3]. The post linked to here is the first post in a series where the author his experience adopting Domain-Driven Design and integrating it into the software development process. This particular post gives an introduction to DDD. I, for one, am looking forward to the upcoming posts.

## Big Data

* [Data Lake — Design For Better Architecture, Storage, Security & Data Governance][4]. This post discusses architecture patterns to follow when designing and building data lakes. Keep your eyes open for follow-up posts looking at practical approaches.
* [Hadoop Distributed File System][5]. I found this post to be an excellent guide helping me understand a bit more about the Hadoop File System, (HDFS). Highly recommended!
* [Monitoring Data Quality at Scale with Statistical Modeling][6]. If you base business decisions on data, you cannot have bad data. This post looks at how Uber monitors data quality by using statistical modelling. I found the post very interesting!
* [Apache YARN & Zookeeper][7]. This post dives down into the components that help with resource allocation and high availability in Hadoop: YARN and Zookeeper.

## Streaming

* [Highly Available, Fault-Tolerant Pull Queries in ksqlDB][8]. This, very informative, blog post looks at how ksqlDB pull queries can be highly available even during server failures.
* [Using Docker to test your Kafka applications][9]. A very cool post looking at how one can use a Java library, `testcontainers-java`, to run integration tests for Kafka based applications. 
* [Is Apache Kafka a Database?][10]. This is a thought-provoking article looking at if Kafka can be considered a database. My thoughts around that are - it depends. It depends on what functionality you expect a database to have. So, to me, I'd say Kafka is close, really close, but I would like to see the ability to do range queries against some other field(s) than the `ROWKEY` field before I consider Kafka a database.

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


[1]: https://cloudblogs.microsoft.com/sqlserver/2020/05/07/announcing-mssql-cli-is-now-generally-available-on-macos-and-linux/
[2]: https://medium.com/maestral-solutions/high-five-with-net-5-cfea40e2c53a
[3]: https://medium.com/@chatuev/ddd-for-microservices-4778a363c071
[4]: https://medium.com/swlh/data-lake-design-for-better-architecture-storage-security-data-governance-16d2a36721ba
[5]: https://towardsdatascience.com/hadoop-distributed-file-system-b09946738555
[6]: https://eng.uber.com/monitoring-data-quality-at-scale/
[7]: https://towardsdatascience.com/apache-yarn-zookeeper-61e17a958215
[8]: https://www.confluent.io/blog/ksqldb-pull-queries-high-availability/
[9]: https://medium.com/@abhishek1987/using-docker-to-test-your-kafka-applications-3057770d736d
[10]: https://medium.com/@megachucky/is-apache-kafka-a-database-ddc310898f5c