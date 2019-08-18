---
type: post
layout: "post"
title: Interesting Stuff - Week 33, 2019
author: nielsb
date: 2019-08-18T16:08:06+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - .NET Core
  - Kafka
  - Kafka Connect
  - Kubernetes
  - Kubernetes Serverless
description: "Kafka & Kafka Connect, Kubernetes Serverless, Time Series data, and other interesting topics."
keywords:
  - data science
  - distributed computing
  - .NET Core
  - Kafka
  - Kafka Connect
  - Kubernetes
  - Kubernetes Serverless   
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

## .NET

* [Announcing .NET Core 3.0 Preview 8][1]. We are getting close to an official release of .NET Core 3.0. As you can see from the title of the linked post, Microsoft just released Preview 8 of .NET Core 3.0.

## Distributed Computing

* [Kubernetes Workloads in the Serverless Era: Architecture, Platforms, and Trends][2]. An [InfoQ][iq] article about how microservices architecture has evolved into cloud-native architecture, where many of the infrastructure concerns are provided by Kubernetes in combination with additional abstractions provided by service mesh and serverless frameworks. 
* [From Monolith to Observable Microservices using DDD][3]. This is an [InfoQ][iq] presentation about how to move from a monolith to microservices applying Domain-Driven Design principles. Additionally, the presenter explains how to better maintain microservices in production by making them observable.
* [Testing Microservices: Overview of 12 Useful Techniques - Part 1][4]. Yet another [InfoQ][iq] post. This is the first in a series about how to test microservices. An excellent post!

## Machine Learning / Data Science

* [Fundamentals of Time Series Data and Forecasting][5]. This article explores the fundamentals of time series data. It talks about how very simple forecasting methods work. Plus, the article describes the most common patterns found in time-series data. I found this article very informative!

## Streaming

* [Kafka Connect Improvements in Apache Kafka 2.3][6]. Apache Kafka 2.3 was released recently together with Confluent Platform 5.3. The release has some improvements of Kafka Connect. In this blog post, [Robin Moffat][rmoff], covers the - in his mind - most exciting improvements.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/
[charlblog]: https://charlla.com/

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
[dataart]: https://twitter.com/dataartisans
[luis]: https://twitter.com/luis_de_sousa
[benstop]: https://twitter.com/benstopford
[conflu]: https://twitter.com/confluentinc
[tylert]: https://twitter.com/tyler_treat
[andrewng]: https://twitter.com/AndrewYNg
[lawr]: https://twitter.com/bytezn
[jue]: https://twitter.com/b0rk
[yan]: https://twitter.com/theburningmonk
[danny]: https://twitter.com/g9yuayon
[rmoff]: https://twitter.com/rmoff
[ryansw]: https://twitter.com/ryanswanstrom
[pabloc]: https://twitter.com/pabloc_ds
[mklep]: https://twitter.com/martinkl
[mdavey]: https://twitter.com/matt_davey
[jboner]: https://twitter.com/jboner
[joeduff]: https://twitter.com/funcOfJoe
[charl]: https://twitter.com/charllamprecht
[dbricks]: https://twitter.com/databricks
[adsit]: https://twitter.com/SitnikAdam
[vicky]: https://twitter.com/vickyharp
[dscentral]: https://twitter.com/DataScienceCtrl
[natemc]: https://twitter.com/natemcmaster
[ads]: https://twitter.com/azuredatastudio

[1]: https://devblogs.microsoft.com/dotnet/announcing-net-core-3-0-preview-8/
[2]: https://www.infoq.com/articles/kubernetes-workloads-serverless-era/
[3]: https://www.infoq.com/presentations/monolith-observable-microservices-ddd
[4]: https://www.infoq.com/articles/twelve-testing-techniques-microservices-intro
[5]: https://medium.com/better-programming/fundamentals-of-time-series-data-and-forecasting-15e9490b2618
[6]: https://www.confluent.io/blog/kafka-connect-improvements-in-apache-kafka-2-3
