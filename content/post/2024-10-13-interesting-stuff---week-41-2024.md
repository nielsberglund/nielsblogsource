---
type: post
layout: "post"
title: Interesting Stuff - Week 41, 2024
author: nielsb
date: 2024-10-13T11:19:25+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-41-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-41-24.jpg"
categories:
  - roundup
tags:
  - MS Fabric
  - distributed computing
  - generative AI
  - AI Agents
  - Kafka
  - Season of AI
  - Data & AI Community Day Durban
description: "This week's cutting-edge tech: Microsoft Fabric Lakehouse with Apache Kafka and Flink, Netflix's global caching system, and OpenAI's ChatGPT Canvas for coding. Plus, exciting news about our upcoming Data & AI Community Day Durban sponsored by UNISA!"
---

This week's roundup covers some exciting developments in the tech world! There's plenty to explore, from the power of Microsoft Fabric Lakehouse combined with Apache Kafka and Flink for real-time data streaming to Netflix's innovative global caching system. 

We also explore OpenAI's ChatGPT Canvas for coding and AI agents' evolving reasoning capabilities. Plus, don't miss the latest news on our upcoming [**Data & AI Community Day Durban: Season of AI—Copilots & Agents**][8] event, sponsored by UNISA!

<!--more-->

If you rather listen to the summary:

