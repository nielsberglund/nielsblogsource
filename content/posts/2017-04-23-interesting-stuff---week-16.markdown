---
layout: post
title: Interesting Stuff - Week 16
author: nielsb
date: 2017-04-23T20:22:38+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - Microsoft Data Amp
  - SQL Server 2017
  - Microsoft R Server 9.1
  - Pyhon in SQL Server 2017
description: In this roundup we talk about Microsoft Data Amp, SQL Server 2017, Python in SQL Server, SQL Server R Services, .NET, and other interesting stuff!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - Microsoft Data Amp
  - SQL Server 2017
  - Microsoft R Server 9.1
  - Pyhon in SQL Server 2017   
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

Wow! Wow is all I can say! Sure, of course I knew that **Microsoft Data Amp** would take place this week, but I had no idea that there would be so much interesting stuff coming out of it!! So instead of pointing to each and every really cool announcement (RCA), I'll try to keep it contained somewhat, and point to the [Channel 9][ch9] site for all the videos, plus a couple of the Really, Really Cool Announcements (RRCA).

## Microsoft Data Amp

This section will be SQL Server heavy, but still a x-section of various interesting things from **Microsoft Data Amp**.

* [Microsoft Data Amp 2017][1]. The central site for all videos from **Microsoft Data Amp**. If you only can watch two videos, please, please do yourself a favor and watch the keynotes: [Scott "Red-Shirt" Guthrie][2], and [Joseph Siro][3].
* [SQL Server 2017: Building applications using graph data][4]. **SQL Server 2017** (the "artist" formerly known as SQL v.Next) has support for graph data. Shreya Verma presents about what you can do with it.
* [SQL Server 2017: Advanced Analytics with Python][5]. Oh, ah - **SQL Server 2017** supports Python in addition to R for analysis tasks!! See more below.
* [What's new in R Server 9.1 and SQL Server R Services][6]. So let's not let Python run away with all the "glory" in **SQL Server 2017**. The release of **R Server 9.1** in **SQL Server R Services** does have some cool stuff up its sleeve!
* [SQL Server 2017: Adaptive Query Processing][7]. Let's not forget my roots; T-SQL, OLTP, the "black art" of query processing. Microsoft in **SQL Server 2017** introduces a new family of adaptive query processing improvements that will enhance the performance of workloads that have historically been difficult to tune through classic methodologies. How cool is that?!!!

OK, so let us *somewhat* return to the "normal" program.

## .NET

* [C# Futures: Nullable Reference Types][8]. Well, well, well - it looks like Microsoft is moving towards an **F#** / **Haskell** model where types, reference or value, are non-nullable by default. It will be very interesting to see how the community reacts to this. 

## SQL Server

Admittedly , there was a lot of SQL Server new (almost all?) coming from **Microsoft Data Amp**, but there is still some "other" noteworthy SQL Server topics.

* [Saving input and output with sp_execute_external_script using temporal table and file table (part #2)][9]. In last week's [roundup][10], I mentioned how [Tomaz][11] tries to figure out how to see what statements have been executed from `sp_execute_external_script`. This is part two of the "saga"
* [SQL Agent and the hairiest Dateadd in town][12]. Another "epic" drill down in the bowels of SQL Server by [Ewald][ew], this time trying to find about weird `DATEADD` behavior.
* [SQL Server Mysteries: The Case of the Not 100% RESTORE…][13]. Awesome "spelunking" by [Bob Ward][bw], where he tries to figure out why `RESTORE` doesn't work as expected!
* [SQL Server 2017 Community Technology Preview 2.0 now available][14]. **READ ALL ABOUT IT**, and then go and download the bits. **SQL Server 2017** CTP 2.0 is available for download.

## Data Science

* [Data Preparation Pipelines: Strategy, Options and Tools][15]. Article from [InfoQ][iq] about how data preparation is an important aspect of data processing and analytics use cases, and how business analysts and data scientists spend about 80% of their time gathering and preparing the data rather than analyzing it or developing machine learning models.
* [Microsoft R Server 9.1 now available][16]. My friends over at [Revolution Analytics][re], also watched (or attended) **Microsoft Data Amp** and blogs about how **Microsoft R Server 9.1** is now available, and some of the new interesting features in it.
* [Deep Learning on the New Ubuntu-Based Data Science Virtual Machine for Linux][17]. Microsoft’s Data Science Virtual Machine (DSVM) is a family of popular VM images published on the Azure marketplace with a broad choice of machine learning and data science tools. Microsoft is extending it with the introduction of a brand-new offering in this family – the Data Science Virtual Machine for Linux, based on Ubuntu 16.04LTS – that also includes a comprehensive set of popular deep learning frameworks.
* [Deep Learning with Caffe2 on the Azure Data Science Virtual Machine][18]. Caffe has been one such early and popular open source deep learning framework. It has now been rewritten and greatly improved in the latest iteration, named Caffe2. Microsoft and Facebook have worked together to bring Caffe2 to Azure on the Data Science Virtual Machine (DSVM) which can run on either GPU or CPU based virtual machines on the cloud.
* [Delivering AI with data: the next generation of Microsoft’s data platform][19]. An overview of Microsoft's offerings in he data and AI space.

## Shameless Self Promotion

Some "plugs" about a couple of recent blog-posts by yours truly.

* [SQL Server 2017 - Python Executing Inside SQL Server][20]. Straight after the **Microsoft Data Amp** event I downloaded **SQL Server 2017** and started ~~playing around~~, (erm, I mean) researching. This post is a "Hello World" Python running in **SQL Server 2017**. There will be more posts coming about Python in **SQL Server 2017**.
* [Microsoft SQL Server R Services - Internals IV][21]. The fourth post in the **Microsoft SQL Server R Services - Internals** "saga". In this episode, the fearless hero (me) looks more into process creation, process pools and other cool stuff!

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ch9]: https://channel9.msdn.com
[1]: https://channel9.msdn.com/Events/Data-Science/Microsoft-Data-Amp-2017
[2]: https://channel9.msdn.com/Events/Data-Science/Microsoft-Data-Amp-2017/Keynote-Scott-Guthrie
[3]: https://channel9.msdn.com/Events/Data-Science/Microsoft-Data-Amp-2017/Keynote-Joseph-Sirosh
[4]: https://channel9.msdn.com/Events/Data-Science/Microsoft-Data-Amp-2017/SQL-Server-2017-Building-applications-using-graph-data
[5]: https://channel9.msdn.com/Events/Data-Science/Microsoft-Data-Amp-2017/SQL-Server-2017-Advanced-Analytics-with-Python
[6]: https://channel9.msdn.com/Events/Data-Science/Microsoft-Data-Amp-2017/Whats-new-in-R-Server-91-and-SQL-Server-R-Services
[7]: https://channel9.msdn.com/Events/Data-Science/Microsoft-Data-Amp-2017/SQL-Server-2017-Adaptive-Query-Processing
[8]: https://www.infoq.com/news/2017/04/CSharp-Nullable
[9]: https://tomaztsql.wordpress.com/2017/04/17/saving-input-and-output-with-sp_execute_external_script-using-temporal-table-and-file-table-part-2/
[10]: {{< relref "2017-04-16-interesting-stuff---week-15.markdown" >}}
[11]: https://tomaztsql.wordpress.com
[12]: http://sqlonice.com/sql-agent-and-the-hairiest-dateadd-in-town/
[13]: https://blogs.msdn.microsoft.com/bobsql/2017/04/21/sql-server-mysteries-the-case-of-the-not-100-restore/
[bw]: https://twitter.com/bobwardms
[14]: https://blogs.technet.microsoft.com/dataplatforminsider/2017/04/19/sql-server-2017-community-technology-preview-2-0-now-available/
[15]: https://www.infoq.com/news/2017/04/stirman-data-preparation
[16]: http://blog.revolutionanalytics.com/2017/04/microsoft-r-server-91-now-available.html
[17]: https://blogs.technet.microsoft.com/machinelearning/2017/04/18/deep-learning-on-the-new-ubuntu-based-data-science-virtual-machine-for-linux/
[18]: https://blogs.technet.microsoft.com/machinelearning/2017/04/18/deep-learning-with-caffe2-on-the-azure-data-science-virtual-machine/
[19]: https://blogs.technet.microsoft.com/dataplatforminsider/2017/04/19/delivering-ai-with-data-the-next-generation-of-microsofts-data-platform/
[20]: {{< relref "2017-04-20-sql-server-2017---python-executing-from-sql.markdown" >}}
[21]: {{< relref "2017-04-23-microsoft-sql-server-r-services---internals-iv.markdown" >}}
