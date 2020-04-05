---
type: post
layout: "post"
title: Interesting Stuff - Week 14, 2020
author: nielsb
date: 2020-04-05T08:25:49+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - .NET
  - Kafka
  - ksqlDB
  - events
  - event driven architecture
  - distributed computing
description: Kafka, replication with ksqlDB, events, data frames in .NET, and other interesting topics.
keywords:
  - .NET
  - Kafka
  - ksqlDB
  - events
  - event driven architecture
  - distributed computing   
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

## Data

* [A Guide To The Data Lake — Modern Batch Data Warehousing][1]. Lately I have come across blog posts about data, data lakes, data warehousing, etc. Maybe that's because we are now looking at this at [Derivco](/derivco), and how an ideal data architecture would look like for us. Anyway, the post here discusses how one can redefine batch data extraction and the data lake.

## .NET

* [An Introduction to DataFrame][2]. I don't know how I missed this before, but this post announces a data frame data type for .NET. The DataFrame type can come in very handy in a project I'm working on right now. We'll see!

## Events

* [Events are the Key to Master Data][3]. The blog post linked to here discusses events as a type of data, and why events are essential.

* [The Path to Event-Driven Mastery][4]. This post is a follow-up to the one above. In this post, the author gives a quick overview of different concepts related to events and how they are similar or different from each other. 

## Streaming

* [Real-Time Data Replication with ksqlDB][5]. This post looks at how functionality in Kafka's ksqlDB is used to replicate data from multiple sources to data warehouses.

## WIND (What Is Niels Doing)

Last week [I mentioned][6] how South Africa is now in lock-down due to the Coronavirus, and how the muse has left me, and I cannot get a SQL Server 2019 Big Data Cluster blog post out.

Well, we are still in lock-down, we are going into the second week now. Fortunately, I live in a house with a garden and pool, so I can at least get outside. To get some exercise, I yesterday walked around the pool: 50 laps, which is around two kilometres! Before the lock-down, the thought of walking around the pool for exercise would never, ever have entered my mind!

And for the muse, no I did not find her on my walk. I hope she'll be back soon!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me. Most importantly, stay safe out there!

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


[1]: https://towardsdatascience.com/a-guide-to-modern-batch-data-warehousing-extraction-f63bfa6ef878
[2]: https://devblogs.microsoft.com/dotnet/an-introduction-to-dataframe/
[3]: https://medium.com/phi-skills/events-are-the-key-to-master-data-11984332e435
[4]: https://medium.com/phi-skills/the-path-to-event-driven-mastery-8baff91826f1
[5]: https://www.confluent.io/blog/real-time-data-replication-with-ksqldb/
[6]: {{< relref "2020-03-29-interesting-stuff---week-13-2020.md" >}}
