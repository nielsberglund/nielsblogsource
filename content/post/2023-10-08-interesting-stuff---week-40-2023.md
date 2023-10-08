---
type: post
layout: "post"
title: Interesting Stuff - Week 40, 2023
author: nielsb
date: 2023-10-08T20:14:49+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-40-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-40-23.jpg"
categories:
  - roundup
tags:
  - ai/ml
  - generativeai
  - agi
  - kafka
  - flink
description: "This week: discover the latest in AI/ML with Ray's game-changing compute runtime, the quest for Artificial General Intelligence, and the power of data streaming in critical decision-making. Plus, master Apache Flink with a comprehensive blog series."
---

This week: Dive into the dynamic world of AI/ML and streaming technology. Explore Ray, the groundbreaking compute runtime, and the rise of RAG-Fusion in information retrieval. 

Delve into the pursuit of Artificial General Intelligence (AGI) in 2023 and discover how data streaming empowers Elemental Cognition's AI platform. 

Plus, get ready to master Apache Flink with an essential resource. Stay updated and informed with our insights into the tech landscape.

<!--more-->

## AI/ML

* [Ray: The Next Generation Compute Runtime for ML Applications][1]. Ray is an open-source unified compute framework that makes scaling AI and Python workloads easy — from reinforcement learning to deep learning to tuning and model serving. This [InfoQ][iq] presentation introduces Ray's basic API and architectural concepts and dives deeper into some of its innovative ML use cases.
* [Forget RAG, the Future is RAG-Fusion][2]. This blog-post discusses the emergence of Retrieval Augmented Generation (RAG) technology and its impact on information retrieval. The post acknowledges the benefits of RAG but also points out some challenges: constraints with current search technologies, human search inefficiencies, and oversimplification of search. To address these issues, the blog-post introduces a concept called RAG-Fusion. RAG-Fusion aims to bridge the gap between user queries and their actual intent. It does this by generating multiple user queries and reranking the search results using techniques like Reciprocal Rank Fusion (RRF).
* [How Close Are We to AGI?][3]. The blog-post linked to discusses the rapid pace of technological advancements in 2023 and the increasing interest in Artificial General Intelligence (AGI). AGI is defined as a system that can perform intellectual tasks as humans do without assistance. The post highlights research and development efforts to progress toward AGI, including deep learning and reinforcement learning. The blog-post concludes by emphasizing the need to wait for future technological advancements to gauge our proximity to AGI.

## Streaming

* [How Data Streaming Powers an AI Platform for When You Can't Afford to Be Wrong][4]. This blog-post discusses how Elemental Cognition (EC) uses data streaming powered by Confluent Cloud to enhance its AI platform for critical decision-making. EC combines large language models (LLMs) with custom domain models to deliver provably correct results in complex scenarios, overcoming the shortcomings of LLMs alone, such as hallucinations and limited problem-solving capabilities. The platform, represented by products like Cogent and Cora, ensures that customers can rely on accurate and optimal solutions by exposing its reasoning and data sources. Confluent Cloud helps EC maintain data provenance, scale, and resilience, enabling real-time AI reasoning across various industries, including life sciences and travel planning, while ensuring reliability and performance.
* [Apache Flink][5]. For those interested in Kafka and following what happens in the Kafka ecosystem, you know that Confluent is going all in on Flink. That means that now is a good time to learn Flink. The link here will help you with that. It is not a blog-post as such, but it links to a series of blog-posts by [Robin Moffatt][rmoff] on Apache Flink. The series is a great introduction to Apache Flink and covers topics like: [**Learning Apache Flink S01E01: Where Do I Start?**][6], [**Learning Apache Flink S01E02: What is Flink?**][7], [**Learning Apache Flink S01E03: Running my First Flink Cluster and Application**][8]. This is a must read if you want to learn Flink.

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
[hubert]: https://www.linkedin.com/in/hkdulay/
[jserra]: https://www.linkedin.com/in/jamesserra/

[1]: https://www.infoq.com/presentations/ray-ml/
[2]: https://towardsdatascience.com/forget-rag-the-future-is-rag-fusion-1147298d8ad1
[3]: https://www.kdnuggets.com/how-close-are-we-to-agi
[4]: https://www.confluent.io/blog/data-streaming-powers-trustworthy-AI/
[5]: https://rmoff.net/categories/apache-flink/
[6]: https://rmoff.net/2023/09/29/learning-apache-flink-s01e01-where-do-i-start/
[7]: https://rmoff.net/2023/10/02/learning-apache-flink-s01e02-what-is-flink/
[8]: https://rmoff.net/2023/10/05/learning-apache-flink-s01e03-running-my-first-flink-cluster-and-application/
