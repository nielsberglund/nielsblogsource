---
type: post
layout: "post"
title: Interesting Stuff - Week 17, 2020
author: nielsb
date: 2020-04-26T09:53:33+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server 2019 Extensibility Framework
  - SQL Server 2019 Big Data Cluster
  - Kafka
  - Java
  - Big Data
description: Kafka, Java language in SQL Server, Big Data Cluster, and other interesting topics.
keywords:
  - SQL Server 2019 Extensibility Framework
  - SQL Server 2019 Big Data Cluster
  - Kafka
  - Java
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

## Event Driven Architecture

* [Why Your Microservices Architecture Needs Aggregates][1]. In this post, the author looks at what aggregates are and how they can help in the long run. In essence, the author discusses the Aggregate Pattern, where an aggregate is a cluster of domain objects that can be treated as a single unit.

## Big Data

* [Beyond the Distributed Monolith: Rearchitecting the Big Data Platform][2]. In this [InfoQ][iq] presentation, the presenter talks about how BBC re-architected a distributed monolith, and how they designed their new microservices architecture. A very interesting presentation!

## SQL Server 2019 Extensibility Framework

* [Open sourcing the Java language extension for SQL Server][3]. If you follow my blog, you may be aware that I have been writing about the [SQL Server Extensibility Framework, and the Java Language Extension](/s2k19_ext_framework_java). The Java language extension has now been open-sourced, and the post linked to here discusses that. What this means is that anyone interested can now create a language extension for their favorite language! That.Is.So.Awesome!

## SQL Server 2019 Big Data Cluster

* [A Lap Around SQL Server 2019 Big Data Cluster: Background & Technology][4]. Finally! I finally managed to get this post out of me. The post is a blog version of a conference talk I do: **A Lap Around SQL Server 2019 Big Data Cluster**. Initially, I thought I would get away with one post covering the talk, but I realised while writing the post that it requires a couple of more posts. So, this, the first, post looks at the background of the **SQL Server 2019 Big Data Cluster**, and the technology behind it.

## Streaming

* [KaDeck – Master your Apache Kafka blackbox][5]. This link here is to a Kafka tool which enables you to manage and connect securely to your Apache Kafka clusters, as well as monitor and manage your topics and create reports etc. It looks quite useful, I must say!
* [Webify Event Streams Using the Kafka Connect HTTP Sink Connector][6]. This post looks at how easy it is to push events from Kafka to web pages using the Kafka connector for HTTP.
* [Introducing Confluent Platform 5.5][7]. Hot on the heels of the release of Apache Kafka 2.5 comes the release of Confluent Platform 5.5, The post linked to here looks at some of the new features in the 5.5 release.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me. Most importantly, stay safe out there!

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


[1]: https://medium.com/better-programming/why-your-microservices-architecture-needs-aggregates-342b16dd9b6d
[2]: https://www.infoq.com/presentations/bbc-distributed-monolith-microservices/
[3]: https://cloudblogs.microsoft.com/sqlserver/2020/04/22/open-sourcing-the-java-language-extension-for-sql-server/
[4]: {{< relref "2020-04-26-a-lap-around-sql-server-2019-big-data-cluster.md" >}}
[5]: https://www.xeotek.com/kadeck/
[6]: https://www.confluent.io/blog/webify-event-streams-using-kafka-connect-http-sink/
[7]: https://www.confluent.io/blog/introducing-confluent-platform-5-5/
