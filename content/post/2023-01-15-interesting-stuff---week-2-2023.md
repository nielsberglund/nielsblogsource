---
type: post
layout: "post"
title: Interesting Stuff - Week 2, 2023
author: nielsb
date: 2023-01-15T08:43:52+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-02-23.jpg"
categories:
  - roundup
tags:
  - AI/ML
  - OpenAI
  - Kafka
  - Flink
  - Flink SQL
description: This weeks roundup includes links to articles and videos about using Azure OpenAI and deploying ML models with FastAPI and Azure, as well as a post about Change Data Capture and its patterns. I also discuss my experience with trying to run Flink SQL in Docker. In short, the Flink Docker experience could be better!
---

This weeks roundup includes links to articles and videos about using Azure OpenAI and deploying ML models with FastAPI and Azure, as well as a post about Change Data Capture and its patterns. 

I also discuss my experience with trying to run Flink SQL in Docker. In short, the Flink Docker experience could be better!

<!--more-->

## AI/ML

* [Use Natural Language & Prompts with AI Models | Azure OpenAI Service][1]. Azure OpenAI is a service offered by Microsoft's Azure cloud computing platform that allows developers to easily deploy and use models developed by OpenAI. This YouTube video examines how you can interact with models using natural language, prompts, and few-shot learning. The video also covers using the Azure OpenAI Studio to experiment and test your models before bringing them into your code to deliver differentiated app experiences.
* [Deploying ML Models with FastAPI and Azure][2]. Imagine you have spent weeks and weeks creating an "awesome" ML model - that was the easy part. The hard part is how to productionalize the model; get it into production. [FastAPI][3] is a Python API framework that allows you to build APIs primarily through type hinting and function decorators. This article covers the basics of deploying your model with FastAPI and Azure. Having read the article, you should be able to deploy a wrapper for your model on Azure using basic CI/CD. 

## Streaming

* [Succeeding with Change Data Capture][4]. Change data capture (CDC) converts all the changes that occur inside your database into events and publishes them to an event stream. You can then use these events to power analytics, drive operational use cases, hydrate databases, and more. Different patterns can be used when using CDC, and this post looks more in detail at those.

## WIND (What Is Niels Doing)

I have been interested in Apache Flink throughout the years but have never done anything with it. That (not doing anything) changed with the announcement about [Confluent acquiring Immerok][6]. I realized that Flink will become a big part of the Confluent ecosystem and that getting some insights into Flink is a good idea.

So now I am "playing around" with Flink and trying to come to grips with it. More specifically, I am working with [Flink SQL][7]. I run Flink in Docker, or rather I try to. The Flink support for Docker is nowhere where it should be. At least IMHO. Anyway, I am getting there, and I hope I'll have a blog post fairly soon about my "trials and tribulations".

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

[1]: https://youtu.be/3t3qZu1Dy1k
[2]: https://datastud.dev/posts/ml-fastapi
[3]: https://fastapi.tiangolo.com/
[4]: https://www.confluent.io/blog/how-change-data-capture-works-patterns-solutions-implementation/
[5]: {{< relref "2023-01-08-interesting-stuff---xmas-new-year-2022-week-1-2023.md" >}}
[6]: https://www.confluent.io/blog/cloud-kafka-meets-cloud-flink-with-confluent-and-immerok/
[7]: https://nightlies.apache.org/flink/flink-docs-master/docs/dev/table/sql/gettingstarted/
