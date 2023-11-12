
---
type: post
layout: "post"
title: Interesting Stuff - Week 45, 2023
author: nielsb
date: 2023-11-12T10:00:11+02:00 
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-45-23.png"
thumbnail: "/images/thumbnails/posts/wrup-45-23.png"
categories:
  - roundup
tags:
  - GenerativeAI
  - LLMs
  - Streaming
  - Kafka
description: "This week, we dive into the latest in Generative AI and Streaming technologies, examining the intricacies of Large Language Models and the integration of Apache Kafka and Flink in real-time applications. I also share personal reflections on the successful AI/ML & Data Infusion Roadshow in Durban."
---

In this week's blog post, I delve into the fascinating world of Generative AI and Streaming technologies, sharing key insights and developments. We explore the complexities and innovations in building data pipelines for Large Language Models (LLMs), and the transformative role of Apache Kafka, Flink, and Vector Databases in real-time AI applications. 

Additionally, I reflect on the resounding success of the recent AI/ML & Data Infusion Roadshow in Durban, highlighting the enthusiastic response from attendees and the insightful contributions of our expert speakers. 

<!--more-->

## Generative AI

* [Building Data Pipelines to Create Apps with Large Language Models][1]. The blog-post from KDnuggets discusses the intricacies of building data pipelines for applications powered by Large Language Models (LLMs). It highlights two main approaches for LLM-powered apps: Fine-tuning and Retrieval Augmented Generation (RAG), with RAG being particularly popular for real-time processing scenarios. The post emphasizes the importance of data governance, quality assessment, and real-time syncing in creating effective LLM applications. The challenge lies in prototyping and deploying these systems in production, requiring enterprise-grade monitoring solutions to track pipelines and vector stores. This approach ensures that LLM apps remain at the forefront of natural language processing technology.
* [Start with Large Language Models (LLMs) in 2023][2]. This blog-post serves as a comprehensive guide for beginners looking to start and enhance their skills with Large Language Models (LLMs) in 2023, even without an advanced background in the field. It is tailored for individuals with some programming and machine learning knowledge, offering a flexible learning path that includes YouTube video introductions, books, articles, online courses, and practical exercises. The guide emphasizes the importance of repetition and learning from multiple sources for mastering LLMs. While some resources are free, others, like certain courses and books, may require payment, but they are recommended for a deeper understanding. The post encourages learners to share their journey and suggestions for additional resources on platforms like Twitter and LinkedIn.

## Streaming

* [Apache Kafka + Vector Database + LLM = Real-Time GenAI][3]. The blog-post explores the integration of Apache Kafka, Flink, and Vector Databases with Large Language Models (LLMs) to create real-time Generative AI (GenAI) applications. It emphasizes the role of data streaming in ingesting and curating real-time data at scale, which is crucial for GenAI use cases like service desk automation, chatbots, and content moderation. Apache Kafka is highlighted as a key orchestration layer in machine learning platforms, enabling the integration of various data sources and real-time model inference. The post also discusses the challenges of LLMs, such as expensive training, static data, lack of domain knowledge, and the risk of generating unreliable or fictional outputs (hallucinations). It introduces the Retrieval Augmented Generation (RAG) concept, which combines LLMs with accurate, up-to-date context using vector databases for semantic search. The article concludes by examining event-driven architectures and the trade-offs between event streaming and traditional request-response APIs in the context of GenAI enterprise architectures.

* [Build Streaming Apps Quickly with Flink SQL Workspaces][4]. This blog-post introduces the public preview of their serverless Apache Flink service, simplifying stream processing by eliminating the complexities of infrastructure management. This service offers the Flink SQL API, adhering to the ANSI standard, allowing anyone familiar with SQL to use Flink for data exploration, enrichment, and analysis. The post provides an overview of Confluent's new SQL Workspaces for Flink, designed for streaming data and fully integrated into Confluent Cloud for a unified experience. It discusses the transformation of SQL from batch processing to streaming SQL, maintaining its critical role in data management. The article also delves into the user experience around SQL in Confluent Cloud, highlighting the intuitive use of Flink SQL in this environment. The SQL Workspaces feature is browser-based, allowing users to write SQL against all their data within a region, and is integrated with Kafka data across a cloud region. The post emphasizes the adaptability of SQL to the streaming world, showcasing how Confluent's SQL Workspaces exemplify this evolution.

## WIND (What Is Niels Doing)

After the highly successful **AI/ML & Data Infusion Roadshow Durban**, I am taking some time to recoup and reflect on the event's triumph. The roadshow was exceptionally well-received, drawing in a deeply engaged audience each session. The speakers, who were top-notch in their fields, delivered insightful and thought-provoking presentations, contributing significantly to the event's success. Attendees expressed overwhelming positivity, praising the content's quality and the event's seamless organisation.  

This success is a testament to the growing interest and enthusiasm in the community for AI/ML and data in general. In the coming days, I will process the valuable feedback and insights that will undoubtedly shape future endeavours and contribute to the ongoing evolution of these dynamic and exciting events.

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

[1]: https://www.kdnuggets.com/building-data-pipelines-to-create-apps-with-large-language-models
[2]: https://pub.towardsai.net/start-with-large-language-models-llms-in-2023-9ecf9cdde2c5
[3]: https://www.kai-waehner.de/blog/2023/11/08/apache-kafka-flink-vector-database-llm-real-time-genai/
[4]: https://www.confluent.io/blog/flink-sql-workspaces/

