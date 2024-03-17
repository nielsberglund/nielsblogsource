---
type: post
layout: "post"
title: Interesting Stuff - Week 11, 2024
author: nielsb
date: 2024-03-17T17:36:03+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-11-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-11-24.jpg"
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
description: "This week: featuring breakthroughs from causal graphs to LDB frameworks, RAGs, and the innovative RAT method. Plus, get excited for the upcoming Data and AI Community Day in Durban!"
---

Dive into this week's tech digest, where we explore groundbreaking advancements from causal graphs in data science to the innovative LDB framework in code debugging. Discover the art of designing RAGs for enhanced chatbot interactions and the integration of knowledge graphs for accuracy. 

Plus, get a sneak peek into the future with LLM Agents and the transformative Retrieval Augmented Thoughts (RAT) method. Join us as we unravel these fascinating developments and gear up for the upcoming Data and AI Community Day in Durban!

<!--more-->

## Data Science

* [Using Causal Graphs to answer causal questions][2]. In the realm of causal inference, this article demystifies the concept of causal graphs and their pivotal role in distinguishing causes from mere correlations. Through a practical case study in Python, the author illustrates how causal graphs, or Directed Acyclic Graphs (DAGs), can be constructed to answer complex causal questions, offering a clear advantage over traditional machine learning models that often fall short in identifying causal relationships. The article delves into the intricacies of Structural Causal Models (SCMs), showcasing their ability to model causal relationships and account for confounders, colliders, and mediators, providing a more robust framework for making informed decisions based on causal reasoning. This insightful piece highlights the limitations of conventional machine learning in causal analysis. It paves the way for a deeper understanding of how causal graphs can be leveraged to drive more accurate and reliable insights in various domains.

## Generative AI

* [Can LLMs Debug Programs like Human Developers? UCSD Researchers Introduce LDB: A Machine Learning-Based Debugging Framework with LLMs][1]. In a groundbreaking stride towards enhancing code debugging, researchers from the University of California, San Diego, have unveiled the Large Language Model Debugger (LDB). This innovative framework takes a novel approach by breaking down programs into fundamental blocks, allowing for a detailed examination of variable states throughout execution. This method significantly surpasses traditional debugging techniques by providing a more nuanced understanding of code, enabling large language models to pinpoint and rectify errors with unprecedented precision. The LDB framework not only marks a significant advancement in debugging technologies but also promises to refine the process of automated code generation, making it more reliable and efficient for developers worldwide.
* [Designing RAGs][3]. This article offers a comprehensive guide on the intricacies of designing Retrieval-Augmented Generation systems (RAGs), a crucial component in enhancing chatbots with the ability to access and utilize external data for more accurate and informed responses. The author shares insights from his own experience, highlighting the numerous design decisions that can significantly influence a RAG-based Large Language Model's performance, behaviour, and cost. The article breaks down the RAG system into five main components: Indexing, Storing, Retrieval, Synthesis, and Evaluation, each with its own design choices and trade-offs. This piece serves as a valuable resource for anyone looking to navigate the complex landscape of RAG system design, providing a clear framework and useful tips to ensure the creation of efficient, scalable, and effective RAG-based applications.
* [Enhancing RAG-based application accuracy by constructing and leveraging knowledge graphs][4]. This blog post delves into the innovative integration of knowledge graphs with Retrieval-Augmented Generation (RAG) applications to significantly enhance their accuracy. By leveraging the structured nature of graph databases, such as Neo4j, alongside LangChain's capabilities, the author demonstrates how to construct and utilize knowledge graphs to provide RAG applications with a deeper and more contextual understanding of data. The post walks readers through the entire process, from setting up a Neo4j environment and ingesting data to constructing the knowledge graph and implementing a hybrid retrieval system that combines vector, keyword, and graph-based methods. This comprehensive guide showcases the potential of combining graph databases with RAG. It also simplifies the complex process of knowledge graph construction, making it accessible to a broader audience interested in advancing their RAG-based applications.
* [Intro to LLM Agents with Langchain: When RAG is Not Enough][5]. This tutorial introduces the concept of LLM Agents, which go beyond the capabilities of Retrieval-Augmented Generation (RAG) systems by incorporating elements like memory, reasoning, and tool usage. Drawing inspiration from the structure of the human brain, Honchar explains how to construct agents that can perform complex tasks such as searching for information and saving it in a specific format. The tutorial, supported by practical examples and code snippets available on GitHub and Colab, delves into the nuances of planning strategies, different types of memory, and the integration of various tools to enhance the functionality of LLM agents. This comprehensive guide highlights the limitations of current tools like GPT-4. It provides a structured approach to building more sophisticated and capable AI agents using Langchain, a platform for operationalizing LLM applications.
* [Retrieval Augmented Thoughts (RAT): An AI Prompting Strategy that Synergies Chain of Thought (CoT) Prompting and Retrieval Augmented Generation (RAG) to Address the Challenging Long-Horizon Reasoning and Generation Tasks][6]. As detailed in this article, the Retrieval Augmented Thoughts (RAT) method represents a significant leap in enhancing the reasoning capabilities of Large Language Models (LLMs). Developed by researchers from Peking University, UCLA, and the Beijing Institute for General Artificial Intelligence, RAT synergizes the Chain of Thought (CoT) prompting with Retrieval Augmented Generation (RAG) to tackle the issue of maintaining factual accuracy over complex, multi-step reasoning tasks. This innovative approach iteratively revises the model's generated thoughts by incorporating relevant external information, thereby reducing the occurrence of hallucinations - instances where the model generates plausible but factually incorrect information. RAT has shown remarkable improvements across various tasks, including code generation, mathematical reasoning, creative writing, and task planning, demonstrating its potential as a versatile and universally applicable solution for enhancing the performance of LLMs.

