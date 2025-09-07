---
type: post
layout: "post"
title: Interesting Stuff - Week 36, 2025
author: nielsb
date: 2025-09-07T08:20:30+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-36-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-36-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - AI-assisted Coding
  - postgresql
  - TimescaleDB
description: "Discover how TimescaleDB delivers 979x faster performance than PostgreSQL, Claude Code transforms from autocomplete to autonomous engineering teams, and agentic AI revolutionizes customer experience beyond chatbots. Week 36 tech insights on database optimization, AI-assisted coding workflows, and enterprise automation strategies that are reshaping software development at scale."
---

This week's tech roundup captures a fundamental shift from band-aid solutions to systematic transformation across multiple domains. TimescaleDB demonstrates how specialised infrastructure can deliver 979x performance gains over traditional databases for time-series workloads, while agentic AI is revolutionising both coding workflows and customer experience systems by moving beyond simple automation to true orchestration. The common thread connecting these developments is the transition from piecemeal fixes to unified platforms that treat complex problems holistically.

Whether that's Boris Cherney's vision of Claude Code evolving from autocomplete to autonomous engineering teams, or the replacement of chatbot proliferation with agentic systems that actually complete end-to-end workflows. These aren't just incremental improvements; they represent architectural paradigm shifts that fundamentally change how we approach software development, data management, and customer service at scale.

<!--more-->

## Databases

* [**Time-Series Data Management With TimescaleDB**][4]. Nakylai Taiirova, in this post, dives deep into the time-series database battle using real Intel Berkeley Research Lab sensor data (2.3 million readings). Her team at Mad Devs faced the classic e-commerce challenge of tracking product page views, click rates, and search rankings; generating thousands of daily timestamped records while keeping historical data intact. The performance comparison reveals fascinating trade-offs that every developer handling temporal data should understand.

  **The results paint a clear picture: TimescaleDB's hypertable architecture shines for complex time-based operations** (170.9ms vs PostgreSQL's 443.2ms for aggregations), while PostgreSQL maintains its edge for simple queries (226.5ms vs 317.7ms). But the real knockout punch comes with continuous aggregates; pre-computed metrics that deliver 979x faster dashboard queries. Add TimescaleDB's 83% storage compression (209MB down to 35MB), and you've got a compelling case for specialised time-series infrastructure.

  **My take? This isn't just about raw performance numbers**: it's about choosing the right tool for your data patterns. For mixed workloads, that 40% penalty on basic queries might sting, but for time-series analytics at scale, TimescaleDB's advantages are undeniable. Can you prove ROI on premium placements using 2-3 years of historical data? That's the kind of business value that justifies architectural decisions.

## Generative AI

