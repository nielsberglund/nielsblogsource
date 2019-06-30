---
type: post
layout: "post"
title: Interesting Stuff - Week 12, 2019
author: nielsb
date: 2019-03-24T08:37:01+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services 
  - Kubernetes
  - Azure Data Studio
  - Kafka
description: Kafka, Azure Data Studio, Istio & Kubernetes, and other interesting topics.
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services 
  - Kubernetes
  - Azure Data Studio
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

## .NET

* [Unit Testing Strategies & Patterns in C#][1]. This [InfoQ][iq] presentation discusses design principles and ways to make C# code testable, as well as using testing tools such as Moq, Autofixture, & MsTest.

## Distributed Computing

* [Istio Routing Basics][2]. So, [Istio][3] is an open source service mesh, and this blog post covers the basics of Istio and shows what it takes to build an Istio enabled "Hello World" application.
* [Distributed Tracing Infrastructure with Jaeger on Kubernetes][4]. The blog post I link to here looks at distributed tracing on Kubernetes using Jaeger.

## SQL Server

* [The March release of Azure Data Studio is now available][5]. What the title says! There are quite a few new features in the March release of Azure Data Studio, among them: support for SQL Notebooks, PowerShell extension, and PostgresSQL support. Go and get it!

## Streaming

* [Kafka Streams’ Take on Watermarks and Triggers][6]. This blog post discusses a new Kafka Streams operator: `Suppress`. It gives you the ability to control when to forward KTable updates. The `Suppress` operator comes in very handy in various CEP scenarios: "tell me when someone has done "a" more than "x" times within "y" time period". What normally happens is that if someone achieves the "a", "x" times within the "y" time period every following "a" would trigger as well. With `Suppress` you - wait for it - suppress the extra "a", until the end of the time period.  

## WIND (*What Is Niels Doing*)

Since I did the two posts about `CREATE EXTERNAL LIBRARY` for Java code ([here][7] and [here][8]), I thought it would be a good idea to finish off my [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) series. So, I am at the moment working on a post discussing `CREATE EXTERNAL LIBRARY` in the R world. The post is somewhat like the ones covering Java, but it also covers permissions etc.

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

[1]: https://www.infoq.com/presentations/csharp-testing-strategy-tools
[2]: https://medium.com/google-cloud/istio-routing-basics-14feab3c040e
[3]: https://cloud.google.com/istio/
[4]: https://medium.com/@masroor.hasan/tracing-infrastructure-with-jaeger-on-kubernetes-6800132a677
[5]: https://cloudblogs.microsoft.com/sqlserver/2019/03/18/the-march-release-of-azure-data-studio-is-now-available/
[6]: https://www.confluent.io/blog/kafka-streams-take-on-watermarks-and-triggers
[7]: {{< relref "2019-03-10-sql-server-2019-java--external-libraries---i.md" >}}
[8]: {{< relref "2019-03-17-sql-server-2019-java--external-libraries---ii.md" >}}

