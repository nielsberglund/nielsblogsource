---
type: post
layout: "post"
title: Interesting Stuff - Week 32, 2020
author: nielsb
date: 2020-08-09T07:36:58+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - SQL Server
  - Azure SQL
  - Kafka
  - ksqlDB
  - Confluent Cloud
description: Kafka, ksqlDB, Confluent Cloud everywhere, Azure SQL, and other interesting topics.
keywords:
  - data science
  - SQL Server
  - Azure SQL
  - Kafka
  - ksqlDB
  - Confluent Cloud   
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

## Azure SQL 

* [Learning How to Transition Your SQL Server Skills to Azure SQL | Data Exposed][1]. This post introduces courses and workshops for you to learn Azure SQL. I have had a look at the material, and it is awesome!

## Machine Learning

* [Netflix’s Polynote is a New Open Source Framework to Build Better Data Science Notebooks][2]. In this post, the author discusses Polynote. Polynote is a new notebook environment which provides substantial improvements to streamline experimentation in machine learning workflows.
* [State of the Art in Automated Machine Learning][3]. This is an [InfoQ][iq] article summarising a panel discussion where the panel members discussed the state of the art in automated machine learning (AutoML). Some very interesting ideas and thoughts!

## Streaming

* [What’s New in Apache Kafka 2.6][4]. The post linked to here discusses some of the new features in Kafka 2.6, which was released in early August. Some exciting things in the new release!
* [How Tencent PCG Uses Apache Kafka to Handle 10 Trillion+ Messages Per Day][5]. Tencent is one of the largest Kafka users in the world, processing trillions of messages every day. This article, introduces Tencent's journey of building federated Kafka clusters for business use cases that require high scalability and fault tolerance. Some very fascinating concepts in the post. I will definitely look at some of the things mentioned.
* [Announcing ksqlDB 0.11.0][6]. Above I linked to a post related to a new Kafka release. The post here introduces a new ksqlDB release and looks at some of the new features.
* [Project Metamorphosis Month 4: Confluent Cloud for Apache Kafka Available Everywhere][7]. This post announces how Confluent Cloud is now available on all major cloud providers! Expect a blog post where I look at Confluent Cloud on Azure.

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


[1]: https://techcommunity.microsoft.com/t5/azure-sql-database/learning-how-to-transition-your-sql-server-skills-to-azure-sql/ba-p/1571163
[2]: https://medium.com/dataseries/netflixs-polynote-is-a-new-open-source-framework-to-build-better-data-science-notebooks-4bdab6b8d0ae
[3]: https://www.infoq.com/articles/state-art-automl/
[4]: https://www.confluent.io/blog/apache-kafka-2-6-updates/
[5]: https://www.confluent.io/blog/tencent-kafka-process-10-trillion-messages-per-day/
[6]: https://www.confluent.io/blog/ksqldb-0-11-0-features-and-improvements/
[7]: https://www.confluent.io/blog/confluent-cloud-for-apache-kafka-everywhere/
