---
layout: post
title: Interesting Stuff - Week 50&#58; Year End!
author: nielsb
date: 2017-12-17T08:58:46+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - flink
  - kafka
  - quantum computing
  - python
description: Apache Kafka, Flink, quantum computing, R on Windows Subsystem for Linux, and a lot of other interesting things!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - flink
  - kafka
  - quantum computing
  - python   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, for the week just gone by. 

> **NOTE:** *I started the "roundup" posts in the beginning of this year, as a way for me to force myself to keep my blog active, and to share with you what I find interesting in the tech-world. It is now coming up on Christmas and New Year, and I will take a break with these posts and come back in the beginning of next year.*

<!--more-->

## .NET / CLR

* [How does .NET JIT a method? (also featuring 'Tiered Compilation')][1]. An awesome post by [Matthew][mattw] about how [JIT:ting][2] works in .NET. As a side note (I've said this before); if you are interested in the "plumbing" of .NET Matthew's [blog][3] should be in your "must read" blog-list.

## Distributed Computing

* [Distributed system exams][4]. [Murat][mutw] posts about the final exam he gave in his Distributed Systems class. Cool stuff!! Some of the questions would be really good interview questions. Oh, and what I said about Matthew's blog being a must read, the same holds true for Murat's [blog][5], especially if you are into distributed systems.

## Streaming

* [Announcing the Apache Flink 1.4.0 Release][6]. An early Christmas gift - **Apache Flink** 1.4 has now been released! Read the blog-post and the links to documentation to see what is new and improved.
* [Enabling Exactly-Once in Kafka Streams][7]. I guess the title of the post says it all. A post about how to enable exactly once delivery in **Apache Kafka** streams.
* [The Blog Post on Monitoring an Apache Kafka Deployment to End Most Blog Posts][8]. A truly awesome post about monitoring of Apache Kafka!

## Computing

* [The future is quantum: Microsoft releases free preview of Quantum Development Kit][10]. In [Interesting Stuff - Week 39][int39] I had a link about Microsoft's **Quantum Computing Toolkit**. This post is about how the toolkit has actually been released in a preview version. Now I know what to do during the Christmas holiday!

## Data Science

* [R in the Windows Subsystem for Linux][9]. A post by [David][revod], how R can be run on the **Windows Subsystem for Linux** (**WSL**). WSL is very cool, and I use it for my blog (Jekyll is my blog-engine).
* [Getting Started with Python Web Services using Machine Learning Server][11]. This post is a step by step tutorial about how to implement the data science life-cycle using Python on **Microsoft Machine Learning Server**.
* [How to use Tableau with SQL Server Machine Learning Services with R and Python][12]. This post, talks about ow Tableau and SQL Server Machine Learning Services work seamlessly leveraging the power of R and Python.

## SQL Server R Services

As I wrote in [Interesting Stuff - Week 49][int49], I'm not completely sure when I'll be able to publish **Internals - XVI**. I am working on it, but I have a hard time getting the text to flow, and what approach to take. Anyway, it will be ready when it is ready, in the meantime, here is a link to [Internals - XV][si15].

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me. And seeing that holidays are coming up - have a Great Holiday Season!!

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
[mattw]: https://twitter.com/matthewwarren
[mutw]: https://twitter.com/muratdemirbas

[int39]: {{< relref "2017-10-01-interesting-stuff---week-39.markdown" >}}
[int49]: {{< relref "2017-12-10-interesting-stuff---week-49.markdown" >}}

[si15]: {{< relref "2017-12-02-microsoft-sql-server-r-services---internals-xv.markdown" >}}

[1]: http://mattwarren.org/2017/12/15/How-does-.NET-JIT-a-method-and-Tiered-Compilation/
[2]: https://docs.microsoft.com/en-us/dotnet/standard/managed-execution-process#compiling_msil_to_native_code
[3]: http://mattwarren.org/
[4]: http://muratbuffalo.blogspot.co.za/2017/12/distributed-system-exams.html
[5]: http://muratbuffalo.blogspot.co.za/
[6]: https://data-artisans.com/blog/announcing-the-apache-flink-1-4-0-release
[7]: https://www.confluent.io/blog/enabling-exactly-kafka-streams/
[8]: https://www.confluent.io/blog/blog-post-on-monitoring-an-apache-kafka-deployment-to-end-most-blog-posts
[9]: http://blog.revolutionanalytics.com/2017/12/r-in-the-windows-subsystem-for-linux.html
[10]: https://blogs.microsoft.com/ai/2017/12/11/future-quantum-microsoft-releases-free-preview-quantum-development-kit/
[11]: https://blogs.msdn.microsoft.com/mlserver/2017/12/13/getting-started-with-python-web-services-using-machine-learning-server/
[12]: https://blogs.msdn.microsoft.com/mlserver/2017/12/14/how-to-use-tableau-with-sql-server-machine-learning-services-with-r-and-python/
