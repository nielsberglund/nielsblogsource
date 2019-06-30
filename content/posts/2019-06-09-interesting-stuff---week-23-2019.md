---
type: post
layout: "post"
title: Interesting Stuff - Week 23, 2019
author: nielsb
date: 2019-06-09T06:38:03+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - SQL Server 2019
  - Azure Data Studio
  - SQL Server Extensibility Framework
description: Azure Data Studio, machine learning, SQL Server 2019 Extensibility framework, and other topics.
keywords:
  - data science
  - SQL Server 2019
  - Azure Data Studio
  - SQL Server Extensibility Framework   
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

* [The June release of Azure Data Studio is now available][1]. What the title says. You can now download the June release of Azure Data Studio, or, if you already have it installed, it should upgrade automatically. There are quite a few highlights in this release. The one that interests me the most is the improvements in SQL Notebooks

## Data Science

* [Continuous integration of machine learning models with ease.ml/ci][2]. The white paper [Adrian][adcol] dissects here is about what does a continuous integration testing environment look like for a machine learning model? The paper presents **ease.ml/ci** which is a continuous integration system for machine learning. 
* [Build more accurate forecasts with new capabilities in automated machine learning][3]. This blog post discusses new capabilities in Azure Machine Learning service related to time-series forecasting. Very interesting!
* [Data validation for machine learning][4]. Machine learning is good and all, and you can achieve a lot with ML. However, unless the data passed into ML is correct, you only get garbage. The paper [Adrian][adcol] dissects in this post focuses on the problem of validation the input data fed to ML pipelines. 

## SQL Server 2019

* [SQL Server 2019 Extensibility Framework & External Languages][5]. A couple of weeks ago, I wrote a [blog post][6] about changes in SQL Server 2019 CTP 2.5 related to how you write Java code for use by SQL Server. Well, a bit later, Microsoft released SQL Server 2019 CTP 3.0 with more changes around this topic (Java code in SQL Server), and in this blog post, I discuss these changes.

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
[ads]: https://twitter.com/azuredatastudio

[1]: https://cloudblogs.microsoft.com/sqlserver/2019/06/06/the-june-release-of-azure-data-studio-is-now-available/
[2]: https://blog.acolyer.org/2019/06/03/ease-ml-ci/
[3]: https://azure.microsoft.com/en-us/blog/build-more-accurate-forecasts-with-new-capabilities-in-automated-machine-learning/
[4]: https://blog.acolyer.org/2019/06/05/data-validation-for-machine-learning/
[5]: {{< relref "2019-06-06-sql-server-2019-extensibility-framework--external-languages.md" >}}
[6]: {{< relref "2019-05-26-java--sql-server-2019-extensibility-framework-the-sequel.md" >}}
