---
type: post
layout: "post"
title: Interesting Stuff - Week 6, 2023
author: nielsb
date: 2023-02-12T09:46:31+02:00
comments: true
highlight: true
draft: false
image: images/banner/posts/wrup-06-23.jpg
thumbnail: images/banner/posts/wrup-06-23.jpg
categories:
  - roundup
tags:
  - Kafka
  - AI/ML
  - ChatGPT
  - Azure
description: "You can read about the fully managed Azure Load and Performance testing service. The open sourcing of LMOps: a collection of tools for improving text prompts used as input to generative AI models. Also interesting is vector search, and what you can do with it. Finally if you are interested in Kafka there is an excellent introductory guide to Kafka."
---

I came home from London a couple of days ago, and I can't tell you how good it is to be back home!

Among other things, what caught my eye for this week's roundup was that Azure now offers a managed load testing service and the open-sourcing of LMOps: a collection of tools for improving text prompts used as input to generative AI models. Also interesting is vector search and what you can do with it. Finally, if you are interested in Kafka, there is an excellent introductory guide to Kafka.

<!--more-->

## Azure

* [Microsoft's Fully-Managed Azure Load Testing Service Now Generally Available][1]. This post announces the general availability of **Azure Load Testing**, a fully-managed load-testing service allowing customers to test the resiliency of their applications regardless of where they are hosted. This is something we at [Derivco](/derivco) need to check out!

## AI/ML

* [Microsoft Open Sources AI Prompt Optimization Toolkit LMOps][2]. Using generative AI (Stable Diffusion, ChatGPT, etc.) is easy; you prompt the AI for what you want, and voila, out "pops" a result. Well, maybe it is not THAT easy, as the outcome depends to a large degree on the prompt. The prompt is a critical aspect of generative AI as it serves as the input that guides the generation of outputs. An effective and descriptive prompt can significantly impact the quality and accuracy of the generated content. So, what is described in this post is a godsend, Microsoft Research open-sourcing LMOps: a collection of tools for improving text prompts used as input to generative AI models.
* [How To Use Vector Search To Quickly Build A Content-Based Filtering Recommender System][3]. A vector search engine uses vector representations to perform similarity searches on large datasets. Using vector representations allows for more sophisticated search algorithms that can account for the context and relationships between items in the dataset, leading to more accurate and relevant search results. That is what the linked post shows, where it uses a vector search engine to build build a content-based filtering recommender system.

## Streaming

* [The Apache Kafka Handbook – How to Get Started Using Kafka][4]. This article is an excellent introduction to Kafka. It gives you the core knowledge around Kafka; how to install it, use the CLI, and how to build an application producing and consuming events via Kafka. Highly recommended!

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

[1]: https://www.infoq.com/news/2023/02/azure-load-testing-service-ga
[2]: https://www.infoq.com/news/2023/02/microsoft-lmops-tools/
[3]: https://pub.towardsai.net/how-to-quickly-build-a-content-based-filtering-recommender-system-using-a-vector-database-f6c52d444c94
[4]: https://www.freecodecamp.org/news/apache-kafka-handbook/