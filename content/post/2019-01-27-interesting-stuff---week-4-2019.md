---
type: post
layout: "post"
title: Interesting Stuff - Week 4, 2019
author: nielsb
date: 2019-01-27T06:36:21+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2019
  - SQL Server 2019 Big Data Clusters
  - SQL Server Machine Learning Services
  - Kafka
  - Azure
  - VS Code
description: SQL Server 2019 Big Data Clusters, Kafka, Azure, VS Code, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2019
  - SQL Server 2019 Big Data Clusters
  - SQL Server Machine Learning Services
  - Kafka
  - Azure
  - VS Code   
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

* [Journey to Cloud Architecture][1]. An [InfoQ][iq] presentation discussing the architectural challenges faced turning TFS into Azure DevOps, the evolution of the architecture, and lessons learned along the way.

## Misc.

* [Why Do We Need Architectural Diagrams?][2]. An [InfoQ][iq] article about software architecture diagrams. Software architecture diagrams, when created well, and sparingly, can greatly improve communication within the development team and with external stakeholders. They require an understanding of the intended audience and thoughtful restraint on what to include. Resist the temptation to think that diagrams are unnecessary or unhelpful, simply because there have been plenty of cases of bad diagrams.

## Azure

* [HDInsight Tools for Visual Studio Code now generally available][3]. A post announcing GA (general availability) of HDInsight Tools for **VS Code**. Seeing that I have started using **VS CODE** more and more, this is something I need to check out.
* [Analyze data in Azure Data Explorer using KQL magic for Jupyter Notebook][4]. In this post, Microsoft announces the ability to, from inside a Jupyter Notebook, use *Keyword Query Language* (KQL) to query and analyze data in Azure Data Explorer. Very cool!

## Streaming

* [Confluent Raises a $125M Series D Funding Round][5]. This blog post is about how Confluent has raised "some" money from investors, good for them. What is interesting in the post for me is this: *We think there is a really fundamental missing ingredient in the software architecture of a company, namely the idea of "events". These events are the orders, sales, and customer experiences, that constitute the operation of the business. Databases have long helped to store the current state of the world, but we think this is only half of the story. What is missing is the continually flowing stream of events that represents everything happening in a company, and that can act as the lifeblood of its operation.*. This is music to my ears!
* [Apache Kafka + KSQL + TensorFlow for Data Scientists via Python + Jupyter Notebook][6]. A very, very interesting post, discussing how to use Kafka and KSQL together with machine learning tools such as Jupyter notebooks, Python, and deep learning frameworks.

## MSIgnite | The Tour

Later today, (Sunday, Jan 27), I am off to Johannesburg and The **MSIgnite | The Tour** conference, where I give some presentations on Monday and Tuesday (Jan 28 and 29):

* [What is That Cup of Coffee Doing in my Database][7]: This 15-minute talk takes a look at the new Java integration in SQL Server 2019.
* [SQL Server Machine Learning Services: An E2E platform for machine learning][8]: We talk about how SQL Server Machine Learning Services can function as an end-to-end platform for AI and Machine Learning.
* [Deep dive on SQL Server and big data][9]: We look at how SQL Server 2019 Big Data Clusters work.

If you are attending the conference, please come by and say Hi!

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
[dscentral]: https://twitter.com/DataScienceCtrl
[natemc]: https://twitter.com/natemcmaster

[1]: https://www.infoq.com/presentations/microsoft-tfs-azure-devops
[2]: https://www.infoq.com/articles/why-architectural-diagrams
[3]: https://azure.microsoft.com/en-us/blog/hdinsight-tools-for-visual-studio-code-now-generally-available/
[4]: https://azure.microsoft.com/en-us/blog/analyze-data-in-azure-data-explorer-using-kql-magic-for-jupyter-notebook/
[5]: https://www.confluent.io/blog/confluent-raises-a-125m-series-d-funding-round
[6]: https://www.datasciencecentral.com/profiles/blogs/apache-kafka-ksql-tensorflow-for-data-scientists-via-python
[7]: http://bit.ly/2S3xtg8
[8]: http://bit.ly/2MvQySO
[9]: http://bit.ly/2sPvA8E
