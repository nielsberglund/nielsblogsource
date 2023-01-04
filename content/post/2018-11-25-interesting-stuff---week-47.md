---
type: post
layout: "post"
title: Interesting Stuff - Week 47
author: nielsb
date: 2018-11-25T13:21:17+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - Kafka
  - databricks
description: Kafka and Machine Learning, Data Science myths, Databricks MLflow, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - Kafka
  - databricks   
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

## Misc.

* [Post-REST][1]. A very interesting post by [Tim Bray] where he looks at *What Comes after REST*/how REST will evolve. Very interesting!

## Streaming

* [Using Apache Kafka to Drive Cutting-Edge Machine Learning][2]. A very, very "cool" post, discussing how Kafka and Machine Learning fits together.

## Data Science / AI

* [Dean of Big Data Driving the Snakes of Data Science Out of Ireland][4]. Well, I don't know about "St. Paddy" and [snakes in Ireland][3], but this post tries to do away with some Data Science myths (get rid of the snakes). Really worth reading! 
* [MLflow v0.8.0 Features Improved Experiment UI and Deployment Tools][5]. A week or so ago, [databricks][dbricks] released [MLFlow 0.8.0][6]. This blog post describes a couple of new features in that release.

## WIND (What Is Niels Doing)

After I published the [SQL Server 2019 Big Data Cluster on Azure Kubernetes Service][7] post, I went back and started to look at the new Java functionality in SQL Server 2019. There is a post forthcoming shortly (the famous last words).

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
[tbray]: https://twitter.com/timbray

[1]: https://www.tbray.org/ongoing/When/201x/2018/11/18/Post-REST
[2]: https://www.confluent.io/blog/using-apache-kafka-drive-cutting-edge-machine-learning
[3]: https://news.nationalgeographic.com/news/2014/03/140315-saint-patricks-day-2014-snakes-ireland-nation/
[4]: https://www.datasciencecentral.com/profiles/blogs/dean-of-big-data-driving-the-snakes-of-data-science-out-of
[5]: https://databricks.com/blog/2018/11/21/mlflow-v0-8-0-features-improved-experiment-ui-and-deployment-tools.html
[6]: https://www.mlflow.org/
[7]: {{< relref "2018-11-10-sql-server-2019-big-data-cluster-on-azure-kubernetes-service.md" >}}
