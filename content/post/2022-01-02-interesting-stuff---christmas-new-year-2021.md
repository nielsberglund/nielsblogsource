---
type: post
layout: "post"
title: Interesting Stuff - Christmas, New Year 2021
author: nielsb
date: 2022-01-02T12:36:02+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - big data
  - data mesh
  - Azure Data Explorer
  - kafka
description: Kafka podcasts, Kafka & perf, Data Meshes, Kafka client & Event Hubs, and other interesting topics.
keywords:
  - big data
  - data mesh
  - Azure Data Explorer
  - kafka   
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

This is the "roundup" of the posts that have been most interesting to me over the Christmas and New Year period 2021. Oh, and welcome to 2022! I wonder what this year will have in store for us - after the last two years I will not even think about what will happen!

<!--more-->

## Big Data

* [Data Mesh in Practice][1]. In my mind, 2021 was the year of the Data Mesh. Many people started talking about the Data Mesh and what it was. Fewer people actually discussed the practical steps to implement a Data Mesh. That is until the end of the year when the book linked to was published. The book is for you who wonders how to implement a Data Mesh and contains strategic guidance around implementing a Data Mesh. I, for one, find the book very valuable!

## Distributed Computing

* [An Overview of Distributed Tracing with OpenTelemetry in .NET 6][3]. OpenTelemetry is a collection of tools, APIs, and SDKs to help you analyze your software's performance and behaviour. This post, as the title implies, explores OpenTelemetry tracing in .NET 6

## Azure Data Explorer

* [Automatically stop unused Azure Data Explorer Clusters][5]. The linked-to post announces an Azure Data Explorer cluster feature that I have wished for, how ADX clusters can automatically stop when not in use. This will really reduce costs!

## Streaming

* [The Definitive Guide to Building a Data Mesh with Event Streams][2]. Hmm, maybe I was wrong when I, above, said there were not much around implementing a Data Mesh. This blog post looks at the practical steps of implementing a Data Mesh based on Kafka and streaming data. Very interesting!
* [Turning Microservices Inside-Out][4]. This [InfoQ][iq] article provides a lot of good insight into designing and building for emitting data from microservices APIs.
* [I Interviewed Nearly 200 Apache Kafka Experts and I Learned These 10 Things][6]. This post by [Tim Berglund][6] (no, we're not related) is a top 10 of podcasts Tim has conducted with Kafka experts. There is some very cool stuff in there!
* [Speed, Scale, Storage: Our Journey from Apache Kafka to Performance in Confluent Cloud][7]. In this post, the authors share their experience optimizing Apache Kafka for Confluent Cloud. There are quite a few "tips and tricks" that all of us can use! Awesome!

## WIND (What Is Niels Doing)

I have had a severe bout of writer block in the last few months! It is not that I don't have anything to write about; I just can't get the words out there.

So, therefore I am pleased to say that I earlier today (Sunday, Jan 2, 2022) published a new post:

* [**How to Use Kafka Client with Azure Event Hubs**][8]. As the title implies, I look at how one can use the Kafka client to publish to Event Hubs in the post.

Hopefully, having managed to get that post out, I may be able to do others as well.

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

[1]: https://www.starburst.io/info/data-mesh-in-practice-ebook/
[2]: https://www.confluent.io/blog/how-to-build-a-data-mesh-using-event-streams/
[3]: https://aaronstannard.com/opentelemetry-dotnet6/
[4]: https://www.infoq.com/articles/microservices-inside-out/
[5]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/automatically-stop-unused-azure-data-explorer-clusters/ba-p/3047042
[6]: https://twitter.com/tlberglund
[7]: https://www.confluent.io/blog/from-apache-kafka-to-confluent-cloud-optimizing-for-speed-scale-storage/
[8]: {{< relref "2022-01-02-how-to-use-kafka-client-with-azure-event-hubs.md" >}}
