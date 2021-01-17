---
type: post
layout: "post"
title: Interesting Stuff - Week 3, 2021
author: nielsb
date: 2021-01-17T07:29:05+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data architecture
  - kafka
  - kafka connect
  - SQL Server Extensibility Framework
description: Kafka, Kafka Connect and the cloud, the value of data meshes, and other interesting topics.
keywords:
  - data architecture
  - kafka
  - kafka connect
  - SQL Server Extensibility Framework   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending. Admittedly not much this week but here goes:

<!--more-->

## Data Architecture

* [Data Mesh Liberates Business Value from Data Lakes, Data Warehouses][1]. Recently I have posted quite a bit around data architecture and data meshes. Here is another post about this topic. The post discusses how data meshes can add value to data lakes and traditional data warehouses. This is quite interesting to me as we are looking at this at [Derivco](/derivco) right now.

## Streaming

* [Running a self-managed Kafka Connect worker for Confluent Cloud][2]. Another post that comes at the right time. I have been looking at how to run Kafka in the cloud and use Kafka Connect. The problem is that not all Kafka connectors are cloud-enabled yet. Fortunately, this post comes to help and explains how to, for non cloud-enabled connectors, you can run your own Kafka Connect worker on-prem, which then connects to Confluent Cloud. Awesome!

## WIND (What Is Niels Doing)

In [last weeks roundup][3], I mentioned I was looking more into the SQL Server managed language extensions and how some posts would hopefully be forthcoming. Well, I am close to publishing a post around the Python extension and issues around creating external libraries. 

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


[1]: https://thenewstack.io/data-mesh-liberate-business-value-from-data-lakes-data-warehouses/
[2]: https://rmoff.net/2021/01/11/running-a-self-managed-kafka-connect-worker-for-confluent-cloud/
[3]: {{< relref "2021-01-10-interesting-stuff---week-2-2021.md" >}}
