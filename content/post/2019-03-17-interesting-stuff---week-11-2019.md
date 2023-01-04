---
type: post
layout: "post"
title: Interesting Stuff - Week 11, 2019
author: nielsb
date: 2019-03-17T21:16:22+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server 2019
  - distributed computing
  - SQL Server Extensibility Framework
  - .NET Core
  - Java
  - Kubernetes
  - Kafka
description: Kafka, Kubernetes, SQL Server 2019 & Java. .NET Core & Containers and other interesting topics.
keywords:
  - SQL Server 2019
  - distributed computing
  - SQL Server Extensibility Framework
  - .NET Core
  - Java
  - Kubernetes
  - Kafka   
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

* [.NET Core Container Images now Published to Microsoft Container Registry][1]. A post discussing how Microsoft are now publishing .NET Core container images to Microsoft Container Registry (MCR).

## Distributed Computing

* [Reducing Microservices Architecture Complexity with Istio and Kubernetes][2]. An [InfoQ][iq] presentation which introduces Istio, and explains how the service mesh works, the technology behind it, and how to use it with microservices.
* [Recommendations When Starting with Microservices: Ben Sigelman at QCon London][3]. This is an [InfoQ][iq] article about the mistakes Google made in he beginning when adopting a microservices architecture, and recommendations to avoid making these mistakes when starting with microservices.

## Data Science / Machine Learning

* [Machine Learning with Big Data][4]. Data is on overdrive. It’s being generated at break-neck pace. How do we analyze all this data? This article discusses how to easily create a scalable and parallelized machine learning platform on the cloud to process large-scale data.

## Streaming

* [DBEvents: A Standardized Framework for Efficiently Ingesting Data into Uber’s Apache Hadoop Data Lake][5]. This blog post looks at Uber's  DBEvents, a change data capture system designed for high data quality and freshness. It facilitates bootstrapping, ingesting a snapshot of an existing table, and incremental, streaming updates. 
* [Kafka Connect Deep Dive – Error Handling and Dead Letter Queues][6]. In this blog post [Robin Moffat][rmoff] looks at several common patterns for handling Kafka Connect problems and examines how the patterns can be implemented.

## SQL Server 2019

* [SQL Server 2019, Java & External Libraries - II][7]. This post by yours truly looks at how to use `CREATE EXTERNAL LIBRARY` to deploy Java code without having access to SQL Server's filesystem.

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

[1]: https://devblogs.microsoft.com/dotnet/net-core-container-images-now-published-to-microsoft-container-registry/
[2]: https://www.infoq.com/presentations/istio-microservices
[3]: https://www.infoq.com/news/2019/03/microservices-recommendations
[4]: https://towardsdatascience.com/machine-learning-with-big-data-86bcb39f2f0b
[5]: https://eng.uber.com/dbevents-ingestion-framework/
[6]: https://www.confluent.io/blog/kafka-connect-deep-dive-error-handling-dead-letter-queues
[7]: {{< relref "2019-03-17-sql-server-2019-java--external-libraries---ii.md" >}}
