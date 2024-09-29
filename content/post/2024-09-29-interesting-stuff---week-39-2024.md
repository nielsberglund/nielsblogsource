---
type: post
layout: "post"
title: Interesting Stuff - Week 39, 2024
author: nielsb
date: 2024-09-29T09:46:52+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-39-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-39-24.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Season of AI
  - Data & AI Community Day Durban
  - Kafka
  - Streaming
  - AI Agents
description: "Dive into this week's tech roundup, featuring insights on RAG AI agents, Hamza Farooq's hands-on approach to building custom AI agents, and Microsoft's transformative RD-Agent. We also explore the latest features in RisingWave v2.0 and the integration of streaming platforms with lakehouse architectures."
---

Welcome to this week's tech roundup, where we explore groundbreaking innovations shaping the industry! Discover insights into RAG AI agents and their future implications; look at Hamza Farooq's hands-on approach to building custom AI agents.

Learn how Microsoft's RD-Agent is transforming research and development processes. We'll also highlight the exciting features in RisingWave v2.0 and the merging of streaming platforms with Lakehouse architectures.

<!--more-->

## Generative AI

* [RAG, AI Agents, and Agentic RAG: An In-Depth Review and Comparative Analysis of Intelligent AI Systems][1]. In this post by MarkTechPost, the author dives into the captivating realm of RAG (Retrieve and Generate) AI agents, dissecting their unique functionality and potential implications for intelligent AI systems. The analysis compares various agentic RAG models, spotlighting their distinct capabilities such as [unique selling point 1] and [unique selling point 2], and their potential applications in different domains. This comprehensive review not only showcases the current advancements in AI but also raises thought-provoking questions about the future of AI agents and their impact on our daily lives. What's your take on the increasing complexity of AI agents? Do you see it as a boon or a potential challenge?
* [Build Your Agents from Scratch][2]. Hamza Farooq takes us on an exhilarating journey in this post into the world of building AI agents from scratch, emphasizing the unmatched thrill of creating your own automation tools. Instead of relying on established frameworks like AutoGen, he advocates for a hands-on approach akin to crafting a gourmet meal rather than settling for instant ramen. Farooq outlines a step-by-step process to develop 'AgentPro,' an AI assistant capable of generating, executing, and managing Python code, ultimately fostering a deeper understanding of AI's inner workings. The possibilities of building a custom AI agent are endless; as Farooq mentions, this is merely the beginning. His enthusiasm for future instalments promises to unlock even more potential for AgentPro, including web searching and image generation capabilities. I appreciate how he highlights the balance between leveraging AI for efficiency and maintaining human intuition, reminding us of the importance of thoughtful guidance in our AI endeavours. This hands-on approach not only empowers us but also excites us about the endless possibilities in the AI field. Happy coding, everyone!
* [Microsoft Releases RD-Agent: An Open-Source AI Tool Designed to Automate and Optimize Research and Development Processes][3]. This post introduces Microsoft's groundbreaking RD-Agent, an open-source tool that automates repetitive tasks by transforming research and development (R&D) processes. RD-Agent allows teams to concentrate on more innovative aspects of their work by streamlining workflows for researchers, data scientists, and engineers. The software facilitates hypothesis generation and model implementation and enhances productivity and quality in data-driven industries, making it a significant milestone in R&D automation. What stands out is RD-Agent's open-source nature, which invites collaboration and encourages further development by the AI community. This approach enhances the tool's capabilities and positions it as a cornerstone for future AI-driven R&D. I'm excited about how RD-Agent can significantly reduce human intervention in labour-intensive tasks, ultimately fostering a more innovative environment where researchers can thrive. This evolution in R&D practices could redefine how industries tackle complex problems and drive forward-thinking solutions, relieving us from the burden of repetitive tasks and giving us more time to focus on innovation.

## Streaming

