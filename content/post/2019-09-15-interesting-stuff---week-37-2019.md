---
type: post
layout: "post"
title: Interesting Stuff - Week 37, 2019
author: nielsb
date: 2019-09-15T16:25:58+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services 
  - SQL Server 2019 Big Data Cluster
  - Kafka
description: Kafka, approximation of queries, SQL Saturday, SQL Server 2019 Big Data Cluster, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services 
  - SQL Server 2019 Big Data Cluster
  - Kafka   
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

This week I do not have that much to share, partly because I have been occupied with writing a blog post about deploying **SQL Server 2019 Big Data Cluster** using **Azure Data Studio** (see below). It has also been **SQL Saturday** which I have been "prepping" for.

## Data Science / Machine Learning

* [Experiences with approximating queries in Microsoft's production big-data clusters][1]. This is a dissection, by [Adrian][adcol], of a white paper about approximating queries at Microsoft. Approximation of queries is used when you want to run analysis / OLAP queries against massive datasets where a query could potentially run for hours. By using approximation the time to run the query is reduced significantly. 

## Streaming

* [Reflections on Event Streaming as Confluent Turns Five – Part 1][2]. This is a blog post by [Tim Berglund][timber], (awesome name by the way), where he looks back at how Apache Kafka and the Confluent Platform has changed the way we build event-driven systems. Happy 5th Birthday to Confluent!

## SQL Server 2019 Big Data Cluster

* [Install SQL Server 2019 Big Data Cluster using Azure Data Studio][3]. I had to tear down the **SQL Server 2019 Big Data Cluster** [Andrew][adcol] and me used for our workshop **A Day of SQL Server 2019 Big Data Cluster** in Johannesburg and rebuild it for the Cape Town leg of SQL Saturday. While I did the rebuild, I thought it would be a good idea to document what I did, and this blog post is the result.

## SQL Saturday

The South African leg of SQL Saturday is done and dusted. We were in Cape Town yesterday, (Saturday, September 14), and I delivered two conference talks, (in addition to Andrew's and mine workshop mentioned above):

* [A Lap Around SQL Server 2019 Big Data Cluster](/download/s2k19-bdc-overview.pdf): The new release of SQL Server; SQL Server 2019 includes Apache Spark and Hadoop Distributed File System (HDFS) for scalable compute and storage. This new architecture that combines together the SQL Server database engine, Spark, and HDFS into a unified data platform is called a “big data cluster.”
This session gives you an overview of what a SQL Server Big Data Cluster is, and what you can do with it.
* [What is the PiRate, Snake, and Cup of Coffee Doing in My Database?](/download/pirate-snake-coffee.pdf): In this session we looked at the SQL Server Extensibility Framework, and we saw how we can call out to external languages from inside SQL Server. We looked at R, Python and Java, and what we can do from SQL Server having access to those languages.

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
[timber]: https://twitter.com/tlberglund

[1]: https://blog.acolyer.org/2019/09/09/ms-approx-query/
[2]: https://www.confluent.io/blog/event-streaming-reflections-as-confluent-turns-five-part-1
[3]: {{< relref "2019-09-11-install-sql-server-2019-big-data-cluster-using-azure-data-studio.md" >}}
