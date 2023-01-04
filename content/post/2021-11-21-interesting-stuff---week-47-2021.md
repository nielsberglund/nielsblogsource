---
type: post
layout: "post"
title: Interesting Stuff - Week 47, 2021
author: nielsb
date: 2021-11-21T09:27:19+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - Azure Synapse
  - Kafka
  - ksqlDB
  - Python
description: Kafka, ksqlDB & push queries, Ray on Databricks, SynapseML, NewSQL, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - Azure Synapse
  - Kafka
  - ksqlDB
  - Python   
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

## Machine Learning / AI

* [SynapseML: A simple, multilingual, and massively parallel machine learning library][1]. This post introduces **SynapseML**. SynapseML was previously known as MMLSpark and is an open-source library that simplifies the creation of massively scalable machine learning (ML) pipelines. SynapseML unifies several ML frameworks and new Microsoft algorithms in a single, scalable API usable across Python, R, Scala, and Java.

## Databases

* [What's Really New with NewSQL?][2]. In this post, [Murat][murba] looks at the evolution of NoSQL into NewSQL and what NewSQL is. Very informative; I liked the post a lot.

## Distributed Computing

* [Ray on Databricks][3]. No, this is not a post where someone named **Ray** talks about Databricks. Ray is an open-source project that makes it simple to scale any compute-intensive Python workload. Running Ray on top of an Apache Spark cluster creates the ability to distribute the internal code of PySpark UDFs and Python code that used to be only run on the driver node. But hang on a sec; Spark is a distributed framework. Why would I want to run another distributed framework on top of Spark? Well, read the post and find out.

## Streaming

* [Streaming Data Exchange with Kafka and a Data Mesh in Motion][4]. In quite a few roundups, I have linked to posts about **Data Mesh**. In even more roundups, I have linked to Kafka material and posts about streaming data. The post linked to looks at the principle behind the Data Mesh and why we need multiple technologies to build a Data Mesh. The post dives into why Kafka is a good solution for the foundation of a Data Mesh.
* [Announcing ksqlDB 0.22.0][5]. I guess the post title says it all: it looks at some of the new features of **ksqlDB** 0.22. And some very cool new features they are as well! Please read the post to find out more!
* [How to Efficiently Subscribe to a SQL Query for Changes][6]. This post looks at one of the new features in **ksqlDB** 0.22; enhancements to push queries and increased scalability of said queries. Very, very cool!

## WIND (What Is Niels Doing)

It is not so much of what I am doing as of what did I do:

![](/images/posts/improve-clv-2.png)

**Figure 1:** *Cloud Data Driven*

I did a presentation a little while back at [**Cloud Data Driven**][7], where I looked at **Customer Lifetime Value** (CLV), and how you can use Azure Databricks to calculate the CLV. As I said, it was a week or two ago, why i mention it now is because the recording of the webinar is up on YouTube. So, if you are interested - go and have a look at [**Improve Customer Lifetime Value using Azure Databricks Delta Lake**][8].

While you are at it, register with [**Cloud Data Driven**][9]'s Meetup group. The group is awesome if you are interested in everything data! 

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

[1]: https://www.microsoft.com/en-us/research/blog/synapseml-a-simple-multilingual-and-massively-parallel-machine-learning-library/
[2]: http://muratbuffalo.blogspot.com/2021/11/whats-really-new-with-newsql.html
[3]: https://databricks.com/blog/2021/11/19/ray-on-databricks.html
[4]: https://www.kai-waehner.de/blog/2021/11/14/streaming-data-exchange-data-mesh-apache-kafka-in-motion/
[5]: https://www.confluent.io/blog/ksqldb-0-22-new-features-major-upgrades/
[6]: https://www.confluent.io/blog/push-queries-v2-with-ksqldb-scalable-sql-query-subscriptions/
[7]: https://www.linkedin.com/company/clouddatadriven/
[8]: https://youtu.be/e6MJ4DRCgj8
[9]: https://www.meetup.com/cloud-data-driven
