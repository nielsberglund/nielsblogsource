---
type: post
layout: "post"
title: Interesting Stuff - Week 35, 2022
author: nielsb
date: 2022-09-04T11:44:07+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Azure Data Explorer
  - ADX Web Explorer
  - machine learning
  - deep learning
  - Kafka
description: Kafka & KRaft - no ZooKeeper, Microsoft Dev Box, ADX Web Explorer goodies, Deep Learning to find papers, and other interesting topics.
keywords:
  - Azure Data Explorer
  - ADX Web Explorer
  - machine learning
  - deep learning
  - Kafka   
---

![](/images/posts/deep-learning-3.jpg)

**<p style="text-align: center;"><em>Deep Learning</em></p>**
**<p style="text-align: center;"><em>Photo by <a href="https://unsplash.com/es/@pietrozj?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Pietro Jeng</a> on <a href="https://unsplash.com/s/photos/deep-learning?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a></em></p>**

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

## Misc.

* [Microsoft Dev Box Now in Public Preview][1]. This [InfoQ][iq] post looks at the recent announcement of the public preview of Microsoft Dev Box, a workstation in the cloud targeted to developers. Integrated with Windows 365, the new service supports any developer IDE, SDK, or tool that runs on Windows and simplifies the onboarding of new developers.

## Azure Data Explorer

* [ADX Web Explorer updates – August 2022][2]. We all know that **Azure Data Explorer** is awesome! One of the cool things with ADX is its Web UI: **ADX Web Explorer**. The post linked to looks at what new (and enhanced features) there are in the August 2022 release of Web Explorer. The Funnel visual is one of the things I am excited about.

## Machine Learning / AI

* [Challenges and practical lessons from building a deep-learning-based ads CTR prediction model][3]. In the ads business being able to predict click-through-rate is essential. This post describes how LinkedIn changed their previous CTR model for a deep-learning-based system, the challenges they experienced, and the lessons learned. Very interesting!
* [Using AI To Improve Your Literature Review][4]. When researching ML/AI topics, finding white papers/publications around the topics you are interested in is vital. However, the past twenty years have witnessed exponential growth in the number of published scientific papers, and it can be hard finding what you need with so many papers to "trawl" through. That's where what this post covers comes in. A research lab has released free software which allows you to write a query to search for papers you are interested in. The search functionality is backed by AI algorithms based on language models, such as GPT-3, and shows relevant papers to the query you wrote.

## Streaming

* [Getting Started with the KRaft Protocol][5]. The work to remove Apache Kafka's ZooKeeper dependency in favor of the KRaft (Apache Kafka Raft) protocol has been going on for a long time. It is not yet ready for use in production environments, but it is getting close. If you want to test it out, this post lists several key resources to help you learn everything you need about the ins and outs of KRaft. 

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

[1]: https://www.infoq.com/news/2022/08/microsoft-dev-box/
[2]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/adx-web-explorer-updates-august-2022/ba-p/3613640
[3]: https://engineering.linkedin.com/blog/2022/challenges-and-practical-lessons-from-building-a-deep-learning-b
[4]: https://pub.towardsai.net/using-ai-to-improve-your-literature-review-bb2d53348778
[5]: https://www.confluent.io/blog/what-is-kraft-and-how-do-you-use-it/
