---
type: post
layout: "post"
title: Interesting Stuff - Week 22, 2022
author: nielsb
date: 2022-06-05T09:58:38+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/vector.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Kafka
  - Confluent Cloud
description: Kafka elasticity vs. Confluent Cloud, new Sample Gallery for Azure Data Explorer, ADX & bounding boxes, and other interesting topics.
keywords:
  - Azure Data Explorer
  - Kafka
  - Confluent Cloud   
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

This blog post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Databases

* [Vector Databases: Taking Data Revolution to The Next Level][1]. We know about SQL and no-SQL databases and how they are used, and that they are used for structured and semi-structured data. However, we now see more unstructured data, and the question is how we can deal with (search, etc.) this data. Dealing with unstructured data is where vector databases can help. This post looks at vector databases, how they can help us manage unstructured data, and the solutions they offer.

## Azure Data Explorer

* [Azure Data Explorer in 60 minutes with the new samples gallery][2]. The post linked to announces the new Azure Data Explorer samples gallery feature. This feature provides an easy way to upskill and demo Azure Data Explorer with an end-to-end experience on a free, publicly available cluster. If you haven't looked at Azure Data Explorer yet, now it's time to do it.
* [Implementing and Optimizing Bounding Box Queries in Azure Data Explorer][3]. This post looks at how we can in Azure Data Explorer create a function that would return objects - in this case vehicles - that are within a given bounding box in a given time period. This is quite a cool usage of bounding boxes! 

## Streaming

* [Making Confluent Cloud 10x More Elastic Than Apache Kafka][4]. Elasticity is the cornerstone of cloud-native computing. This post looks at how Confluent took Apache Kafka's horizontal scalability to the next level—in fact, they took it up multiple levels—and made Confluent Cloud 10x more elastic! Quite interesting!

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

[1]: https://medium.com/geekculture/vector-databases-taking-data-revolution-to-the-next-level-4a0faa437b2c
[2]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/azure-data-explorer-in-60-minutes-with-the-new-samples-gallery/ba-p/3447552
[3]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/implementing-and-optimizing-bounding-box-queries-in-azure-data/ba-p/3416786
[4]: https://www.confluent.io/blog/10x-apache-kafka-elasticity/
