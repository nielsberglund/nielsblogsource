---
type: post
layout: "post"
title: Interesting Stuff - Week 5, 2021
author: nielsb
date: 2021-01-31T12:37:43+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - big data
  - data architecture
  - Kafka
  - Pinot
description: Kafka, kafka & machine learning, lakehouses and table formats, Apache Iceberg, and other interesting topics.
keywords:
  - data science
  - big data
  - data architecture
  - Kafka
  - Pinot   
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

## Big Data

* [Intro to Apache Pinot][2]. In [last weeks roundup][3], I posted a video link about doing real-time analytics using Apache Pinto and Kafka. What I have linked to here is to an awesome video introducing what Pinot is. If you are interested, it is a must-see!
* [Lakehouse: A New Generation of Open Platforms that Unify Data Warehousing and Advanced Analytics][4]. In some of the previous roundups I have written about Data Meshes, and how the Data Mesh is a hot topic today in the Big Data world. The video I have linked to here discusses another hot topic: the Lakehouse architecture. A Lakehouse is a data management system based on lowcost and directly-accessible storage that also provides traditional analytical DBMS management and performance features.
* [A Short Introduction to Apache Iceberg][5]. Part of the Lakehouse architecture is the table format. The table format allows for ACID transaction capability as well as data versioning, etc. Some table formats out there are Databricks Delta Lake, Apache Hudi, and Apache Iceberg. The post linked to here looks at Apache Iceberg, and what we can do with it.

## Streaming

* [Introducing seamless integration between Microsoft Azure and Confluent Cloud][1]. Well, I guess the title says it all! We finally have a transparent integration between Azure and Confluent Cloud. Hopefully, we'll now start to see posts from the Confluent guys, (and girls), where they do "cool stuff" on Azure and not only AWS and Google Cloud.
* [Streaming Machine Learning with Apache Kafka and without another Data Lake by Kai Waehner][6]. Usually, when we do Machine Learning, both training and inference, we use a data lake - perhaps even a Lakehouse as mentioned above. But it's possible to avoid such a data store altogether, using an event streaming architecture. The video linked to explains how this can be achieved leveraging Apache Kafka, Tiered Storage and TensorFlow.

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

[1]: https://azure.microsoft.com/en-us/blog/introducing-seamless-integration-between-microsoft-azure-and-confluent-cloud/
[2]: https://www.youtube.com/watch?v=T70jTTYhYyM
[3]: {{< relref "2021-01-24-interesting-stuff---week-4-2021.md" >}}
[4]: https://www.youtube.com/watch?v=RU2dXoVU8hY
[5]: https://medium.com/expedia-group-tech/a-short-introduction-to-apache-iceberg-d34f628b6799
[6]: https://www.youtube.com/watch?v=wjEYH41nvBM
