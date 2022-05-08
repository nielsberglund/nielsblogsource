---
type: post
layout: "post"
title: Interesting Stuff - Week 18, 2022
author: nielsb
date: 2022-05-08T09:46:54+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - conferences
  - vector-clocks
  - Kafka
description: Shrinking Kafka clusters, Kafka Summit, keeping track of time using vector-clocks and other interesting topics!
keywords:
  - conferences
  - vector-clocks
  - Kafka  
---

![](/images/posts/conference.jpg)

**Conference Presentation** *Photo by <a href="https://unsplash.com/@xteemu?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Teemu Paananen</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>*

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

* [Speaking Tips: Mistakes happen; get over it][1]. So, we have started having "live" conferences again, WoHoo! It is awesome standing in from a crowd again, presenting and demoing! The downside of presenting live is that we can't "hide" any mistakes, demos failing etc. This post by my old Developmentor colleague [Ted Neward][2] discusses handling failed demos, unexpected "things" happening, etc., during your presentation. If you are a speaker and concerned about failed demos, read the post. Even if you are not a speaker or concerned, go and read it anyway!

## Distributed Computing

* [Vector Clocks: Keeping time in check][3]. Time is essential when dealing with events, and in a one-node system, time is easy. However, time becomes problematic when dealing with time in a distributed system. This post looks at the use of vector clocks to solve the issue of causality of events occurring on different servers. Very interesting!

## Streaming

* [How to Remove Apache Kafka Brokers the Easy Way][4]. Shrinking a Kafka cluster, i.e. removing brokers, has not been for the faint-hearted. Confluent added some functionality for removing brokers in Confluent Platform 6.0, but the process was still somewhat convoluted and error-prone. Confluent Platform 7 (and Confluent Cloud) have improved upon the process, and this blog post looks at how it works.
* [Kafka Summit London 2022: The Full Recap][5]. Kafka Summit 2022 was held a week - or so - ago, and it was held live! The post linked to summarises the conference and noteworthy sessions!

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

[1]: http://blogs.newardassociates.com/blog/2022/mistakes-happen-get-over-it.html
[2]: http://www.newardassociates.com/
[3]: https://distributed-computing-musings.com/2022/05/vector-clocks-keeping-time-in-check/
[4]: https://www.confluent.io/blog/remove-kafka-brokers-from-any-cluster-the-easy-way/
[5]: https://www.confluent.io/blog/kafka-summit-london-2022-recap/
