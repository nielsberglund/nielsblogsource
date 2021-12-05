---
type: post
layout: "post"
title: Interesting Stuff - Week 48, 2021
author: nielsb
date: 2021-11-28T08:38:06+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Databricks
  - Azure Synapse
  - Azure Container Apps
  - Kafka
  - Azure Data Explorer
description: Consume billions of messages from Kafka, Databricks vs. Synapse, Azure Data Explorer goodness, and other interesting topics.
keywords:
  - Databricks
  - Azure Synapse
  - Azure Container Apps
  - Kafka
  - Azure Data Explorer   
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

## Big Data

* [Databricks Photon vs Azure Synapse][1]. This post is in Spanish, but as I know that the readers of my blog (all two of you) are fluent in Spanish, so that shouldn't be a problem. Or - you could do what I did, translate it to English. The translation didn't come out half bad, and the post compares the performance of Databricks and Azure Synapse. Interesting read!

## Azure

* [Podtato-head, Pulumi and Azure Container Apps][2]. This post caught my eye as it mentions [**Pulumi**][3]. I am interested in Pulumi not so much for it being a cloud engineering platform, but for [**Joe Duffy**][joeduff] being one of the founders. Joe is a very smart guy, and I keep an eye out for things he is doing. Anyway, I link to this post because of the reference to **Azure Container Apps**. ACA looks extremely cool, and I must look at it further.

## Azure Data Explorer

* [Using Azure Data Explorer timeseries capabilities in Power BI][4]. The more I see of **Azure Data Explorer** (ADX), the more impressed I become. Take this post, for example, which looks at using PowerBI to hook into the time series capabilities of ADX. Soo cool!
* [Azure Data Explorer for Real time alerts in Healthcare][5]. One more post which makes me realise how awesome **Azure Data Explorer** is. This post looks at how you can "hook-up" [**Azure Logic Apps**][6] with ADX. 

## Streaming

* [Consuming over 1 billion Kafka messages per day at Ifood][6]. Well, the title says it all! In the post, the author looks at the journey he had towards being able to consume a "shed-load" ("shed-load" is a technical term) of messages per day. The post has quite a few "tips and tricks", so you should definitely read this post if you are a high volume Kafka consumer.

## WIND (What Is Niels Doing)

As with last weeks roundup, this is not so much of what I am doing as of what I did:

![](/images/posts/analyze-billions-adx.png)

**Figure 1:** *Future Data Driven*

And also, like last week, it is a recording for a presentation I did a while back. The presentation is [**Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer**][8], and the conference was **Future Data Driven**. 

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

[1]: https://blogvisionarios.com/e-learning/articulos-data/databricks-photon-vs-azure-synapse/
[2]: https://blog.ediri.io/podtato-head-pulumi-and-azure-container-apps
[3]: https://www.pulumi.com/
[4]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/using-azure-data-explorer-timeseries-capabilities-in-power-bi/ba-p/2727977
[5]: https://medium.com/@ravikanthmusti/azure-data-explorer-for-real-time-alerts-in-healthcare-480158bcf5d3
[6]: https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-overview
[7]: https://felipevolpone.medium.com/consuming-over-1-billion-kafka-messages-per-day-at-ifood-2465e1ffa795
[8]: https://youtu.be/AUXzlBZtebg