## WIND (What Is Niels Doing)

In the [previous roundup][7], I mentioned how we, the [**Azure, AI/ML & Data Community Durban**][8] group, finally have gotten into gear and are planning an event for April 27, 2024: the **Data and AI Community Day Durban**. In the post just mentioned, I said the call for speakers (CfS) had just opened and that attendee registration would open soon. That is now! The attendee registration is open, and you can register [here][9]. 

As you know by now, the full-day event is free, and as always, we'll have an incredible lineup of speakers. As mentioned in the previous post, the event is being held at the stunning offices of **BETSoftware** in Umhlanga, Durban:

![](/images/posts/bet-Sea-Side.jpg)

**Figure 1:** *BETSoftware Offices*

If you are interested in speaking, the CfS is still open, and you can submit your session [here][10]. 

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

[1]: https://www.marktechpost.com/2024/03/09/can-llms-debug-programs-like-human-developers-ucsd-researchers-introduce-ldb-a-machine-learning-based-debugging-framework-with-llms
[2]: https://towardsdatascience.com/using-causal-graphs-to-answer-causal-questions-5fd1dd82fa90
[3]: https://towardsdatascience.com/designing-rags-dbb9a7c1d729
[4]: https://blog.langchain.dev/enhancing-rag-based-applications-accuracy-by-constructing-and-leveraging-knowledge-graphs/
[5]: https://towardsdatascience.com/intro-to-llm-agents-with-langchain-when-rag-is-not-enough-7d8c08145834
[6]: https://www.marktechpost.com/2024/03/12/retrieval-augmented-thoughts-rat-an-ai-prompting-strategy-that-synergies-chain-of-thought-cot-prompting-and-retrieval-augmented-generation-rag-to-address-the-challenging-long-horizon-reasoning
[7]: {{< relref "2024-03-10-interesting-stuff---week-10-2024.md" >}}
[8]: https://www.meetup.com/azure-transformation-labs/
[9]: https://aimldatadurban.org/events/2024/data-ai-community-day-dbn-1/#registration
[10]: https://aimldatadurban.org/events/2024/data-ai-community-day-dbn-1/#speakers
