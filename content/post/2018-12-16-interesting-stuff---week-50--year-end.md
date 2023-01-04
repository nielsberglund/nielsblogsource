---
type: post
layout: "post"
title: "Interesting Stuff - Week 50 & Year End!"
author: nielsb
date: 2018-12-16T18:45:34+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server 2019
  - kafka
  - Azure Functions
  - .NET Core
  - Kubernetes
description: Kafka scaling, Azure Functions, SQL Server 2019 and Kubernetes, and other interesting topics!
keywords:
  - data science
  - distributed computing
  - SQL Server 2019
  - kafka
  - Azure Functions
  - .NET Core
  - Kubernetes   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending.

> **NOTE:** *I started with these roundup posts in the beginning of 2017 as a way to force myself to write, and - so far, so good. It is now coming up on Christmas and New Year, and I will take a break with these posts and come back in the beginning of next year.*

<!--more-->

## Distributed Computing

* [Netflix Play API - An Evolutionary Architecture][1]. An [InfoQ][iq] presentation which deeps dive into how Netflix used a set of three core foundational principles to iteratively develop their architecture. This led to a list of practices to create an Evolutionary Architecture.

## .NET

* [Mocking .NET without Hurting Its Feelings][2]. An [InfoQ] presentation, discussing two main types of mocking frameworks: constrained frameworks (like RhinoMocks and Moq) and unconstrained frameworks (such as Typemock Isolator and Telerik JustMock).
* [Exploring the .NET Core Runtime (in which I set myself a challenge)][3]. This is another awesome blog post by [Matthew][mattw]. In this post, he looks at the inner workings of **.NET Core**. I have said it before, and I say it again; if you have the vaguest interest in .NET/CLR Matthews [blog] is a must!
* [Deep-dive into .NET Core primitives: deps.json, runtimeconfig.json, and dll's][4]. The post by Matthew above lead me to this post by [Nate][natemc]. The post is a deep dive into the "plumbing" of **.NET Core**. A must read! 
* [.NET Core and DevOps][5]. An [InfoQ][iq] article which discusses how .NET Core was designed with DevOps in mind, and how .NET Core projects can benefit from the build automation and application monitoring intrinsic to the platform. The article also shows how the command-line accessibility of .NET Core makes DevOps easier to implement.

## Azure

* [Azure Functions now supported as a step in Azure Data Factory pipelines][6]. A blog post which shows how easy it is to set up Azure Functions to run as steps in an Azure Data Factory pipeline.

## Data Science

* [What Machine Learning Can Learn From DevOps][7]. This [InfoQ][iq] article makes a strong case that Machine Learning can gain many benefits from DevOps: culture change to support experimentation, continuous evaluation, sharing, abstraction layers, observability, and working in products and services.
* [How to deploy a predictive service to Kubernetes with R and the AzureContainers package][8]. This blog post from the crew at [Revolution Analytics][re] shows how you can deploy an R fitted model as a Plumber web service in Kubernetes, using Azure Container Registry (ACR) and Azure Kubernetes Service (AKS).
* [Reflections on the 10th anniversary of the Revolutions blog][9]. Oh, and while we are on the subject [Revolution Analytics][re], a huge Happy 10:th Anniversary to you!
* [The Billion Data Point Challenge: Building a Query Engine for High Cardinality Time Series Data][10]. This blog post discusses the challenges Uber had when building their in-house metrics solution, and the query engine for that solution.

## Streaming

* [Scaling Apache Kafka at Pinterest][11]. Apache Kafka is used at Pinterest for transporting data for real-time streaming applications, logging and visibility metrics for monitoring. The installation runs on over 2000 brokers and handles more than 800 million messages and 1.2 Petabytes per day. This [InfoQ][iq] article talks about how  Pinterest scales Kafka.
* [Deep Dive into KSQL Deployment Options][12]. This blog post provides first a brief overview of Kafka Streams and its execution model, and then it discusses KSQL deployment options.

## SQL Server 2019

* [Announcing SQL Server 2019 community technology preview 2.2][13]. The title of this blog post says it all. CTP 2.2 of SQL Server 2019 is released. Go and get it!
* [Availability Groups on Kubernetes in SQL Server 2019 preview][14]. This post discusses the ability to deploy a SQL Server 2019 container with Availability Groups on Kubernetes.

## WIND (What Is Niels Doing)

I am continuing my Java and SQL Server 2019 journey. I am very close to finishing a post about how to deal with null values in the SQL Server 2019 Java Extension. It is a continuation of these posts:

* [SQL Server 2019 Extensibility Framework & Java - Hello World][16]. In this post, I take a look at how to install and enable the SQL Server 2019 Java extensions. The post finishes with some very simple Java code which I execute from SQL Server.
* [SQL Server 2019 Extensibility Framework & Java - Passing Data][15]. In this post, I look at how we pass data back and forth between SQL Server and Java.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me. Seeing that holidays are coming up - have a Great Holiday Season!!

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/
[charlblog]: https://charlla.com/
[mattblog]: https://mattwarren.org/

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

[1]: https://www.infoq.com/presentations/netflix-play-api
[2]: https://www.infoq.com/presentations/net-mocking-framework
[3]: https://mattwarren.org/2018/12/13/Exploring-the-.NET-Core-Runtime/
[4]: https://natemcmaster.com/blog/2017/12/21/netcore-primitives/
[5]: https://www.infoq.com/articles/netcore-devops
[6]: https://azure.microsoft.com/en-us/blog/azure-functions-now-supported-as-a-step-in-azure-data-factory-pipelines/
[7]: https://www.infoq.com/articles/machine-learning-learn-devops
[8]: https://blog.revolutionanalytics.com/2018/12/azurecontainers.html
[9]: https://blog.revolutionanalytics.com/2018/12/ten-years-of-revolutions.html
[10]: https://eng.uber.com/billion-data-point-challenge
[11]: https://www.infoq.com/news/2018/12/pinterest-kafka-scaling
[12]: https://www.confluent.io/blog/deep-dive-ksql-deployment-options
[13]: https://cloudblogs.microsoft.com/sqlserver/2018/12/10/announcing-sql-server-2019-community-technology-preview-2-2/
[14]: https://cloudblogs.microsoft.com/sqlserver/2018/12/10/availability-groups-on-kubernetes-in-sql-server-2019-preview/
[15]: {{< relref "2018-12-08-sql-server-2019-extensibility-framework--java---passing-data.md" >}}
[16]: {{< relref "2018-12-02-sql-server-2019-extensibility-framework--java---hello-world.md" >}}