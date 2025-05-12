---
type: post
layout: "post"
title: Interesting Stuff - Week 19, 2025
author: nielsb
date: 2025-05-11T09:48:13+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-19-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-19-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - vibecoding
  - Data & AI Community Day Durban
  - Data & AI Community Day Joburg
  - Season of AI
  - AI Agents
description: "This week’s post explores key developments in Generative AI, from picking the right model for GitHub Copilot to Google's stealthy Gemini takeover and hands-on lessons from vibe coding. I also share updates on upcoming Data & AI Community Day events, including my talk in Joburg next week."
---

This week's roundup dives deep into the evolving world of Generative AI—from choosing the right Copilot model to surviving the chaos of vibe coding, and even auto-generating code from ML papers. 

We also examine Google's Gemini 2.5 models and why they might quietly take over the AI backend stack. Plus, I've just locked in the full agenda for [**Data & AI Community Day Durban**][5] and am prepping to speak at the [**Joburg edition**][7] next week on (you guessed it) vibe coding!

<!--more-->

<!--
## Podcast

If you rather listen to the summary:



Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here]().
-->

## Generative AI

* [Which AI model should I use with GitHub Copilot?][1]. In this post, Cassidy Williams breaks down the landscape of AI models available for GitHub Copilot and offers a practical, at-a-glance guide for developers overwhelmed by choice. The article compares models like GPT-4.1, Claude 3.5 Sonnet, Gemini 2.5 Pro, and others across dimensions like speed, reasoning power, and multimodal capability. Whether you're after blazing-fast prototyping with o4-mini or deep architectural planning with Claude 3.7 Sonnet, there's a model for every coding challenge. What stood out to me is how Cassidy emphasises fit-for-purpose over brand loyalty. It's a subtle but important reminder that tooling decisions should be made based on your problem space, not just hype or cost. I've personally fallen into the "just use GPT-4 for everything" trap, and this post nudged me to rethink that approach. I particularly appreciated the cheat-sheet style TL;DR - more blogs should offer that kind of developer-first readability.
* [Surviving Vibe Coding: Strategies for Staying Productive][2]. This post by Kelvin Lu tackles the chaos, promise, and reality of "vibe coding"—the hands-off, prompt-driven programming paradigm popularised by Andrej Karpathy. Unlike traditional AI-assisted coding, where the developer leads and the AI supports, vibe coding flips the dynamic: you describe what you want in natural language, and the AI builds it. Sounds magical, right? Not so fast. Kelvin's deep-dive analysis surfaces serious shortcomings: lack of clarification from LLMs, rushed solutions, poor memory handling, and limited collaboration cues. What makes this post a standout is Kelvin's hands-on testing. He compared LLMs like ChatGPT, Gemini, Claude, DeepSeek, Qwen, and Mercury by asking them to build a doctor appointment app. Surprisingly, it wasn't the usual suspects that stole the show—models like Qwen and DeepSeek outperformed more popular options with thoughtful architecture and practical guidance. Here's where I'll chime in: vibe coding does feel like managing a junior dev who's brilliant, but has zero social skills. The advice to shift your mindset from "coder" to "project manager" is spot on. The magic of vibe coding isn't in expecting AI to "just do it," but in learning to orchestrate it effectively, with documentation, phased planning, and rule-setting. If this is the future, it will reward those who guide the vibe, not just ride it.
* [Paper2Code: Automating Code Generation from Scientific Papers in Machine Learning][3]. In this paper, the authors from KAIST and DeepAuto.ai present PaperCoder, a multi-agent framework that converts ML research papers into executable code repositories—an ambitious leap in reproducibility and research automation. The process mimics a full software development lifecycle through three key stages: planning (architecture and configuration), analysis (file-level intent and structure), and coding (modular, dependency-aware generation). Unlike prior systems that rely on partial implementations or APIs, PaperCoder takes the full paper as input and builds a functional repo from scratch. This post goes well beyond the typical "LLMs can help" narrative. PaperCoder outperformed ChatDev and MetaGPT on the Paper2Code and PaperBench Code-Dev benchmarks, with both model-based and human evaluations showing significantly better scores in code quality, completeness, and usefulness. The generated code was more structured and nearly executable out-of-the-box, requiring on average only 0.48% of lines to be fixed. That's staggering. Here's my take: this might be one of the most meaningful applications of LLMs to date. It addresses the actual pain point in ML research—reproducibility—and offers a viable, structured path toward automating it. But the real genius? The team didn't stop at "let's generate code." They built a reproducible framework that emulates how humans would tackle this task, complete with diagrams, dependency resolution, and config generation. If you ask me, PaperCoder isn't just another AI tool—it's a blueprint for the future of scientific publishing. Imagine every NeurIPS paper having a GitHub repo auto-generated and validated on submission.
* [Vibe Check: Gemini 2.5 Pro and Gemini 2.5 Flash][4]. In this post, Katie Parrott gives a no-nonsense look at why Google's Gemini 2.5 models - Pro and Flash - might quietly take the AI backend crown. Unlike OpenAI's splashier releases, Gemini doesn't dominate headlines, but it's quickly becoming the engine behind popular dev tools like Cursor and Windsurf, and running under the hood of AI products like Cora and Sparkle. Gemini 2.5 Pro is positioned as a "thinking model," built for deep reasoning with a whopping 1 million-token context window. It shines at rewriting entire code bases, long-context planning, and multimodal tasks. Developers praise it for its reliability and logic, though some grumble about excessive inline comments and clunky tool calls. Gemini 2.5 Flash, on the other hand, is the nimble multitasker: it offers programmable reasoning depth and excels at orchestrating high-throughput tasks at budget-friendly costs. Here's my take: this piece nails the underlying strategic brilliance of Google's AI play. Flash isn't trying to win on IQ—it's playing the operational long game. With cheap inference, speed tuning, and tight integrations across Google's vast stack (Chrome, Android, Gmail), Gemini is quietly becoming the infrastructure glue for AI-powered apps. If OpenAI wins the hype war, Google may win the deployment war, which really matters for devs and companies.

