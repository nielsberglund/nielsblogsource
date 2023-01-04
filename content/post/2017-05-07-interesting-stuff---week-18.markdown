---
layout: post
title: Interesting Stuff - Week 18
author: nielsb
date: 2017-05-07T21:18:40+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - Microsoft R Server
  - SQL Server R Services
description: In this roundup we talk about SQL Server, SQL Server R Services, Microsoft R Server, and other interesting stuff!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - Microsoft R Server
  - SQL Server R Services   
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

## SQL Server

* [Unsung SQLOS: The SOS_UnfairMutexPair behind CMEMTHREAD waits][1]. [Ewald][ew] has fired up WinDbg to look at the synchronization object behind memory allocations: `SOS_UnfairMutexPair`. Very, very interesting if you are into SQL Server's plumbing.
* [Creating Self Building SQL Server Data Tools Pipelines Using Jenkins and GIT][2]. Interesting article how to create a self-building SQL Server pipeline. Or more accurately, for SQL Server Data Tools projects. 
* [SQLskills SQL101: Query plans based on what’s in memory][3]. Paul Randal from [SQLskills][sqsk] posts about the SQL Server query optimizer doesn’t or care what’s in the buffer pool when creating a query plan.

## Streaming

* [Corfu: A distributed shared log][4]. [Adrian Colyer][mp] covers **Corfu**, which is a global log which clients can append-to and read-from over a network. It seems like a cross between **Kafka** and an in-memory database.

## Distributed Computing

* [In-memory Caching: Curb Tail Latency with Pelikan][5]. A presentation about **Pelikan** - a framework to implement distributed caches such as Memcached and Redis.

## Data Science

* [End-to-End Scenarios Enabled by the Data Science Virtual Machine: Webinar Video][6]. Blog-post pointing to a webinar about end-to-end scenarios you can do with the **Microsoft Data Science Virtual Machine** (DSVM). I really need to find some time and do some work with DSVM.
* [rxExecBy Insights on RxSpark Compute Context][7]. `rxExecBy` is a function introduced in Microsoft R Server 9.1. It can be used to partition input data source by keys and apply user defined function on individual partitions. It comes in very handy when you have huge datasets - you can partition the dataset into many small partitions and train models on each partition. The blog-post shows examples of how it can be used on Spark.
* [Performance: rxExecBy vs gapply on Spark][8]. Above I pointed to a blog-post about `rxExecBy`. This post compares performance of `rxExecBy` and `gapply`.
* [Real-time scoring with Microsoft R Server 9.1][9]. A blog-post by [Revolution Analytics][re], discussing how you can do real-time scoring using Microsoft R Server 9.1.

## Shameless Self Promotion

* [Microsoft SQL Server R Services - Internals V][si5]. I finally managed to finish the [Internals - V][si5] post. In this post I cover how parallelism works in SQL Server R Services.


That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: http://sqlonice.com/unsung-sqlos-the-sos_unfairmutexpair-behind-cmemthread-waits/
[2]: https://chrisadkin.io/2017/04/25/creating-self-building-sql-server-data-tools-pipelines-using-jenkins-and-git/
[3]: https://www.sqlskills.com/blogs/paul/sqlskills-sql101-query-plans-based-on-whats-in-memory/
[4]: https://blog.acolyer.org/2017/05/02/corfu-a-distributed-shared-log/
[5]: https://www.infoq.com/presentations/pelikan-distributed-caching
[6]: https://blogs.technet.microsoft.com/machinelearning/2017/05/02/end-to-end-scenarios-enabled-by-the-data-science-virtual-machine-video/
[7]: https://blogs.msdn.microsoft.com/rserver/2017/05/04/rxexecby-insights-on-rxspark-compute-context/
[8]: https://blogs.msdn.microsoft.com/rserver/2017/05/04/performance-rxexecby-vs-gapply-on-spark/
[9]: http://blog.revolutionanalytics.com/2017/05/real-time-scoring-with-mrs-91.html
[si5]: {{< relref "2017-05-01-microsoft-sql-server-r-services---internals-v.markdown" >}}
