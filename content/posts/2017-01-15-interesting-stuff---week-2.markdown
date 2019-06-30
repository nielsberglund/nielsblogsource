---
layout: post
title: Interesting Stuff - Week 2
author: nielsb
date: 2017-01-15T07:14:41+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - transactions
  - R
description: Weekly roundup of what interesting stuff I have found.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - transactions
  - chaos theory
  - microservices
  - kubernetes 
  - R
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me:

* data science
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me. Oh, and if you wonder if you have missed *Interesting Stuff - Week #1*. seeing that this post is named *Interesting Stuff - Week #2*, you haven't. They are numbered by calendar week number, and I started the second week of January :).

<!--more-->

## Data Science

* [SQL Server R Services][1]. The first in a series of articles why Microsoft why they built R in SQL Server, and how it woks under the covers. I **really** look forward to reading more about this.
* [What can we learn from StackOverflow data?][2]. A post from Revolution Analytics blog, where they discuss what insights can be had from StackOverflow data. For you who don't know, Revolution Analytics was acquired by Microsoft in 2015, and a lot of what Revolution Analytics dis are now part of Microsoft R Services, etc.
* [The Great A.I. Awakening][3]. A post from New York Times about how Google used artificial intelligence to enhance Google Translate.
* [Why do Decision Trees Work?][4]. This post is very informative about how and - more importantly - decision trees work.

## Distributed Computing

* [Apache Hadoop YARN: Yet another resource negotiator][5]. A discussion of the requirements that drove the design of YARN and the high-level approach. This article is from [**the morning paper**][6], where every weekday @adriancolyer dissects a white-paper from the world of Computer Science.
* [Principles of Chaos Engineering][7]. A web-site geared towards chaos engineering of distributed systems.
* [Chaos Engineering][8]. More about chaos engineering. This article is from [InfoQ][9], covering how Netflix is doing chaos engineering.
* [Building a Microservices Platform with Kubernetes][10]. An [InfoQ][9] presentation by Matthew Mark Miller where he discusses Kubernetes’ primitives and microservices patterns on top of them, including rolling deployments, stateful services and adding behaviors via sidecars.

## SQL Server

* [Columnstore Index Performance: SQL Server 2016 – Multiple Aggregates][11]. A Microsoft blog post about performance improvements in SQL Server's **Columnstore Index**.
* [SQL Server on Linux: ELF and PE Images Just Work][12]. How Micrsoft managed to get SQL Server to boot on Linux.

## Transactions

* [The many faces of consistency][13]. Another white-paper dissection from [the morning paper][6]. This is about consistency models and isolation levels in distributed systems.

That's all for this week. I hope you enjoy what I put together. If you have ideas for what to cover, please comment on this post or ping me.

[1]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/01/10/sql-server-r-services-why-did-we-build-it/
[2]: http://blog.revolutionanalytics.com/2017/01/stackoverflow-insights.html
[3]: https://www.nytimes.com/2016/12/14/magazine/the-great-ai-awakening.html
[4]: https://www.r-bloggers.com/why-do-decision-trees-work/
[5]: https://blog.acolyer.org/2017/01/09/apache-hadoop-yarn-yet-another-resource-negotiator/
[6]: https://blog.acolyer.org
[7]: http://principlesofchaos.org/
[8]: https://www.infoq.com/articles/chaos-engineering
[9]: https://www.infoq.com
[10]: https://www.infoq.com/presentations/microservices-kubernetes
[11]: https://blogs.msdn.microsoft.com/sql_server_team/columnstore-index-performance-sql-server-2016-multiple-aggregates/
[12]: https://blogs.msdn.microsoft.com/bobsql/2017/01/05/sql-server-on-linux-elf-and-pe-images-just-work/
[13]: https://blog.acolyer.org/2017/01/12/the-many-faces-of-consistency/