## WIND (What Is Niels Doing)

Last week, I gave our speakers more time by extending the Call for Speakers for [**Data & AI Community Day Durban: Season of AI – The Age of Agency**][5]. And wow - I'm glad I did! The extra window brought in a wave of quality submissions, and after reviewing them over the past few days, I'm excited to say that we now have a fully packed agenda for the May 24 event. It will be another strong showing of sessions on AI Agents, vibe coding, streaming, and a lot of other cool stuff. You can view all the details about the event below:

📌 **Event Details:**

* 📅 **Date:** May 24, 2025
* 📍 **Venue:** TBA (announcement coming soon!)
* 🌐 [**Event Info**][5]
* 🎤 [**Speakers**](https://aimldatadurban.org/events/2025/season-of-ai-agents-speakers/)
* 📖 [**Sessions**](https://aimldatadurban.org/events/2025/season-of-ai-agents-sessions/)
* 🔗 [**Agenda**](https://aimldatadurban.org/events/2025/season-of-ai-agents-agenda/)

I hope to see at the event. If you are in the area, please join us for a day of learning and networking with like-minded individuals.

This week, I'm shifting gears and preparing for [**Data & AI Community Day Joburg**][7] on May 17. I'll present **Vibe Coding: Where AI Handles the Syntax, and You Build the Future**, which fits perfectly with many of the themes in this week's roundup. If you've enjoyed the articles about LLM-powered workflows, Gemini Pro, and PaperCoder, this talk will be right up your alley. There are still a few tickets left, so if you're in Jozi and want to nerd out about the future of AI-assisted development, [**grab one while you can**][6]!

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

[1]: https://github.blog/ai-and-ml/github-copilot/which-ai-model-should-i-use-with-github-copilot/
[2]: https://pub.towardsai.net/surviving-vibe-coding-strategies-for-staying-productive-f2034ba3799e
[3]: https://arxiv.org/pdf/2504.17192
[4]: https://every.to/context-window/vibe-check-gemini-2-5-pro-and-gemini-2-5-flash
[5]: https://aimldatadurban.org/events/2025/season-of-ai-agents/
[6]: https://www.quicket.co.za/events/311338-data-ai-community-day-johannesburg-may-2025/#/
[7]: https://www.dataandaicommunity.co.za/events/JHB-202505.html
