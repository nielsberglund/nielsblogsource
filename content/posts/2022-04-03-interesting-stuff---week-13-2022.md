---
type: post
layout: "post"
title: Interesting Stuff - Week 13, 2022
author: nielsb
date: 2022-04-03T09:05:36+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - big data
  - Azure Data Explorer
  - ksqlDB
  - MacBook Pro M1
  - BICEPS
description: Kafka & ksqlDB recipes, easy deployment of Azure Data Explorer, Niels & Macs, and other interesting topics!
keywords:
  - big data
  - Azure Data Explorer
  - ksqlDB
  - MacBook Pro M1
  - BICEPS
---

![](/images/posts/mbp-box.png)

**Figure 1:** *The Devil Wears ~~Prada~~ Skates*

What you see in *Figure 1* is being explained further down!

Throughout the week, I read a lot of blog-posts, articles, and so forth that have to do with things that interest me:

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

## Data

* [Tools For Data Engineers][1]. Data Engineers are among the most valued people in modern data-driven organisations that aim to build or enhance products by utilising their most valuable asset: data! To make this happen, Data Engineers must ensure they are using the right tools. This blog post looks at some of the tools a Data Engineer should be familiar with.
* [Data Platforms Vs Data Warehouses Vs Data Virtualization And Federated SQL Engine – How To Store Your Data][2]. There is a lot of discussion on how an organization should implement its data stacks today. This article discusses some of the popular routes data solution providers are talking about in terms of types of data layers.

## Azure Data Explorer

* [End to end Azure Data Explorer pipeline deployment with ARM][3]. You, who follow my blog, know that I am doing quite a lot of Azure Data Explorer "stuff" now. Setting up and tearing down ADX clusters is getting tedious, so the post linked to brings some good news: The ability to use ARM templates and BICEP scripts for deployment! Expect a blog post shortly about this!

## Streaming

* [Introducing Stream Processing Use Case Recipes Powered by ksqlDB][4]. ksqlDB is the "bee's knees" for real-time stream processing. However, it can be tricky to get started, and there are an infinite number of use cases. That's what is being announced in this blog post aims to fix. The post introduces ksqlDB "recipes" consisting of pre-built code samples and a step-by-step tutorial to tackle the most popular, high-impact use cases for stream processing. Awesome!!

## WIND (What Is Niels Doing)

So, a couple of weeks ago, I was at the SQLBits 2022 conference, where I gave some talks. This was the first "live" conference since the end of January 2020 (when I did MS Ignite, The World Tour). Since then, doing conference talks from home has been the norm, and I have been using my fully "tricked out" development PC for the talks.

When going to "live" conferences, I used my private laptop. A couple of days before leaving for London, I decided to ensure that I had all the necessary "stuff" on the laptop. Imagine my shock when I realized that the laptop no longer worked; I could not get it to boot! What to do? Fortunately, I have a work laptop, so I quickly copied the necessary slide decks, code, etc., and set off to London. Unfortunately, as it is a work laptop, there is some security "stuff" on the laptop, which meant that some of the things I was going to do didn't work as expected. 

Coming home from London, I realized that I had to get a new laptop since - hopefully - we will now do in-person conferences again. The question was then, what laptop to get. Remember, I am a Windows "dude". You probably now know what I got, especially seeing the picture in *Figure 1*. Yes, I got myself a MacBook Pro M1 (14 inches, 16Gb RAM):

![](/images/posts/mbp-unboxed-full.png)

**Figure 2:** *Ready for Setup*

One week later, I have got a bit further than the setup in *Figure 2*. In fact, I am writing this post using my MBP. Expect a post or two about my experiences with the MBP in the coming weeks.

Oh, if you wonder about the *The Devil Wears Skates* title in *Figure 1*. As a hardcore Windows guy, I have been overheard saying that I will switch to Mac when "hell freezes over". I guess hell must have frozen over now, and the Devil moves along on skates.


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

[1]: https://towardsdatascience.com/data-engineer-tools-c7e68eed28ad
[2]: https://www.theseattledataguy.com/data-platforms-vs-data-warehouses-vs-data-virtualization-and-federated-sql-engine-how-to-store-your-data/?utm_source=pocket_mylist#page-content
[3]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/end-to-end-azure-data-explorer-pipeline-deployment-with-arm/ba-p/3248717
[4]: https://www.confluent.io/blog/introducing-stream-processing-use-case-recipes-for-every-industry/
