---
layout: post
title: Interesting Stuff - Week 34
author: nielsb
date: 2017-08-27T21:30:24+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
description: This week we talk about Recurrent Neural Networks, SQL Server DMV's, R and Power BI.
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

<!--more-->

## SQL Server

* [The DMV Diaries: sys.dm_os_workers][1]. "Dear diary, today this worker approached me, what should I do?". [Ewald][ew] continues his DMV journey. **MUST READ!!**

## Distributed Computing

* [Styles of Event Architecture][2]. Discussion about event architectures when building distributed systems.
* [Building Reactive Microservices using Muon and scaling them using Kafka, Cassandra and friends][3]. More about event architectures.
* [JavaScript for extending low-latency in-memory key-value stores][4]. [Adrian][mp] looks at a white-paper about how to use java script for a low latency compute engine. Hmm, java script and low latency???

## Data Science

* [Highlights of the Data Science Track at Microsoft Ignite][5]. The [Revolution Analytics][re] guys, points out quite interesting topics at [Microsoft Ignite][mi] in September.
* [Introduction to Recurrent Neural Network][6]. A very, very interesting post about the use of *Recurrent Neural Network*'s for analysis of sequences. I wonder if this could be used for real-time data?!
* [Tips and tricks on using R to query data in Power BI][7]. Some ideas about hoe to use R for querying data in Power BI.

## SQL Server R Services

I am almost done with *Internals - X* in the **SQL Server 2016 R Services** series. I had hoped to be able to publish it earlier today, but I found some *weird* "stuff" regarding data sent to the SqlSatellite from SQL Server, and I want to see if I can find out what's going on with that. So, expect *Internals - X* to be published some time next week. If you are interested in the previous "episodes" they can be found [here][si1].

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: http://sqlonice.com/dmv-diaries-sys-dm_os_workers/
[2]: http://daviddawson.me/blog/2017/07/10/styles-of-event-architecture.html
[3]: http://daviddawson.me/blog/2017/08/13/build-reactive-polyglot-muon.html
[4]: https://blog.acolyer.org/2017/08/22/javascript-for-extending-low-latency-in-memory-key-value-stores/
[5]: http://blog.revolutionanalytics.com/2017/08/data-track-ignite.html
[mi]: https://www.microsoft.com/en-us/ignite/default.aspx
[6]: https://medium.com/towards-data-science/introduction-to-recurrent-neural-network-27202c3945f3
[7]: http://blog.revolutionanalytics.com/2017/08/query-editor-tips.html
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
