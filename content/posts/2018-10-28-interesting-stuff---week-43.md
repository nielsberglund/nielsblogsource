---
type: post
layout: "post"
title: Interesting Stuff - Week 43
author: nielsb
date: 2018-10-28T07:44:55+02:00
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
  - kafka
  - flink
  - Azure Machine Learning Service
  - Azure Automated ML
  - kubernetes
description: Kafka, Kafka and Kubernetes, Flink, Azure Automated Machine Learning, and other topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - flink
  - Azure Machine Learning Service
  - Azure Automated ML
  - kubernetes   
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

## Data Science

* [Announcing automated ML capability in Azure Machine Learning][1]. Somehow I must have missed this post announcing **Azure Automated Machine Learning**. What is it? Well, it is a way for the [Azure Machine Learning Service][2] to automatically pick an algorithm for you, and generate a model from it. It sounds really interesting, and this is something I need to take a look at.

## Streaming

* [That’s a Wrap! Kafka Summit San Francisco 2018 Roundup][3]. The San Francisco [Kafka Summit][4] ran October 16 - 17, and this blog post is a summary of the conference. It also has links to some interesting sessions, and out of those, these are my three favorites:

    * [Zen and the Art of Streaming Joins—The What, When and Why][5].
    * [Kafka Security 101 and Real-World Tips][6].
    * [Breaking Down a SQL Monolith with Change Tracking, Kafka and KStreams/KSQL][7].

* [Stateful Stream Processing: Apache Flink State Backends][8]. This post explores stateful stream processing and more precisely the different state backends available in Apache Flink. It presents the 3 state backends of Apache Flink, their limitations and when to use each of them depending on case-specific requirements.
* [Apache Kafka on Kubernetes – Could you? Should you?][9]. This is a post discussing whether you should run Kafka on Kubernetes or not. At [work](/derivco), we are in the process of rolling out our first Kafka deployments, (not on Kubernetes), and this post definitely gives us "food for thought".

## WIND (What Is Niels Doing)

Yeah, I kind of ask myself that question as well (what am I doing): at the moment I have a hard time getting any blog posts out, as I am busy at work as well as trying to get to grips with **SQL Server 2019 Big Data Clusters**. I hope to be able to publish something in a week (or twos) time.

In the meantime, if you are interested in **SQL Server 2019**, go and have a read at these two posts:

* [What is New in SQL Server 2019 Public Preview][13].
* [SQL Server 2019 for Linux in Docker on Windows][14].

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
[adsit]: https://twitter.com/SitnikAdam
[vicky]: https://twitter.com/vickyharp

[1]: https://azure.microsoft.com/en-us/blog/announcing-automated-ml-capability-in-azure-machine-learning/
[2]: https://azure.microsoft.com/en-us/services/machine-learning-service/
[3]: https://www.confluent.io/blog/kafka-summit-san-francisco-2018-roundup
[4]: https://kafka-summit.org/events/kafka-summit-san-francisco-2018/
[5]: https://www.confluent.io/kafka-summit-sf18/zen-and-the-art-of-streaming-joins
[6]: https://www.confluent.io/kafka-summit-sf18/kafka-security-101-and-real-world-tips
[7]: https://www.confluent.io/kafka-summit-sf18/breaking-down-a-sql-monolith
[8]: https://data-artisans.com/blog/stateful-stream-processing-apache-flink-state-backends
[9]: https://www.confluent.io/blog/apache-kafka-kubernetes-could-you-should-you
[13]: {{< relref "2018-09-24-sql-server-2019-public-preview.md" >}}
[14]: {{< relref "sql-server-2019-for-linux-in-docker-on-windows.md" >}}

