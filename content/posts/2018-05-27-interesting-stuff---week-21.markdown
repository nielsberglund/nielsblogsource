---
layout: post
title: Interesting Stuff - Week 21
author: nielsb
date: 2018-05-27T11:06:31+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - flink
  - ksql
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - SQL Server on Linux
  - Azure
  - Azure Data Science Virtual Machine
description: Kafka, Flink, SQL Server on Linux, Azure Data Science Virtual Machine and other interesting topics!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - flink
  - ksql
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - SQL Server on Linux
  - Azure
  - Azure Data Science Virtual Machine   
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

## SQL Server & Other Database Systems

* [SQL Server on Linux: Quick Performance Monitoring][1]. A blog post by [Bob Dorr][rdorr] where he talks about how we can get a Performance Monitor like view on Linux for SQL Server.
* [MySQL Version 8 Adds Document Store, Performance and Security Improvements][2]. An [InfoQ][iq] article about new functionality in the latest version of MySQL. What caught my eye was the support for document store. I guess, depending on how it is done, having a combination of Document Store and a relational database can be very powerful.

## Streaming

* [Apache Flink 1.5.0 Release Announcement][3]. This post announces the release of Flink version 1.5.0. There are quite a few new exciting features, among them: broadcast state, task-local state recovery and support for windowed outer equi-joins in the SQL and Table API's. I have just set up a new CentOS 7 virtual machine so I can check this out.
* [New Confluent Cloud Professional, and Ecosystem Expansion to Google Cloud Platform][4]. I do not know if you knew this - but there is a rule saying that if there is an announcement from Flink, there also has to be an announcement from Kafka (and visa versa). So, the Kafka announcement is that the Confluent Cloud is now also available on the Google Cloud (in addition to AWS). I really hope to see Azure being in the mix in a not too distant future.

## .NET

* [Discussions on the Future of .NET Core][5]. An [InfoQ] article where five industry veterans discuss the .NET Core platform. Some takeaways: 
    * The .NET Core platform provides significant performance benefits as compared to the traditional .NET Framework.
    * .NET Core benefits from a server-centric design that is not Windows-focused.
    * .NET Core is now a stable platform suitable for new application development.

## Distributed Computing

* [Open Sourcing Zuul 2][6]. An announcement from Netflix, how they are now open-sourcing their cloud gateway: **Zuul 2**. A very interesting point in the post was where it discussed anomaly detection and contextual alerting.

## Data Science

* [Data Pipelines for Real-time Fraud Prevention at Scale][7]. An [InfoQ][iq] presentation about the architecture of PayPal’s data service which combines a Big Data approach with providing data in real time for decision making in fraud detection.
* [Pixie: a system for recommending 3+ billion items to 200+ million users in real-time][8]. A white paper dissected by [Adrian][adcol] describing how Pinterest has built a system for recommending 3+ billion items to 200+ million users in real-time!
* [Enterprise Deployment Tips for Azure Data Science Virtual Machine (DSVM)][9]. I came across this post thanks to [Luis][luis] and his weekly [newsletter][luislettr]. The post he pointed to is about the Azure Data Science Virtual Machine (DSVM) and how to use and deploy in an enterprise environment. This topic is especially interesting right now as we at [Derivco](/derivco) is looking at the DSVM. Thanks [Luis][luis]!

## SQL Server Machine Learning Services

In lasts week [roundup][wr20_18] I mentioned how I probably have to write some follow up posts to the [sp_execute_external_script and SQL Compute Context - I][ctx1] post I published a week ago. I have now started with the first follow up post, and I hope I can publish it in a week or two. 

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com

[luislettr]: https://www.getrevue.co/profile/datascienceweekly/

[rdorr]: https://blogs.msdn.microsoft.com/bobsql/

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


[series]: <> (/series/sql_server_2k16_r_services)

[1]: https://blogs.msdn.microsoft.com/bobsql/2018/05/20/sql-server-on-linux-quick-performance-monitoring/
[2]: https://www.infoq.com/news/2018/05/mysql8
[3]: https://data-artisans.com/blog/apache-flink-1-5-0-release-announcement
[4]: https://www.confluent.io/blog/confluent-cloud-pro-gcp/
[5]: https://www.infoq.com/articles/future-of-net-core
[6]: https://medium.com/netflix-techblog/open-sourcing-zuul-2-82ea476cb2b3
[7]: https://www.infoq.com/presentations/paypal-data-service-fraud
[8]: https://blog.acolyer.org/2018/05/23/pixie-a-system-for-recommending-3-billion-items-to-200-million-users-in-real-time/
[9]: https://blogs.technet.microsoft.com/machinelearning/2018/05/21/enterprise-deployment-tips-for-azure-data-science-virtual-machine-dsvm

[wr20_18]: {{< relref "2018-05-20-interesting-stuff---week-20.markdown" >}}


[ctx1]: {{< relref "2018-05-20-sp-execute-external-script-and-sql-compute-context.markdown" >}}
