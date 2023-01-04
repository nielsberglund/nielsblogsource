---
type: post
layout: "post"
title: Interesting Stuff - Week 18, 2020
author: nielsb
date: 2020-05-03T11:50:01+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - SQL Server 2019
  - dataplatformgeeks
  - kafka
  - ksqlDB
  - MSBuild
description: Kafka, ksqlDB, MS Build Virtual Conference, SQL Server 2019 Virtual Symposium, and other interesting topics.
keywords:
  - data science
  - SQL Server 2019
  - dataplatformgeeks
  - kafka
  - ksqlDB
  - MSBuild   
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

* [Microsoft Build][1]. The COVID-19 virus impacts everything, not least conferences, with many conferences canceled. Fortunately, some conferences go virtual, and Microsoft Build 2020 is one of them. The link here is to the registration for MS Build 2020, and it is free! Yes, you read that right - MS Build is free! I, for one, have already signed up. Hope to see you there!

## Data Science

* [R 4.0.0 now available, and a look back at R's history][2]. From the title of the post, you get what it covers. [David][revod] from [Revolution Analytics] looks at what is new in the recently released R 4.0, and he also takes a look back at the history of R.

## Streaming

* [Broadcom Modernizes Machine Learning and Anomaly Detection with ksqlDB][3]. The post linked to here is a very cool example of how we can use Kafka and ksqlDB together with Machine Learning for a lot of interesting topics (pun intended). In this particular case for anomaly detection.
* [Flink Forward Virtual 2020 Recap][4]. Above I wrote about the upcoming MS Build virtual conference. The post here is a look at a virtual conference that already has taken place: the Flink Forward 2020 conference. The post has links to the session recordings as well as the slide decks. I have had a look, and there are a lot of interesting sessions.
* [ksqlDB Execution Plans: Move Fast But Don’t Break Things][5]. This post drills into how execution plans work in ksqlDB, and what challenges there are to maintain compatibility when releasing new ksqlDB features. Very interesting!

## WIND (What Is Niels Doing)

In previous roundups, I have written about the lock-down here in SA. Well, the lock-down was initially supposed to end mid-April, but it was extended to end of April. However, the lock-down is not over, as it has now moved from stage 5, to stage 4. That changes almost nothing, i.e. you are still supposed to stay at home. What has changed is that restaurants are allowed to deliver, so this Friday, (May 1), I had pizza for the first time in a month, yum!  

The other thing that has changed being in stage 4 is that online businesses can sell, (and deliver), computer "stuff". So right now I am waiting on a delivery of a new keyboard and mouse, so I am happy! The little things in life - eh?!

Finally, the first-ever SQL Server 2019 Virtual Symposium happens May 7 - 8. Don't miss the chance to hear the likes of [Bob Ward][bobw], and [Buck Woody][buckw] present awesome stuff! I had hoped to present as well, but this time it was not to be. I will, however, attend, and I suggest you do likewise. The symposium is arranged by [**DataPlatformGeeks**][6], and you can register [here][7].

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


[1]: https://mybuild.microsoft.com/
[2]: https://blog.revolutionanalytics.com/2020/04/r-400-is-released.html
[3]: https://www.confluent.io/blog/broadcom-uses-ksqldb-to-modernize-machine-learning-anomaly-detection/
[4]: https://www.ververica.com/blog/flink-forward-virtual-2020-recap
[5]: https://www.confluent.io/blog/building-ksqldb-event-streaming-database/
[6]: https://www.dataplatformgeeks.com/
[7]: https://www.dataplatformgeeks.com/virtual-symposium-sql-server-2019-may-2020/
