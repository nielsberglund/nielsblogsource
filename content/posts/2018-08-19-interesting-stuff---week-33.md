---
type: post
layout: "post"
title: Interesting Stuff - Week 33
author: nielsb
date: 2018-08-19T09:20:03+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Kafka
  - KSQL
  - Databricks
  - Azure Kubernetes
  - SQL Saturday
description: Kafka, Databricks, Cosmos DB, Azure Kubernetes, SQL Saturday and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Kafka
  - KSQL
  - Databricks
  - Azure Kubernetes
  - SQL Saturday   
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

## Distributed Computing

* [Canopy: Scalable Distributed Tracing & Analysis @ Facebook][1]. This post links to an [InfoQ][iq] presentation about **Canopy**, which is Facebook's performance and efficiency tracing infrastructure. The presentation covers lessons learned applying Canopy and present case studies of its use in solving various performance and efficiency challenges. Very interesting!
* [Designing Distributed Systems][2]. A download link to an e-book: **Designing Distributed Systems**. The e-book provides repeatable, generic patterns, and reusable components to make developing reliable systems easier and more efficient. It is written by [Brendan Burns][brendan] who is a Distinguished Engineer at Microsoft and works on Azure.

## Cloud

* [Schema-Agnostic Indexing with Azure Cosmos DB][3]. In this blog post, [Murat][murba] dissects a white paper about the schema-agnostic indexing subsystem of Cosmos DB. The post (and the paper) is very interesting, go ahead and read it, please!
* [Azure #HDInsight Interactive Query: simplifying big data analytics architecture][4]. This post discusses a new feature of Hive 2, Low Latency Analytics Processing (LLAP). LLAP produces significantly faster queries on raw data stored in commodity storage systems such as Azure Blob store or Azure Data Lake Store. This is quite exciting, and I need to check it out!

## Streaming

* [How to Build a UDF and/or UDAF in KSQL 5.0][5]. Not one week without at least one Kafka related post - that is the "law". This post discusses a new feature in **KSQL** 5, the ability for the users o write their own functions for KSQL to use. Think about the possibilities that open up!

## Data Science / AI

* [Neural Networks from a Bayesian Perspective][6]. This post covers different ways to obtain uncertainty in Deep Neural Networks from a Bayesian perspective. The post is quite theoretical but very interesting!
* [100x Faster Bridge between Apache Spark and R with User-Defined Functions on Databricks][7]. Spark exposes an API, SparkR User Defined Function API, which acts as a bridge between Spark and R. Unfortunately the bridge is far from efficient. Databricks has made the bridge more efficient when you run Spark on Databricks, and this post talks about how it is done.
* [The most important part of a data science project is writing a blog post][8]. A somewhat provocative title of this blog post, but it makes a good point. Always document your data science projects so other data scientists can see what you have achieved!

## SQL Saturday

It is that time of the year again: SQL Saturday season! As usual I present in Johannesburg, Cape Town and Durban:

* [Johannesburg][sqlsatjhb], September 1: 
    * [Overview SQL Server Machine Learning Services][sqlsatjhb_1].
* [Cape Town][sqlsatcpt], September 8:
    * [Azure Machine Learning][sqlsatcpt_ml].
    * [The Ins and Outs of sp_execute_external_script][sqlsatcpt_sp].
* [Durban][sqlsatdbn], September 15:
    * [The Ins and Outs of sp_execute_external_script][sqlsatdbn_sp].

Even if you are not interested in the topics I present, please register and come and listen to a lot of interesting talks by some of the industry's brightest people.

### PreCon

This year I also do precons in Cape Town and Durban on the Friday before the SQL Saturday event. My precons is a day where we talk about **SQL Server Machine Learning Services**, what it is and what we can do with it. It is in a format so if you want you can bring your laptop and code along as the day progresses.

The precon is not free, but hey ...

* [Cape Town, September 7 - A Drill Down Into SQL Server Machine Learning Services with Niels Berglund][sqlsatcpt_pre].
* [Durban, September 14 - A Day of SQL Server Machine Learning Services with Niels Berglund][sqlsatdbn_pre].

Even though the titles of the precons are different, I cover the same material.

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
[brendan]: https://twitter.com/brendandburns

[1]: https://www.infoq.com/presentations/canopy-scalable-tracing-analytics-facebook
[2]: https://azure.microsoft.com/en-us/resources/designing-distributed-systems/
[3]: http://muratbuffalo.blogspot.com/2018/08/schema-agnostic-indexing-with-azure.html
[4]: https://azure.microsoft.com/en-us/blog/azure-hdinsight-interactive-query-simplifying-big-data-analytics-architecture-and-operations/
[5]: https://www.confluent.io/blog/build-udf-udaf-ksql-5-0
[6]: https://www.datasciencecentral.com/profiles/blogs/neural-networks-from-a-bayesian-perspective
[7]: https://databricks.com/blog/2018/08/15/100x-faster-bridge-between-spark-and-r-with-user-defined-functions-on-databricks.html
[8]: https://towardsdatascience.com/the-most-important-part-of-a-data-science-project-is-writing-a-blog-post-50715f37833a

[sqlsatjhb]: http://www.sqlsaturday.com/785/EventHome.aspx
[sqlsatjhb_1]: http://www.sqlsaturday.com/785/Sessions/Details.aspx?sid=84967
[sqlsatcpt]: http://www.sqlsaturday.com/793/EventHome.aspx
[sqlsatcpt_ml]: http://www.sqlsaturday.com/793/Sessions/Details.aspx?sid=84975
[sqlsatcpt_sp]: http://www.sqlsaturday.com/793/Sessions/Details.aspx?sid=84978
[sqlsatcpt_pre]: https://www.quicket.co.za/events/47683-sqlsaturday-cape-town-2018-precon-a-drill-down-into-sql-server-machine-learning/#/
[sqlsatdbn]: http://www.sqlsaturday.com/803/EventHome.aspx
[sqlsatdbn_sp]: http://www.sqlsaturday.com/803/Sessions/Details.aspx?sid=85097
[sqlsatdbn_pre]: https://www.quicket.co.za/events/55545-sqlsaturday-durban-precon-2018-a-day-of-sql-server-machine-learning-services/#/
