---
type: post
layout: "post"
title: Interesting Stuff - Week 51, 2023
author: nielsb
date: 2023-12-24T08:32:50+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-51-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-51-23.jpg"
categories:
  - roundup
tags:
  - generative ai
  - streamprocessing
  - RAG
  - kafka
  - Risingwave
description: "This week: dive into advanced RAG techniques, explore Microsoft's GPT-RAG, and discover the power of Kafka in Two-Phase Commit protocols. As we gear up for the festive season, join me in exploring cutting-edge AI applications and stream processing wonders."
---

This week's blog post is a treasure trove of Generative AI and Streaming insights! Dive into advanced RAG techniques, explore Microsoft's GPT-RAG, and discover the power of Kafka in Two-Phase Commit protocols. 

As we gear up for the festive season, join me in exploring cutting-edge AI applications and stream processing wonders. 

<!--more-->

## Generative AI

* [Advanced RAG Techniques: an Illustrated Overview][1]. The post delves into the world of Retrieval Augmented Generation (RAG), a method combining search algorithms with large language models (LLMs) to enhance the quality and relevance of generated content. The author systematically explores various advanced RAG techniques, emphasizing the importance of chunking and vectorization in creating efficient search indices. The piece also highlights the significance of query transformations and routing, using LLMs to refine and direct queries for better results. It's a comprehensive guide for developers looking to understand and implement RAG techniques in their systems, complete with references to open-source libraries like LangChain and LlamaIndex at the forefront of this technology. The article is a deep dive into the mechanics of RAG, offering insights into how it's shaping the future of information retrieval and generation.
* [Hands-On LangChain for LLM Applications Development: Documents Loading][2]. This blog post is a practical guide for developers integrating various data types into Large Language Model (LLM) applications using LangChain's document loaders. It highlights the necessity of transforming data from diverse sources and formats into a standardized form for efficient interaction with LLMs. The author walks through loading different types of documents, including PDFs, CSVs, Excel files, Word documents, YouTube videos, and HTML pages, showcasing LangChain's versatility with over 80 document loader types. This piece is particularly valuable for developers aiming to create applications that can "chat with your data," providing a foundational understanding of preparing and loading data for LLM applications.
* [Microsoft Launches GPT-RAG: A Machine Learning Library that Provides an Enterprise-Grade Reference Architecture for the Production Deployment of LLMs Using the RAG Pattern on Azure OpenAI][3]. As detailed in this article, Microsoft's introduction of GPT-RAG marks a significant advancement in deploying large language models (LLMs) within enterprise environments. GPT-RAG, a machine learning library, offers an enterprise-grade reference architecture specifically designed for the production deployment of LLMs using the Retrieval Augmentation Generation (RAG) pattern on Azure OpenAI. The library addresses the challenges of integrating LLMs into business settings, emphasizing security, scalability, and governance. It incorporates a robust security framework with zero-trust principles and features like Azure Virtual Network and Azure Front Door to ensure sensitive data is handled securely. The architecture is designed to auto-scale, adapting to fluctuating workloads and maintaining a seamless user experience. GPT-RAG's comprehensive observability system, including Azure Application Insights, allows businesses to monitor system performance and optimize LLM deployment. This solution is poised to revolutionize enterprise use of LLMs by providing a secure, scalable, and efficient framework for enhancing productivity and decision-making processes.
* [Build copilots with VISION | GPT-4 Turbo with Vision + Azure AI][4]. This YouTube video showcases the integration of GPT-4 Turbo with Vision (GPT-4V) and Azure AI to create powerful copilot-style applications. The video demonstrates how GPT-4V's extensive visual understanding capabilities can interpret and generate text-based responses from images, enhancing natural language processing and image recognition tasks. It highlights using Azure AI Studio as a single destination to leverage and experiment with GPT-4V. It shows practical examples like solving math problems from images, predicting future events from a series of pictures, and enhancing vacation rental listings with detailed descriptions and tips derived from images. The video also explores the combination of GPT-4V with Azure AI Vision for more detailed image analysis and Azure AI Search for retrieval augmented generation, enabling highly specific and accurate responses based on enterprise data. This integration allows for the development of sophisticated AI applications that can understand and interact with the world in a more human-like manner, opening up new possibilities for businesses to leverage AI for improved decision-making and productivity.
* [RAG in Action: Beyond Basics to Advanced Data Indexing Techniques][5]. This article delves into the complexities and advancements in Retrieval Augmented Generation (RAG) systems. The author discusses the evolution of document processing strategies, emphasizing the shift from simple document chunks to more sophisticated techniques like hierarchies, sentence windows, and auto-merge. The piece explores the nuances of data retrieval, including the balance between relevancy and similarity and the importance of choosing the right chunk size for effective information processing. It also touches on integrating knowledge graphs to provide a deterministic mapping of connections among various concepts, enhancing the RAG system's accuracy and reducing the likelihood of hallucinations. The article is a deep dive into the technical considerations and innovations in RAG implementation, offering insights into the future of data indexing and retrieval in AI applications.
* [Quickly Evaluate your RAG Without Manually Labeling Test Data][6]. The article linked to introduces an automated approach to evaluating Retrieval Augmented Generation (RAG) applications. The author emphasizes the importance of measuring RAG systems' performance, especially when deployed in production, as it provides critical feedback for parameter selection and overall system improvement. The article outlines a method to automatically generate a synthetic test set from the RAG's data, eliminating the need for manual labeling. It also provides an overview of popular RAG metrics and introduces the Ragas package for computing them on the synthetic dataset. The article is particularly valuable for developers and researchers working with RAG systems, offering a practical solution to streamline the evaluation process and enhance the performance of RAG applications.

