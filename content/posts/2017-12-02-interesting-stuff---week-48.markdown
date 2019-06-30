---
layout: post
title: Interesting Stuff - Week 48
author: nielsb
date: 2017-12-02T15:34:35+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - Azure
  - microservices
description: SQL Server 2017 performance, Apache Kafka, H20.ai on Azure, and other cool stuff!.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - Azure
  - microservices   
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

* [Hey! What's the deal with SQL Server NOCOUNT and T-SQL WHILE loops?][1]. [Lonny][lonny] investigates `NOCOUNT` and potential performance implications using it.
* [SQL Server 2017: The world’s first enterprise-class diskless database][2]. A very interesting post from [Bob Ward][bobw] discussing extremely impressive SQL Server 2017 performance figures, where SQL Server runs on SUSE Linux on boxes equipped with [Hewlett Packard Enterprise scalable persistent memory][3].

## Streaming

* [Confluent Cloud: Enterprise-Ready, Hosted Apache Kafka is Here!][4]. You can now host [Confluent Cloud][5] in AWS without having to think about deploying servers, monitoring load, and upgrading brokers. This is cool, but now I want to see it on Azure as well.
* [Introducing Confluent Platform 4.0][6]. Quite a few Confluent/Kafka notifications this week. This is about a new version of the Confluent Platform. As the title says; version 4.0. Confluent Platform improves Apache Kafka by expanding its integration capabilities, adding tools to optimize and manage Kafka clusters, and methods to ensure the streams are secure.
* [Toward a Functional Programming Analogy for Microservices][7]. Yet another post about Kafka. This talks about implementing microservices using functional programming model, together with [CQRS][8], [Event Sourcing][9] and Kafka. Really, really interesting read!

## Data Science

* [Developing and Operationalizing H2O.ai Models with Azure][10]. This post provides an overview of how to efficiently develop and operationalize [H2O.ai][11] ML models on Azure.
* [On dataflow systems, Naiad and Tensorflow][12]. [Murat][murat] looks at data flow systems and compares [TensorFlow][13] with Microsoft's [Naiad][14]. I obviously had heard about TensorFlow, and even written blog-posts about it, but Naiad was new to me. It sounds very interesting but when you look at the GitHub repo, the newest contributions are 3 years old. ~~That makes me winder whether the project is still alive.~~ Reading some comments in the repo, it seems Naiad is abandoned - pity!

## SQL Server R Services

* [Microsoft SQL Server R Services - Internals XV][si15]. A continuation of what I covered in [Internals - XIV], here I look at packets sizes as in TDS vs. BXL. I also look at what happens inside SQL Server when it sends a BXL packet to the SQL Satellite. 

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
[murat]: https://twitter.com/muratdemirbas

[1]: http://sql-sasquatch.blogspot.co.za/2017/11/hey-whats-deal-with-nocount-and-t-sql.html
[2]: https://blogs.technet.microsoft.com/dataplatforminsider/2017/11/29/sql-server-2017-the-worlds-first-enterprise-class-diskless-database/
[3]: https://www.hpe.com/us/en/servers/persistent-memory.html
[4]: https://www.confluent.io/blog/confluent-cloud-enterprise-ready-hosted-apache-kafka/
[5]: https://www.confluent.io/blog/announcing-confluent-cloud-apache-kafka-as-a-service/
[6]: https://www.confluent.io/blog/introducing-confluent-platform-4-0/
[7]: https://www.confluent.io/blog/toward-functional-programming-analogy-microservices/
[8]: https://martinfowler.com/bliki/CQRS.html
[9]: https://docs.microsoft.com/en-us/azure/architecture/patterns/event-sourcing
[10]: https://blogs.technet.microsoft.com/machinelearning/2017/11/28/developing-and-operationalizing-h2o-ai-models-with-azure/
[11]: https://www.h2o.ai/
[12]: http://muratbuffalo.blogspot.co.za/2017/11/on-dataflow-systems-naiad-and-tensorflow.html
[13]: https://www.tensorflow.org/
[14]: https://www.microsoft.com/en-us/research/project/naiad/
[si14]: {{< relref "2017-11-25-microsoft-sql-server-r-services---internals-xiv.markdown" >}}
[si15]: {{< relref "2017-12-02-microsoft-sql-server-r-services---internals-xv.markdown" >}}
