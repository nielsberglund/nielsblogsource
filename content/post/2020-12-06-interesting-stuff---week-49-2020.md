---
type: post
layout: "post"
title: Interesting Stuff - Week 49, 2020
author: nielsb
date: 2020-12-06T09:06:09+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - Kafka
  - ksqlDB
  - Apache Spark
description: Kafka and event streaming, .NET for Apache Spark, Service Mesh, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - Kafka
  - ksqlDB
  - Apache Spark   
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

* [Microsoft Releases .NET for Apache Spark 1.0][1]. This is an [InfoQ][iq] article looking at the first major version of .NET for Apache Spark, an open-source package that brings .NET development to the Apache Spark platform. The new release allows .NET developers to write Apache Spark applications using .NET user-defined functions, Spark SQL, and additional libraries such as Microsoft Hyperspace and ML.NET. I can say that the developers here at [Derivco](/derivco) are quite excited about this!

## Distributed Computing

* [Michelle Noorali on the Service Mesh Interface Spec and Open Service Mesh Project][2]. The [InfoQ][iq] podcast linked to here covers quite a few topics: the service mesh interface (SMI) spec, the open service mesh (OSM) project, and the future of application development on Kubernetes.
* [Monitoring Microservices the Right Way][3]. Another article from [InfoQ][iq]. The article looks at how recent innovations in open-source time-series databases have improved the scalability of monitoring tools such as Prometheus. These solutions can handle microservices large scale of data while providing metric scraping, querying, and visualization based on Prometheus and Grafana.
* [Migrating a Monolith towards Microservices with the Strangler Fig Pattern][4]. The article linked to here looks at how a company, [ScholarPack][5], managed to migrate away from a monolith backend using a Strangler Fig pattern. They applied incremental development and continuous delivery to target customers’ needs, in the meanwhile strangling their monolith. All this is very interesting for us, [Derivco](/derivco)!

## Data Science

* [Dagli: Faster and easier machine learning on the JVM, without the tech debt][6]. This post by the LinkedIn engineering team is about the release of Dagli. Dagli is an open source machine learning library for Java (and other JVM languages) that makes it easy to write bug-resistant, readable, modifiable, maintainable, and trivially deployable model pipelines without incurring technical debt. 

## Streaming

* [Getting Started with Spring Cloud Data Flow and Confluent Cloud][7]. This blog post gives you the foundation for event streaming and designing and implementing real-time patterns. Using Confluent Schema Registry, ksqlDB, and fully managed Apache Kafka as a service, you can experience clean, seamless integrations with your existing cloud provider. The post also discusses Spring Cloud Data Flow which is a microservices-based toolkit for building streaming and batch data processing pipelines.

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
[travw]: https://twitter.com/radtravis
[emilk]: https://twitter.com/IsTheArchitect


[1]: https://www.infoq.com/news/2020/11/microsoft-releases-dotnet-spark/
[2]: https://www.infoq.com/podcasts/service-mesh-interface/
[3]: https://www.infoq.com/articles/microservice-monitoring-right-way/
[4]: https://www.infoq.com/news/2020/12/microservices-strangler-fig/
[5]: https://scholarpack.com
[6]: https://engineering.linkedin.com/blog/2020/open-sourcing-dagli
[7]: https://www.confluent.io/blog/apache-kafka-spring-cloud-data-flow-tutorial/
