---
layout: post
title: Interesting Stuff - Week 5
author: nielsb
date: 2018-02-04T19:55:11+02:00
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
  - .NET Core
  - MSDTC
description: MSDTC, JSON in SQL Server, Kafka, .NET Core 2.1, and other cool stuff.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - .NET Core
  - MSDTC   
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

## SQL Server

* [JSON in SQL Server – Use cases][1]. I had a link to a post by [Jovan][jovpop] in last week's [roundup][int4], where he wrote about using JSON for de-normalised data models. In this post, Jovan discusses various use cases for JSON in SQL Server. Interesting!
* [How It Works: SQL Server DTC (MSDTC and XA Transactions)][2]. An in-depth post about how MS DTC and the XA protocol works in SQL Server.
* [Simplify REST API development for modern Single-page apps with SQL Server][4]. More from ["Mr JSON in SQL Server"][jovpop] (Jovan). In this post, he writes about how the use of JSON in SQL Server can simplify REST API development.

## Databases Misc.

* [Why and How Database Changes Should Be Included in the Deployment Pipeline][3]. What the title says. An article from [InfoQ][iq] about including database code in the build pipeline.

## .NET

* [.NET Core 2.1 Roadmap][5]. This post lays out the roadmap for the upcoming .NET Core 2.1, and it focuses on CoreCLR, CoreFX and CLI improvements.
* [C# - All About Span: Exploring a New .NET Mainstay][6]. The above link led me to this article by [Stephen Toub][7] where he discusses a new value type in .NET: `System.Span<T>`. The article is a **must read**.

## Streaming

* [KSQL January release: Streaming SQL for Apache Kafka][8]. This post announces the release of KSQL 0.4, aka the January 2018 release of KSQL, and it takes a look at what is new in this release.

## Data Science

* [Randomness in Deep Learning Systems: Monte Carlo and Las Vegas Methods][9]. A short and sweet comparison between Las Vegas and Monte Carlo methods by [Jesus][jesrod].
* [R or Python? Python or R? The ongoing debate.][10]. Some thoughts by [Tomaz][tomaz] about R vs. Python for data scientists.

## SQL Server R Services

* [Microsoft SQL Server R Services - Internals XX][si20]. This post is the last post of the **Internals** posts in the **Microsoft SQL Server R Services** series. In the post, I cover how SQL Server, and the launchpad service, handle errors from the external engine.

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

[int4]: {{< relref "2018-01-28-interesting-stuff---week-4.markdown" >}}
[si20]: {{< relref "2018-02-02-microsoft-sql-server-r-services---internals-xx.markdown" >}}

[1]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2018/01/31/json-in-sql-server-use-cases/
[2]: https://blogs.msdn.microsoft.com/bobsql/2018/01/28/how-it-works-sql-server-dtc-msdtc-and-xa-transactions/
[3]: https://www.infoq.com/articles/deployment-pipeline-database-changes
[4]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2018/01/29/simplify-rest-api-development-modern-single-page-apps-sql-server/
[5]: https://blogs.msdn.microsoft.com/dotnet/2018/02/02/net-core-2-1-roadmap/
[6]: https://msdn.microsoft.com/en-us/magazine/mt814808.aspx
[7]: https://blogs.msdn.microsoft.com/pfxteam/
[8]: https://www.confluent.io/blog/ksql-january-release-streaming-sql-apache-kafka/
[9]: https://medium.com/@jrodthoughts/randomness-in-deep-learning-systems-monte-carlo-and-las-vegas-methods-fc03108fa80c
[10]: https://tomaztsql.wordpress.com/2018/01/28/r-or-python-python-or-r-the-ongoing-debate/
