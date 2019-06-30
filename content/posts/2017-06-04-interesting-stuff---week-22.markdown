---
layout: post
title: Interesting Stuff - Week 22
author: nielsb
date: 2017-06-04T20:13:28+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - Apache Flink
  - JSON
  - Akka.Net
  - proto.actor
description: Apache Flink, Proto.Actor, some other actor stuff, and data science as usual.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - Apache Flink
  - JSON
  - Akka.Net
  - proto.actor   
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

As it was the case last week, my reading has suffered due to work as well as due to "prep" for the [Microsoft Cloud Society - Data Science Roadshow][1], at which I will speak on Tuesday (June 6) next week.

## SQL Server

* [Use WITH clause in OPENJSON to improve parsing performance][2]. Jovan Popovic (@JovanPop_MSFT), who is the JSON guru on the SQL Server team, has an interesting post how to improve performance of `OPENJSON` by specifying what fields should be extracted from input JSON, using the `WITH` clause.

## Distributed Computing

* [A Brief Update on Me (in a Word, Pulumi)][3]. Well, me in the blog-title is obviously not me as in myself, but Joe Duffy - previously (among other things) "Director of Engineering for Microsoft's Compiler and Language Group" e.g. he knows a thing or two about "stuff". He has since resigned from Microsoft and started [Pulumi][4]. The post was his first in a while, and as good it is to hear from him, it is infuriating to not know what Pulumi is all about :).
* [proto actor][5]. Roger Johansson, who is the father of [Akka.Net][6] has gone and created another actor framework: proto.actor. It sounds extremely interesting, being sort of a mix between Akka.Net and [Microsoft Orleans][7].

## Streaming

* [Apache Flink® 1.3.0 and the Evolution of Stream Processing with Flink][8]. Apache Flink has just released version 1.3. This post is a summary of the evolution of Flink.
* [Blink: How Alibaba Uses Apache Flink][9]. Anoter post about Apache Flink. This is about how the worlds largest e-commerce retailer, [Alibaba][10], utilizes Flink.

## Data Science

* [Comparing Deep Learning Frameworks][11].  An [InfoQ][iq] presentation of different types of deep learning frameworks, specifically about open source neural networks.
* [Microsoft’s high-performance, open source, deep learning toolkit is now generally available][12]. Microsoft Cognitive Toolkit version 2.0 is now in full release with general availability. Some really interesting new features as well as performance benchmarks.
* [Watch presentations from R/Finance 2017][13]. Blog-post from [Revolution Analytics][re] listing interesting talks from the [R/Finance 2017] conference earlier this year.
* [5 DATA SCIENCE RESEARCH PAPERS TO READ IN SUMMER 2017][15]. A blog-post from [Data Science 101][16] listing some interesting Data Science papers to read.

## SQL Server R Services

As was the case last week, I am struggling with getting out the next installation of my [SQL Server R Services][sinst] series. It is slow going but I hope to have something out within the next two weeks.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

Oh, and if you attend the [Microsoft Cloud Society - Data Science Roadshow][1] conference in Johannesburg, please come by and say Hi!

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: https://www.microsoft.com/middleeast/azure/cloud-society/engage-data-science-roadshow.aspx
[2]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/05/29/use-with-clause-in-openjson-to-improve-parsing-performance/
[3]: http://joeduffyblog.com/2017/06/01/an-update-on-me-pulumi/
[4]: http://pulumi.com/
[5]: http://proto.actor/
[6]: http://getakka.net/
[7]: https://dotnet.github.io/orleans/
[8]: https://data-artisans.com/blog/apache-flink-1-3-0-evolution-stream-processing
[9]: https://data-artisans.com/blog/blink-flink-alibaba-search
[10]: https://www.alibaba.com/
[11]: https://www.infoq.com/presentations/comparison-deep-learning-frameworks
[12]: https://www.microsoft.com/en-us/cognitive-toolkit/blog/2017/06/microsofts-high-performance-open-source-deep-learning-toolkit-now-generally-available/
[13]: http://blog.revolutionanalytics.com/2017/05/watch-rfinance-2017.html
[14]: http://www.rinfinance.com/
[15]: http://101.datascience.community/2017/06/01/5-datascience-research-papers-summer-2017
[16]: http://101.datascience.community/
[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
