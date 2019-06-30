---
type: post
layout: "post"
title: Interesting Stuff - Week 40
author: nielsb
date: 2018-10-07T09:34:44+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - SQL Server 2019 on Linux
  - MSIgnite
  - Kafka
  - KSQL
  - Flink
description: Kafka and debugging KSQL, Flink, MS Ignite sessions and other topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - SQL Server 2019 on Linux
  - MSIgnite
  - Kafka
  - KSQL
  - Flink  
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

## .NET

* [Update on .NET Core 3.0 and .NET Framework 4.8][1]. A blog post from the .NET engineering team, where they talk about the future of the .NET Framework and .NET Core. I wonder if this post was prompted by speculations recently about the future of the .NET Framework, where there were questions whether the .NET Framework 4.8 would be the last version, and all development would be concentrated on .NET Core.

## Azure

* [Enabling real-time data warehousing with Azure SQL Data Warehouse][2]. This post is an announcement how [Striim][3] now fully supports SQL Data Warehouse as a target for Striim for Azure. Striim is a system which enables continuous non-intrusive performant ingestion of enterprise data from a variety of sources in real time. 

## Streaming

* [Is Event Streaming the New Big Thing for Finance?][4]. An excellent blog post by [Ben Stopford][benstop] where he discusses the use of event streaming in the financial sector.
* [Troubleshooting KSQL – Part 2: What’s Happening Under the Covers?][5]. The second post by [Robin Moffat][rmoff] about debugging of KSQL. In this post - Robin, as the title says, goes under the covers to figure out what happens with KSQL queries.
* [6 things to consider when defining your Apache Flink cluster size][6].  This post discusses how to plan and calculate a Flink cluster size. In other words; how to define the number of resources you need to run a specific Flink job.

## MS Ignite

* [Syllabuck: Ignite 2018 Conference][7]. A great list of MS Ignite sessions that [Buck Woody][buckw] found interesting! Now I know what to do in my spare time!

## Data Science

* [Customized regression model for Airbnb dynamic pricing][8]. This post by [Adrian][adcol] is about a white-paper which details the methods that Airbnb use to suggest prices to listing hosts.
* [Cleaning and Preparing Data in Python][9]. A post which lists Python methods and functions that helps to clean and prepare data.
* [The Microsoft Infer.NET machine learning framework goes open source][10]. A blog post from Microsoft Research, in which they announce the open-sourcing of [Infer.NET][11]. Is anyone else but me somewhat confused about the various data science frameworks that Microsoft has?
* [How to build a Simple Recommender System in Python][12]. A blog post which discusses what a recommender system is and how you can use Python to build one.

## What Is Niels Doing (WIND)

That is a good question! As you know, I wrote two blog posts about SQL Server 2019:

* [What is New in SQL Server 2019 Public Preview][13]
* [SQL Server 2019 for Linux in Docker on Windows][14] 

My plan was to relatively quickly follow up those two posts with a third post how to run **SQL Server Machine Learning Services** on **SQL Server 2019 on Linux**, and do it inside a Docker container. After having spent some time trying to get it to work, (with no luck), I gave up and contacted a couple of persons in MS asking for help. The response was that, right now in **SQL Server 2019 on Linux CTP 2.0**, you cannot do it - bummer! The functionality will be in a future release.

I am now reworking the post I had started on to cover **SQL Server Machine Learning Services** in an **Ubuntu** based **SQL Server 2019 on Linux**. I should be able to publish something within a week or two.

I am also working on the third post in the [Install R Packages in SQL Server ML Services](/series/sql_server_ml_services_install_packages) series (still). Right now I have no idea when I can publish it - Sorry!

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

[1]: https://blogs.msdn.microsoft.com/dotnet/2018/10/04/update-on-net-core-3-0-and-net-framework-4-8/
[2]: https://azure.microsoft.com/en-us/blog/enabling-real-time-data-warehousing-with-azure-sql-data-warehouse/
[3]: https://www.striim.com/
[4]: https://www.confluent.io/blog/event-streaming-new-big-thing-finance
[5]: https://www.confluent.io/blog/troubleshooting-ksql-part-2
[6]: https://data-artisans.com/blog/6-things-to-consider-when-defining-your-apache-flink-cluster-size
[7]: https://buckwoody.wordpress.com/2018/10/02/syllabuck-ignite-2018-conference/
[8]: https://blog.acolyer.org/2018/10/03/customized-regression-model-for-airbnb-dynamic-pricing/
[9]: https://towardsdatascience.com/cleaning-and-preparing-data-in-python-494a9d51a878
[10]: https://www.microsoft.com/en-us/research/blog/the-microsoft-infer-net-machine-learning-framework-goes-open-source/
[11]: https://dotnet.github.io/infer/
[12]: https://towardsdatascience.com/how-to-build-a-simple-recommender-system-in-python-375093c3fb7d
[13]: {{< relref "2018-09-24-sql-server-2019-public-preview.md" >}}
[14]: {{< relref "sql-server-2019-for-linux-in-docker-on-windows.md" >}}
