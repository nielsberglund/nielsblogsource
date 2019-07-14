---
type: post
layout: "post"
title: Interesting Stuff - Week 28, 2019
author: nielsb
date: 2019-07-14T19:32:15+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server
  - Kafka
  - KSQL
  - Kafka Streams
description: Kafka, managed SQL Server in the cloud, KSQL training, and other interesting topics.
keywords:
  - SQL Server
  - Kafka
  - KSQL
  - Kafka Streams   
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

* [Check out what’s new in June 2019 version of Azure SQL Database managed instance][1]. A blog post from Microsoft, looking at new features and functionality in Azure Managed SQL Server. What is especially cool is that it is available in the South African data-centers, yay!

## Streaming

* [Deploying Kafka Streams and KSQL with Gradle – Part 3: KSQL User-Defined Functions and Kafka Streams][2]. This blog post is the third part in a series about using Gradle to deploy Kafka Streams and KSQL queries. This post covers using Gradle to build and deploy KSQL user-defined functions (UDFs) and Kafka Streams microservices.
* [KSQL Training for Hands-On Learning][3]. This is a "short and sweet" post discussing a new Udemy KSQL course. The post also contains a link to a special offer for the course: only USD 9.99! I had a quick look and signed up on the spot!

## WIND (What Is Niels Doing)

Stay tuned for the first post in a series looking at how to get data out of SQL Server, and into a streaming world. I am doing the last "bits and pieces" on it, and I should be able to publish in a day or two. In the meantime, here are some posts that give you background to the new post:

* [Microsoft SQL Server R Services: sp_execute_external_script - I][sext1] - When calling out to R/Python/Java you do it from a specific procedure: `sp_execute_external_script`. This is the first post of three looking at `sp_execute_external_script`.
* [Microsoft SQL Server R Services - sp_execute_external_script - II][sext2] - The second post about `sp_execute_external_script`. 
* [Microsoft SQL Server R Services: sp_execute_external_script - III][sext3]  - The third post about `sp_execute_external_script`.
* [SQL Server 2019 Extensibility Framework & Java](/s2k19_ext_framework_java) - A series of posts discussing how to write Java code so we can call it from SQL server.

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

[sext1]: {{< relref "2018-03-07-microsoft-sql-server-r-services-sp_execute_external_script-I.markdown" >}}
[sext2]: {{< relref "2018-03-11-microsoft-sql-server-r-services---sp-execute-external-script---ii.markdown" >}}
[sext3]: {{< relref "2018-03-21-microsoft-sql-server-r-services---sp-execute-external-script---iii.markdown" >}}

[1]: https://techcommunity.microsoft.com/t5/Azure-SQL-Database/Check-out-what-s-new-in-June-2019-version-of-Azure-SQL-Database/ba-p/742054
[2]: https://www.confluent.io/blog/deploying-kafka-streams-and-ksql-with-gradle-part-3-ksql-user-defined-functions-and-kafka-streams
[3]: https://www.confluent.io/blog/ksql-training-for-hands-on-learning