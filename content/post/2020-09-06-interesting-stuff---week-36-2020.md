---
type: post
layout: "post"
title: Interesting Stuff - Week 36, 2020
author: nielsb
date: 2020-09-06T08:40:13+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server
  - big data
  - kafka
  - Derivco
  - Azure
description: Kafka, Confluent Cloud & Azure, Presto & analytics, Derivco webinar, and other interesting topics.
keywords:
  - distributed computing
  - SQL Server
  - big data
  - kafka
  - Derivco
  - Azure   
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

* [Microservices with event sourcing using .NET Core][1]. This post looks at how to implement and structure an API using microservices and event sourcing. The article is very interesting, and it definitely gives "food for thought"!
* [Introducing the Half type!][2]. The title of the post says it all. Microsoft introduces a new type in .NET 5 - the `Half` type, which is `binary16`. The reason for this is that many computation workloads already take advantage of the `Half` type: machine learning, graphics cards, etc.

## Big Data

* [Introducing Presto][3]. Presto is a distributed SQL query engine, and it is designed to efficiently query data against disparate data sources of all sizes, ranging from gigabytes to petabytes. This post introduces Presto and looks at how Presto works. I find Presto very interesting in that we can use Presto to query Kafka!

## Streaming

* [Creating a Serverless Environment for Testing Your Apache Kafka Applications][4]. This post looks at how to use the `ccloud-stack` utility to create a serverless Kafka environment and how to use the Confluent Cloud CLI to provision a fully managed Datagen connector to pre-populate Kafka topics for your applications to use. Stay tuned for a blog-post from me where I test this out!
* [Enabling the Deployment of Event-Driven Architectures Everywhere Using Microsoft Azure and Confluent Cloud][5]. It becomes more and more common that we operate in a hybrid on-prem -> cloud environment. Data migration can be a complex process. This post looks at how to build a persistent bridge from on-premises or other clouds to Microsoft Azure using Confluent Replicator.

## WIND (What Is Niels Doing)

Back in May I did together with [Charl][charlblog] a [Derivco](/derivco) webinar around [Kafka][6]. This coming week, (Thursday, Sep. 10), I am doing another webinar - this time about SQL Server 2019 Big Data Cluster. The webinar is open to everyone, and you can sign up [here][7].

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


[1]: https://medium.com/@madslundt/microservices-with-event-sourcing-using-net-core-33e3074171f5
[2]: https://devblogs.microsoft.com/dotnet/introducing-the-half-type/
[3]: https://medium.com/oreillymedia/introducing-presto-839a26aac724
[4]: https://www.confluent.io/blog/testing-kafka-applications/
[5]: https://www.confluent.io/blog/confluent-cloud-enables-event-driven-architectures-everywhere-in-azure/
[6]: https://www.youtube.com/watch?v=CSyNiEgEyvY
[7]: https://derivco.co.za/derivco-webinar-a-lap-around-sql/
