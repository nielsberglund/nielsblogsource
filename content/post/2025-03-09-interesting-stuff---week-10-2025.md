---
type: post
layout: "post"
title: Interesting Stuff - Week 10, 2025
author: nielsb
date: 2025-03-09T09:27:24+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-10-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-10-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - streaming
  - Kafka
  - RisingWave
  - AI Agents
description: Dive in for the latest tech insights in whis week's roundup! We cover the latest in AI and streaming, from a must-read guide on LLMs to the rise of Agentic AI and its real-world impact. We also explore how real-time data is transforming capital markets and how Flink AI is redefining RAG applications.
---

AI is evolving fast, and this week's roundup dives into some of the most exciting developments! From a must-read guide on the foundations of LLMs to the rising power of Agentic AI, we explore the cutting edge of generative AI. 

In the streaming world, we look at how real-time data transforms capital markets and how Flink AI pushes the boundaries of RAG applications. Whether you're into AI, streaming, or both, there's plenty to unpack - let's dive in!

<!--more-->

## Podcast

If you rather listen to the summary:

<iframe title="Interesting Stuff Week 10, 2025" allowtransparency="true" height="150" width="100%" style="border: none; min-width: min(100%, 430px);height:150px;" scrolling="no" data-name="pb-iframe-player" src="https://www.podbean.com/player-v2/?i=rwfan-1832536-pb&from=pb6admin&share=1&download=1&rtl=0&fonts=Arial&skin=1&font-color=auto&logo_link=episode_page&btn-skin=7" loading="lazy"></iframe>

Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here](https://nielsitberglund.podbean.com/e/interesting-stuff-week-10-2025/).

## Generative AI

* [Foundations of Large Language Models](https://arxiv.org/pdf/2501.09223). This paper, titled "Foundations of Large Language Models", authored by Tong Xiao and Jingbo Zhu, is an introductory guide to the core concepts and techniques underpinning these powerful AI systems. The text begins by establishing the significance of LLMs within the field of artificial intelligence, highlighting their capacity to acquire world and language knowledge through large-scale pre-training. It then systematically delves into the fundamental building blocks, dedicating chapters to pre-training methodologies encompassing unsupervised, supervised, and self-supervised approaches, along with an in-depth exploration of the architecture and training of generative LLMs. Furthermore, the paper addresses critical aspects of scaling these models, including handling long sequences and the computational challenges of large-scale training. Finally, it examines prompting strategies for effectively eliciting desired behaviours from LLMs and the essential topic of alignment, focusing on techniques to ensure these models are safe and adhere to human values. This work provides a structured overview of the theoretical underpinnings and practical considerations vital to understanding and working with large language models. *My thoughts:* This paper is a **MUST-READ** for anyone who works with LLMs!
* [Agentic AI vs. AI Agents: A Technical Deep Dive](https://www.marktechpost.com/2025/03/03/agentic-ai-vs-ai-agents-a-technical-deep-dive/). This MarkTechPost article provides a technical exploration of the distinctions between AI Agents and the more advanced concept of Agentic AI. It begins by defining each term, highlighting that while both are autonomous, AI Agents typically operate within fixed scopes and follow a sense-decide-act loop. In contrast, Agentic AI exhibits greater autonomy and adaptability, capable of autonomously planning and executing complex, multi-step tasks with continuous learning. The article details the key technical differences in autonomy, learning, and reasoning alongside their respective architectures and underlying technologies. Finally, it illustrates these concepts with real-world applications across various sectors. It discusses their roles in multi-agent systems and human-AI collaboration, concluding that Agentic AI's advanced capabilities position it to significantly impact numerous industries.
* [A Practical Guide to Implementing DeepSearch / DeepResearch](https://jina.ai/news/a-practical-guide-to-implementing-deepsearch-deepresearch/). This blog post serves as a practical guide detailing the implementation of DeepSearch and DeepResearch, new approaches to information retrieval that move beyond traditional methods. It explains that DeepSearch employs an iterative searching, reading, and reasoning process to find comprehensive answers. DeepResearch builds upon this by providing a structured framework for generating lengthy research reports. The authors share their experiences developing an open-source version, highlighting key architectural decisions such as a reasoning loop with action constraints, gap question handling, and a unique approach to memory management that forgoes vector databases. Furthermore, the article discusses the surprising importance of query expansion and the necessity of robust web crawling and content processing, concluding with valuable insights into the essential and unexpectedly useful components for building deep search systems.
* [The AI Silo Problem: How Data Streaming Can Unify Enterprise AI Agents](https://seanfalconer.medium.com/the-ai-silo-problem-how-data-streaming-can-unify-enterprise-ai-agents-0a138cf6398c). This post identifies a growing problem termed the "AI silo problem," where numerous independent AI agents within an enterprise, such as those for CRM, data warehousing, and knowledge retrieval, operate in isolation. This fragmentation mirrors historical data silos and leads to duplicated effort, lost insights, and inefficiencies, as these agents lack a shared means of communication. The author argues that establishing a "shared language for AI agents" through an event-driven architecture based on data streaming platforms is the solution. By enabling agents to publish and subscribe to real-time event streams, they can collaborate, exchange insights, and coordinate actions dynamically, fostering a more interconnected and effective AI ecosystem across the organisation, moving away from isolated intelligence.

## Streaming

* [Stream Processing in Capital Markets: Real-Time Portfolio Monitoring and Risk Management](https://risingwave.com/blog/stream-processing-in-capital-markets-real-time-portfolio-monitoring-and-risk-management/). This blog post from RisingWave Labs introduces RisingWave, an open-source streaming database designed for real-time data processing and analytics. It highlights the product's core capabilities, comparing it with alternatives and showcasing various use cases, particularly within capital markets. The article then delves into a specific application: real-time portfolio monitoring and risk management, explaining why data freshness is critical in this domain and detailing how RisingWave's features, such as low-latency stream integration, efficient joins, and sliding window analytics, address these needs. Ultimately, the piece positions RisingWave as a powerful tool for building sophisticated real-time financial systems, emphasising its speed, scalability, and ease of use with SQL.
* [Flink AI: Hands-On FEDERATED_SEARCH()—Search a Vector Database with Confluent Cloud for Apache Flink](https://www.confluent.io/blog/flink-ai-rag-with-federated-search/). This Confluent blog post introduces a new capability within their Flink offering called FEDERATED_SEARCH(), which allows users to perform vector searches on external databases like Pinecone directly from Flink SQL. The context for this is Retrieval Augmented Generation (RAG), a technique for enhancing large language model outputs with information retrieved from external knowledge bases. By combining FEDERATED_SEARCH() with their existing ML_PREDICT() function for generating embeddings, Confluent enables the building of real-time, RAG-aware applications that can answer natural language queries using up-to-date, specific data within a streaming data platform. The article discusses a practical example of creating an airline FAQ chatbot using Pinecone as the vector database. It demonstrates how these Flink AI features can be orchestrated to provide intelligent responses. 

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post or [ping][ma] me if you have suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

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
[lemi]: https://www.linkedin.com/in/lemimasalu/
[michael]: https://www.linkedin.com/in/michaeladrianjohnson/
