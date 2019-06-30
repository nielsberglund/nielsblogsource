---
layout: post
title: Interesting Stuff - Week 28
author: nielsb
date: 2018-07-15T06:15:28+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - kafka
  - R
  - ML.NET
description: Kafka in Azure, Kafka on Windows, ML.NET R new version and other interesting topics.
keywords:
  -   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending.

<!--more-->

## .NET

* [System.IO.Pipelines: High performance IO in .NET][1]. A blog post which announces `System.IO.Pipelines` which is a new library that is designed to make it easier to do high performance IO in .NET. I wish it had been around when we wrote socket code, way back when.

## Distributed Computing

* [Evolution of Application Data Caching : From RAM to SSD][2]. A blog post about Netflix and how they move from purely RAM based caches to a hybrid between RAM and SSD. Very, very interesting!
* [Auto Scaling Production Services on Titus][3]. This blog post, also from Netflix, discusses auto-scaling on their container management system [Titus][4]. It is interesting to read how the interaction happens between the AWS Auto Scaling engine and Titus.

## Streaming

* [Kafka 1.0 on HDInsight lights up real-time analytics scenarios][6]. This Microsoft blog post discusses the advantages that Kafka 1.0 on Azure HDInsight provides for data scientists and data analysts.
* [Install Confluent Platform (Kafka) on Windows][9]. This post from yours truly discusses we can install Kafka, in the guise of Confluent Platform, on Windows Subsystem for Linux (WSL). Useful if you, like me, is a Windows dude (or dudette) and you want to run Kafka locally on your development box.

## Data Science

* [R 3.5.1 update now available][5]. This post by [David][revod] talks about the new version of R: 3.5.1.
* [Announcing ML.NET 0.3][7]. At Build 2018 Microsoft released ML.NET 0.1, a cross-platform, open source machine learning framework for .NET developers, and I posted about it in the [week 19 roundup][ml01]. A month or two later they released ML.NET 0.2 which I covered in the roundup for [week 23][ml02]. It is now time for ML.NET 0.3 with quite a few new enhancements. What interests me is to see what "cool" new features application developers dreams up with this.
* [R for AI developers][8]. So, [David][revod] is at it again. This time he did a presentation at QCon.ai where he makes a case for R as a platform for developing models for intelligent applications. The presentation is a must-see!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/

[jovpop]: https://twitter.com/JovanPop_MSFT
[bobw]: https://twitter.com/bobwardms
[revod]: https://twitter.com/revodavid
[lonny]: https://twitter.com/sqL_handLe
[ewtw]: https://twitter.com/sqlOnIce
[buckw]: https://twitter.com/BuckWoodyMSFT
[mattw]: https://twitter.com/matthewwarren
[murba]: https://twitter.com/muratdemirbas
[daveda]: https://twitter.com/davidthecoder
[adcol]: https://twitter.com/adriancolyer
[jesrod]: https://twitter.com/jrdothoughts
[tomaz]: https://twitter.com/tomaz_tsql
[dataart]: https://twitter.com/dataartisans
[luis]: https://twitter.com/luis_de_sousa
[benstop]: https://twitter.com/benstopford
[conflu]: https://twitter.com/confluentinc
[tylert]: https://twitter.com/tyler_treat
[andrewng]: https://twitter.com/AndrewYNg
[lawr]: https://twitter.com/bytezn
[jue]: https://twitter.com/b0rk
[yan]: https://twitter.com/theburningmonk
[danny]: https://twitter.com/g9yuayon
[rmoff]: https://twitter.com/rmoff
[ryansw]: https://twitter.com/ryanswanstrom
[pabloc]: https://twitter.com/pabloc_ds
[mklep]: https://twitter.com/martinkl
[mdavey]: https://twitter.com/matt_davey
[jboner]: https://twitter.com/jboner

[1]: https://blogs.msdn.microsoft.com/dotnet/2018/07/09/system-io-pipelines-high-performance-io-in-net/
[2]: https://medium.com/netflix-techblog/evolution-of-application-data-caching-from-ram-to-ssd-a33d6fa7a690
[3]: https://medium.com/netflix-techblog/auto-scaling-production-services-on-titus-1f3cd49f5cd7
[4]: https://medium.com/netflix-techblog/titus-the-netflix-container-management-platform-is-now-open-source-f868c9fb5436
[5]: http://blog.revolutionanalytics.com/2018/07/r-351-update-now-available-.html
[6]: https://azure.microsoft.com/en-us/blog/kafka-1-0-on-hdinsight-lights-up-real-time-analytics-scenarios/
[7]: https://blogs.msdn.microsoft.com/dotnet/2018/07/09/announcing-ml-net-0-3/
[8]: https://www.infoq.com/presentations/r-framework-ai-apps
[9]: {{< relref "2018-07-10-install-confluent-platform-kafka-on-windows.markdown" >}}

[ml01]: {{< relref "2018-05-13-interesting-stuff---week-19.markdown" >}}
[ml02]: {{< relref "2018-06-10-interesting-stuff---week-23.markdown" >}}


<!-- [series1]: <> [SQL Server R Services](/series/sql_server_2k16_r_services) -->
<!-- [series2]: <> [Install R Packages in SQL Server ML Services](/series/sql_server_ml_services_install_packages) -->
<!-- [series3]: <> [sp_execute_external_script and SQL Server Compute Context](/series/spees_and_sql_compute_context) -->

<!-- [findstr]: <> findstr /I <word_to_find> * -->

