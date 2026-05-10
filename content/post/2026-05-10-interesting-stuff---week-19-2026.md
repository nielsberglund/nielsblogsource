---
type: post
layout: "post"
title: Interesting Stuff - Week 19, 2026
author: nielsb
date: 2026-05-10T05:30:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-19-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-19-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - PostgreSQL
  - AI Agents
  - Claude Skills
description: "Week 19 tech roundup: An academic deep-dive into Claude Code's architecture, why HTML beats Markdown for agent output, Anthropic's complete guide to building skills, Martin Fowler on the Genie Tarpit, and the case for just using Postgres."
---

This week's roundup is a love letter to anyone building with AI agents. A VILA Lab research paper cracks open Claude Code's source to reveal a 98.4% deterministic harness wrapped around an LLM that gets maximum decision latitude, Anthropic publishes the definitive guide to building skills, and a Claude Code team member argues that HTML is the unreasonable secret weapon for agent output.

Beyond the agent tooling deep-dives, Martin Fowler's latest Fragments explores the "Genie Tarpit" and whether code quality still matters in the agentic era. A compelling post argues that 2026 is the year to consolidate on Postgres, and Wall Street discovers that deploying AI into portfolio companies might be the real money printer.

<!--more-->

---

## Databases

* [**It's 2026, Just Use Postgres**][1]. In this post, Raja Rao DV makes a compelling case for database consolidation using a wonderfully relatable analogy: your database is your home, and you don't build a restaurant across town just because you need to cook dinner. Postgres with extensions handles search (`pg_textsearch`), vectors (`pgvectorscale`), time-series (TimescaleDB), documents (`JSONB`), caching (`UNLOGGED` tables), queues (`pgmq`), and geospatial (PostGIS), all under one roof. The kicker: most of these extensions use the same core algorithms as their specialised competitors. `pgvectorscale` achieved 28x lower p95 latency than Pinecone at 99% recall. The "right tool for the right job" mantra, it turns out, is often just vendor marketing dressed up as wisdom.

  What I find particularly sharp is the AI-era framing. Agents need to fork a test database, try a fix, verify it, and tear it down. With a single database, that's a single command. With seven databases, your agent needs to coordinate snapshots, spin up seven services, configure seven connection strings, and hope nothing drifts. The post argues that database consolidation has shifted from architectural preference to functional requirement in the agentic era, and it's hard to disagree when you see how much simpler everything becomes.

## Generative AI

* [**The Complete Guide to Building Skills for Claude**][2]. This post by Anthropic is a comprehensive 32-page guide that walks you through everything you need to build effective skills, from planning and structure to testing and distribution. For those unfamiliar, a skill is simply a folder with a `SKILL.md` file that teaches Claude how to handle specific tasks. The genius is in the progressive disclosure design: YAML frontmatter loads into the system prompt, so Claude knows when to activate the skill; the main body loads only when relevant; and linked reference files load on demand. This three-level system keeps token usage to a minimum while delivering specialised expertise exactly when needed.

  The guide identifies three primary skill categories: Document & Asset Creation (consistent high-quality output), Workflow Automation (multi-step processes with validation gates), and MCP Enhancement (workflow guidance layered on top of connector tool access). For MCP builders, the kitchen analogy lands perfectly: MCP provides the professional kitchen with tools and ingredients, and skills provide the recipes. Without skills, users connect to your MCP but don't know what to do next. With skills, pre-built workflows activate automatically, and best practices are embedded in every interaction.

  Here's what strikes me about the timing: skills have gone from a niche power-user feature to having an official open standard, an API endpoint, organisation-wide deployment, and now this definitive guide. The pattern library alone (sequential workflow orchestration, multi-MCP coordination, iterative refinement, context-aware tool selection, domain-specific intelligence) gives you everything needed to turn raw MCP tool access into reliable workflows. If you're building anything on top of Claude, whether in Claude Code or via the API, this is required reading. The skill-creator skill can get you a working skill in 15-30 minutes, which is frankly ridiculous for the level of capability it unlocks.

---

* [**Fragments: May 5**][3]. Martin Fowler, in this post, curates several thought-provoking vignettes on the current state of software development and AI. The centrepiece is Kent Beck's "Genie Tarpit" metaphor, which invokes Fred Brooks' classic tar pit imagery. Beck observes that AI tools (the "genies") naturally produce code that slides toward complexity: claiming success even when code barely works, piling complexity on complexity until even the genie can't pretend to make progress. The fundamental question: can the genie evade the tar pit, or will internal code quality remain essential even in the agentic era? One view holds that developer experience and agent experience form a single circle. The other view is that galaxy-brain LLMs will eventually make sense of any spaghetti. Fowler leaves the question open, which is intellectually honest but also slightly terrifying.

  What fascinates me is the thread about Jessica Kerr's double feedback loop, and Fowler's connection to what he calls "Internal Reprogrammability," a lost joy from the Smalltalk and Lisp communities. The idea that agents let us rediscover the pleasure of moulding our development environment to fit exactly our problem and personal tastes resonates deeply. In the same fragments, Fowler also highlights the staggering AI infrastructure spend, with Amazon, Alphabet, and Microsoft all above 50% of revenues, Meta and Oracle hitting 75%, and Apple conspicuously at around 10%. Connected to Willem van den Ende's post arguing local models are "good enough," it raises the question of whether Apple's hardware-first strategy might be the wisest long-term bet.

---

* [**AI just found Wall Street**][4]. In this post by the Natural 20 newsletter, the convergence of AI and private equity gets dissected with sharp clarity. Two headline moves frame the piece: OpenAI created "The Deployment Company" (raising $4 billion at a $10 billion valuation) and Anthropic built an enterprise AI services arm partnering with Blackstone, Goldman Sachs, and others. The playbook in both cases is identical: partner with PE firms to scale AI across their portfolio companies. Private equity firms control thousands of mid-market companies that are decades behind in technology adoption, and now they have an incentive to upgrade them through AI consulting rather than traditional McKinsey-style engagements. The margins look transformative.

  I keep wrestling with what this means for the broader AI industry. We've spent the last two years watching AI labs compete on benchmarks and developer mindshare. Suddenly, the real revenue opportunity might not be API calls at all, but professional services: deploying AI into businesses that don't have the technical sophistication to do it themselves. OpenAI and Anthropic are essentially becoming consulting companies with a model advantage. The Natural 20 newsletter asks the right question: Is this the moment AI moves from "impressive demos" to "actual enterprise value at scale"? If PE firms start measuring AI-driven EBITDA improvements across their portfolios, the pressure on every company to adopt AI accelerates dramatically.

---

* [**Dive into Claude Code: The Design Space of Today's and Future AI Agent Systems**][5]. This post, a 38-page academic paper from the VILA Lab, is the most thorough source-level analysis of a production coding agent I've encountered. The researchers decompile Claude Code's architecture into five core values, thirteen design principles, a seven-component architecture, and a five-layer subsystem decomposition. The headline finding is remarkable: an estimated 1.6% of the codebase constitutes decision logic; the remaining 98.4% is the operational harness (permission gates, tool routing, context management, recovery logic). The LLM is invoked as a stateless completion endpoint with maximum decision latitude, surrounded by dense deterministic infrastructure. This inverts the dominant agent-engineering pattern, where frameworks route model outputs through explicit graph nodes.

   The architectural details are extraordinary. The permission system layers seven independent safety mechanisms from tool pre-filtering through deny-first rule evaluation, permission mode constraints, an ML-based auto-mode classifier, shell sandboxing, non-restoration on resume, and hook-based interception. The context management pipeline uses five graduated compression stages (budget reduction, snip, microcompact, context collapse, and auto-compact) that fire in sequence with increasing aggressiveness. The paper also compares Claude Code to OpenClaw, a multi-channel personal assistant gateway, showing that the same recurring design questions yield different answers when the deployment context changes. The comparison reveals that the design space of AI agents is layered rather than flat, and that these systems can compose rather than compete.

  Here's what strikes me as the most consequential insight for anyone building agents: the paper argues that as frontier models converge in capability, the quality of the operational harness surrounding them becomes the principal differentiator. Investing in deterministic infrastructure (context management, safety layering, recovery mechanisms) may yield greater reliability gains than adding planning scaffolding around increasingly capable models. The paper also offers a sobering evaluative lens: a 16-developer RCT found that AI tools made developers 19% slower despite a perceived 20% improvement, and a causal analysis of 807 repositories found that code complexity increased by 40.7% after Cursor adoption. The permission system's design is informed by the finding that users approve 93% of permission prompts, meaning approval fatigue makes human vigilance unreliable as a sole safety mechanism. This is essential reading for anyone building or extending Claude Code.

---

* [**Using Claude Code: The Unreasonable Effectiveness of HTML**][6]. Thariq makes a case in this Twitter tweet that has been hiding in plain sight: when working with Claude Code, generating HTML rather than Markdown dramatically improves the quality and utility of agent output. The argument is practical rather than theoretical: HTML gives you rich interactive documents that open in a browser with zero dependencies, full CSS control for professional layouts, embedded JavaScript for interactivity, and the ability to create everything from design prototypes to custom editing interfaces. Thariq identifies several high-value use cases: spec/planning documents with collapsible sections and navigation, code review dashboards with diff viewers, design prototypes that stakeholders can actually click through, and reports with embedded charts and data visualisation.

  The key insight is that Markdown constrains the agent to a lowest-common-denominator output format, even though the browser is already a universal rendering engine on every developer's machine. By asking Claude Code to produce HTML, you unlock the full spectrum of web technologies: sortable tables, syntax-highlighted code blocks with copy buttons, responsive layouts, dark mode, embedded SVGs, and even small interactive applications. The output becomes a self-contained artefact rather than a static document that needs further processing.

  What I find most compelling is how this connects to the broader agent output paradigm. We've collectively assumed that agent-generated content should be plain text or Markdown because that's what fits naturally in a terminal workflow. But the moment you shift to HTML, the agent's output capability expands enormously, and the feedback loop tightens because you can immediately see and interact with what was produced. For anyone doing serious work with Claude Code on specs, reports, or design artefacts, this is one of those "why didn't I think of this sooner" insights that immediately changes your workflow. I've already started experimenting with this approach for my own projects.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to
[sd]: https://streamingdata.io


[1]: https://www.tigerdata.com/blog/its-2026-just-use-postgres
[2]: https://resources.anthropic.com/hubfs/The-Complete-Guide-to-Building-Skill-for-Claude.pdf
[3]: https://martinfowler.com/fragments/2026-05-05.html
[4]: https://natural20.beehiiv.com/p/ai-just-found-wall-street
[5]: https://arxiv.org/pdf/2604.14228
[6]: https://x.com/trq212/status/2052809885763747935
