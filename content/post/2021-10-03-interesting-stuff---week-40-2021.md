---
type: post
layout: "post"
title: Interesting Stuff - Week 40, 2021
author: nielsb
date: 2021-10-03T09:34:52+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - Azure
  - Azure Data Explorer
  - AWS Lambda
  - Azure Purview
description: Kafka & AWS Lambdas, Monitoring ingestion in Azure Data Explorer, Azure Purview, and other interesting topics.
keywords:
  - Kafka
  - Azure
  - Azure Data Explorer
  - AWS Lambda
  - Azure Purview   
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

## Big Data

* [Govern your data wherever it resides with Azure Purview][1]. This post looks at **Azure Purview**. Azure Purview is a unified data governance solution that helps you achieve a complete understanding of your data. This is regardless of whether it's housed on-premises in services like SQL Server and Oracle, in different clouds like Amazon Web Services (AWS) S3, or SaaS applications like Salesforce. This is something we dearly need at [Derivco](/derivco)!

## Azure Data Explorer

* [Monitor batching ingestion with ADX Insights][2]. **ADX Insights** is a system providing comprehensive monitoring of your ADX clusters. This post talks about the new Ingestion monitoring feature that allows you to monitor the status of batching ingestion operations to ADX. Very cool!

## Streaming

* [Trigger AWS Lambda Functions Directly from an Apache Kafka Topic][3]. This post looks at how you can stream data from Confluent Cloud Kafka topics into Amazon DynamoDB tables by triggering an AWS Lambda function - providing a completely serverless architecture. I need to test this out on Azure using **Azure Functions**!

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

[1]: https://azure.microsoft.com/en-us/blog/govern-your-data-wherever-it-resides-with-azure-purview/
[2]: https://techcommunity.microsoft.com/t5/azure-data-explorer/monitor-batching-ingestion-with-adx-insights/ba-p/2673509
[3]: https://www.confluent.io/blog/serverless-kafka-streaming-with-confluent-cloud-and-aws-lambda/
