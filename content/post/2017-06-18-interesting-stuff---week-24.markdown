---
layout: post
title: Interesting Stuff - Week 24
author: nielsb
date: 2017-06-18T09:26:42+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - R
  - SQL Server R Services
  - SQL Server 2017
  - Python
  - Microsoft R Server
description: This week we cover SQL Server on Linux, Python in SQL Server 2017, Microsoft R Server, and other goodies.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - R
  - SQL Server R Services
  - SQL Server 2017
  - Python
  - Microsoft R Server   
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

* [The SQL Hall of Shame][1]. My old friend Adam Machanic asked for input from the SQL Server community, of "useless" features of SQL Server. This blog-post is the result. Some of the "features" submitted, I agree wholeheartedly with, others not so much. Among the ones I question are SQLCLR, as well as in-memory (Adam is on my side with those two).
* [TPC-H Benchmarking with SQL Server on Linux][2]. A Channel 9 presentation, where [Slava Oks][slo] and my compatriot Tobias Ternstrom talks about how they have managed to get awesome performance out of SQL Server on Linux.

## Data Science

* [Data Science Walkthrough with SQL Server 2017 and Microsoft Machine Learning Services][3]. Back in late April (this year - 2017), when SQL Server 2017 CTP 2.0 was introduced, I wrote a [short post][4] about running Python in SQL Server 2017. This post, is a complete walk through, how Python can be used in SQL Server 2017.
* [Syberia: A development framework for R code in production][5]. The guys at [Revolution Analytics][re] posts about a development framework for R: **[Syberia][6]**.
* [Installing R packages with rxInstallPackages in Microsoft R Server][7]. [Tomaz][8] blogs about new functionality in [MicrosoftML][9], to help with installing new packages in SQL Server R Services, as well as Microsoft R Server.
* [Demo: Real-Time Predictions with Microsoft R Server][11]. [David][10] from [Revolution Analytics][re] blogs about a presentation he did at the [R/Finance 2017][12] conference in Chicago in May. The presentation was about predicting fraud at a rate of 1 million transactions a second, using Microsoft R Server. The post links to a video of the presentation, and it also has links to the code used. It is well worth having a look at!

## SQL Server R Services

For you who wonder about my [SQL Server R Services][sinst] series, I should be able to publish episode VII this coming week sometime.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ch9]: https://channel9.msdn.com
[slo]: https://blogs.msdn.microsoft.com/slavao
[1]: http://sqlblog.com/blogs/adam_machanic/archive/2017/06/14/the-sql-hall-of-shame.aspx
[2]: https://channel9.msdn.com/Shows/Data-Exposed/TPC-H-Benchmarking-with-SQL-Server-on-Linux
[3]: https://blogs.technet.microsoft.com/machinelearning/2017/06/15/data-science-walkthrough-with-sql-server-2017-and-microsoft-machine-learning-services/
[4]: {{< relref "2017-04-20-sql-server-2017---python-executing-from-sql.markdown" >}}
[5]: http://blog.revolutionanalytics.com/2017/06/syberia.html
[6]: http://syberia.io/
[7]: https://tomaztsql.wordpress.com/2017/06/14/installing-r-packages-with-rxinstallpackages-in-microsoft-r-server/
[8]: https://tomaztsql.wordpress.com
[9]: https://msdn.microsoft.com/en-us/microsoft-r/microsoftml-introduction
[10]: https://twitter.com/revodavid
[11]: http://blog.revolutionanalytics.com/2017/06/real-time-predictions.html
[12]: http://www.rinfinance.com/
[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
