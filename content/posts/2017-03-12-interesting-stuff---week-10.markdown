---
layout: post
title: Interesting Stuff - Week 10
author: nielsb
date: 2017-03-12T07:39:45+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - R
  - SQL Server R Services
  - Microsoft R Server
  - R Tools for Visual Studio
  - SQL Server 2016
description: Weekly roundup of what interesting stuff I have read in blogs etc.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - R
  - SQL Server R Services
  - Microsoft R Server
  - R Tools for Visual Studio
  - SQL Server 2016   
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

## Data Science

* [Deep Learning for Sensor Fusion and Sequence Classification][1]. Faisal discusses how the [Microsoft Cognitive Toolkit][2] can be used for sequence classification.
* [Data Preprocessing vs. Data Wrangling in Machine Learning Projects][3]. Article from [InfoQ][iq], which compares different alternative techniques to prepare data for machine learning. Techniques include extract-transform-load (ETL) batch processing, streaming ingestion and data wrangling.
* [TensorFlow 1.0 Released][4]. Another article from [InfoQ][iq]. This article is about the release of Google's [TensorFlow][5].
* [rxNeuralNet vs. xgBoost vs. H2O][6]. In version 9.0.3 of [Microsoft R Server][7], Microsoft has introduced a new package for Microsoft R Server; [MicrosoftML][8]. The package brings new machine learning functionality with improvements in speed, performance and scalability. In Tomaz blog-post he puts the new functionality to test.
* [Microsoft Data Science Newsletter][9]. If you are interested in what Microsoft is doing in data science you should definitely subscribe to the monthly newsletter.
* [Employee Retention with R Based Data Science Accelerator][10]. Cool "stuff from" [Revolution Analytics][ra] about how to use R to analyze employee retention.
* [Announcing R Tools for Visual Studio][11]. R Tools for Visual Studio has been released! 

# Distributed Computing

* [Redundancy does not imply fault tolerance: analysis of distributed storage reactions to single errors and corruptions][12]. [Adrian][mp] dissects a white-paper pertaining to how distributed storage reacts to errors and corruptions. My conclusion; be afraid, be very afraid!

## SQL Server

* [Why PFS pages cannot be repaired][13]. Paul Randal from [SQLskills][14] fame explains why DBCC CHECKDB cannot repair Page Free Space pages. Very cool "stuff"!
* [SQL  Server  on  Linux, will it perform?][15]. This is the slide deck from [Slava Oks][16] presentation at QCon in London this year about SQL Server on Linux. Amazing! Cannot wait for the video to be published!
* [Context in perspective 1: What the CPU sees in you][17]. [Ewald][18] has a series about context in SQL Server, and this is the first post. So, so interesting! As a side note; you should really follow [Ewald's blog][18] if you are interested in various and sundry, deeply technical topics of how SQL Server works under the covers! WinDbg FTW!

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ra]: http://blog.revolutionanalytics.com
[1]: https://fwaris.wordpress.com/2017/03/04/deep-learning-for-sensor-fusion-and-sequence-classification/
[2]: https://github.com/Microsoft/CNTK/wiki
[3]: https://www.infoq.com/articles/ml-data-processing
[4]: https://www.infoq.com/news/2017/03/TensorFlow-Release-1
[5]: https://en.wikipedia.org/wiki/TensorFlow
[6]: https://tomaztsql.wordpress.com/2017/02/20/rxneuralnet-vs-xgboost-vs-h2o/
[7]: https://msdn.microsoft.com/en-us/microsoft-r/microsoft-r-getting-started
[8]: https://msdn.microsoft.com/microsoft-r/microsoftml-introduction
[9]: https://info.microsoft.com/advanced-analytics-data-science-newsletter.html
[10]: http://blog.revolutionanalytics.com/2017/03/employee-retention.html
[11]: https://blogs.technet.microsoft.com/machinelearning/2016/03/09/announcing-r-tools-for-visual-studio-2/
[12]: https://blog.acolyer.org/2017/03/08/redundancy-does-not-imply-fault-tolerance-analysis-of-distributed-storage-reactions-to-single-errors-and-corruptions/
[13]: https://www.sqlskills.com/blogs/paul/why-pfs-pages-cannot-be-repaired/
[14]: https://www.sqlskills.com
[15]: https://qconlondon.com/system/files/presentation-slides/slavaoks_sqlpal_qconfinal.pdf
[16]: https://blogs.msdn.microsoft.com/slavao
[17]: http://sqlonice.com/context-in-perspective-1-what-the-cpu-sees-in-you/
[18]: http://sqlonice.com
