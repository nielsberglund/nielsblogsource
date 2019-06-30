---
type: post
layout: "post"
title: Interesting Stuff - Week 5, 2019
author: nielsb
date: 2019-02-03T09:15:51+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server 2019
  - SQL Server Machine Learning Services
  - Kubernetes
  - Kafka
description: Kafka, Kubernetes, .NET Core and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server 2019
  - SQL Server Machine Learning Services
  - Kubernetes
  - Kafka   
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

* [P to V to C: The Value of Bringing “Everything” to Containers][1]. An [InfoQ][iq] presentation examining the benefits of containerization, the role of infrastructure virtualization, discussing containers, pods, controllers, policies and more.
* [Dissecting Kubernetes (K8s) - An Intro to Main Components][2]. Another [InfoQ][iq] presentation, and in this presentation we see how to deploy containers, building up a mini cluster one Kubernetes component at a time, and it also explains what happens to the YAML files involved. The presentation is an excellent introduction to the inner workings of Kubernetes.
* [KUBERNETES FAILURE STORIES][4]. Kubernetes is not only roses and plain sailing. This blog post looks at what can go wrong with Kubernetes.

## .NET

* [Update on IAsyncDisposable and IAsyncEnumerator][3]. This [InfoQ][iq] blog post looks at changes made recently to the .NET Core async streams proposal.

## Streaming

* [Journey to Event Driven – Part 1: Why Event-First Thinking Changes Everything][5]. This article is the first in a series about event architecture. Event-driven architecture is a topic that I am extremely interested in, so I am really looking forward to next "episode" in the series.

## Microsoft Ignite The Tour

So, Microsoft Ignite The Tour did a stop in Johannesburg February 28 & 29, and I had the privilege to present at the conference. I did three sessions:

* [What is That Cup of Coffee Doing in my Database][7]: This 15-minute talk takes a look at the new Java integration in SQL Server 2019.
* [SQL Server Machine Learning Services: An E2E platform for machine learning][8]: We talk about how SQL Server Machine Learning Services can function as an end-to-end platform for AI and Machine Learning.
* [Deep dive on SQL Server and big data][9]: We look at how SQL Server 2019 Big Data Clusters work.

If you attended the conference and would like to get the slide decks, please [ping][ma] me as I cannot find where to upload them to.

I had a great time at the conference, kudos to the organizers!

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

[1]: https://www.infoq.com/presentations/containers-infrastructure-virtualization
[2]: https://www.infoq.com/presentations/kubernetes-yaml
[3]: https://www.infoq.com/news/2019/01/IAsyncDisposable-IAsyncEnume
[4]: https://srcco.de/posts/kubernetes-failure-stories.html
[5]: https://www.confluent.io/blog/journey-to-event-driven-part-1-why-event-first-thinking-changes-everything
[7]: http://bit.ly/2S3xtg8
[8]: http://bit.ly/2MvQySO
[9]: http://bit.ly/2sPvA8E