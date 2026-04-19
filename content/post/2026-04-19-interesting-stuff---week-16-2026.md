---
type: post
layout: "post"
title: Interesting Stuff - Week 16, 2026
author: nielsb
date: 2026-04-19T07:15:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-16-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-16-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - Claude Opus 4.7
  - Claude Design
  - Synthetic Data
  - AI Agents
  - .NET
  - Agent Harness
description: "Week 16 tech roundup: Claude Opus 4.7 and Claude Design launch, AI agents running a 25-person company, synthetic data generation with Misata, and more."
---

This week is all about Anthropic flexing hard. Claude Opus 4.7 drops with stricter instruction following and a new effort level, while Claude Design enters the scene as a full visual collaboration tool. Meanwhile, a 25-person media company reveals how four Notion-powered AI agents replaced their human traffic controller.

Beyond the Anthropic orbit, we explore the Agent Harness concept that's reframing how we think about AI infrastructure. This Python library generates realistic synthetic datasets from plain English, building AI agents in the .NET ecosystem, and explains how Claude Code's new code review feature works under the hood.

<!--more-->

---

## Generative AI

* [**Building the Best Synthetic Data Generator in Python for 2026: Why I Am Building Misata and How to Use It**][1]. In this post, Muhammed Rasin introduces Misata, an open-source Python library for generating realistic, multi-table synthetic datasets from plain English descriptions. Unlike Faker (which generates individual fake values with no dataset awareness) or SDV (which requires real data to learn from), Misata takes your intent as input and produces statistically calibrated, relationally consistent data as output. The library supports pinning business targets: describe that MRR should rise from $80k in January to $320k in June, and the generated rows will exactly satisfy those constraints. It ships with pre-calibrated domain distributions for seven verticals, including fintech, healthcare, and ecommerce, that match real-world statistics for fraud rates, blood type frequencies, and product category distributions.

  What I find particularly clever is the architectural decision to treat aggregate targets as hard constraints while still sampling individual rows from realistic distributions. This solves a problem I've seen trip up countless teams: you need test data that tells a specific business story, but you also need it to look real at the row level. Misata threads that needle by first pinning the GROUP BY totals, then sampling rows that satisfy them. The two-step parse-then-generate flow also means you can inspect and adjust schemas before committing to generation — a nice touch for teams where data engineers and developers need to collaborate on dataset definitions.

---

* [**Implementing AI Agents in .NET: Ecosystem, Frameworks, and Best Practices**][2]. This post provides a comprehensive guide to building AI agents within the .NET ecosystem. It covers the foundational `Microsoft.Extensions.AI` library with its `IChatClient` and `IEmbeddingGenerator` abstractions, the emerging Microsoft Agent Framework for orchestration and memory management, and community-driven projects like BotSharp and LlmTornado. The article walks through a minimal agent implementation, with code examples that show project setup, DI configuration, memory management via conversation history, and structured function calls for tool usage.

  The architectural patterns section is where things get interesting. Covering orchestration patterns for multi-agent management using the Coordinator Worker Pattern, pipeline flow designs with plug-in extensibility, and fault tolerance strategies using libraries like Polly. The post also addresses security considerations that are often overlooked, including prompt injection risks, PII exposure during prompt construction, and the importance of output validation. For .NET developers looking to move beyond simple chat completions into production-grade agent architectures, this is a solid reference.

---

* [**How We Run a 25-person Company on Four AI Agents**][3]. Katie Parrott, in this post, reveals how Every, a media company running six products with around 25 people, replaced manual coordination with four custom Notion-powered AI agents. The star is Anton, a prioritisation agent who answers "What should I work on today?" by cross-referencing launch calendars, company strategy documents, and task lists, work that previously required their COO to manually route. Other agents handle meeting-to-task conversion (Max processes transcripts and posts action items to Slack), OKR planning (a strategy interviewer that conducts quarterly goal interviews), and daily growth scorecards pulled from PostHog and Stripe.

  Here's what strikes me about this setup: the power isn't in the AI models themselves, but in the interconnected databases beneath them. Anton works because strategy, calendar, tasks, people, and meeting notes all live in Notion and reference each other. The agents are just query interfaces into an already well-structured information architecture. Brian from Notion's advice to "ask the agent what's the dumbest, simplest system we could build" is golden: it forces you to strip away complexity before building. The fact that their entire team completed OKRs in two days using the strategy interviewer, a process that normally takes weeks, speaks volumes about what's possible when your data layer is solid and your agents are focused.

---

