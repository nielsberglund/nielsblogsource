---
layout: post
title: Interesting Stuff - Week 14
author: nielsb
date: 2017-04-09T14:51:31+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - streaming
  - Flink
  - Microsoft R
description: This week the roundup covers SQL Server, Apache Flink, Reactive Programming, Distributed Computing, Streaming and Data Science.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - streaming
  - Flink
  - Microsoft R   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, this week. 

<!--more-->

## SQL Server

* [SQL Server doubly linked lists revisited][1]. [Ewald][ew] chases bugs in linked lists!

## Distributed Computing

* [Reactive & Asynchronous - Adventures with APIs in Financial Trading][2]. Michael Barker from LMAX and the father of [Disruptor][3] gives a presentation about low-latency APIs used for financial trading and how they compare to APIs based on HTTP, REST,JSON etc.

## Streaming

* [From Streams to Tables and Back Again: An Update on Apache Flink's Table & SQL API][4]. In previous weekly roundups ([here][5] and [here][6]) I have mentioned Flink and it's new APIs. This is a blog-post discussing the Table API more.

## Data Science

* [Microsoft Updates its Deep Learning Toolkit][7]. A post announcing the update of its ["Microsoft Cognetive Toolkit"][8]. It looks very, very interesting, and when I get some spare time (hah) I'll take it for a spin.
* [Publish R functions as stored procedures with the sqlrutils package][9]. [Revolution Analytics][re] blogs about the **sqlrutils** package and functions in the package helping you make stord procedures out of your R functions. Very cool!
* [Latest Rev of Utilities for Microsoft Team Data Science Process (TDSP) Now Available][10]. Another update from Microsoft. This time it is the **Team Data Science Process Utilities**.
* [Deep Learning at Scale][11]. Presentation about the **Deep Scalable Sparse Tensor Network** (DSSTNE). This kind of blew my mind.
* [Building Robust Machine Learning Systems][12]. Another presentation giving food for thought; how to make sure our machine learning systems are robust, well audited and can be inspected.
* [Microsoft R Open 3.3.3 now available][13]. [Revolution Analytics][re] reports of the release of Microsoft R Open 3.3.3.

In other news; I am still working on **Microsoft SQL Server R Services - Internals III**, I hope the post will be out early this coming week. In the meantime you can always re-read [I][14] and [II][15].

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: http://sqlonice.com/sql-server-doubly-linked-lists-revisited/
[2]: https://www.infoq.com/presentations/financial-trading-api
[3]: https://lmax-exchange.github.io/disruptor/
[4]: https://data-artisans.com/flink-table-sql-api-update/
[5]: {{< relref "2017-03-26-interesting-stuff---week-12.markdown" >}}
[6]: {{< relref "2017-04-02-interesting-stuff---week-13.markdown" >}}
[7]: https://blogs.technet.microsoft.com/machinelearning/2017/04/03/microsoft-updates-its-deep-learning-toolkit/
[8]: https://www.microsoft.com/en-us/research/product/cognitive-toolkit/
[9]: http://blog.revolutionanalytics.com/2017/04/sqlrutils.html
[10]: https://blogs.technet.microsoft.com/machinelearning/2017/04/05/latest-rev-of-utilities-for-microsoft-team-data-science-process-tdsp-now-available/
[11]: https://www.infoq.com/presentations/dsstne-deep-learning
[12]: https://www.infoq.com/presentations/ravelin-ml-best-practices
[13]: http://blog.revolutionanalytics.com/2017/04/microsoft-r-open-333-now-available.html
[14]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[15]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
