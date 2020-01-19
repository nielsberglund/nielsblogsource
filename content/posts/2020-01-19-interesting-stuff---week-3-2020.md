---
type: post
layout: "post"
title: Interesting Stuff - Week 3, 2020
author: nielsb
date: 2020-01-19T08:44:17+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - Kafka
  - ksqlDB
  - Microsoft Ignite The Tour
description: Kafka, ksqlDB, Debezium, Microsoft Ignite The Tour, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - Kafka
  - ksqlDB
  - Microsoft Ignite The Tour   
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

* [2020 Tech Predictions][1]. As it is the beginning of a new year, (and a decade at that), you see prediction posts being published. Here is a predictions post for 2020 from an old colleague from the Developmentor days, Ted Neward.

## Data Science

* [Are all samples created equal?: Boosting generative models via importance weighting][2]. This is a very interesting post discussing how to correct the imperfections of generative models. Please go and read the post to see what techniques they use.
* [Data Literacy in 10 Minutes][3]. In last weeks roundup, I mentioned that [Buck Woody][buckw] just started a blog post series about data literacy. Well, the link here is to the whole series posted as one single post on LinkedIn.

## .NET

* [The Reunification of .NET 5][5]. The post linked to here discusses how Microsoft tries to merge .NET Framework with .NET Core, in order to have one single .NET offering.

## Streaming

* [BUILDING A GRAPH DATABASE USING KAFKA][6]. Another excellent blog post about Kafka by [Robert Yokota][7]. In this post, he looks at how you can create a Kafka based graph database. Very exciting! Oh, and if you are interested in distributed systems, and/or, Kafka, his [blog][8] should be in your RSS feed.
* [Gunnar Morling on Change Data Capture and Debezium][9]. This is an [InfoQ][iq] podcast. The podcast discusses Debezium, the open-source distributed platform for change data capture (CDC).
* [Streams and Tables in Apache Kafka: A Primer][10]. The post linked to here is the first in a series about Kafka, streams and tables. The series should be mandatory reading for anyone working with Kafka! I am making sure that anyone at [Derivco](/derivco) working with Kafka reads this series!

## Microsoft Ignite The Tour | Johannesburg

Microsoft's [Ignite conference][26] took place in November last year, and now, (as they did last year), Microsoft takes Ignite on the road: [Microsoft Ignite The Tour][24].

The tour comes to [Johannesburg January 30 - 31][25], and I am lucky enough to present at the event. I am doing three presentations, and also some community "booth duty":

* [A Lap Around SQL Server Big Data Cluster][20]
* [Simplify and Scale Your Data Pipelines with Azure Delta Lake][21]
* [Improve Customer Lifetime Value using Azure Databricks & Delta Lake][22]

The conference is free of charge, so [register][23] now and come and say Hi!

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


[1]: http://blogs.tedneward.com/post/2020-tech-predictions/
[2]: https://www.microsoft.com/en-us/research/blog/are-all-samples-created-equal-boosting-generative-models-via-importance-weighting/
[3]: https://www.linkedin.com/pulse/data-literacy-10-minutes-buck-woody/
[4]: {{< relref "2020-01-12-interesting-stuff---week-2-2020.md" >}}
[5]: https://medium.com/young-coder/the-reunification-of-net-5-5902744df9fe
[6]: https://yokota.blog/2020/01/13/building-a-graph-database-using-kafka/
[7]: https://www.linkedin.com/in/robert-yokota-477108/
[8]: https://yokota.blog/
[9]: https://www.infoq.com/podcasts/change-data-capture-debezium/
[10]: https://www.confluent.io/blog/kafka-streams-tables-part-1-event-streaming/

[20]: https://johannesburg.myignitetour.techcommunity.microsoft.com/sessions/91139?source=sessions
[21]: https://johannesburg.myignitetour.techcommunity.microsoft.com/sessions/91141?source=sessions
[22]: https://johannesburg.myignitetour.techcommunity.microsoft.com/sessions/91140?source=sessions
[23]: https://register.msignite-the-tour.microsoft.com/johannesburg
[24]: https://www.microsoft.com/en-za/ignite-the-tour/
[25]: https://www.microsoft.com/en-za/ignite-the-tour/johannesburg
[26]: https://news.microsoft.com/ignite2019/