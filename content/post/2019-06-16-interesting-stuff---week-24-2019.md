---
type: post
layout: "post"
title: Interesting Stuff - Week 24, 2019
author: nielsb
date: 2019-06-16T11:12:38+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - Kafka
  - Docker
  - Petastorm
description: Linux and Windows Docker containers, Petastorm Uber, YugaByte DB, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - Kafka
  - Docker
  - Petastorm  
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

## Databases

* [Why Distributed SQL Beats Polyglot Persistence for Building Microservices?][1]. It is a common belief, (misconception?), that in the microservices world, each microservice should have its own persistence store - polyglot persistence. The blog post I link to here highlights the loss of agility that microservices development and operations suffer when adopting polyglot persistence. The post reviews how distributed SQL serves as an alternative approach that doesn't compromise this agility.

## Misc.

* [Windows and Linux Docker Containers: Side by Side!][2]. Docker is awesome! One thing though, it is near impossible to run Windows and Linux containers side by side. Wouldn't it be great if you could? That is what this blog post discusses! Good stuff! 

## Data Science

* [Petastorm: A Light-Weight Approach to Building ML Pipelines][3]. This is an [InfoQ][iq] presentation describing how [Petastorm][4] facilitates tighter integration between Big Data and Deep Learning worlds; simplifies data management and data pipelines; and speeds up model experimentation.

## WIND (What Is Niels Doing)

Right now, I am busy finishing off a blog post looking at the Confluent Platform, (Kafka), from the perspective of a .NET developer on the Windows platform. I hope to publish the post sometime this coming week.

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

[1]: https://medium.com/yugabyte/why-distributed-sql-beats-polyglot-persistence-for-building-microservices-c19dc76b16d0
[2]: https://www.paraesthesia.com/archive/2019/06/12/windows-and-linux-docker-containers-side-by-side/
[3]: https://www.infoq.com/presentations/petastorm-ml-pipelines/
[4]: https://eng.uber.com/petastorm/
