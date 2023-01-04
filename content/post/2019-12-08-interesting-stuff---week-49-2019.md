---
type: post
layout: "post"
title: Interesting Stuff - Week 49, 2019
author: nielsb
date: 2019-12-08T08:02:31+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - SQL Server 2019 Big Data Cluster
  - Azure Data Studio
  - DataplatformGeeks
description: Lock free durable sets, chaos engineering, stream processing APIs, and other interesting topics.
keywords:
  - distributed computing
  - SQL Server 2019 Big Data Cluster
  - Azure Data Studio
  - DataplatformGeeks  
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

* [Efficient lock-free durable sets][1]. The post linked to is a dissection by [Adrian][adcol] of a white paper discussing a new approach for durable concurrent sets and the use of this approach to build the most efficient durable hash tables available today.
* [A Roadmap Towards Chaos Engineering][2]. This presentation linked to here is an [InfoQ][iq] presentation presenting a roadmap for Chaos Experimentation that can be applicable to any organization.

## Streaming

* [Stream Processing API Designs][3]. The post linked to is part of a series about data streaming. The post discusses different API designs for stream processing. It is a very interesting read!

## WIND (What Is Niels Doing)

The week just passed, I did two webinars for [**DataPlatformGeeks**][4], (DPG):

* [A Lap Around SQL Server 2019 Big Data Cluster][5]. An overview of SQL Server 2019 Big Data Cluster.
* [Azure Data Studio and SQL Server 2019 Big Data Cluster][6]. We look at using Azure Data Studio to deploy and manage a SQL Server 2019 Big Data Cluster.

It was interesting doing webinars, but it is quite different than from doing conference talks. I had some technical difficulties in the first webinar, but as they say - "You Live and Learn". Despite the technical difficulties, I certainly plan on doing more webinars.

I recommend all of you to [register][7] with DPG, as they have a plethora of free learning resources!

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

[1]: https://blog.acolyer.org/2019/12/02/efficient-lock-free-durable-sets/
[2]: https://www.infoq.com/presentations/roadmap-chaos-experimentation/
[3]: http://tutorials.jenkov.com/data-streaming/stream-processing-api-designs.html
[4]: https://www.dataplatformgeeks.com/
[5]: https://www.dataplatformgeeks.com/videos/a-lap-around-sql-server-2019-big-data-cluster-by-niels-berglund/
[6]: https://www.dataplatformgeeks.com/videos/azure-data-studio-and-sql-server-2019-big-data-cluster-by-niels-berglund/
[7]: https://www.dataplatformgeeks.com/registration