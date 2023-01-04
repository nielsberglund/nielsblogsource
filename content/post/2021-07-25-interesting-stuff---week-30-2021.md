---
type: post
layout: "post"
title: Interesting Stuff - Week 30, 2021
author: nielsb
date: 2021-07-25T09:21:37+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data mesh
  - Kafka
  - ksqlDB
description: Kafka & stream - table duality, ksqlDB & foreign key joins, data discovery in data meshes, and other interesting topics.
keywords:
  - data mesh
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

This blog-post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Data Architecture

* [Enabling Data Discovery in a Data Mesh: The Saxo Journey][2]. In the [roundup for week 26][1], I wrote about how Saxo Bank in Denmark has moved to a domain-driven data architecture with Kafka as an integral part and the lessons learned/best practices. This post is a follow-up, and in this post, Saxo Bank writes about its data infrastructure with an in-house central data management application and how Saxo Bank approaches and solves data inconsistency issues. As with the previous article, this is a must-read!  

## Streaming

* [The Duality of Streams and Tables - Why It Matters?][3]. When you read articles, blogs about Kafka and stream processing, you may have come across the statement about the duality between streams and tables. When I have read about it, I must admit that I have not really "grasped" it, that is, until now. The post linked to explains in a way that even I can understand the concepts behind the stream-table duality. Good job!
* [Announcing ksqlDB 0.19.0][5]. In the [roundup three weeks ago][4] I wrote about the new functionality in KStreams - the foreign-key join, and how I looked forward to it appearing in ksqlDB soon. Well, it must be Christmas, as my wish has come through. The post I link to announces ksqlDB 0.19, and one of the new features in the release is the foreign-key join. How awesome is that?!

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

[1]: {{< relref "2021-06-27-interesting-stuff---week-26-2021.md" >}}
[2]: https://medium.com/datahub-project/enabling-data-discovery-in-a-data-mesh-the-saxo-journey-451b06969c8f
[3]: https://medium.com/event-driven-utopia/the-duality-of-streams-and-tables-why-it-matters-ed9bb17e7505
[4]: {{< relref "2021-07-04-interesting-stuff---week-27-2021.md" >}}
[5]: https://www.confluent.io/blog/ksqldb-0-19-adds-data-modeling-foreign-key-joins/
