---
layout: post
title: Interesting Stuff - Week 22
author: nielsb
date: 2018-06-03T09:41:05+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Microsoft Machine Learning Server
  - R
  - Python
  - Kafka
  - SQL Server 2017 CU7
description: Kafka, event driven architectures, books, how to fix R issues after applying CU7, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Microsoft Machine Learning Server
  - R
  - Python
  - Kafka
  - SQL Server 2017 CU7  
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

* [CRDTs and the Quest for Distributed Consistency][1]. An [InfoQ][iq] presentation by [Martin Kleppmann][mklep] where he talks about how to ensure data consistency in distributed systems, especially in systems that don't have an authoritative leader. Very interesting! Oh, and if you have not read Martin's book [Designing Data Intensive Applications][2], shame on you - it is a **MUST** read for anyone wanting to build scalable applications!
* [Actors or Not: Async Event Architectures][3]. A presentation, discussing two approaches to an asynchronous event-based architecture. The first is a "classic" style, protocol. The second is an actor-based approach. 
* [Lambda Architectures: a Snapshot, a Stream, & a Bunch of Deltas][4]. This link points to yet another [InfoQ][iq] presentation. The presentation is about how event-sourced architectures can allow core services to reliably be able to share their information with other services asynchronously. 
* [Book: Building Evolutionary Architectures][5]. Some notes by [Matt Davey] about the book [Building Evolutionary Architectures][6]. Need to get this book! Also, you really should follow [Matt's blog][mdaveyblog]

## .NET

* [Announcing .NET Core 2.1][7]. I guess the title of the blog post says it all, the release of .NET Core 2.1!

## Streaming

* [JMX Metrics in Kafka Connect][8]. It cannot be a weekly roundup without at least one link to something Kafka related. This post is about how to use [JMX][9] to monitor Kafka Connect.

## Data Science

* [Native scoring in SQL Server 2017 using R][10]. One of the things I wanted to write about related to **SQL Server Machine Learning Services** is how you do predictions. [Tomaz][tomaz] beat me to it with this interesting post.  
* [How to operationalize Keras models in Microsoft Machine Learning Server][11]. This post talks about how to operationalize Keras models as web services in R and Python in **Microsoft Machine Learning Server**.

## SQL Server Machine Learning Services

* [SQL Server Machine Learning Services and SQL Server 2017 CU7][cu7]. I was busy writing the follow-up post to my [sp_execute_external_script and SQL Compute Context - I][ctx1] post from two weeks ago when, all of a sudden, I could not execute R code. I had applied **SQL Server 2017 CU7** a couple of days before and it seems it "messed" with some permissions. So this post details how I fixed it.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/


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



[series]: <> (/series/sql_server_2k16_r_services)

[ctx1]: {{< relref "2018-05-20-sp-execute-external-script-and-sql-compute-context.markdown" >}}
[cu7]: {{< relref "2018-06-01-sql-server-machine-learning-services-and-sql-server-2017-cu-7.markdown" >}}

[1]: https://www.infoq.com/presentations/crdt-distributed-consistency
[2]: http://dataintensive.net/
[3]: https://www.infoq.com/presentations/async-event-arch
[4]: https://www.infoq.com/presentations/lambda-streams-delta
[5]: https://mdavey.wordpress.com/2018/05/28/book-building-evolutionary-architectures/
[6]: https://www.thoughtworks.com/books/building-evolutionary-architectures
[7]: https://blogs.msdn.microsoft.com/dotnet/2018/05/30/announcing-net-core-2-1/
[8]: https://engineering.skybettingandgaming.com/2018/05/26/jmx-metrics-kafka-connect/
[9]: https://docs.oracle.com/cd/E28280_01/web.1111/e13729/understanding.htm#JMXPG114
[10]: https://tomaztsql.wordpress.com/2018/05/28/native-scoring-in-sql-server-2017-using-r/
[11]: https://blogs.msdn.microsoft.com/mlserver/2018/05/25/how-to-operationalize-keras-models-in-microsoft-machine-learning-server/
