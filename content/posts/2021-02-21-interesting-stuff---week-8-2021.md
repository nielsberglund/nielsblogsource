---
type: post
layout: "post"
title: Interesting Stuff - Week 8, 2021
author: nielsb
date: 2021-02-21T08:56:02+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - big data
  - SQL Server 2019 Big Data Cluster
  - Kafka
  - ZooKeeper
  - ksqlDB
description: Kafka & ZooKeeper, keys in ksqlDB, Uber does log analytics, SQL Server Big Data Cluster, and other interesting topics.
keywords:
  - big data
  - SQL Server 2019 Big Data Cluster
  - Kafka
  - ZooKeeper
  - ksqlDB   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth that has to do with things that interest me:

* AI / data science
* data in general
* data architecture
* streaming
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## .NET

* [Announcing Dapr v1.0][1]. As the title implies, this post announces version 1.0 of the Distributed Application Runtime, (Dapr). Dapr lowers the bar for entry to build microservices applications, running on self-hosted infrastructure or Kubernetes.

## SQL Server Big Data Cluster

* [What's new with SQL Server Big Data Clusters][2]. Microsoft released SQL Server 2019 CU9 recently, and subsequently, there is a CU9 release for SQL Server 2019 Big Data Cluster, (BDC). The post linked to discusses some of the new features in this release. I guess I better upgrade my existing BDC installation and take CU9 "for a spin".

## Big Data

* [Fast and Reliable Schema-Agnostic Log Analytics Platform][6]. This post by Uber looks at their platform for log analytics and how it has evolved. It is a really interesting post, and I think we at [Derivco](/derivco) definitely can learn a thing or two from what they have done.

## Streaming

* [Announcing ksqlDB 0.15][3]. I last week's [roundup][4], I wrote about Confluent Platform 6.1 being released, and with that exciting new ksqlDB features. This post announces a new ksqlDB version and lists some of the features in this version.
* [42 Things You Can Stop Doing Once ZooKeeper Is Gone from Apache Kafka][5]. There has been work underway for quite a time now to remove Kafka's dependency on ZooKeeper. We are getting closer and closer to this being achieved, and the post linked to looks at some of the "stuff" we no longer need to "worry" about when the ZooKeeper dependency is gone.
* [Keys in ksqlDB, Unlocked][7]. Above, I linked to the post announcing ksqlDB 0.15. The post here looks at one specific new feature in the 0.15 release; support for many more types of data in messages keys, including message keys with multiple columns. Awesome!

## WIND (What Is Niels Doing)

In last weeks [roundup][4], I mentioned how I was about to finish a post about installing SQL Server on an Azure VM. Here it is:

* [How To Install SQL Server on an Azure VM][8]

I am now prepping for a [user group presentation][9] to talk about SQL Server and Kafka. As part of that prep, I've played around with Docker, and I may do a post around that.

Oh, speaking about that user group presentation, if you are interested, please [signup][9], and join the fun!

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


[1]: https://blog.dapr.io/posts/2021/02/17/announcing-dapr-v1.0/
[2]: https://cloudblogs.microsoft.com/sqlserver/2021/02/16/whats-new-with-sql-server-big-data-clusters/
[3]: https://www.confluent.io/blog/ksqldb-0-15-features-updates/
[4]: {{< relref "2021-02-14-interesting-stuff---week-7-2021.md" >}}
[5]: https://www.confluent.io/blog/42-ways-zookeeper-removal-improves-kafka/
[6]: https://eng.uber.com/logging/
[7]: https://www.confluent.io/blog/ksqldb-0-15-reads-more-message-keys-supports-more-data-types/
[8]: {{< relref "2021-02-14-how-to-install-sql-server-on-an-azure-vm.md" >}}
[9]: https://www.meetup.com/Cape-Town-Ms-Dev-User-Group/events/276127124/