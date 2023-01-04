---
type: post
layout: "post"
title: Interesting Stuff - Week 50, 2020
author: nielsb
date: 2020-12-13T09:49:39+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - Sql Server 2019 Big Data Cluster
  - Kafka
  - ksqlDB
description: Kafka & transactional machine learning, distributed query engines, SQL Big Data Cluster, and other interesting topics!
keywords:
  - data science
  - distributed computing
  - Sql Server 2019 Big Data Cluster
  - Kafka
  - ksqlDB   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending.

> **NOTE:** *It is now coming up on Christmas and New Year, and I will take a break with these posts and come back in the beginning of next year.*

<!--more-->

## SQL Server 2019 Big Data Cluster (BDC)

* [SQL Server Big Data Clusters CU8 release surfaces Encryption at Rest capabilities and more][1]. The latest cumulative update, (CU8), for SQL Server 2019 BDC includes several fixes, optimizations and adds two main capabilities for SQL Server BDC. This post looks at some of the major improvements, provides additional context to understand the design behind these capabilities better, and points you to relevant resources to learn more and get you started.

## Distributed Computing

* [The InfoQ eMag - Real World Chaos Engineering][2]. This [InfoQ][iq] post links to a download of an "eMag" around chaos engineering. The eMag pulls together a variety of case studies to show mechanisms by which you can implement chaos engineering.
* [Grafana Announces Grafana Tempo, a Distributed Tracing System][3]. The [InfoQ][iq] article linked to here looks at Grafana Tempo, the distributed tracing backend recently released by Grafana Labs. Grafana Tempo integrates with any existing logging system to create links from trace IDs in log lines, and it only requires object storage like Amazon S3 or Google Cloud Storage (GCS) to operate. 

## Data

* [How Can Presto And Starburst Data Improve Your Data Analytics][4]. At [Derivco](/derivco) we have started looking at Presto. Presto is an open-source distributed SQL query engine for running interactive analytic queries against data sources of all sizes ranging from gigabytes to petabytes. This post looks more in detail what Presto is and why companies are using it.
* [Mix SQL and Machine Learning and leverage your computation cluster][5]. The post linked to above discussed Presto. This post looks at another distributed SQL query engine - [dask-sql][6]. In the post, the author examines what dask-sql is and how it can be used in machine learning scenarios. Very cool!

## Data Science

* [No Code Data Enrichment with Azure Synapse and Azure Machine Learning][7]. This post will walk through how to train and evaluate Azure ML AutoML Regressions model on your data using Azure Synapse Analytics Spark and SQL pools. Quite interesting!
* [Transactional Machine Learning at Scale with MAADS-VIPER and Apache Kafka][8]. The post linked to here shows how transactional machine learning (TML) integrates data streams with automated machine learning (AutoML). Apache Kafka is used as the data backbone, and it allows the creation of a frictionless machine learning process. 

## Streaming

* [Event Streaming Applications with Zero Infrastructure][9]. In this YouTube video, [Tim Berglund][10], (from Confluent), demos how you can quickly spin up new event streaming applications with ksqlDB, Kafka, and connectors, all in a fully managed way on Confluent Cloud.
* [Apache Kafka Lag Monitoring at AppsFlyer][11]. One crucial aspect of every distributed system is visibility - how do you see what's going on? In streaming applications, it is vital that we can see if consumers are lagging. The post linked to here looks at how one can implement a system for monitoring lag in Kafka. 

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


[1]: https://techcommunity.microsoft.com/t5/sql-server/sql-server-big-data-clusters-cu8-release-surfaces-encryption-at/ba-p/1956946
[2]: https://www.infoq.com/minibooks/chaos-engineering/
[3]: https://www.infoq.com/news/2020/12/grafana-tempo-distributed-tracin/
[4]: https://www.theseattledataguy.com/how-can-presto-and-starburst-data-improve-your-data-analytics/
[5]: https://towardsdatascience.com/deploying-a-python-sql-engine-to-your-cluster-76a590940977
[6]: https://nils-braun.github.io/dask-sql/
[7]: https://medium.com/microsoftazure/no-code-data-enhancement-with-azure-synapse-analytics-and-azure-auto-ml-cb9d97fb0c26
[8]: https://www.confluent.io/blog/transactional-machine-learning-with-maads-viper-and-apache-kafka/
[9]: https://www.youtube.com/watch?v=KR9yvcNBFIw
[10]: https://twitter.com/tlberglund
[11]: https://www.confluent.io/blog/kafka-lag-monitoring-and-metrics-at-appsflyer/
