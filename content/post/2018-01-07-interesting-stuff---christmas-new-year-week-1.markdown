---
layout: post
title: Interesting Stuff - Christmas, New Year, Week 1
author: nielsb
date: 2018-01-07T20:17:09+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - paxos
  - wpaxos
  - tensorflow
description: Tensorflow, Paxos, the obligatory Kafka discussions, and a lot of other "cool" stuff!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - paxos
  - wpaxos
  - tensorflow   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me over the Christmas and New Year period.

<!--more-->

## SQL Server

Quite some JSON related topics in this roundup.

* [Building SQL REST API back-end for Angular apps][1]. In this post [Jovan][jovpop] (who is the SQL Server JSON "god") shows how easy it is to build back-end REST API for Angular sample app using JSON functionalities in SQL Server.
* [Transitive closure clustering with CLR and JSON][2]. [Jovan][jovpop] shows how a [transitive closure][3] algorithm can be implemented using CLR aggregates that can be placed in SQL database.
* [Injecting JSON objects into existing JSON text with JSON_MODIFY function][4]. Yet another post by "Mr. SQL Server JSON" - [Jovan][jovpop] - showing how to update existing JSON text and inject JSON object in the text, avoiding some common mistakes. 

## Streaming

* [KSQL December Release: Streaming SQL for Apache Kafka][5]. A post about that is in the December release of the streaming SQL engine for Apache Kafka - **KSQL**.

## Databases

* [A Machine Learning Approach to Databases Indexes][6]. A white-paper about how traditional B-tree indexes potentially can be replaced with more flexible, faster, and smaller machine learned neural networks. Very interesting!!

## Distributed Computing

* [WPaxos: a wide area network Paxos protocol (Part 1)][7]. [Paxos][10] is a protocol for solving the fault-tolerant coordination problem in a datacenter - and it is very good at what it is doing. However across datacenters the WAN latency may be too high. In this post [Murat][murba] discusses an alternative to Paxos - WPaxos.
* [Entity Oriented Microservices][8]. A very interesting article by [David][daveda] about Entity Services vs. Microservices vs. DDD.

## Data Science

* [DevOps for Data Science – Continuous Delivery][9]. [Buck Woody][buckw] continues his series about DevOps for Data Science, and in this episode he discusses Continuous Delivery. A very interesting post as well as series!!
* [TensorFlow-Serving: Flexible, High-Performance ML Serving][11]. Another post by [Murat][murba], this time about a system/framework to serve machine learning (ML) models.
* [Paper summary. Real-Time Machine Learning: The Missing Pieces][12]. [Murat][murba] has been busy the holiday period. In this post he dissects a white-paper about real time machine learning, and what is required. This is an area, I am really interested in BTW!!

## SQL Server R Services

During the holiday period I managed to get some work done on the Microsoft SQL Server R Services series:

* [Microsoft SQL Server R Services - Internals XVI][si16]. In [Internals - XVI][si16] I talked about the result set data coming back from the SqlSatellite, and I looked at number of packets as well as packet sizes.
* [Microsoft SQL Server R Services - Internals XVII][si17]. [Internals - XVII][si17] continues on from [Internals - XVI][si16], and looks at what happens inside SQL Server when result-set data comes back.

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


[1]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/12/18/building-sql-rest-api-back-end-for-angular-apps/
[2]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/12/20/transitive-closure-clustering-with-clr-and-json/
[3]: https://en.wikipedia.org/wiki/Transitive_closure
[4]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/12/22/injecting-json-objects-into-existing-json-text-with-json_modify-function/
[5]: https://www.confluent.io/blog/ksql-december-release
[6]: http://learningsys.org/nips17/assets/papers/paper_22.pdf
[7]: http://muratbuffalo.blogspot.co.za/2017/12/wpaxos-wide-area-network-paxos-protocol.html
[8]: http://daviddawson.me/blog/2018/01/05/entity-microservices.html
[9]: https://blogs.msdn.microsoft.com/buckwoody/2018/01/04/devops-for-data-science-continuous-delivery/
[10]: https://en.wikipedia.org/wiki/Paxos_(computer_science)
[11]: http://muratbuffalo.blogspot.co.za/2017/12/tensorflow-serving-flexible-high.html
[12]: http://muratbuffalo.blogspot.co.za/2017/12/paper-summary-real-time-machine.html

[si16]: {{< relref "2017-12-24--microsoft-sql-server-r-services---internals-xvi.markdown" >}}
[si17]: {{< relref "2018-01-03-microsoft-sql-server-r-services---internals-xvii.markdown" >}}
