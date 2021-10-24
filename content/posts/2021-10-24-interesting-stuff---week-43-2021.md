---
type: post
layout: "post"
title: Interesting Stuff - Week 43, 2021
author: nielsb
date: 2021-10-24T12:07:06+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Azure Data Lake Storage
  - Azure
  - Databricks
  - Apache Spark
  - Kafka
description: Awesome Kafka books, Azure Data Lake Storage best practices, PASS Summit and Azure Data Explorer, and other interesting topics.
keywords:
  - Azure Data Explorer
  - Azure Data Lake Storage
  - Azure
  - Databricks
  - Apache Spark
  - Kafka   
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

## Big Data

* [The Hitchhiker's Guide to the Data Lake][2]. This post discusses considerations and best practices around how to effectively utilize **Azure Data Lake Storage Gen2** in large scale Big Data platform architectures. I found this post to be extremely useful!

## Streaming

* [Introducing Apache Spark 3.2][4]. In last week's [roundup][1], I linked to a post about a new Window type coming in Apache Spark 3.2: the session window. The post linked to here looks at other new interesting features in the 3.2 release!
* [Best Apache Kafka Books in 2021][3]. Well, not much to say really here. As the title says, the post lists the Kafka books the author likes best.

## WIND (What Is Niels Doing)

Today and tomorrow, I am putting the finishing touches on my video recording for the [**PASS Data Community Summit 2021**][7]:

* [**Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer**][5]. In this session, I look at how **Azure Data Explorer** enables us to do near real-time analysis of Big Data.

If you are interested you can register [here][6]. The conference sessions are free!

In addition to the above, I am also working on a blog post looking at ingesting data from Kafka into Azure Data Explorer. I've been working on it for quite a while now. Hopefully, I'll have it done within a week or two.

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

[1]: {{< relref "2021-10-17-interesting-stuff---week-42-2021.md" >}}
[2]: https://aka.ms/adls/hitchhikersguide
[3]: https://stlplaces.com/blog/best-apache-kafka-books-in-year
[4]: https://databricks.com/blog/2021/10/19/introducing-apache-spark-3-2.html
[5]: https://passdatacommunitysummit.com/sessions/265026
[6]: https://reg.passdatacommunitysummit.com/flow/redgate/summit2021/registrationopeningpage/page/introlanding
[7]: https://passdatacommunitysummit.com/
