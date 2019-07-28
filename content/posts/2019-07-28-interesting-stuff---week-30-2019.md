---
type: post
layout: "post"
title: Interesting Stuff - Week 30, 2019
author: nielsb
date: 2019-07-28T09:40:56+02:00 
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server 2019
  - Kafka
  - Java
  - SQL Server 2019 Big Data Cluster
description: Kafka & Jaeger, SQL Server 2019 Big Data Cluster & Java, and other interesting topics.
keywords: 
  - distributed computing
  - SQL Server 2019
  - Kafka
  - Java
  - SQL Server 2019 Big Data Cluster   
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

* [Dissecting performance bottlenecks of strongly-consistent replication protocols][1]. This is a post by [Murat][murba] about one of his white papers. The post dissects the white paper which discusses the performance of Paxos protocols. If you are into distributed computing and consensus protocol, this is for you.
* [Drive High-Velocity Innovation with Docker Enterprise 3.0][2]. Earlier this week [Docker announced general availability][3] of Docker Enterprise 3.0. The post I link to is registration for a 5-part virtual event to get a deep dive on new features and enhancements in Docker Enterprise 3.0.

## Streaming

* [Streaming Log Analytics with Kafka][4]. This is an [InfoQ][iq] presentation where the presenter discusses how and why they use Kafka internally and demos how they utilize it as a straightforward event-sourcing model for distributed deployments.
* [Fault Tolerance in Distributed Systems: Tracing with Apache Kafka and Jaeger][5]. This is the second post about distributed tracing with Kafka and Jaeger. This post looks at how to make Jaeger fault-tolerant, i.e. how to safeguard against Jaeger going down.

## SQL Server 2019

* [SQL Server 2019 community technology preview 3.2 is now available][6]. I guess the title of the post says it all; CTP 3.2 is released. One of the big "things" in this release is that the SQL Server 2019 Big Data Cluster (BDC) is now in public preview. What this means is that you no longer need to sign up for the preview, but you can deploy directly. Look out for an upcoming blog post from me regarding this.
* [Free supported Java in SQL Server 2019 is now available][7]. Wow, "the times they are a changin'", as [Bob Dylan sang][8]! I remember years and years ago, the battle between Microsoft and Sun regarding [Java][9]. Who would then have thought that come 2019, Microsoft would include Java in one of Microsoft's flagship products: SQL Server 2019. Very cool!

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

[1]: http://muratbuffalo.blogspot.com/2019/07/dissecting-performance-bottlenecks-of.html
[2]: https://goto.docker.com/virtual-event-docker-enterprise-3.0.html
[3]: https://blog.docker.com/2019/07/announcing-docker-enterprise-3-0-ga/
[4]: https://www.infoq.com/presentations/kafka-distributed-deployments
[5]: https://www.confluent.io/blog/fault-tolerance-distributed-systems-tracing-with-apache-kafka-jaeger
[6]: https://cloudblogs.microsoft.com/sqlserver/2019/07/24/sql-server-2019-community-technology-preview-3-2-is-now-available/
[7]: https://cloudblogs.microsoft.com/sqlserver/2019/07/24/free-supported-java-in-sql-server-2019-is-now-available/
[8]: https://www.youtube.com/watch?v=e7qQ6_RV4VQ
[9]: https://en.wikipedia.org/wiki/Microsoft_Java_Virtual_Machine