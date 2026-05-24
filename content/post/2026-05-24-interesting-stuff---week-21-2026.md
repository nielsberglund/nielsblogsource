---
type: post
layout: "post"
title: Interesting Stuff - Week 21, 2026
author: nielsb
date: 2026-05-24T08:14:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-21-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-21-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Andrej Karpathy
  - Anthropic
  - Claude Code
  - Claude Managed Agents
  - AI Agents
description: "Week 21 tech roundup: Andrej Karpathy joins Anthropic to work on recursive self-improvement, Claude Managed Agents eliminates the need to build your own agent loop, and Simon Willison recaps six wild months in LLMs."
---

This week's roundup is dominated by a single seismic event: Andrej Karpathy has joined Anthropic. The most beloved AI teacher in the world, a founding member of OpenAI, and former lead of Tesla Autopilot, is now working on using Claude to improve Claude. Meanwhile, Anthropic quietly shipped something that changes the economics of agent development entirely: Claude Managed Agents, a fully managed harness that makes building your own agent loop feel like unnecessary suffering.

Rounding things out, a developer builds Karpathy's LLM Wiki idea twice (once as Python, once as a single `.md` file) to explore where code ends and agent instructions begin. Simon Willison delivers his trademark lightning-speed recap of six months of LLM developments at PyCon US 2026.

<!--more-->

---

## Generative AI

* [**I Built Karpathy's LLM Wiki Twice — Once as Code, Once as a .md. Here's What Each One Gives Up.**][1]. In this post, Leandro Bernardo takes Karpathy's elegantly simple llm-wiki.md idea file and builds it two ways: first as a full Python package with Pydantic contracts, deterministic content-addressable IDs, and a LangGraph repair agent, then as a single `AGENTS.md` file that runs on any agent that reads project-root instructions. The original insight is Karpathy's: stop re-reading raw sources for every query; compile them once into a structured, interlinked wiki, then query the wiki. Treat knowledge the way compilers treat source code: pre-process once, run fast forever.

  The comparison between implementations is where the real value lies. The Python version gives you reproducibility, typed stage contracts, and a Markdown processing layer that refuses to produce structural garbage. The `.md` version gives you speed of iteration and zero deployment overhead, just point Claude Code at a folder and go. Bernardo's honest assessment: for large corpora and recurring pipelines, the code version pays for itself. For smaller bases where the wiki shape is still being discovered, the `.md` version wins. The underlying question, how much implementation should be frozen in code versus negotiated with the agent at runtime, is one every developer building with agents will face, and there's no universal answer.

---

* [**The last six months in LLMs in five minutes**][2]. This post by Simon Willison captures his PyCon US 2026 lightning talk, a whirlwind tour of six months of LLM developments illustrated (naturally) with his pelican-riding-a-bicycle benchmark. The narrative arc centres on the November 2025 inflexion point: the "best" model changed hands five times between three providers, but the real news was that coding agents crossed the quality barrier from "often-work" to "mostly-work." Willison traces the winter holiday experimentation period, his own bout of "LLM psychosis" that produced wildly ambitious projects (including a vibe-coded JavaScript-in-Python implementation nobody needed), and the meteoric rise of OpenClaw from an obscure November commit to a phenomenon that had Mac Minis selling out across Silicon Valley.

  What I find delightful about Willison's framing is the two-theme summary: coding agents got really good, and laptop-available models started wildly outperforming expectations. The Qwen3.6-35B model drawing a better pelican than Claude Opus 4.7 on a laptop is a vivid illustration of the second trend. His Doc Ock metaphor for personal AI assistants ("perfectly safe provided nothing damaged the inhibitor chip") is vintage Willison:  funny, memorable, and carrying just enough warning to stick with you.

---

