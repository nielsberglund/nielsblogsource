---
type: post
layout: "post"
title: Interesting Stuff - Week 22, 2024
author: nielsb
date: 2024-06-02T08:36:00+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-22-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-22-24.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Generative AI
  - Kafka
  - Streaming
  - Data & AI Community Day Durban
  - Season of AI
description: "Discover KQL's new features, FinRobot's AI for finance, and Microsoft's synthetic data techniques for AI privacy. Plus, learn how to prevent AI hallucinations with Kafka and Flink, and get ready for the Data & AI Community Day Durban!"
---

🚀 This week in tech news: Discover KQL's new capabilities in Azure Data Explorer, empowering data management with update and delete statements. 

Explore FinRobot, an open-source AI platform for financial tasks, and Microsoft's synthetic data techniques ensuring AI privacy. Learn how RAG, Kafka, and Flink reduce AI hallucinations with real-time data. 

Finally, dive into Confluent's best practices for Terraform and solutions to the dual-write problem, plus exciting updates for the upcoming Data & AI Community Day Durban! 🌟

<!--more-->

## Azure Data Explorer

* [New KQL Updates & Deletes][1]. The blog post "Updates and Deletes" on DCODE BI explores the significant new capabilities of the Kusto Query Language (KQL) in Azure Data Explorer and Real-Time Intelligence in Fabric. It elaborates on how update and delete statements can be leveraged to manipulate data in storage, thereby enhancing data management. The post underscores the adaptability of KQL for those well-versed in SQL. However, due to potential cost and efficiency concerns, it also issues a word of caution against using KQL for constructing full data warehouses. For instance, the frequent use of update and delete statements can result in higher storage costs and slower query performance. My thoughts: This is a monumental development for Azure Data Explorer and KQL. I'm eagerly looking forward to putting it to the test.  

## Generative AI

* [FinRobot: A Novel Open-Source AI Agent Platform Supporting Multiple Financially Specialized AI Agents Powered by LLMs][2]. This article illuminates the development of FinRobot by the AI4Finance Foundation and collaborators. This open-source platform harnesses large language models (LLMs) to bolster multiple AI agents specialized in financial tasks such as market forecasting and document analysis. The platform's transformative mission is to empower the financial industry by democratizing access to advanced financial analysis tools. It achieves this by seamlessly integrating sophisticated AI models into its architecture, thereby enhancing decision-making capabilities across the sector.
* [The Crossroads of Innovation and Privacy: Private Synthetic Data for Generative AI][3]. This Microsoft Research blog post examines synthetic data creation to address privacy concerns in AI model training. It spotlights innovative techniques like differential privacy and explores novel methods for ensuring data privacy while preserving utility. The post delves into various approaches, including the use of differentially private stochastic gradient descent and foundation model APIs, to generate realistic synthetic data for diverse applications, such as machine learning and statistical analysis.
* [Real-Time GenAI with RAG using Apache Kafka and Flink to Prevent Hallucinations][4]. This blog post dives into how Retrieval Augmented Generation (RAG) can bolster generative AI by integrating real-time, context-specific data using Apache Kafka and Flink. It underscores the architecture's crucial role in reducing AI hallucinations by providing up-to-date, relevant information. It also showcases practical applications like Expedia's use of chatbots for customer service. This approach harnesses Kafka's data streaming and Flink's processing capabilities to create a robust, reliable system for enterprise-level AI solutions.

## Streaming

* [Best Practices for Confluent Terraform Provider][5]. The blog post by Confluent, linked here, provides strategies for efficiently managing Confluent Cloud infrastructure using Terraform. It covers essential practices such as segregating state files, using modules, splitting resources into environment-specific directories, iterating over maps and objects, and enforcing consistent naming conventions. Additionally, it emphasizes the importance of avoiding hard-coded values, managing a single Kafka cluster per workspace, and implementing robust secrets management strategies to enhance security and reliability.
* [Solving the Dual-Write Problem: Effective Strategies for Atomic Updates Across Systems][6]. This blog post addresses the challenges of ensuring atomic updates across different systems, using scenarios like updating a database and messaging system simultaneously. It critiques anti-patterns like reversing operations or relying solely on database transactions. It presents effective solutions such as the transactional outbox pattern, event sourcing, and the listen-to-yourself pattern. These methods involve separating writes into independent processes to ensure consistency and reliability in distributed systems. My thoughts: recently, we, [Derivco](/derivco), implemented the transactional outbox pattern for streaming. It has solved a lot of problems for us.

## WIND (What Is Niels Doing)

I have a couple of announcements around [**Data & AI Community Dat Durban:Season of AI**][7]:

![](/images/posts/kpmg-office-dbn.jpg)

**Figure 1:** *KPMG Hosting the Event*

We have a venue! KPMG is the venue sponsor for the event, and they host us at their corporate offices in Umhlanga's affluent business district!

The second announcement is that registration for the event has opened! You can register [here][8]. Seeing how quickly the tickets went for our previous event, I suggest you register as soon as possible.

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

[1]: https://dcode.bi/blog/updates-and-deletes
[2]: https://www.marktechpost.com/2024/05/26/finrobot-a-novel-open-source-ai-agent-platform-supporting-multiple-financially-specialized-ai-agents-powered-by-llms/
[3]: https://www.microsoft.com/en-us/research/blog/the-crossroads-of-innovation-and-privacy-private-synthetic-data-for-generative-ai/
[4]: https://www.kai-waehner.de/blog/2024/05/30/real-time-genai-with-rag-using-apache-kafka-and-flink-to-prevent-hallucinations/
[5]: https://www.confluent.io/blog/best-practices-confluent-terraform-provider/
[6]: https://www.confluent.io/blog/dual-write-problem/
[7]: https://aimldatadurban.org/events/2024/season-of-ai-1/
[8]: https://www.quicket.co.za/events/264747-data-ai-community-day-durban-season-of-ai/#/
