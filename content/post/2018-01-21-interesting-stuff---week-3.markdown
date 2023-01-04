---
layout: post
title: Interesting Stuff - Week 3
author: nielsb
date: 2018-01-21T07:35:50+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - quantum computing
  - SQL Server R Services
description: Apache Kafka, Lambda vs. Kappa architecture, Microsoft Quantum computing, Microsoft SQL Server R Services, and other interesting stuff!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - quantum computing
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

## Streaming

* [Should You Put Several Event Types in the Same Kafka Topic?][1]. A very informative blog-post about how to choose what number of topics you should have in your Kafka broker and how many event types per topic.

## Distributed Computing

* [The Lambda and the Kappa Architectures][2]. [Murat][murba] dissects an article / paper by [Jimmy Lin][3] (no not the actor, but Jimmy Lin of Twitter fame), comparing Lambda and Kappa architectures. It is an interesting read, I would so have wanted to read the actual article, but it sits behind a pay-wall.

## Computing

* [The Future is Quantum with Dr. Krysta Svore][4]. I have in a couple of blog-posts covered a bit about Microsoft's quantum computing efforts ([here][int39] and [here][int50]). This is the transcript of a pod-cast with Dr. Krysta Svore, who is Principal Research Manager of the Microsoft Quantum group. Very, very interesting!!

## Data Science

* [ML for Question and Answer Understanding @Quora][5]. A presentation from [InfoQ][iq], where Nikhil Dandekar discusses how Quora extracts intelligence from questions using machine learning, etc. Really cool!
* [Microsoft R Open 3.4.3 now available][6]. The guys at [Revolution Analytics][re] points out that version 3.4.3 of **Microsoft R Open** (MRO) is now available. If you use MRO, go forth and download and install!

## SQL Server R Services

A couple of more posts in the Microsoft SQL Server R Services series have been published:

* [Microsoft SQL Server R Services - Internals XVIII][si18]. In this post I have a look at how output parameters are handled in SQL Server R Services.
* [Microsoft SQL Server R Services - Internals XIX][si19]. This post does a drill down, using WinDbg, into how print statements in the external engine together with ack messages comes back to SQL Server.

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
[jlin]: https://twitter.com/lintool

[int39]: {{< relref "2017-10-01-interesting-stuff---week-39.markdown" >}}
[int50]: {{< relref "2017-12-17-interesting-stuff---week-50-year-end.markdown" >}}

[si18]: {{< relref "2018-01-10-microsoft-sql-server-r-services---internals-xviii.markdown" >}}
[si19]: {{< relref "2018-01-20-microsoft-sql-server-r-services---internals-xix.markdown" >}}

[1]: https://www.confluent.io/blog/put-several-event-types-kafka-topic/
[2]: http://muratbuffalo.blogspot.co.za/2018/01/the-lambda-and-kappa-architectures.html
[3]: https://cs.uwaterloo.ca/~jimmylin/
[4]: https://www.microsoft.com/en-us/research/blog/future-is-quantum-with-dr-krysta-svore/
[5]: https://www.infoq.com/presentations/quora-ml
[6]: http://blog.revolutionanalytics.com/2018/01/microsoft-r-open-343-now-available.html
