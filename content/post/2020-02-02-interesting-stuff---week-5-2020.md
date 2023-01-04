---
type: post
layout: "post"
title: Interesting Stuff - Week 5, 2020
author: nielsb
date: 2020-02-02T09:48:52+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server 2019 Big Data Cluster
  - big data
  - Kafka
description: Kafka, data lakes, SQL Big Data Cluster, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server 2019 Big Data Cluster
  - big data
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

## Data Science / Machine Learning

* [CI/CD for Machine Learning][1]. The presentation this links to is an [InfoQ][iq] presentation where the presenter discusses the challenges with CI/CD for machine learning and shows how a CI/CD pipeline for Machine Learning can greatly improve both productivity and reliability.

## SQL Server 2019

* [The ultimate performance for your big data with SQL Server 2019 Big Data Clusters][2]. This post summarizes a Microsoft [white paper][3] discussing the performance of SQL Server 2019 Big Data Cluster. After I read the post, I went back and looked at the white paper. The Big Data Cluster offers quite impressive performance, I must say!

## Distributed Computing

* [Microservices architecture on Azure Kubernetes Service (AKS)][4]. The link here is to a Microsoft document covering a reference architecture for microservices applications running on Azure Kubernetes Service. I found the document quite interesting, and I hope to be able to do some POC's around this shortly.

## Big Data

* [How to Move Beyond a Monolithic Data Lake to a Distributed Data Mesh][5]. This is a very interesting post, looking at the state of today's enterprise data architecture. It is a must-read for anyone interested in the subject.
* [What is a Lakehouse?][6]. The post linked to here is similar to the one above in that it looks beyond data lakes. From the post: "*The lakehouse is a new data management paradigm that radically simplifies enterprise data infrastructure and accelerates innovation in an age when machine learning is poised to disrupt every industry.*".

## Streaming

* [Streaming Machine Learning with Tiered Storage and Without a Data Lake][7]. Once again, a post which discusses data lakes, or rather the lack thereof. This post introduces a new feature in Kafka: the ability to add external storage to a Kafka broker. A very interesting topic, (pun intended), and this definitely moves Kafka towards being a complete data store. My only concern when thinking about this is how to query the data from Kafka? I guess time will tell.
* [Streams and Monk – How Yelp is Approaching Kafka in 2020][8]. This is a very interesting post, in that it describes how Yelp moves towards data as a service using Kafka and some internal applications. I will recommend this post to the people at [Derivco](/derivco) working with Kafka.

## Microsoft Ignite The Tour | Johannesburg

I just came back from the Johannesburg leg of Microsoft Ignite The Tour.

I want to thank the ones of you that came to my sessions, you guys rocked!

At the moment I am cleaning up my presentation decks and the demo code. I'll publish it for download in a couple of days time.

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


[1]: https://www.infoq.com/presentations/ci-cd-ml
[2]: https://cloudblogs.microsoft.com/sqlserver/2020/01/29/the-ultimate-performance-for-your-big-data-with-sql-server-2019-big-data-clusters/
[3]: https://download.microsoft.com/download/e/2/3/e231a918-97cf-4acc-81d8-5188967fd3da/Joint_Microsoft_SQL_Server_2019_Big_Data_Cluster_Case_Study_White_Paper.pdf
[4]: https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/microservices/aks
[5]: https://martinfowler.com/articles/data-monolith-to-mesh.html
[6]: https://databricks.com/blog/2020/01/30/what-is-a-data-lakehouse.html
[7]: https://www.confluent.io/blog/streaming-machine-learning-with-tiered-storage/
[8]: https://engineeringblog.yelp.com/2020/01/streams-and-monk-how-yelp-approaches-kafka-in-2020.html
