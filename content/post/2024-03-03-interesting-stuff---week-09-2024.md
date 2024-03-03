---
type: post
layout: "post"
title: Interesting Stuff - Week 09, 2024
author: nielsb
date: 2024-03-03T13:11:15+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-09-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-09-24.jpg"
categories:
  - roundup
tags:
  - Dapr
  - CosmosDB
  - distributed computing
  - generative AI
  - RAG
  - Kafka
  - Streamprocessing
  - Copilot Studio
description: "Dive into this week's blog for a tech-packed journey, from cutting-edge scalable systems and LLM data indexing to the latest in Apache Kafka and real-time sentiment analysis. Plus, get highlights from my Generative AI presentation at the Global Power Platform Bootcamp."
---

This week's blog post is a whirlwind tour through the latest in tech, from Sicelumusa Khumalo's groundbreaking strategies in scalable systems to the intricacies of data indexing for LLMs. 

We'll also dive into the new features of Apache Kafka® 3.7.0 and explore the dynamic realm of real-time sentiment analysis with Kafka and PySpark. Plus, I'll share insights from my recent presentation at the Global Power Platform Bootcamp, where we delved into the transformative power of Generative AI with Microsoft Copilot Studio and Azure OpenAI.

<!--more-->

## Distributed Computing

* [Maximizing Efficiency in Scalable Systems: Part I — Reducing costs of consumption-based state stores by up to 97% when using Dapr actors at scale][1]. In this blog post by my colleague Sicelumusa Khumalo, Musa shares a compelling case study on using Dapr and Azure CosmosDB to manage a staggering 320 million events per day in a scalable, event-driven system. The piece highlights the significant cost associated with maintaining such a system, mainly due to the consumption-based billing of CosmosDB. The author presents a solution that involves compressing the actor state before saving it to CosmosDB, which led to a dramatic reduction in document size and, consequently, a 97% decrease in RU consumption. This resulted in substantial cost savings and maintained, if not improved, the system's response time due to faster I/O operations with smaller data sizes. The article thoughtfully weighs the pros and cons of this approach, setting the stage for a discussion on integrating such compression techniques directly into the Dapr SDK.

## Generative AI

* [Advanced RAG series: Indexing][2]. In this article, the author delves into the intricate process of preparing data for retrieval and generation to ensure accuracy and avoid hallucinations in responses. The article emphasizes the critical role of indexing in making data easily understandable for Large Language Models (LLMs) without losing context, highlighting the challenges posed by LLMs limitations, such as real-time data handling, context window size, and the "lost in the middle" issue. Through engaging examples and detailed explanations, the author explores various indexing strategies, including chunk optimization, multi-representation indexing, specialized embeddings, and hierarchical indexing, each tailored to enhance the efficiency and accuracy of data retrieval in different scenarios. This comprehensive guide not only sheds light on the technical aspects of indexing but also underscores its significance in improving the performance of LLMs in complex, multi-step reasoning tasks.

## Streaming

* [Introducing Apache Kafka 3.7][3]. The release of Apache Kafka® 3.7.0 marks a significant milestone in the evolution of this distributed event streaming platform, introducing many new features and improvements. Some highlights covered in this blog post: the early access release of JBOD (Just a Bunch Of Disks) support in KRaft mode, enhancing storage flexibility and resilience. This version also deprecates client APIs prior to 2.1 and Java 11 support for the Kafka broker, signalling a shift towards more modern dependencies. Furthermore, Kafka 3.7.0 enriches the ecosystem with advancements like the simplified Consumer Rebalance Protocol, leader discovery optimizations for clients, and introducing an official Docker image for Apache Kafka. These enhancements streamline operations and pave the way for more efficient and scalable Kafka deployments.
* [Real-Time Sentiment Analysis with Kafka and PySpark][4]. In the rapidly evolving digital landscape, the ability to process data in real-time is becoming increasingly crucial for businesses to stay ahead. This article delves into the world of real-time data streaming pipelines, highlighting the importance of tools like Apache Kafka and Spark in managing large data streams efficiently. Through a practical example, it walks readers through setting up an end-to-end sentiment analysis process, demonstrating how these technologies can be leveraged to extract actionable insights from streaming data. This hands-on approach not only underscores the significance of real-time data processing but also showcases the power of combining Kafka and PySpark to drive timely decision-making in a data-driven business environment.

## WIND (What Is Niels Doing)

As I wrote in the roundup two weeks ago, this Saturday, I attended [**Global Power Platform Bootcamp 2024 South Africa**][5], where I presented **Revolutionizing Conversations: Unleashing the Power of Generative AI with Microsoft Copilot Studio and Azure OpenAI**. 

The event was a great success, and I had a lot of fun presenting. I also learned a lot from the other presenters and the attendees. I am looking forward to the next event.

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
[rmoff]: https://www.linkedin.com/in/robinmoffatt/
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

[1]: https://spharah.medium.com/maximizing-efficiency-in-scalable-systems-part-i-reducing-costs-of-consumption-based-state-d114ffc17f80
[2]: https://div.beehiiv.com/p/advanced-rag-series-indexing
[3]: https://www.confluent.io/blog/introducing-apache-kafka-3-7/
[4]: https://pub.towardsai.net/real-time-sentiment-analysis-with-kafka-and-pyspark-145cd2338455
[5]: https://www.linkedin.com/posts/activity-7169784108276027392-nS2N