## Streaming

* [An Apache Kafka® and RisingWave Stream Processing Christmas Special][7]. The blog post explores stream processing using Apache Kafka and RisingWave. As it is close to Christmas, the author proposes a hypothetical scenario where Santa's Elves need help matching toys and boxes due to a communication breakdown, leading to two separate production lines. The solution involves using Apache Kafka Streams and RisingWave, a new stream processing technology, to join two input streams and produce a single output stream, effectively matching the toys with the correct boxes. The blog provides a detailed walkthrough of setting up a Kafka Streams Toy and Box Matching Solution, including Kafka cluster, producers, and stream processor setup. It also introduces RisingWave Cloud and demonstrates how to create sources, sinks, and a RisingWave SQL pipeline to achieve the same toy-box matching goal.
* [KIP-939: Support Participation in 2PC][8]. This KIP (Kafka Improvement Proposals) is something that I want to see - to support participation in Two-Phase Commit (2PC) protocols within Kafka. The document specifically addresses Kafka's role as a participant in 2PC. It explains how Kafka's internal transactions are distributed and how the 2PC maps to Kafka's protocol. It also identifies the main requirement for a participant in a 2PC protocol: once prepared, it cannot abort or commit independently. It must wait for a decision made by the external transaction coordinator. The scope of the KIP is to enable Kafka to participate in a 2PC protocol and build a foundation for a dual-write recipe. The document details the solution requirements and constraints, proposed changes, public interfaces, RPC changes, and persisted data format changes. This KIP represents a significant enhancement to Kafka's transaction capabilities, particularly in the context of distributed systems and microservices architectures, where ensuring data consistency across different components and services is crucial. As a side note; I came across this KIP thanks to [Robin Moffat][rmoff]'s and [Gunnar Morling][10]'s excellent [Checkpoint Chronicle][9] newsletter. The Checkpoint Chronicle is a monthly roundup of interesting stuff in the data and streaming space. If you haven't seen it, I highly recommend subscribing to it.
* [Use the Message Browser in Confluent Cloud][11]. The Confluent Cloud Web UI is okay, but it has sorely lacked in being able to view messages. Well, that is until now. The documentation linked to provides a guide on using the Message Browser in Confluent Cloud Console. The Message Browser is a tool that allows users to view messages produced to a topic, offering functionalities like browsing message data across all partitions, seeking data from a specific offset or timestamp by partition, and downloading messages. This guide is a comprehensive resource for users needing to interact with and understand messages within their Kafka topics in Confluent Cloud. It provides clear instructions and explanations of the Message Browser's features and capabilities.

## WIND (What Is Niels Doing)

I am doing this:

![](/images/posts/santa-claus-3.png)

**Figure 1:** *Santa Claus is Coming to Town*

Today is Christmas Eve, and where I am from, we celebrate Christmas on Christmas Eve. So, I am enjoying the holidays, and I hope you are doing the same. I will take a short break from my weekly roundup posts and be back in the new year. I hope you have a great holiday season and a Happy New Year.

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

[1]: https://pub.towardsai.net/advanced-rag-techniques-an-illustrated-overview-04d193d8fec6
[2]: https://pub.towardsai.net/hands-on-langchain-for-llm-applications-development-documents-loading-43d889644845
[3]: https://www.marktechpost.com/2023/12/18/microsoft-launches-gpt-rag-a-machine-learning-library-that-provides-an-enterprise-grade-reference-architecture-for-the-production-deployment-of-llms-using-the-rag-pattern-on-azure-openai
[4]: https://youtu.be/KPTVu-AeG7g?si=XoskP3Q37FMPUIO4
[5]: https://howaibuildthis.substack.com/p/rag-in-action-beyond-basics-to-advanced
[6]: https://towardsdatascience.com/quickly-evaluate-your-rag-without-manually-labeling-test-data-43ade0ae187a
[7]: https://www.instaclustr.com/blog/apache-kafka-and-risingwave-stream-processing/
[8]: https://cwiki.apache.org/confluence/display/KAFKA/KIP-939%3A+Support+Participation+in+2PC
[9]: https://www.decodable.co/blog/checkpoint-chronicle-december-2023
[10]: https://www.linkedin.com/in/gunnar-morling-2b44b7229/
[11]: https://docs.confluent.io/cloud/current/client-apps/topics/messages.html
