---
type: post
layout: "post"
title: Interesting Stuff - Week 34, 2021
author: nielsb
date: 2021-08-22T08:35:37+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - ksqlDB
  - CI/CD
description: ksqlDB new version, lazy developers & testing, Azure Bootcamp 2021 South Africa, and other interesting topics.
keywords:
  - ksqlDB
  - CI/CD   
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

## Misc.

* [Having testers made my team worse][1]. This post, from a colleague and mate of mine, has caused a bit of stir here at [Derivco](/derivco). In the post, Simon talks about how his team lost all of their functional testers and how due to this, the developers had to sort out their CI/CD pipelines and write meaningful tests. This lead them to be in a much better position at the end of the day than before. I mentioned how the post had caused a stir; the stir was from the testers in the company. After reading the post, I thought it would be the developers wanting to "lynch" Simon. Primarily due to this: *but because having testers meant that as developers, we could get away with being lazy and not truly putting in the effort to write meaningful tests that run both in our CI and CD pipelines*. Anyway, it is an excellent post - I suggest you read it and think about how you can approve your pipelines and testing while reading it.

## Streaming

* [Announcing ksqlDB 0.20.0][2]. As the title says; ksqlDB version 0.20 is out "in the wild". One big new feature of this version is support for `DATE` and `TIME` datatypes! Very cool!!

## WIND (What Is Niels Doing)

In last week's roundup, I mentioned how one of the webinars I presented a week or two back had still not come up on YouTube. Well, one or two days after I published the post, there it was:

* [**Let SQL Server Be the Central Hub For All Types of Data**][3]. In this webinar, I look at **SQL Server 2019 Big Data Cluster** and how Microsoft positions it to be a central hub for all types of data - not only relational data.

Oh, don't forget the register for [**Azure Bootcamp 2021 South Africa**][4]. It will be a fantastic event, and I have just submitted some talks to it. Hopefully, one or two will be accepted.

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

[1]: https://headleysj.medium.com/having-testers-made-my-team-worse-99d4cb9866aa
[2]: https://www.confluent.io/blog/ksqldb-2-0-introduces-date-and-time-data-types/
[3]: https://youtu.be/DdyZgFErLFI
[4]: https://azurebootcamp.co.za/
[5]: {{< relref "2021-08-22-interesting-stuff---week-34-2021.md" >}}
