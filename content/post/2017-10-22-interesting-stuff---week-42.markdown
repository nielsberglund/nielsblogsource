---
layout: post
title: Interesting Stuff - Week 42
author: nielsb
date: 2017-10-22T16:19:45+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - kafka stream API's
  - Microsoft Machine Learning Server
description: .NET performance, Apache Kafka Stream API's, real-time Microsoft Machine Learning web-services, and some other interesting stuff.
keywords: 
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - kafka stream API's
  - Microsoft Machine Learning Server   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, for the week just gone by. 

This week I have very little to post, mainly due to me being out of the country, and not having been able to read as much as I would have liked.

<!--more-->

I do however have a bonus this week, I finally finished [Internals - XI][si11]!!

## .NET

* [RyuJIT Just-in-Time Compiler Optimization Enhancements][1]. A post about changes to extend the optimization capabilities of RyuJIT, the MSIL-to-native code generator used by .NET Core and .NET Framework. This looks very cool, but I am not sure in which release(s) this is available.
* [Announcing the .NET Framework 4.7.1][2]. As the title says; this post is about the release of .NET Framework 4.7.1. Having had a quick look through the changes, what is interesting to me are the improvements in GC.

## Streaming

* [Predicting Flight Arrivals with the Apache Kafka Streams API][3]. This very interesting post covers how you ca use Kafka Stream API's to do predictive machine learning.

## Data Science

* [1 Million predictions/sec with Machine Learning Server web service][4]. This blog-post, demonstrates how you can score > 1 million predictions per second with the real-time web-services from Microsoft Machine Learning Server Operationalization. Very, very interesting!!

## SQL Server R Services

Quick - "look out the window, was that a pig flying by"? Ah, no it was *Internals - XI* in the **SQL Server 2016 R Services** series being published!!

* [Microsoft SQL Server R Services - Internals XI][si11]. Yeah, it took quite a while to get [Internals - XI][si11] out there, almost as rare as a flying pig. Anyway, in this episode I look at what some of the packets are, being sent from SQL Server to the SqlSatellite, and what causes them to be sent.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: https://blogs.msdn.microsoft.com/dotnet/2017/10/16/ryujit-just-in-time-compiler-optimization-enhancements/
[2]: https://blogs.msdn.microsoft.com/dotnet/2017/10/17/announcing-the-net-framework-4-7-1/
[3]: https://www.confluent.io/blog/predicting-flight-arrivals-with-the-apache-kafka-streams-api/
[4]: https://blogs.msdn.microsoft.com/mlserver/2017/10/15/1-million-predictionssec-with-machine-learning-server-web-service/
[si11]: {{< relref "2017-10-20-microsoft-sql-server-r-services---internals-xi.markdown" >}}
