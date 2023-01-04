---
type: post
layout: "post"
title: Interesting Stuff - Week 42, 2022
author: nielsb
date: 2022-10-23T08:38:09+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/kubernetes-2.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Machine Learning
  - data architecture
  - Kafka
  - ksqlDB
description: ksqlDB new version released, new features in Azure Data Explorer, Netflix AI/ML orchestrator, Dapr & AKS, and other interesting topics.
keywords:
  - Azure Data Explorer
  - Machine Learning
  - data architecture
  - Kafka
  - ksqlDB   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth that has to do with things that interest me:

* AI/data science
* data in general
* data architecture
* streaming
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Azure Data Explorer

* [What's New in Azure Synapse Data Explorer – Ignite 2022 !][1]. Microsoft Ignite was held October 12 - 14., As always, there were a lot of exciting announcements. This post looks at what was announced for **Azure Data Explorer**. A lot of cool stuff!

## Distributed Computing

* [Polyglot Microservices Communication Using Dapr on AKS][2]. Dapr is a useful tool for solving several challenges engineers might face when developing microservices. This post looks at using Dapr on Azure AKS and how to communicate between microservices. The post comes at a perfect time for us at [Derivco](/derivco) as we are going "all-in" on AKS and Dapr.

## Data Architecture

* [Orchestrating Data/ML Workflows at Scale With Netflix Maestro][3]. This Netflix blog post, introduces and shares learnings on Maestro. Maestro is a workflow orchestrator for data and machine learning pipelines that schedules and manages workflows at a massive scale. Really interesting!

## Streaming

* [Announcing ksqlDB 0.28.2 and Improvements to ksqlDB in Confluent Cloud][4]. The title says it all! ksqlDB 0.28.2 is released. What I find really interesting in this release is the new Terraform support. At [Derivco](/derivco), we are implementing Infrastructure as Code, and the ksqlDB Terraform support will make things much easier.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. Please comment on this post or [ping][ma] me if you have ideas for what to cover.

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
[netflx]: https://netflixtechblog.com/

[1]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/what-s-new-in-azure-synapse-data-explorer-ignite-2022/ba-p/3649457
[2]: https://www.infoq.com/articles/polygot-microservices-dapr-aks/
[3]: https://netflixtechblog.com/orchestrating-data-ml-workflows-at-scale-with-netflix-maestro-aaa2b41b800c
[4]: https://www.confluent.io/blog-v2/announcing-ksqldb-0-28-2-and-improvements-to-ksqldb-in-confluent-cloud/
