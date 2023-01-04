---
type: post
layout: "post"
title: Interesting Stuff - Week 3, 2019
author: nielsb
date: 2019-01-20T18:00:59+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2019
  - SQL Server Machine Learning Services
  - Java
  - Kubernetes
  - .NET Core
  - Big Data
description: Kafka, .NET Core and data, VS Code and Java, SQL Server 2019 Big Data Clusters
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2019
  - SQL Server Machine Learning Services
  - Java
  - Kubernetes
  - .NET Core
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

## Misc.

* [An Incremental Architecture Approach to Building Systems][1]. An [InfoQ][iq] article about building systems and how, to avoid over-engineering, we should start with a simple architecture and evolve it as needs arise.

## .NET

* [System.Data in .NET Core 3.0][2]. The first of two [InfoQ][iq] articles about `System.Data` in .NET Core 3.0. The article looks at what changes there are in .NET Core 3.0 for `System.Data`.
* [SQL Server and .NET Core 3.0][3]. The second [InfoQ][iq] article about `System.Data` in .NET Core 3.0. This time the attention is at `System.Data.SqlClient`, which is the SQL Server driver.

## Streaming

* [Getting Your Feet Wet with Stream Processing – Part 2: Testing Your Streaming Application][4]. The second and last part of a two-part blog series about developing and validating real-time streaming applications. This post looks at how we test streaming applications.
* [Scaling a Distributed Stream Processor in a Containerized Environment][5]. This [InfoQ][iq] article presents ideas and experiences around scaling a distributed stream processor in Kubernetes. The article discusses how the stream processor should identify the level of resource requirement and scale accordingly.  

## WIND (What is Niels Doing)

* [SQL Server 2019 & Java with Visual Studio Code][6]. A blog-post looking at how we can write SQL Server Java code using **Visual Studio Code**, the *VS Code*'s Java extension, and Maven.

If you are at [**Microsoft Ignite | The Tour**][7] in Johannesburg at the end of the month, please come by and say Hi! I deliver three sessions:

* **What is That Cup of Coffee Doing in my Database?** - A 15 minutes whirl-wind tour about the new Java language extension in SQL Server 2019.
* **SQL Server Machine Learning Services: An E2E platform for machine learning** - A 60-minute break-out session where we look at how SQL Server Machine Learning Services serves as an end-to-end ML platform for customers.
* **Deep dive on SQL Server and big data** - A 60-minute break-out session where we do a deep dive behind the technology for big data integration with SQL Server including Kubernetes, Polybase futures, and scalable performance. 

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

[1]: https://www.infoq.com/news/2019/01/rearchitecture-system-success
[2]: https://www.infoq.com/news/2019/01/Net-Core-3-System-Data
[3]: https://www.infoq.com/news/2019/01/Net-Core-3-System-Data-SqlClient
[4]: https://www.confluent.io/blog/stream-processing-part-2-testing-your-streaming-application
[5]: https://www.infoq.com/articles/distributed-stream-processor-container
[6]: {{< relref "2019-01-17-sql-server-2019--java-with-visual-studio-code.md" >}}
[7]: https://www.microsoft.com/en-za/ignite-the-tour/Johannesburg
