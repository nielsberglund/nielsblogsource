---
type: post
layout: "post"
title: Interesting Stuff - Week 2, 2021
author: nielsb
date: 2021-01-10T08:22:46+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - Kafka
  - data architecture
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - Python
  - SQL Server Extensibility Framework
description: Kafka and SMTs, Data Architecture with Data Mesh, resources for data engineering, Python language extensions, and other interesting topics.
keywords:
  - distributed computing
  - Kafka
  - data architecture
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - Python
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

## Data Architecture

* [Data Mesh Simplified: A Reflection Of My Thoughts On Data Mesh][1]. The post linked to here gives an interesting take on what a Data Mesh is, and what problems it solves.
* [Lakehouse Architecture Realized: Enabling Data Teams With Faster, Cheaper and More Reliable Open Architectures][2]. This post by [Databricks][3] serves as a review of 2020 of what has happened at Databricks and in the Big Data world.

## Data

* [around-dataengineering][4]. The link here is not, so much a blog post, but a page with links to various interesting machine learning and data engineering technologies. When reading this, I found a lot of new interesting "stuff".
* [Change Data Analysis with Debezium and Apache Pinot][5]. This blog post looks at real-time analytics based on combining Debezium, with the real-time OLAP datastore, **Apache Pinot**. Very, very cool!

## Streaming

* [TwelveDaysOfSMT][6]. Kafka has a functionality called Single Message Transforms (SMT). Using SMT, you can modify the data and its characteristics as it passes through the Kafka Connect pipeline, without needing additional stream processors. This page I have linked to here contains a list of blog posts by [Robin Moffat][rmoff], where he looks at various SMT types.

## WIND (What Is Niels Doing)

Recently I have looked quite a bit at the open sourced SQL Server Language extensions, and the Python one specifically. In last weeks [roundup][7] I mentioned I had written a [blog post][8] looking at how to using the language extension with a Python runtime other than the one shipping in SQL Server Machine Learning Services. That post resulted in a couple of follow up posts, published the last few days:

* [How to build Boost.Python with the view to be able to create a Python SQL Language extension.][9]. Since the SQL Server language extensions are open-sourced, you can build your own language extension. I started a post looking at recompiling the Python extension to cater for a newer Python version. To recompile the Python extension, you need to use Boost.Python. It turned out that was more complex than I initially thought, so it deserved its own post. In the post linked to we look at building Boost.Python so we can create a Python SQL Language extension.
* [Write a Python 3.9 Language Extension for SQL Server Machine Learning Services][10]. This post is the one resulting in the Boost.Python post. This post looks at how to write a Python 3.9 SQL Server Language extension to use in SQL Server Machine Learning Services.
* [Solve Python Issues in SQL Server Machine Learning Services After Deploying Python 3.9][11]. Having written the posts above and trying to use the deployed languages, I realized that I could not execute against other Python languages after deploying a new language. After some investigation, I managed to figure out why, and the post linked to tries to explain what the problem is, and how to solve it.

There are a couple of more things I would like to look at around language extensions, so, you can expect some more posts about the new open-sourced language extensions in the following weeks.

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
[travw]: https://twitter.com/radtravis
[emilk]: https://twitter.com/IsTheArchitect


[1]: https://ananthdurai.medium.com/data-mesh-simplified-a-reflection-of-my-thoughts-on-data-mesh-4d4f01c37185
[2]: https://databricks.com/blog/2021/01/08/lakehouse-architecture-realized-enabling-data-teams-with-faster-cheaper-and-more-reliable-open-architectures.html
[3]: https://databricks.com/
[4]: https://abhishek-ch.github.io/around-dataengineering/
[5]: https://medium.com/apache-pinot-developer-blog/change-data-analysis-with-debezium-and-apache-pinot-b4093dc178a7
[6]: https://rmoff.net/categories/twelvedaysofsmt/
[7]: {{< relref "2021-01-03-interesting-stuff---christmas-new-year-week-1-2021.md" >}} 
[8]: {{< relref "2020-12-29-bring-your-own-r--python-runtimes-to-sql-server-extensibility-framework.md" >}}
[9]: {{< relref "2021-01-03-build-boostpython--numpy-in-windows.md" >}}
[10]: {{< relref "2021-01-05-write-a-python-39-language-extension-for-sql-server-machine-learning-services.md" >}}
[11]: {{< relref "2021-01-09-solve-python-issues-in-sql-server-machine-learning-services-after-deploying-python-39.md" >}}
