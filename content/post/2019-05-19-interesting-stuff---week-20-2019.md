---
type: post
layout: "post"
title: Interesting Stuff - Week 20, 2019
author: nielsb
date: 2019-05-19T16:28:12+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - Kafka
  - .NET Core
  - H2O AI
description: Kafka, .NET Core, H2O, SQL Server 2019 & Java, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - Kafka
  - .NET Core
  - H2O AI   
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

## .NET

* [Default implementations in interfaces][1]. A blog post introducing a new feature in C# 8.0: default method implementations in interfaces. This comes in real handy if you, for example, want to add new methods to an existing interface.
* [Performance Improvements in .NET Core 3.0][2]. A blog post which takes a tour through some of the many improvements, big and small, that have gone into the .NET Core 3.0 runtime and core libraries in order to make applications and services leaner and faster.

## Data Science

* [H2O's Driverless AI: An AI that Creates AI][3].  An [InfoQ][iq] presentation where the presenter shares an approach on automating ML using H2O’s Driverless AI. Driverless AI employs the techniques of expert data scientists in an easy-to-use application that helps scale data science efforts; empowers data scientists to work on projects faster using automation and state-of-the-art computing power from GPUs to accomplish tasks in minutes that used to take months. Very cool!

## Streaming

I attended the [Kafka Summit][5], in London the week of May 13. The conference was very well organized, and I came away impressed by that. However, I am not that impressed by the speakers at the conference. Don't get me wrong, the Confluent speakers were all top-notch, engaging and presenting interesting concepts. What not impressed me was the 3rd party speakers. In my opinion, the topics were not centred around Kafka, and the speakers were in general, not that engaging.

Anyway, below is a couple of links related to announcements during the conference.

* [Announcing the Confluent Community Catalyst Program][4]. The conference started with [Tim Berglund][tberg] announcing the Confluent Community Catalyst Program, an MVP like program for Kafka.
* [Introducing a Cloud-Native Experience for Apache Kafka in Confluent Cloud][6]. As part of the keynote, Neha Narkhede, (co-founder of Confluent), announced the availability of Apache Kafka as a service in the cloud. She demonstrated the ease of setting up Kafka in the cloud - 5 seconds to fully functional Kafka! Kafka as a service is initially available on AWS and Google Cloud, let us hope it comes to Azure soon!

## WIND (What Is Niels Doing)

The CTP 2.5 release of SQL Server 2019 changed a lot regarding the Java language extension and how to write Java code to be executed from `sp_execute_external_script`. I am at the moment writing a blog post, where I look at the changes to the programming model. I plan to try and publish it in about a week.

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
[tberg]: https://twitter.com/tlberglund

[1]: https://devblogs.microsoft.com/dotnet/default-implementations-in-interfaces/
[2]: https://devblogs.microsoft.com/dotnet/performance-improvements-in-net-core-3-0/
[3]: https://www.infoq.com/presentations/h2o-driverless-ai
[4]: https://www.confluent.io/blog/announcing-confluent-community-catalyst-program
[5]: https://kafka-summit.org/events/kafka-summit-london-2019/
[6]: https://www.confluent.io/blog/introducing-cloud-native-experience-for-apache-kafka-in-confluent-cloud
