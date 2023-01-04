---
type: post
layout: "post"
title: Interesting Stuff - Week 27, 2021
author: nielsb
date: 2021-07-04T09:04:04+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - SQL Server Machine Learning Services
  - Kafka
  - ksqlDB
  - KStreams
description: Kafka & foreign-key joins, Saga pattern & .NET, CI/CD of ML models at Uber, and other interesting topics.
keywords:
  - data science
  - SQL Server Machine Learning Services
  - Kafka
  - ksqlDB
  - KStreams   
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

## SQL Server

* [Looking to the future for R in Azure SQL and SQL Server][1]. If you follow my blog, you know that I have written a lot about [SQL Server Machine Learning Services][2] (SQLML) and R in SQL Server throughout the last couple of years. The post linked to lays out the plans for R in SQL Server in upcoming SQL Server versions. The short version of the post is that Microsoft will go away from the proprietary R and Python packages in SQLML in favour of the open-source versions. If you are interested and want more than what is in the post, my good friend [Rafal Lukawiecki][4] has written an [excellent post][3] explaining in detail the changes.

## .NET

* [Implementing distributed transaction in .NET using Saga pattern][5]. One of the biggest issues when moving from a monolithic system to a distributed microservices system is handling transactions. One solution to distributed transactions in a microservices system is using the [Saga][6] pattern. In this post, the author does an excellent job explaining the Saga pattern and how to implement it in .NET.

## Machine Learning

* [Continuous Integration and Deployment for Machine Learning Online Serving and Models][7]. This post from Uber looks at how they implement CI/CD and model serving in their environment. This is a must-read if you are in the ML world!

## Streaming

* [Online, Managed Schema Evolution with ksqlDB Migrations][8]. In the database world, managing changes to the schema is (somewhat) easy. Well, at least you probably have some workflows for that. In the streaming world, it may not be that "straightforward". In this post, the author looks at the tooling available for managing schema evolution in ksqlDB.
* [Eventual Consistency with Spring for Apache Kafka: Part 1 of 2][9]. This post looks at how Spring for Kafka is used to manage a distributed data model across multiple microservices. You find [Part 2 here][10].
* [Crossing the Streams: The New Streaming Foreign-Key Join Feature in Kafka Streams][11]. In relational databases, you more often than not have multiple one-to-many relationships (foreign keys). This is not well supported in KTables and streams in Kafka. At least it was not until Kafka 2.4, where non-key joining between KTables was introduced. The post I link to looks more in detail at how foreign-key joins are implemented in KStreams. This is only available in KStreams, but according to the post, we may expect to see it in the next release of ksqlDB; 0.19 - Yay!

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

[1]: https://cloudblogs.microsoft.com/sqlserver/2021/06/30/looking-to-the-future-for-r-in-azure-sql-and-sql-server/
[2]: https://nielsberglund.com/categories/sql-server-machine-learning-services/
[3]: https://tecflix.com/news/microsoft-open-sources-sql-server-machine-learning-and-discontinues-ml-server
[4]: https://tecflix.com/instructors/rafal-lukawiecki
[5]: https://nemeiskiy-lef.medium.com/implementing-distributed-transaction-in-net-using-saga-pattern-1641172c122
[6]: https://microservices.io/patterns/data/saga.html
[7]: https://eng.uber.com/continuous-integration-deployment-ml/
[8]: https://www.confluent.io/blog/easily-manage-database-migrations-with-evolving-schemas-in-ksqldb/
[9]: https://itnext.io/eventual-consistency-with-spring-for-apache-kafka-cfbbed450b5e
[10]: https://itnext.io/eventual-consistency-with-spring-for-apache-kafka-part-2-of-2-23bedd512ccf
[11]: https://www.confluent.io/blog/data-enrichment-with-kafka-streams-foreign-key-joins/
