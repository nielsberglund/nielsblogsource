---
layout: post
title: Interesting Stuff - Week 17
author: nielsb
date: 2017-04-30T20:24:37+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - R
description: In this roundup we cover SQL Server R Services, new version of R and a lot of other interesting stuff I have read in blogs etc.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - R  
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

## Streaming

* [Nikita Ivanov on Apache Ignite In-Memory Computing Platform][1]. You can hardly turn around without "bumping" into a platform offering in-memory computing. Apcahe Ignite is a newcomer to the mix, and - in an [InfoQ][iq] interview - Nikita Ivanov talks about what Apache Ignite is. To me it is interesting as it supports both both key-value persistence as well as streaming and complex-event processing.

## SQL Server

* [How to find query plan choice regressions with SQL Server 2017 CTP2][3]. A blog post by Jovan Popovic from Microsoft about how **SQL Server 2017** introduces functionality to allow you to easily identify performance regressions in SQL queries. I know some DBA's at [**Derivco**](/derivco) who'd sell their first-born for this.
* [SQL Server community-driven enhancements in SQL Server 2017][4]. A post by the [SQL Server engineering a.k.a TIGER][5] team, how a lot of new functionality in **SQL Server 2017** has been introduced due to ideas/requests from the community. Very cool!!
* [How are default column values stored?][10]. Paul from [SQLskills][sqsk] "spelunks" about how default column values are stored.

## Data Science

* [Data Preparation for Data Science: A Field Guide][6]. An [InfoQ][iq] presentation about a utility written with Apache Spark to automate data preparation, discovering missing values, values with skewed distributions and discovering likely errors within data. This could come in very handy for [us](/derivco).
* [Using Microsoft’s Deep Learning Toolkit with Spark on Azure HDInsight Clusters][7]. How to do distributed deep learning over big datasets on Azure HSInsight Spark with  Microsoft Cognitive Toolkit. This is very, very interesting!!
* [R 3.4.0 now available][8]. The guys at [Revolution Analytics][re] points out that R 3.4.0 is available, and some of the new functionality in the release. Go and get it before it is sold out!
* [Bringing IoT to sports analytics][9]. [the morning paper][mp] is back after vacation! This is about sports analytics and how IoT devices can help analyzing various things, and potentially replacing very, very expensive high-quality cameras.
* [Leveraging Microsoft R and in database analytics of SQL Server with R Services through Alteryx Designer][11]. In the roundup for [week 12][12] I wrote about how [Revolution Analytics][re] mentioned this visual designer for R supporting SQL Server R Services: Alteryx. In the post I link to in this roundup, the Microsoft R Product Team tries out the designer against SQL Server R Services. It looks quite a lot like Azure ML. I so need to try it out!
* [Microsoft Puts AI Where the Data Is][13]. A very nice article about how Microsoft tries to pu the Data Science / AI where the data is, in the database.
* [Performance differences between RevoScaleR, ColumnStore Table and In-Memory OLTP Table][14]. A comparison, by [Tomaz][tomaz], of performance between various data stores and applying data science:ish functions against the data.
* [Does Data Science Replace BI?][15]. Buck Woody asks the question whether BI is being replaced by Data Science. 

## SQL Server R Services

Just an update about where I am with my series about **SQL Server R Services**. I am busy working on **Internals - V**, and I had hoped to have it out by now, but there are some things I still want to investigate further. I hope I will be able to publish it early this coming week. In the meantime you can always go back and read the previous posts :):

1. [Microsoft SQL Server 2016 R Services Installation] [sinst]
1. [Microsoft SQL Server R Services - Internals I][si1]
1. [Microsoft SQL Server R Services - Internals II][si2]
1. [Microsoft SQL Server R Services - Internals III][si3]
1. [Microsoft SQL Server R Services - Internals IV][si4]

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[tomaz]: https://tomaztsql.wordpress.com
[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[si2]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
[si3]: {{< relref "2017-04-13-microsoft-sql-server-r-services---internals-iii.markdown" >}}
[si4]: {{< relref "2017-04-23-microsoft-sql-server-r-services---internals-iv.markdown" >}}
[1]: https://www.infoq.com/news/2017/04/nikita-ivanov-apache-ignite
[2]: https://www.gridgain.com/
[3]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/04/24/how-to-find-query-plan-choice-regressions-with-sql-server-2017-ctp2/
[4]: https://blogs.technet.microsoft.com/dataplatforminsider/2017/04/28/sql-server-community-driven-enhancements-in-sql-server-2017/
[5]: https://blogs.msdn.microsoft.com/sql_server_team/
[6]: https://www.infoq.com/presentations/tool-data-preparation
[7]: https://blogs.technet.microsoft.com/machinelearning/2017/04/25/using-microsofts-deep-learning-toolkit-with-spark-on-azure-hdinsight-clusters/
[8]: http://blog.revolutionanalytics.com/2017/04/r-340-now-available.html
[9]: https://blog.acolyer.org/2017/04/24/bringing-iot-to-sports-analytics/
[10]: https://www.sqlskills.com/blogs/paul/how-are-default-column-values-stored/
[11]: https://blogs.msdn.microsoft.com/rserver/2017/04/27/leveraging-microsoft-r-and-in-database-analytics-of-sql-server-with-r-services-through-alteryx/
[12]: {{< relref "2017-03-26-interesting-stuff---week-12.markdown" >}}
[13]: https://thenewstack.io/microsoft-puts-ai-data/
[14]: https://tomaztsql.wordpress.com/2017/04/28/performance-differences-between-revoscaler-columnstore-table-and-in-memory-oltp-table/
[15]: https://buckwoody.wordpress.com/2017/04/28/does-data-science-replace-bi/
