---
layout: post
title: Interesting Stuff - Week 44
author: nielsb
date: 2017-11-05T19:16:52+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - kafka
description: Apache Kafka, CockroachDB, .NET, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - kafka  
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

* [PASS Summit 2017 – a personal angle][1]. Where [Ewald][ew] goes to Seattle to attend [PASS 2017][2]. A personal take on the summit, prior to its opening. Entertaining as ever!!
* [In-Memory OLTP Indexes][4]. The first post in a series about in memory indexes in SQL Server. 

## Databases

* [CockroachDB][3]. I don't know about the name, but the technology looks very, very interesting. 

## .NET

* [Modernize existing .NET apps with Windows Containers and Azure][5]. Basically a "plug" for a free e-book. However as the topic is of interest to me, I decided to include it. Plus, the comments are interesting.

## Streaming

* [Apache Kafka Goes 1.0][6]. Yay!! Apache Kafka has reached the 1.0 milestone. This blog-post talks about that, but also all the new improvements in Apache Kafka 1.0.

## Data Science

* [Sentiment analysis with Python in SQL Server Machine Learning Services][7]. This blog post, shows two different ways to implement sentiment analysis in SQL Server using Python and Machine Learning Services. Very cool!!
* [Why Probability Theory Should be Thrown Under the Bus][8]. A blog-post discussing the downside of probability theory. Really, really interesting and thought provoking! 

## SQL Server R Services

* [Microsoft SQL Server R Services - Internals XII][si12]. I managed to get [Internals - XII][si12] out this week. It covers what routines sends the packets from SQL Server to the **SqlSatellite**, and what are some of those packets.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[si12]: {{< relref "2017-10-31-microsoft-sql-server-r-services---internals-xii.markdown" >}}
[1]: https://sqlonice.com/pass-summit-2017/
[2]: http://www.pass.org/summit/2017/Live.aspx
[3]: https://www.cockroachlabs.com/
[4]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/11/02/in-memory-oltp-indexes-part-1-recommendations/
[5]: https://blogs.msdn.microsoft.com/dotnet/2017/11/01/modernize-existing-net-apps-with-windows-containers-and-azure/
[6]: https://www.confluent.io/blog/apache-kafka-goes-1-0/
[7]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/11/01/sentiment-analysis-with-python-in-sql-server-machine-learning-services/
[8]: https://medium.com/intuitionmachine/why-probability-theory-should-be-thrown-under-the-bus-36e5d69a34c9
