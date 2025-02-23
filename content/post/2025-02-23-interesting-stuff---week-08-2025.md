---
type: post
layout: "post"
title: Interesting Stuff - Week 08, 2025
author: nielsb
date: 2025-02-23T08:29:40+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-08-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-08-25.jpg"
categories:
  - roundup
tags:
  - generativeai
  - aiagents
  - streaming
  - kafka
  - Season of AI
  - Data & AI Community Day Durban
description: "AI is advancing rapidly, from multi-agent planning innovations to LLMs with enhanced reasoning. This week's roundup covers Grok 3's capabilities, AI-driven brainstorming, LLM-powered coding, and the rise of event-driven multi-agent systems. Plus, Data & AI Community Day Durban: AI @ Ignite++ is coming March 22—the Call for Speakers is open, and registrations start next week!"
---

AI is evolving fast, from multi-agent planning breakthroughs to LLMs that reason better than ever. This week, we explore how Grok 3 stacks up against OpenAI, why AutoGen's AI debate system is a game-changer, and how startups are secretly 10X-ing their success with AI. 

Plus, a deep dive into LLM-powered coding workflows and the shift toward event-driven multi-agent systems. And on the event front: [**Data & AI Community Day Durban: AI @ Ignite++**][1] is happening on March 22! The Call for Speakers is now open, and registrations kick off next week—don't miss it!

<!--more-->


## Podcast

If you rather listen to the summary:

