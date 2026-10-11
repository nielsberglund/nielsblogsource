---
type: post
layout: "post"
title: Interesting Stuff - Week 41, 2026
author: nielsb
date: 2026-10-11T08:10:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-41-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-41-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - Claude Code
  - Claude Code Mods
  - Claude Managed Agents
  - Agent Automation
  - Agent Lightning
  - Reinforcement Learning
  - System 1 Models
  - Jev
description: "Week 41 roundup: System 1 model routers, Agent Lightning's harnessed agentic RL, Claude Code mods, Pinterest's LLM user journeys and Anthropic's agent automations."
---

**This week the theme is small, sharp and scheduled: tiny models that decide, harnesses that learn, and agents that quietly do their job while you sleep.** Six posts cover System 1 "decider" models with a working router, Microsoft's lightweight agentic RL framework, Claude Code mods, Pinterest's LLM-powered user journeys, an AI-assisted learning framework, and Anthropic's recipe for agent automations that don't fail silently.

If last week was about who holds the steering wheel, this week is about what happens when you let go of it, safely. Grab a coffee, and let's dive in.

<!--more-->

---

## Generative AI

* [**System 1 (Jev) Models: Faster and Cheaper Proxy to Frontier Models — With a Working Router**][1]. In this post, Muhammad Soliman follows up on the System 1 models that have been popping up, and gives us the map of the territory. In eight days in September, the field went from one closed model (TypeSafe's **Jev**) to four credible options: Jev, Convai's **Laya** (421M parameters, Apache-2.0), Jared Palmer's **Kev** (0.8B to 9B, trainable on one GPU in about an hour) and Bespoke Labs' **Nimble**. You hand them state plus typed questions (`choice`, `noul`, `score`); they run one forward pass, generate zero tokens, and return typed answers with probabilities. All four speak the same `POST /v1/systemone` wire format, so swapping backends is an environment variable.

  The fun part is the proof of concept: a short Python callback for a **LiteLLM** proxy that classifies every request as easy, medium or hard and routes it to Haiku, Sonnet or Opus before it leaves your machine. Claude Code points at the proxy and never knows. The labels live in your code, not the model, so tuning the router means rewriting three descriptions. Soliman is refreshingly honest about the benchmarks too: they are all self-reported, Laya's headline 0.766 comes from a fine-tuned checkpoint (zero-shot is 0.362), quality drops past roughly 20 options, and "runs on a laptop" is not the same as "runs fast on a laptop". Also watch out for the client boilerplate: Claude Code wraps a six-character task in thousands of characters of `<system-reminder>` context, which you must strip before classifying.

---

* [**How I Use AI to Learn New Topics Faster: An AI-Assisted Learning Framework**][2]. This post by Destin Gong shares a three-step framework for using AI as a thinking partner, not a replacement for thinking. Step one is voice mode for the "unknown unknowns" phase, where you ramble out loud and let the assistant turn half-formed questions into a learning roadmap. Step two is reusable AI skills with five parts (purpose, inputs, process, output format, quality checks), for collecting resources, scheduling a study plan against your calendar, and comparing similar concepts in a side-by-side table. Step three is scheduled automations for spaced repetition and active recall, such as a daily Readwise highlight delivered at 7:40 am.

  What I find interesting is that the "skills plus scheduled tasks" recipe isn't really about learning. It's a general pattern for any recurring knowledge-work chore, and Gong has quietly written a tutorial for Claude skills and Cowork-style scheduled tasks without needing either name. The caution I'd add is the one Gong hints at: the goal is to make learning easier to start, not to outsource the struggle. If the AI builds the study plan, summarises the material and quizzes you, make sure *you* are still the one doing the remembering. Otherwise, you have just built a very elaborate way of feeling productive.

---

* [**Agent Lightning v1.0: A 3,500-Line Lightweight Agentic RL Framework for Training Agents with Real Harnesses**][3]. Zhiyuan He and Yuqing Yang look at how Microsoft Research Asia rebuilt Agent Lightning around a paradigm they call **Harnessed Agentic RL**. Traditional agentic reinforcement learning forces you to reimplement your agent inside the training framework, so the agent you train isn't quite the one you deploy. Agent Lightning instead puts an OpenAI-compatible LLM proxy between the harness (mini-SWE-agent, OpenHands, OpenCode, Claude Code, Codex and friends) and the model, records every call with its log probabilities, and trains on that. Point your endpoint at the proxy, and you are, in principle, done.

  The post is candid about why this is hard: retokenisation shifts token boundaries, subagents and context summarisation split one rollout into many samples, loss normalisation can reward whichever harness is chattiest, and GPU layouts are fixed while workloads are not. The answers are rollout-level advantages, rollout-level normalisation and "Collocated Async RL", which shares GPUs between rollout and training for about a 2x speedup over synchronous RL. Agents run as plain Kubernetes jobs rather than paid sandbox services, and a pipeline on only about 6,000 samples lifted Qwen3.5-9B from 41.8% to 56.4% Pass@1 on SWE-bench Verified. The whole framework weighs in at roughly 3,500 lines, small enough to read, which is rare and wonderful in this space.

---

* [**Getting started with Claude Code mods**][4]. In this post by Addy Osmani, the Claude team walks you through building your first **Claude Code mod** from an empty folder. A mod is a small JavaScript or TypeScript module, shipped inside a plugin, that sees every event in your Claude Code session (tool calls, prompts, turns, slash commands and even `ui.render`) and can observe, rewrite or answer them, much like middleware. The tutorial builds **Token Weather**, a roughly 80-line live forecast of your context window drawn above the prompt (Clear, Cloudy, Showers, Storm, Compact soon), then tours **Blast Radius**, which holds a risky command and lists exactly what it would delete or reset, and **Replay Theatre**, which steps through the last turn's edits one diff at a time. You need Claude Code 2.1.287 or later, and the finished code lives in the `claude-code-playground` repo.

  The best part is the shortcut: you don't have to learn the API. Describe the mod you want in a Claude Code session, allow hot reload, and Claude writes it, installs it and reloads it when the turn ends. Every save reloads in place, so "make Storm start at 70%" becomes a thirty-second experiment. The post also gives sensible advice on keeping state in `$.state`, so it survives reloads, reading props from `e.props`, and treating Blast Radius as a safety net rather than a permission system, since it reads command text and `$(...)` or a script that calls `rm` will sneak past it.

  What fascinates me here is that mods turn Claude Code from a product you configure into a platform you program. A context-window forecast is cute, but a mod that stops me from running a migration against production without a dry-run report is something I would actually use on my own projects, including the Event Management System I keep building with Claude Code. The flip side, as the post notes, is that mods aren't sandboxed, so I want a solid vetting habit before I install anyone else's.

  Here's my challenge: the first mod I will build is a per-session cost and token readout, and the second is a guard around anything that touches the database. What would *you* mod first? Drop a comment; I would love to hear it.

---

* [**From Activity to Intent: Generating User Journeys with LLMs**][5]. In this post, the Pinterest Engineering team explains how they moved from a multi-stage keyword-clustering pipeline to a single fine-tuned **4B-parameter LLM** that reads a chronological activity log and emits a ranked list of "journeys" (not "Summer dresses", but "a summer wedding in August"). The old pipeline already lifted email click rate by 88%, but it fragmented one kitchen remodel into cabinets, countertops and backsplash, and fell back to useless buckets like "Art". The new approach uses the prompt for both ranking and safety, runs at temperature 0, uses a 360-day lookback, and enforces strict JSON output.

  The engineering is the interesting part. Frontier models act as teachers generating synthetic training data, and Qwen3 students from 0.6B to 8B are tuned with SFT and LoRA, with 4B being the sweet spot. Quality plateaued after a few thousand examples, so diverse and difficult cases mattered more than volume. Serving uses NVIDIA Dynamo in front of vLLM on L40S GPUs (around 775 requests per second on roughly 100 GPUs), and the cheapest throughput win was skipping anyone inferred within the last couple of days. Early online results show 1.1% lifts in email click-through and 1.3% in push opens, and the team is now experimenting with semantic IDs, offsite signals, and preference optimisation on real Yes/No feedback. A great real-world case study in distilling a big model into a small one you can afford to run.

---

* [**Building effective agent automations**][6]. This post by Lance Martin and CJ Avilla shows how Anthropic builds simple, scheduled agent automations, and it is a goldmine for anyone running agents unattended. Using **Claude Managed Agents** (beta), they built a reference "daily brief" agent that reads Slack channels and GitHub pull requests on a schedule, tracks what changed since the last run, and posts what you need to know back to Slack. The whole thing is a handful of config files (`agent.md`, `deployment.md`, `environment.yaml`, two memory stores and a vault) applied with the `ant apply` command, and it runs on Anthropic's infrastructure so nothing has to stay on your machine. There is even a `/claude-api managed-agents-onboard` command in Claude Code that walks you through setting it up.

  The real value is the list of failure modes and their fixes. Read from a **bookmark** per source rather than a fixed 24-hour window. Treat a failed read as "unreadable", never as a quiet day. Re-check each item's live status right before posting. Count a post as sent only when Slack returns `ok: true` and a message timestamp, and only then update the ledger and bookmarks. Re-read preferences every run from a store the agent cannot edit, compute dates in the reader's time zone, and keep credentials in a vault so the sandbox only ever holds a placeholder. Guardrails include read-only tokens, an allow-listed environment, and a spending cap set at three to five times a normal run.

  What I find most telling is how unglamorous all of this is, and I mean that as the highest praise. None of these rules are about prompt cleverness; they are the same idempotency, auditing and least-privilege disciplines we have applied to data pipelines for decades, now applied to agents. A ledger of what has been reported, a bookmark per source and a "maybe posted" state are basically a change-tracking table with a watermark, which any SQL person will recognise instantly.

  I keep wrestling with how many of us are about to run agents on a schedule with none of this. The scheduled-agent demo is easy; the hard part is the one that stays correct on day 90, after a token expires and a source returns nothing. This post is the best checklist I have seen for the second kind, and it is worth reading even if you never touch Managed Agents.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[ems]: https://nielsberglund.com/contact-event-claude-code/

[1]: https://pub.towardsai.net/system-1-models-faster-and-cheaper-proxy-to-frontier-models-with-a-working-router-2b9c65a07d0f?sk=v2%2F5029c166-a69c-4f6a-99d8-4515ca6892f0
[2]: https://towardsdatascience.com/how-i-use-ai-to-learn-new-topics-faster-an-ai-assisted-learning-framework/
[3]: https://www.microsoft.com/en-us/research/blog/agent-lightning-v1-0-a-3500-line-lightweight-agentic-rl-framework-for-training-agents-with-real-harnesses/
[4]: https://claude.dev/blog/getting-started-with-claude-code-mods/
[5]: https://medium.com/pinterest-engineering/from-activity-to-intent-generating-user-journeys-with-llms-9652b9417626
[6]: https://claude.dev/blog/building-effective-agent-automations/
