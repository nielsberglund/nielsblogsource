---
layout: post
title: Interesting Stuff - Week 49
author: nielsb
date: 2017-12-10T10:24:31+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server

description: Cool stuff about Fast Data, Netflix and Amazon, and how to get deep learning, AI etc., into production.
keywords:
  - data science
  - distributed computing
  - SQL Server    
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, for the week just gone by. 

> **NOTE:** This week there is very little content. This is because I've been overseas - last Sunday I went to Gibraltar, and I came back yesterday (Saturday) evening. Gibraltar is an awesome place by the way. The downside of living in South Africa (as I do) is the travel time - Durban to Gib was a 25 hours door to door trip!

<!--more-->

Anyway, having made my excuses here's what I've got.

## Streaming

* [Fast Data with Dean Wampler][1]. [Dean Wampler][2] discusses fast data, streaming, microservices, and the paradox of choice when it comes to the options available today building data pipelines. 

## Distributed Computing

* [The Eternal Cost Savings Of Netflix's Internal Spot Market][3]. A very interesting article about, how NetFlix built their own spot market from their own reserved AWS EC2 instances. 

## Data Science

* [AI School: Microsoft R and SQL Server ML Services][4]. [David][revod] from [Revolution Analytics][re] posts about how **Microsoft AI School** offers courses for Microsoft R and SQL Server ML Services.
* [Production Machine Learning][5]. A very, very interesting [InfoQ][iq] presentation talking about the challenges in writing deep learning code, testing and validating data management, environments, model storage & serving, validating data reporting, and CI&CD.

## SQL Server R Services

I had hoped to be able to publish **Internals - XVI** around now, but my overseas trip put a hold on those plans. At this stage I'm not completely sure when it will be published. If you are interested here is a link to [Internals - XV][si15].

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

[1]: https://www.infoq.com/podcasts/Dean-Wampler-fast-data
[2]: https://deanwampler.github.io/
[3]: http://highscalability.com/blog/2017/12/4/the-eternal-cost-savings-of-netflixs-internal-spot-market.html
[4]: http://blog.revolutionanalytics.com/2017/12/ml-server-ai-path.html
[5]: https://www.infoq.com/presentations/machine-learning-production
[si15]: {{< relref "2017-12-02-microsoft-sql-server-r-services---internals-xv.markdown" >}}
