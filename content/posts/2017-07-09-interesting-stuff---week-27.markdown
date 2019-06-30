---
layout: post
title: Interesting Stuff - Week 27
author: nielsb
date: 2017-07-09T19:15:08+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - Apache Kafka
  - Azure
  - Azure Data Lake
  - Tensorflow
description: Azure data lake, tensorflow, Apache Kafka, read all about this weeks interesting stuff.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - Apache Kafka
  - Azure
  - Azure Data Lake
  - Tensorflow   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, for the week just gone by. 

<!--more-->

## .NET

* [Virtual Panel: High Performance Application in .NET][1]. An [InfoQ][iq] panel discussion about performance in .NET. It's a very interesting read and it led me to the item below.
* [Performance Improvements in .NET Core][2]. As the name says, a look at performance improvements in .NET Core. Having read this post as well as the post above, I'll make sure we'll start to look into .NET Core at [Derivco](/derivco).

## Streaming

* [Exactly-once Support in Apache Kafka][3]. Woooo! This is so cool! A post about exactly-once support in Apache Kafka. I know I have said this before, but ... now we **REALLY** need to start looking at Kafka.

## Cloud

* [Azure Data Lake Store: a hyperscale distributed file service for big data analytics][4]. [Andrew][mp] takes a deep, deep look into the plumbing of Azure Data Lake.
* [Spanner: becoming a SQL system][5]. Another post by [Andrew][mp]. Here he looks into how Google's Spanner becomes more SQL like.
* [Working with the change feed support in Azure Cosmos DB][6]. The Azure Cosmos DB, becomes more and more "juicy"! This is how it supports a real-time feed of changes: the Change Feed Support.

## Data Science

* [In Depth TensorFlow][7]. An [InfoQ][iq] presentation about Google's Tensorflow by one of the developers.
* [Quick Start for Data Science][8]. [Buck Woody][bw] posts a quick introduction to Data Science. A must read for any "budding" data scientist out there.

## SQL Server R Services

I know, I know, I know - I have said this before, but I am nearly finished with part 7 of my [SQL Server R Services][sinst] series. I have had a severe case of writers block for part 7, but 80% of it is done now. I promise!!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[bw]: https://buckwoody.wordpress.com
[1]: https://www.infoq.com/articles/high-performance-dotnet
[2]: https://blogs.msdn.microsoft.com/dotnet/2017/06/07/performance-improvements-in-net-core/
[3]: https://medium.com/@jaykreps/exactly-once-support-in-apache-kafka-55e1fdd0a35f
[4]: https://blog.acolyer.org/2017/07/04/azure-data-lake-store-a-hyperscale-distributed-file-service-for-big-data-analytics/
[5]: https://blog.acolyer.org/2017/07/03/spanner-becoming-a-sql-system/
[6]: https://docs.microsoft.com/en-us/azure/cosmos-db/change-feed
[7]: https://www.infoq.com/presentations/tensorflow-concepts
[8]: https://buckwoody.wordpress.com/2017/07/06/quick-start-for-data-science/
[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
