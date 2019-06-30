---
type: post
layout: "post"
title: Interesting Stuff - Week 7, 2019
author: nielsb
date: 2019-02-17T08:20:06+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server
  - Azure Data Studio
  - Kafka
  - Kubernetes
  - Big Data
description: Kafka, Azure Data Studio, Kubernetes Clusters, and other cool topics!
keywords:
  - SQL Server
  - Azure Data Studio
  - Kafka
  - Kubernetes
  - Big Data   
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

* [Chaos Engineering with Containers][1]. This [InfoQ][iq] presentation discusses the benefits of using Chaos Engineering to inject failures to make container infrastructure more reliable.
* [The 10 Kubernetes Commandments][2]. The presenters in this [InfoQ][iq] presentation explore topics from booting Kubernetes clusters to running complex workloads as a list of 10 items. They share ideas that teams can employ to make working Kubernetes less of a chore and more of a way of life.
* [The Highs and Lows of Stateful Containers][3]. So far, it has been a lot of containers and [InfoQ][iq] presentations, and the third item this week is more of the same. In this [InfoQ][iq] presentation the presenter walks through his experiences of how to reliably run a distributed database on Kubernetes, and optimize its performance. He looks at what kinds of stateful applications can most easily be run in containers, and some pitfalls he encountered along the way.

## SQL Server

* [The February release of Azure Data Studio is now available][4]. I must say that Azure Data Studio (ADS) has grown on me, and now I use it almost exclusively (instead of SQL Server Management Studio). The post I link to here announces the latest release of ADS with quite a few new features. Go and grab it, and see what you think.

## Streaming

* [Kafka Connect JDBC Source Connector – Deep Dive][5]. An excellent blog post by [Robin Moffat][rmoff], where he drills deep into the inner workings of the Kafka Connect JDBC connector. 
* [Journey to Event Driven – Part 2: Programming Models for the Event-Driven Architecture][6]. In [Interesting Stuff - Week 5, 2019][7] I linked to [Journey to Event Driven – Part 1: Why Event-First Thinking Changes Everything][8]. This weeks blog post is part 2 of the series, and it looks at different styles of event-driven architectures and compares and contrasts scaling, persistence and runtime models.

## Azure Force Recon

I just want to remind you of the [Azure Force Recon][9] boot camp held here in Durban February 23. I have the privilege to do a presentation: [Live and Die with your Data][10], where I talk about SQL Server 2019 Big Data Clusters. So, if you do not have anything else to do, sign up and come and hear about Azure!

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

[1]: https://www.infoq.com/presentations/chaos-engineering-gamedays
[2]: https://www.infoq.com/presentations/10-kubernetes
[3]: https://www.infoq.com/presentations/kubernetes-stateful-containers
[4]: https://cloudblogs.microsoft.com/sqlserver/2019/02/13/the-february-release-of-azure-data-studio-is-now-available/
[5]: https://www.confluent.io/blog/kafka-connect-jdbc-source-connector-deep-dive
[6]: https://www.confluent.io/blog/journey-to-event-driven-part-2-programming-models-event-driven-architecture
[7]: {{< relref "2019-02-03-interesting-stuff---week-5-2019.md" >}}
[8]: https://www.confluent.io/blog/journey-to-event-driven-part-1-why-event-first-thinking-changes-everything
[9]: https://www.meetup.com/Azure-Transformation-Labs/events/258705868/
[10]: https://www.linkedin.com/feed/update/activity:6500043306041384960/
