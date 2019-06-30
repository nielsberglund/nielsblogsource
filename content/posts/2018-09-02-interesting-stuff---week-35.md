---
type: post
layout: "post"
title: Interesting Stuff - Week 35
author: nielsb
date: 2018-09-02T08:38:38+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Hadoop
  - SQL Saturday
description: Kafka, SQL Server Machine Learning Services, SQL Saturday, Hadoop and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Hadoop
  - SQL Saturday   
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

The content this week is a bit meagre, due to me not having had time to browse around that much, as I have been "prepping" for the upcoming **SQL Saturdays**.

## SQL Server

* [Optimizing imperative functions in relational databases with Froid][1]. A post from Microsoft Research, where they discuss **Froid**. Froid is an extensible framework for optimising imperative programs in relational databases, and the purpose is to enable developers to use the abstraction of UDFs without compromising on performance. 

## Big Data

* [Hadoop for Beginners- Part 1][2]. The first post in a series about, as the title says, Hadoop. This series is really worthwhile reading if you are interested in what Hadoop is and what it can do for you.

## Streaming

* [Apache Kafka: Online Talk Series][3]. This is a registration page for an on-demand video series about Kafka. I bring the popcorn, and you bring the coke!

## SQL Saturday

In a couple of previous roundups I have mentioned that the SQL Saturday "season" is here, and yesterday, (September, 1), I flew out to Johannesburg and did a presentation about SQL Server Machine Learning Services, [Overview SQL Server Machine Learning Services][sqlsatjhb_1] to around 40 people.

The event was a smashing success thanks to the awesome arrangements by [Michael Johnson][michael] and his fellow volunteers!

Having done Johannesburg, next in turn is Cape Town:

![](/images/posts/sqlsat793_speaking_300x225.png)

* [Cape Town][sqlsatcpt], September 8:
    * [Azure Machine Learning][sqlsatcpt_ml].
    * [The Ins and Outs of sp_execute_external_script][sqlsatcpt_sp].

and finally Durban:

* [Durban][sqlsatdbn], September 15:
    * [The Ins and Outs of sp_execute_external_script][sqlsatdbn_sp].

Even if you are not interested in the topics I present, please register and come and listen to a lot of interesting talks by some of the industry's brightest people.

### PreCon

This year I also do precons in Cape Town and Durban on the Friday before the SQL Saturday event. My precons is a day where we talk about **SQL Server Machine Learning Services**, what it is and what we can do with it. It is in a format so if you want you can bring your laptop and code along as the day progresses.

The precon is not free, but hey ...

* [Cape Town, September 7 - A Drill Down Into SQL Server Machine Learning Services with Niels Berglund][sqlsatcpt_pre].
* [Durban, September 14 - A Day of SQL Server Machine Learning Services with Niels Berglund][sqlsatdbn_pre].

Even though the titles of the precons are different, I cover the same material.

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
[michael]: https://twitter.com/MikeJohnsonZA/

[1]: https://www.microsoft.com/en-us/research/blog/optimizing-imperative-functions-in-relational-databases-with-froid/
[2]: https://www.datasciencecentral.com/profiles/blogs/hadoop-for-beginners
[3]: https://www.confluent.io/apache-kafka-talk-series/

[sqlsatjhb]: http://www.sqlsaturday.com/785/EventHome.aspx
[sqlsatjhb_1]: http://www.sqlsaturday.com/785/Sessions/Details.aspx?sid=84967
[sqlsatcpt]: http://www.sqlsaturday.com/793/EventHome.aspx
[sqlsatcpt_ml]: http://www.sqlsaturday.com/793/Sessions/Details.aspx?sid=84975
[sqlsatcpt_sp]: http://www.sqlsaturday.com/793/Sessions/Details.aspx?sid=84978
[sqlsatcpt_pre]: https://www.quicket.co.za/events/47683-sqlsaturday-cape-town-2018-precon-a-drill-down-into-sql-server-machine-learning/#/
[sqlsatdbn]: http://www.sqlsaturday.com/803/EventHome.aspx
[sqlsatdbn_sp]: http://www.sqlsaturday.com/803/Sessions/Details.aspx?sid=85097
[sqlsatdbn_pre]: https://www.quicket.co.za/events/55545-sqlsaturday-durban-precon-2018-a-day-of-sql-server-machine-learning-services/#/

