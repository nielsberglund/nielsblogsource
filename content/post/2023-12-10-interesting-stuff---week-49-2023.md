---
type: post
layout: "post"
title: Interesting Stuff - Week 49, 2023
author: nielsb
date: 2023-12-10T09:24:24+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-49-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-49-23.jpg"
categories:
  - roundup
tags:
  - Dapr
  - distributed computing
  - generative ai
  - LLMs
  - RAG
description: "Explore the frontiers of AI in my latest blog post! Dive into Simon Headley's insights on Kubernetes with Dapr, unravel the mysteries of AGI with Youssef Hosni, and discover the innovative uses of Retrieval Augmented Generation. Plus, get Andrej Karpathy's unique perspective on LLMs' 'hallucination problem'."
---

🚀 Welcome to this week's exploration of AI's cutting-edge! Join me as I delve into Simon Headley's insights on scaling event-driven systems in Kubernetes with Dapr, and Youssef Hosni's comprehensive overview of Artificial General Intelligence. 

We'll also uncover the potential of Retrieval Augmented Generation in enhancing LLM responses, guided by Eduardo Alvarez, and navigate through Leonie Monigatti's strategies for optimizing RAG applications. Plus, don't miss Andrej Karpathy's unique take on the "hallucination problem" in LLMs, offering a fresh perspective on AI's creative capabilities.

<!--more-->

## Distributed Computing

* [Building event-driven systems at scale in Kubernetes with Dapr — Part III: What does "at scale" really mean?][1]. In this, the third part of his series on building event-driven systems in Kubernetes with Dapr, my colleague and mate [Simon Headley][2] delves into the practicalities of scaling such systems. He shares his experience as a Senior Software Engineer, focusing on the challenges and solutions in constructing a near real-time, AI/ML-driven event system. Headley highlights how Dapr helps avoid common pitfalls like creating a distributed monolith, simplifies service discovery, and enables parallel computing with virtual actors. He emphasizes Dapr's role in building fault-tolerant, observable systems and illustrates the scale of their operations, handling 320 million events per day on Azure Kubernetes Service. This insightful piece sheds light on the technical aspects of Dapr and the real-world implications of scaling complex systems in a cloud environment.

## Generative AI

