---
layout: post
title: Interesting Stuff - Week 24
author: nielsb
date: 2018-06-17T19:29:19+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - KSQL
  - Azure EventHubs
  - Azure Data Lake Store
  - .NET Internals
  - .NET
  - Docker
description: Kafka and EventHubs, Kafka and KSQL, how Uber tackles fraud, .NET and Docker and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - KSQL
  - Azure EventHubs
  - Azure Data Lake Store
  - .NET Internals
  - .NET
  - Docker   
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

* [Using .NET and Docker Together – DockerCon 2018 Update][5]. What the title says; how to use .NET and Docker together.
* [Tools for Exploring .NET Internals][6]. An excellent write up by [Matthew][mattw] about tools you can use to better understand what goes on in the CLR.

## Big Data / Cloud

* [Control Azure Data Lake costs using Log Analytics to create service alerts][7]. This blog post talks about Azure Data Lake Store (ADLS) and [Azure Log Analytics][8] (ALA) and how you can use ALA to control ADLS costs. Very informative!
* [Metacat: Making Big Data Discoverable and Meaningful at Netflix][9]. This post is about Netflix Metacat system. A system that acts as a federated metadata access layer for all data stores Netflix has.

## Distributed Computing

* [Medea: scheduling of long running applications in shared production clusters][10]. [Adrian][adcol] dissects a white paper about Medea. Medea is designed to support the use case of mixed long running applications and shorter duration tasks within the same cluster.

## Streaming

* [Acessing Event Hubs with Confluent Kafka Library][1]. Last month - some time - Microsoft announced EventHubs support for the Kafka protocol. What Kafka protocol support means is that you can use the Kafka client libraries to ingest data into an EventHub, sweet! This blog post shows an example of how to do that.
* [Deploying Kafka on Kubernetes with Local Persistent Volumes using Strimzi][3]. So [Strimzi][3] is a system which provides the ability to run Kafka clusters on OpenShift and Kubernetes. The blog post discusses various Kafka storage options when running Kafka this way.
* [Democratizing Stream Processing with Apache Kafka and KSQL][4]. An article which discusses stream processing with KSQL, the streaming SQL engine for Apache Kafka, and how KSQL helps to bridge the world of streams and databases through streams and tables.

## Data Science

* [Advanced Technologies for Detecting and Preventing Fraud at Uber][11]. A blog post discussing how Uber leverages cutting-edge systems to tackle fraud on their platform. 

## SQL Server Machine Learning Services

At the moment I have two posts about **SQL Server Machine Learning Services** "on the go". The first is the never-ending follow-up post to my [sp_execute_external_script and SQL Compute Context - I][ctx1] post from four weeks ago. I can not seem to get that one done.

The second is a post about the options you have if you want to install R packages into **SQL Server Machine Learning Services**. For that one I have good hopes to be able to publish this coming week sometime.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/

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


[series]: <> (/series/sql_server_2k16_r_services)

[ctx1]: {{< relref "2018-05-20-sp-execute-external-script-and-sql-compute-context.markdown" >}}


[1]: https://notetoself.tech/2018/06/03/acessing-event-hubs-with-confluent-kafka-library/
[2]: https://www.linkedin.com/pulse/deploying-kafka-kubernetes-local-persistent-volumes-using-scholz/
[3]: http://strimzi.io/
[4]: https://www.infoq.com/articles/democratizing-stream-processing-apache-kafka-ksql
[5]: https://blogs.msdn.microsoft.com/dotnet/2018/06/13/using-net-and-docker-together-dockercon-2018-update/
[6]: http://mattwarren.org/2018/06/15/Tools-for-Exploring-.NET-Internals/
[7]: https://azure.microsoft.com/en-us/blog/control-azure-data-lake-costs-using-log-analytics-to-create-service-alerts/
[8]: https://azure.microsoft.com/en-us/services/log-analytics/
[9]: https://medium.com/netflix-techblog/metacat-making-big-data-discoverable-and-meaningful-at-netflix-56fb36a53520
[10]: https://blog.acolyer.org/2018/06/13/medea-scheduling-of-long-running-applications-in-shared-production-clusters/
[11]: https://eng.uber.com/advanced-technologies-detecting-preventing-fraud-uber/
