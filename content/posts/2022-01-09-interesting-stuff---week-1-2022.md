---
type: post
layout: "post"
title: Interesting Stuff - Week 1, 2022
author: nielsb
date: 2022-01-09T10:55:27+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - database engines
  - Kafka
  - Confluent Cloud
description: Kafka and when NOT to use it, building Confluent Cloud, different types of database engines, and other interesting topics.
keywords:
  - database engines
  - Kafka
  - Confluent Cloud   
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

## Databases

* [Database storage engines][1]. This is an awesome post, looking at various database storage engines!

## Streaming

* [Building Confluent Cloud – Here's What We've Learned][2]. I was pointed to this post by a smart guy on the Confluent Cloud Slack channel - thanks, Ryan! The post explores the current architecture of Confluent Cloud, how the experience with the product has benefitted both Apache Kafka and Kafka in Confluent Cloud. Finally, the post lists some of the lessons learned.
* [When NOT to use Apache Kafka?][3]. So, [Kai Waehner][4] is a Global Technology Advisor at Confluent and evangelises Apache Kafka and Confluent Cloud. Therefore, it is very cool to see this post, where he looks at scenarios where Kafka may not fit.

## WIND (What Is Niels Doing)

A while ago, I wrote the post [**How to Use Kafka Client with Azure Event Hubs**][5], where I looked at how to use the Kafka client to publish messages to - not only - **Apache Kafka** but also **Azure Event Hubs**. In my post, I said something like:

*An interesting point here is that it is not only your Kafka applications that can publish to Event Hubs but any application that uses Kafka Client 1.0+, like Kafka Connect connectors!*

Obviously (if you know me), I said that without having tested it properly, but: *how hard can it be? What could possibly go wrong?*. Well, I was called upon it by a guy who had read the post. He told me he had tried what I said at one time or the other, and it hadn't worked. Therefore I started writing a post looking at using Debezium and Kafka Connect to publish events to Event Hubs. The jury is still out whether you can do it or not. So, that is what I am doing right now.

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

[1]: https://ajay-yadav.medium.com/database-storage-engines-de757b03bd44
[2]: https://www.confluent.io/blog/what-we-learned-building-confluent-cloud/
[3]: https://www.kai-waehner.de/blog/2022/01/04/when-not-to-use-apache-kafka/
[4]: https://twitter.com/kaiwaehner
[5]: {{< relref "2022-01-02-how-to-use-kafka-client-with-azure-event-hubs.md" >}}