* [**Claude Isn’t Your Copilot. It’s Your New Engineering Team.**][1]. This post by Mayank Bohra revolutionises how we think about AI coding assistants by shifting from line-by-line coding to high-level orchestration. His secret weapon? Two `claude.md` files serve as living onboarding documents: one for personal coding philosophy in his home directory and another for project-specific context in each repo. He constantly updates these files when Claude messes up, creating an iterative training loop that upgrades the AI's core instruction manual with every interaction.

  **The real magic happens with Claude's Modular Capability Providers (MCPs) that automate the entire dev loop**: fetching tasks from Notion, creating branches, implementing features, and raising PRs without context switching. Combined with custom slash commands like `/pr`, `/lint`, and `/checkout`, Bohra transforms repetitive multi-step workflows into simple shortcuts. His planning-first approach treats Claude like an agentic tool that excels with clear, well-defined goals rather than vague prompts.

  **The paradigm shift culminates in parallel execution: running multiple Claude instances on separate repo clones** to tackle tasks simultaneously while shifting from writer to reviewer. Instead of sequential development, you're suddenly managing a distributed team of tireless junior developers. This isn't just about shipping code faster; it's fundamentally changing how software gets built at scale.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Spec-driven development with AI: Get started with a new open source toolkit**][2]. Christopher Harrison and Den Delimarsky tackle the fundamental issue with current AI coding workflows in this post: the gap between "looks right" and "actually works." Their four-phase process (Specify, Plan, Tasks, Implement) transforms vague prompts into executable artefacts. Instead of relying on Claude Code to accurately predict your requirements, you provide a detailed specification that serves as the shared source of truth. Then, you let the AI generate technical plans and break them down into implementable tasks.

  **The approach works because it leverages what language models excel at (pattern completion) while eliminating what they struggle with (mind reading)**. When you ask an AI to "add photo sharing to my app," you're forcing it to guess at thousands of unstated requirements. Spec Kit's structured workflow turns those assumptions into explicit decisions, creating clear checkpoints where you verify and refine before moving forward. The result is focused code reviews of specific problems rather than thousand-line code dumps that may or may not solve your actual needs.

  **Spec Kit excels in three scenarios: greenfield projects where upfront clarity prevents generic solutions, feature work in existing systems where architectural constraints must be respected, and legacy modernisation where original intent needs to be captured in modern specifications.** The broader shift here is profound - moving from "code is the source of truth" to "intent is the source of truth" as AI makes specifications truly executable.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**The future of agentic coding with Claude Code**][3]. In this YouTube video, Boris Cherney ("father" of Claude Code) and Alex Albert (Claude Relations) discuss the dramatic shift from IDE-based autocomplete to true agentic coding over just 12 months. The breakthrough wasn't just better models (from Sonnet 3.5 to 4.0), but the co-evolution of both the AI capabilities and the "harness"; the scaffolding that includes system prompts, context management, tools, and MCP servers. Boris describes how even early versions with weaker models showed immediate adoption when engineers saw Claude Code on colleagues' screens, proving the fundamental workflow change was already compelling.

  **The product development philosophy centres on radical responsiveness to user feedback rather than traditional evaluation metrics**. Boris admits "it's all vibes" when assessing model improvements, because synthetic benchmarks can't capture the complexity of real software engineering tasks. The internal feedback loop at Anthropic became a "fire hose" of continuous input, with Boris prioritising rapid bug fixes and immediate responses to maintain user engagement and trust in the feedback process.

  **Looking ahead, Boris envisions engineers transitioning from direct text manipulation to higher-level goal setting, where Claude proactively implements changes for review rather than requiring constant guidance**. His advice for developers is to learn the fundamentals while embracing creativity, as ideas can now be prototyped instantly rather than languishing in backlogs. The hackability features (`CLAUDE.md` files, slash commands, hooks, MCP) transform Claude Code from a tool into an extensible platform where "code itself is no longer precious" and can be rewritten repeatedly until it serves the intended purpose.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Stop adding chatbots, use Agentic AI to Modernize Legacy CX Systems**][5]. Manbir T delivers a brutal reality check in this post about the chatbot proliferation problem plaguing customer experience teams. The issue isn't that chatbots are inherently flawed; instead, they're drastically undersized for legacy CX environments riddled with fragmented data sources, infrastructure sprawl, and organisational silos. Traditional bots operate like "polite receptionists" who can recognise intents and fetch snippets. Still, they can't log into your order management system, update addresses, verify identity, and notify warehouses end-to-end without human handoffs.

  **Agentic AI fundamentally changes the game by introducing a unifying orchestration layer that treats CX as a full-stack workflow problem rather than a chat problem**. Instead of optimising for deflection, you're optimising for resolution. When a customer requests a shipping address change, agentic AI authenticates the user, checks fraud risk, confirms carrier cutoffs, updates the address, recalculates delivery dates, issues confirmations, and notes changes across CRM and OMS: all without human intervention or baton drops.

  **The five-step implementation roadmap is refreshingly practical: map customer journeys (not org charts), consolidate data governance, choose unified platforms supporting reasoning and action, pilot high-volume low-risk scenarios, then iterate and embed workflows like versioned products**. The shift from "bot licenses" to "resolved outcomes" in budgeting reflects a maturation from cosmetic AI to operational transformation that actually moves KPIs like FCR, CSAT, and cost per ticket.

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

[1]: https://pub.towardsai.net/claude-isnt-your-copilot-it-s-your-new-engineering-team-ae2dc96cc75a?sk=v2%2F099f3c9c-e595-42b5-b740-c7f9c37a7821
[2]: https://github.blog/ai-and-ml/generative-ai/spec-driven-development-with-ai-get-started-with-a-new-open-source-toolkit/
[3]: https://www.youtube.com/watch?v=iF9iV4xponk
[4]: https://maddevs.io/writeups/time-series-data-management-with-timescaledb/
[5]: https://pub.towardsai.net/stop-adding-chatbots-use-agentic-ai-to-modernize-legacy-cx-systems-4ce078351d10?sk=v2%2F0d9eb858-a5ca-4fe9-b3f2-eddb0a2fc2bc
