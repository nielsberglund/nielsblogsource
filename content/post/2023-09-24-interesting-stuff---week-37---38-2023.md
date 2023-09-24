---
type: post
layout: "post"
title: Interesting Stuff - Week 37 - 38, 2023
author: nielsb
date: 2023-09-24T20:50:07+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-38-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-38-23.jpg"
categories:
  - roundup
tags:
  - distributed computing
  - generativeai
  - azureopenai
  - flink
  - kafka
  - dapr
description: "Latest news from this we as well as the previous week: explore the Circuit Breaker Pattern. Dive into Distributed Computing with Dapr, revolutionize SQL queries with Azure Open AI. Join Data Saturday Cape Town, September 30, and more."
---

This roundup covers last week and this week: Explore the Circuit Breaker Design Pattern with insights from Waldemar and learn how it handles errors in distributed systems. Discover the world of Distributed Computing with Simon's exploration of Dapr's sidecar pattern, simplifying infrastructure interactions. 

Revolutionize SQL queries with Azure Open AI, delve into Langstream's Gen AI framework, enhance Azure OpenAI models with vector search in Azure Cosmos DB, and master Apache Flink's stream processing capabilities with Flink SQL. 

Join me at Data Saturday Cape Town on September 30th for deeper insights. 

<!--more-->

## Misc.

* [Circuit Breaker Design Pattern][1]. The post by [Waldemar][2], a mate of mine, is about the Circuit Breaker Design Pattern, which is a way to handle errors and failures in distributed systems. The post explains the purpose, the mechanism, and the benefits of the pattern and provides a code example in C#. The post also recommends a library called Polly that implements the pattern and other resilience policies.

## Distributed Computing

* [Building event-driven systems at scale in Kubernetes with Dapr — Part 2: How does Dapr work?][7]. This is part two of [Simon's][9] series about Dapr (you will find the first part [here][8]). In this post, Simon says, :smile: (explains) how Dapr works using the sidecar pattern, which runs a separate application alongside the main application to handle infrastructure interactions. The post also describes how Dapr components abstract various infrastructure services and how Dapr API and client enable communication between applications and Dapr sidecars. The post concludes with a vision of how Dapr can empower developers and operations engineers to build scalable systems with less effort. I am so looking forward to the next part of the series!

## Generative AI

* [Revolutionizing SQL Queries with Azure Open AI and Semantic Kernel][3]. This post is a tutorial on how to build a speech-enabled SQL query system using Azure Open AI, Semantic Kernel, and Azure Speech Services. The blog post guides the reader through setting up an Azure Open AI account, deploying a model, and integrating it with Semantic Kernel to translate natural language queries into SQL statements. The post also shows how Azure Speech Services can convert speech to text and synthesize speech from text. The post demonstrates how to interact with a SQL Server database using natural language and receive the results as spoken text. The post concludes with a vision of a future where data is not just queried but conversed with.
* [Build streaming Gen AI apps rapidly][4]. While reading the [September edition][5] of [Hubert's][hubert] newsletter, I came across [Langstream][4], a framework for building and running Generative AI (Gen AI) applications. It is designed to make it easy to build and run Gen AI applications that can process data in real-time. You can combine the power of Large Language Models (LLMs) like GPT-4 and vector databases like Astra DB and Pinecone with the agility of stream processing to create powerful Gen AI applications. It looks really interesting!
* [Vector search with data in Azure Cosmos DB][10]. This post is about how to use Retrieval Augmented Generation (RAG) and vector search to enhance Azure OpenAI models with data stored in Azure Cosmos DB. It explains the key concepts and benefits of RAG, which retrieves relevant data from external sources and integrates it into the model request. It also provides links to tutorials and sample code demonstrating different ways to implement RAG with Azure Cosmos DB using various APIs and services. The post aims to help developers build AI-powered applications leveraging their data in Azure Cosmos DB.

## Streaming

* [Your Guide to Flink SQL: An In-Depth Exploration][6]. The blog-post is part of a series that introduces Apache Flink and its features for stream processing. This post focuses on Flink SQL, a SQL engine that can process real-time and historical data. It covers how Flink SQL relates to other Flink APIs, how to create and query tables from various sources, and how to use various SQL operations and functions, such as joins, aggregations, windows, and pattern matching. It also explains choosing between streaming and batch processing modes in Flink SQL. 

## WIND (What Is Niels Doing)

As I wrote in the previous [roundup][11] [**Data Saturday Cape Town**][12] is coming up on the 30th of September, and I am prepping for my two sessions:

* **Unleash the Power of Azure OpenAI: Transforming AI Development on Microsoft Azure** - This is the session I presented at the Data Saturdays in Johannesburg and Durban a month or so ago. I am looking forward to presenting it again.
* **ksqlDB - The Real-Time Streaming Database** - As the title implies, I look at the awesomeness of ksqlDB and how it can be used. I have presented this session before, but never in South Africa.

Data Saturday Cape Town is FREE, so if you are in the area, please [register][12] and come along. I am looking forward to seeing you there!

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

[1]: https://waldemar.bearblog.dev/circuit-breaker-design-pattern/
[2]: https://www.linkedin.com/in/waldemar-muhl/
[3]: https://techcommunity.microsoft.com/t5/analytics-on-azure-blog/revolutionizing-sql-queries-with-azure-open-ai-and-semantic/ba-p/3913513
[4]: https://langstream.ai/
[5]: https://hubertdulay.substack.com/p/sup-sept
[6]: https://www.confluent.io/blog/getting-started-with-apache-flink-sql
[7]: https://headleysj.medium.com/building-event-driven-systems-at-scale-in-kubernetes-with-dapr-part-2-how-does-dapr-work-732ba7a0d652
[8]: https://headleysj.medium.com/building-event-driven-systems-in-kubernetes-with-dapr-part-i-dapr-vs-azure-functions-48f68a68fc22
[9]: https://www.linkedin.com/in/headleysj/
[10]: https://learn.microsoft.com/en-us/azure/cosmos-db/vector-search
[11]: {{< relref "2023-09-10-interesting-stuff---week-36-2023.md" >}}
[12]: https://datasaturdays.com/2023-09-30-datasaturday0044/
