---
type: post
layout: "post"
title: Interesting Stuff - Week 15, 2019
author: nielsb
date: 2019-04-14T18:24:53+02:00 
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
  - Kafka
  - .NET
  - Azure
  - Cosmos DB
  - Kubernetes
description: Kafka, Kubernetes, Azure Cosmos DB, SQL Server Machine Learning Services, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - Kafka
  - .NET
  - Azure
  - Cosmos DB
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

<!--more-->

## .NET

* [Enabling .NET Apps with Monitoring and Management Using Steeltoe][1]. An [InfoQ][iq] presentation discussing using the Steeltoe Management framework to enable a .NET application with performance monitoring, management diagnostic endpoints, and distributed tracing on PCF.

## Distributed Computing

* [From Bare-Metal To Kubernetes][2]. A very interesting blog post which talks about going from a bare metal infrastructure to a highly scalable Kubernets infrastructure running in the cloud. If you are thinking about moving to Kubernetes, the post is well worth a read.

## Azure

* [Azure Cosmos DB: Microsoft's Cloud-Born Globally Distributed Database][3]. An excellent blog post by [Murat][murba] where he discusses the workings of Azure Cosmos DB. This post is a must read if you are interested in the inner workings of Cosmos DB.

## Streaming

* [Monitoring Data Replication in Multi-Datacenter Apache Kafka Deployments][4]. A blog post which describes how to use Confluent Replicator and Confluent Control Center to monitor Kafka deployment and replication between multiple data centers. 

## SQL Server Machine Learning Services

* [Installing R Packages in SQL Server Machine Learning Services - III][pkg3]. Six months after I posted the [second post][pkg2] in the [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) series I posted the third "episode". In this post, we look at how to install R packages in SQL Server Machine Learning Services using the T-SQL DDL command `CREATE EXTERNAL LIBRARY`.

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

[1]: https://www.infoq.com/presentations/steeltoe-pcf
[2]: http://highscalability.com/blog/2019/4/8/from-bare-metal-to-kubernetes.html
[3]: http://muratbuffalo.blogspot.com/2019/04/azure-cosmos-db-microsofts-cloud-born.html
[4]: https://www.confluent.io/blog/monitoring-data-replication-in-multi-datacenter-apache-kafka-deployments

[pkg2]: {{< relref "2018-06-30-installing-r-packages-in-sql-server-machine-learning-services---ii.markdown" >}}
[pkg3]: {{< relref "2019-04-10-installing-r-packages-in-sql-server-machine-learning-services---iii.md" >}}
