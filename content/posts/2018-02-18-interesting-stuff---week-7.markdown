---
layout: post
title: Interesting Stuff - Week 7
author: nielsb
date: 2018-02-18T13:33:05+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - flink
description: Kafka, Flink, Microsoft R and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
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

Very little to report this week. Partly due to me been away at a conference in Cape Town: [**Microsoft Tech Summit**][1]. It was very interesting, and I  met up with some old friends while manning the *Expert* booth. Hmm, me an expert - that must be a contradiction in terms. Be as it may with that, here is what I have.

## Streaming

* [KSQL in Action: Real-Time Streaming ETL from Oracle Transactional Data][1]. If you follow blog posts about Kafka, you cannot help but notice how they quite often discuss using streaming in place of ETL. This particular post shows hot to use Kafka to stream data from Oracle. I find this post particularly interesting as - once upon a time - I wrote a framework to stream data from SQL Server to RabbitMQ.
* [An Overview of End-to-End Exactly-Once Processing in Apache Flink® (with Apache Kafka, too!)][3]. This post talks in detail how exactly-once delivery is implemented in Flink. Must read!

## Data Science

* [What does Microsoft do with R?][4]. A blog post from the boys at [Revolution Analytics][re] about what software and solutions Microsoft has developed around R. It covers both open source - which don't require any particular version of R - as well as proprietary solutions.

## SQL Server R Services

I am still working on the post about `sp_execute_external_script` in the **SQL Server R Services**. Watch this space.

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

[1]: https://www.microsoft.com/en-za/techsummit/cape-town
[2]: https://www.confluent.io/blog/ksql-in-action-real-time-streaming-etl-from-oracle-transactional-data
[3]: https://data-artisans.com/blog/end-to-end-exactly-once-processing-apache-flink-apache-kafka
[4]: http://blog.revolutionanalytics.com/2018/02/what-does-microsoft-do-with-r.html
