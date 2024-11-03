---
type: post
layout: "post"
title: Interesting Stuff - Week 44, 2024
author: nielsb
date: 2024-11-03T11:42:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-44-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-44-24.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - Season of AI
  - Streaming
  - SlateDB
  - Data & AI Community Day Durban
description: "I explore in this week's blog the latest breakthroughs in Generative AI, streaming, and intelligent agents, from multi-agent Q&A systems to GitHub’s new AI tools. Discover practical insights on building LLM judges, transforming PDFs into podcasts, and why SlateDB is gaining traction in stream processing."
---

This week's roundup dives into the latest in Generative AI, streaming tech, and the revival of intelligent agents. From Indrajit Kar's advanced multi-agent Q&A systems and GitHub Universe's AI-powered tools to Hamel Husain's guide on building LLM judges, it's all about pushing boundaries. 

Plus, discover how to transform PDFs into podcasts and why SlateDB might just be the next big thing in stream processing.

<!--more-->

## Podcast

If you rather listen to the summary:

<iframe title="Interesting Stuff - Week 44, 2024" allowtransparency="true" height="150" width="100%" style="border: none; min-width: min(100%, 430px);height:150px;" scrolling="no" data-name="pb-iframe-player" src="https://www.podbean.com/player-v2/?i=en6wa-1729147-pb&from=pb6admin&share=1&download=1&rtl=0&fonts=Arial&skin=1&font-color=auto&logo_link=episode_page&btn-skin=7" loading="lazy"></iframe>

Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here](https://nielsitberglund.podbean.com/e/interesting-stuff-week-44-2024/).

## Generative AI

* [Crafting Intelligent Agents for Dynamic Query Resolution: Multi-Approach Workflows with Web and LinkedIn Search: LangGraph, Local LLama and LangChain][1]. The author of this post is [Indrajit Kar][2], a friend and colleague. In the post Indrajit details a flexible system that uses LangChain, LangGraph, and vector databases to dynamically answer questions. He explores three different architectural approaches for executing these workflows: dynamic routing with maximum retries, streamlined retrieval with conditional generation, and minimal retry with LinkedIn integration. Each approach offers distinct advantages in handling various queries, balancing response time and accuracy based on the query's complexity. This system, developed through collaborative efforts, demonstrates how diverse architectural approaches can be employed to create a robust and flexible Question Answering (QA) framework that provides accurate, concise responses, adapting its workflow based on the question posed.
* [Building a Multi-Agent Q-A System with Local Llama3.2 "Swarm" and LangChain][4]. In this second post by [Indrajit][2], he looks at how to build a sophisticated question-answering system using "Swarm," an experimental framework developed by OpenAI. The system uses a local language model and multiple specialised agents to answer diverse queries efficiently and accurately. Each agent is responsible for a specific task, including document retrieval, web search, answer generation, hallucination grading, and answer grading. This multi-agent approach facilitates dynamic decision-making and efficient problem-solving. The key takeaway is that by breaking down the system into specialised agents and using local language models with the Swarm framework, the system can effectively manage agent interactions and task delegation.
* [New from Universe 2024: Get the latest previews and releases][3]. This article, published on the GitHub Blog, highlights the key features and developments released at GitHub Universe 2024. It showcases the company's commitment to empowering developers through its platform, which now serves over 100 million users. The article focuses on integrating AI-native experiences, particularly with GitHub Copilot, to improve the developer experience across various aspects of the software development lifecycle. These advancements include introducing multi-model choice in Copilot, allowing users to select the model best suited for their needs and enhancements to Copilot Workspace, Copilot Code Review, and Copilot Autofix. The article also discusses the release of GitHub Spark, a new tool designed for playful and creative software development, aiming to inspire a billion individuals to embrace coding. Additionally, GitHub is enhancing its platform security with features like Copilot Autofix for open source and security campaigns, allowing developers to remediate vulnerabilities faster and more efficiently. Finally, the document discusses the improvements to GitHub Enterprise, focusing on governance and compliance, enhanced workflows, and data residency options for European Union users. The article outlines GitHub's roadmap for the future of software development, emphasising the pivotal role of AI and automation in enhancing developer productivity, security, and collaboration.
* [Creating a LLM-as-a-Judge That Drives Business Results][5]. This article is a practical guide on creating a large language model (LLM) that acts as a judge in evaluating the performance of other AI systems. The author, Hamel Husain, draws on his experience from 30+ implementations to outline a process for building an LLM-as-a-judge, emphasising the crucial importance of involving a domain expert in the evaluation process. He identifies several key challenges in creating an effective LLM-as-a-judge, such as the tendency for AI teams to drown in data and the difficulty of interpreting metrics derived from an LLM. To address these challenges, he proposes a six-step methodology: identifying a principal domain expert, creating a diverse dataset, directing the domain expert to make pass/fail judgments with critiques, fixing errors in the AI system, creating a specialised LLM judge (if needed) and finally, conducting error analysis. He highlights the importance of using critiques as an effective way to convey feedback to the domain expert and to ensure the LLM-as-a-judge is operating as intended. Husain concludes the guide by discussing various best practices and common mistakes to avoid when implementing this approach. The overall aim of the guide is to empower readers with the knowledge and tools necessary to create an effective LLM-as-a-judge for their AI systems.
* [How I Developed a NotebookLM Clone?][6]. This post is a step-by-step guide to creating multi-speaker podcasts similar to Google's NotebookLM tool. The author was inspired by NotebookLM's ability to analyse text and create natural dialogue and set out to build something that could convert PDFs into short podcast clips. The guide walks the reader through a series of steps: first, the PDF file is processed and converted into a series of initial podcast ideas. Next, these ideas are transformed into dialogue using the OpenAI API, with special attention given to creating natural-sounding interactions between multiple speakers. Finally, the dialogue is converted into audio clips using ElevenLabs Text-to-Speech, and these clips are assembled into a cohesive podcast file, complete with overlapping segments for added realism. The author provides the code and resources needed to replicate this process and explains key concepts and techniques. The goal is to empower users to create engaging and informative multi-speaker podcasts by harnessing the capabilities of modern AI tools.
* [Agents Are Coming Back From The Dead][7]. The author, in this article, discusses the history of the "Intelligent Agent" concept in artificial intelligence (AI) and argues that it is seeing a resurgence in popularity. The author traces the origins of this concept back to the early 1980s and the work of Marvin Minsky and explores the key ideas central to its development, particularly the need for agents to interact with their environment and other agents. The article then charts the decline of interest in agents in the late 2000s, which the author attributes to the rise of social media platforms and smartphones. However, the author argues that agents are now making a comeback in the form of embedded and interconnected Large Language Models (LLMs), such as ChatGPT. The article ends by suggesting that the future of AI will be shaped by the interaction of these agents with other technologies, such as the Metaverse and Generative AI.

## Streaming

* [If not RocksDB, then what? Why SlateDB is the right choice for Stream Processing.][8]. This blog post argues that SlateDB is a superior foundation for state storage in stream processors like Kafka Streams compared to embedded RocksDB. The author highlights the shortcomings of traditional OLTP databases such as MongoDB, particularly their cost and complexity due to data replication, lack of elasticity, and operational complexity. SlateDB, an embedded database built on top of object storage, offers a cheaper and more flexible alternative by leveraging the cloud-native infrastructure of Kafka and object storage like Amazon S3. The author emphasises the advantages of SlateDB, including its ability to amortise writes across a large number of events using a log-structured merge tree (LSM) specifically designed for object storage, as well as its ability to run remotely without requiring any coordination with the primary process. The post argues that SlateDB is a promising solution for replacing embedded RocksDB in Kafka Streams.

## WIND (What Is Niels Doing)

The Call for Speakers for our [**Data & AI Community Day Durban: Season of AI - Copilots & Agents**][9] has officially closed, and WOW—the submissions this year are mind-blowing! 

We've received an incredible array of unique perspectives and insights, making the selection process both exciting and, let's be honest, a little tricky! I aim to wrap up evaluations by mid-week and get back to the speakers ASAP.

Tickets are selling like hotcakes, and with a lineup this impressive, you won't want to miss out! Secure your spot now and join us for a day of groundbreaking ideas and innovation.

🚀 Venue: Coastlands Umhlanga Hotel and Convention Centre
📅 Date: November 23
🕘 Time: 08:00 - 18:00 
🚨 Don't miss out — register NOW: https://www.quicket.co.za/events/286321-data-ai-community-day-durban-season-of-ai-copilots-agents/?ref=link-campaign&lc=blog
🏨 Event Information: https://aimldatadurban.org/events/2024/season-of-ai-nov/

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

[1]: https://medium.com/@official.indrajit.kar/crafting-intelligent-agents-for-dynamic-query-resolution-multi-approach-workflows-with-web-and-bf6d389bb2d4
[2]: https://www.linkedin.com/in/indrajit-kar/
[3]: https://github.blog/news-insights/product-news/universe-2024-previews-releases/
[4]: https://medium.com/@official.indrajit.kar/building-a-multi-agent-q-a-system-with-local-llama3-2-swarm-and-langchain-bee7faa18c9f
[5]: https://hamel.dev/blog/posts/llm-judge/
[6]: https://pub.towardsai.net/how-i-developed-a-notebooklm-clone-2d901d1c72a6?sk=v2%2Fbcda78dc-77c2-4617-b00d-d6f2860470fe
[7]: https://pub.towardsai.net/agents-are-coming-back-from-the-dead-50c929ab8387?sk=v2%2Faf467631-e77e-4da3-9b9d-c3e077441afe
[8]: https://www.responsive.dev/blog/why-slatedb-for-kafka-streams
[9]: https://aimldatadurban.org/events/2024/season-of-ai-nov/
