---
type: post
layout: "post"
title: Interesting Stuff - Week 38, 2022
author: nielsb
date: 2022-09-25T08:31:25+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - machine learning
  - Apache Spark
  - Azure Data Explorer
  - Kafka
  - Raft
description: Kafka & Azure Serverless functions, Spark and churn predictions, the Raft protocol, confusion matrices, and other interesting topics!
keywords:
  - machine learning
  - Apache Spark
  - Azure Data Explorer
  - Kafka
  - Raft   
---

![](/images/posts/churn.jpg)

**<p style="text-align: center;"><em>Churn</em></p>**
**<p style="text-align: center;"><em>Photo by <a href="https://unsplash.com/@sweetpagesco">Sarah Brown</a> on <a href="https://unsplash.com/s/photos/churn">Unsplash</a></em></p>**

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

## AI/ML

* [This Is How You Can Build a Churn Prediction Model Using Apache Spark][1]. At [Derivco](/derivco), we're looking at creating ML models for churn, so lately, I've been reading posts around this subject. I came across this post, a tutorial on building a churn prediction classifier using the ML stack from Spark. Very interesting and informative!
* [Introduction to Confusion Matrix][2]. When I first heard the term confusion matrix, I thought it was called so because you became confused trying to interpret it, :smile:. Anyway, this post tries to explain what a confusion matrix is and how you can plot one using Python. When reading the post, remember that the algorithm used is to predict someone is sick.

## Distributed Computing

* [Raft - Understandable Distributed Consensus][3]. Raft is a consensus algorithm that is designed to be easy to understand. Going forward, Kafka will use Raft instead of ZooKeeper. The page linked to is a visualization of how Raft works. My first thought was that "this looks very much like a distributed transaction". Anyway, the visualization is very cool!
* [Patterns of Distributed Systems][4]. If you think: "has Niels not linked to this before", you are absolutely correct. In 2020 I linked to this in one of my [roundups][5]. At that stage, the compendium about the patterns for distributed systems was a work in progress. Now it is completed, and if you are interested in distributed systems, you must read it!

## Azure Data Explorer

* [Check it out: Azure Data Explorer MS Learn modules][6]. The title says it all! **Azure Data Explorer** (ADX) has new MS Learn modules. If you want to learn ADX - check them out!

## Streaming

* [Keeping Multiple Databases in Sync Using Kafka Connect and CDC][7]. This blog post looks at how to keep databases in sync using Kafka technologies and CDC. It reviews the advantages and disadvantages of using JDBC and CDC for moving data. It then explores the real use case of how a legacy bank used Kafka Connect to bridge the silos and keep multiple applications/databases in sync.
* [Error Handling with Apache Kafka extension for Azure Functions and more!!][8]. The Kafka extension for Azure functions was released recently with some cool features. As a side note, we ([Derivco](/derivco)) are using it - awesome! Anyway, this post looks at some features in the Kafka extension. I particularly like the error handling (not that my code has any errors, but ... :smile:).

## WIND (What Is Niels Doing)

This:

![](/images/posts/adx-overview.png)

**Figure 1:** *Azure Data Explorer*

The [Azure Durban User Group][10] are back to in-person meetings - yay! This Wednesday (Sep 28), I am doing an **Azure Data Explorer** presentation.

Come and join us if you are in the 'hood. The event is [FREE][9], and you register [here][9]. See you on Wednesday!

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

[1]: https://pub.towardsai.net/this-is-how-you-can-build-a-churn-prediction-model-using-spark-e187b7eca339
[2]: https://pub.towardsai.net/introduction-to-confusion-matrix-50676f2756ee
[3]: http://thesecretlivesofdata.com/raft/
[4]: https://martinfowler.com/articles/patterns-of-distributed-systems/
[5]: {{< relref "2020-08-16-interesting-stuff---week-33-2020.md" >}}
[6]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/check-it-out-azure-data-explorer-ms-learn-modules/ba-p/3633934
[7]: https://www.confluent.io/blog/sync-databases-and-remove-silos-with-kafka-cdc/
[8]: https://techcommunity.microsoft.com/t5/apps-on-azure-blog/error-handling-with-apache-kafka-extension-for-azure-functions/ba-p/3628936
[9]: https://www.meetup.com/Azure-Transformation-Labs/events/288687700/
[10]: https://www.meetup.com/Azure-Transformation-Labs/
