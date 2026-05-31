---
type: post
layout: "post"
title: Interesting Stuff - Week 22, 2026
author: nielsb
date: 2026-05-31T06:15:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-22-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-22-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - AI Agents
  - Andrej Karpathy
  - Dynamic Workflows
  - Claude Opus 4.8
  - Data Formulator
description: "Week 22 tech roundup: Karpathy joins Anthropic to make Claude improve Claude, Opus 4.8 ships with a sleeper honesty feature, dynamic workflows turn Claude Code into an engineering team, and Microsoft's Data Formulator 0.7 brings agents to enterprise data."
---

If there were a theme tying this week together, it would be recursion. Anthropic hired the person most associated with using AI to improve AI, shipped a model designed to be honest about its own mistakes, and turned Claude Code into an orchestrator of hundreds of agents at once. The loop is starting to close, and it is fascinating to watch.

On the data side, Microsoft Research dropped Data Formulator 0.7, bringing context-aware agents to the messy reality of enterprise data. So this week we have talent wars, recursive self-improvement, an AI engineering team in a box, and a tool that finally takes the SQL drudgery out of analytics. Grab a coffee; there is a lot to unpack.

<!--more-->

---

## Generative AI

* [**The REAL Reason Andrej Karpathy Joined Anthropic**][1]. This post by Wes Roth digs past the obvious "OpenAI co-founder joins OpenAI rival" headline and lands on the detail that actually matters: Karpathy is joining Anthropic's pretraining team, reporting to Head of Pretraining Nick Joseph, to build a team focused on using Claude to accelerate pretraining research. As Roth puts it, Karpathy did not join Anthropic to work on Claude. He joined to use Claude to make Claude better. That one sentence reframes the whole hire.

  The backstory is the "Karpathy Loop." In March 2026, Karpathy released AutoResearch, a small open-source project built around his nanochat stack and a simple agentic loop: an AI coding agent edits the training code, runs a short experiment, evaluates whether the model improved, commits the win, reverts the failure, and tries again. Left running for roughly two days, the agent ran around 700 experiments, found about 20 stackable improvements, and cut the "Time-to-GPT-2" benchmark from 2.02 to 1.80 hours, an 11% speedup. Roth ties this neatly to Jack Clark's ImportAI #455 forecast of a 60%-plus chance of "no-human-involved AI R&D" by the end of 2028. Clark gave the forecast; Karpathy is the execution plan.

  What I keep wrestling with here is the distinction Roth draws between hype and substance. Most agent enthusiasm is vague: agents will run companies, replace workers, automate everything. AutoResearch is the opposite of vague. It targets a narrow domain with a clean, measurable feedback loop, precisely the setting where today's agents already operate. The agent doesn't need to understand the world; it needs to optimise training code against a number. That is a far more grounded and, frankly, more unsettling proposition than the usual AGI breathlessness.

  And the strategic placement is the kicker. A 5-10% training-efficiency gain sounds academic until you remember frontier training runs cost hundreds of millions of dollars. Putting a recursive research loop inside the most expensive, most consequential phase of model development is not a talent-war flex; it is a bet that the workflow producing the next Claude can itself be accelerated by Claude. Whether you find that thrilling or faintly alarming probably says a lot about where you sit on the AI optimism curve. I find myself somewhere in the uncomfortable middle.

---

* [**Data Formulator 0.7: AI-powered data analytics for enterprise data**][2]. In this post, the Microsoft Research team in Redmond introduces the latest release of Data Formulator, an open-source, AI-powered analytics system built for the unglamorous reality of enterprise data. Anyone who has spent time wrangling data across warehouses, BI systems, and a graveyard of CSV exports knows the real work happens long before the first chart: establishing governed connections, preparing metadata, managing permissions, and reshaping data across systems that were never meant to talk to each other.

  The headline feature is Data Connectors, which supports authentication, persistent connections, previews, and metadata across databases, warehouses, BI systems, object stores, and local files, so teams stop rebuilding the same plumbing for every source. On top of that sit context-aware agents that get access to the full workspace, connected sources, loaded tables, prior charts, and the user's objective, rather than a single isolated prompt. An agent can inspect data, write and run code in an isolated environment, generate chart specs, ask clarifying questions when a request is ambiguous, and produce reproducible code for every result. The Data Thread keeps long sessions navigable, letting you branch into alternative analyses and compare them side by side.

  As someone who spends a fair amount of time staring at database engines, what strikes me about Data Formulator is that Microsoft is attacking the part of analytics everyone else conveniently ignores. Chat interfaces are great in a demo but useless in a fragmented enterprise estate because they lack persistent access to your data, workflow history, and visualisation context. The "reproducible code for every result" detail is the one I'd hang my hat on, because an analytics agent that hands you verifiable, governed code is something you can actually put in front of an auditor. The fact that it is open-source and on GitHub makes it genuinely worth a weekend of poking around.

---

