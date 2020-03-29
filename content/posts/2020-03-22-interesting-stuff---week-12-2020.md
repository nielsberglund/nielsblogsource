---
type: post
layout: "post"
title: Interesting Stuff - Week 12, 2020
author: nielsb
date: 2020-03-22T09:38:19+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - Git
  - ksqlDB
  - KStreams
  - SQL Server 2019 Big Data Cluster
description: "Git, Kafka & KStreams, ksqlDB, SQL Server 2019 Big Data Cluster, and other interesting topics."
keywords:
  - Kafka
  - Git
  - ksqlDB
  - KStreams
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

## Misc.

* [Six Rules for Good Git Hygiene][1]. My Git knowledge is minimal, so this post about how to be a team player with commits, pushes, and pulls was really useful for me.

## Streaming

* [How to Use Stateful Operations in Kafka Streams][2]. The post linked to here explores stateful operations in the Kafka Streams DSL API. It focuses on aggregation operations such as `aggregate`, `count`, and `reduce` along with a discussion of related concepts. The post is the second in a series about Kafka Streams API, and the first post is [here][3].
* [How to Test Kafka Streams Applications][4]. This post is the third in the series mentioned above, and the post explores a few examples of how to use the testing utilities provided by Kafka streams to validate topologies based on the Kafka Streams DSL API.
* [Announcing ksqlDB 0.8.0][5]. As the title of the post says, the post covers the new version of ksqlDB. There are quite a few new features that I cannot wait to test!
* [KLIP 15 - ksqlDB Client and New Server API][6]. From reading the announcement above about ksqlDB 0.8.0, I came across the page linked to here. Getting new ksqlDB client and server APIs to make stream developing easier is a game changer! I, for one, am eager to hear more about this. Oh, and [here][7] is a lengthy Google Group discussion around this.

> **NOTE:** KLIP stands for "Kafka Language Improval Proposal" 

## WIND (What Is Niels Doing)

What a weird week this has been all thanks to the Coronavirus! On Sunday, (Mar 15), the president of South Africa - Cyril Ramaphosa - declared the Coronavirus a national disaster and more or less put the country in lock-down.

This resulted in that on Monday morning at [Derivco](/derivco), everyone that had remote working capabilities was sent home. For the remainder of staff, plans were made how to get them up-and-running remotely. At the end of the week most of the company, (~1800 people), worked from home. Way to go [Derivco](/derivco)!

So since Monday afternoon, I have been working from home, and even though it is a bit strange initially, the whole experience has been overall positive.

You may remember how I in [last weeks roundup][8] wrote that I am "blogifying" one of the conference talks I do about SQL Server 2019 Big Data Cluster: *A Lap Around SQL Server 2019 Big Data Cluster*. Working from home has not given me any more time with the post, but I am nearly there, and it should be out in the next week.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me. Most importantly stay safe out there!

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


[1]: https://medium.com/better-programming/six-rules-for-good-git-hygiene-5006cf9e9e2
[2]: https://medium.com/better-programming/how-to-use-stateful-operations-in-kafka-streams-1cff4da41329
[3]: https://medium.com/better-programming/learn-stream-processing-with-kafka-streams-stateless-operations-2111080e6c53
[4]: https://medium.com/better-programming/testing-kafka-streams-applications-1c5cb14c5376
[5]: https://www.confluent.io/blog/ksqldb-0-8-0-feature-updates/
[6]: https://github.com/confluentinc/ksql/blob/7bf5c120c7128d4825f74fc7e691ef2c68c6911b/design-proposals/klip-15-new-api-and-client.md
[7]: https://groups.google.com/forum/#!topic/ksql-dev/yxcRlsOsNmo
[8]: {{< relref "2020-03-15-interesting-stuff---week-11-2020.md" >}}
