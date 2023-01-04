---
type: post
layout: "post"
title: Interesting Stuff - Week 43, 2019
author: nielsb
date: 2019-10-27T09:15:54+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - SQL Server Extensibility Framework   
  - Kafka 
  - Kubernetes
  - CLR
  - Java
  - PySpark
description: "Kafka, Scaling Kubernetes, SQL Server & Java, PySpark, and other interesting topics."
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - SQL Server Extensibility Framework   
  - Kafka 
  - Kubernetes
  - CLR
  - Java
  - PySpark   
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

* [Research based on the .NET Runtime][1]. This post by [Matthew][mattw] is a collection of Common Language Runtime, (CLR), research papers. It is an impressive list, and if you are interested in CLR, you should read some of the papers.

## Data Science

* [Futzing and moseying: interviews with professional data analysts on exploration practices][2]. In this post, [Adrian][adcol] dissects a white paper from 2018 around what data analysts do when they do Explanatory Data Analysis, (EDA). If you are a data analyst, or if you are interested in data in general, then you should read this.
* [PySpark & AWS | Predicting Customer Churn][3]. This is a very interesting post where the author takes us through how to work with PySpark on your local computer and then move to AWS to handle large data volumes.

## Distributed Computing

* [Thinking in Kubernetes (K8s)][4]. Due to what Kubernetes does, and how it does it, starting with Kubernetes may require a mind-shift. This post looks at certain things to look at, and perhaps look at differently when you start your Kubernetes journey.
* [High Performance Cooperative Distributed Systems in Adtech][5]. This is an [InfoQ][iq] presentation where the presenter explores a set of core building blocks exhibited by Adtech platforms and applies them towards building a fraud detection platform. The presenter also touches on critical attributes of system reliability and quality in an Adtech system.
* [Autoscaling Kubernetes apps with Prometheus and KEDA][6]. There are a couple of ways to scale your application in a Kubernetes cluster. In this post, the author looks at using the Kubernetes Event Driven Autoscaling, (KEDA), Kubernetes operator. What KEDA does is it provides fine-grained autoscaling for event-driven workloads. Very cool article!

## Streaming

* [4 Steps to Creating Apache Kafka Connectors with the Kafka Connect API][7]. Kafka Connect connectors are used to stream data into Kafka or stream data out of it. In this post, the author discusses how you can create your own connectors using the Kafka Connect API.

## SQL Server 2019

* [SQL Server 2019 & Java Null Handling: Take Two][8]. I eventually managed to finish and publish the post I mentioned a couple of weeks ago. Anyway, this post is about how to handle null values passed back and forth between SQL Server and your Java code, after the introduction of the SQL Server Java language SDK.

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

[1]: https://mattwarren.org/2019/10/25/Research-based-on-the-.NET-Runtime/
[2]: https://blog.acolyer.org/2019/10/23/futzing-and-moseying/
[3]: https://towardsdatascience.com/predicting-customer-churn-with-pyspark-95cd352d393
[4]: https://medium.com/better-programming/thinking-in-kubernetes-k8s-3770bf14c463
[5]: https://www.infoq.com/presentations/adtech-fraud-detection
[6]: https://itnext.io/tutorial-auto-scale-your-kubernetes-apps-with-prometheus-and-keda-c6ea460e4642
[7]: https://www.confluent.io/blog/create-dynamic-kafka-connect-source-connectors
[8]: {{< relref "2019-10-26-sql-server-2019--java-null-handling-take-two.md" >}}