* [Handling the Producer Request: Kafka Producer and Consumer Internals, Part 2][4]. In this post, the author looks at the intricate workings of Apache Kafka, focusing on the lifecycle of a producer request. This second instalment in the series provides a thorough examination of how the Kafka cluster processes a well-formed produce request, highlighting key components like the socket receive buffer, network threads, request queues, and I/O threads. By understanding these mechanisms, developers cannot only optimize their Kafka setups but also monitor performance effectively, leading to [practical benefit 1] and [practical benefit 2]. As someone who's navigating the complexities of Kafka, I appreciate the author's candid approach to explaining these processes, making it easier for readers to grasp the intricacies of Kafka's functionality. Understanding these details not only equips us for potential debugging sessions but also highlights the power of Kafka in managing high-throughput data streams. I'm looking forward to the next instalment, which promises to shed light on the consumer's fetch request journey!
* [The Stream House][5]. This post by [Hubert Dulay][hubert] explores the innovative concept of a "stream house", which merges streaming platforms with lakehouse architectures. By integrating streaming data processing with robust storage capabilities, a stream house would allow users to access real-time and historical data without duplicating systems. Confluent's existing support for technologies like Apache Iceberg and its concept of multimodal streams positions it well for this next step in data management. This exploration of the stream house concept is particularly compelling, underscoring a crucial evolution in data architecture. The ability to bridge the gap between streaming and batch processing streamlines data management and empowers organizations to derive insights in real-time. With the right enhancements, Confluent could indeed position itself alongside industry leaders like Databricks and Snowflake, paving the way for more efficient data-driven decision-making. This approach could redefine how businesses leverage data across various use cases, making it a timely and relevant topic in today's data landscape.
*[Highlights of RisingWave v2.0: The Open-Source Streaming SQL Database] []. This post introduces the exciting new features in RisingWave's v2.0 release, marking a significant upgrade from v1.10. With enhancements spanning subscription management, a new Python SDK, time travel queries, and better compatibility with Parquet files, RisingWave is set to streamline data processing and storage. This upgrade is not just about incremental improvements; it represents a leap forward in the platform's capabilities, especially in integrating streaming and batch data processing. The post highlights several key features, such as enhancements to subscriptions and cursors that now support historical data retrieval and the introduction of time travel queries, which allow users to access past data points. The addition of secret management features addresses security concerns by enabling the safe storage of database credentials. Notably, the new CORRESPONDING keyword simplifies set operations by automatically matching columns, making it easier for users to manage complex queries. The post also discusses the expansion of external connectors, with RisingWave now supporting direct data sinks to platforms like MongoDB and Azure Blob. The continued focus on scalability and advanced SQL features reinforces RisingWave's commitment to enhancing usability while providing powerful tools for data manipulation. This release is particularly exciting as it reflects the growing trend toward unified data processing platforms that seamlessly blend streaming and batch capabilities. The potential for real-time insights alongside historical data queries could significantly enhance decision-making processes across various industries, [potential impact on decision-making processes]. RisingWave is clearly positioning itself as a formidable player in the evolving data landscape!

## WIND (What Is Niels Doing)

This is what I am doing:

![](/images/posts/data-ai-dbn-season-of-ai.jpg)

**Figure 1:** *Data & AI Community Day Durban: Season of AI - Copilots & Agents*

We are planning the follow-up to the monumental successful [**Data & AI Community Day Durban: Season of AI**][8] event we held in July. The upcoming event [**Data & AI Community Day Durban: Season of AI - Copilots & Agents**][7] will be held on November 23. As the name implies, the event's theme is Copilots and AI Agents. However, Copilots and Agents are not the only things we will be talking about. We will also have sessions on Data, AI, streaming and real-time analytics, Power Platform and other cool stuff. As usual, the event is a FREE full-day event with a keynote, 3 tracks and lots of networking opportunities.

The Call for Speakers opened a week ago, and we have already received many submissions. If you want to speak at the event, please submit your session(s) [**here**][6]. 

Registration for the event has not started yet, but you can check the [**event page**][7] for updates.

You should sponsor the event if you want to get your company name out in front of several hundred **Data** & **AI** professionals and associated with the thriving Durban **Data** & **AI** community. We have several sponsorship packages available, and if you are interested in sponsoring, please contact [**me**][ma].

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

[1]: https://www.marktechpost.com/2024/09/22/rag-ai-agents-and-agentic-rag-an-in-depth-review-and-comparative-analysis-of-intelligent-ai-systems/
[2]: https://towardsdatascience.com/build-your-agents-from-scratch-forget-autogen-or-crewai-part-a-a114cd1e785f
[3]: https://www.marktechpost.com/2024/09/25/microsoft-releases-rd-agent-an-open-source-ai-tool-designed-to-automate-and-optimize-research-and-development-processes/
[4]: https://www.confluent.io/blog/kafka-producer-internals-handling-producer-request/
[5]: https://hubertdulay.substack.com/p/the-stream-house
[6]: https://sessionize.com/seasonofai-nov
[7]: https://aimldatadurban.org/events/2024/season-of-ai-nov/
[8]: https://aimldatadurban.org/events/2024/season-of-ai-1/
