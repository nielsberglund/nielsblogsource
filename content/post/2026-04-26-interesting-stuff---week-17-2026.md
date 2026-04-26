---
type: post
layout: "post"
title: Interesting Stuff - Week 17, 2026
author: nielsb
date: 2026-04-26T06:43:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-17-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-17-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - Apache Kafka
  - Distributed Systems
  - Microsoft Research
  - LLM
  - AI Agents
  - Gas City
  - Steve Yegge
description: "Week 17 tech roundup: one-shotting a diskless Kafka in Python, Claude Code's architecture dissected, Gas City v1.0 launches, and Microsoft's AutoAdapt framework."
---

This week's roundup spans the full spectrum: from the guts of distributed systems to the soul of AI agent architecture. A Kafka expert one-shots a diskless streaming engine using a formally verified protocol and an AI coding agent. At the same time, a deep source-level analysis reveals that only 1.6% of Claude Code is actual decision logic. Meanwhile, Steve Yegge declares the arrival of the "Light Factory" era with Gas City v1.0.

 On the research front, Microsoft tackles one of the hardest practical problems in LLM deployment: turning a general-purpose model into a domain specialist without weeks of manual iteration, and Simon Willison digs into the fascinating differences between the Claude Opus 4.6 and 4.7 system prompts.

<!--more-->

---

## Generative AI

* [**Changes in the system prompt between Claude Opus 4.6 and 4.7**][1]. In this post, Simon Willison diffs the system prompts between Claude Opus 4.6 and 4.7, surfacing a trove of interesting changes. Among the highlights: the "developer platform" has been renamed to "Claude Platform," Claude in PowerPoint is now mentioned alongside Claude in Chrome and Excel, and the child safety section has been significantly expanded with a new `<critical_child_safety_instructions>` tag. Anthropic is also actively trying to make Claude less pushy. The prompt now instructs Claude to respect a user's request to end a conversation rather than trying to elicit another turn. A new `<acting_vs_clarifying>` section tells Claude to make reasonable attempts before interviewing users, and to call tools to resolve ambiguity before asking the human to do the lookup.

  What fascinates me about this kind of analysis is that system prompts are arguably the most important piece of AI infrastructure that nobody reads. Willison used Claude Code to build a Git history of the prompt versions with fake commit dates so he could run a proper `git diff`; a beautifully meta use of the tool. The verbosity reduction instructions are telling: "Claude keeps its responses focused and concise to avoid potentially overwhelming the user." Also notable is what's been *removed*: the instruction to avoid saying "genuinely" and "honestly" is gone for Opus 4.7, presumably because the model no longer needs that guardrail. It's a rare window into how Anthropic steers behaviour through text rather than just training.

---

* [**One-shotting a Diskless Kafka in Python**][2]. This post by Stanislav Kozlovski documents an audacious experiment: implementing a working diskless Kafka system in Python using StreamNative's formally verified leaderless log protocol and an AI coding agent. The core architecture eliminates leaders entirely: every broker accepts writes for every partition, buffers data, and flushes mixed-partition segment files to S3. An Oxia metadata store (a distributed, strongly consistent key-value store) handles offset assignment via Compare-and-Swap operations, ensuring correctness without broker coordination. The write path, read path, and compaction system were all implemented in roughly one session with subsequent iterations.

  Here's what strikes me about this experiment: the core implementation was done in a single 5-hour Codex session, but the performance tuning that followed, parallelising serial Oxia requests, fixing lock contention, and adjusting client concurrency, took 2-3 additional days. That ratio feels deeply true about AI-assisted development: the happy path is fast, but the engineering judgment needed to diagnose why you're getting 2.6 MB/s instead of 32 MB/s is still fundamentally human. The results are impressive, though: 100 MB/s reads and writes on a single EC2 instance for less than $0.60/hour in S3 costs, versus $16.40/hour in cross-AZ network costs for equivalent traditional Kafka. The tradeoff is latency. This architecture inherently adds 20-30x the end-to-end latency of regular Kafka, making it unsuitable for low-latency use cases but a compelling option for high-throughput cost-sensitive workloads.

---

