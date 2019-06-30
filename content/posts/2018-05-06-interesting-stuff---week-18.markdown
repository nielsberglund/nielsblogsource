---
layout: post
title: Interesting Stuff - Week 18
author: nielsb
date: 2018-05-06T19:27:40+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - kafka
  - flink
description: Kafka Platform, Flink stream processing, SQL Server Machine Learning Services and other interesting things!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - kafka
  - flink   
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

* [Book review. How to write a lot: A practical guide to productive academic writing][1]. Yes I know, this has nothing to do with computing at all. However, it touches on what I try to do - write "stuff". In the blog post [Murat][murba] reviews a book which provides excellent suggestions to enable academics to write more. Sure, god knows I am not an academic, but I had a quick look at the book - and the suggestions work for anyone that is interested in writing. Thanks [Murat][murba]!

## Streaming

* [Introducing Confluent Platform Preview Releases][2]. A blog post announcing Confluent adding preview releases of their **Confluent Platform** beside the three times a year release cycle. The first preview release looks very interesting with a lot of KSQL "goodies"!
* [Next Steps in Stateful Streaming with Apache Flink][3]. An [InfoQ][iq] presentation about how Apache Flink is making stateful stream processing even more expressive and flexible to support applications in streaming that were previously not considered streamable.

## Data Science

* [On-Prem or On the Cloud][4]. A blog post how you can utilise what you do in [Azure Data Science VM][5] on-prem and **SQL Server Machine Learning Services**.

## Conferences / User Groups

* [Get Insight Into and Analyze Your Data with Azure EventHubs & Stream Analytics][6]. I have the privilege to present at the upcoming Durban Azure User Group get together on May 9 about Azure Event Hubs and Azure Stream Analytics. If you are in the "hood", please join. [Lawrance][lawr] who is the driving force behind the user group says that there is awesome SWAG to be had, thanks to Microsoft.

## SQL Server Machine Learning Services

Sigh! In last weeks roundup I wrote how I was about to publish a new post to correct some errors I had in the post; [sp_execute_external_script - III][sext3] in the [SQL Server R Services](/sql_server_2k16_r_services) series. Well, it seems the post may take somewhat longer to get finished as I have realised there are quite a few things I do not understand as well as I would like to do. So please, bear with me!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com

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

[sext3]: {{< relref "2018-03-21-microsoft-sql-server-r-services---sp-execute-external-script---iii.markdown" >}}
[series]: <> (/sql_server_2k16_r_services)

[wr17_18]: {{< relref "2018-04-29-interesting-stuff---week-17.markdown" >}}

[1]: http://muratbuffalo.blogspot.co.za/2018/04/book-review-how-to-write-lot-practical.html
[2]: https://www.confluent.io/blog/introducing-confluent-platform-preview-releases/
[3]: https://www.infoq.com/presentations/flink-stateful-streaming
[4]: https://blogs.msdn.microsoft.com/mlserver/2018/04/27/on-prem-or-on-the-cloud/
[5]: https://azure.microsoft.com/en-us/services/virtual-machines/data-science-virtual-machines/
[6]: https://www.meetup.com/Azure-Transformation-Labs/events/250299101/?_xtd=gatlbWFpbF9jbGlja9oAJGUwMDZmMzI5LTVhM2QtNDVhYS05OGRiLWM4ZmM2NDZiOGNjMw