<iframe title="Interesting Stuff - Week 41, 2024" allowtransparency="true" height="150" width="100%" style="border: none; min-width: min(100%, 430px);height:150px;" scrolling="no" data-name="pb-iframe-player" src="https://www.podbean.com/player-v2/?i=iwxgy-1704d24-pb&from=pb6admin&share=1&download=1&rtl=0&fonts=Arial&skin=1&font-color=auto&logo_link=episode_page&btn-skin=7" loading="lazy"></iframe>

Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here](https://nielsitberglund.podbean.com/e/interesting-stuff-week-41-2024/).


## Databases

* [How Microsoft Fabric Lakehouse Complements Data Streaming (Apache Kafka, Flink, et al.)][1]. This article guides how organisations can use Microsoft Fabric Lakehouse to augment their data streaming capabilities, focusing on platforms like Apache Kafka and Apache Flink. It highlights the differences between data at rest and data in motion, arguing that data streaming platforms are essential for capturing real-time insights from data as it moves. The document further suggests how a lakehouse can be used for long-term storage and analysis, highlighting the synergistic benefits of combining streaming and lakehouse technologies. Additionally, the article touches upon the importance of shifting to a "shift left" architecture, which integrates operational and analytical workloads to enable real-time data ingestion and analysis. This, the article concludes, leads to improved responsiveness and data quality. Finally, the document discusses how Apache Iceberg, an open table format, can enhance lakehouses' data storage and analysis capabilities like Microsoft Fabric Lakehouse.

## Distributed Computing

* * [Building a Global Caching System at Netflix: A Deep Dive to Global Replication][2]. This text is an excerpt from a white paper detailing the global caching system used at Netflix. The paper focuses on the core component of this system, the EVCache, which is a distributed key-value store. This system, the text highlights, is built for scalability and resilience with global replication being the key factor. The paper's main purpose is to explain the design and workings of this global replication strategy, illustrating the various steps involved and the advantages and disadvantages of the client-initiated approach. The paper also highlights how various optimisations have been made to the system, including batch compression, Zstandard compression, and removing network load balancers. The paper concludes that the success of this system is attributed to its careful design choices, including the use of Kafka and client-initiated replication, resulting in an efficient and scalable global caching system that ensures high availability and a seamless user experience.

## Generative AI

* [OpenAI's ChatGPT Canvas Tutorial and Use Cases: Coding Customization and Visualizing Tesla Stock Data][3]. This post outlines the features and capabilities of OpenAI's ChatGPT Canvas. ChatGPT Canvas is a powerful AI-powered workspace, and the post explains the integration of ChatGPT into Canvas, which allows users to receive real-time suggestions for coding, context-aware collaboration, and productivity tools. The post then details two distinct use cases. The first case demonstrates how ChatGPT Canvas assists users in coding by providing a step-by-step guide for code creation, editing, and review. The second use case illustrates the application of ChatGPT Canvas in data analysis, explicitly analyzing a graph of Tesla stock data. The post highlights key insights and provides an overview of how users can leverage ChatGPT Canvas for coding and data analysis tasks.

* [AI Agents: The Intersection of Tool Calling and Reasoning in Generative AI][4]. This post explores the development of Artificial Intelligence (AI) agents that can effectively reason through tool calling. Tool calling enables AI agents to interact with external tools, solving complex problems that require accessing and processing data from various sources. The post highlights two key reasoning approaches: reasoning through evaluation and reasoning through tool use. Reasoning through evaluation focuses on assessing the progress of the AI agent's problem-solving process while reasoning through tool use involves effectively selecting and interacting with external tools. The post then explores the challenges of building robust and reliable agents, including managing complex behaviours, handling multiple tools, and preventing overfitting during training. The post also details standard benchmarks used to evaluate tool-calling capabilities. It provides illustrative examples of tool calling in action, ranging from simple built-in tools to custom-defined tools. Finally, the post explores Level 3 agents that execute tool calls directly, highlighting the significance of this capability for enhancing AI-based applications.

* [OpenAI Releases Swarm: An Experimental AI Framework for Building, Orchestrating, and Deploying Multi-Agent Systems][5]. OpenAI has released Swarm, a new framework for building, orchestrating, and deploying multi-agent systems. Swarm aims to simplify the complexities inherent in multi-agent orchestration by focusing on lightweight interactions between agents. It provides a simple way to manage agent coordination and execution, making it easier to build and deploy systems with multiple agents. Swarm is intended to empower developers to manage interactions between agents in a straightforward, efficient manner. This framework has been in progress for months and is now ready for public release, with the goal of making AI more accessible. The framework is particularly useful for scenarios where different agents are specialized in different tasks. The developers believe Swarm is an important step towards making advanced AI more accessible to a broader community.

## Streaming

* [Kafka Consumer Group Rebalance — The Next-Gen Protocol With Kafka 4.0][6]. This article discusses a new consumer group rebalance protocol introduced with Kafka 4.0. It highlights the key goals of the protocol, which are to achieve more stable and scalable consumer groups with reduced complexity, improved performance, and increased reliability. The article explains how the rebalance process has been shifted from the client to the server, leading to a more robust and efficient system. It also details the incremental rebalance strategy, which enables seamless transitions with minimal impact on message consumption. The article concludes with a summary of the new protocol's benefits and a call to action to explore further resources on consumer group rebalancing in Kafka.

## WIND (What Is Niels Doing)

Last Friday was a good day. Why was it a good day you may ask:

![](/images/posts/unisa-coastland-data-ai.jpg)

**Figure 1:** *UNISA Sponsors Venue*

Well, **UNISA** confirmed that they will be the main sponsor of the upcoming [**Data & AI Community Day Durban: Season of AI - Copilots & Agents**][8] event, sponsoring the venue. As with the event in July 2024, we're back at the stunning [**Coastlands Umhlanga Hotel and Convention Centre**][7]. Imagine soaking up the latest insights in Data and AI while gazing over the Indian Ocean 🌊 (talk about multitasking!).

Yes, the event's theme is Season of AI - Copilots & Agents - but even if you are not into Copilots and AI Agents, don't hit the brakes just yet. This event is about ALL things Data & AI, so expect to hear about (in addition to Copilots and AI Agents):

* ✨ Database development
* ✨ Traditional Machine Learning
* ✨ Generative AI
* ✨ Microsoft Fabric
* ✨ Real-time business intelligence
* ✨ Stream processing
* ✨ And more

Whether you're a data wizard 🧙‍♂️ or just dipping your toes into AI waters, there's a session for you: 60-minute deep dives or quick-hitting 20-minute talks from a powerhouse panel of MVPs, architects, and experts at the forefront of innovation. The event will also include panel discussions and networking opportunities for attendees.

Are you ready to join us again and be part of the Data & AI revolution? Register now before seats run out!

* 🚀 **Venue:** [**Coastlands Umhlanga Hotel and Convention Centre**][7]
* 📅 **Date:** November 23
* 🕘 **Time:** 08:00 - 18:00 
* 🚨 [**Registration Link**][9]
* 🏨 [**Event Information**][8]

I can't wait to see you there for another epic day of learning, networking, and, let's be honest, a little bit of nerdy fun! 🤓

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

[1]: https://www.kai-waehner.de/blog/2024/10/12/how-microsoft-fabric-lakehouse-complements-data-streaming-apache-kafka-flink-et-al/
[2]: https://www.infoq.com/articles/netflix-global-cache
[3]: https://www.marktechpost.com/2024/10/05/openais-chatgpt-canvas-tutorial-and-use-cases-coding-customization-and-visualizing-tesla-stock-data/
[4]: https://towardsdatascience.com/ai-agents-the-intersection-of-tool-calling-and-reasoning-in-generative-ai-ff268eece443
[5]: https://www.marktechpost.com/2024/10/11/openai-releases-swarm-an-experimental-ai-framework-for-building-orchestrating-and-deploying-multi-agent-systems/
[6]: https://medium.com/lydtech-consulting/kafka-consumer-group-rebalance-the-next-gen-protocol-with-kafka-4-0-fc0a863e2451
[7]: https://www.coastlands.co.za/umhlanga/
[8]: https://aimldatadurban.org/events/2024/season-of-ai-nov/
[9]: https://www.quicket.co.za/events/286321-data-ai-community-day-durban-season-of-ai-copilots-agents/?ref=link-campaign&lc=blog
