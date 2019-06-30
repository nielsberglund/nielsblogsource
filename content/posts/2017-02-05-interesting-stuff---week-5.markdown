---
layout: post
title: Interesting Stuff - Week 5
author: nielsb
date: 2017-02-05T09:58:12+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - streaming
  - kafka
  - R
  - SQL Server on Linux
  - Azure Stream Analytics
  - managed data
description: Weekly roundup of interesting "stuff" I have read on blogs etc.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - streaming
  - kafka
  - R
  - SQL Server on Linux
  - Azure Stream Analytics
  - managed data
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, this week. 

<!--more-->

## Distributed Computing

* [Life Beyond Distributed Transactions][2]. An excellent piece about distributed transactions in large scale systems. As a side note; the [queue.acm.org][3] is a goldmine if you are interested in enterprise computing related papers.
* [How Uber Manages a Million Writes Per Second Using Mesos and Cassandra Across Multiple Datacenter][4]. Very interesting post about how Uber has designed their systems.
* [The Infrastructure Behind Twitter: Scaling Networking, Storage and Provisioning][5]. Similar to the post above, but this time about Twitter. Some interesting takeaways:
    * There is no such a thing as a “temporary change or workaround”. In most cases, workarounds are technical debt.
    * Architect beyond the original specifications and requirements.

## Data Science

* [Real Time Credit Card Fraud Detection with Apache Spark and Event Streaming][6]. A post how you how to build a real time solution for credit card fraud detection.
* [Introduction to Machine Learning with Python][7]. First part in a series about [machine learning][8].
* [THE YEAR IN SQL ENGINES][9]. So this is not about relational databases, but a roundup of various sql engines for data science and big data.
* [fst: Fast serialization of R data frames][10]. A new R package for serialization of data.
* [A look back at the year in R and Microsoft][11]. Looking at what happened in 2016 in R and Microsoft (related to machine learning).

## Streaming

* [Streaming Live Data and the Hadoop Ecosystem][12]. A very interesting presentation about Hadoop and streaming of data in Hadoop.
* [New in Azure Stream Analytics: Geospatial functions, Custom code and lots more!][13]. Microsoft has just released new features and functionality for [Azure Stream Analytics][14] (ASA). I have played around with the Visual Studio tools for ASA, and it rocks!

## SQL Server

* [JSON data in clustered column store indexes][15]. Jovan has written a really nice post how Clustered Column Store indexes can give you compression and query performance benefits for JSON data store in SQL Server.
* [How to determine what causes a particular wait type][16]. A post by Paul Randal from 2014 about how to find out when and why **wait types** occur. 

Finally two more posts by Bob Dorr about SQL Server and Linux:

* [SQL Server on Linux: An LLDB Debugging Tale][18]. What Microsoft did in order to be able to debug SQL Server running on Linux.
* [SQL Server on Linux: Scatter/Gather == Vectored I/O][19]. How scatter/gather are done on Linux.

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[de]: (/derivco)
[1]: https://blog.acolyer.org
[2]: http://queue.acm.org/detail.cfm?id=3025012
[3]: http://queue.acm.org/
[4]: http://highscalability.com/blog/2016/9/28/how-uber-manages-a-million-writes-per-second-using-mesos-and.html
[5]: https://www.infoq.com/news/2017/01/scaling-twitter-infrastructure
[6]: https://www.mapr.com/blog/real-time-credit-card-fraud-detection-apache-spark-and-event-streaming
[7]: https://www.infoq.com/articles/ml-intro-python
[8]: https://www.infoq.com/introduction-machine-learning
[9]: https://thomaswdinsmore.com/2017/02/01/year-in-sql-engines/
[10]: http://blog.revolutionanalytics.com/2017/02/fst-fast-serialization-of-r-data-frames.html
[11]: http://blog.revolutionanalytics.com/2017/02/the-year-in-r.html
[12]: https://www.infoq.com/presentations/streaming-hadoop
[13]: https://azure.microsoft.com/en-us/blog/new-in-azure-stream-analytics-geospatial-functions-custom-code-and-lots-more/
[14]: https://azure.microsoft.com/en-us/services/stream-analytics/
[15]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/02/02/json-data-in-clustered-column-store-indexes/
[16]: http://www.sqlskills.com/blogs/paul/determine-causes-particular-wait-type/
[17]: http://www.sqlskills.com/blogs/paul/what-are-logmgr_reserve_append-waits/
[18]: https://blogs.msdn.microsoft.com/bobsql/2017/01/29/sql-server-on-linux-an-lldb-debugging-tale/
[19]: https://blogs.msdn.microsoft.com/bobsql/2017/01/31/sql-server-on-linux-scattergather-vectored-io/