* [**Agent Harness: The Buzz Everyone's Now Using (But Only Pros Understand)**][4]. In this post by Joe Njenga, the increasingly popular concept of Agent Harness is demystified. An Agent Harness is the complete system that wraps around an AI model, encompassing everything beyond the model infrastructure that tells it what to do, what to remember, which tools to use, which boundaries to respect, and what to do when things go wrong. Njenga breaks it into six components: instructions, memory, tools, guardrails, verification, and recovery. The post uses the car engine analogy effectively: the model is powerful but needs a steering wheel, brakes, dashboard, and GPS to be useful.

  The practical example uses OpenHarness, an open-source Python project from HKU Data Science Lab with over 10k GitHub stars. Each of the six harness components maps to a concrete module: instructions via `CLAUDE.md` files, memory via `MEMORY.md` persistent storage, tools via 43 built-in capabilities, guardrails via a permission system, verification via pre/post-tool hooks, and recovery via API retries with exponential backoff. What fascinates me is how this concept reframes the conversation about AI failures: when your agent makes a mistake, it's not the model that failed, it's your system that allowed that failure. That's a mindset shift the industry desperately needs.

---

* [**Claude Opus 4.7 Is Here (The First Model That Punishes Bad Prompting)**][5]. Joe Njenga breaks down the release of Claude Opus 4.7, Anthropic's latest flagship model, in this post. The headline feature is dramatically improved instruction following. Previous models would sometimes skip parts of prompts, reorder steps, or make small judgment calls on your behalf. Opus 4.7 takes your instructions strictly, which is great when your prompts are clean, but means older prompts written for Opus 4.6 may need re-tuning. Other upgrades include higher-resolution vision (up to 2,576 pixels on the long edge, over three times that of previous models), better performance on real-world knowledge work benchmarks like GDPval-AA, and improved file-system-based memory for multi-session workflows.

  The Claude Code updates shipping alongside the model are equally noteworthy: a new `xhigh` effort level that sits between `high` and `max` for a better reasoning-latency trade-off, the `/ultrareview` slash command for thorough pre-merge code reviews, auto mode extended to Max users, and task budgets in public beta on the API. I keep wrestling with whether stricter instruction following is unambiguously good? It shifts more responsibility onto the prompt author, which is the right direction for production systems, but raises the bar for casual usage. The pricing remains $5/$25 per million tokens, positioning Opus 4.7 firmly as a premium tool for high-stakes work rather than everyday coding.

---

* [**Claude Code - Code Review**][6]. This post from the Claude Code documentation details how Code Review works as a managed service for GitHub pull requests. A fleet of specialised agents examines code changes across your full codebase, looking for logic errors, security vulnerabilities, broken edge cases, and subtle regressions. Findings are tagged by severity: Important (bugs that should be fixed before merging), Nit (minor issues worth fixing but not blocking), and Pre-existing (bugs in the codebase not introduced by the PR). Each review averages $15-25 in cost, scaling with PR size and complexity.

  The customisation model through `CLAUDE.md` and `REVIEW.md` files is well thought out. `CLAUDE.md` provides project context, and newly introduced violations get flagged as nits. `REVIEW.md` is injected as the highest-priority instruction block, letting you redefine severity thresholds, cap nit volume, skip generated files, and add repo-specific checks. The example `REVIEW.md` in the docs is worth studying: it recalibrates what "Important" means for a backend service, caps nits at five per review, and adds rules like "new API routes must have an integration test." For teams already using Claude Code, this could significantly reduce the cognitive overhead of code review while catching the subtle issues that human reviewers tend to miss during busy sprints.

---

* [**Introducing Claude Design by Anthropic Labs**][7]. In this post, Anthropic announces Claude Design, a new product that lets you collaborate with Claude to create polished visual work: designs, prototypes, slides, one-pagers, and more. Powered by Claude Opus 4.7, it's available for Pro, Max, Team, and Enterprise subscribers. The workflow starts with a text prompt, uploaded files, or even web-captured elements from your site, and you refine through conversation, inline comments, direct edits, or custom adjustment sliders. During onboarding, Claude builds a design system for your team by reading your codebase and design files, then applies your colours, typography, and components automatically to every subsequent project.

  What I find most compelling is the handoff story. When a design is ready to build, Claude packages everything into a handoff bundle you can pass to Claude Code with a single instruction, closing the loop from concept to production code. The Canva integration is smart too: designs can be exported directly into Canva for further collaborative editing. The quote from Brilliant's Senior Product Designer about complex pages taking 20+ prompts in other tools but only 2 in Claude Design is telling. This isn't just another AI image generator: it's a design collaboration environment that sits naturally between ideation and implementation. With Claude for Chrome, Claude for Excel, Claude for PowerPoint, and now Claude Design, Anthropic is clearly building an ecosystem play that goes well beyond the API.

---

## WIND (What Is Niels Doing)

In last week's roundup, I mentioned that **Part 12** of my [**Building an Event Management System with Claude Code**](/contact-event-claude-code) blog post series was on a back burner due to work commitments. Well, I'm happy to report that I've managed to get some momentum going again! I've been chipping away at it over the past week, and I'm optimistic that I'll be able to publish Part 12 soon: possibly even next weekend. The series covers how I'm using Claude Code to build a real event management system from scratch, and Part 12 digs into some exciting new territory. Stay tuned!

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions. 

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[ew]: https://every.to

[1]: https://pub.towardsai.net/building-the-best-synthetic-data-generator-in-python-for-2026-why-i-am-building-misata-and-how-to-3cedd65242ed
[2]: https://pub.towardsai.net/implementing-ai-agents-in-net-ecosystem-frameworks-and-best-practices-05c293d655fc
[3]: https://every.to/source-code/how-we-run-a-25-person-company-on-four-ai-agents
[4]: https://medium.com/ai-software-engineer/agent-harness-the-buzz-everyones-now-using-but-only-pros-understand-f4c38ae74045?sk=v2%2F974beacd-29c5-4d93-8a29-3403e949d775
[5]: https://medium.com/ai-software-engineer/claude-opus-4-7-is-here-the-first-model-that-punishes-bad-prompting-70010fe53690?sk=v2%2F9094445a-a2fa-4fd3-b209-7957b79ecb15
[6]: https://code.claude.com/docs/en/code-review
[7]: https://www.anthropic.com/news/claude-design-anthropic-labs
