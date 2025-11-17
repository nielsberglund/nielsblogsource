---
type: post
layout: "post"
title: Interesting Stuff - Week 46, 2025
author: nielsb
date: 2025-11-16T12:53:09+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-46-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-46-25.jpg"
categories:
  - roundup
tags:
  - generativeai
  - llms
  - Azure OpenAI
  - async programming
  - .NET Conf
  - dotnetconfsa
  - aimldatadurban
  - mcp
  - season of ai
description: "Explore 10 game-changing AI research papers from Transformers to Model Context Protocol, discover how async programming delivers 11x Azure OpenAI performance gains, and learn why small language models are revolutionizing agentic AI with 30x cost savings. Plus: .NET Conf 2025 South Africa updates."
---

This week's roundup explores the foundational research papers that transformed AI from an academic curiosity into production-ready technology, covering everything from the revolutionary Transformer architecture to the Model Context Protocol, which enables standardised tool integration. We examine critical performance optimisation techniques for Azure OpenAI deployments, where asynchronous programming delivers 11x speed improvements by parallelising tasks instead of processing them sequentially. 

The spotlight then shifts to a paradigm-challenging analysis of why small language models with fewer than 10 billion parameters are proving architecturally superior for agentic AI systems, potentially delivering 30 times the cost savings while matching the performance of their trillion-parameter cousins on specialised tasks. Finally, I share updates from the successful .NET Conf 2025 Durban event and preview the upcoming roadshow, which will visit Cape Town and Johannesburg, where I'll explore Model Context Protocol integration with C# and Azure AI.

<!--more-->

## Generative AI

* [**🚀 10 Game-Changing AI Papers Every Engineer Should Know in 2025**][1]. Mahendra Medapati delivers an exceptional deep dive into the 10 foundational research papers that transformed AI from an academic curiosity into the transformative technology reshaping industries today. Starting with the revolutionary 2017 "Attention Is All You Need" paper, which introduced the transformer architecture, the author breaks down how self-attention mechanisms enabled models like GPT-4, Claude, and Gemini to understand context across entire conversations, rather than processing text one word at a time. The post brilliantly contextualises GPT-3's few-shot learning breakthrough, demonstrating how 175 billion parameters enabled models to perform new tasks with just a handful of examples—eliminating the need for thousands of labelled examples and weeks of training time that previously made AI customisation prohibitively expensive for most organisations.

  This post by MahendraMedapati excels at bridging theoretical breakthroughs with practical engineering applications that developers can implement immediately. The coverage of Chain-of-Thought prompting reveals how simply adding "Let's think step by step" can dramatically improve AI reasoning on complex tasks. The RAG (Retrieval-Augmented Generation) section explains how modern AI systems ground their responses in current, verifiable information, rather than relying solely on training data. The discussion of LoRA (Low-Rank Adaptation) is particularly valuable for practitioners, as it shows how fine-tuning models now requires 10,000 times fewer trainable parameters and 3 times less GPU memory, truly democratising AI customisation by making it accessible on consumer hardware rather than requiring expensive cloud infrastructure.

  **Here's what strikes me most about this compilation**: The author has curated papers that represent genuine architectural paradigm shifts rather than incremental improvements. The progression from Transformers through few-shot learning, RAG, and efficient fine-tuning methods, such as LoRA, tells the story of AI's evolution from laboratory curiosity to production-ready technology. The inclusion of newer developments, such as Constitutional AI for alignment and the Model Context Protocol (MCP) for standardised tool integration, demonstrates how the field is maturing beyond raw capability toward reliability, safety, and interoperability. For developers building AI-powered applications in 2025, understanding these papers isn't just an academic exercise; it's the difference between knowing which tools to reach for and why they work, versus blindly following tutorials without grasping the fundamental principles that make modern AI systems effective and economical to deploy.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Implement Asynchronous Programming in Azure OpenAI for Task Parallelization.**][2]. Akash Verma, in this post, examines a critical performance optimisation technique that many developers overlook when integrating Azure OpenAI into production applications: asynchronous programming for task parallelisation. The article demonstrates how sequential API calls create unnecessary bottlenecks, using a perfect analogy: washing dishes one at a time versus running a dishwasher while simultaneously cooking. Asynchronous operations fundamentally change resource utilisation patterns. The Python implementation showcases three essential keywords (asyncio, async, and await) that enable concurrent task execution, with the author providing practical code examples for both embedding generation and question-answering workflows. The performance metrics tell a compelling story: embedding generation for 50 documents drops from 20 seconds to just 1.8 seconds when using asynchronous calls, while answering six basic questions shrinks from 12.5 seconds to 4 seconds, representing speed improvements of 11 times and 3 times, respectively.

  This post excels at bridging theoretical async concepts with immediately actionable Azure OpenAI implementation patterns that deliver measurable business value. The code examples demonstrate proper configuration of Azure OpenAI credentials, integration with pandas for data processing, and the use of nest_asyncio to handle event loop management in notebook environments. What makes this particularly valuable for production systems is the scalability consideration, as request volumes increase, the gap between synchronous and asynchronous performance widens dramatically. The article emphasises that this approach becomes essential when handling "huge numbers of requests," transforming applications from sluggish sequential processors into responsive concurrent systems that maximise Azure OpenAI throughput while minimising latency and infrastructure costs.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Why Small Language Models Are Taking Over Agentic AI**][3]. Fabio Yáñez Romero looks at a fundamental inefficiency plaguing modern agentic AI systems in this post: the industry's reflexive dependency on trillion-parameter frontier models for tasks that require only a narrow slice of their capabilities. Drawing on recent Nvidia research, the article argues that small language models (SLMs) with fewer than 10 billion parameters aren't only sufficient for most agent workloads but also architecturally superior for them. The performance metrics are striking: NVIDIA's Nemotron Nano 9B V2 achieves comparable accuracy to Qwen3-8B while delivering 6.3 times higher throughput on reasoning tasks, and SLMs can reduce inference costs by 10 to 30 times compared to frontier models. The article dismantles several sacred cows of AI architecture, demonstrating how frontier LLMs suffer from communication overhead when sharded across multiple GPUs, storage nightmares when fine-tuning quantised models, and context window exhaustion from over-reliance on RAG and MCP techniques rather than baking knowledge into model weights through targeted training.

  This post by Fabio Yáñez Romero excels at presenting a practical roadmap for organisations trapped in expensive LLM dependency cycles. The six-step conversion algorithm, data collection from production workloads, LLM-as-judge curation, unsupervised task clustering, architecture-aware SLM selection, efficient LoRA fine-tuning, and continuous iteration based on production metrics, provides a clear migration path from general-purpose giants to specialised executors. The proposed architecture pattern is elegantly simple: frontier LLMs handle high-level orchestration (parsing intent, decomposing tasks, and handling exceptions), while purpose-trained SLMs execute repetitive operations (SQL generation, API formatting, and structured data parsing). This division of labour mirrors object-oriented programming principles, where failures can be isolated to specific components rather than requiring wholesale system redesign. It enables the kind of iterative optimisation that is impossible with API-only frontier models, where practitioners have no control over weights or training pipelines.

  **What fascinates me most about this shift is how it exposes the current AI bubble's fundamental economics problem**. The article points out that companies deploying frontier LLMs are not yet profitable, as paying users subsidise free-tier users, while subscription models can't offset operational costs. We might be witnessing the "database wars" pattern repeating itself: initially, everyone assumed you needed Oracle's enterprise-grade power for every application, until MySQL and PostgreSQL proved that specialised, right-sized solutions delivered better performance at dramatically lower cost for 90% of use cases. The benchmark blind spot Fabio identifies is particularly troubling. HumanEval contamination and misaligned complexity metrics mean we're optimising for mathematical olympiad problems while real agents need consistent execution of modest-complexity tasks at scale. The practitioners who build SLM-based agentic systems first will operate at a fundamentally different cost structure than competitors, still paying premium prices for general-purpose intelligence they barely use. Are we on the verge of seeing the democratisation of agentic AI, or will the complexity of integration create new gatekeeping barriers?

