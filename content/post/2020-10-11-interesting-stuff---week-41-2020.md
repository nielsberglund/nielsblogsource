---
type: post
layout: "post"
title: Interesting Stuff - Week 41, 2020
author: nielsb
date: 2020-10-11T08:57:28+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - SQL Server 2019 Big Data Cluster
  - Azure Kubernetes Service
  - Kafka Connect 
description: Trace Kafka messages, link Kafka clusters, start and stop Big Data Clusters, and other interesting topics.
keywords:
  - Kafka
  - SQL Server 2019 Big Data Cluster
  - Azure Kubernetes Service
  - Kafka Connect    
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

## SQL Server 2019 Big Data Cluster

* [Stop and Start your AKS Big Data Cluster and Save $$$][1]. In this post, my good friend [Mohammad][2] looks at new functionality in Azure Kubernetes Service, (AKS), whereby you can start and stop Kubernetes clusters at will. Mohammad looks at it from the perspective of SQL Server 2019 Big Data Clusters running in AKS.

## Streaming

* [Kafka record tracing][3]. Do you know how long it takes for messages to flow in your data pipeline? Do you know where the bottlenecks are? Why I ask these questions is that in a distributed system, the answers may not always be that easy to find. The post linked to here looks at solutions to these questions, and it looks at distributed tracing for Kafka.
* [Introducing Cluster Linking in Confluent Platform 6.0][4]. As the title of this post says, the post is about linking Kafka clusters to each other. From the post: "Replicating topics between Kafka clusters has been a long-standing problem that’s seen a number of solutions, including MirrorMaker and Confluent Replicator. Although the utility of these projects has come a long way, they’re not without their respective issues.". The issues referred to in the previous sentence, is what the new cluster linking functionality is supposed to fix. It looks very promising, the one question I have right now is if this is a Confluent Platform Enterprise only functionality?
* [Managing Kafka Connectors at scale using Kafka Connect Manager][5]. A while back we, ([Derivco](/derivco)), looked at using CDC and Debezium to get data out from the database to Kafka. One of the problems we faced was how to manage the various Kafka Connectors, and ensure they were functioning correctly. The post I link to here would have been the perfect solution for us - a framework for managing Kafka Connectors. It would be interesting to know if it is open-sourced.

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


[1]: https://mohammaddarab.com/stop-and-start-your-aks-big-data-cluster-and-save-money/
[2]: https://twitter.com/mwdarab
[3]: https://medium.com/data-rocks/kafka-record-tracing-379ed2b0af51
[4]: https://www.confluent.io/blog/kafka-cluster-linking-with-confluent-platform/
[5]: https://medium.com/data-rocks/managing-kafka-connectors-at-scale-using-kafka-connect-manager-kcm-31d887de033c
