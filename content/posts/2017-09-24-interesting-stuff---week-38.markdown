---
layout: post
title: Interesting Stuff - Week 38
author: nielsb
date: 2017-09-24T09:26:42+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - apache kafka
  - R
description: Apache Kafka goodness, R improvements, and other interesting topics in this weeks roundup.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - apache kafka
  - R   
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

* [Crossing the Streams – Joins in Apache Kafka][1]. Kafka 0.10.1, introduced support for "Interactive Queries", an API that allows querying stateful stream transformations without going through another Kafka topic. This blogpost looks at how to join streams, and what type of joins that exists.
* [Disaster Recovery for Multi-Datacenter Apache Kafka Deployments][2]. This post points to a white-paper how to set up Kafka across geo-locations for disaster recovery.

## Data Science

* [How Did We Build Book Recommender Systems in an Hour Part 1 — The Fundamentals][3]. First part of a series how to build a recommender system.
* [Preview: ALTREP promises to bring major performance improvements to R][4]. David from [Revolution Analytics][re] talks about changes to the R engine, to improve performance and reduce memory usage.
* [Cheat Sheets for AI, Neural Networks, Machine Learning, Deep Learning & Big Data][5]. As the title say, cheat sheets for a lot of things data science.
* [Distributed deep neural networks over the cloud, the edge, and end devices][6]. Adrian from [the morning paper][mp] looks at a whitepaper about distributed deep neural networks.
* [Tutorial: Launch a Spark and R cluster with HDInsight][7]. This post by David from [Revolution Analytics][re] points to a tutorial how to get up and running with a Spark cluster and R. Cool stuff!!

## SQL Server R Services

In [last weeks roundup][8] I mentioned I'd be ready with **Internals - XI** soon:ish, and it would cover SQL Server R Services internal data transfer protocol **Binary eXchange Language** (**BXL**). I will be ready soon:ish with **Internals - XI**, but it will most likely cover something else than **BXL**, just so you know :). If you are interested; Internals - X is [here][si10].

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: https://blog.codecentric.de/en/2017/02/crossing-streams-joins-apache-kafka/
[2]: https://www.confluent.io/blog/disaster-recovery-multi-datacenter-apache-kafka-deployments
[3]: https://medium.com/towards-data-science/how-did-we-build-book-recommender-systems-in-an-hour-the-fundamentals-dfee054f978e
[4]: http://blog.revolutionanalytics.com/2017/09/altrep-preview.html
[5]: https://becominghuman.ai/cheat-sheets-for-ai-neural-networks-machine-learning-deep-learning-big-data-678c51b4b463
[6]: https://blog.acolyer.org/2017/09/22/distributed-deep-neural-networks-over-the-cloud-the-edge-and-end-devices/
[7]: http://blog.revolutionanalytics.com/2017/09/hdinsight-tutorial.html
[si10]: {{< relref "2017-08-29-microsoft-sql-server-r-services---internals-x.markdown" >}}
[8]: {{< relref "2017-09-17-interesting-stuff---week-37.markdown" >}}