* [**AutoAdapt: Automated domain adaptation for large language models**][3]. In this post, Microsoft Research introduces AutoAdapt, a framework that treats LLM domain adaptation as a constrained planning problem rather than the usual trial-and-error approach. Given a task objective, available domain data, and practical constraints like accuracy, latency, hardware, and budget, AutoAdapt plans a valid adaptation pipeline, choosing among approaches like RAG, supervised fine-tuning, and parameter-efficient methods like LoRA, and tunes hyperparameters using a budget-aware refinement loop called AutoRefine. The key innovation is the Adaptation Configuration Graph (ACG), a structured representation of the configuration space that enables efficient search while guaranteeing valid pipelines.

  The practical results are compelling: AutoAdapt consistently identifies effective strategies across reasoning, question answering, coding, classification, and cloud-incident diagnosis tasks, with approximately 30 minutes of additional time and $4 in additional cost over baselines. I'm wrestling with how often teams spend weeks manually iterating on RAGs rather than fine-tuning decisions without a clear framework for the choice. AutoAdapt turns that ad hoc process into a disciplined, reproducible pipeline, which is especially important in high-stakes domains like healthcare documentation, legal workflows, or incident response, where you can't afford drift from domain requirements. The framework is open source, giving teams a concrete starting point.

---

* [**Welcome to Gas City**][4]. Steve Yegge, in this post, announces Gas City v1.0, a ground-up rewrite of Gas Town as a composable SDK for building and deploying autonomous agent teams, or as Yegge calls them, "dark factories" (though he prefers "Light Factory" since Gas City maximises observability). Gas City deconstructs the Gas Town stack into declarative building blocks called "packs" that define agent topologies, identities, prompts, sandboxes, and skills. Under the hood, everything runs on the MEOW stack (Molecular Expression of Work), a Beads-based framework backed by Dolt. This git-versioned database provides full audit trails and forensic capabilities. Gas City ships with a "Gas Town" pack as a drop-in replacement, so existing users can migrate seamlessly.

   What I find most provocative is Yegge's updated "Stages of AI Adoption" framework, now extended to 11 levels. At Level 9, you've deployed your first agent pack. At Level 10, you're managing multiple packs, but *you* are the bottleneck control plane. At Level 11, Factory Builder, you deploy agent teams to manage your other agent teams. The SaaS disruption angle is equally bold: Yegge describes visiting an enterprise where non-technical staff are rebuilding a $30k/year SaaS tool in-house, with their VP mapping out how to convert millions in annual SaaS spend into headcount. His argument that you only need to build the 20% of SaaS features you actually use, at a compliance level appropriate for your company rather than Fortune 100-grade, is the kind of thinking that keeps SaaS executives up at night.

---

* [**Inside Claude Code — Part 1**][5]. In this post by Enzo Lombardi, a VILA Lab paper is distilled that performed a source-level analysis of Claude Code's leaked TypeScript source, cross-referenced with Anthropic's own design writing. The headline finding: community analysis estimates that about 1.6% of Claude Code's codebase is decision logic, with the other 98.4% being the operational harness. The paper identifies five human values driving the architecture (Human Decision Authority, Safety/Security/Privacy, Reliable Execution, Capability Amplification, and Contextual Adaptability). It maps them to thirteen design principles that recur across every subsystem.

  The deep dive into `queryLoop()` is where the real gold lives. Every entry surface: interactive CLI, headless mode, Agent SDK, and IDE integrations converge on the same single loop function. Before every model call, five context-shaping functions run in sequence as a lazy degradation pipeline: budget reduction, snip, microcompact (which is cache-aware, unusual among agent systems), context collapse, and finally auto-compact as the expensive last resort. The loop implements concurrent-read serial-write dispatch for tools, whole-object state assignment at every continue site to avoid half-updates, and five distinct recovery mechanisms. What fascinates me is the design philosophy of "minimal scaffolding, maximal operational harness". The loop never reasons about what the model does; it just routes, compresses, and recovers. That 1.6% ratio isn't a weakness; it's the entire thesis.

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
[hierarchynotneeded]: https://www.hierarchynotneeded.com

[1]: https://simonwillison.net/2026/Apr/18/opus-system-prompt/
[2]: https://www.linkedin.com/pulse/one-shotting-diskless-kafka-python-stanislav-kozlovski-8qb2f/
[3]: https://www.microsoft.com/en-us/research/blog/autoadapt-automated-domain-adaptation-for-large-language-models/
[4]: https://steve-yegge.medium.com/welcome-to-gas-city-57f564bb3607
[5]: https://pub.towardsai.net/inside-claude-code-part-1-decef9b3737d?sk=v2%2Fca437561-9cb5-4a3d-9bc1-9ef10bcfca2e