<iframe title="Interesting Stuff - Week 08, 2025" allowtransparency="true" height="150" width="100%" style="border: none; min-width: min(100%, 430px);height:150px;" scrolling="no" data-name="pb-iframe-player" src="https://www.podbean.com/player-v2/?i=mu4w8-1812016-pb&from=pb6admin&share=1&download=1&rtl=0&fonts=Arial&skin=1&font-color=&logo_link=episode_page&btn-skin=7" loading="lazy"></iframe>

Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here](https://nielsitberglund.podbean.com/e/interesting-stuff-week-08-2025/).

## Generative AI

* [Single-Agent Planning in a Multi-Agent System: A Unified Framework for Type-Based Planners](https://arxiv.org/pdf/2502.08950). This research paper, "Single-Agent Planning in a Multi-Agent System: A Unified Framework for Type-Based Planners," addresses the challenge of planning for a single agent in a multi-agent environment without prior knowledge of its opponents. The authors propose a theoretical framework that unifies various planning approaches, balancing the trade-off between exploiting existing information and exploring to improve future planning. This framework encompasses a spectrum of planners, ranging from those seeking exact solutions to those providing approximations for larger problems. By implementing and testing several planners within this framework in a multi-agent route planning domain, the authors offer new insights into multi-agent decision-making and potential applications in related areas like mechanism design, highlighting the surprisingly strong performance of "safe-agents."
* [DeepSeek AI Introduces CODEI/O: A Novel Approach that Transforms Code-based Reasoning Patterns into Natural Language Formats to Enhance LLMs' Reasoning Capabilities](https://www.marktechpost.com/2025/02/15/deepseek-ai-introduces-codei-o-a-novel-approach-that-transforms-code-based-reasoning-patterns-into-natural-language-formats-to-enhance-llms-reasoning-capabilities/). DeepSeek AI's CODEI/O is a novel method designed to improve the reasoning capabilities of Large Language Models (LLMs). It transforms code-based reasoning patterns into a natural language format using input-output pairs and Chain-of-Thought rationales. This approach allows LLMs to internalise reasoning processes, such as logic flow, decision tree traversal, and modular decomposition, separate from the complexities of code syntax. The result is enhanced performance across diverse reasoning tasks, including logic, symbolic inference, mathematics, scientific deduction, and commonsense reasoning, as demonstrated by improved scores on multiple benchmarks.
* [The AI Growth Playbook: How Startups Are Quietly 10X-ing with AI (And How You Can Too)](https://pub.towardsai.net/the-ai-growth-playbook-how-startups-are-quietly-10x-ing-with-ai-and-how-you-can-too-beb94aa888f3?sk=v2%2F303b3c52-6087-4a22-937a-59ff7eac64ab). This post, "The AI Growth Playbook," argues that AI is no longer optional for startups but critical for achieving rapid growth and outmanoeuvring competitors. It outlines six key areas where AI can be leveraged: automating repetitive tasks, improving customer acquisition, hyper-personalising customer experiences, guiding product development, unlocking new revenue streams, and gathering competitive intelligence. The post demonstrates how AI is successfully implemented to drive efficiency, enhance customer engagement, and create new business models through companies like Scale AI, Jasper AI, and Spotify case studies. Ultimately, the piece serves as a practical guide for startups looking to integrate AI strategically across their operations to achieve exponential growth.
* [Karpathy on Grok3](https://x.com/karpathy/status/1891720635363254772). Andrej Karpathy's Twitter post offers an early assessment of Grok 3, a new AI model. Karpathy highlights that Grok 3 with "Thinking" enabled demonstrates state-of-the-art capabilities, rivalling OpenAI's top models in specific areas such as solving logic puzzles and coding challenges while also showing courage in attempting complex problems. He also explores DeepSearch, Grok 3's research tool, finding it comparable to Perplexity but slightly behind OpenAI's offering. Despite some shortcomings in humour, ethical reasoning, and specific puzzle types, Karpathy concludes that Grok 3 shows tremendous promise due to its rapid development and positions it as a valuable tool in the AI landscape.
* [Building an Ideation Agent System with AutoGen: Create AI Agents that Brainstorm and Debate Ideas](https://www.marktechpost.com/2025/02/20/building-an-ideation-agent-system-with-autogen-create-ai-agents-that-brainstorm-and-debate-ideas/). This tutorial outlines how to build an AI-powered ideation system using AutoGen, leveraging the capabilities of LLMs like ChatGPT. The core idea involves creating two specialised AI agents with distinct roles, such as "idea generator" and "critic," and then having them debate ideas in a structured conversation. AutoGen's RoundRobinGroupChat component ensures fair interaction, while TextMentionTermination allows the conversation to end gracefully upon reaching a consensus. The agents, built using AssistantAgent, utilise system messages to guide their behaviour, demonstrating a method for creating collaborative AI systems that can brainstorm and refine ideas efficiently.
* [My LLM codegen workflow atm](https://harper.blog/2025/02/16/my-llm-codegen-workflow-atm/). Harper Reed's blog post details his current workflow for using Large Language Models (LLMs) to generate code, covering greenfield projects and iterative work on existing codebases. For new projects, he advocates a process of honing ideas with conversational LLMs, followed by detailed planning and, finally, execution using code generation tools like Claude or Aider. For existing projects, he emphasises efficiently gathering code context with tools like repomix to enable incremental improvements and code reviews. The post also touches on the challenges of solo LLM-assisted coding and the need for better multiplayer interfaces while acknowledging concerns about the environmental impact of AI.

## Streaming

* [A Distributed State of Mind: Event-Driven Multi-Agent Systems](https://www.confluent.io/blog/event-driven-multi-agent-systems/). This post explores the power and challenges of multi-agent systems, where intelligent software agents collaborate to solve complex problems. It highlights how event-driven design, inspired by microservices architecture and enabled by technologies like Apache Kafka, can provide scalable and efficient solutions. The article details four key multi-agent design patterns – orchestrator-worker, hierarchical agent, blackboard, and market-based – and explains how to implement them using an event-driven approach. By using events as a shared language and focusing on reactive agent interfaces, the authors propose shifting from traditional request/response models to more agile, resilient, and adaptable systems, ultimately unlocking the full potential of multi-agent AI.

## WIND (What Is Niels Doing)

It is this time again:

![](/images/posts/banner-data-ai-ignite.jpg)

**Figure 1:** *Data & AI Community Day Durban: Season of AI — AI @ Ignite++*

The gears are already in motion for our next big event—[**Data & AI Community Day Durban: Season of AI — AI @ Ignite++**][1], happening on 88! The "**++**" isn't just for show; while AI will take center stage, we're bringing in a broader range of topics to spark discussions beyond the usual AI focus. Think cutting-edge data innovations, cloud advancements, real-time streaming, and much more—all packed into a full-day event designed to inspire and educate.

We officially opened the [**Call for Speakers**][2] yesterday, and I'm already excited to see the lineup shaping up. If you've got insights to share—whether in AI, ML, data engineering, cloud solutions, or anything that fits the Ignite++ theme—this is your chance to be part of something great! 

Registrations open in a week, so stay tuned if you want to secure your spot. It will be another incredible day of tech, networking, and learning, and I can't wait to share more details as we finalise the agenda!

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
[2]: https://sessionize.com/data-ai-community-day-durban-ignite