* [**Andrej Karpathy Joins Anthropic: What Happens Next**][3]. Alberto Romero, in this post, unpacks the significance of the week's biggest AI news: Andrej Karpathy has joined Anthropic, working under Nick Joseph on pre-training, specifically focused on using Claude to accelerate pre-training research. In practical terms, Anthropic has hired the most prominent AI researcher-educator in the world to help Claude improve itself: the engineering precursor to recursive self-improvement. Romero traces Karpathy's remarkable 180-degree arc: in October 2025, he called AI coding tools "slop" and said autocomplete was his "sweet spot." Three days later, Anthropic launched Claude Code on the web. By December, Karpathy was calling Claude Code "a new, distinct paradigm of interaction with AI" and confessing he'd "never felt this much behind as a programmer."

  The timeline Romero constructs is extraordinary. By February, Karpathy was saying coding agents "basically didn't work before December and basically work since." By March, he was running autoresearch experiments in which an agent autonomously found ~20 improvements in validation loss over two days: "the bread and butter of what I do daily for 2 decades." His GitHub repo for this work opens with a fictional future where "research is now entirely the domain of autonomous swarms of AI agents." This directly connects to Jack Clark's May prediction of a 60% chance of fully autonomous AI R&D by the end of 2028. Karpathy saw the frontier narrowing between independence and relevance, and chose relevance: "If they can use the current generation of Claude to make the next training run even 5-10% more efficient, and they can do that repeatedly, they will get compound returns."

  Here's what fascinates me about this move: Karpathy explicitly valued being outside frontier labs because he could say whatever he wanted. He called closed-model safety arguments performative, called agent code "slop," and generally operated as the industry's most credible independent voice. He's trading all of that for a seat at the table during what he believes is the most consequential period in AI history. When someone who prizes independence that highly chooses to give it up, it tells you something about what they've seen. The recursive self-improvement angle is the headline, but the subtext is that Karpathy believes the compound returns from using Claude to train the next Claude are real and imminent, not theoretical. For those of us building with Claude daily, that's either deeply exciting or mildly terrifying: possibly both.

---

* [**Claude Managed Agents: Stop Building Your Own Agent Loop. Anthropic Already Built It.**][4]. In this post by Rick Hightower, a Claude Certified Architect, the case is laid out that building your own agent loop is no longer where your time should be spent. Claude Managed Agents is a fully managed, pre-built harness running on Anthropic's infrastructure that handles tool integration, state persistence, sandboxing, and the entire agent lifecycle. The restaurant analogy makes the architecture click immediately: Slack, GitHub, S3, or any event source is the customer placing an order. Your tiny web server is the waiter. Managed Agents is the kitchen where Claude cooks. Anthropic's webhook back to you is the bell that rings when the food is ready. You write to the waiter. Anthropic runs the kitchen.

  The practical examples are where this gets compelling. A complete Slack bot integration is about 40 lines of real code: one function receives the trigger and starts a session, and another receives the "done" notification and posts back. A GitHub PR reviewer follows the exact same two-function pattern but with vault-managed credentials. The architecture is async because the work is async. Claude might take seconds or minutes, so the trigger gets instant acknowledgement, and Anthropic separately tells you when it's done. The article also covers subagent orchestration with coordinator patterns, full skill support (the same SKILL.md format from Claude Code and Cowork carries directly in), MCP server integration with credential vaults, and a clear decision matrix: use the Agent SDK when you need to run on your own machine, use Managed Agents when you want to fire long-running async tasks without operating infrastructure.

  What strikes me as the most important insight is the billing model and what it signals. At $0.08 per session-hour (billed to the millisecond, only while running), plus standard token costs, Anthropic has priced this to make the "build versus buy" calculation obvious for most teams. The comparison to the managed database revolution is apt: there was a time when running a database meant operating servers and writing connection pools. Then managed databases arrived, and within a few years, the default answer changed. Agents are heading the same way. The harness is becoming a commodity; the differentiator is the system prompt, the tools, the skills, and the workflows you wire them into. For anyone building production agent systems on Claude, this changes the calculus entirely.

---

## WIND (What Is Niels Doing)

I'm still juggling a few too many things at the moment, which means **Part 12** of the [**Building an Event Management System with Claude Code**](/contact-event-claude-code) blog post series continues to sit on the back burner. It hasn't been forgotten, far from it, but other priorities keep muscling their way to the front of the queue. The series is very much alive, just waiting for a window to open up. When it does, Part 12 will be the first thing through it.

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


[1]: https://pub.towardsai.net/i-built-karpathys-llm-wiki-twice-once-as-code-once-as-a-md-heres-what-each-one-gives-up-08b31170999a
[2]: https://simonwillison.net/2026/May/19/5-minute-llms/
[3]: https://www.thealgorithmicbridge.com/p/andrej-karpathy-joins-anthropic-what
[4]: https://pub.towardsai.net/claude-managed-agents-stop-building-your-own-agent-loop-anthropic-already-built-it-06525f23c04c?sk=v2%2F8d6d66f9-2b61-4987-9b1c-dcf0352f3474
