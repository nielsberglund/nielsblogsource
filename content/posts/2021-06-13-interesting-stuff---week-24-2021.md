---
type: post
layout: "post"
title: Interesting Stuff - Week 24, 2021
author: nielsb
date: 2021-06-13T10:39:45+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - machine learning
  - distributed computing
  - Kafka
  - Data Platform Summit
  - Future Data Driven
  - Azure Data Explorer
  - Flink
  - Databricks
description: Kafka, Confluent Control Center, Flink & ML, Databricks AutoML, Azure Data Explorer, and other interesting topics!
keywords:
  - machine learning
  - distributed computing
  - Kafka
  - Data Platform Summit
  - Future Data Driven
  - Azure Data Explorer
  - Flink 
  - Databricks
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

## Distributed Computing

* [Introduction to Chaos Engineering][5]. The post linked here looks at the origin, principles, and benefits of Chaos Engineering. Chaos Engineering is when you try to disrupt and break an application system to build resilience. Notice that the post is behind a paywall.

## Machine Learning / AI

* [Flink-powered model serving & real-time feature generation at Razorpay][1]. This post, which is from back in December 2020, looks at how Apache Flink is being utilized as a way to overcome challenges around feature generation and machine learning model serving in real-time. Very interesting! 
* [How to Build a Scalable Wide and Deep Product Recommender][2]. A Wide and Deep Learning Model consists of two parts; a machine learning part (linear model) and a neural network part. This type of model is often used in recommender systems, and the blog post linked looks at how you can do it using Databricks.
* [Automate Machine Learning using Databricks AutoML — A Glass Box Approach and MLFLow][4]. During the [Data + AI Summit 2021][3], Databricks announced their Databricks AutoML platform. This post looks at using Databricks AutoML Platform to automatically apply machine learning to a dataset and deploy the model to production using the REST API.

## Streaming

* [Block Aggregator: Real-time Data Ingestion from Kafka to ClickHouse with Deterministic Retries][6]. This post discusses the message-processing engine eBay developed to avoid data loss or duplication during delivery from Kafka to ClickHouse. I found the post very interesting as we are looking at similar things at [Derivco](/derivco) right now.
* [Serverless Event Driven Systems with Confluent Cloud and AWS Lambda][7]. This post presents an end-to-end example of a Serverless event-driven architecture using Confluent Cloud for stream processing paired with AWS Lambda for event responsive logic using the Serverless Application Model (SAM) framework.
* [How to Better Manage Apache Kafka by Creating Kafka Messages from within Control Center][8]. This post is the first in a series looking some new features to Control Center, introduced in Confluent Platform 6.2.0. Some very cool stuff here!

## WIND (What Is Niels Doing)

In [last weeks roundup][9], I mentioned I was looking into [**Azure Data Explorer**][10] as I was thinking about creating some presentations for upcoming conferences. I did submit a couple of topics to some conferences, and I had two conferences accepting talks! Woohoo! The conferences and talks are:

* [**2021 Data Platform Summit**][12]: **How to do Real-Time Analytics Using Apache Kafka and Azure Data Explorer**.
* [**Future Data Driven**][11]: **Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer**.

So now having the above talks accepted, I really need to get going with prep. I am stoked!

Oh, and I am still doing the [**Big Data & Analytics with SQL Server 2019 Big Data Cluster**][13] training class for the [**2021 Data Platform Summit**][12], and if you [sign up][13] for the class you get free access to the summit itself!

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

[1]: https://www.ververica.com/blog/flink-powered-model-serving-real-time-feature-generation-at-razorpay
[2]: https://databricks.com/blog/2021/06/09/how-to-build-a-scalable-wide-and-deep-product-recommender.html
[3]: https://databricks.com/dataaisummit/north-america-2021
[4]: https://pub.towardsai.net/automate-machine-learning-using-databricks-automl-a-glass-box-approach-and-mlflow-2543a8143687
[5]: https://thechief.io/c/editorial/introduction-to-chaos-engineering/
[6]: https://tech.ebayinc.com/engineering/block-aggregator-real-time-data-ingestion-from-kafka-to-clickhouse-with-deterministic-retries/
[7]: https://thecodinginterface.com/blog/serverless-kafka-with-aws-lambda/
[8]: https://www.confluent.io/blog/create-kafka-messages-from-within-control-center-for-better-kafka-management/
[9]: {{< relref "2021-06-06-interesting-stuff---week-23-2021.md" >}}
[10]: https://docs.microsoft.com/en-us/azure/data-explorer/data-explorer-overview
[11]: https://www.eventbrite.com/e/future-data-driven-summit-event-tickets-157885366381
[12]: https://dataplatformgeeks.com/dps2021/
[13]: https://dataplatformgeeks.com/dps2021/product/big-data-analytics-with-sql-server-2019-big-data-cluster-by-niels-berglund/
