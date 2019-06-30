---
layout: post
title: Interesting Stuff - Week 6
author: nielsb
date: 2018-02-11T06:57:25+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - flink
  - Kubernetes
description: Kubernetes, Kafka, Flink, and other interesting topics in this weeks roundup.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - flink
  - Kubernetes   
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

* [The Kubernetes Effect][1]. The first of two links this week from [InfoQ][iq] that have to do with [Kubernetes][2]. This article discusses the evolution of Kubernetes and what Kubernetes can do for us.

## Misc.

* [Think before you code][3]. In this post [Murat][murba] talks about different coding styles, and how important it is to think before you code. To think about the design and code, does not necessarily mean that you think, think, think, and strive for the perfect design (In my mind there is no such thing as a perfect design). A fascinating article and I thoroughly enjoyed it!

## Streaming

* [Managing and Operating Kafka Clusters in Kubernetes][4]. The second article this week about Kubernetes and this article discusses how Kubernetes can make running Kafka clusters much easier.
* [Migrating Batch ETL to Stream Processing: A Netflix Case Study with Kafka and Flink][5]. This article is about Netflix journey from an ETL based approach to moving data, to a real-time process using Kafka and Flink. A must read!!
* [Apache Flink Master Branch Monthly: New in Flink in January 2018][6]. This post is highlighting a selection of features that have been merged into Flink’s master branch during January. 

## SQL Server R Services

The **Microsoft SQL Server R Services** series is coming to an end. Last week I posted the last post of the [**Internals**][si20] part, and I am now working on a post about `sp_execute_external_script`. 

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com

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

[1]: https://www.infoq.com/articles/kubernetes-effect
[2]: https://kubernetes.io/
[3]: http://muratbuffalo.blogspot.co.za/2018/02/think-before-you-code.html
[4]: https://www.infoq.com/news/2018/02/kubecon-kafka-clusters-kubernete
[5]: https://www.infoq.com/articles/netflix-migrating-stream-processing
[6]: https://data-artisans.com/blog/apache-flink-master-branch-monthly-whats-new-flink-january-2018

[si20]: {{< relref "2018-02-02-microsoft-sql-server-r-services---internals-xx.markdown" >}}