## WIND (What Is Niels Doing)

I've just wrapped .NET Conf 2025 Community Edition South Africa in Durban, and by all measurable standards, it was a resounding success. Over 100 attendees came through the doors at Richfield College Umhlanga Campus, and the evaluation scores tell the story of an event that hit the mark: 6.79/7 for the overall event, 6.67/7 for sessions, and 6.70/7 for speakers. These aren't just numbers; they're validation that bringing world-class developer conferences to underserved markets works when you remove gatekeeping barriers and focus on genuine community value.

You'd think I might get some rest now, but no. I'm already deep into preparation mode for the .NET Conf 2025 roadshow, which will visit Cape Town on November 22 and Johannesburg on November 29. My talk is locked in: **C# + MCP + Azure AI: Building Conversational Enterprise Applications That Actually Work**, exploring how to use Model Context Protocol servers from C#. The easy part? Knowing what to talk about. The small detail keeping me up at night? Actually creating the demo code. Fortunately, I've got a couple of days to make that magic happen.

When Cape Town and Johannesburg wrap, there's no holiday slowdown in sight. [**Data & AI Community Day Durban: Season of AI - Merry Christmas People (MCP)**][10] is scheduled for December 13, and the [**Call for Speakers**][11] is now open for submissions. No rest for the wicked, as they say, but for me, this relentless pace of community building is where the real impact happens, one sold-out event at a time.

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

[1]: https://pub.towardsai.net/10-game-changing-ai-papers-every-engineer-should-know-in-2025-ddff05ad1bff?sk=v2%2Fc57a4b1f-d443-4846-92e2-648cfddc293c
[2]: https://pub.towardsai.net/implement-asynchronous-programming-in-azure-openai-for-task-parallelization-c26430491d7c?sk=v2%2F42c17e6c-ac21-4cf3-8b43-48f264866015
[3]: https://pub.towardsai.net/why-small-language-models-are-taking-over-agentic-ai-dc64de6426ea?sk=v2%2Fcb191e3e-1972-4e2b-87f0-172110d2a9ed
[10]: https://aimldatadurban.org/events/2025/season-of-ai-mcp/
[11]: https://sessionize.com/soai-durban-mcp/
