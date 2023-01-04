---
type: post
layout: "post"
title: Interesting Stuff - Week 22, 2020
author: nielsb
date: 2020-05-31T07:20:05+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - Kafka
  - ksqlDB
  - Derivco
description: Kafka, ksqlDB, Derivco Webinar, risk management with Databricks, and other interesting topics.
keywords:
  - data science
  - Kafka
  - ksqlDB
  - Derivco   
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

* [Microsoft Build 2020: Highlights][1]. A couple of weeks ago Microsoft held its annual developer conference, Build. Due to the pandemic, it was a virtual 48 hour, around the clock conference, and it was free. The article linked to here is an [InfoQ][iq] article listing noteworthy "stuff" from the conference. As a side note: I wonder how much changes we will see in the conference landscape after when this pandemic is over. Will there be "on-prem" conferences any more, or will most conferences go virtual? 

## Big Data

* [Apache Arrow and Java: Lightning Speed Big Data Transfer][2]. So Apache Arrow is a cross-language, cross-platform, columnar in-memory data format for data. The [InfoQ][iq] article linked to here introduces Apache Arrow and gets you acquainted with the basic concepts of the Apache Arrow Java library. If you're not a Java developer, don't worry - Apache Arrow offers libraries for many other languages as well: C, C++, C#, Go, to name a few.

## Machine Learning

* [Modernizing Risk Management Part 1: Streaming data-ingestion, rapid model development and Monte-Carlo Simulations at Scale][3]. This blog post demonstrates how to modernize traditional value-at-risk (VaR) calculation. It is demonstrated in the post, by using various components of the Databricks Unified Data Analytics Platform — Delta Lake, Apache SparkTM and MLflow. This enables a more agile and forward-looking approach to risk management.

## Streaming

* [Building a Clickstream Dashboard Application with ksqlDB and Elasticsearch][4]. This post shows an example of how you can build an event-driven application to help you unlock insights contained in the event streams of your business. As the title implies, Kafka, ksqlDB, and Elasticsearch are the components used. Very cool post!
* [Best Practices to Secure Your Apache Kafka Deployment][5]. So you are building your event streaming platform on Kafka - awesome! When you are ready to go live, your "pesky" security department asks you about security: "how is the data that flows through Kafka secure, what have you done to prevent data breaches?". Trust me, they will ask you! Fear not, the post I link to here reviews five security categories and the essential features of Kafka and Confluent Platform that enable you to secure your event streaming platform. If you work with Kafka, **READ** the post!
* [Derivco Webinar - Kafka Masterclass][6]. As I mentioned in last weeks roundup, [Charl Lamprecht][charl], and I were going to do a [Derivco](/derivco) Webinar about Kafka: **Conquer Your Data with Kafka and ksqlDB**. Well, we did it, and the link here is to the uploaded YouTube video. Both [Charl][charl] and I had a blast, and we believe the webinar was a success - peak attendance was at around 700 attendees

## WIND (What Is Niels Doing)

Still lockdown! Apparently, some of the lockdown restrictions will be eased June 1, but I don't see me being back in the office for at least a month, most likely two.

As I mentioned above, I did the [Derivco](/derivco) Kafka [webinar][6] last week together with [Charl][charl], and we had a great time.

I am still working on the follow-up to the [**A Lap Around SQL Server 2019 Big Data Cluster: Background & Technology**][9] post. The upcoming post looks at the architecture. So when will it be published you may ask? I have learnt from my mistakes, so at this stage, I have no idea.

Our local [Azure Meetup group][7] has a virtual catchup on Tuesday, (June 1), where we discuss any news or anything interesting that came out in May 2020 in the industry. If you are interested, please register [here][8].

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


[1]: https://www.infoq.com/news/2020/05/microsoft-build-2020-highlights/
[2]: https://www.infoq.com/articles/apache-arrow-java
[3]: https://databricks.com/blog/2020/05/27/modernizing-risk-management-part-1-streaming-data-ingestion-rapid-model-development-and-monte-carlo-simulations-at-scale.html
[4]: https://www.confluent.io/blog/clickstream-data-and-analytics-with-confluent-ksqldb-kafka-connect/
[5]: https://www.confluent.io/blog/secure-kafka-deployment-best-practices/
[6]: https://www.youtube.com/watch?v=CSyNiEgEyvY
[7]: https://www.meetup.com/Azure-Transformation-Labs/
[8]: https://www.meetup.com/Azure-Transformation-Labs/events/270811782/?rv=ce1&_xtd=gatlbWFpbF9jbGlja9oAJDA1NDZiYjMxLTUzZjAtNDQwOS05YmQ0LTIzMGEyYTg4NjEwZg&_af=event&_af_eid=270811782
[9]: {{< relref "2020-04-26-a-lap-around-sql-server-2019-big-data-cluster.md" >}}
