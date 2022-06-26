---
type: post
layout: "post"
title: Interesting Stuff - Week 25, 2022
author: nielsb
date: 2022-06-26T09:33:06+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Databricks
  - Kafka
  - Confluent Cloud
  - Azure functions
  - Microsoft OpenHack
description: Kafka & Azure Functions, Databricks Data Lakehouse & modelling, Microsoft OpenHack, and other interesting topics!
keywords:
  - Databricks
  - Kafka
  - Confluent Cloud
  - Azure functions
  - Microsoft OpenHack   
---

![](/images/posts/microsoft-open-hack-2022-1.jpg)

**<p style="text-align: center;">Microsoft Open Hack</p>**

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

## Data Architecture

* [Data Warehousing Modeling Techniques and Their Implementation on the Databricks Lakehouse Platform][2]. This post talks about the different data modelling techniques supported by the Databricks Lakehouse Platform and how each fits within each layer of the Bronze, Silver, and Gold architecture. For me, this post is very timely as we are right now implementing a Data Lakehouse here at [Derivco](/derivco)!

## Streaming

* [Migrating to a Multi-Cluster Managed Kafka with 0 Downtime][4]. This post discusses how they at [Wix][5] migrated 2000 microservices from on-prem Kafka clusters to Confluent Cloud. The post looks at critical design decisions and best practices for this type of migration.
* [Announcing GA launch of Kafka Trigger extension on Azure Functions][6]. As the title implies, this post announces the GA release of Kafka triggers. Kafka triggers enable you to invoke functions in response to messages in Kafka topics and let you write values/messages out to Kafka topics using an output binding. Very, very cool, and this comes at the right time for a project we are starting at [Derivco](/derivco)!
* [Applying Data Pipeline Principles in Practice: Exploring the Kafka Summit Keynote Demo][7]. The Kafka Summit 2022 key-note demo showed how a fictional airline company merges with another airline company and wants a data pipeline built on Confluent to enable analytical and operational workstreams. This blog post deconstructs the demo through excerpts of real code used to create it. Very interesting!

## WIND (What Is Niels Doing)

By now, you probably wonder what the picture at the top has to do with anything. So last week, Microsoft ran an [OpenHack][1] here at [Derivco](/derivco). The topic of the OpenHack was **Modern Data Warehousing**, covering Azure Data Lake Storage, Azure Databricks, Azure Synapse Analytics and other cool stuff. Anyway, the OpenHack ran for three days, and on the last day, Microsoft had an event in our canteen where Derivco's employees had the chance to talk to various people from Microsoft. 

Part of this event was the "selfie booth", and in the picture, you see me sitting beside [Lee-Anne James][3], who is our contact at Microsoft for all Data and AI. I cannot express enough how awesome she is. She really goes all out for us! Thanks, Lee-Anne!

So I mentioned the "selfie booth", and part of the deal was that if you took a selfie and published it on your blog, Twitter, LinkedIn, etc., you got some swag:

![](/images/posts/synapse-2.jpg)

**Figure 1:** *Azure Synapse Analytics Swag*

In *Figure 1* you see the swag I managed to score - not bad!

Oh, I also managed to publish a blog post around some "weird" Git errors:

* [Solution to GIT: "unsafe repository ('some-repo' is owned by someone else)"][8]. I recently re-formatted my PC, and after everything was installed again, I got a "weird" error when I tried to do a `git pull`. The post looks at why I got the error and how to fix it.

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

2022-06-25-solution-to-git-unsafe-repository-somerepo-is-owned-by-someone-else.md

[1]: https://openhack.microsoft.com/
[2]: https://databricks.com/blog/2022/06/24/data-warehousing-modeling-techniques-and-their-implementation-on-the-databricks-lakehouse-platform.html
[3]: https://www.linkedin.com/in/lee-anne-james-96514023/
[4]: https://medium.com/wix-engineering/migrating-to-a-multi-cluster-managed-kafka-with-0-downtime-b936655f888e
[5]: https://www.wix.com/
[6]: https://techcommunity.microsoft.com/t5/apps-on-azure-blog/announcing-ga-launch-of-kafka-trigger-extension-on-azure/ba-p/3499015
[7]: https://www.confluent.io/blog/data-pipeline-principles-use-cases-examples/
[8]: {{< relref "2022-06-25-solution-to-git-unsafe-repository-somerepo-is-owned-by-someone-else.md" >}}
