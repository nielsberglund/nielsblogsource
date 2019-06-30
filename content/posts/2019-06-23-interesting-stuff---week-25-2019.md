---
type: post
layout: "post"
title: Interesting Stuff - Week 25, 2019
author: nielsb
date: 2019-06-23T16:19:22+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - .NET Core
  - Kafka
  - Databricks Delta Lake
  - Apache Spark
  - Go
  - Kubernetes 
description: Kafka on Windows and .NET, Go, state in stream processing, Kubernetes, and other interesting topics.
keywords:
  - distributed computing
  - .NET Core
  - Kafka
  - Databricks Delta Lake
  - Apache Spark
  - Go
  - Kubernetes    
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

* [50 days from zero to hero with Kubernetes][1]. If you want to get to know Kubernetes this guide is for you! It will help you to get to know the basics of Kubernetes, and you also get hands-on experience with its various components, capabilities, and solutions.

## Misc.

* [Go Creeping In][2]. In this post, [Tim Bray][tbray], discusses the [Go][3] language, and some of its features. Very interesting!

## .NET

* [The Evolving Infrastructure of .NET Core][4]. This blog post gives an interesting insight into the infrastructure history behind .NET Core. 

## Streaming

* [Managing Streaming And Queryable State In Spark, Akka Streams, Kafka Streams, And Flink][5]. This post takes a look at the built-in support for state management and queryable state, when available, or how they can be implemented in Apache Spark, Apache Flink, Kafka Streams, and Akka Streams.
* [Kafka Topics: Pitfalls and Insights][6]. In this post, there are quite a few useful insights about Kafka topics. If you use Kafka in production, you should read this post.
* [Simplifying Streaming Stock Analysis using Delta Lake and Apache Spark][7]. A blog post further expanding on a webinar on how to build streaming systems to analyze stock data in real-time, by using Databricks Delta Lake and Apache Spark.
* [Confluent Platform & Kafka for a .NET Developer on Windows][8]. This is a blog post by yours truly, where I look at how to run Confluent Kafka in Docker on a Windows machine and how we write .NET Code against it.

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
[tbray]: https://twitter.com/timbray

[1]: https://azure.microsoft.com/mediahandler/files/resourcefiles/kubernetes-learning-path/Kubernetes%20Learning%20Path%20version1.0.pdf
[2]: https://www.tbray.org/ongoing/When/201x/2019/06/12/Go-Creeping-In
[3]: https://golang.org/
[4]: https://devblogs.microsoft.com/dotnet/the-evolving-infrastructure-of-net-core/
[5]: https://www.lightbend.com/blog/managing-streaming-and-queryable-state-in-spark-akka-streams-kafka-streams-flink
[6]: https://medium.com/thousandeyes-engineering/kafka-topics-pitfalls-and-insights-38bafc791a83
[7]: https://databricks.com/blog/2019/06/18/simplifying-streaming-stock-analysis-using-delta-lake-and-apache-spark-on-demand-webinar-and-faq-now-available.html
[8]: {{< relref "2019-06-18-confluent-platform--kafka-for-the-windows--net-developer.md" >}}
