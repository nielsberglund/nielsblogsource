---
type: post
layout: "post"
title: Interesting Stuff - Week 29, 2021
author: nielsb
date: 2021-07-18T14:05:36+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server
  - Apache Spark
  - Azure Data Explorer
  - Kafka
description: Kafka & Apache Spark, Spark 3.0 SQL Server connector, Azure Data Explorer, and other interesting topics.
keywords:
  - SQL Server
  - Apache Spark
  - Azure Data Explorer
  - Kafka   
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

Speaking about the week just ending - wow, what a week! As you may know or not, I live in Durban, South Africa. Durban is in the province of KZN (KwaZulu-Natal), home to Jacob Zuma, ex-president of SA. On July 8, Jacob Zuma was put in jail after being found guilty of contempt of court. The jailing of Jacob Zuma led to protests that initially were peaceful. However, this changed Sunday, July 11, when small scale rioting broke out in and around Durban. On Monday (July 12), it escalated to full-scale rioting, looting, and factories burning.

The police were not prepared for the scale of the riots and could not offer any form of protection and help, so the local communities took it upon themselves to protect the local areas. Roadblocks were put up to prevent rioters from entering the neighbourhoods. The roadblocks were manned 24/7 by people from the community, and we did nighttime patrols to show presence and act as a deterrent. So I have done night patrols from last Monday until Friday night.

What we did seem to have helped, and fortunately we had no issues in the area I live in. I must say however, that it is a bit frightening when you are out in the middle of the night, and you hear gunshots some hundred meters away!

That's enough of my "adventures", let's get back to what this post is all about.

<!--more-->

## SQL Server

* [Accelerate big data analytics with the Spark 3.0 connector for SQL Server—now generally available][1]. The title of this post says it all; the Apache Spark 3.0 connector is now available. The connector is a high-performance connector that enables you to use transactional data in big data analytics, and persists results for ad-hoc queries or reporting. 

## Big data

* [Identity keyrings][2]. In an enterprise various parts of the business may have different identifiers for the same entity, and correlating these different identities may be difficult. The post linked to looks at how we can use Azure Data Explorer to build an identity keyring that brings together the various identifier. This is a very interesting read, showing what Azure Data Explorer can do!
* [Interactive Querying with Apache Spark SQL at Pinterest][3]. This post looks at how Pinterest built a scalable, reliable, and efficient interactive querying platform that processes hundreds of petabytes of data daily with Apache Spark SQL. Very, very cool!

## Streaming

* [Unified Flink Source at Pinterest: Streaming Data Processing][4]. The post here is another post by Pinterest. In the post they drill down and look at how they use Apache Spark for stream processing.

## WIND (What Is Niels Doing)

Above I wrote about the problems we had in Durban last week. I wrote about doing night patrols. Well, it looks like we need to start them up again, as rumours are floating around about new attacks. So, back to night shifts, *sad-face*!

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

[1]: https://azure.microsoft.com/en-us/blog/accelerate-big-data-analytics-with-the-spark-30-connector-for-sql-server-now-generally-available/
[2]: https://towardsdatascience.com/identity-keyrings-201d17295954
[3]: https://medium.com/pinterest-engineering/interactive-querying-with-apache-spark-sql-at-pinterest-2a3eaf60ac1b
[4]: https://medium.com/pinterest-engineering/unified-flink-source-at-pinterest-streaming-data-processing-c9d4e89f2ed6
