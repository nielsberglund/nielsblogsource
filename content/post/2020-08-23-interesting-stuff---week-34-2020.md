---
type: post
layout: "post"
title: Interesting Stuff - Week 34, 2020
author: nielsb
date: 2020-08-23T11:47:46+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - distributed computing
  - SQL Server
  - Kubernetes
  - Data Platform Summit
description: Kafka, Kafka virtual summit, Delta Lakes, Data Platform Summit, and other interesting topics.
keywords:
  - Kafka
  - distributed computing
  - SQL Server
  - Kubernetes
  - Data Platform Summit   
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

* [HTTP-Based Contract Testing @ Gamesys][1]. This is an interesting post discussing Contract Testing. Contract testing is testing between disparate, heterogenous components that interact via some binding interface. The interface is defined by a contract which defines the inputs and outputs between the components that are tested.

## Big Data

* [Top 5 Reasons to Convert Your Cloud Data Lake to a Delta Lake][2]. Databricks Delta Lake is an open-source storage layer that brings reliability to data lakes. The post linked to here discusses the benefits of using a Delta Lake on top of your data lake.

## Distributed Computing

* [Continuous Kubernetes blue-green deployments on Azure using Nginx, AppGateway or TrafficManager — part 2][3]. This is the second part of a series of posts around advanced deployment processes. In this post, the author takes us through how to do blue-green deployments using Azure Kubernetes Service (AKS). Very interesting!
* [Zero-Downtime Kubernetes Deployments][4]. This post from one of [Derivco's](/derivco) "competitors", discusses how they do zero-downtime deployments. It is always interesting seeing how competitors are doing things!

## Streaming

* [How to Make the Most of Kafka Summit Virtually][5]. The, (virtual), Kafka Summit 2020, starts on Monday, (August 24). This post discusses how you - as an attendee - can get the most out of the conference. I will definitely be attending, and I hope I'll see you there!
* [Testing Kafka Streams – A Deep Dive][6]. This awesome post looks at how to do automated Kafka Streams testing; what tools to use and some of the problems you can run into. As I said, it is an awesome post - and I will make sure that the developers in my team dealing with Kafka Streams read the post. Yes, I am looking at you Stevo, and at you Reinhardt!

## WIND (What Is Niels Doing)

One of the largest data platform conferences takes place, (virtually), beginning of December this year: [**DATA PLATFORM VIRTUAL SUMMIT 2020**][7], and the cool things is:

![](/images/posts/Niels_Berglund.jpg)

**Figure 1:** *SQL Server & Kafka*

Yes, I am speaking at the conference! My topic is about, as you can see in *Figure 1*, the various ways we can stream data from SQL Server to Apache Kafka.

The conference has world class-speakers, (and me), so hurry up and [register][8]!

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


[1]: https://medium.com/@danny.noam/http-based-contract-testing-gamesys-8c8d0d9aeee8
[2]: https://databricks.com/blog/2020/08/21/top-5-reasons-to-convert-your-cloud-data-lake-to-a-delta-lake.html
[3]: https://medium.com/@denniszielke/continuous-kubernetes-blue-green-deployments-on-azure-using-nginx-appgateway-or-trafficmanager-4490bce29cb
[4]: https://sbg.technology/2020/08/21/zero-downtime-kubernetes-deployments/
[5]: https://www.confluent.io/blog/kafka-summit-2020-pro-tips-and-schedule/
[6]: https://www.confluent.io/blog/testing-kafka-streams/
[7]: https://dataplatformgeeks.com/dps2020/
[8]: https://dataplatformgeeks.com/dps2020/booking/