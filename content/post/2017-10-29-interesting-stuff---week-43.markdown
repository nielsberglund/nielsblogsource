---
layout: post
title: Interesting Stuff - Week 43
author: nielsb
date: 2017-10-29T19:29:49+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - flink
  - Azure Data Factory
  - Python
description: Interesting stuff about Apace Flink, Anaconda, Azure Data Factory, and others.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - flink
  - Azure Data Factory
  - Python   
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

* [SQL Server 2016/2017 Internals and Tuning is Online!][1]. [Kalen][2] is known for her books about the [internals of SQL Server][3] as well as for her training courses. She is now presenting her entire SQL Server Internals training online. Do not miss it! 

## Cloud

* [Highlighting 3 New Features in Azure Data Factory V2][4]. The first blog-post in a series about new features in [Azure Data Factory][5] for different types of data integration users. 

## Streaming

* [StreamING Machine Learning Models: How ING Adds Fraud Detection Models at Runtime with Apache Flink][6]. The title says it quite well; a post about how [ING][7] based the risk engine on Apache Flink.

## Data Science

 * [Statistical Machine Learning with Microsoft ML][8]. The guys at [Revolution Analytics][re] makes us aware of a new online [ebook][10] about the [MicrosoftML][9] R package.
 * [Anaconda and Microsoft partner to offer Python and R for powerful machine learning][11]. A post announcing the partnership between [Anaconda] and Microsoft, where Anaconda will be part of Microsoft Machine Learning Server, SQL Server Machine Learning Services as well as Visual Studio. Real cool!!

## SQL Server R Services

I have made good progress in writing **Internals - XII** in the **SQL Server R Services** series. Expect it to be published within a couple of days (the famous last words). It discusses more about the same topic as in [Internals - XI][si11] - what routines sends the packets from SQL Server to the **SqlSatellite**, and what are some of those packets.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: http://sqlblog.com/blogs/kalen_delaney/archive/2017/10/23/sql-server-2016-2017-internals-and-tuning-is-online.aspx
[2]: http://sqlblog.com/blogs/kalen_delaney/default.aspx
[3]: https://www.amazon.com/Kalen-Delaney/e/B001JS5NZO/ref=dp_byline_cont_book_1
[4]: https://azure.microsoft.com/en-us/blog/highlighting-3-new-features-in-azure-data-factory-v2/
[5]: https://docs.microsoft.com/en-us/azure/data-factory/
[6]: https://data-artisans.com/blog/real-time-fraud-detection-ing-bank-apache-flink
[7]: https://www.ing.com/web/show
[8]: http://blog.revolutionanalytics.com/2017/10/statistical-machine-learning-with-microsoft-ml.html
[9]: https://docs.microsoft.com/en-us/machine-learning-server/r-reference/microsoftml/microsoftml-package
[10]: https://azure.github.io/learnAnalytics-MicrosoftML/index.html
[11]: https://blogs.technet.microsoft.com/machinelearning/2017/10/26/anaconda-and-microsoft-partner-to-offer-python-and-r-for-powerful-machine-learning/
[12]: https://www.anaconda.com/
[si11]: {{< relref "2017-10-20-microsoft-sql-server-r-services---internals-xi.markdown" >}}
