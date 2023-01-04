---
type: post
layout: "post"
title: Interesting Stuff - Week 50, 2022
author: nielsb
date: 2022-12-18T13:15:45+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/holidays.png"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Kafka
  - ChatGPT
  - AI/ML
description: Kafka & streaming .NET apps, Azure Data Explorer & AI/ML, ChatGPT awesomeness, and other interesting topics.
keywords:
  - Azure Data Explorer
  - Kafka
  - ChatGPT
  - AI/ML   
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

> **NOTE:** *It is now coming up on Christmas and New Year, and I will take a break with these posts and come back at the beginning of next year.*

<!--more-->

## Azure Data Explorer

* [Azure Data Explorer in a Day][1]. This is a GitHub repository for an **Azure Data Explorer** workshop. It is brought to you by the Synapse Customer Success Engineering team. It is a hands-on workshop divided into two labs of four hours each. If you go through the workshop and finish the challenges, you will earn a digital badge! Now I know what I will do during the holiday period!
* [How to Use Trained Azure Machine Learning Models in Azure Data Explorer][2]. This YouTube video shows how you can use machine learning models inside **Azure Data Explorer** to get predictions over your data in tables in ADX. Very, very cool! Another thing to do during the holidays!

## AI/ML

* [Teaching ChatGPT about the birds and the bees][3]. In this post, the author uses ChatGPT to train a classification model. The model should differentiate between birds and bees in images. The results are impressive - go and have a read for yourself!
* [ChatGPT: How Does It Work Internally?][4]. When reading about ChatGPT and the various things it can do (see above), it is easy to think that it is magic. That's why the blog post linked to comes in handy. It explains how ChatGPT works internally and points out that ChatGPT is not divine and, at the end of the day *it remains a sentence generator without understanding and without self-criticism as a human would*.

## Streaming

* [Building Event Streaming Applications in .NET][5]. This post looks at how to use .NET Kafka clients along with the Task Parallel Library to build a robust, high-throughput event streaming application.

## WIND (What Is Niels Doing)

Ever since I came back from PASS in Seattle a while back I have been thinking about "wiping" my MacBook Pro, and do a complete re-install. This weekend was a long weekend in South Africa (Friday - Sunday), so on Friday I decided to give it a go.

Instead of doing a complete manual installation I wanted to do it using script files. I mean - "how hard can it be?". Well, it turned out to be a lot harder that what I expected, but I am getting there. I do believe I will be done later today (Sunday).

Expect a future blog post around my trials and tribulations! :smile:

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. Please comment on this post or [ping][ma] me if you have ideas for what to cover.

Oh, and if I don't see you virtually or IRL before the holidays: **Happy Holidays**!

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

[1]: https://github.com/Azure/ADX-in-a-Day
[2]: https://youtu.be/wtCQ7vI9_60
[3]: https://www.jerpint.io/blog/chatgpt/
[4]: https://pub.towardsai.net/chatgpt-how-does-it-work-internally-e0b3e23601a1
[5]: https://www.confluent.io/blog/build-streaming-applications-with-apache-kafka-dotnet/