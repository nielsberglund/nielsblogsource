---
type: post
layout: "post"
title: Interesting Stuff - Week 3, 2023
author: nielsb
date: 2023-01-22T12:38:31+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-03-23.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - ksqlDB
  - Flink
  - distributed computing
description: This week we look at cool visualizations in Azure Data Explorer using Plotly. Interesting about benefits and challenges of distributed computing. Comparison of different SQL-based streaming approaches and their use cases, including a look at a streaming database. A really good post about Time in Flink.
---

So, what do we have for Week 3, 2023? 

A mixed bag: cool visualizations in Azure Data Explorer using Plotly. Interesting about the benefits and challenges of distributed computing. Comparison of different SQL-based streaming approaches and their use cases, including a look at a streaming database. An excellent post about Time in Flink. As a side note, I wish Flink's time functions supported a more granular precision than milliseconds.

<!--more-->

## Azure Data Explorer

* [Plotly visualizations in Azure Data Explorer][1]. Azure Data Explorer (ADX) supports various data visualizations, including time, bar and scatter charts, maps, funnels and many more. The visualization you chose can be rendered using the `render` operator in KQL or selected when you build an ADX dashboard. This post announces the support for advanced interactive visualizations using the Plotly graphics library. I am not a visualization guy, but this sounds awesome!
* [Kusto Detective Agency (Part 3) - Challenge 2: Election fraud?][2]. The [Kusto Detective Agency][3] is an interactive big data contest with five different challenges, where you use Kusto Query Langauge to solve the cases. In the [Christmas New Year roundup][4], I wrote how I had worked through and solved the challenges. The challenge which gave me the most problem was Challenge 2: Election Fraud. The linked post looks at that challenge and proposes one way of solving it (I did it in another way). If you want to learn KQL in a fun way, join the [Kusto Detective Agency][3].

## Distributed Computing

* [Distributed Computing Concepts][5]. This post discusses the concept of distributed computing and how it allows for the distribution of tasks across multiple computers or devices. This can increase efficiency and reduce the workload on a single machine. The article mentions different types of distributed systems, such as peer-to-peer networks, grid computing, and cluster computing, and also covers the benefits and challenges of distributed computing. I especially like the part where the author discusses network partitions.

## Streaming

* [Comparing SQL-based streaming approaches][6]. This article is from back in April 2022, and I must have missed it somehow back then. Anyway, the article compares different SQL-based streaming approaches and their use cases. The author discusses Apache Kafka, Apache Flink, Apache Spark, and the streaming database Materialize and compares their features and capabilities. The article highlights each approach's pros and cons and provides guidance on when to use them. The article also points out that the best approach for data streaming depends on the specific use case and requirements. 

* [Flink SQL: Queries and Time][7]. Since I have started looking into Flink, more specifically Flink SQL, this post comes at the right time. It discusses the use of Flink SQL for querying time-based data and the various time attributes available in Flink SQL. The article explains that Flink SQL supports event time and processing time, which are used to determine when events occurred and when they were processed, respectively. It also mentions the concept of watermarks and how they are used to ensure that late-arriving events are handled correctly. The article provides examples of how to use these time attributes in Flink SQL queries and covers other time-related features of Flink SQL, such as windowing and sessionization. Very good!

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

[1]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/plotly-visualizations-in-azure-data-explorer/ba-p/3717768
[2]: https://it-infrastructure.solutions/kusto-detective-agency-part-3/
[3]: https://detective.kusto.io/
[4]: {{< relref "2023-01-08-interesting-stuff---xmas-new-year-2022-week-1-2023.md" >}}
[5]: https://medium.com/codex/distributed-computing-concepts-f6275078a81
[6]: https://georgheiler.com/2022/04/01/comparing-sql-based-streaming-approaches/
[7]: https://www.ververica.com/blog/flink-sql-queries-and-time
