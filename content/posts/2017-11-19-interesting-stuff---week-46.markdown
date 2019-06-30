---
layout: post
title: Interesting Stuff - Week 46
author: nielsb
date: 2017-11-19T19:43:30+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - CSharp
description: JSON in SQL Server, some .NET coverage and other interesting stuff.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - CSharp   
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

* [Announcing SQL Operations Studio for preview][1]. From the intro: "SQL Operations Studio is a free, light-weight tool for modern database development and operations for SQL Server on Windows, Linux and Docker, Azure SQL Database and Azure SQL Data Warehouse on Windows, Mac or Linux machines.". Hmm, I don't know, haven't looked at it yet - but the name sux!
* [JSON parsing 10x faster than XML parsing][2]. [Jovan][jovpop] is busy writing posts about JSOn in SQL Server. In this post he compares performance of parsing JSON, with parsing XML. The title says it all!
* [JSON vs CLR UDT – performance comparison][3]. Another post from [Jovan][jovpop] about JSON in SQL Server. This time he takes a stab at comparing performance, parsing JSON using SQLCLR vs. the nvarchar JSON implementation in SQL Server 2016+. Interesting stuff!
* [SQL Server 2017: A proven leader in database performance][4]. [Bob Ward][bobw] posts about SQL Server 2017 running away with performance benchmarks both for OLTP as well as analytics,

## .NET

* [Introducing Nullable Reference Types in C#][5]. Huh, "nullable reference types" in C#? I thought reference types were nullable by default? Well this post talks about a future version of C# where reference types would not be nullable by default, but how you can express your intent of a nullable reference type with new syntax. Looks interesting!
* [Introducing Tensor for multi-dimensional Machine Learning and AI data][6]. I have categorized this post as .NET, but it could as easily be Data Science. Anyway, this is about a new .NET data type - **Tensor** - whose purpose is to make it easy for Machine Learning library vendors like CNTK, Tensorflow, Caffe, Scikit-Learn to port their libraries over to .NET with minimal dependencies in place.

## SQL Server R Services

It looks like I finally will get the **Binary eXchange Language** post published (this will probably jinx it). I have most of the post done, and with some luck it should be out there sometime before next weekend.

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
[1]: https://blogs.technet.microsoft.com/dataplatforminsider/2017/11/15/announcing-sql-operations-studio-for-preview/
[2]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/11/13/json-parsing-10x-faster-than-xml-parsing/
[3]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/11/15/json-vs-clr-udt-performance-comparison/
[4]: https://blogs.technet.microsoft.com/dataplatforminsider/2017/11/16/sql-server-2017-a-proven-leader-in-database-performance/
[5]: https://blogs.msdn.microsoft.com/dotnet/2017/11/15/nullable-reference-types-in-csharp/
[6]: https://blogs.msdn.microsoft.com/dotnet/2017/11/15/introducing-tensor-for-multi-dimensional-machine-learning-and-ai-data/
