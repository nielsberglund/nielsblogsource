---
type: post
layout: "post"
title: Interesting Stuff - Week 40, 2022
author: nielsb
date: 2022-10-09T09:09:35+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server
  - data architecture
  - kafka
  - streaming
description: Kafka 3.3 released, Kafka Stream Designer, Polybase & SQL Server 2022, and other interesting topics.
keywords:
  - SQL Server
  - data architecture
  - kafka
  - streaming   
---

![](/images/posts/pipeline.jpg)

**<p style="text-align: center;"><em>Pipeline</em></p>**
**<p style="text-align: center;"><em>Photo by <a href="https://unsplash.com/@mbenna?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Mike Benna</a> on <a href="https://unsplash.com/s/photos/pipeline?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
  </em></p>**

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

## SQL Server 2022

* [Data Virtualization with PolyBase for SQL Server 2022][1]. One of the big things back in the day (well, maybe a year or two ago) fro SQL Server 2019 Big Data Cluster (BDC) was the Polybase support for External Tables against a lot of data sources. That support has now been introduced in your "normal" SQL Server 2022, and this post looks at this new PolyBase and what you can do with it.

## Data Architecture

* [The InfoQ eMag: Modern Data Architectures, Pipelines, & Streams][2]. This [InfoQ][iq] post contains a download link for an eMag book: **Modern Data Architectures, Pipelines, & Streams**. I downloaded the book and found it useful. The book looks at up-to-date case studies and real-world data architectures. Very cool!
* [Data lake architecture][3]. This post gives an excellent overview of the various parts of a data lake. It looks at things like the raw data layer, cleansed data layer, and presentation data layer and links to useful resources.

## Streaming

* [What's New in Apache Kafka 3.3][4]. I guess the title says it all. Kafka 3.3 was just released, and this post looks at some of the new features. The big one in this release is that KRaft is production ready. I.e. you can now use KRaft instead of Zookeeper as your metadata controller.
* [Introducing Stream Designer: The Visual Builder for Streaming Data Pipelines][5]. What this post looks at is something I can't wait to start "playing" with, the **Stream Designer**. The Stream Designer is a visual interface for rapidly building, testing, and deploying streaming data pipelines natively on Kafka. It is of particular interest as we at [Derivco](/derivco) are now doing some very interesting "stuff" related to data pipelines.

## WIND (What Is Niels Doing)

This:

![](/images/posts/adx-ingestion.png)

**Figure 1:** *Azure Data Explorer Ingestion*

The next meeting at [Azure Durban User Group][6] is held this Wednesday (Oct 12). At this meeting I am continuing my **Azure Data Explorer** investigations and we look at how to ingest data into ADX. Things I cover are:

* Batch Ingestion
* Streaming Ingestion
* Ingestion from Event Hubs.

Come and join us if you are in the 'hood. The event is [FREE][7], and you register [here][7]. See you on Wednesday!

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

[1]: https://cloudblogs.microsoft.com/sqlserver/2022/10/05/data-virtualization-with-polybase-for-sql-server-2022/
[2]: https://www.infoq.com/minibooks/modern-data-architectures/
[3]: https://www.jamesserra.com/archive/2022/09/data-lake-architecture/
[4]: https://www.confluent.io/blog/apache-kafka-3-3-0-new-features-and-updates/
[5]: https://www.confluent.io/blog/building-streaming-data-pipelines-visually/
[6]: https://www.meetup.com/Azure-Transformation-Labs/
[7]: https://www.meetup.com/Azure-Transformation-Labs/events/288858267/
