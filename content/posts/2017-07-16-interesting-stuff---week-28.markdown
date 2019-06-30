---
layout: post
title: Interesting Stuff - Week 28
author: nielsb
date: 2017-07-16T20:34:07+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2017
  - graph databases
  - SQL Server Linux
  - Apache Flink
  - .NET internals
  - SQL Server R Services
description: Cool stuff about graph databases, SQL Server 2017, SQL Server Linux, Apache Flink and other interesting goodies!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2017
  - graph databases
  - SQL Server Linux
  - Apache Flink
  - .NET internals
  - SQL Server R Services   
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

This weeks SQL Server topic, has quite a lot about graph databases. This is an interesting subject seeing SQL Server 2017's built-in graph capability.

* [Do we need specialized graph databases? Benchmarking real-time social networking applications][1]. In this white paper dissection, [Andrew][mp] queries the need for specialized graph databases. Please read and judge for yourselves.
* [SQL Graph Objects in SQL Server 2017: the Good and the Bad][2]. [Dennes Torres][3] has a really great blog-post about the graph capabilities in SQL Server 2017.
* [What’s in a name? How should SQL Server 2017 Graph Edge tables be named?][4]. Based on the post by Dennes (mentioned above), Greg Low posts some thoughts about naming of edge tables in graph databases.
* [Setting up SQL Server High-Availability between Windows and Linux with SQL Server 2017][5]. [Slava Oks][6] and [Tobias Ternström][7] (the "SQL Server on Linux" Brothers) talks about how to set up SQL server 2017 for high availability between Linux and Windows.

## Streaming

* [Complex Event Generation for Business Process Monitoring using Apache Flink][8]. Blog-post about how Apache Flink is being used for Complex Event Processing (CEP).

## .NET

This week I came across two very interesting blogs, that cover the "nitty-gritty" of .NET, and here follows a couple of really interesting posts.

* [Value Types vs Reference Types][9]. I certainly hope that every single .NET developer knows about value types and reference types, but I bet that this post by [Adam Sitnik][10] will blow everyones mind away, when he drills deep, deep into value types and reference types!
* [Memory Usage Inside the CLR][11]. Another deep, deep drilling post about .NET. This time by [Matthew Warren][11], and he goes into details about internal CLR memory! You gotta read it, it is awesome!
* [Span][12]. Oooh, this is "sexy"! [Adam Sitnik][10] posts about how to work with both managed and unmanaged memory in ,NET in a safe and efficient way!

## Data Science

* [Set up an auto-scale environment to operationalize your R analytics, with just ONE CLICK][13]. How to set up an auto-scale environment for operationalization of R analytics using Azure and Microsoft R Server.


## SQL Server R Services

* [Microsoft SQL Server R Services - Internals VII][si7]. I finally managed to get the [Internals - VII][si7] post out there! I do apologize it took so long. Anyway, here we look at what files and sub-directories are created - and by whom - when executing an external R script.

I am busy working on *Microsoft SQL Server R Services - Internals VIII*, and hopefully it won't take as long as [VII][si7].

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: https://blog.acolyer.org/2017/07/07/do-we-need-specialized-graph-databases-benchmarking-real-time-social-networking-applications/
[2]: https://www.red-gate.com/simple-talk/sql/t-sql-programming/sql-graph-objects-sql-server-2017-good-bad/
[3]: https://www.red-gate.com/simple-talk/author/dennes-torres/
[4]: http://sqlblog.com/blogs/greg_low/archive/2017/07/10/what-s-in-a-name-how-should-sql-server-2017-graph-edge-tables-be-named.aspx
[5]: https://channel9.msdn.com/Shows/Data-Exposed/Setting-up-SQL-Server-High-Availability-between-Windows-and-Linux-with-SQL-Server-2017
[6]: https://blogs.msdn.microsoft.com/slavao
[7]: https://azure.microsoft.com/en-us/blog/author/tobiast/
[8]: https://data-artisans.com/blog/complex-event-generation-business-process-monitoring-using-apache-flink
[9]: http://adamsitnik.com/Value-Types-vs-Reference-Types/
[10]: http://adamsitnik.com/
[11]: http://mattwarren.org
[12]: http://adamsitnik.com/Span/
[13]: https://blogs.msdn.microsoft.com/rserver/2017/07/07/set-up-an-auto-scale-environment-to-operationalize-your-r-analytics-with-just-one-click/
[si7]: {{< relref "2017-07-11-microsoft-sql-server-r-services---internals-vii.markdown" >}}
