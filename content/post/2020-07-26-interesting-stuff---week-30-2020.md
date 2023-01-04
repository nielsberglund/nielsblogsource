---
type: post
layout: "post"
title: Interesting Stuff - Week 30, 2020
author: nielsb
date: 2020-07-26T13:01:43+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - Kafka
  - Apache Spark
description: Kafka, Kafka and private data, Apache Spark date and Time data-types, and other interesting topics.
keywords:
  - data science
  - Kafka
  - Apache Spark   
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

## Machine Learning

* [A Comprehensive Look at Dates and Timestamps in Apache Spark 3.0][1]. Apache Spark 3.0 was released recently with quite a lot of new features and also changes to existing functionality and data types. This blog post deep dives into the `Date` and `Timestamp` types and tries to explain their behavior.

## Streaming

* [Data Privacy, Security, and Compliance for Apache Kafka][2]. There are increased regulatory demands for protecting personal/sensitive data. The blog post linked to here introduces Privitar Data Privacy Platform, and it looks at how it integrates to Confluent Platform through Privitar Kafka Connector.
* [Measuring and Monitoring a Stream Processing Cloud Service: Inside Confluent Cloud ksqlDB][3]. This is the third is a series of posts on enhancements to ksqlDB to enable its offering in Confluent Cloud. Very interesting read! 
* [Improved Robustness and Usability of Exactly-Once Semantics in Apache Kafka][4]. Back in 2017, Confluent [introduced exactly-once semantics][5] in Kafka. Initially, it was met with a healthy dose of scepticism, but after a while, the doubt died away when people saw it working. This post discusses the recent improvements on exactly-once semantics (EOS) to make it simpler to use and more resilient. We are getting there, my friends!

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


[1]: https://databricks.com/blog/2020/07/22/a-comprehensive-look-at-dates-and-timestamps-in-apache-spark-3-0.html
[2]: https://www.confluent.io/blog/kafka-data-privacy-security-and-compliance/
[3]: https://www.confluent.io/blog/monitoring-confluent-cloud-ksqldb-stream-processing-service/
[4]: https://www.confluent.io/blog/simplified-robust-exactly-one-semantics-in-kafka-2-5/
[5]: https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/
