---
type: post
layout: "post"
title: Interesting Stuff - Week 31, 2019
author: nielsb
date: 2019-08-04T11:15:18+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server 2019
  - SQL Server Extensibility Framework  
  - SQL Server Machine Learning Services
  - Kafka
  - KStreams 
description: "Kafka & KStreams, the Paxos protocol, SQL Server 2019 & Java, and other interesting topics."
keywords:
  - data science
  - distributed computing
  - SQL Server 2019
  - SQL Server Extensibility Framework  
  - SQL Server Machine Learning Services
  - Kafka
  - KStreams    
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

* [Paxos at its heart is very simple][1]. This is a post where the author tries to explain [Paxos][2] in simple terms. In my opinion, the author has made an excellent job of it.

## Data Science / Machine Learning

* [The 5 Basic Statistics Concepts Data Scientists Need to Know][3]. Machine Learning is not [glorified statistics][4], but by understanding statistics, we can get a better understanding of what our Machine Learning / Data Science algorithms show us.
* [Microsoft Machine Learning Server 9.4 is now available][5]. The title says it all, Microsoft has now released Machine Learning Server 9.4, and it is based on Microsoft R Open 3.5.2 and Python 3.7.1. This means that we should be able to update R and Python in SQL Server Machine Learning Services.

## Streaming

* [A Dive Into Streams @LinkedIn With Brooklin][6]. This is an [InfoQ][iq] presentation where the presenter talks about Brooklin – Linked In's managed data streaming service that supports multiple pluggable sources and destinations, which can be data stores or messaging systems. The presenter also dives deeper into Brooklin's architecture and use cases, as well as Linked In's future plans for Brooklin.
* [Introducing Confluent Platform 5.3][7]. This is another post where the title says it all; Confluent has released Confluent PLatform 5.3. There are quite a few new features in this release. The ones that excite me the most are: Confluent Operator, Role Based Access Control, and Secret Protection - encrypting secrets within configuration files.  
* [Building Shared State Microservices for Distributed Systems Using Kafka Streams][8]. This is an excellent article discussing how to use Kafka Streams to build shared state microservices that serve as fault-tolerant, highly available single sources of truth about the state of objects in a system. This article came at the right time as we are looking at that in [Derivco](/derivco) at the moment!

## SQL Server 2019

* [SQL Server 2019 CTP3.2 & Java][9]. Each new SQL Server CTP release seems to introduce new "stuff" for the Java language extension. In this post, I look at the inclusion of the Azul OpenJDK in SQL Server 2019 CTP 3.2, and what it introduces.

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

[1]: https://medium.com/@aptxkid/paxos-at-its-heart-is-very-simple-b6a0eafbeb50
[2]: https://en.wikipedia.org/wiki/Paxos_(computer_science)
[3]: https://towardsdatascience.com/the-5-basic-statistics-concepts-data-scientists-need-to-know-2c96740377ae
[4]: https://towardsdatascience.com/no-machine-learning-is-not-just-glorified-statistics-26d3952234e3
[5]: https://cloudblogs.microsoft.com/sqlserver/2019/07/30/microsoft-machine-learning-server-9-4-is-now-available/
[6]: https://www.infoq.com/presentations/linkedin-streams-brooklin/
[7]: https://www.confluent.io/blog/introducing-confluent-platform-5-3
[8]: https://www.confluent.io/blog/building-shared-state-microservices-for-distributed-systems-using-kafka-streams
[9]: {{< relref "2019-08-03-sql-server-2019-ctp32--java.md" >}}
