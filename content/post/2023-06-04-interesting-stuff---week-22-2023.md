---
type: post
layout: "post"
title: Interesting Stuff - Week 22, 2023
author: nielsb
date: 2023-06-04T09:09:44+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-22-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-22-23.jpg"
categories:
  - roundup
tags:
  - ai/ml
  - openai
  - Microsoft Fabric
  - Kafka
  - streamprocessing
description: This week's blog post covers generative AI for analytics, Microsoft Fabric, and real-time streaming. You will discover how to use natural language queries, Power BI, Kusto, stream processing platforms, and PII detection with machine learning.
---

In this week's blog post, I share some interesting links and insights on generative AI for analytics, Microsoft Fabric, and real-time streaming. You will see links about using natural language queries to access data in Amazon RDS using OpenAI and LangChain. 

How to leverage Microsoft Fabric to simplify and enhance your data solutions with Power BI and other Azure products and how to use Kusto Query Language and Kqlmagic in Fabric notebooks. 

How to compare and choose stream processing platforms for your use cases and detect and filter PII data from unstructured data streams using Confluent and machine learning. 

Check out the full post for more details and examples.

<!--more-->

## OpenAI

* [Generative AI for Analytics: Performing Natural Language Queries on Amazon RDS using SageMaker, LangChain, and LLMs][4]. The post linked to looks using generative AI for analytics. It demonstrates how to use LangChain's SQL Database Chain and Agent with OpenAI's `text-davinci-003`, a large language model (LLM), to perform natural language queries (NLQ) of an Amazon RDS for PostgreSQL database. It also explains the benefits of using LLMs to ask questions of data using natural language and how to use LangChain's Prompt Template, Query Checker, few-shot promoting, and retrieval-augmented generation (RAG) to improve the results. The post includes code snippets, screenshots, and sample outputs. Very, very cool!

## Microsoft Fabric

* [Build announcement: Microsoft Fabric][2]. This post discusses the announcement of **Microsoft Fabric** at Microsoft Build 2023. It talks about how Microsoft Fabric is an enhancement to Power BI that adds SaaS versions of many Microsoft analytical products to the Power BI workspace, now called a Fabric workspace. These products include Azure Synapse Analytics, Azure Data Factory, Azure Data Explorer, and Power BI. Microsoft Fabric simplifies the creation and management of data solutions by eliminating the need for subscriptions, storage, or configuration. It also uses the Delta Lake format for all data storage, which is open-sourced and compatible with many products. Microsoft Fabric is designed to run the entire data estate, from departmental projects to enterprise solutions.
* [End-to-end tutorials in Microsoft Fabric][3]. Speaking about **Microsoft Fabric**: in the post linked to, you find a comprehensive list of end-to-end tutorials available in Microsoft Fabric. These tutorials guide you through a scenario that covers the entire process, from data acquisition to data consumption. They're designed to help you develop a foundational understanding of the Fabric UI, the various experiences supported by Fabric and their integration points, and the professional and citizen developer experiences that are available.
* [Kusto in Fabric, with Magic][1]. This post looks at using **Kusto Query Language** (KQL) in **Microsoft Fabric** notebooks. the post explains how KQL can query and visualize data from various sources. It also shows how to use Kqlmagic, a command that extends the capabilities of the Python kernel in notebooks. The provides some examples of KQL queries and how to render the results. It concludes by recommending KQL as a powerful data analysis and exploration tool.

## Streaming

* [Real-Time Streaming Ecosystem - Part 4][4]. This is part four of [Hubert][5] 's series about the real-time streaming ecosystem. He discussed various streaming platforms in the last part, and I covered it [here][6]. In that post, he compared streaming platforms with stream processing platforms and discussed the differences. In this post, he dives into the stream processing platforms and discusses the various options available. He also discusses the differences between the multiple options and when to use which. The post is very comprehensive and covers a lot of ground. It's a must-read if you're interested in stream processing.
* [Automatic Real-Time PII Detection][7]. This post is about real-time PII detection via machine learning. The post explains how Confluent's PII Detection accelerator can help InfoSec teams to respond to threats quickly by identifying and filtering sensitive information from unstructured data streams. The post describes how Confluent augments existing SIEM and SOAR solutions by providing a data fabric for receiving, logging, processing, and sharing data with cyber-defence tools. The post also shows how to use stream processing and machine learning to normalize, enrich, and analyze data in motion. The post provides an overview of the PII Detection stream processing app, which uses natural language processing and named entity recognition to detect PII entities from text data. The post also demonstrates deploying and running the app using Confluent Cloud and Confluent Platform. The post includes code snippets, screenshots, and sample outputs.

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

[1]: https://brianbonk.dk/blog/kusto-in-fabric-with-magic/
[2]: https://www.jamesserra.com/archive/2023/05/build-announcement-microsoft-fabric
[3]: https://learn.microsoft.com/en-us/fabric/get-started/end-to-end-tutorials
[4]: https://garystafford.medium.com/generative-ai-for-analytics-performing-natural-language-queries-on-amazon-rds-using-amazon-f0e5c4132f6b
[5]: https://www.linkedin.com/in/hkdulay/
[6]: {{< relref "2023-05-21-interesting-stuff---week-20-2023.md" >}}
[7]: https://www.confluent.io/blog/real-time-pii-detection-via-ml/
