---
type: post
layout: "post"
title: Interesting Stuff - Week 40, 2020
author: nielsb
date: 2020-10-04T15:40:24+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - ksqlDB
  - SQLBits
  - SQL Server
description: New version Confluent Platform, cool ksqlDB stuff, me at SQLBits and other interesting topics.
keywords:
  - Kafka
  - ksqlDB
  - SQLBits
  - SQL Server   
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

## Big Data

* [Diving Into Delta Lake: DML Internals (Update, Delete, Merge)][1]. Later releases of Delta Lake supports DML, (data manipulation language), statements. The post linked to here demonstrates how to use each of these DML commands, describes what Delta Lake is doing behind the scenes when you run one, and offers some performance tuning tips for each one. Very cool!

## Streaming 

* [Introducing Confluent Platform 6.0][2]. As the title of this post says; the post is about the new 6.0 release of Confluent Platform. Reading the post, this release looks huge. There are so many interesting things in there, but the ones that stand out for me are the ksqlDB improvements! For more information about the new ksqlDB functionality, look at the post [ksqlDB 0.12.0 Introduces Real-Time Query Upgrades and Automatic Query Restarts][4]. This is awesome!
* [How Real-Time Stream Processing Works with ksqlDB, Animated][3]. While we are on the subject of ksqlDB, this post is doing a great job how ksqlDB works. If you are interested in ksqlDB at all, you must read the post!
* [ksqlDB Meets Java: An IoT-Inspired Demo of the Java Client for ksqlDB][5]. Even more ksqlDB. The post linked to here looks at the new ksqlDB Java client. So, instead of using REST API's, you can now do ksqlDB "stuff" programmatically, using this new client, That is very, very interesting!

## WIND (What Is Niels Doing)

Yes, what AM I doing? Sometimes, quite often actually, I wonder that myself. Today, however, I do know what I am doing, or more specifically, what I just did! Yesterday, (October 3), I delivered a virtual conference talk at SQLBits about SQL Server and Kafka. 

Unfortunately, the talk was pre-recorded, and after I had uploaded the recording, the organizers did some editing. I messed up with what parts of the talk needed editing, so the result was that around a third of the talk was missing. Not good! Anyway, the organizers will do a re-edit and upload so that attendees can view it on demand. If you were one of the attendees, I do apologize again!

Anyway, today I uploaded the slide deck as well as all code for the talk, (including instructions). If you are interested, you can download it from [here][6]. If you have questions comments etc., please [ping me][ma].

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


[1]: https://databricks.com/blog/2020/09/29/diving-into-delta-lake-dml-internals-update-delete-merge.html
[2]: https://www.confluent.io/blog/confluent-platform-6-0-delivers-the-most-powerful-event-streaming-platform-to-date/
[3]: https://www.confluent.io/blog/how-real-time-stream-processing-works-with-ksqldb/
[4]: https://www.confluent.io/blog/ksqldb-0-12-0-features-updates/
[5]: https://www.confluent.io/blog/ksqldb-java-client-iot-inspired-demo/
[6]: https://nielsberglund.com/download/set-data-free-kafka.zip