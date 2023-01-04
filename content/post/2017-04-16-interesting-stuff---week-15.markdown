---
layout: post
title: Interesting Stuff - Week 15
author: nielsb
date: 2017-04-16T20:53:40+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - .NET
  - Apache Flink
  - RStats
description: In this roundup we talk about SQL Server R Services, distributed computing, .NET, Apache Flink and other interesting stuff!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - .NET
  - Apache Flink
  - RStats   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, this week. 

<!--more-->

This week I do not have that much material, but there are still some interesting "stuff".

## Distributed Computing

* [Our Concurrent Past; Our Distributed Future][1]. In the roundup for week 11, I had a [link][3] to a summary of [Joe Duffy's][4] keynote at [QCon][qcon] in London. This is the actual presentation, video and slides.

## .NET

* [The CLR Thread Pool 'Thread Injection' Algorithm][5]. Ah, deep, "down in the plumbing" of .NET stuff. [Matt Warren][6] discusses the [Hill Climbing][7] algorithm, and how it is used to control the rate at which threads are added to the CLR thread pool. Oh and if you are interested in the plumbing of .NET/CLT Matt's [blog][6] is a treasure trove, full of information.
* [Azure Service Fabric SDK Becomes Open Source][8]. An [InfoQ][iq] article about, how, Microsoft open sourcing parts of its Service Fabric SDK.

## Microsoft Azure

* [Azure Functions now has direct integration with Application Insights][9]. A blog-post from the [Microsoft App Service Team][10] how Azure Functions now support integration with Azure Application Insights. This is cool on so very many levels, and you guys should really check it out!

## Streaming

* [Continuous Queries on Dynamic Tables: Analyzing Data Streams with SQL][11]. It seems that each weeks "roundup", has something about Apache Flink, and it's dynamic tables and SQL support. This is yet another blog-post about it. It is really cool "stuff"!

## SQL Server

* [Saving input and output with sp_execute_external_script][12]. [Tomaz][13] is, as myself, playing around with SQL Server R Services, and in this blog-post he tries to figure out how to store and save the R code being executed with `sp_execute_external_script`. It is not as straightforward as it may seem!
* [Microsoft SQL Server R Services - Internals III][14]. I finally managed to finish the third part of the **Microsoft SQL Server R Services - Internals** "saga". This "episode" looks at how the launchpad service creates various processes.

## Data Science

* [New features in the checkpoint package, version 0.4.0][15]. [Revolution Analytics][re] blogs about the new version of their checkpoint package. The package is designed to make it easy to write reproducible R code by allowing you to go backward (or forward) in time to retrieve the exact versions of the packages you need.
* [The Team Data Science Process][16]. Buck Woody writes about the Microsoft Team Data Science Process.

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[qcon]: https://qconlondon.com/
[1]: https://www.infoq.com/presentations/concurrency-distributed-computing
[2]: {{< relref "2017-03-19-interesting-stuff---week-11.markdown" >}}
[3]: https://www.infoq.com/news/2017/03/distributed-programming-qcon
[4]: http://joeduffyblog.com/
[5]: http://mattwarren.org/2017/04/13/The-CLR-Thread-Pool-Thread-Injection-Algorithm/
[6]: http://mattwarren.org/
[7]: https://en.wikipedia.org/wiki/Hill_climbing
[8]: https://www.infoq.com/news/2017/04/service-fabric-sdk-open-source
[9]: https://blogs.msdn.microsoft.com/appserviceteam/2017/04/06/azure-functions-application-insights/
[10]: https://blogs.msdn.microsoft.com/appserviceteam
[11]: https://data-artisans.com/continuous-queries-on-dynamic-tables-analyzing-data-streams-with-sql/
[12]: https://tomaztsql.wordpress.com/2017/04/10/saving-input-and-output-with-sp_execute_external_script/
[13]: https://tomaztsql.wordpress.com
[14]: {{< relref "2017-04-13-microsoft-sql-server-r-services---internals-iii.markdown" >}}
[15]: http://blog.revolutionanalytics.com/2017/04/checkpoint-new-features.html
[16]: https://buckwoody.wordpress.com/2017/04/14/the-team-data-science-process/

