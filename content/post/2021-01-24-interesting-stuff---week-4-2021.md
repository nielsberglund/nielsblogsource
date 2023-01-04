---
type: post
layout: "post"
title: Interesting Stuff - Week 4, 2021
author: nielsb
date: 2021-01-24T09:42:57+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data architecture
  - real-time analytics
  - SQL Server Extensibility Framework
  - Kafka
  - Pinot
  - Trino  
description: Kafka tools, Kafka & Pinot for analytics, MinIO & Trino, and other interesting topics.
keywords:
  - data architecture
  - real-time analytics
  - SQL Server Extensibility Framework
  - Kafka
  - Pinot
  - Trino     
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

## Data Architecture

* [How to Build a Modern Data Lake with MinIO][1]. This is a very "cool" post looking at creating a "poor man's data lake", by using open source technologies. In this case the technologies used are [**MinIO**][2], and [**Trino**][3]. MinIO is an object store compatible with S3, and Trino is a distributed SQL query engine, (formerly known as Presto). As I said, a very interesting post! See below for a follow-up post.
* [Modern Data Platform using Open Source Technologies][4]. This is the follow-up post, mentioned above. This post gives an overview of Trino and MinIO, and it also touches upon some features that they offer when implemented together as a data platform.
* [Data Engineering Weekly #21: Metadata Edition][5]. This particular post is from the [Data Engineering Weekly][6] newsletter. This edition focuses on recent breakthroughs in metadata management. Very interesting! Oh, and do yourself a favor and subscribe to the newsletter!

## Streaming

* [Helpful Tools for Apache Kafka Developers][7]. What the title says; this post looks at some useful tools for Kafka developers. At [Derivco](/derivco) we are using some of these, and the **Kafka Streams Topology Visualizer** is a particular favorite.
* [Uber's Real-time Data Intelligence Platform At Scale: Improving Gairos Scalability/Reliability][8]. Gairos is Uber's real-time data processing, storage, and querying platform. This post gives an overview of Gairos and what is done to ensure scalability and reliability. Cool stuff! 
* [Using Kafka and Pinot for Real-Time, User-Facing Analytics][9]. This video looks at how [Apache Pinot][10], and Apache Kafka can work together and enable real-time analytics.

## WIND (What Is Niels Doing)

* [SQL Server 2019 External Libraries and Your Python Runtime][11]. I managed to publish this post that I have mentioned in the last couple of weeks roundups. In the post, we look at how we can create external libraries for our Python external language.

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


[1]: https://medium.com/codex/how-to-build-a-modern-data-lake-with-minio-db0455eec053
[2]: https://min.io/
[3]: https://trino.io/
[4]: https://medium.com/codex/modern-data-platform-using-open-source-technologies-212ba8273eab
[5]: https://www.dataengineeringweekly.com/p/data-engineering-weekly-21-metadata
[6]: https://www.dataengineeringweekly.com/
[7]: https://www.confluent.io/blog/best-kafka-tools-that-boost-developer-productivity/
[8]: https://eng.uber.com/gairos-scalability/
[9]: https://zoom.us/rec/play/iXyDwNqRjmKQTp7MKkYPp8fiBvW-z84PmDlkkXldu26xMzjuxE7jaAJOvKjF3L1WRHHpXakwp6-ISB8.CVQAVTpF7RWtwneQ?continueMode=true&_x_zm_rtaid=YAm9SyaCSZOQRlCQ3LgfEw.1611288712092.8aa0dac1ffc00a955a58260d99c4945e&_x_zm_rhtaid=745
[10]: https://pinot.apache.org/
[11]: {{< relref "2021-01-24-sql-server-2019-external-libraries-and-your-python-runtime.md" >}}


