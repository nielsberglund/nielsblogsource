---
layout: post
title: Interesting Stuff - Week 31
author: nielsb
date: 2018-08-05T08:01:44+02:00
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
  - Databricks
  - Databricks Delta
  - AI
  - flink
description: Kafka (of course), Flink, Databricks Delta, RxSqlServerData and other interesting topics..
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - Databricks
  - Databricks Delta
  - AI
  - flink   
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

* [Tiered Compilation Preview in .NET Core 2.1][1]. A blog-post about a new feature in .NET Core 2.1: **Tiered Compilation**. Tiered Compilation allows .NET to have multiple compilations for the same method that can be hot-swapped at runtime. This should improve compile times drastically!

## Streaming

* [Apache Kafka - Whats That][2]. This post about Kafka is by a colleague and a good friend of mine, [Charl Lamprecht][charl]. In the post, he takes us through a very succinct overview of Kafka. Charl is "Mr Kafka" at [Derivco](/Derivco), and he knows his "stuff". Please be sure to follow his [blog][charlblog] for more about Kafka (Charl, no pressure, hey?!).
* [Decoupling Systems with Apache Kafka, Schema Registry and Avro][3]. An excellent post on how to decouple the systems you integrate via Kafka by using the [Confluent Schema Registry][4]. An added bonus in this post is that the code is .NET code!
* [A Practical Guide to Broadcast State in Apache Flink][5]. This article discusses **Broadcast State**, a new feature in Apache Flink 1.5. With Broadcast State you can evaluate dynamic patterns on event streams by combining and jointly process two streams of events in a specific way.
* [Introducing Confluent Platform 5.0][6]. As the title says, this post introduces the latest version of Confluent Platform: 5.0. Lots and lots of new interesting features. Go and have a look!
* [Apache Kafka for Microservices: A Confluent Online Talk Series][7]. This post is a link to a three-part online talk series which introduces fundamental concepts, use cases and best practices for getting started with microservices and Kafka.

## Big Data / Cloud

* [Processing Petabytes of Data in Seconds with Databricks Delta][8]. In my roundups lately, I have covered Databricks Delta quite a bit and discussed how efficient it is processing lots and lots of data. This blog post takes a look under the hood and examines what makes Databricks Delta capable of sifting through petabytes of data within seconds. If you, like me, are interested in knowing how "stuff" works under the covers, then this post is a must-read!
* [Databook: Turning Big Data into Knowledge with Metadata at Uber][9]. This post is about **Databook**, Uber’s in-house platform that surfaces and manages metadata about the internal locations and owners of specific datasets, and allows Uber to turn data into knowledge.

## Data Science / AI

* [Video: How to run R and Python in SQL Server from a Jupyter notebook][10]. A short post by [David][revod] linking to a video showing how to run Python and R from inside SQL Server.
* [The InfoQ eMag: Real-World Machine Learning: Case Studies, Techniques and Risks][11]. An [InfoQ][iq] link to an eMag focusing on the current landscape of machine-learning technologies and real-world case studies of applied machine learning.
* [3 Steps to Build Your First Intelligent App – Conference Buddy][12]. A blog-post which takes us through how to build an application utilising AI.

## SQL Server Machine Learning Services

* [sp_execute_external_script and SQL Compute Context - III][ctx3]. I finally managed to finish and publish the third post in the [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) series. In this post we use WinDbg, Process Monitor and WireShark to look in detail what happens in SQL Server when we use RxSqlServerData to pull data.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/
[charlblog]: https://charlla.com/

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
[joeduff]: https://twitter.com/funcOfJoe
[charl]: https://twitter.com/charllamprecht
[dbricks]: https://twitter.com/databricks

[1]: https://blogs.msdn.microsoft.com/dotnet/2018/08/02/tiered-compilation-preview-in-net-core-2-1/
[2]: https://charlla.com/whatsthat-kafka/
[3]: https://www.confluent.io/blog/decoupling-systems-with-apache-kafka-schema-registry-and-avro/
[4]: https://www.confluent.io/confluent-schema-registry/
[5]: https://data-artisans.com/blog/a-practical-guide-to-broadcast-state-in-apache-flink
[6]: https://www.confluent.io/blog/introducing-confluent-platform-5-0/
[7]: https://www.confluent.io/landing-page/microservices-online-talk-series/
[8]: https://databricks.com/blog/2018/07/31/processing-petabytes-of-data-in-seconds-with-databricks-delta.html
[9]: https://eng.uber.com/databook/
[10]: http://blog.revolutionanalytics.com/2018/08/r-python-in-sql-server.html
[11]: https://www.infoq.com/minibooks/emag-real-world-machine-learning
[12]: https://blogs.technet.microsoft.com/machinelearning/2018/07/31/3-steps-to-build-your-first-intelligent-app-conference-buddy/

[ctx3]: {{< relref "2018-08-04-sp-execute-external-script-and-sql-compute-context---iii.markdown" >}}

<!-- [series1]: <> [SQL Server R Services](/sql_server_2k16_r_services) -->
<!-- [series2]: <> [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) -->
<!-- [series3]: <> [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) -->


<!-- [findstr]: <> findstr /I <word_to_find> * -->
