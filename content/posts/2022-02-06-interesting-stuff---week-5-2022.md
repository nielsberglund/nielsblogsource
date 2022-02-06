---
type: post
layout: "post"
title: Interesting Stuff - Week 5, 2022
author: nielsb
date: 2022-02-06T12:51:07+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - Databricks
  - Delta Lake
  - Azure Data Explorer
  - SQLBits 2022
description: Kafka & Salesforce data, Azure Data Explorer & Kibana, Delta Lake perf., Azure Data Explorer training at SQLBits, and other cool topics.
keywords:
  - Kafka
  - Databricks
  - Delta Lake
  - Azure Data Explorer
  - SQLBits 2022   
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

## Cloud

* [Lock-in and Multi-Cloud][1]. This is an excellent post by [Tim Bray][2], where he looks at various options for "going to the cloud". As the post title implies, he also looks at the perception of lock-in and the fear thereof. As I mentioned in the beginning, this is an excellent post. Thanks to this post, I also got to an old post (from 2003) of his: [*Half a Billion Bibles*][3], where he puts data sizes in perspective.

## Data Architecture

* [Make Your Data Lakehouse Run, Faster With Delta Lake 1.1][4]. The 1.1 release of Databricks' Delta Lake has some significant performance improvements. This post goes over the major changes and notable features in this release. There is some very cool stuff in there!
* [Data Mesh Patterns: Event Streaming Backbone][5]. This post is the second in a series of articles on Foundational Data Mesh Patterns, and it discusses the *Event Streaming Backbone* pattern. The post is very interesting, and if you are interested in Data Mesh and/or Event Driven architectures you should read it.

## Azure Data Explorer

* [Kibana dashboards and visualizations on top of Azure Data Explorer are now supported with K2Bridge][6]. If you are a Kibana user, this post is for you! It discusses how you can now easily migrate to Azure Data Explorer (ADX) while keeping Kibana as your visualization tool, alongside the other Azure Data Explorer experiences and the powerful KQL language.

## Streaming

* [Streaming ETL SFDC Data for Real-Time Customer Analytics][7]. Confluent relies heavily on Salesforce data for marketing and other purposes, where the Salesforce data is loaded into Google Big Query. This blog post shares how Confluent leverages Confluent Cloud connectors, Schema Registry, ksqlDB, and Kafka Streams (KStreams) to build a streaming ETL pipeline to send Salesforce data to BigQuery. It is cool to see how Confluent "eats their own dog-food"!

## WIND (What Is Niels Doing)

It is getting closer:

{{< youtube id="wQwQIy_wwes" >}}

The "trailer" above is my attempt to "shameless self-promotion" of my one day [**Azure Data Explorer** training class][8] at **SQLBits 2022** in London next month. There are still some seats left so, if you are interested, go ahead and [**REGISTER**][9]!

Speaking of registering:

![](/images/posts/stream-processing-kafka.png)

**Figure 1:** *Stream Processing with Apache Kafka and .NET*

This coming Wednesday (February 9), I present [**Stream Processing with Apache Kafka and .NET**][10] at the **.NET to the Core** meetup user group. Register for free [here][10].

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

[1]: https://www.tbray.org/ongoing/When/202x/2022/01/30/Cloud-Lock-In
[2]: https://en.wikipedia.org/wiki/Tim_Bray
[3]: https://www.tbray.org/ongoing/When/200x/2003/03/10/GigaTeraPeta
[4]: https://databricks.com/blog/2022/01/31/make-your-data-lakehouse-run-faster-with-delta-lake-1-1.html
[5]: https://towardsdatascience.com/data-mesh-pattern-deep-dive-event-streaming-backbone-99a5bb2a7cbf
[6]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/kibana-dashboards-and-visualizations-on-top-of-azure-data/ba-p/3062838
[7]: https://www.confluent.io/blog/streaming-etl-sfdc-data-for-real-time-customer-analytics/
[8]: https://arcade.sqlbits.com/sessions/
[9]: https://register.sqlbits.com/event/36db4730-583c-49c1-adcf-f76432bb6580/summary
[10]: https://www.meetup.com/NET-to-the-Core/events/283278548
