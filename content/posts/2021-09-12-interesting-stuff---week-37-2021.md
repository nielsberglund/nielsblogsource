---
type: post
layout: "post"
title: Interesting Stuff - Week 37, 2021
author: nielsb
date: 2021-09-12T09:43:08+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server External Languages
  - Kafka
  - Azure Data Explorer
  - Kafka Connect
description: Kafka streams tables and materialized views, SQL Server & C#, parallel programming, Azure Data Explorer, and other interesting topics.
keywords:
  - distributed computing
  - SQL Server External Languages
  - Kafka
  - Azure Data Explorer
  - Kafka Connect   
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

## Distributed Computing

* [The Practice of Parallel Programming][1]. A link to a free downloadable pdf version of the book **The Practice of Parallel Programming**. The pdf provides an advanced guide to the issues of parallel and multithreaded programming. It goes beyond the high-level design of the applications into the details that are often overlooked but vital to make the programs work. It is an excellent read!

## SQL Server 2019 Language Extensions

* [Open sourcing the .NET 5 C# Language Extension for SQL Server][2]. If you follow my blog, you may know that I have been writing quite a lot about the **SQL Server Language Extensions** and how extensions for Python, R, and Java exist and are open source. Well, the time has now come for C#. The post linked to announces the open-source release of SQL Server Language Extensions for C#! That.Is.So.Awesome! Expect some blog posts from yours truly looking at this.

## Azure Data Explorer

* [Azure Data Explorer ADX Overview][3]. In this YouTube video, the presenter dives into Azure Data Explorer – from data ingestion to dashboards – and looks at how Azure Data Explorer allows us to focus on discovering insights in the data while simplifying infrastructure and managing cost. 
* [Run Self-Managed Kusto Kafka Connector Serverless in Azure Container Instances][4]. This blog post by me looks at how to run the Kafka Connector for Azure Data Explorer server-less in Azure. We look at creating a Docker image for the connector and deploying it to Azure Container Instances.

## Streaming 

* [Understanding Materialized Views — Part 2][5]. This post is the second in a series about **Materialized Views**. In this post, the author looks at stream processing and explores two essential concepts in stateful stream processing; streams and tables. Based on streams and tables, he looks at how streams turn into tables that make materialized views. He concludes the post by learning how these materialized views can be scaled and recovered from failures. The first part of the series is [here], and I - for one - cannot wait for the next instalment!

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

[1]: http://babkin-cep.blogspot.com/2021/09/the-practice-of-parallel-programming.htm
[2]: https://cloudblogs.microsoft.com/sqlserver/2021/09/08/open-sourcing-the-net-5-c-language-extension-for-sql-server/
[3]: https://youtu.be/lN3HkAZ3oGA
[4]: {{< relref "2021-09-06-run-self-managed-kafka-connector-in-serverless-azure-container-instance.md" >}}
[5]: https://medium.com/event-driven-utopia/understanding-materialized-views-part-2-ae957d40a403
[6]: https://medium.com/event-driven-utopia/understanding-materialized-views-bb18206f1782
