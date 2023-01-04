---
type: post
layout: "post"
title: Interesting Stuff - Week 16, 2022
author: nielsb
date: 2022-04-24T08:44:24+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/scale-orig.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Databricks
  - Machine Learning
  - Kafka
description: Kafka CLI, autoscale Azure Data Explorer, Modern Datawarehouse, Databricks AutoML, and other interestign topics!
keywords:
  - Azure Data Explorer
  - Databricks
  - Machine Learning
  - Kafka   
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

This blog post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Azure Data Explorer

* [How to Configure Auto-Scaling in Azure Data Explorer][1]. Azure Data Explorer uses a cluster of compute resources with the ability to scale up or down both vertically as well as horizontally. This blog post looks at how to auto-scale Azure Data Explorer horizontally.

## Machine Learning

* [Supercharge Your Machine Learning Projects With Databricks AutoML — Now Generally Available!][2]. Machine Learning (ML) is at the heart of innovation across industries. At the same time, it can be hard to do. Something that can help is AutoML, and this post looks at Databricks AutoML, which is now generally available. It looks very interesting!

## Data Architecture

* [Is The Modern Data Warehouse Broken?][3]. When browsing, I have recently come across posts/articles debating data warehousing. The post linked to is yet another one of these. The post introduces the *Immutable Data Warehouse*, where the warehouse should represent the real world through the data. It looks interesting, and we are thinking along the same lines at [Derivco](/derivco).

## Streaming

* [Unbundling the Modern Streaming Stack][4]. The word *Modern* seems to be used more and more related to architecture/technologies. An example is above: the "Modern Data Warehouse". Anyway, I digress; this post dissects the parts that make up the "Modern" Streaming stack. It compares the streaming landscape of yesteryear with what it looks like today and where it possibly can go.
* [Building a Bridge to the Cloud with Confluent CLI v2][5]. This post announces the release of the new Confluent CLI; **Confluent CLI v2**. The release merges the functionality of the "old" Confluent Cloud CLI, `ccloud` with the Confluent Platform CLI, `confluent`.

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

[1]: https://www.madeiradata.com/post/how-to-configure-auto-scaling-in-azure-data-explorer
[2]: https://databricks.com/blog/2022/04/18/supercharge-your-machine-learning-projects-with-databricks-automl-now-generally-available.html
[3]: https://towardsdatascience.com/is-the-modern-data-warehouse-broken-1c9cbfddec3e
[4]: https://medium.com/event-driven-utopia/unbundling-the-modern-streaming-stack-451f75eaf1d
[5]: https://www.confluent.io/blog/data-pipelines-are-even-easier-with-confluent-cli-v2/
