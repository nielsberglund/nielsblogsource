---
type: post
layout: "post"
title: Interesting Stuff - Week 38, 2020
author: nielsb
date: 2020-09-20T08:19:16+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Event driven architecture
  - Kafka
  - Kubernetes
  - Big Data
description: Kafka & Azure Data Explorer, Azure Kubernetes, Big Data Analytics, Data Platform Summit, and other interesting topics.
keywords:
  - Event driven architecture
  - Kafka
  - Kubernetes
  - Big Data  
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

## Azure SQL Server

* [Azure SQL digital event: Transform your applications with Azure SQL][1]. This post announces a webinar by [Bob Ward][bobwa] about Azure SQL, and how you can get the most out of Azure SQL. As the post says: "*During this hour-long virtual event, I'll share my advice and guidance on getting the most out of Azure SQL, whether you’re looking to migrate from an on-premises SQL Server deployment or exploring ways to utilize the newest Azure SQL service options. You will also hear firsthand experiences and best practices from customers who have become expert Azure SQL users.*". Bob is a legend in the SQL Server world, so if you are interested, hurry up and register!

## Big Data

* [How we use Apache Druid’s real-time analytics to power kidtech at SuperAwesome][2]. This post looks at real-time analytics of big data using Kafka and Apache Druid. I like the post a lot! 
* [Easily Clone your Delta Lake for Testing, Sharing, and ML Reproducibility][3]. The post linked to here introduces new functionality in Databricks Delta Lake; the ability to clone tables. This can come in handy for several scenarios: ML result reproducibility, data migration, significant changes to production tables, etc.

## Event Driven Architecture

* [From Monolith to Event-Driven: Finding Seams in Your Future Architecture][4]. An excellent [InfoQ][iq] article looking at what we can do when we want to migrate from a monolithic architecture to a microservices/domain driven architecture.

## Streaming

* [Event-driven Autoscaling for Kubernetes with Kafka & Keda][5]. A very cool post looking at how to scale Kafka consumers on Kubernetes. As I said, very cool!
* [Streaming Data from Apache Kafka into Azure Data Explorer with Kafka Connect][6]. This blog post shows how to stream events from Apache Kafka on Confluent Cloud on Azure, into Azure Data Explorer, using the Kafka Connect Kusto Sink Connector.

## WIND (What Is Niels Doing)

I am prepping for one of the largest data platform conferences taking place, (virtually), beginning of December this year: [**DATA PLATFORM VIRTUAL SUMMIT 2020**][7]. I hear you asking: "why are you prepping?". Well, that's because:

![](/images/posts/Niels_Berglund.jpg)

**Figure 1:** *SQL Server & Kafka*

Yes, I am speaking at the conference! My topic is about, as you can see in *Figure 1*, the various ways we can stream data from SQL Server to Apache Kafka.

The conference has world class-speakers, (and me), so hurry up and [register][8]!

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
[bobwa]: https://twitter.com/bobwardms


[1]: https://cloudblogs.microsoft.com/sqlserver/2020/09/17/azure-sql-digital-event-transform-your-applications-with-azure-sql/
[2]: https://medium.com/superawesome-engineering/how-we-use-apache-druids-real-time-analytics-to-power-kidtech-at-superawesome-8da6a0fb28b1
[3]: https://databricks.com/blog/2020/09/15/easily-clone-your-delta-lake-for-testing-sharing-and-ml-reproducibility.html
[4]: https://www.infoq.com/articles/event-driven-finding-seams/
[5]: https://medium.com/faun/event-driven-autoscaling-for-kubernetes-with-kafka-keda-d68490200812
[6]: https://www.confluent.io/blog/stream-data-from-kafka-to-azure-data-explorer/
[7]: https://dataplatformgeeks.com/dps2020/
[8]: https://dataplatformgeeks.com/dps2020/booking/
