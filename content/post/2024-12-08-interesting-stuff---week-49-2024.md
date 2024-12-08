---
type: post
layout: "post"
title: Interesting Stuff - Week 49, 2024
author: nielsb
date: 2024-12-08T07:57:05+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-49-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-49-24.jpg"
categories:
  - roundup
tags:
  - SQL Server
  - Generative AI
  - AI Agents
  - Streaming
  - Real-Time Processing
description: "This week's blog explores cutting-edge tech advancements, including SQL Server 2025's AI-ready features, LangChain tools for smarter app development, and Large Action Models revolutionizing decision-making. Dive into strategies for optimizing LLM performance and integrating real-time intelligence with proactive agents, showcasing how technology is pushing boundaries like never before!"
---

This week's tech roundup dives into groundbreaking innovations shaping the future of AI and data. From SQL Server 2025's AI-ready capabilities transforming databases to LangChain and Large Action Models redefining application development and decision-making, the possibilities are limitless. 

Explore hybrid strategies for optimizing LLM performance and seamlessly integrating real-time intelligence with proactive agents. These advancements highlight how technology continues to empower creativity and efficiency in unprecedented ways!

<!--more-->

## Podcast

If you rather listen to the summary:

<iframe title="Interesting Stuff - Week 49, 2024" allowtransparency="true" height="150" width="100%" style="border: none; min-width: min(100%, 430px);height:150px;" scrolling="no" data-name="pb-iframe-player" src="https://www.podbean.com/player-v2/?i=iwp7t-17633b5-pb&from=pb6admin&share=1&download=1&rtl=0&fonts=Arial&skin=1&font-color=auto&logo_link=episode_page&btn-skin=7" loading="lazy"></iframe>

Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here](https://nielsitberglund.podbean.com/e/interesting-stuff-week-49-2024/).

## SQL Server

* [Announcing Microsoft SQL Server 2025: Enterprise AI-ready database from ground to cloud][1]. In this post, Asad Khan, Vice President of SQL Products and Services, announces the preview of Microsoft SQL Server 2025, a groundbreaking enterprise AI-ready database. Designed to tackle modern challenges, it bridges the gap between cloud, edge, and on-premises environments while maintaining top-tier security and privacy standards. The SQL Server 2025 release introduces AI capabilities integrated into the SQL engine, making it a native vector database. It supports retrieval-augmented generation (RAG) and hybrid AI searches, leveraging familiar T-SQL syntax. Developers can also benefit from low-code tools and seamless integration with frameworks like LangChain and Semantic Kernel. One feature that stands out is the built-in DiskANN-powered vector indexing, facilitating high-performance semantic searches on large datasets. This innovation transforms SQL Server into a key player for enterprise AI applications, directly addressing modern AI workloads with robust security and scalability. On a technical front, developer productivity gets significantly boosted through REST APIs, GraphQL integration, and enhanced query performance tools like Optional Parameter Plan Optimization (OPPO). *My Thoughts:* As someone with a keen interest in how databases evolve to meet AI demands, I find the transition of SQL Server into an AI-ready platform particularly exciting—it signals a promising future where traditional databases redefine their role in the AI ecosystem. For those eager to get hands-on, Microsoft invites users to apply for the SQL Server 2025 preview and test these next-gen features. This release is worth exploring if you're working on data-intensive AI applications!

## Generative AI

* [Getting Started with LangChain: Building Applications with Large Language Models Part II][2]. This post by my colleague [Talent Qwabe][3] dives into the LLM Module of LangChain, a pivotal component for building applications with large language models (LLMs). The LLM Module simplifies integration with models like GPT-4 and Claude, offering features such as dynamic prompt generation, model agnosticism, and customizable outputs. These capabilities enable developers to switch between models effortlessly and tailor responses to specific needs, fostering scalability and efficiency. A practical highlight of the post is the creation of a Travel Buddy AI App, which demonstrates how to generate tailored travel itineraries based on user input. With LangChain's seamless integration, the app builds dynamic prompts, interacts with LLMs via APIs, and returns comprehensive trip plans, showcasing the flexibility and real-world utility of the platform. *My thoughts:* What stands out to me is the module's focus on developer productivity. The low-code tools, dynamic prompt engineering, and integration with frameworks like Azure OpenAI simplify the traditionally complex workflow of incorporating LLMs into applications. This aligns with the broader trend of democratizing AI development, lowering barriers for newcomers while empowering experts with advanced tools. As Part III promises to delve into chaining multiple components for complex workflows, this series is becoming a must-read for those looking to master LLM-powered application development. Start experimenting with LangChain to explore the full potential of this transformative toolkit!
* [What Are Large Action Models?][4]. In this post, Silvio Savarese explores Large Action Models (LAMs), a groundbreaking evolution in generative AI that combines linguistic fluency with actionable intelligence. Unlike Large Language Models (LLMs) that focus on generating responses, LAMs actively perform tasks and make decisions, transforming them from passive tools into dynamic partners in accomplishing goals. What makes LAMs transformative? They integrate seamlessly with existing data, tools, and workflows to automate processes. For example, a LAM in marketing could draft personalized emails, manage campaigns, and even handle customer-specific interactions. Similarly, in personal use cases like car buying, LAMs can analyze options, flag potential issues, and facilitate negotiations, acting as intelligent assistants. *My thoughts:* I find the concept of LAMs deeply intriguing because of their potential to scale automation while keeping humans in control. Learning from real-world feedback allows LAMs to improve over time, making them increasingly adaptive to user needs. The emphasis on human oversight ensures safety and reliability, addressing one of AI's most pressing challenges. As organizations begin deploying LAMs, the possibilities expand beyond individual use to orchestrating entire teams of LAMs for complex, multi-layered tasks. This post envisions a future where AI tools assist and significantly enhance productivity, leaving us free to focus on creative and strategic endeavours. If you're curious about how AI reshapes action and decision-making, this post is a must-read!
* [Combining Large and Small LLMs to Boost Inference Time and Quality][5]. This post by Richa Gadgil explores innovative strategies for improving inference speed and quality in large language models (LLMs) by combining them with smaller models. It introduces contrastive and speculative decoding to optimize text generation, balancing computational efficiency and output quality. Contrastive decoding leverages differences between large and small models to reduce repetitive and incoherent outputs. By selecting tokens with the highest probability differential, this method ensures higher lexical diversity and entropy in the generated text. The practical implementation provided demonstrates how to achieve this in Python using the Transformers library. On the other hand, speculative decoding enhances inference speed by accepting predictions from a smaller model that align with the probability distribution of a larger model. It involves batch processing and caching to minimize the number of iterations required for token generation, making it ideal for real-time applications. *My thoughts:* I find this hybrid approach particularly fascinating, as it addresses the scalability challenges of deploying LLMs in resource-constrained environments. The trade-off between model complexity and deployment feasibility is a critical consideration, and these methods demonstrate how careful engineering can push the boundaries of what's achievable. This post provides actionable insights and code examples for integrating these strategies into applications like conversational AI, real-time translation, and content creation. It's a must-read for developers aiming to optimize the performance of LLM-powered systems!
* [How to Build a Proactive Agent with Real-Time Event Processing][6]. This post by [RisingWave Labs][7] delves into how streaming databases combined with large language models (LLMs) can power proactive agents—systems capable of taking intelligent actions based on real-time events without waiting for user instructions. The post highlights how such agents can monitor dynamic environments and respond to significant changes, much like setting an alarm to wake you at a specific time. The architecture of these agents relies on streaming databases as "eyes and ears," constantly ingesting and processing data. Materialized views and SQL rules enable the system to filter relevant events and trigger an LLM for decision-making. For instance, a SQL query might identify new user registrations, allowing the LLM to send personalized messages without manual intervention. *My thoughts:* What fascinates me here is the seamless integration of real-time data processing with AI-driven actions. This marriage of technologies automates repetitive tasks and introduces proactive intelligence into everyday systems, from home automation to stock trading. It's a step closer to making AI not just reactive but truly anticipatory. The post provides practical examples and discusses the advantages of streaming databases like RisingWave, which offer SQL interfaces for efficient event processing. This approach minimizes the complexity of prompt engineering and optimizes system performance. If you're exploring how to enhance your applications with real-time intelligence, this article is an excellent starting point!

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

[1]: https://www.microsoft.com/en-us/sql-server/blog/2024/11/19/announcing-microsoft-sql-server-2025-apply-for-the-preview-for-the-enterprise-ai-ready-database/
[2]: https://medium.com/@siphumelelotqwabe/getting-started-with-langchain-building-applications-with-large-language-models-part-ii-24aff499bd96
[3]: https://www.linkedin.com/in/siphumelelo-talent-qwabe/
[4]: https://www.salesforce.com/blog/large-action-models/
[5]: https://towardsdatascience.com/combining-large-and-small-llms-for-inference-time-and-quality-boosts-1779b6b5100b
[6]: https://pub.towardsai.net/how-to-build-a-proactive-agent-with-real-time-event-processing-203859d0b666
[7]: https://risingwave.com/
