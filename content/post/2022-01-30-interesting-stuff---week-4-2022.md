---
type: post
layout: "post"
title: Interesting Stuff - Week 4, 2022
author: nielsb
date: 2022-01-30T12:46:36+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - Azure Data Explorer
  - Databricks
  - user facing analytics
  - Kafka
  - SQLBits 2022
description: Kafka 3.1.0, Databricks & Snowflake, dashboards in Azure Data Explorer, Azure Data Explorer training at SQLBits, and other cool topics.
keywords:
  - distributed computing
  - Azure Data Explorer
  - Databricks
  - user facing analytics
  - Kafka
  - SQLBits 2022   
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

* [Fixing Performance Regressions Before they Happen][1]. This [Netflix][netflx] blog post looks at one of the strategies they use to quickly and easily detect performance anomalies before they are released — and often before they are even committed to the codebase.

## Distributed Computing

* [When to Use Two Phase Commit in Distributed Transaction][2]. Ah, one of my favorite topics - distributed transactions and 2 phase commit! This post looks at helping you understand the pros and cons of the 2PC algorithm and build capability to thoroughly assess the trade-off between different algorithms for your future system designs. 
* [Decoupled Transactions: Low Tail Latency Online Transactions Atop Jittery Servers (CIDR 2022)][5]. In [last weeks roundup][4], I mentioned the CIDR conference and how the talks were available on YouTube. The post linked to by [Murat][murba] looks at a White Paper submitted to the conference by Pat Helland. If you are not interested in reading the post (or the paper), Pat's talk based on the white paper is now up on YouTube: [Decoupled Transactions: Low Tail Latency Online Transactions Atop Jittery Servers][3]. The video is very, very "watch worthy"!

## Azure Data Explorer

* [ADX dashboards January 2022 updates][6]. As the title implies, this post looks at new functionality introduced for dashboards in **Azure Data Explorer**. Hmm, the ability to export dashboards, very cool!

## Data Architecture

* [All Eyes on Snowflake and Databricks in 2022][7]. It's hard to overstate Snowflake and Databricks' impact on the data industry for customers, partners, and competitors. This blog post looks at both Databricks and Snowflake and tries to determine what 2022 has in store.
* [Modern Data Stack: Which Place for Spark ?][8]. This very interesting post looks at why you rarely see any mentions of Apache Spark in articles about the Modern Data Stack. 
* [Building Reference Architectures for User-Facing Analytics][9]. User-facing analytics can be challenging to implement and, more specifically, user-facing analytics **at scale**. The post, written by [Dunith Dhanushka][10], discusses several blueprints for building scalable analytics infrastructure to deliver user-facing analytics. This is a **MUST** read post if you are interested in real-time user-facing analytics.

## Streaming

* [What's New in Apache Kafka 3.1.0][11]. This post highlights some of the more prominent features in the newly released 3.1.0 version of Apache Kafka.

## WIND (What Is Niels Doing)

In the coming days and weeks, I will be prepping for quite a few conference talks:

![](/images/posts/stream-processing-kafka.png)

**Figure 1:** *Stream Processing with Apache Kafka and .NET*

* [**Stream Processing with Apache Kafka and .NET**][12]. This is a Meetup user group talk, where I discuss Kafka, .NET and stream-processing.

![](/images/posts/sqlbits-precon-adx.png)

**Figure 2:** *SQLBITS 2022 - A Day of Azure Data Explorer*

* [**A Day of Azure Data Explorer**][13]. This is a one-day training class about Azure Data Explorer at SQLBits 2022. I am presenting live (woohoo), but you can also attend virtually.

![](/images/posts/ksqldb-streaming-db.png)

**Figure 3:** *ksqlDB - The Real-Time Streaming Database*

* [**ksqlDB - The Real-Time Streaming Database**][13]. An SQLBits 2022 conference talk, where I - in this demo filled session - look at using ksqlDB to gain real-time insights into streaming data. We look at push/pull queries, User Defined Functions, tables, streams, and *other cool stuff*.

![](/images/posts/analyze-billions-adx-sqlbits.png)

**Figure 4:** *Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer*

* [**Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer**][13]. This is my second conference talk at SQLBits 2022 (not counting the training day). In this session (full of demos), we get an overview of Azure Data Explorer. We look at how to ingest data and query in real-time against billions of rows with sub-second latency.

For the SQLBits related "stuff" (training day and conference), you register [here][14].

I hope to see you either at the [**.NET to the Core**][12] session or at [**SQLBits**][14]!

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

[1]: https://netflixtechblog.com/fixing-performance-regressions-before-they-happen-eab2602b86fe
[2]: https://hongilkwon.medium.com/when-to-use-two-phase-commit-in-distributed-transaction-f1296b8c23fd
[3]: https://youtu.be/72UZ8DxPa8o
[4]: {{< relref "2022-01-23-interesting-stuff---week-3-2022.md" >}}
[5]: http://muratbuffalo.blogspot.com/2022/01/decoupled-transactions-low-tail-latency.html
[6]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/adx-dashboards-january-2022-updates/ba-p/3074426
[7]: https://www.datanami.com/2022/01/20/all-eyes-on-snowflake-and-databricks-in-2022/
[8]: https://medium.com/towards-data-science/modern-data-stack-which-place-for-spark-8e10365a8772
[9]: https://medium.com/event-driven-utopia/building-reference-architectures-for-user-facing-analytics-dc11c7c89df3
[10]: https://twitter.com/dunithd
[11]: https://www.confluent.io/blog/apache-kafka-3-1-version-features-and-updates/
[12]: https://www.meetup.com/NET-to-the-Core/events/283278548
[13]: https://arcade.sqlbits.com/sessions/
[14]: https://register.sqlbits.com/event/36db4730-583c-49c1-adcf-f76432bb6580/summary
