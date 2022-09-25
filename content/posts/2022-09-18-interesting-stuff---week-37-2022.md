---
type: post
layout: "post"
title: Interesting Stuff - Week 37, 2022
author: nielsb
date: 2022-09-18T13:24:26+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - python
  - vscode
  - Azure Data Explorer
  - ai/ml
  - data-architecture
  - Kafka
  - ksqlDB
description: Kafka, ksqlDB and iGaming, date-time in ADX, Kusto detective agency, Spark & MLLib, and other interesting topics.
keywords:
  - python
  - vscode
  - Azure Data Explorer
  - ai/ml
  - data-architecture
  - Kafka
  - ksqlDB   
---

![](/images/posts/stream.jpg)

**<p style="text-align: center;"><em>Stream</em></p>**
**<p style="text-align: center;"><em>Photo by: <a href="https://www.istockphoto.com/portfolio/kata716">kata716</a></em></p>**

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

* [10 VSCode Productivity Hacks for Data Scientists][1]. Yes, I know; the title of this post says Data Scientists. With that in mind, I should have put it under the **AI/ML** section. However, the "hacks" in the post are not only useful for Data Scientists but for anyone using Python and VSCode. The post is not so much about hacks as it is about useful VSCode extensions, and I picked up a couple that I want to test.

## Azure Data Explorer

* [Fun With KQL – Format_DateTime][2]. I hate dealing with date-time! That's why I really like the Kusto Query Language (KQL) feature that this post discusses: the `format_datime` function. Read the post to see how it can be used. Very cool! 
* [Kusto Detective Agency][3]. The Kusto Detective Agency is a way to promote *Azure Data Explorer* and the **KQL** (the Kusto Query Language). You join the "agency" by creating a free Azure Data Explorer cluster and providing an answer to a question. Looks really cool. I joined earlier in the week, and I'll keep you informed on how it goes.

## AI/ML

* [Serving ML Models with Apache Spark][4]. This post covers more than what the title says. Yes, the post definitely looks at how to serve up **MLLib** models, but it also gives a comprehensive introduction to Spark. Very useful!

## Data Architecture

* [Stretching my Legs in the Data Engineering Ecosystem in 2022][5]. This is the first post in a series by Mr Kafka ([Robin Moffat][rmoff]), where he looks at what is going on in the data engineering world nowadays. This is a must-read for anyone interested in data engineering!
* [Data Engineering: Resources][6]. This is from the link above. This post lists useful links to resources around data engineering.

## Streaming

* [Real-time analytics on network flow data with Apache Pinot][7]. Having observability of your infrastructure is of vital importance to be able to detect, diagnose, and remediate issues. This post looks at what LinkedIn has done to provide observability into network flows. Very interesting!
* [Real-Time Gaming Infrastructure for Millions of Users with Apache Kafka, ksqlDB, and WebSockets][8]. This post which shows a real-time gamification demo to integrate gamers via WebSockets to the data streaming backend infrastructure is interesting to me from a couple of points. It is interesting as we ([Derivco](/derivco)) are in the iGaming industry. It is also interesting as we are doing something very similar right now!

## WIND (What Is Niels Doing)

Just reminding you of this (especially you, [Lee-Anne][leeanne] lol)

{{< youtube KZbMtYmM-2o >}}

Don't forget to register for [**Data Platform Summit 2022**][9]. Having registered, you can attend my session: **ksqlDB - The Real Time Streaming Database**, and obviously many other cool sessions as well.

Oh, and attending the conference is **FREE**, so what are you waiting for: [**register**][9]!

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
[leeanne]: https://www.linkedin.com/in/lee-anne-james-96514023/

[1]: https://towardsdatascience.com/10-vscode-productivity-hacks-for-data-scientists-1836f87e0525
[2]: https://arcanecode.com/2022/09/12/fun-with-kql-format_datetime/
[3]: https://detective.kusto.io/
[4]: https://towardsdatascience.com/serving-ml-models-with-apache-spark-3adc278f7a78
[5]: https://rmoff.net/2022/09/14/stretching-my-legs-in-the-data-engineering-ecosystem-in-2022/
[6]: https://rmoff.net/2022/09/14/data-engineering-resources/
[7]: https://engineering.linkedin.com/blog/2022/real-time-analytics-on-network-flow-data-with-apache-pinot
[8]: https://www.confluent.io/blog/real-time-gaming-infrastructure-kafka-ksqldb-websockets/
[9]: https://dataplatformgeeks.com/dps2022/booking/
