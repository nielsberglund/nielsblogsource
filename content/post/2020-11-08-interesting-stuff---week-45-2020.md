---
type: post
layout: "post"
title: Interesting Stuff - Week 45, 2020
author: nielsb
date: 2020-11-08T10:32:09+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - big data
  - distributed computing
  - kafka
  - ksqldb
description: Kafka, ksqlDDB pull queries in Confluent Cloud, Kafka and SQL Server at Data Platform Summit, and other interesting topics.
keywords:
  - big data
  - distributed computing
  - kafka
  - ksqldb   
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

* [Helios: hyperscale indexing for the cloud & edge (part II)][2]. In last weeks [roundup] [1], I pointed to a post by [Adrian][adcol], where he dissected a white-paper about Helios, and I said how I looked forward to part 2. Well, I got what I wanted, and the post I link to here is the follow-up. Enjoy!

## Distributed Computing

* [Microservices — architecture nihilism in minimalism's clothes][3]. This post looks at microservices and argues that there is no such thing as a microservice architecture, but software architecture. The author also looks at the size of a microservice and argues that there is no prescribed size of a microservice. I found the post very interesting!

## Streaming

* [Change Data Capture with Azure, PostgreSQL, and Kafka][4]. In this blog post, the author looks at how one can use Change Data Capture to stream database modifications from PostgreSQL to Azure Data Explorer, (Kusto), using Apache Kafka. It is an interesting post! As a side note, I must say that Azure Data Explorer looks really interesting!
* [Announcing Pull Queries in Preview in Confluent Cloud ksqlDB][5]. ksqlDB has two types of queries: push and pull. Push queries allow you subscribe to a query's result as it changes in real-time, whereas with a pull query you fetch the current state of a materialized view. Both types of queries have been in Confluent Platform for a while, but Confluent Cloud has up until now only supported push queries. That changes now, and the post I linked to here discusses more in detail about the support for pull queries in Confluent Cloud.

## WIND (What Is Niels Doing)

Well, it is not so much about what I am doing, as it is of what I have been doing the last couple of days. You who read my blog are probably aware that:

![](/images/posts/Niels_Berglund.jpg)

**Figure 1:** *SQL Server & Kafka*

Yes, I am speaking at the conference! My topic is about, as you can see in *Figure 1*, the various ways we can stream data from SQL Server to Apache Kafka. In a previous roundup, I wrote how I was prepping for the talk. That is all good and well, but a while ago a "curve-ball" was thrown: the conference is obviously virtual, but: we are not presenting live! Which means that the last few days, I have been recording, and editing the recording. Geez, recording and editing is hard work, compared to "just" deliver. Well, it is done now, and if you [register][6] you have the chance to see other speakers and me in a recorded fashion.


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




[1]: {{< relref "2020-11-01-interesting-stuff---week-44-2020.md" >}}
[2]: https://blog.acolyer.org/2020/11/02/helios-part-ii/
[3]: https://vlfig.me/posts/microservices
[4]: https://itnext.io/change-data-capture-with-azure-postgresql-and-kafka-4598dbf0b57a
[5]: https://www.confluent.io/blog/pull-queries-in-preview-confluent-cloud-ksqdb/
[6]: https://dataplatformgeeks.com/dps2020/booking/https://dataplatformgeeks.com/dps2020/booking/
