---
type: post
layout: "post"
title: Interesting Stuff - Week 29, 2022
author: nielsb
date: 2022-07-24T11:50:11+02:00 
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - Confluent Cloud
  - Azure Data Explorer
  - Data Platform Summit 2022
description: Kafka & Terraform, Spark Notebooks & Azure Data Explorer, Niels at Data Platform Summit 2022, and other interesting topics.
keywords:
  - Kafka
  - Confluent Cloud
  - Azure Data Explorer
  - Data Platform Summit 2022   
---

![](/images/posts/dps-2022.jpg)

**<p style="text-align: center;">Conference</p>**

Throughout the week, I read a lot of blog-posts, articles, and so forth that has to do with things that interest me:

* AI/data science
* data in general
* data architecture
* streaming
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Misc.

* [How to Write a Good Tech Conference Abstract - Learn from the Mistakes of Others][1]. I guess the title says it all. Things to think about when writing conference abstracts. This post by [Robin Moffat][rmoff] is very valuable, but it should have come somewhat earlier. Why - you ask? Well, the conference "season" is upon us, and I have submitted quite a few abstracts. Unfortunately, the majority have been rejected. Maybe the result would have been better following the advice in this post. Anyway, rejections are part of the game - onwards and upwards!

## Azure Data Explorer

* [Data pre-processing for Azure Data Explorer with Apache Spark][2]. So, you want to load data into **Azure Data Explorer**. No problem, ADX has quite a few "nifty" ways to get the data into it. However, sometimes the data would need some complex data engineering upfront. Something that even ADXs powerful data-transformation capabilities cannot do. If that's the case, this post comes in handy. It looks at how to do it using PySpark and the notebook experience in Azure Synapse Analytics. Have Fun!

## Streaming

* [Confluent addresses major real-time application roadblocks with Q3 update][3]. This post looks at how Confluent partnered with Hashicorp to introduce a Terraform provider. The integration exposes Confluent cloud APIs for automated deployment and management of mission-critical data streaming resources. This is just the right time for us at [Derivco](/derivco) as we are introducing Confluent Cloud right now!
* [Introducing Confluent Platform 7.2: Enhanced Cloud-Native Security and Geo-Replication][4]. This post announces the release of Confluent Platform 7.2. The release covers three major areas: simplified cluster ops, improved data sharing, and improved stream processing capabilities via ksqlDB 0.26.

## WIND (What Is Niels Doing)

Above I was "moaning" about my abstracts being rejected. But, as you can see from the picture up top, "all is not lost". I am presenting at [**Data Platform Summit 2022**][5], and the session is **ksqlDB - the Real-Time Streaming Database**. So, right now I am prepping for the presentation!

Data Platform Summit is an awesome conference, it is this year as well virtual. So no traveling needed, hurry up and sign up [here][6]. Its is **FREE**!

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

[1]: https://rmoff.net/2022/07/20/how-to-write-a-good-tech-conference-abstract-learn-from-the-mistakes-of-others/
[2]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/data-pre-processing-for-azure-data-explorer-with-apache-spark/ba-p/2727993
[3]: https://venturebeat.com/2022/07/19/confluent-addresses-major-real-time-application-roadblocks-with-q3-update/
[4]: https://www.confluent.io/blog/introducing-confluent-platform-7-2/
[5]: https://dataplatformgeeks.com/dps2022/
[6]: https://dataplatformgeeks.com/dps2022/booking/
