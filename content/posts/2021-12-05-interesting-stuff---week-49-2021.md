---
type: post
layout: "post"
title: Interesting Stuff - Week 49, 2021
author: nielsb
date: 2021-12-05T08:51:58+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - ksqlDB
  - kafka
  - Trino
  - Azure Data Explorer
  - SqlBits
description: Kafka, ksqlDB & planes, Delta Lake roadmap, Trino & Big Data, Azure Data Explorer at SQLBits 2022, and other interesting topics.
keywords:
  - ksqlDB
  - kafka
  - Trino
  - Azure Data Explorer
  - SqlBits   
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

* [The Foundation of Your Lakehouse Starts With Delta Lake][3]. The Databricks Delta Lake has continuously evolved during the last few years, and in May 2021, Delta Lake 1.0 was announced. The evolution of Delta Lake doesn't stop with the 1.0 release, and this blog post reviews the major features released so far and provides an overview of the upcoming roadmap.
* [What Is Trino And Why Is It Great At Processing Big Data][4]. Trino is an open-source distributed SQL query engine for ad-hoc and batch ETL queries against multiple types of data sources. It previously went under the name of Presto, but due to various reasons, it had to change its name. The post linked to looks at Trino and covers its positives and negatives. At [Derivco](/derivco) we have contemplated using Trino. Let us see what the future brings.

## Streaming

* [ksqlDB Fundamentals: How Apache Kafka, SQL, and ksqlDB Work Together ft. Simon Aubury][5]. This link is to a podcast where [Tim Berglund][6] talks to [Simon Aubury][7] about everything ksqlDB. They cover basic ksqlDB, plus they look at how to use ksqlDB to find out which aeroplane wakes Simon's cat each morning. Very interesting!
* [Co-Designing Raft + Thread-per-Core Execution Model for the Kafka-API][8]. This [InfoQ][iq] presentation looks at, as the title says, codesign in Raft on a thread per core model for the Kafka API. This presentation is a must-see if you are interested in building low-latency software.
* [A Guide to Stream Processing and ksqlDB Fundamentals][9]. ksqlDB allows you to build applications that react to events as they happen and to take advantage of real-time data. Even though you use familiar SQL syntax when building your ksqlDB application, you might want some help. This post talks about the **ksqlDB 101** course on Confluent Developer, which offers both lectures and hands-on exercises.


## WIND (What Is Niels Doing)

SQLBITS 2022 - The Greatest Data Show - is just around the corner, and I am happy to announce that I am doing a full-day training session:

![](/images/posts/sqlbits-precon-adx.png)

**Figure 1:** *SQLBITS 2022 - A Day of Azure Data Explorer*

Yes, I am doing a whole day of **Azure Data Explorer**. Read more at: [**A Day of Azure Data Explorer**][2].

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

[1]: https://youtu.be/Fv2V-PShWuQ
[2]: https://sqlbits.com/information/event22/A_Day_of_Azure_Data_Explorer/trainingdetails
[3]: https://databricks.com/blog/2021/12/01/the-foundation-of-your-lakehouse-starts-with-delta-lake.html
[4]: https://www.theseattledataguy.com/what-is-trino-and-why-is-it-great-at-processing-big-data/
[5]: https://developer.confluent.io/podcast/ksqldb-fundamentals-how-apache-kafka-sql-and-ksqldb-work-together-ft-simon-aubury
[6]: https://twitter.com/tlberglund
[7]: https://twitter.com/simonaubury
[8]: https://www.infoq.com/presentations/raft-kafka-api/
[9]: https://www.confluent.io/blog/guide-to-stream-processing-and-ksqldb-fundamentals/
