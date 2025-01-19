---
type: post
layout: "post"
title: Interesting Stuff - Week 03, 2025
author: nielsb
date: 2025-01-19T13:34:24+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-03-25-2.jpg"
thumbnail: "/images/thumbnails/posts/wrup-03-25-2.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Streaming
  - Kafka
  - Flink
  - ICE 2025
description: "This week's blog post explores AI's transformative potential, from intelligent agents and generative AI pitfalls to event-driven architectures powering real-time workflows. Discover how NovaSky's $450 Sky-T1 model is democratizing AI and get a glimpse of the latest innovations showcased at ICE 2025."
---

Explore the latest in tech with this week's roundup! We dive into AI's transformative potential from Chip Huyen's insights on intelligent agents and generative AI pitfalls to Microsoft's AIOpsLab for autonomous clouds. 

Discover how event-driven architectures power real-time AI workflows and how NovaSky's $450 Sky-T1 model democratises advanced AI development. Plus, a glimpse into ICE 2025, where AI is reshaping the future of iGaming!

<!--more-->

<!--
## Podcast

If you rather listen to the summary:



Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here]().
-->

## Generative AI

* [Agents](https://huyenchip.com//2025/01/07/agents.html). In this post by Chip Huyen, intelligent agents are explored as the pinnacle of AI, capable of acting autonomously as assistants, coworkers, and more. Huyen emphasizes the transformative potential of foundation models in enabling agents to handle complex tasks such as market research, customer account management, and even data entry. This article digs into tools, planning, and evaluating agents, stressing the need to address failure modes. A thought-provoking takeaway is how these agents balance capability and risk, making their evolution exciting and challenging​.
* [Sky-T1: Train your own O1 preview model within $450](https://novasky-ai.github.io/posts/sky-t1/). NovaSky presents Sky-T1-32B-Preview, a reasoning model trained on a $450 budget while matching performance with high-end counterparts in coding and reasoning tasks. The project offers reproducible data, code, and model weights by focusing on open-source collaboration. This initiative is a testament to the democratization of AI, demonstrating that cutting-edge capabilities can be achieved affordably, encouraging broader community participation in advanced model development​.
* [AIOpsLab: Building AI agents for autonomous clouds](https://www.microsoft.com/en-us/research/blog/aiopslab-building-ai-agents-for-autonomous-clouds/). This Microsoft Research post looks at AIOpsLab, a framework for evaluating and improving AI agents in cloud operations. With enterprises adopting microservices, the need for robust solutions to mitigate operational complexities has grown. AIOpsLab provides tools for reproducible benchmarks, enabling incident analysis and triaging through AI. The push for standardized practices is compelling, as it aligns with the larger goal of achieving five-nines availability in cloud services—no small feat for today's dynamic IT environments​.
* [Common pitfalls when building generative AI applications](https://huyenchip.com//2025/01/16/ai-engineering-pitfalls.html). Chip Huyen identifies common mistakes in generative AI application development in this post, from misusing AI to prioritizing complexity over simplicity. A striking example is using generative AI for energy optimization when more straightforward solutions suffice. Huyen advocates for focusing on product over AI and building robust user experiences, offering anecdotes that challenge assumptions about what users really want. The insights here resonate strongly, especially emphasising starting simple and evolving with care​.
* [Introducing ambient agents](https://blog.langchain.dev/introducing-ambient-agents/). LangChain's blog introduces ambient agents—AI systems designed to act proactively by responding to ambient signals rather than waiting for user input. These agents aim to reduce interaction overhead and enable simultaneous multitasking. The concept of human-in-the-loop for critical decisions adds an interesting layer of trust and usability. This post challenges traditional "chat-first" paradigms and opens the door to a more integrated AI presence in everyday workflows​.

## Streaming

* [Event-Driven AI: Building a Research Assistant with Kafka and Flink](https://www.confluent.io/blog/event-driven-ai-building-a-research-assistant-with-kafka-and-flink/). This Medium article showcases the creation of PodPrep AI, a research assistant leveraging event-driven architecture (EDA) and real-time data streaming. Sean Falconer highlights the importance of decoupling components to enable scalability and flexibility in AI systems. The application collects data, integrates workflows, and generates insights with minimal bottlenecks. The emphasis on EDA as a "central nervous system" for AI is a refreshing perspective on modern system design, especially for distributed environments​.

## WIND (What Is Niels Doing)

It is that time of the year again:

![](/images/posts/ice-2025.jpg)

**Figure 1:** *ICE 2025*

I'm thrilled to be at ICE 2025 in Barcelona, the premier event for all things iGaming, where innovation meets excitement! While this isn't my first time attending, this year is special for a couple of big reasons:

#### 🎯 Derivco Has a Stand for the First Time!

We're making waves at ICE by unveiling four brand-new products designed to redefine the iGaming experience. Swing by stand 5G20 in Hall 5 to get a sneak peek at what we've been working on and see innovation in action.

#### 🎙️ Panel Alert: [**Beyond Pixels: AI's Role in Shaping the iGaming Industry**][1]

I'm honoured to join a panel discussion organized by Microsoft, exploring how AI is reshaping the future of iGaming. Don't miss it on Tuesday, January 21, from 15:30 to 16:15. This promises to be a fascinating conversation about the intersection of technology and gaming.

If you're at ICE, make sure to stop by, say hi, and check out everything we have to offer. Let's connect, discuss the future of iGaming, and make this year's ICE unforgettable!

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

[1]: https://www.icegaming.com/ice-2025-1/ai-in-games-panel-the-ai-evolution-shaping-tomorrows-games
