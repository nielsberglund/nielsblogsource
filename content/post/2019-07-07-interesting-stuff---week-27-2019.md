---
type: post
layout: "post"
title: Interesting Stuff - Week 27, 2019
author: nielsb
date: 2019-07-07T07:32:53+02:00 
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - Kafka
  - WSL
  - MVP
description: Kafka, Windows Subsystem for Linux, SQL for streaming data, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - Kafka
  - WSL
  - MVP   
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

## Misc.

* [Windows Subsystem for Linux 2 Has Linux Kernel Shipping in Windows][1]. This is an [InfoQ][iq] article about how  Windows Subsystem for Linux (WSL) 2 is now available through the Windows Insiders program. WSL 2 presents a new architecture that aims to increase file system performance and provide full system call compatibility.

## Streaming

* [KSQL in Football: FIFA Women’s World Cup Data Analysis][2]. In this blog post, the author looks at how we can use Kafka, KSQL and Kafka Connectors together to join disparate streaming data sources. He also looks at how to push the data through Google's Natural Language API to determine sentiment. Very interesting! I had no idea there were pre-built Kafka connectors for Twitter and RSS, cool!
* [One SQL to rule them all: an efficient and syntactically idiomatic approach to management of streams and tables][3]. In this post by [Adrian][adcol], he dissects a white paper about building SQL interfaces for streaming data. The paper comes up with a set of proposed extensions to the SQL standard itself. Interesting!   
* [Kafka Listeners – Explained][4]. This post by [Robin][rmoff] discusses Kafka listeners, what they are good for, and what you need to do to get your Kafka clusters to work correctly with internal as well as external components.

## WIND (What Is Niels Doing)

Yeah, what am I doing:

* As you may know, I am a Microsoft Data Platform MVP, and the annual renewal for the MVP program happens July 1. Every MVP is on "tenterhooks" this date; "will I get renewed or not". Well, I am happy to say that I was renewed for another year. I want to thank all of you that read my blog posts, comes to my presentations at conferences, etc.: this is all down to you - **THANK YOU**!
* A week or two ago I started on the first post in a series looking at how to get data out of SQL Server into a streaming world. I had hoped to have that post published by now, but I am still working on it. Hopefully, I can get it out in a week or so.

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

[1]: https://www.infoq.com/news/2019/06/wsl-2-linux
[2]: https://www.confluent.io/blog/ksql-in-football-fifa-womens-world-cup-data-analysis
[3]: https://blog.acolyer.org/2019/07/03/one-sql-to-rule-them-all/
[4]: https://www.confluent.io/blog/kafka-listeners-explained
