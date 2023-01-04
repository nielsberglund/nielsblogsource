---
type: post
layout: "post"
title: Interesting Stuff - Week 16, 2019
author: nielsb
date: 2019-04-21T16:36:40+02:00
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
  - Azure Data Studio
  - Azure Databricks
  - Kafka
  - KSQL 
description: Kafka and KSQL, Azure Databricks, Azure Data Studio, Docker and Kubernetes and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - Azure Data Studio
  - Azure Databricks
  - Kafka
  - KSQL    
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

* [Announcing .NET Core 3 Preview 4][1]. Some new interesting features in Preview 4 of .NET Core 3.0. Hope we'll see RTM soon.

## Distributed Computing

* [Learn Enough Docker to be Useful Part 1: The Conceptual Landscape][2]. This post is the first "episode" in a series about how to learn Docker. It is excellent, and for a Docker newbie as myself quite invaluable!
* [Key Kubernetes Concepts][3]. This article covers essential Kubernetes concepts, and it’ll help you make a mental model of the most important Kubernetes terms to speed your understanding of the technology.
* [Data Lake: an asset or a liability?][4]. This post looks at several important points to take into account when starting a Data Lake project. 

## SQL Server

* [The April release of Azure Data Studio is now available][5]. As the title says; Microsoft has released a new version (April 2019) of Azure Data Studio. There are quite a few new interesting features, and I cannot wait to try out the [SandDance][6] extension.

## Data Science

* [How to create your own Deep Learning Project in Azure][7]. In this article, the author takes us through how to use Azure Databricks with Tensorflow and Keras to build a deep learning project. 
* [Automated machine learning from SQL Server with Azure Machine Learning][8]. This post discusses how to leverage Azure Machine Learning Service from SQL Server Machine Learning Services.

## Streaming

* [Kafka Summit New York 2019 Session Videos][9]. The Kafka Summit took place in New York earlier this month. This post links to the session videos. 
* [Dawn of DevOps: Managing and Evolving Schemas with Confluent Control Center][10]. This post is the first in a three-part series of DevOps related "stuff". This first post looks at how to use Confluence Control Center to manage and evolve schemas.
* [Beat Cache Invalidation in ASP.NET Core Using Kafka and Debezium][11]. This article discusses how to create a better in-memory cache in ASP.NET Core by using Change Data Capture on a database to send events to Apache Kafka via Debezium.
* [Pivoting Aggregates in Ksql][12]. This is an excellent post by [Robin][rmoff] where he show how we can do pivoting of aggregates in KSQL.

## SQL Server Machine Learning Services

* [Installing R Packages in SQL Server Machine Learning Services - IV: Permissions][pkg4]. In this post, I look at permissions required when using `CREATE EXTERNAL LIBRARY` as well as ownership of the created libraries.

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

[1]: https://devblogs.microsoft.com/dotnet/announcing-net-core-3-preview-4/
[2]: https://towardsdatascience.com/learn-enough-docker-to-be-useful-b7ba70caeb4b
[3]: https://towardsdatascience.com/key-kubernetes-concepts-62939f4bc08e
[4]: https://towardsdatascience.com/https-medium-com-bachwehbi-data-lake-an-asset-or-a-liability-c424c74cfde8
[5]: https://cloudblogs.microsoft.com/sqlserver/2019/04/18/the-april-release-of-azure-data-studio-is-now-available/
[6]: https://microsoft.github.io/SandDance/
[7]: https://towardsdatascience.com/how-to-create-your-own-deep-learning-project-in-azure-509660d8297
[8]: https://cloudblogs.microsoft.com/sqlserver/2019/04/16/automated-machine-learning-from-sql-server-with-azure-machine-learning/
[9]: https://www.confluent.io/blog/kafka-summit-new-york-2019-session-videos
[10]: https://www.confluent.io/blog/dawn-of-devops-managing-and-evolving-schemas-with-confluent-control-center
[11]: https://towardsdatascience.com/beat-cache-invalidation-in-asp-net-core-using-kafka-and-debezium-65cd1d80554d
[12]: https://rmoff.net/2019/04/17/pivoting-aggregates-in-ksql/
[pkg4]: {{< relref "2019-04-21-installing-r-packages-in-sql-server-machine-learning-services---iv.md" >}}
