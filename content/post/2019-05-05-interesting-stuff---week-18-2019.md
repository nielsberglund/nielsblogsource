---
type: post
layout: "post"
title: Interesting Stuff - Week 18, 2019
author: nielsb
date: 2019-05-05T07:13:49+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - Kafka
  - PipelineDB
  - .NET Core
  - Docker
description: Kafka & PipelineDB, .NET Core & Docker, Databricks, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - Kafka
  - PipelineDB
  - .NET Core
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

## Distributed Computing

* [Designing Distributed Systems with TLA+][]. An [InfoQ][iq] presentation where the presenter discusses the ideas behind TLA+, which is a specification language that describes a system, its properties, and how it works.

## .NET

* [Using .NET and Docker Together – DockerCon 2019 Update][2]. This post is about the improvements and new features in .NET Core 3.0 related to Docker and running your code in Docker.

## Databases

* [YugaByte DB - A Planet-scale Database for Low Latency Transactional Apps][3]. This is an [InfoQ][iq] presentation introducing and demoing YugaByte DB, a large scale DB, highlighting distributed transactions with global consistency.

## Data Science

* [Detecting Financial Fraud at Scale with Decision Trees and MLflow on Databricks][4]. An excellent post about how to use Databricks to detect fraud. Why I like this article is because of the sample code, it makes it easy to follow along.

## Streaming

* [Optimizing Kafka Streams Applications][5]. This article discusses how one can optimize Kafka Stream applications based on the new processor topology optimization framework which Kafka Streams 2.1 introduced.
* [The PipelineDB Team Joins Confluent][6]. I had no idea that [PipelineDB][7] existed before this blog post. In my mind, PipelineDB joining Confluent can be huge, and I cannot wait to see what they dream up.
* [Load-Balanced Apache Kafka: Derivco's Globally Distributed Gaming Business][8]. My colleague [Charl Lamprecht][charl] and I had the pleasure of being interviewed by Tim Berglund (no relations) for a Kafka podcast. We, or rather Charl as I had audio issues, spoke about Kafka, load balancing via F5's and the journey we have had to get Kafka implemented in [Derivco](/derivco).

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
[pipldb]: https://twitter.com/pipelinedb

[1]: https://www.infoq.com/presentations/tla-plus
[2]: https://devblogs.microsoft.com/dotnet/using-net-and-docker-together-dockercon-2019-update/
[3]: https://www.infoq.com/presentations/yugabytedb
[4]: https://databricks.com/blog/2019/05/02/detecting-financial-fraud-at-scale-with-decision-trees-and-mlflow-on-databricks.html
[5]: https://www.confluent.io/blog/optimizing-kafka-streams-applications
[6]: https://www.confluent.io/blog/pipelinedb-team-joins-confluent
[7]: https://www.pipelinedb.com/
[8]: https://www.buzzsprout.com/186154/1073627-load-balanced-apache-kafka-derivco-s-globally-distributed-gaming-business
