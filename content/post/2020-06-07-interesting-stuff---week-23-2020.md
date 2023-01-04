---
type: post
layout: "post"
title: Interesting Stuff - Week 23, 2020
author: nielsb
date: 2020-06-07T09:57:23+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server
  - Kafka
  - Flink
  - ksqlDB
  - Azure
description: Kafka, ksqlDB, Apache Flink, SQL Server at MS Build, and other interesting topics.
keywords:
  - SQL Server
  - Kafka
  - Flink
  - ksqlDB
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

## SQL Server

* [Azure SQL Sessions Recap at Microsoft Build 2020][1]. This post contains links to all the various sessions around Azure SQL Server at this year's MS Build conference. Quite a few very interesting sessions!

## Streaming

* [Consistent Metastore Recovery for ksqlDB Using Apache Kafka Transactions][2]. The post linked to here is a continuation of the post I covered in my [week 18][4] roundup; about [ksqlDB Execution Plans][3]. This week's post discusses some of the work that’s gone into preserving the integrity of ksqlDB’s internal state in interactive mode.
* [Stream Processing with IoT Data: Challenges, Best Practices, and Techniques][5]. In this post, the author looks at Tesla's architecture and tech for handling IoT data. I found the post very interesting, and, even though at [Derivco](/derivco) we do not deal with IoT data, we can definitely implement some of the principles outlined in the post.
* [Taming Large State: Lessons from Building Stream Processing][6]. In this [InfoQ][iq] presentation, the presenters talk about how Netflix solved a complex join of two high-volume event streams using Flink. They also discuss managing out of order events and processing late arriving data.
* [Real-Time Fleet Management Using Confluent Cloud and MongoDB][7]. The post linked to here looks at how to build a system incorporating ksqlDB, Kafka Connect, MongoDB, all in the cloud. The solution, in this case, is for fleet management, but it could be anything. Very cool!

## WIND (What Is Niels Doing)

As I wrote in the [roundup from last week][8], lockdown restrictions here in SA have been relaxed, a bit. That means that you can now exercise whenever you want, instead of between 06:00 - 10:00 am; yay!, (that was sarcasm). For me, nothing has really changed, and I do not think I'll be back in the office until July/August.

In our [Durban Azure Transformation Labs][9] user group, we had the first monthly News & Catchup meeting. This meeting is virtual, and we get together the first Tuesday every month chatting about what has happened in the industry during the month just gone by. If you are interested in what was said, the recording of the event 10 is up on YouTube: [News & Catch up June 2020][10].

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


[1]: https://techcommunity.microsoft.com/t5/azure-sql-database/azure-sql-sessions-recap-at-microsoft-build-2020/ba-p/1432139
[2]: https://www.confluent.io/blog/ksqldb-ensures-consistent-internal-state-reliability-recovery-using-kafka-transactions/
[3]: https://www.confluent.io/blog/building-ksqldb-event-streaming-database/
[4]: {{< relref "2020-05-03-interesting-stuff---week-18-2020.md" >}}
[5]: https://www.confluent.io/blog/stream-processing-iot-data-best-practices-and-techniques/
[6]: https://www.infoq.com/presentations/netflix-event-stream-flink/
[7]: https://www.confluent.io/blog/fleet-management-gps-tracking-with-confluent-cloud-mongodb/
[8]: {{< relref "2020-05-31-interesting-stuff---week-22-2020.md" >}}
[9]: https://www.meetup.com/Azure-Transformation-Labs/
[10]: https://www.youtube.com/watch?v=YxLQOaEnCqY
