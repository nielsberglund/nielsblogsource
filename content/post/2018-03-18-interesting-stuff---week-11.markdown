---
layout: post
title: Interesting Stuff - Week 11
author: nielsb
date: 2018-03-18T20:20:08+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Microsoft Machine Learning Server
  - Azure SQL Database Managed Instance
  - micro-services
  - kafka
  - events
  - flink
  - Service Fabric
  
description: Networking for Azure SQL Managed Instance databases, events and more events, Service Fabric, events and Kafka, new features in Flink, plus other cool things!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Microsoft Machine Learning Server
  - Azure SQL Database Managed Instance
  - micro-services
  - kafka
  - events
  - flink
  - Service Fabric   
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

## SQL Server

* [How to configure network for Azure SQL Managed Instance][1]. In last weeks [roundup][wr10_18] I had a link to a [post][2] about **Azure SQL Database Managed Instance**. In the post I link to this week, [Jovan][jovpop] explains how to configure the network for a Managed Instance.

## Distributed Computing

* [Events Are Reshaping the Future of Distributed Systems: Jonas Bonér at QCon London][3]. A summary of a QCon presentation by [Jonas Bonér][4], where he talked about events and distributed systems and how eventual consistency should be default.
* [QCon London: Asynchronous Event Architectures with or without Actors][5]. Another summary of a QCon presentation. This time about asynchronous event communication in microservices systems.
* [Real-Time Data Activation - Analytics, Intelligence & Decision Making][6]. Presentaion from [InfoQ][iq] about dealing with real-time analytics with the Lambda Architecture, creating a working data set and data-driven features in an application.

## .NET

* [Service Fabric is going open source][8]. A blog post announcing Microsoft taking Service Fabric fully open source. Wohoo!!

## Streaming

* [Event sourcing using Kafka][7]. Kafka has recently introduced some new features which makes it pretty straightforward to do event sourcing on top of Kafka. This post tells us all about it. I found the post very interesting! 
* [Apache Flink Master Branch Monthly: New in Flink in February 2018][9]. Roundup of new features that were merged into Flink’s master branch during February 2018 but aren’t yet part of a stable release.
* [No More Silos: How to Integrate your Databases with Apache Kafka and CDC][10]. Oooh, this is so interesting! A post about how to get data from your database(s) into Kafka. Did I mention this is interesting?!

## Misc.

* [Developer Survey Results 2018][11]. Each year, StackOverflow asks the developer community about everything from their favorite technologies to their job preferences. This year over 100,000 developers took the 30-minute survey this past January, and here are the results!

## Data Science

* [Demystifying Docker for Data Scientists – A Docker Tutorial for Your Deep Learning Projects][12]. A very interesting post about how Docker can be used in a Data Science environment. Must Read!!

## SQL Server R Services

I am working on the last post in the **Microsoft SQL Server R Services** series, and I hope to publish it this coming week!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

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
[buckw]: https://twitter.com/BuckWoodyMSFT
[mattw]: https://twitter.com/matthewwarren
[murba]: https://twitter.com/muratdemirbas
[daveda]: https://twitter.com/davidthecoder
[adcol]: https://twitter.com/adriancolyer
[jesrod]: https://twitter.com/jrdothoughts
[tomaz]: https://twitter.com/tomaz_tsql
[dataart]: https://twitter.com/dataartisans
[luis]: https://twitter.com/luis_de_sousa

[wr10_18]: {{< relref "2018-03-11-interesting-stuff---week-10.markdown" >}}

[1]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2018/03/14/how-to-configure-network-for-azure-sql-managed-instance/
[2]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2018/03/07/what-is-azure-sql-database-managed-instance-2/
[3]: https://www.infoq.com/news/2018/03/events-distributed-systems
[4]: http://jonasboner.com/
[5]: https://www.infoq.com/news/2018/03/asynchronous-event-architectures
[6]: https://www.infoq.com/presentations/real-time-data-activation
[7]: https://blog.softwaremill.com/event-sourcing-using-kafka-53dfd72ad45d
[8]: https://blogs.msdn.microsoft.com/azureservicefabric/2018/03/14/service-fabric-is-going-open-source/
[9]: https://data-artisans.com/blog/apache-flink-master-branch-monthly-whats-new-flink-february-2018
[10]: https://www.confluent.io/no-more-silos-how-to-integrate-your-databases-with-apache-kafka-and-cdc
[11]: https://insights.stackoverflow.com/survey/2018/#technology-most-loved-dreaded-and-wanted-databases
[12]: https://blogs.technet.microsoft.com/machinelearning/2018/03/15/demystifying-docker-for-data-scientists-a-docker-tutorial-for-your-deep-learning-projects/
