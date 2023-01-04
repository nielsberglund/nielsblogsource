---
type: post
layout: "post"
title: Interesting Stuff - Week 20, 2020
author: nielsb
date: 2020-05-17T08:53:59+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server Extensibility Framework
  - kafka
  - ksqlDB
  - consensus protocols
description: Kafka & ZooKeeper, kqslDB, Paxos consensus protocol, and other interesting topics.
keywords:
  - distributed computing
  - SQL Server Extensibility Framework
  - kafka
  - ksqlDB
  - consensus protocols   
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

* [Advanced Distributed Systems Design (Online Course)][1]. Udi Dahan is one of the world's foremost experts on Service-Oriented Architecture, Distributed Systems and Domain-Driven Design. Enrol for free and learn all about distributed systems design. Usually, this course costs $2,500, but now - due to the pandemic - it is free! Udi is an excellent instructor, and as one of my colleagues said: *as apposed to other so-called experts, there is none of this "tear down, and build up" bullsh%t.*
* [Decomposing a Monolith Does Not Require Microservices - Sam Newman at QCon London][2]. This is an [InfoQ][iq] article based on a presentation by Sam Newman at QCon in London, where he discussed breaking down monoliths. 
* [Paxos consensus for beginners][3]. The post here tries to explain Paxos. Paxos is a consensus algorithm, and most other consensus algorithms, such as Raft, ZAB, etc., are based on Paxos. So I said that the post tries to explain Paxos, and in my mind, the author succeeds! 

## Streaming

* [Resiliency and Disaster Recovery with Kafka][4]. The post linked to here presents possible solutions for running a multi-region Kafka setup. I really liked the post as it gave some solutions to issues we have at [Derivco](/derivco) right now.
* [Building a Telegram Bot Powered by Apache Kafka and ksqlDB][5]. This post does exactly what the title says: [Robin Moffat][rmoff], (Mr Kafka), shows us how to use Kafka and ksqlDB together to build an awesome app! Very cool usage of ksqlDB!
* [Learn how to use Kafkacat — the most versatile Kafka CLI client][6]. `kafkacat` is a command-line tool for producing and consuming Kafka messages, (and more), and in the post, the author talks us through how easy it is to use.
* [Announcing ksqlDB 0.9.0][7]. As the title says; the post announces ksqlDB 0.9, and looks at some new features. I am quite interested in the multi-join support! That will come in quite handy for [us](/derivco).
* [Apache Kafka Needs No Keeper: Removing the Apache ZooKeeper Dependency][8]. This post outlines the work done to remove the ZooKeeper dependency from Kafka.

## WIND (What Is Niels Doing)

Still in lock-down! It is now coming up to two months, and I do not see any end in sight. The only positive is that the restrictions on online commerce have been lifted, so I managed to get me a [Corsair K95 RGB PLATINUM XT][9] keyboard. I like it!

I wrote in one the [Interesting Stuff - Week 17, 2020][10] post about how Microsoft has open-sourced the SQL Server 2019 Extensibility Framework, and I am working together with a couple of other MVPs and Microsoft developer on a .NET extension. Watch this space!

I am also working on the follow-up to the [A Lap Around SQL Server 2019 Big Data Cluster: Background & Technology][11] post. The upcoming post looks at the architecture. So when will it be published you may ask? I have learnt from my mistakes, so at this stage, I have no idea.

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


[1]: https://learn.particular.net/courses/adsd-online-free
[2]: https://www.infoq.com/news/2020/05/monolith-decomposition-newman
[3]: https://medium.com/distributed-knowledge/paxos-consensus-for-beginners-1b8519d3360f
[4]: https://medium.com/ebaytech/resiliency-and-disaster-recovery-with-kafka-dc8901c881c
[5]: https://www.confluent.io/blog/building-a-telegram-bot-powered-by-kafka-and-ksqldb/
[6]: https://medium.com/analytics-vidhya/learn-how-to-use-kafkacat-the-most-versatile-kafka-cli-client-d9cf398e5883
[7]: https://www.confluent.io/blog/ksqldb-0-9-0-feature-updates/
[8]: https://www.confluent.io/blog/removing-zookeeper-dependency-in-kafka/
[9]: https://www.corsair.com/us/en/Categories/Products/Gaming-Keyboards/RGB-Mechanical-Gaming-Keyboards/K95-RGB-PLATINUM-XT-Mechanical-Gaming-Keyboard/p/CH-9127411-NA
[10]: {{< relref "2020-04-26-interesting-stuff---week-17-2020.md" >}}
[11]: {{< relref "2020-04-26-a-lap-around-sql-server-2019-big-data-cluster.md" >}}
