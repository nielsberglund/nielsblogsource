---
type: post
layout: "post"
title: Interesting Stuff - Week 9, 2022
author: nielsb
date: 2022-03-05T07:57:02+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Azure Data Explorer
  - KQL
  - Delta Lake
  - Kafka
  - ksqlDB
  - SQLBits
description: Kafka at Linkedin, Free clusters for KQL and Azure Data Explorer, Delta Lake & Synapse, SQLBits 2022, and other interesting topics.
keywords:
  - Azure Data Explorer
  - KQL
  - Delta Lake
  - Kafka
  - ksqlDB
  - SQLBits   
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

* [Azure Synapse and Delta Lake][2]. If you are using Azure for Big Data, the chances are high that you also use Azure Databrick's **Delta Lake** format. You may also use **Azure Synapse** for analysis, etc. This post looks at the support and interaction between Azure Synapse and Delta Lake.

## Azure Data Explorer

* [Create and Maintain Your Own KQL Demo Environment with the New Start-for-free Cluster][1]. **Azure Data Explorer** is the "best thing since sliced bread", together with **Kusto Query Language** (KQL). One slight problem with learning ADX and KQL is that you's need to spin up an ADX cluster if you want to ingest data etc. Sure, there are help clusters around with data, but those are read-only. So, to make it easier to "play around" with ADX and KQL, Microsoft has just released a Start-for-free Cluster program. You can read all about it in the post linked.

## Streaming

* [Near real-time features for near real-time personalization][3]. This is an exciting post by the LinkedIn engineering team. In the post, they look at LinkedIn's personalization recommendation journey, from pretty much batch-oriented to doing this in near real-time. Obviously Kafka plays a big part!

## WIND (What Is Niels Doing)

This:

![](/images/posts/London_calling_cover.jpg)
**Figure 1:** *London Calling*

Yay, finally! Later today I am flying out to London for **SQLBits 2022**, where I deliver the following:

* [**A Day of Azure Data Explorer**][6]. Full day training class.
* [**ksqlDB - The Real-Time Streaming Database**][7]. Conference session.
* [**Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer**][8]. Conference session.

There are still seats available for my training class and the conference itself. You register [here][9]!

A HUGE shout-out to my employer [**Derivco**](/derivco), who helps with some of my costs for the trip. They also sponsor some [**SWAG**][4] - another reason to come to my sessions.

**THANK YOU, Derivco**

So, if you are at [**SQLBits**][5], please come by and say Hi!

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

[1]: https://azurecloudai.blog/2022/02/28/create-and-maintain-your-own-kql-demo-environment-with-the-new-start-for-free-cluster/
[2]: https://www.jamesserra.com/archive/2022/03/azure-synapse-and-delta-lake/
[3]: https://engineering.linkedin.com/blog/2022/near-real-time-features-for-near-real-time-personalization
[4]: https://www.vocabulary.com/dictionary/swag
[5]: https://sqlbits.com/
[6]: https://arcade.sqlbits.com/session-details/?id=300019
[7]: https://arcade.sqlbits.com/session-details/?id=301807
[8]: https://arcade.sqlbits.com/session-details/?id=301808
[9]: https://register.sqlbits.com/event/36db4730-583c-49c1-adcf-f76432bb6580/summary
