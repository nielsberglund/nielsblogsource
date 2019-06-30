---
layout: post
title: Interesting Stuff - Week 27
author: nielsb
date: 2018-07-08T12:11:28+02:00
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
  - Confluent Platform
  - Azure Event Hubs
  - Python
description: Apache Kafka, Azure Event Hubs, Databricks, event driven microservices, SQL Server Machine Learning Services and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - Databricks
  - Confluent Platform
  - Azure Event Hubs
  - Python   
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

## Cloud

* [IP filtering for Event Hubs and Service Bus][1]. A frequently asked for feature in Azure Event Hubs is the ability to restrict access to the Event Hubs to certain well-known sites, alternatively rejecting traffic from specific IP addresses. The Azure team has now announced a public preview of IP filtering.
* [Build a Mobile Gaming Events Data Pipeline with Databricks Delta][2]. This blog post shows how to build a data pipeline in AWS using the [Databricks Unified Analytics Platform][3]. Even though they in the blog post use AWS it should be possible to do the same on Azure since Databricks is now available there as well.

## .NET

* [.NET JIT and CLR - Joined at the Hip][4]. This is another excellent blog post by [Matthew][mattw], looking at how the .NET JIT compiler works together with CLR.

## Distributed Computing

* [QCon NY: Jonas Bonér on Designing Events-First Microservices][5]. An [InfoQ][iq] article summarising a QCon talk by [Jonas Bonér][6] of [Akka][7] fame. The main point Jonas makes is that events-first domain-driven design (DDD) and event streaming are critical in a microservices based architecture. Oh and by th way, if you are interested in event-driven systems and microservices go and download Jonas mini-book [Reactive Microsystems - The Evolution Of Microservices At Scale][8].

## Streaming

* [June Preview Release: Packing Confluent Platform with the Features You Requested!][9]. A blog post by the Confluent team announcing the latest preview release of Confluent Platform. This release packs quite a few new features, and I am especially interested in the KSQL support for nested data as well as the ability to join two streams together.
* [Experiences from Building an Event-Sourced System with Kafka Streams][10]. An article from [InfoQ][iq] about how engineers at [Wix][11] built an event sourced system using [Kafka Streams][12].

## Data Science

* [A Feature Selection Tool for Machine Learning in Python][13]. This blog post is about a Python tool that helps with feature selection in a dataset.
* [A Complete Machine Learning Project Walk-Through in Python: Part One][14]. First post in a series walking through a complete Python machine learning solution.

## SQL Server Machine Learning Services

* [sp_execute_external_script and SQL Compute Context - II][ctx2]. I finally published part 2 of the [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) series. In the post, I tried to figure out why the performance is so much better when executing in a **SQL Server Compute Context** in **SQL Server ML Services** compared to executing in the local context (it is SQL Server after all). Even though I "sort of" figured it out, a few questions arose and hopefully I can answer those questions in a future post. 

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

[1]: https://azure.microsoft.com/en-us/blog/ip-filtering-for-event-hubs-and-service-bus/
[2]: https://databricks.com/blog/2018/07/02/build-a-mobile-gaming-events-data-pipeline-with-databricks-delta.html
[3]: https://databricks.com/product/unified-analytics-platform
[4]: http://mattwarren.org/2018/07/05/.NET-JIT-and-CLR-Joined-at-the-Hip/
[5]: https://www.infoq.com/news/2018/07/boner-events-first-microservices
[6]: http://jonasboner.com/
[7]: https://akka.io/
[8]: https://www.lightbend.com/blog/reactive-microsystems-the-evolution-of-microservices-at-scale-free-oreilly-report-by-jonas-boner
[9]: https://www.confluent.io/blog/june-preview-release-confluent-plaform/
[10]: https://www.infoq.com/news/2018/07/event-sourcing-kafka-streams
[11]: https://www.wix.com/
[12]: https://kafka.apache.org/documentation/streams/
[13]: https://towardsdatascience.com/a-feature-selection-tool-for-machine-learning-in-python-b64dd23710f0
[14]: https://towardsdatascience.com/a-complete-machine-learning-walk-through-in-python-part-one-c62152f39420


<!-- [series1]: <> [SQL Server R Services](/sql_server_2k16_r_services) -->
<!-- [series2]: <> [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) -->
<!-- [series3]: <> [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) -->

[ctx2]: {{< relref "2018-07-07-sp-execute-external-script-and-sql-compute-context-II.markdown" >}}
