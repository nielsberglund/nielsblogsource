---
layout: post
title: Interesting Stuff - Week 11
author: nielsb
date: 2017-03-19T07:59:04+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - R
  - Azure
  - SQL Server R Services
description: Weekly roundup of what interesting stuff I have read in blogs etc.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - R
  - Azure
  - SQL Server R Services  
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, this week. 

<!--more-->

## Distributed Computing

* [From Microliths to Microsystems: Jonas Bonér at QCon London][1]. Jonas Boner discusses micro-services and points out that quite a few micro-services are really microliths (mini monoliths). A micro-service needs to be designed as a distributed system.
* [Concurrent and Distributed Programming in the Future][2]. Joe Duffy, who previously was Director of Engineering for Languages and Compilers at Microsoft, gives a keynote at [QCon London][qcon] where he talks about concurrent programming. I am so looking forward to the video and slides of this keynote.
* [Joe Duffy's Blog][3]. So I didn't come across this blog this week, but having mentioned Joe Duffy above, I have to point out his blog which is a goldmine if you are interested in concurrent programming and distributed systems. His series of posts about [Midori][4] is a must read. 
* [Conference Recap: Google Cloud Next][5]. As the title says; a recap of Google's [Cloud Next][6] conference.

## SQL Server

* [SQLskills SQL101: Temporary table misuse][7]. A post in the [SQLSkills SQL101][101] series, by Paul Randal, about temp-tables and how they can be mis-used.
* [Comparing performance of data access libraries using StackExchange/Dapper benchmark][8]. Disclaimer: I detest [ORM][orm]'s with a vengeance. So, some benchmarking by Jovan Popovic, from Microsoft, comparing different data access libraries. I'll let you draw your own conclusions, but I am a happy "bunny".
* [The Vietnam of Computer Science][9]. A post I read a long, long time ago - but as it has some touch-points with the post above I thought I'd share it. Ted Neward, an ex colleague of mine, wrote this post back in 2006 where he compared ORM's with the Vietnam war.
* [SQLskills SQL101: Indexing Basics][10]. Another post from the [SQLSkills SQL101][101] series. This one is by Kimberly Tripp, and it talks about indexes.
* [#TSQL2SDAY: The string length server][11]. A tongue in cheek entry for [T-SQL Tuesday][12] by Ewald. As a side note, as I wrote in lasts week [roundup][14], read his [blog][13] if you want to get into the "nitty gritty" of SQL Server internals.
* [Microsoft SQL Server R Services - Internals I][15]. This post is part 2 of my [series about Microsoft SQL Server R Services][16]. This post is about the internals, more specifically about what happens in the SQL engine when you execute `sp_execute_external_script`.

## Streaming

* [Big Data Processing with Apache Spark – Part 1: Introduction][17]. This article is the first in a series named "Big Data Processing with Apache Spark". A lot of very useful articles!

## Data Science

* [Neural Networks: How they work, and how to train them in R][18]. Neural networks are so "in" at the moment in the data science world. This post by [Revolution Analytics][revo] summarizes various R packages useful for neural networks and points to a video about neural networks.
* [Microsoft Data Amp—where data gets to work][19]. Information and registration for an upcoming Microsoft virtual conference about Microsoft's data platform.
* [Monte Carlo Planning Improves Decision Making][20]. An article which discusses some innovative uses for Monte Carlo simulation.
* [doAzureParallel: Take advantage of Azure’s flexible compute directly from your R session][21]. This post introduces [doAzureParallel][22], an R package which allows R users to scale up their work to take advantage of cloud compute. 

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[qcon]: https://qconlondon.com/
[revo]: http://blog.revolutionanalytics.com/
[1]: https://www.infoq.com/news/2017/03/microliths-microsystems
[2]: https://www.infoq.com/news/2017/03/distributed-programming-qcon
[3]: http://joeduffyblog.com/
[4]: http://joeduffyblog.com/2015/11/03/blogging-about-midori/
[5]: https://www.infoq.com/news/2017/03/google-cloud-next
[6]: https://cloudnext.withgoogle.com/
[7]: https://www.sqlskills.com/blogs/paul/sqlskills-sql101-temporary-table-misuse/
[8]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/03/14/comparing-performance-of-data-access-libraries-using-stackexchangedapper-benchmark/
[9]: http://blogs.tedneward.com/post/the-vietnam-of-computer-science/
[10]: https://www.sqlskills.com/blogs/kimberly/sqlskills-sql101-indexing/
[11]: http://sqlonice.com/tsql2sday-the-string-length-server/
[12]: http://tsqltuesday.com/
[13]: http://sqlonice.com/
[14]: {{< relref "2017-03-12-interesting-stuff---week-10.markdown" >}}
[15]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[16]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[17]: https://www.infoq.com/articles/apache-spark-introduction
[18]: http://blog.revolutionanalytics.com/2017/03/neural-networks-r.html
[19]: https://www.microsoft.com/en-us/sql-server/data-amp
[20]: https://www.infoq.com/articles/monte-carlo-planning
[21]: https://azure.microsoft.com/en-us/blog/doazureparallel/
[22]: https://github.com/Azure/doAzureParallel
[101]: https://www.sqlskills.com/help/sql101/
[orm]: https://en.wikipedia.org/wiki/Object-relational_mapping

