---
type: post
layout: "post"
title: Interesting Stuff - Week 11, 2025
author: nielsb
date: 2025-03-16T18:47:11+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-11-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-11-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - streaming
  - DeepSeek
  - OpenAI
  - Dapr
  - AI Agents
  - Season of AI
  - Data & AI Community Day Durban
description: "This week's tech roundup dives into DeepSeek's big open-source push, OpenAI's new Agents Platform, and Dapr AI Agents bringing scalable multi-agent systems to the mix. Plus, Microsoft Fabric's Real-Time Intelligence is changing the game for low-latency analytics. And with Data & AI Community Day Durban: AI @ Ignite++ just days away, I'm busy finalizing an agenda packed with incredible AI content!"
---

The AI world never slows down, and this week was no exception! DeepSeek went all-in on open source, dropping six powerful LLM training and deployment tools. OpenAI unveiled its Agents Platform, making multi-agent applications easier than ever, while Dapr AI Agents introduced a scalable, vendor-neutral approach for enterprise AI. 

Meanwhile, Microsoft Fabric's Real-Time Intelligence redefines streaming analytics with low-latency, event-driven insights. With less than a week to go until [**Data & AI Community Day Durban: Season of AI - AI @ Ignite++**][1], I'm deep in the trenches finalising the agenda—so much great content, so little time!

<!--more-->

<!--
## Podcast

If you rather listen to the summary:



Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here]().
-->

## Generative AI

* [DeepSeek's open-source week and why it's a big deal](https://www.pyspur.dev/blog/deepseek_open_source_week). This blog post by PySpur details a significant release of six software libraries by DeepSeek, specifically designed to tackle demanding challenges in large language model (LLM) training, inference, and data infrastructure. The initial sections highlight the open-sourcing of these tools, including FlashMLA for efficient attention mechanisms, DeepEP for optimised expert parallelism communication, and DeepGEMM for fast FP8 matrix multiplication. Subsequent sections delve into optimised parallelism strategies (DualPipe and EPLB) and data infrastructure solutions (3FS and Smallpond). The post culminates in discussing the inference system for DeepSeek-V3/R1, providing insights into their production deployment and operational efficiency. Overall, the post announces DeepSeek's commitment to open source and showcases its advanced technologies for building and deploying large-scale AI models.
* [The new OpenAI Agents Platform](https://www.latent.space/p/openai-agents-platform). This Latent Space blog post discusses OpenAI's new Agents Platform, which aims to empower developers in building more sophisticated agentic applications. The platform introduces a Responses API, positioned as a flexible successor to the chat completion API, enhanced with integrated tools for Web Search, Computer Use, and File Search. To facilitate development, OpenAI is also releasing an open-source Agents SDK, complete with observability features, supporting common multi-agent workflow patterns. This initiative signals OpenAI's commitment to advancing the field of AI agents by providing foundational APIs and developer tools.
* [Announcing Dapr AI Agents](https://www.cncf.io/blog/2025/03/12/announcing-dapr-ai-agents/). This blog post introduces Dapr AI Agents, a new framework built upon the existing Dapr project. Its primary purpose is to simplify the development of AI agents that can reason using large language models, take actions, and collaborate effectively. The announcement highlights key features such as reliable execution, scalability on Kubernetes, built-in support for multi-agent systems, and vendor neutrality, positioning Dapr Agents as a robust solution for enterprise-grade AI agent applications and explaining how it differs from other frameworks by leveraging Dapr's established capabilities.

## Streaming

* [Real-Time Intelligence in Microsoft Fabric](https://www.jamesserra.com/archive/2025/03/real-time-intelligence-in-microsoft-fabric/). This blog post by James Serra introduces Real-Time Intelligence (RTI) within Microsoft Fabric, highlighting its capability to process, store, analyse, and visualise data with minimal delay. The article details the key components of RTI, explaining how Eventstream ingests and processes real-time data, Eventhouse provides efficient storage, Activator triggers automated actions, KQL Queryset enables rapid analysis, and Real-Time Dashboards offer instant visualisations, all managed through the Real-Time Hub. Furthermore, the post differentiates between RTI dashboards and Power BI, noting RTI's specific focus on low-latency, event-driven insights, and suggests RTI can even offload operational reporting from source systems.

## WIND (What Is Niels Doing)

Less than a week to go:

![](/images/posts/banner-data-ai-ignite.jpg)

**Figure 1:** *Data & AI Community Day Durban: Season of AI - AI @ Ignite++*

We're officially in the final countdown to [**Data & AI Community Day Durban: Season of AI - AI @ Ignite++**][1] on March 22, and things are heating up faster than a GPU running stable diffusion on max settings! The Call for Speakers closed on Friday, and now I'm deep in the trenches, going through the incredible lineup of submitted talks. And let me tell you, choosing the final sessions is tougher than explaining backpropagation to your grandma.

The sheer awesomeness of the topics has me in a paradox—how do I pick just a few when they all deserve the spotlight? It's like deciding which AI model to use when they all promise "state-of-the-art" results! But fear not—I'm working through the submissions, fueled by copious amounts of coffee and an existential crisis or two, to curate an agenda that will blow your minds. It will be a tech-packed, AI-infused, brain-expanding day—and you won't want to miss it!

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

[1]: https://aimldatadurban.org/events/2025/season-of-ai-ignite/
