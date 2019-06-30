---
type: post
layout: "post"
title: Interesting Stuff - Week 22, 2019
author: nielsb
date: 2019-06-03T18:29:57+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - Kafka
  - VS Code
  - Java
description: Kafka, VS Code and Java, Spark, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - Kafka
  - VS Code
  - Java  
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

## .NET

* [Porting desktop apps to .NET Core][1]. This is a very informative post discussing porting of .NET Framework applications to .NET Core. Seeing that the apps to port can be of different grades of complexity, this first post covers simple use cases, and a follow-up post covers the more complex scenarios.

## Data Science

* [Apache Spark MLlib Tutorial: Linear Regression][2]. This post is the first part of a tutorial on how to work with MLLib in Apache Spark. For me, this is interesting as I can see us at [Derivco](/derivco) start to use Spark.

## VS Code

* [Visual Studio Code for Java: The Ultimate Guide 2019][3]. I have written a couple of posts where I have used *VS Code* and Java. However, since I am a .NET guy "at heart", the Java ecosystem is a mystery to me, and I have "fumbled" my way through. I wish I had come across the post I link to here, as it gives you awesome information about how to work with *VS Code* and Java.

## Streaming

* [Visual data ops for Apache Kafka on Azure HDInsight, powered by Lenses][4]. This post looks at how you can manage your streaming data operations, from visibility to monitoring, by the use of [Lenses][5]. The post looks at how to do it in Azure, but it is as applicable on-prem as well. Once again, this is interesting to me as, at [Derivco](/derivco), we are great fans of Kafka.
* [Deploying Kafka Streams and KSQL with Gradle – Part 2: Managing KSQL Implementations][6]. The second part in a series about how to develop, and deploy Kafka Streams and KSQL parts of streaming applications using [Gradle][7].

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

[1]: https://devblogs.microsoft.com/dotnet/porting-desktop-apps-to-net-core/
[2]: https://towardsdatascience.com/apache-spark-mllib-tutorial-ec6f1cb336a9
[3]: https://blog.usejournal.com/visual-studio-code-for-java-the-ultimate-guide-2019-8de7d2b59902
[4]: https://azure.microsoft.com/en-us/blog/visual-data-ops-for-apache-kafka-on-azure-hdinsight-powered-by-lenses/
[5]: https://lenses.io/
[6]: https://www.confluent.io/blog/deploying-kafka-streams-and-ksql-with-gradle-part-2-managing-ksql-implementations
[7]: https://gradle.org/