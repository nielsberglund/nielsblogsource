---
type: post
layout: "post"
title: Interesting Stuff - Week 10, 2022
author: nielsb
date: 2022-03-12T08:10:36+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Faust
  - Python
  - Kafka
  - SQLBits 2022
description: Kafka streaming with Faust in Python, Azure Data Explorer goodness, SQLBits 2022, and other interesting topics.
keywords:
  - Azure Data Explorer
  - Faust
  - Python
  - Kafka
  - SQLBits 2022
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

## Azure Data Explorer

* [Azure MeetUp Frankfurt - Azure Data Explorer][1]. This link is to a video where [Henning Rauch][2] (PM in the Azure Data Explorer team) introduces **Azure Data Explorer** at *Azure Meetup Frankfurt*. 
* [Just enough Azure Data Explorer for data enthusiasts][3]. This LinkedIn post is an excellent overview of Azure Data Explorer. There is, however, one big flaw in the post - it should have been published a week earlier. Then I would have been able to use some of it in my Azure Data Explorer talks at SQLBits 2022. Just kidding - excellent post.

## Streaming

* [Introduction to Kafka Stream Processing in Python][5]. This post looks at building streaming Kafka applications in Python using [Faust][6]. Faust is a stream processing library for Python, similar to KStreams. Looks very interesting!
* [How to Make Apache Kafka Clients Go Fast(er) on Confluent Cloud][7]. You want to get the best performance possible from your applications running on Confluent Cloud. There is quite a lot of information about this "out there", but what should you read? This blog post highlights the top five reading recommendations for this. They cover the key concepts and provide concrete examples of how we do it and how you can do it too, with specific benchmark testing and configuration guidelines.

## WIND (What Is Niels Doing)

For those of you who read my posts, you are probably aware that I have, the last month, been in "prep" mode for the **SQLBits** conference in London:

![](/images/posts/sqlbits2022-1.jpg)

**Figure 1:** *SQLBits 2022*

I managed to be ready in time, and the picture above is a picture I took right before starting my full day training class on **Azure Data Explorer**. The notebook with *IT'S POSSIBLE* on it, is part of the Swag I received from [**Derivco**](/derivco) to hand out to the delegates. Thank You, **Derivco**!

Today I am flying back to SA from London, and I think my "prep" paid off as the attendees seemed to like what I presented.

I want to give a HUGE "shout-out" to the organizers of **SQLBits**. They did a fantastic job!!! Thank You!

Now it is back to the "grindstone", trying to develop new materials for the next conferences - whatever/wherever they are!

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

[1]: https://youtu.be/eqh6a4kR4oc
[2]: https://twitter.com/cosh23
[4]: https://www.linkedin.com/pulse/just-enough-azure-data-explorer-enthusiasts-anshul-sharma/
[5]: https://opendatascience.com/introduction-to-kafka-stream-processing-in-python/
[6]: https://github.com/robinhood/faust
[7]: https://www.confluent.io/blog/how-to-make-apache-kafka-even-faster/
