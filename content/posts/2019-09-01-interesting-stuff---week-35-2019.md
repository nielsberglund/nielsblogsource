---
type: post
layout: "post"
title: Interesting Stuff - Week 35, 2019
author: nielsb
date: 2019-09-01T19:40:31+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server Big Data Cluster
  - SQL Server Machine Learning Services 
  - Kafka
  - Kubernetes
  - .NET
description: "Kafka & Graph Databases, Kubernetes, Big Data, and other interesting topics."
keywords:
  - data science
  - distributed computing
  - SQL Server Big Data Cluster
  - SQL Server Machine Learning Services 
  - Kafka
  - Kubernetes
  - .NET   
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

* [How Microsoft rewrote its C# compiler in C# and made it open source][1]. TThis is a fascinating post by Mads Torgersen, where he discusses Roslyn, the open-source compiler for C# and VB.NET.

## Big Data

* [Big Data is just Data][2]. In this blog post [Buck][buckw] discusses what happened to **Big Data**, did it die or what - as no one talks about it any more? The post gives one food for thoughts! Oh, and I am so excited to get to meet Buck at the SQL Saturday's in [Johannesburg][jhb] and [Cape Town][ct] the next two weekends!

## Distributed Computing

* [Octant: Local and Real-Time Dashboard for Kubernetes Workloads][3]. This [InfoQ][iq] article is about Octant, a tool to help developers understand how their applications are running in a Kubernetes cluster. Developers can graphically visualize Kubernetes objects dependencies, forward local ports to a running pod, inspect pod logs, and navigate through different clusters.
* [Cellery: A Code-First Approach to Deploy Applications on Kubernetes][4]. This another Kubernetes article from [InfoQ][iq]. The article explains Cellery, which is a code-first approach to building, integrating, running, and managing composite applications on Kubernetes, using a cell-based architecture. 

## Streaming

* [Using Graph Processing for Kafka Stream Visualizations][5]. This is a very, very cool article discussing how we can match up Kafka with graph databases, (in this case Neo4J), to visualize our streaming data and gain insight from the data.

# SQL Saturday

It is early September, and that means that SQL Saturday is just around the corner. In fact, the Johannesburg leg of SQL Saturday is next weekend. I am fortunate enough to present in both Johannesburg and Cape Town.

Me together with a colleague - [Andrew Collier][acoll] - delivers a one day workshop: **A Day of SQL Server 2019 Big Data Cluster**, where we drill into - you guessed it - SQL Server 2019 Big Data Cluster. We do that Friday, September 6 in Johannesburg, and Friday, September 13 in Cape Town.

If you are interested to understand what SQL Server 2019 Big Data Cluster is all about, please register for Johannesburg [here][6], or Cape Town [here][7]. It will be a blast - I promise!

In Johannesburg, I deliver on Saturday, (September 7), two talks:

* [What is the PiRate, Snake, and Cup of Coffee Doing in My Database?][8]. A talk about the SQL Server Extensibility Framework and how you can use R, Python and Java from inside SQL Server.
* [A Lap Around SQL Server Big Data Cluster][9]. This session gives you an overview of what a SQL Server Big Data Cluster is, and what you can do with it. We look at the various components, (Kubernetes, Spark, HDFS, PolyBase, etc.), and what you can do with them.

In Cape Town, Saturday, September 14, I also deliver two talks:

* [Set Your SQL Server Data Free with the Use of Kafka][10]. In this talk, we look at how we can stream data from SQL Server to the de facto standard for streaming: Apache Kafka. We look at tools like Kafka Connect and external languages, and after the session, we should have a good understanding of various ways we can "set the data free".
* [SQL Server Machine Learning Services & External R/Python Packages][11]. SQL Server Machine Learning Services supports both R and Python, and they come with all the regular packages installed. However, there are a lot more packages available "out in the wild". In this session, you learn various ways you can install both R and Python packages in SQL Server instances.

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

[1]: https://medium.com/microsoft-open-source-stories/how-microsoft-rewrote-its-c-compiler-in-c-and-made-it-open-source-4ebed5646f98
[2]: https://buckwoody.wordpress.com/2019/08/26/big-data-is-just-data/
[3]: https://www.infoq.com/news/2019/08/octant-kubernetes-dashboard
[4]: https://www.infoq.com/articles/cellery-code-first-kubernetes
[5]: https://www.confluent.io/blog/kafka-graph-visualizations
[6]: https://www.quicket.co.za/events/81482-a-day-of-sql-server-2019-big-data-cluster-with-neils-berglund-and-andrew-collier#/
[7]: https://www.quicket.co.za/events/80996-sqlsaturday-cape-town-2019-precon-with-neils-berglund-mvp-and-andrew-collier-sq/#/
[8]: https://www.sqlsaturday.com/903/Sessions/Details.aspx?sid=95909
[9]: https://www.sqlsaturday.com/903/Sessions/Details.aspx?sid=95908
[10]: https://www.sqlsaturday.com/897/Sessions/Details.aspx?sid=95915
[11]: https://www.sqlsaturday.com/897/Sessions/Details.aspx?sid=95916

[jhb]: https://www.sqlsaturday.com/903/EventHome.aspx
[ct]: https://www.sqlsaturday.com/897/EventHome.aspx

