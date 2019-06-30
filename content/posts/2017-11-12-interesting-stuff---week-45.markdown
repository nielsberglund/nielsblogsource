---
layout: post
title: Interesting Stuff - Week 45
author: nielsb
date: 2017-11-12T20:05:53+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - flink
description: Announcements from Apache Kafka and Apache Flink, together with impressive perf. from Azure SQL, and other interesting "stuff".
keywords:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - flink 
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

## Streaming

So, the last few months it's been very interesting following Apache Kafka and Apache Flink and their announcements. It seems both are wanting to usurp the other. In my mind that's good, as it is us - the consumers - that will reap the benefits! So this week a couple of interesting posts from both Kafka as well as Flink.

* [Building a Microservices Ecosystem with Kafka Streams and KSQL][1]. A very interesting post about how to implement a microservices architecture built upon Kafka. I really need to look at this closer!
* [Complex Event Processing with Flink: An Update on the State of Flink CEP][2]. CEP is a topic is "near and dear" to me, and that's why it is so interesting to see what Flink is offering. What is extremely interesting is the ability to - in the future - add dynamic patterns: to add new patterns to a CEP program with no downtime.

## SQL Server

* [Azure SQL Database: Ingesting 1.4 million sustained rows per second with In-Memory OLTP & Columnstore Index][3]. Oooh, be still my beating heart! How awesome is this (very is the answer)?! This post outlines how Microsoft managed to get a throughput of 1.4 **million** inserts per second. Sure it is on Azure, and a fairly beefy box, but still. I'll definitely show this to our DBA's!!

## Data Science

* [Microsoft and AWS Collaborate on Machine Learning][4]. Announcement from Microsoft and Amazon: "Microsoft and AWS have recently announced a new collaboration aimed at democratizing deep learning and artificial intelligence. [Gluon][5] is a joint effort between Microsoft Research and Amazon AI and is intended to make developing solutions using machine learning easier and quicker." It will be interesting to see what Google will do ...
* [Paper summary. Towards distributed machine learning in shared clusters: a dynamically partitioned approach][7]. [Murat][6] dissects a white paper about enabling multiple distributed ML frameworks, say TensorFlow, Petuum, MxNet, to share the same cluster.
* [10 Ways to Take Your Boss on a Journey Through the Data][8]. A blog-post about what and how you should present data to your boss. Definitely not "hard-core" data science, but very interesting!

## SQL Server R Services

* [Microsoft SQL Server R Services - Internals XIII][si13]. The plan was to cover the **Binary eXchange Language** (**BXL**) in [Internals - XIII][si13], but the "best laid plans" and all that. Instead [Internals - XIII][si13] covers when `SELECT` statements for `@input_data_1` is executed.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[si13]: {{< relref "2017-11-11-microsoft-sql-server-r-services---internals-xiii.markdown" >}}
[1]: https://www.confluent.io/blog/building-a-microservices-ecosystem-with-kafka-streams-and-ksql/
[2]: https://data-artisans.com/blog/complex-event-processing-flink-cep-update
[3]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/11/08/high-scale-and-performance-of-azure-sql-database/
[4]: https://www.infoq.com/news/2017/11/microsoft-aws-gluon
[5]: https://mxnet.incubator.apache.org/gluon/
[6]: https://twitter.com/muratdemirbas
[7]: http://muratbuffalo.blogspot.co.za/2017/11/paper-summary-towards-distributed.html
[8]: https://towardsdatascience.com/10-ways-to-take-your-boss-on-a-journey-through-the-data-14a3fdbb3503
