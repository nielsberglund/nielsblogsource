---
type: post
layout: "post"
title: Interesting Stuff - Week 45, 2022
author: nielsb
date: 2022-11-13T09:52:14+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - dataarchitecture
  - dataengineering
  - Kafka
  - Debezium
  - Azure
  - Azurefunctions
  - serverless
  - azure data explorer
description: Kafka CDC & Debezium, Azure Functions & SQL triggers, Azure Data Explorer e-book, Azure BootCamp SA 2022, and other interesting topics.
keywords:
  - dataarchitecture
  - dataengineering
  - Kafka
  - Debezium
  - Azure
  - Azurefunctions
  - serverless  
  - azure data explorer
---

![](/images/posts/bootcamp.jpg)

**<p style="text-align: center;"><em>BootCamp</em></p>**
**<p style="text-align: center;"><em>Photo by: <a href="https://www.istockphoto.com/portfolio/doble-d"> doble-d </a> on <a href="https://www.istockphoto.com"> iStock</a></em></p>**

Throughout the week, I read a lot of blog-posts, articles, and so forth that has to do with things that interest me:

* AI/data science
* data in general
* data architecture
* streaming
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Data Architecture / Engineering

* [Engineers Shouldn't Write ETL: A Guide to Building a High Functioning Data Science Department][1]. This post is from 2016, but still very relevant, and it resonates with me due to what we are doing at [Derivco](/derivco) right now. Without giving too much away (go and read the post), the post lays out a blueprint for building a data science team that can pivot and react quickly.
* [Data Engineering Annotated Monthly – October 2022][2]. Quite a few interesting things in this monthly Data Engineering newsletter. What I found of particular interest: Apache Doris, the official Spark Docker image, and the article about Data Engineers and plumbers.
* [Data's day of reckoning][3]. First, if you are into data but not subscribing to [Benn's newsletter][4], click on the link and go ahead and sign up. I will be waiting here... Cool, so where were we? Ah, this post essentially says: we cannot all be Netflix, Google, etc. - expect to have different data and that we should be more targeted in our ambitions. 

## Azure Data Explorer

* [Five Reasons to Dive into Azure Data Explorer][5]. This post contains a link to a downloadable e-book focusing on the five reasons that make ADX a good fit for businesses. If you are interested in ADX (and you should be), download the book. In addition, come to [Azure BootCamp South Africa 2022][6] in two weeks and hear me talk about ADX.

## Azure Functions

* [Announcing public preview of the Azure SQL trigger for Azure Functions][7]. Azure Functions is "da' bomb". We all know that! This post announces something that makes it even better: the ability to trigger a function from changes to a table(s) in Azure SQL DB. We have had for a while the ability to use Azure SQL Bindings to connect and write to Azure SQL DB, but this now gives us the ability to "listen" to changes in the database. Very cool!

## Streaming

* [Debezium Releases Version 2.0 of Its Change Data Capture Tool][8]. At [Derivco](/derivco), we are looking at using Debezium for quite a few use cases. Therefore the announcement in this post comes as music to our ears.

## WIND (What Is Niels Doing)

Well as I mentioned in last weeks [roundup][9] I am off to Seattle and the [**PASS Data Community Summit 2022**][10], where I present:

* **ksqlDB - The Real-Time Streaming Database**. As the title implies, the presentation is about **ksqlDB**.

I am flying out this evening and will be back in SA next Sunday. Then the following Saturday (November 26), I present at the [**Azure BootCamp South Africa 2022**][6] in Cape Town. There I am doing two talks:

* **Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer**
* **ksqlDB and Azure Serverless Functions: A Match Made in the Cloud**

This will be fun, [registration][11] is FREE, so you have no excuse not to attend! :smile:

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

[1]: https://multithreaded.stitchfix.com/blog/2016/03/16/engineers-shouldnt-write-etl
[2]: https://blog.jetbrains.com/big-data-tools/2022/11/09/data-engineering-annotated-monthly-october-2022/
[3]: https://benn.substack.com/p/day-of-reckoning
[4]: https://benn.substack.com/
[5]: https://azure.microsoft.com/en-us/resources/five-reasons-to-dive-into-azure-data-explorer/
[6]: https://azurebootcamp.co.za/
[7]: https://techcommunity.microsoft.com/t5/azure-sql-blog/announcing-public-preview-of-the-azure-sql-trigger-for-azure/ba-p/3674068
[8]: https://www.infoq.com/news/2022/11/debezium-change-data-capture/
[9]: {{< relref "2022-11-06-interesting-stuff---week-44-2022.md" >}}
[10]: https://www.passdatacommunitysummit.com/
[11]: https://www.eventbrite.com/e/azure-bootcamp-south-africa-2022-cape-town-tickets-443949844937