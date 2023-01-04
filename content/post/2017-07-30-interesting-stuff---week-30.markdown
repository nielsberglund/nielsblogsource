---
layout: post
title: Interesting Stuff - Week 30
author: nielsb
date: 2017-07-30T14:23:33+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - sp_execute_external_script
  - .NET
  - RyuJIT
  - F#
  - Azure Functions
  - SQL Server R Services
description: F# coverage, together with .NET in general, SQL Server R Services, Azure Functions, and other things.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - sp_execute_external_script
  - .NET
  - RyuJIT
  - F#
  - Azure Functions
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

* [Where do SQL Server tasks come from?][1]. [Ewald][ew] continues his tales, about thread and tasks and other cool stuff, from [last week][2] when he spoke about SQLOS threads. This time he looks at how threads and tasks fit together. I really, really like what he writes about, seeing that is deep down in SQLOS (and he uses WinDbg a lot :) ).
* [SQL Server Memory Accounting: Aligning Perfmon & DMVs][4]. [Lonny][3] writes a very interesting article about squaring up what you see in SQL Server performance counters with what you get from DMV's.

## .NET

* [.NET Application Architecture Guidance][5]. The .NET team has published some free eBooks as guidance to application architecture, especially microservices and container based applications (at least that's the ones I am interested in).
* [Get Started with F# as a C# developer][6]. A nice introduction for C# developers how to get started with F#.
* [Performance Improvements in RyuJIT in .NET Core and .NET Framework][7]. A blog-post pointing out some of the improvements that have gone into the RyuiJIT compiler for .NET Core (x64 and x86) as well as .NET Framework (x64). Pretty impressive stuff!

## Data Science

* [Passing two SQL queries to sp_execute_external_script][8]. The procedure `sp_execute_external_script` which is used to execute R or Python scripts, has an input parameter: `@input_data_1`. It is used to input a dataset to the external script. Based on the name you might expect that there would be more parameters for input of data (`@input_data_2`, `@input_data_3`, etc.) However, that is not the case, and there has been quite a few questions on various newsgroups what to do if you want to send in multiple datasets. In this blog-post, [Tomaz][9], shows a way you can achieve to input multiple datasets. Cool!!
* [Running R scripts on Azure Function][10]. Serverless computing is really an "in thing", and in AWS you have Lambda, and in Azure; Azure Functions (geez, what is it with Microsoft and naming of stuff?). Anyway [Thomas Delteil][11] from Microsoft shows how you can deploy a R scripts on Azure Function.
* [Data Science: Start at the very Beginning, It’s a very good place to start][12]. [Buck Woody][13] posts about two different types of data science projects, and which type of project won't work, and why.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: http://sqlonice.com/where-do-sqlos-tasks-come-from/
[2]: http://sqlonice.com/the-early-life-of-a-sqlos-thread/
[3]: http://sql-sasquatch.blogspot.com
[4]: http://sql-sasquatch.blogspot.com/2017/07/sql-server-memory-accounting-aligning.html
[5]: https://blogs.msdn.microsoft.com/dotnet/2017/07/26/the-new-net-application-architecture-guidance/
[6]: https://blogs.msdn.microsoft.com/dotnet/2017/07/24/get-started-with-f-as-a-c-developer/
[7]: https://blogs.msdn.microsoft.com/dotnet/2017/06/29/performance-improvements-in-ryujit-in-net-core-and-net-framework/
[8]: https://tomaztsql.wordpress.com/2017/07/25/passing-two-sql-queries-to-sp_execute_external_script/
[9]: https://tomaztsql.wordpress.com/
[10]: https://github.com/thdeltei/azure-function-r
[11]: https://github.com/thdeltei
[12]: https://buckwoody.wordpress.com/2017/07/27/data-science-start-at-the-very-beginning-its-a-very-good-place-to-start/
[13]: https://buckwoody.wordpress.com/author/buckwoody/
