---
type: post
layout: "post"
title: Interesting Stuff - Week 49, 2022
author: nielsb
date: 2022-12-11T11:10:56+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - AI-ML
  - data architecture
  - big data
  - Kafka
description: Kafka consumer groups, ChatGPT VM, autoscaling data pipelines, can we handle analysis, and other interesting topics.
keywords:
  - AI-ML
  - data architecture
  - big data
  - Kafka   
---

![](/images/posts/ai.jpg)

**<p style="text-align: center;"><em>AI</em></p>**
**<p style="text-align: center;"><em>Photo by: <a href="https://www.istockphoto.com/portfolio/Thinkhubstudio"> Thinkhubstudio </a> on <a href="https://www.istockphoto.com"> iStock</a></em></p>**

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

## AI/ML

* [Building A Virtual Machine inside ChatGPT][2]. In last week's roundup, I mentioned ChatGPT, and here is more about its coolness. This post looks at running a virtual machine inside ChatGPT! I don't know about you, but to me, this is plain scary!
* [AI Homework][4]. Related to ChatGPT - this post looks, among other things, at how ChatGPT works under the covers. Very interesting!

## Data Architecture

* [Build Reliable and Cost Effective Streaming Data Pipelines With Delta Live Tables' Enhanced Autoscaling][1]. Earlier this year, Databricks announced the general availability of Delta Live Tables (DLT). An ETL framework which introduces a simple, declarative approach to building reliable data pipelines. This post looks at a new feature of DTL: Enhanced Autoscaling for Delta Live Tables (DLT), which allows analysts and data engineers to quickly create production-ready streaming or batch data pipelines.
* [How analysis dies][5]. I found this post very thought-provoking, and I liked it a lot. So much so that I am forwarding it to other people at [Derivco](/derivco). However, I have difficulty summarizing it, so why don't you just read it yourselves :smile:!

## Streaming

* [What Are Apache Kafka Consumer Group IDs?][6]. This an excellent post about an often misunderstood concept in Kafka: consumer groups. If you write any Kafka applications, read this post!

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

[1]: https://www.databricks.com/blog/2022/12/08/build-reliable-and-cost-effective-streaming-data-pipelines.html
[2]: https://www.engraved.blog/building-a-virtual-machine-inside/
[3]: {{< relref "2022-12-04-interesting-stuff---week-48-2022.md" >}}
[4]: https://stratechery.com/2022/ai-homework/
[5]: https://benn.substack.com/p/how-analysis-dies
[6]: https://www.confluent.io/blog/configuring-apache-kafka-consumer-group-ids