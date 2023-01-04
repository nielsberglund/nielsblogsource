---
layout: post
title: Interesting Stuff - Week 47
author: nielsb
date: 2017-11-26T19:08:43+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - flink
description: Apache Kafka and transactions, Apache Flink new functionality, and other cool stuff!.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - flink   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, for the week just gone by. 

<!--more-->

This week was a "meager catch", maybe because of the holiday in US, but very little caught my eye. Anyway, here is what I have.

## Streaming

* [Transactions in Apache Kafka][1]. A while ago Apache Kafka introduced a transaction API. This post gives a high level overview of said API. Being a database "nerd", this is awesome!!
* [Looking Ahead to Apache Flink 1.4.0 and 1.5.0][2]. Heh, I swear - it seems that Kafka and Flink are in lock-step, releasing posts about new functionality, or - like in this case - ideas about new functionality. Anyway, this post is about thoughts about new functionality in upcoming Flink versions.

## Data Science

* [How to make Python easier for the R user: revoscalepy][3]. [David][revod] at [Revolution Analytics][re] had a post about making Python easier if you aRe an R guy (or girl). However, I can't seem to fin that post now, so the link is for the MSDN introduction to **revoscalepy**.

## SQL Server

* [TSQL Tuesday 96 Round-up][5]. A couple of weeks ago [Ewald][ewtw] hosted [T-SQL Tuesday][4], and as it was right after PASS, he chose a  non-technical subject, where he asked the community to post about persons who have made a contribution to their world of data. In this post Ewald does a summary of who wrote posts about who.

## TSQL Tuesday 96

OK, I didn't contribute to TSQL Tuesday 96 (so shoot me). However having included Ewald's post above in this week's round-up, I started thinking about people that have inspired/influenced me in the world of data. In reality, there are so many, but I stuck to the "rule of three" (I have no idea what it means, but it sounds good). So, without further ado:

* [Don Box][db]. Sure, I know. Don is not a database person - trust me I know! However if it hadn't been for Don, there would not have been no DevelopMentor, if no DevelopMentor, no spelunking, no teaching SQL Server, without teaching SQL Server I would not have ... So Don has been a great influencer!
* [Ken Henderson][6]. Ken passed away - way, way, way too early - in 2008, and the SQL Server community suffered a huge loss! His [The Guru's Guide to SQL Server Architecture and Internals][7] had been a constant companion and source for ideas for me, and without that "tome" I wouldn't be where I am today.
* [Pat Helland][8]. What can I say, from transaction monitors together with Jim Gray at Tandem and later at Microsoft, to SQL Server Service Broker also at Microsoft, to distributed computing in general - Pat is a legend. His thoughts and ideas are provoking and inspiring, and I am learning constantly! 

## SQL Server R Services

* [Microsoft SQL Server R Services - Internals XIV][si14]. After many a false starts I finally managed to get the post about **Binary eXchange Language** (**BXL**) out! And for you who have followed my posts in the [Internals][si1] series, where I have talked about extremely big BXL packets - I know what causes it, but I do not know why.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[ewtw]: https://twitter.com/sqlOnIce
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[jovpop]: https://twitter.com/JovanPop_MSFT
[bobw]: https://twitter.com/bobwardms
[revod]: https://twitter.com/revodavid

[1]: https://www.confluent.io/blog/transactions-apache-kafka/
[2]: https://data-artisans.com/blog/looking-ahead-apache-flink-1-4-1-5
[3]: https://docs.microsoft.com/en-us/sql/advanced-analytics/python/what-is-revoscalepy
[4]: http://tsqltuesday.com/about/
[5]: https://sqlonice.com/tsql-tuesday-96-round-up/
[6]: https://www.red-gate.com/simple-talk/opinion/geek-of-the-week/geek-of-the-week-ken-henderson/
[7]: https://www.amazon.com/Gurus-Guide-Server-Architecture-Internals/dp/0201700476/ref=sr_1_1?s=books&ie=UTF8&qid=1511715066&sr=1-1&keywords=The+Guru%27s+Guide+to+SQL+Server+Architecture+and+Internals
[8]: https://www.linkedin.com/in/pathelland/

[si14]: {{< relref "2017-11-25-microsoft-sql-server-r-services---internals-xiv.markdown" >}}
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}

[db]: https://en.wikipedia.org/wiki/Don_Box
