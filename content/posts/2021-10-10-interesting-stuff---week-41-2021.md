---
type: post
layout: "post"
title: Interesting Stuff - Week 41, 2021
author: nielsb
date: 2021-10-10T10:15:26+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - VSCode
  - Python
  - big data cluster
  - SQL Server Big Data Cluster
  - timeseries
  - azure data explorer
  - kusto query language
  - KQL
  - kafka
  - stream governance
description: Kafka Stream Governance, VSCode & Python, timeseries in ADX, and other interesting topics.
keywords:
  - VSCode
  - Python
  - big data cluster
  - SQL Server Big Data Cluster
  - timeseries
  - azure data explorer
  - kusto query language
  - KQL
  - kafka
  - stream governance   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth that has to do with things that interest me:

* AI/data science
* data in general
* data architecture
* streaming
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Misc.

* [Python in Visual Studio Code – October 2021 Release][2]. In early October, Python 3.10 stable was released. Hot on the heels of that release comes what is mentioned in this blog post: a new release of the **VS Code** Python extension. The post looks at some of the significant new features and fixes. One of the new features is an improved "getting started experience" for Python in VS Code. Since I have had issues in the past getting Python up and running, I think I will uninstall my existing Python extension and try this improved extension from "scratch".

## SQL Server Big Data Cluster

* [What's new with SQL Server Big Data Clusters—CU13 Release][3]. I guess the title of the blog post says it all. The post looks at new "stuff" in the CU13 release of **SQL Server 2019 Big Data Cluster**. The big one for me in this release is the switch from Apache Spark 2.4 to Apache Spark 3.1.2. 

## Azure Data Explorer

* [Aligning Timeseries Application Requirements into Azure Data Explorer (ADX)][4]. Time series analysis has become critical in almost any analytical application. This blog post looks at the support for time series analysis in Azure, more specifically in **Azure Data Explorer**. After reading the post, I think it is safe to say that the support in ADX is "pretty darn good".
* [Kusto Query Language 101][5]. Above, we spoke about time series analysis in **Azure Data Explorer**. It is all good and well that we have that functionality, but how do we query ADX? Well, if you read the post linked to, you will get a "crash course" in the query language for ADX: **Kusto Query Language** (KQL).

## Streaming

* [Stream Governance: Discover, understand, and trust your data in motion][7]. A month or so ago, Confluent [announced the release][6] of their platform for stream governance: the [**Stream Governance** suite][8]. Since the release, Confluent has been busy creating learning resources etc., and the post linked to is the registration page for a Stream Governance webinar. If you are working with streaming data, I do suggest you sign up!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. Please comment on this post or [ping][ma] me if you have ideas for what to cover.

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
[ads]: https://twitter.com/azuredatastudio
[travw]: https://twitter.com/radtravis
[emilk]: https://twitter.com/IsTheArchitect
[netflx]: https://netflixtechblog.com/

[1]: https://www.python.org/downloads/release/python-3100/
[2]: https://devblogs.microsoft.com/python/python-in-visual-studio-code-october-2021-release/
[3]: https://cloudblogs.microsoft.com/sqlserver/2021/10/06/whats-new-with-sql-server-big-data-clusters-cu13-release/
[4]: https://techcommunity.microsoft.com/t5/azure-data-explorer/aligning-timeseries-application-requirements-into-azure-data/ba-p/2758959
[5]: https://davemccollough.com/2021/02/01/kusto-query-language-101/
[6]: https://www.confluent.io/blog/governing-data-with-confluent-stream-governance/
[7]: https://www.confluent.io/resources/demo/stream-governance-discover-understand-and-trust-your-data-in-motion/
[8]: https://www.confluent.io/product/stream-governance/