* [**Claude Opus 4.8 Is Here, and Anthropic Is Turning Claude Code Into an AI Engineering Team**][3]. In this post, Wes Roth looks at the Opus 4.8 release and makes a sharp observation: this is a model release, but it is really a *coordination* release. The drop bundles four things: Claude Opus 4.8 (API name `claude-opus-4-8`), dynamic workflows in Claude Code, an `ultracode` setting that pairs `xhigh` effort with automatic workflow orchestration, and a fast mode that is 2.5x quicker and cheaper than before. Pricing on the standard model is unchanged at $5/$25 per million input/output tokens, with a 1M-token context window aimed at professional software engineering and high-stakes agentic work.

  Anthropic is candid that Opus 4.8 is a "modest but tangible improvement" over 4.7 rather than a new intelligence tier, and the benchmarks back that framing: an Anthropic Capability Index of 155.5 (vs 154.1), SWE-bench Verified at 88.6%, Terminal-Bench 2.1 at 74.6%, GPQA Diamond at 93.6%, and a number-one ranking on FrontierSWE. Respectable, incremental gains. But the sleeper feature isn't on the leaderboard at all; it's honesty. Anthropic says 4.8 is roughly four times less likely than 4.7 to let flaws in its own code pass unremarked, scored highest on false-premise fact recall (77%), and truthfully disclosed it was an AI 97% of the time when assigned a human persona.

  Here's what strikes me, and it is the part I'd underline twice. We have spent two years optimising models to sound confident, and the most valuable upgrade in this release is a model that is more willing to say "I'm not sure this passed." Anyone who has had an agent cheerfully report "all tests green" over a quietly broken build understands exactly why this matters. The bottleneck in agentic coding was never raw intelligence; it was trust. A model that flags its own uncertainty is worth more in a real engineering workflow than one that's two points smarter on a benchmark and silently wrong.

  This connects directly to a tension I've raised in previous roundups: as we hand more work to agents, the scarce resource becomes our ability to verify what they did. A self-monitoring model doesn't solve that problem. Still, it shifts some of the verification burden back onto the system, rather than leaving it entirely on the exhausted human at the keyboard. If Anthropic is right that labs are now competing on self-monitoring and not just capability, that is a more mature and more reassuring frontier than the one we were on a year ago.

---

* [**Introducing dynamic workflows in Claude Code**][4]. In this post by Anthropic, we get the official deep dive on the headline feature from the 4.8 release, and it is the one I'm most excited to get my hands on. Dynamic workflows let Claude write orchestration scripts that run tens to hundreds of parallel subagents in a single session, checking their work before anything reaches you. The pitch is bold: work you'd normally plan in quarters now finishes in days. Crucially, the orchestration moves out of the conversation and into code, so the plan survives no matter how large the task grows, results are checked before they're folded in, and an interrupted run picks up where it left off.

  The mechanics are elegant. Claude dynamically plans from your prompt, breaks the task into subtasks, and distributes them across parallel agents. Agents attack the problem from independent angles, other agents try to refute what they found, and the run iterates until the answers converge. It's built for the work that genuinely is too big for one pass: codebase-wide bug hunts, security and optimisation audits, large migrations and framework swaps, language ports across thousands of files, and high-stakes plans you want stress-tested before you commit. It's in research preview, needs Claude Code v2.1.154 or later, and runs on Max, Team, and Enterprise plans plus the API, Bedrock, Vertex AI, and Microsoft Foundry. You start it by asking for a workflow or flipping on `ultracode`.

  The showcase example is genuinely jaw-dropping. Bun creator Jarred Sumner used dynamic workflows to port Bun from Zig to Rust: roughly 750,000 lines of Rust code, 99.8% of the existing test suite passing, and eleven days from first commit to merge. One workflow mapped the correct Rust lifetime to every struct field; the next wrote every `.rs` file as a behaviour-identical port of its `.zig` counterpart, with hundreds of agents working in parallel and two reviewers per file; a fix loop then drove the build and tests until both ran clean. An overnight workflow even cleaned up unnecessary data copies and opened a PR for each.

  What fascinates me, and where I'll add a small dose of caution, is the bit Anthropic flags almost in passing: dynamic workflows consume *meaningfully* more usage than a normal session. That lands right on top of the "tokens are getting less cheap" thread that Ted Neward and Lars Faye were pulling on in last week's roundup. The capability is extraordinary, but "an engineering team in a box" comes with an engineering-team-sized bill. This hinges on judgment: pointing a hundred agents at a genuine large-scale migration is transformative, while pointing them at a task a single agent could handle is just an expensive way to feel busy. I fully intend to test the boundary on the event-management series with a suitably scoped task and report back on whether the cost maps to the value.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to
[sd]: https://streamingdata.io
[jovpop]: https://www.youtube.com/channel/UCbR1-Tp8DKJKULzAy0DOCVw


[1]: https://natural20.beehiiv.com/p/the-real-reason-andrej-karpathy-joined-anthropic
[2]: https://www.microsoft.com/en-us/research/blog/data-formulator-0-7-ai-powered-data-analytics-for-enterprise-data/
[3]: https://natural20.beehiiv.com/p/claude-opus-4-8-is-here-and-anthropic-is-turning-claude-code-into-an-ai-engineering-team
[4]: https://claude.com/blog/introducing-dynamic-workflows-in-claude-code
