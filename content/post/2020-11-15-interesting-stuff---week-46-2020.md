---
type: post
layout: "post"
title: Interesting Stuff - Week 46, 2020
author: nielsb
date: 2020-11-15T09:31:21+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - Apache Pinot
  - VS Code
  - Python
description: Kafka and Apache Pinot, R and Python in VSCode, Data Platform Summit 2020, and other interesting topics!
keywords:
  - Kafka
  - Apache Pinot
  - VS Code
  - Python   
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

* [How to integrate Python and R in Visual Studio Code][1]. I really like VSCode, but I always have issues with how to configure for Python and R when installing from scratch. So this blog-post comes in real handy, as it explains what one needs to do to get Python and R up and running in VSCode. Awesome!

## Data Science

* [Synthetic Data Vault (SDV): A Python Library for Dataset Modeling][2]. When doing machine learning/data science, you need realistic data to work with, and that can sometimes be a problem. This post introduces the Synthetic Data Vault, which is a tool to generate complex datasets using statistical & machine-learning models. It looks very interesting!
* [Turning Metadata Into Insights with Databook][3]. This post looks at Uber's system for handling metadata - Databook.

## Streaming

* [Using Apache Pinot and Kafka to Analyze GitHub Events][4]. Apache Pinot is a real-time distributed OLAP datastore, which is used to deliver scalable real-time analytics with low latency. The post I linked to here discusses how to ingest Kafka events into Pinot. What we see in the blog post is very interesting for [us](/derivco), and we will definitely look at it in more detail.

## WIND (What Is Niels Doing)

In [last weeks roundup][8] I wrote about my recording of video for the Data Platform Summit 2020.

![](/images/posts/dps_2020.png)

If I haven't said it before:

I am super excited to be speaking at the [**Data Platform Virtual Summit 2020**][5]. A 100% technical learning event with 200 Breakout Sessions, 30 Training Classes, 72 hours of non-stop conference sessions – DPS 2020 is the largest online learning event on Microsoft Azure Data, Analytics & Artificial Intelligence. Delegates get the recordings at no extra cost, which is quite a wonderful thing. Also, the conference virtual platform looks amazing, [take a look][6].

If you want to attend and hear industry experts talk about really exciting stuff you can [book here][7]. Oh, and the coolest thing is that as I am a speaker I get a discount code to hand out to you guys! Use the discount code **DPSSPEAKER** to book your seat at **55%** off.

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
[travw]: https://twitter.com/radtravis
[emilk]: https://twitter.com/IsTheArchitect


[1]: https://towardsdatascience.com/how-to-integrate-python-and-r-in-visual-studio-code-496a47c90422
[2]: https://towardsdatascience.com/synthetic-data-vault-sdv-a-python-library-for-dataset-modeling-b48c406e7398
[3]: https://eng.uber.com/metadata-insights-databook/
[4]: https://medium.com/apache-pinot-developer-blog/using-apache-pinot-and-kafka-to-analyze-github-events-93cdcb57d5f7
[5]: https://dataplatformgeeks.com/dps2020/
[6]: https://www.linkedin.com/posts/amitbansal2010_dps2020-sqlserver-powerbi-activity-6728885748755374080-a8QL/
[7]: https://dataplatformgeeks.com/dps2020/booking/
[8]: {{< relref "2020-11-08-interesting-stuff---week-45-2020.md" >}}

