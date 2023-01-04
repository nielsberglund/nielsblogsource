---
type: post
layout: "post"
title: Interesting Stuff - Week 36, 2019
author: nielsb
date: 2019-09-08T20:23:48+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server
  - SQL Server Big Data Cluster
  - VS Code
description: Practical DDD and messaging, VS Code, SQL Saturday in Cape Town, and other interesting topics.
keywords:
  - distributed computing
  - SQL Server
  - SQL Server Big Data Cluster
  - VS Code   
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

## Distributed Computing

* [PracticalDDD: Bounded Contexts + Events => Microservices][1]. An [InfoQ][iq] presentation discussing the intersection of DDD as a software discipline with Messaging as a technology counterpart. DDD allows us to move faster and write high-quality code. When we start to use the technology of messaging to communicate between clean and well-defined bounded contexts, we get to remove temporal coupling. We now have microservices that are built for autonomy from the ground up. A fascinating presentation!
* [Conquering Microservices Complexity @Uber with Distributed Tracing][2]. Another [InfoQ][iq] presentation. The presenter presents a methodology that uses data mining to learn the typical behavior of the system from massive amounts of distributed traces, compares it with pathological behavior during outages, and uses complexity reduction and intuitive visualizations to guide the user towards actionable insights about the root cause of the outages. This is a very, very interesting presentation!
* [SLOG: serializable, low-latency, geo-replicated transactions][3]. In this white paper, dissection, [Adrial][adcol] looks at SLOG. SLOG is a system which leverages physical region locality in an application workload to achieve: strict serializability, low-latency writes, and high transactional throughput, while also supporting online consistent dynamic "re-mastering" of data as application patterns change over time.

## VS Code

* [Visual Studio Code: Develop PySpark jobs for SQL Server 2019 Big Data Clusters][4]. The linked blog post announces a new VS Code extension. The extension allows you, amongst other things, to deploy PySpark applications to SQL Server 2019 Big Data Cluster. This is an extension anyone developing Python applications need to have a look at.

# SQL Saturday

I have just come back from SQL Saturday in Johannesburg where I delivered a workshop about SQL Server 2019 Big Data Cluster with a colleague of mine; [Andrew Collier][acoll]. I also delivered two presentations:

* **What is the PiRate, Snake, and Cup of Coffee Doing in My Database?**. 
* **A Lap Around SQL Server Big Data Cluster**.

Next week I do the big data cluster workshop with [Andrew][acoll], [**A Day of SQL Server 2019 Big Data Cluster**][5], on Friday (Sep., 13), and two presentations on Saturday (Sep., 14). I believe the presentation will be the same as in Johannesburg:

* **What is the PiRate, Snake, and Cup of Coffee Doing in My Database?**. A talk about the SQL Server Extensibility Framework and how you can use R, Python and Java from inside SQL Server.
* **A Lap Around SQL Server Big Data Cluster**. This session gives you an overview of what a SQL Server Big Data Cluster is, and what you can do with it. We look at the various components, (Kubernetes, Spark, HDFS, PolyBase, etc.), and what you can do with them.

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
[acoll]: https://twitter.com/datawookie

[1]: https://www.infoq.com/presentations/microservices-ddd-bounded-contexts
[2]: https://www.infoq.com/presentations/uber-microservices-distributed-tracing
[3]: https://blog.acolyer.org/2019/09/04/slog/
[4]: https://cloudblogs.microsoft.com/sqlserver/2019/09/03/visual-studio-code-develop-pyspark-jobs-for-sql-server-2019-big-data-clusters/
[5]: https://www.quicket.co.za/events/80996-sqlsaturday-cape-town-2019-precon-with-neils-berglund-mvp-and-andrew-collier-sq/#/