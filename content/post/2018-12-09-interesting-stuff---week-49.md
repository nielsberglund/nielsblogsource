---
type: post
layout: "post"
title: Interesting Stuff - Week 49
author: nielsb
date: 2018-12-09T07:18:55+02:00
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
  - SQL Server 2019 Big Data Clusters
  - SQL Server 2019 Java extension
  - Java
  - Azure Data Studio
  - Kafka
  - flink
description: Kafka and security, Flink, Azure Data Studio, SQL Server 2019 Big Data Clusters, SQL Server 2019 Java, and other topics!
keywords: 
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2019
  - SQL Server Machine Learning Services
  - SQL Server 2019 Big Data Clusters
  - SQL Server 2019 Java extension
  - Java
  - Azure Data Studio
  - Kafka
  - flink   
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

* [How Does Distributed Consensus Work?][1]. This is an excellent blog post discussing distributed computing and distributed consensus. I learned a lot for the post!
* [Announcing the Service Fabric provider for Bosh][2]. This is an announcement from Microsoft how Service Fabric can now me deployed an managed by [Bosh][3]. BOSH is a project that unifies release engineering, deployment, and lifecycle management of small and large-scale cloud software. 

## .NET

* [Announcing .NET Core 3 Preview 1 and Open Sourcing Windows Desktop Frameworks][4]. A blog post from Microsoft, announcing a preview of .NET Core 3. In .NET Core 3 Microsoft includes Windows Forms, WPF and WinUI, and they open-source them! Who'd have thunk! 
* [Announcing ML.NET 0.8 – Machine Learning for .NET][5]. Microsoft has just released version .8 of Machine Learning for .NET (ML.NET), and this blog post provides details about some of the new/improved functionality.

## Streaming

* [5 “baby” steps to develop a Flink application][6]. A short an sweet introduction how to get up and running with Apache Flink.
* [Kafka Streams and KSQL with Minimum Privileges][7]. You should read this blog post if you are working with Kafka. It discusses security, and how to apply security with minimum privileges.

## SQL Server

* [Fun with SQL Server Query Store, Query Plan 'StatisticsInfo' XML nodes, and STATS_STREAM][8]. A very cool blog post by [Lonny][lonny] where he has fun with SQL Server query related "stuff".
* [The November release of Azure Data Studio is now available][9]. The title says it all. The blog post discusses new/improved functionality in the November release of Azure Data Studio. I have found myself quite like ADS, and are doing most of my "stuff" in ADS instead of in SSMS; they said you can't learn old dogs new tricks - hah!

## SQL Server 2019

* [Learning Areas for SQL Server Big Data Clusters][10]. A teaser from [Buck Woody][buckw], where he talks about upcoming training and workshops related to **SQL Server 2019 Big Data Clusters**. He also lists some resources to start to get to understand all the new technologies in **SQL Server 2019 Big Data Clusters**.
* [SQL Server 2019 Extensibility Framework & Java - Passing Data][11]. I continue my journey with SQL Server 2019 Java extensions. In this post, I look at how we pass data back and forth between SQL Server and Java.

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

[1]: https://medium.com/s/story/lets-take-a-crack-at-understanding-distributed-consensus-dad23d0dc95
[2]: https://cloudblogs.microsoft.com/opensource/2018/12/04/announcing-service-fabric-provider-bosh
[3]: https://bosh.io/docs/
[4]: https://blogs.msdn.microsoft.com/dotnet/2018/12/04/announcing-net-core-3-preview-1-and-open-sourcing-windows-desktop-frameworks/
[5]: https://blogs.msdn.microsoft.com/dotnet/2018/12/04/announcing-ml-net-0-8-machine-learning-for-net/
[6]: https://data-artisans.com/blog/5-steps-flink-application-development
[7]: https://www.confluent.io/blog/kafka-streams-ksql-minimum-privileges
[8]: http://sql-sasquatch.blogspot.com/2018/12/fun-with-sql-server-query-store-query.html
[9]: https://cloudblogs.microsoft.com/sqlserver/2018/11/06/the-november-release-of-azure-data-studio-is-now-available/
[10]: https://buckwoody.wordpress.com/2018/12/03/learning-areas-for-sql-server-big-data-clusters/
[11]: {{< relref "2018-12-08-sql-server-2019-extensibility-framework--java---passing-data.md" >}}
