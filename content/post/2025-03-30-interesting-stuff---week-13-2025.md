---
type: post
layout: "post"
title: Interesting Stuff - Week 13, 2025
author: nielsb
date: 2025-03-30T12:33:35+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-13-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-13-25.jpg"
categories:
  - roundup
tags:
  - Season of AI
  - Data & AI Community Day Durban
  - Generative AI
  - AI Agents
  - MCP
  - Streaming
  - Kafka
  - OpenAI
description: "This week: dive into the rise of AI agents, from Unreal Engine-based multi-agent platforms to real-time data integration with MCP. I've highlighted key developments around the Model Context Protocol and OpenAI's new image generation capabilities. Plus, a quick look back at AI @ Ignite++ and a preview of our next big event!"
---

This week was all about agents—multi-agent simulations, image-generating copilots, and the unstoppable rise of the Model Context Protocol (MCP). From Unreal Engine-powered MARL platforms to real-time AI agents streaming fresh data via Confluent, the pace of innovation is wild. 

MCP continues to dominate the conversation, and I've gathered the best reads to help make sense of it all. Plus, a quick recap of our recent [**AI @ Ignite++**](https://aimldatadurban.org/events/2025/season-of-ai-ignite/) event and a sneak peek at what's next!

<!--more-->

<!--
## Podcast

If you rather listen to the summary:



Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here]().
-->

## Generative AI

* [Unreal-MAP: Unreal-Engine-Based General Platform for Multi-Agent Reinforcement Learning](https://arxiv.org/pdf/2503.15947). This paper introduces Unreal-MAP (Unreal Multi-Agent Playground), a novel platform built upon the Unreal Engine specifically designed to advance the field of multi-agent reinforcement learning (MARL). Its core purpose is to provide researchers with a user-friendly and highly customisable environment for creating diverse and realistic multi-agent tasks, leveraging the Unreal Engine community's rich visual and physical resources. Alongside Unreal-MAP, the authors present HMAP (Hybrid Multi-Agent Playground), an experimental framework designed for seamless deployment and evaluation of a wide range of MARL algorithms, including those from third-party libraries, even supporting multi-team and multi-algorithm training within the same environment. Through its open-source nature, hierarchical architecture, and focus on efficiency and real-world applicability, Unreal-MAP aims to bridge the gap between MARL algorithms and their practical deployment, as demonstrated through various example tasks and a sim-to-real experiment.
* [Introducing 4o Image Generation](https://openai.com/index/introducing-4o-image-generation/). This blog post announces the release of OpenAI's most advanced image generation capability, now integrated directly into GPT-4o. The key focus is moving beyond aesthetically pleasing images to generate genuinely useful and precise visuals for communication and information sharing. It highlights improved capabilities such as accurate text rendering, adherence to complex prompts with numerous objects, multi-turn refinement through conversation, and in-context learning from uploaded images. Furthermore, the text emphasises the model's understanding of visual relationships and its ability to produce photorealistic and stylistically diverse outputs, alongside OpenAI's commitment to safety and transparency through metadata and content policy enforcement.
* [A Clear Intro to MCP (Model Context Protocol) with Code Examples](https://towardsdatascience.com/clear-intro-to-mcp/). Model Context Protocol (MCP) is a hot topic now, and this blog post introduces MCP. It states that MCP is a method to standardise communication between AI agents and various tools. It addresses the increasing complexity of AI systems that rely on numerous tools by providing a shared language for agents to consistently organise, share, and invoke these tools. The post explains the fundamental components of MCP, illustrates how they function together, and even provides code examples to demonstrate its practical application. Ultimately, the purpose is to democratise access to AI tools and streamline their integration into AI agent workflows.
* [Why MCP Won](https://www.latent.space/p/why-mcp-won). This post details the reasons behind the remarkable success of Anthropic's Model Context Protocol. It mentions the overwhelming interest in MCP, highlighting its decidedly well-received initial release in November 2024 and the subsequent flurry of excitement surrounding it. The post then looks at various aspects contributing to MCP's adoption, asserting that the power of any new protocol derives from its adoption (aka ecosystem). The post explores MCP's technical aspects, its "AI-Native" design, and its positioning as an "open standard" with a significant backer, ultimately aiming to explain the factors driving its rapid and widespread acceptance within the AI developer community.

## Streaming

* [Powering AI Agents With Real-Time Data Using Anthropic's MCP and Confluent](https://www.confluent.io/blog/ai-agents-using-anthropic-mcp/). As if we didn't have enough posts about MCP this week, here is another one. The post looks at Confluent's recently developed MCP server that directly integrates with their real-time data streaming platform, granting AI agents natural language access to fresh data and simplifying the management of Confluent infrastructure. By enabling agents to operate on the most current information without complex custom integrations, this solution aims to bridge the gap between real-time data and AI-driven applications, ultimately enhancing the relevance and effectiveness of AI agents. The piece also highlights how Confluent's Tableflow further unifies real-time and stored data, providing a more comprehensive data landscape for AI to leverage.

## WIND (What Is Niels Doing)

Last Saturday, we ran the [Data and AI Community Day Durban: Season of AI - AI @ Ignite++](https://aimldatadurban.org/events/2025/season-of-ai-ignite/) event:

![](/images/posts/collage-2.jpg)

**Figure 1:** *Data and AI Community Day Durban: Season of AI - AI @ Ignite++*

I have been busy collating stats and feedback from the event this week. We had a great turnout with over 200 attendees, and the feedback has been overwhelmingly positive:

* The event was rated 6.67 out of 7!
* The speakers were rated (average) 6.47 out of 7!
* The sessions were rated (average) 6.46 out of 7!

In addition to the above, I have started the prep for our next event, tentatively named **Data & AI Community Day Durban: Season of AI – The Age of Agency**. The event's theme is AI Agents and how they are increasingly developing the ability to act independently, learn, and adapt.

The event will happen preliminary on May 24, 2025. We are still finalising the venue and the agenda, but we are looking at a full day of talks and workshops. If you are interested, please follow my [**LinkedIn**][1] account for more information, i.e. when the CfS and registrations open.

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

[1]: https://www.linkedin.com/in/nielsberglund/