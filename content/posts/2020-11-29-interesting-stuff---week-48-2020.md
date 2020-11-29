---
type: post
layout: "post"
title: Interesting Stuff - Week 48, 2020
author: nielsb
date: 2020-11-29T09:01:28+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - distributed computing
  - kafka
  - machine learning
  - kubernetes
  - SQL Server
description: Kafka & SQL Server, machine learning applications on Kubernetes, Data Platform Summit 2020, and other interesting topics!
keywords:
  - distributed computing
  - kafka
  - machine learning
  - kubernetes
  - SQL Server   
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

* [How Netflix Scales Its API with GraphQL Federation][1]. This is an [InfoQ][iq] presentation, where the presenters look at how Netflix uses GraphQL to scale its API's. The usage of GraphQL looks very cool, and maybe we can use it at [Derivco](/derivco) as well!
* [The 6 Things You Need to Know About Event-Driven Architectures][2]. The post linked to is the second in a series about event driven architectures, (the first is [here][3]). In this post, the author looks at, and explains, what in his mind are key concepts of event-driven architectures. 

## Data Science

* [Deploy Machine Learning applications to Kubernetes using Streamlit and Polyaxon][4]. This is a step-by-step guide on how to train, analyze, and deploy a containerized Streamlit machine learning application on Kubernetes using Polyaxon.

## Streaming

* [Simple streaming telemetry][5]. This post looks at the Netflix `gnmi-gateway` project. `gnmi-gateway` is a modular, distributed, and highly available service for modern network telemetry via OpenConfig and gNMI. The `gnmi-gateway` project looks interesting, and I'll forward the post to our network guys.

## WIND (What Is Niels Doing)

If you have not signed up for the [**Data Platform Virtual Summit 2020**][10] yet, you still have some time! 

The **Data Platform Virtual Summit 2020**, (DPS), is a 100% technical learning event with 200 Breakout Sessions, 30 Training Classes, 72 hours of non-stop conference sessions. 

DPS 2020 is the largest online learning event on Microsoft Azure Data, Analytics & Artificial Intelligence. Delegates get the recordings at no extra cost, which is quite a wonderful thing. Also, the conference virtual platform looks amazing, [have a look][11].

You [book here][12]. Oh, and since I am a speaker I get a discount code to hand out to you guys! Use the discount code **DPSSPEAKER** to book your seat at **55%** off. 

If you wonder what I am speaking about, this should give you an idea:

![](/images/posts/Niels_Berglund.jpg)

In my talk, I will be talking about Kafka and SQL Server, and various ways we can "set our SQL Server data free"!

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


[1]: https://www.infoq.com/presentations/netflix-api-graphql-federation/
[2]: https://medium.com/swlh/the-6-things-you-need-to-know-about-event-driven-architectures-38e11fdcb5a
[3]: https://medium.com/swlh/the-engineers-guide-to-event-driven-architectures-benefits-and-challenges-3e96ded8568b
[4]: https://towardsdatascience.com/deploy-machine-learning-applications-to-kubernetes-using-streamlit-and-polyaxon-49bf4b963515
[5]: https://netflixtechblog.com/simple-streaming-telemetry-27447416e68f
[10]: https://dataplatformgeeks.com/dps2020/
[11]: https://www.linkedin.com/posts/amitbansal2010_dps2020-sqlserver-powerbi-activity-6728885748755374080-a8QL/
[12]: https://dataplatformgeeks.com/dps2020/booking/
