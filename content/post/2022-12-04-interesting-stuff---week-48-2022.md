---
type: post
layout: "post"
title: Interesting Stuff - Week 48, 2022
author: nielsb
date: 2022-12-04T09:20:48+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/chat-3.jpg"
categories: ["roundup", "Kafka"]
tags: ["AI-ML", "ChatGPT", "Kafka", "Azure Data Explorer"]
description: Kafka & real-time or not real-time, Azure Data Explorer architecture, OpenAI ChatGPT awesomeness, and other interesting topics.  
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

## Azure Data Explorer

* [Understand Kusto Engine][1]. You, who have followed my blog for a while, know that I like **Azure Data Explorer** (ADX) a lot, and I write posts myself as well as linking to posts written by others. This post is something that I must have missed as it is from 2020, but still relevant. The post explains why ADX is so fast from data storage and query execution perspectives. What I like about this post is that it drills down and looks at the architecture of ADX on a fairly deep level.

## AI/ML

* [Research Focus: Week of November 28, 2022][2]. This post from Microsoft Research links to white papers accepted for publication at NeurIPS 2022. NeurIPS is a machine learning and computational neuroscience conference.
* [ChatGPT — OpenAI's New Dialogue Model!!][3]. Anyone remotely interested in AI has probably noticed that there is a "new kid" on the block - [**ChatGPT**][4]. **ChatGPT** was trained to have interactions in a conversational way, and this post looks at some examples of what ChatGPT can do. If you want to be blown away by the capabilities of ChatGPT, log on to Twitter and search for `#ChatGPT`.

## Streaming

* [Apache Kafka is NOT real real-time data streaming!][5]. WHAT?! Are you kidding me - what do you mean Kafka is not real-time data streaming? Joking aside, this post looks at different aspects of data streaming based on latency requirements. In conclusion, Kafka is not for you if you need microsecond latency. In those scenarios, you'd need proprietary software. For scenarios when millisecond+ latencies are OK, Kafka is definitely for you.

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

[1]: https://xhinker.medium.com/understand-kusto-inside-out-and-why-kusto-is-so-fast-54697e6648d7
[2]: https://www.microsoft.com/en-us/research/blog/research-focus-week-of-november-28-2022
[3]: https://pub.towardsai.net/openai-debuts-chatgpt-50dd611278a4
[4]: https://openai.com/blog/chatgpt/
[5]: https://www.kai-waehner.de/blog/2022/11/29/apache-kafka-is-not-real-real-time-data-streaming/