* [Comperhisve Introduction to Artificial General Intelligence (AGI)][3]. In this comprehensive overview, Youssef Hosni explores the intriguing and complex Artificial General Intelligence (AGI) world. He distinguishes AGI from narrow AI, emphasizing AGI's goal to achieve human-level intelligence across various domains. The article delves into the current state of AGI research, highlighting the significant technical challenges that remain. Additionally, Hosni addresses the debates surrounding the potential implications of developing highly intelligent systems. This piece is an insightful introduction to AGI, offering a clear understanding of its objectives, progress, and the broader conversations it sparks in the AI community.
* [Retrieval Augmented Generation (RAG) Inference Engines with LangChain on CPUs][4]. Eduardo Alvarez's article delves into the world of Retrieval Augmented Generation (RAG) and its application in AI, particularly focusing on its use in large language models (LLMs) on CPU platforms. He begins by refreshing our understanding of inference in AI, emphasizing its critical role in user experience. Alvarez then introduces RAG, a technique that enhances LLM responses by retrieving additional information from relevant data sources. The article highlights the architectural benefits of RAG, such as scalability and improved response fidelity, and discusses the efficiency of optimized models in enhancing performance. Alvarez also explores the role of CPUs in supporting RAG, noting their ubiquity and cost-efficiency. The piece concludes with a hands-on example of implementing RAG with LangChain on the Intel Developer Cloud, offering readers a practical insight into the operational aspects of RAG systems. This comprehensive article not only explains the technicalities of RAG but also demonstrates its practical applications in improving AI inference engines.
* [A Guide on 12 Tuning Strategies for Production-Ready RAG Applications][5]. Leonie Monigatti's article is a detailed guide on optimizing Retrieval-Augmented Generation (RAG) applications for production environments. She emphasizes the importance of tuning various "hyperparameters" and strategies across different stages of an RAG pipeline. In the ingestion stage, Monigatti suggests improvements through data cleaning, chunking, embedding models, metadata, multi-indexing, and indexing algorithms. For the inferencing stage, she focuses on query transformations, retrieval parameters, advanced retrieval strategies, re-ranking models, choice of Large Language Models (LLMs), and prompt engineering. This comprehensive guide is a valuable resource for data scientists and developers looking to enhance the performance of their RAG applications, offering practical insights into each aspect of the pipeline. Monigatti's article is a must-read for anyone working with RAG systems, providing a thorough understanding of the intricacies involved in fine-tuning these complex AI applications. 
* [LLMLingua: Innovating LLM efficiency with prompt compression][6]. In this article, Microsoft Research's Lingua team explores the role of prompt compression in improving the efficiency of large language models (LLMs). They begin by highlighting the importance of LLMs in AI applications and the challenges they pose regarding efficiency. The article then introduces prompt compression, a technique that reduces the size of LLM prompts without compromising their performance. The Lingua team explains the technicalities of prompt compression, emphasizing its role in improving LLM efficiency. They also discuss the challenges of implementing prompt compression and the potential solutions to overcome them. This article is a valuable resource for data scientists and developers looking to improve the efficiency of their LLMs, offering a clear understanding of the role of prompt compression in enhancing LLM performance.
* [Andrej Karpathy LLM Paper Reading List for LLM Mastery][7]. In this compelling article, Youssef Hosni highlights a curated reading list by [Andrej Karpathy][8], a renowned AI researcher of Tesla and OpenAI fame, focusing on Large Language Models (LLMs). This list serves as a valuable resource for those delving into the complexities of LLMs. The article lists the recommended papers and provides insightful commentary and context, enhancing the reader's understanding of the pivotal concepts and methodologies in LLM research. This journey through Karpathy's reading list offers novice and seasoned AI enthusiasts a comprehensive roadmap to understanding and mastering LLMs. It's a compelling exploration of the frontiers of AI research, shedding light on the evolution of LLMs and their significant role in the broader field of artificial intelligence.
* [On the "hallucination problem"][9]. In this "tweet by [Andrej Karpathy][8], he offers a nuanced perspective on the "hallucination problem" in Large Language Models (LLMs). He suggests that hallucination is inherent to LLMs, describing them as "dream machines" that generate content based on a vague recollection of their training data. The issue of hallucination arises only when these "dreams" venture into factually incorrect realms. Karpathy contrasts this with search engines, which lack creativity and only regurgitate existing data, highlighting that LLMs are entirely creative but need help maintaining factual accuracy. He acknowledges that while LLMs themselves don't have a hallucination problem, LLM Assistants like ChatGPT do, and suggests various research methods like Retrieval Augmented Generation (RAG) to mitigate hallucinations by anchoring responses in real data. He concludes that hallucination is not a bug but a feature of LLMs, though it poses a problem for LLM Assistants that needs addressing.

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

[1]: https://headleysj.medium.com/building-event-driven-systems-at-scale-in-kubernetes-with-dapr-part-iii-what-does-at-scale-7c15dfa64338
[2]: https://www.linkedin.com/in/headleysj/
[3]: https://pub.towardsai.net/comperhisve-introduction-to-artificial-general-intelligence-agi-78ebbc6ec8e5
[4]: https://towardsdatascience.com/retrieval-augmented-generation-rag-inference-engines-with-langchain-on-cpus-d5d55f398502
[5]: https://towardsdatascience.com/a-guide-on-12-tuning-strategies-for-production-ready-rag-applications-7ca646833439
[6]: https://www.microsoft.com/en-us/research/blog/llmlingua-innovating-llm-efficiency-with-prompt-compression/
[7]: https://pub.towardsai.net/andrej-karpathy-llm-paper-reading-list-for-llm-mastery-89e751ad0cc1
[8]: https://twitter.com/karpathy
[9]: https://twitter.com/karpathy/status/1733299213503787018
