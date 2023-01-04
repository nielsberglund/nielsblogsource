---
type: post
layout: "post"
title: Interesting Stuff - Week 7, 2022
author: nielsb
date: 2022-02-20T13:26:02+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - Azure Data Explorer
  - SQLBits
  - Databricks
  - Apache Pinot
  - Druid
description: Kafka and monitoring in Confluent Cloud, Druid vs. Pinot, Lakehouse for crypto, SQLBits 2022, and other interesting topics.
keywords:
  - Kafka
  - Azure Data Explorer
  - SQLBits
  - Databricks
  - Apache Pinot
  - Druid   
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

## Misc.

* [Rapid Event Notification System at Netflix][1]. This post from the [Neflix tech blog][netflx] looks at the **Rapid Event Notification System** (RENO), which Netflix developed to support use cases that require server-initiated communication with devices in a scalable and extensible manner. The post gives an overview of the system and shares "lessons learned".

## Data Architecture

* [How Gemini Built a Cryptocurrency Analytics Platform Using Lakehouse for Financial Services][2]. This post is about crypto market leader Gemini and how they partnered with Databricks to build an order book analytics platform using the Lakehouse architecture. Very interesting post! I have some "cool" takeaways from the post! 

* [Apache Druid vs Apache Pinot - Which One Should You Choose?][3]. Apache Druid and Apache Pinot are two open-source OLAP datastore popular for real-time analytics. This post discusses the similarities and differences between the two, along with the use cases to help you understand which scenario favors Druid more and vice versa.

## Azure Data Explorer

* [Deleting individual records in a table][4]. This post does what "it says on the tin": it looks at how to delete individual records from a table in an **Azure Data Explorer** cluster. Very interesting!

## Streaming

* [Bringing Your Own Monitoring (BYOM) with Confluent Cloud][5]. Confluent Cloud provides a Metrics API to see performance data for a cluster. This means you can configure an application performance monitoring (APM) product with a Confluent Cloud cluster to monitor the telemetry flowing through the cluster. This blog post uses the Metrics API, Docker, Prometheus, Grafana, Splunk, and Datadog to create a complete monitoring solution for a Confluent Cloud deployment.

## WIND (What Is Niels Doing )

Prepping, prepping, prepping:

![](/images/posts/sqlbits-sessions.png)

**Figure 1:** *Sessions at SQLBits 2022*

**SQLBits 2022** is very close now, and I am nowhere near ready to present the sessions you see in *Figure 1*, \<sigh\>! However, somehow all will be OK! Details of the sessions:

* [**A Day of Azure Data Explorer**][6]. Full day training class.
* [**ksqlDB - The Real-Time Streaming Database**][7]. Conference session.
* [**Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer**][8]. Conference session.

There are still seats available for my training class as well as the conference. You register [here][9]!

See you in London in two weeks time!

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

[1]: https://netflixtechblog.com/rapid-event-notification-system-at-netflix-6deb1d2b57d1
[2]: https://databricks.com/blog/2022/02/15/how-gemini-built-a-cryptocurrency-analytics-platform-using-lakehouse-for-financial-services.html
[3]: https://www.decipherzone.com/blog-detail/druid-vs-pinot
[4]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/deleting-individual-records-in-a-table/ba-p/3166847
[5]: https://www.confluent.io/blog/bring-your-own-monitoring-with-confluent-cloud/
[6]: https://arcade.sqlbits.com/session-details/?id=300019
[7]: https://arcade.sqlbits.com/session-details/?id=301807
[8]: https://arcade.sqlbits.com/session-details/?id=301808
[9]: https://register.sqlbits.com/event/36db4730-583c-49c1-adcf-f76432bb6580/summary
