---
type: post
layout: "post"
title: Interesting Stuff - Week 39, 2019
author: nielsb
date: 2019-09-29T13:17:50+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - kafka
  - distributed computing
  - Kubernetes
  - .NET Core
description: Kafka, Rockset, .NET Core, Kubernetes, and other interesting topics.
keywords:
  - kafka
  - distributed computing
  - Kubernetes
  - .NET Core   
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

* [Announcing .NET Core 3.0][1]. The title says it all, .NET Core 3.0 is now released! Go and [get it][2]!
* ["Stubs" in the .NET Runtime][3]. This post is another performance related post by [Matthew][mattw]. In the post, he discusses "Stubs" which is used in the .NET framework to provide a level of indirection. The post explores what they are, how they work, and why they're needed.

## Data

* [Why Do You Need Data Engineers And What Do They Do?][4]. This is an interesting post discussing the importance of data engineers.

## Distributed Computing

* [On Sharding][5]. This post by [Tim Bray][6], (of XML fame), discusses different types of sharding in high traffic scenarios. It is always interesting to read what Tim has to say, as he has tremendous experience in all aspects of computing.
* [Components of Kubernetes Architecture][7]. I can warmly recommend this post to anyone interested in Kubernetes. The post gives a handy overview of the components of Kubernetes.

## Streaming

* [Every Company is Becoming ~~a~~ Software ~~Company~~][8]. In this blog post, [Jay Kreps][9], co-founder and CEO of Confluent, makes the point that not only businesses use more software, but that, increasingly, a business is defined in software. He goes on to discuss how Apache Kafka can help companies to re-architect themselves around event streaming, which he sees as the future.
* [Real-Time Analytics and Monitoring Dashboards with Apache Kafka and Rockset][10]. This blog post looks at how we can build analytics and monitoring on top of Apache Kafka using [Rockset][11]. This is something I want to look into for a couple of our [Derivco](/derivco) projects.

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

[1]: https://devblogs.microsoft.com/dotnet/announcing-net-core-3-0/
[2]: https://dotnet.microsoft.com/download/dotnet-core/3.0
[3]: https://mattwarren.org/2019/09/26/Stubs-in-the-.NET-Runtime/
[4]: https://www.theseattledataguy.com/why-do-you-need-data-engineers-and-what-do-they-do/
[5]: https://www.tbray.org/ongoing/When/201x/2019/09/25/On-Sharding
[6]: https://en.wikipedia.org/wiki/Tim_Bray
[7]: https://levelup.gitconnected.com/components-of-kubernetes-architecture-6feea4d5c712
[8]: https://www.confluent.io/blog/every-company-is-becoming-software
[9]: https://www.linkedin.com/in/jaykreps/
[10]: https://www.confluent.io/blog/analytics-with-apache-kafka-and-rockset
[11]: https://rockset.com/