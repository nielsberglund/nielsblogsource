---
type: post
layout: "post"
title: Interesting Stuff - Christmas, New Year, Week 1, 2021
author: nielsb
date: 2021-01-03T07:20:06+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server
  - SQL Server Machine Learning Services
  - SQL Server 2019 Big Data Cluster
  - Kafka
  - ksqlDB
  - data architecture
  - Python
  - Java
  - R
description: Kafka, ksqlDB, new book about Kafka Streams and ksqlDB, use your own Python in SQL Server, and other interesting topics.
keywords:
  - SQL Server
  - SQL Server Machine Learning Services
  - SQL Server 2019 Big Data Cluster
  - Kafka
  - ksqlDB
  - data architecture
  - Python
  - Java
  - R   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that have been most interesting to me over the Christmas and New Year period 2020, and the first week of 2021.

<!--more-->

## Data Architecture

* [Data Mesh Principles and Logical Architecture][1]. The post here is a follow up to [How to Move Beyond a Monolithic Data Lake to a Distributed Data Mesh][2]. It summarizes the data mesh approach by enumerating its underpinning principles, and the high level logical architecture that the principles drive. If you are into data architecture, you have to read this post!

## Streaming

* [Handling Late Arriving Dimensions Using a Reconciliation Pattern][3]. The blog post linked to here looks at a few use cases of late-arriving dimensions and potential solutions to handle it in Apache Spark pipelines.
* [Introducing the Confluent Parallel Consumer][4]. This blog post looks at a new Kafka consumer client: the [Confluent Parallel Consumer][5]. The post covers why a new consumer client is needed and the use cases for this consumer. Very interesting!
* [Event Streaming with Kafka Streams and ksqlDB][6]. The link here is to the revised new edition of **Kafka Streams in Action**. It has been expanded to cover more of the Kafka platform used for building event-based applications, including full coverage of ksqlDB. I bought it, and you should buy it as well!
* [Announcing ksqlDB 0.14.0][7]. As the title implies, a new version of ksqlDB is out in the wild. This post looks at some of the most notable changes, and new features of this release. Some quite "juicy stuff" in the release! 

## WIND (What Is Niels Doing)

When I went on leave for Christmas, and New Year I said to myself that I had to get some blog-posts out, and for once my plans came together:

* [A Lap Around SQL Server 2019 Big Data Cluster: Architecture][8]. Finally, finally, finally! This post is a follow on from [A Lap Around SQL Server 2019 Big Data Cluster: Background & Technology][9], and it has been in the works for nearly eight months. What can I say? In the post, we look at the architecture of a SQL Server 2019 Big Data Cluster, and the various components of a BDC.
* [Bring Your Own R & Python Runtimes to SQL Server Extensibility Framework][10]. In September 2020, Microsoft [announced][11] that they have open-sourced the R and Python language extensions for SQL Server Machine Learning Services. As a result, we can now bring our own versions of R and Python to SQL Server 2019. In the post linked to I look at how to use a Python runtime with a later version then what is by default shipped in SQL Server Machine Learning Services.

So that's what I have done. 

I am now working on a couple of posts on how to create your own Python language extension from the open-sourced code Microsoft released. Expect something to be out fairly soon. Yeah, yeah, I know - that's what I said about the Big Data Cluster architecture post as well back in April 2020. I guess we'll see.

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


[1]: https://martinfowler.com/articles/data-mesh-principles.html
[2]: https://martinfowler.com/articles/data-monolith-to-mesh.html
[3]: https://databricks.com/blog/2020/12/15/handling-late-arriving-dimensions-using-a-reconciliation-pattern.html
[4]: https://www.confluent.io/blog/introducing-confluent-parallel-message-processing-client/
[5]: https://github.com/confluentinc/parallel-consumer
[6]: https://www.manning.com/books/event-streaming-with-kafka-streams-and-ksqldb
[7]: https://www.confluent.io/blog/ksqldb-0-14-0-features-updates/
[8]: {{< relref "2020-12-21-a-lap-around-sql-server-2019-big-data-cluster-architecture.md" >}} 
[9]: {{< relref "2020-04-26-a-lap-around-sql-server-2019-big-data-cluster.md" >}} 
[10]: {{< relref "2020-12-29-bring-your-own-r--python-runtimes-to-sql-server-extensibility-framework.md" >}}
[11]: https://cloudblogs.microsoft.com/sqlserver/2020/09/24/open-sourcing-the-r-and-python-language-extensions-for-sql-server/
