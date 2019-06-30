---
type: post
layout: "post"
title: Interesting Stuff - Week 45
author: nielsb
date: 2018-11-11T08:05:58+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2019
  - SQL Server 2019 Big Data Cluster
  - kafka
  - flink
  - Kubernetes
  - Big data
  - Azure Kubernetes Service
  - Azure Event Hubs
description: Kafka and Azure Event Hubs, Flink SQL, SQL Server Big Data Cluster on Azure Kubernetes Service, and much more!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2019
  - SQL Server 2019 Big Data Cluster
  - kafka
  - flink
  - Kubernetes
  - Big data
  - Azure Kubernetes Service
  - Azure Event Hubs   
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

##.NET

* [Understanding the Whys, Whats, and Whens of ValueTask][1]. The .NET Framework 4 saw the introduction of the `System.Threading.Tasks` namespace, and with it the `Task` class. In this post, [Stephen Toub][2], covers the newer `ValueTask` and `ValueTask<TResult>` types.

## Streaming

* [Flink SQL for powerful querying of data streams and data at rest][3]. This post covers Flink SQL, and discusses how we can quickly explore data in streams or data at rest. Very interesting!  
* [Announcing the general availability of Azure Event Hubs for Apache Kafka][4]. This post announces the general availability (GA) of Azure Event Hubs for Apache Kafka. So what does it mean? Well, it means that you can now stream events from applications using the Kafka protocol directly into Azure Event Hubs. Awesome! 

## Distributed Computing

* [Who Is Running My Kubernetes Pod? The Past, Present, and Future of Container Runtimes][5]. Container runtime choices are nowadays not only Docker as the "Open Container Initiative" (OCI) has successfully standardized the concept of a container and container image to guarantee interoperability between runtimes. This [InfoQ][iq] article looks at the past, present, and future of container engine implementations.

## SQL Server 2019

* [Introducing Scalar UDF Inlining][6]. SQL Server 2017 introduced [Intelligent Query Processing][7] which is meant to improve the performance of existing workloads with minimal implementation effort. SQL Server 2019 further expands query processing capabilities, and this blog post discusses Scalar T-SQL UDF Inlining. The inlining of scalar UDF's is a feature to improve the performance of queries that invoke scalar UDFs, where UDF execution is the main bottleneck.
* [SQL Server 2019 Big Data Cluster on Azure Kubernetes Service][8]. This is a blog post by "yours truly". As the title implies, it discusses how to deploy **SQL Server 2019 Big Data Cluster** to **Azure Kubernetes Service** (AKS).

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

[1]: https://blogs.msdn.microsoft.com/dotnet/2018/11/07/understanding-the-whys-whats-and-whens-of-valuetask/
[2]: https://github.com/stephentoub
[3]: https://data-artisans.com/blog/flink-sql-powerful-querying-of-data-streams
[4]: https://azure.microsoft.com/en-us/blog/announcing-the-general-availability-of-azure-event-hubs-for-apache-kafka/
[5]: https://www.infoq.com/articles/container-runtimes-kubernetes
[6]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2018/11/07/introducing-scalar-udf-inlining/
[7]: https://docs.microsoft.com/en-us/sql/relational-databases/performance/intelligent-query-processing?view=sql-server-2017
[8]: {{< relref "2018-11-10-sql-server-2019-big-data-cluster-on-azure-kubernetes-service.md" >}}
