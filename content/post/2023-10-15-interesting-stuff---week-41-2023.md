---
type: post
layout: "post"
title: Interesting Stuff - Week 41, 2023
author: nielsb
date: 2023-10-15T11:53:08+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-41-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-41-23.jpg"
categories:
  - roundup
tags:
  - databases
  - generativeai
  - autogen
  - Kafka
description: "Dive into the latest tech trends this week: F1 DB, GPT-4 AI agents, LangChain 101, AutoGen LLM apps, and real-time social media monitoring."
---

🚀 This week dive into a world of tech wonders this week! Discover Google's groundbreaking F1 distributed SQL database. Create your AI agent with LangChain and GPT-4. E

Explore the future of AI with LangChain 101, revolutionize LLMs with AutoGen. Unveil the power of AI in real-time social media monitoring. 

<!--more-->

## Databases

* [Paper Notes: F1 – A Distributed SQL Database That Scales][1]. This blog-post looks at **F1**, a distributed relational database built at Google to support AdWords domain1. It is based on Spanner, a globally distributed database providing strong consistency and high availability. F1 introduces a hierarchical schema, a distributed query engine, and an asynchronous schema change mechanism to overcome scalability and reliability challenges. F1 also supports various features such as change history, transactions, and SQL interface. Very interesting!

## Generative AI

* [How to Build Your First AI Agent with LangChain and OpenAI GPT.][2]. The post is a tutorial on how to build an AI agent with LangChain and OpenAI GPT-4. It explains the difference between standard large language models and AI agents and how to use the ReAct framework to make GPT-4 reason and act with tools such as Google Search and a calculator. It also provides a step-by-step guide and a code snippet to create an AI agent that can answer questions about NBA statistics. The post also includes useful links and resources for further learning. This is so cool!
* [LangChain 101: Part 2d. Fine-tuning LLMs with Human Feedback][3]. This blog-post, which is part of the course [**LangChain 101**][4], explains how to use reinforcement learning from human feedback (RLHF) to improve the performance of pre-trained large language models (LLMs) for specific tasks or domains. It describes the RLHF pipeline, which involves fine-tuning a base model with supervised data, creating a reward model with human rankings, and optimizing the model with proximal policy optimization (PPO). It also compares different RLHF techniques, such as InstructGPT, Llama2, and ReST, and provides code examples for implementing RLHF. I suggest you read the entire course; it is awesome!
* [AutoGen: Enabling next-generation large language model applications][5]. The post linked to discusses AutoGen, a framework that simplifies the creation and automation of workflows for large language model (LLM) applications. It allows users to define and interact with customizable agents that can leverage LLMs, humans, tools, or a combination. AutoGen supports various communication patterns and scenarios, such as conversational chess, code-based question answering, and group chat. AutoGen is an open-source project that aims to provide an easy-to-use and effective framework for building next-generation LLM-based applications. Here is a link to a YouTube video with more details: [AutoGen Tutorial 🚀 Create Custom AI Agents EASILY (Incredible)][6].

## Streaming

* [Data Streaming and Artificial Intelligence: The Future of Real-Time Social Media Monitoring][7]. This post discusses how artificial intelligence (AI) can be used for social media monitoring and brand reputation management. It explains the technical challenges and steps in creating a real-time system that can stream and analyze social media data and flag potentially damaging posts. It also showcases how Confluent Cloud can enable such a system with its features and capabilities.

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

[1]: https://distributed-computing-musings.com/2023/10/paper-notes-f1-a-distributed-sql-database-that-scales/
[2]: https://pub.towardsai.net/how-to-build-your-first-ai-agent-with-langchain-and-openai-gpt-a2a483096d71
[3]: https://pub.towardsai.net/langchain-101-part-2d-fine-tuning-llms-with-human-feedback-57769479d013
[4]: https://medium.com/@ivanreznikov/langchain-101-course-updated-668f7b41d6cb
[5]: https://www.microsoft.com/en-us/research/blog/autogen-enabling-next-generation-large-language-model-applications/
[6]: https://youtu.be/vU2S6dVf79M
[7]: https://www.confluent.io/blog/real-time-social-media-monitoring-with-artifical-intelligence/

