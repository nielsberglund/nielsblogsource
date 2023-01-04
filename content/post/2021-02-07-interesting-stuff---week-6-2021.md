---
type: post
layout: "post"
title: Interesting Stuff - Week 6, 2021
author: nielsb
date: 2021-02-07T13:05:26+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Presto
  - Pinot
  - Kafka
  - lakehouse
  - data architecture
description: Kafka, Confluent Cloud & Azure Databricks, Presto & Pinot, Lakehouses, and other interesting topics.
keywords:
  - Presto
  - Pinot
  - Kafka
  - lakehouse
  - data architecture  
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

* [Real-time Analytics with Presto and Apache Pinot — Part I][1]. I have written in previous roundups about Presto, which is now called Trino, and Apache Pinot. The blog post linked to here is the first in a two part series about how to use Presto and Pinot together. The second part is [here][2].

## Data Architecture

* [The 3 Things to Keep in Mind While Building the Modern Data Stack][3]. Building a data stack, never mind a modern data stack, can be confusing and complicated. This post proposes a simplified framework for creating the stack. The post looks at a conceptual model to help us when we pick the tools for the stack. I found the post very informative!
* [What Is Data Mesh? And Should You Mesh It Up Too?][4]. Recently I have mentioned data meshes quite a lot. Here is another post about data meshes. It looks at what a Data Mesh is, and why more and more companies are looking to implement them.
* [How Lakehouses Solve Common Issues With Data Warehouses][5]. In [last weeks roundup][6] I linked to a video about data Lakehouses. The post I link to here is the first in a series about Lakehouses, and it is based on [this white-paper][7]. I am certainly looking forward to the other posts in the series.

## Streaming

* [Consuming Avro Data from Apache Kafka Topics and Schema Registry with Databricks and Confluent Cloud on Azure][8]. Last [week][6] I posted a [link][9] about integration between Confluent Cloud and Microsoft Azure. I wrote that I hoped to see blog posts from the Confluent guys, (and girls), where they do "cool stuff" on Azure and not only AWS and Google Cloud. Well ask, and you shall be given! The post linked to here discusses how to configure Azure Databricks to interact with Confluent Cloud so that you can ingest, process, store, make real-time predictions and gain business insights from your data.
* [Simplify Kafka at Scale with Confluent Tiered Storage][10]. In October 2020, Confluent announced Confluent Platform 6.0, and how one of the new features was [tiered storage][11]. This post looks at how tiered storage works, how to set it up, and performance implications. Very interesting!

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


[1]: https://medium.com/apache-pinot-developer-blog/real-time-analytics-with-presto-and-apache-pinot-part-i-cc672caea307
[2]: https://medium.com/apache-pinot-developer-blog/real-time-analytics-with-presto-and-apache-pinot-part-ii-3d09ff937713
[3]: https://towardsdatascience.com/the-3-things-to-keep-in-mind-while-building-the-modern-data-stack-5d076743b33a
[4]: https://towardsdatascience.com/what-is-data-mesh-and-should-you-mesh-it-up-too-364b28fe2ae9
[5]: https://databricks.com/blog/2021/02/04/how-lakehouses-solve-common-issues-with-data-warehouses.html
[6]: {{< relref "2021-01-31-interesting-stuff---week-5-2021.md" >}}
[7]: http://cidrdb.org/cidr2021/papers/cidr2021_paper17.pdf
[8]: https://www.confluent.io/blog/consume-avro-data-from-kafka-topics-and-secured-schema-registry-with-databricks-confluent-cloud-on-azure/
[9]: https://azure.microsoft.com/en-us/blog/introducing-seamless-integration-between-microsoft-azure-and-confluent-cloud/
[10]: https://joshua-robinson.medium.com/simplify-kafka-at-scale-with-confluent-tiered-storage-ae8c1a2c9c80
[11]: https://www.confluent.io/blog/confluent-platform-6-0-delivers-the-most-powerful-event-streaming-platform-to-date/#tired-storage
