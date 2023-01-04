---
type: post
layout: "post"
title: Interesting Stuff - Week 22, 2021
author: nielsb
date: 2021-05-30T06:33:15+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - machine learning
  - AI
  - Kafka
  - GPT-3
description: Kafka, Databricks Machine Learning, Microsoft & GPT-3, Data Platform Summit 2021, and other interesting topics.
keywords:
  - machine learning
  - AI
  - Kafka 
  - GPT-3  
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

# Machine Learning / AI

* [From conversation to code: Microsoft introduces its first product features powered by GPT-3][2]. Back in September 2020, Microsoft announced it had [exclusively licensed GPT-3][1] -  the autoregressive language model that uses deep learning to produce human-like text. The linked-to post discusses the first incarnation of GPT-3 in Microsoft's Power Apps. Very, very interesting!
* [Introducing Databricks Machine Learning: a Data-native, Collaborative, Full ML Lifecycle Solution][4]. The [**Data + AI Summit 2021**][3] took place the week just gone by. The post I linked to talks about one of the announcements made during the summit; the launch of **Databricks Machine Learning**, an enterprise ML solution that is data-native, collaborative, and supports the entire ML lifecycle. I am pretty "chuffed" to see how the solution includes, among other things, a feature store!

## Streaming

* [Engaging Database Partials with Apache Kafka for Distributed System Consistency ft. Pat Helland][5]. When using various data from different systems, for example, for reports, obtaining the correct data when you need it in real-time can be difficult. In this videoed podcast, Pat Helland - (Principal Architect, Salesforce) - explains how to make educated partial answers when you need to use the Apache Kafka® platform.

## WIND (What Is Niels Doing)

![](/images/posts/data-summit-2021.jpg)

**Figure 1:** *Big Data & Analytics*

As mentioned in previous roundups, I deliver an Analytics on SQL Server Big Data Cluster training class at the [**2021 Data Platform Summit**][7]! So right now, I am creating content for the course. I am so looking forward to it!

If you are interested, [sign up][5] for the class. When signing up, you also get free access to the Summit! Hope to see you there!

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

[1]: https://blogs.microsoft.com/blog/2020/09/22/microsoft-teams-up-with-openai-to-exclusively-license-gpt-3-language-model/
[2]: https://blogs.microsoft.com/ai/from-conversation-to-code-microsoft-introduces-its-first-product-features-powered-by-gpt-3/
[3]: https://databricks.com/dataaisummit/north-america-2021
[4]: https://databricks.com/blog/2021/05/27/introducing-databricks-machine-learning-a-data-native-collaborative-full-ml-lifecycle-solution.html
[5]: https://youtu.be/Ov5XgYzyGkU
[6]: http://bit.ly/dps_2021
[7]: https://dataplatformgeeks.com/dps2021/