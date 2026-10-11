---
type: post
layout: "post"
title: Interesting Stuff - Week 40, 2026
author: nielsb
date: 2026-10-04T07:35:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-40-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-40-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - Claude Code
  - Claude Code Mods
  - Jev
  - TypeSafe AI
  - System One Models
  - Dev Days Cape Town
description: "Week 40 roundup: Jev, the AI model that decides instead of writes, Asana's coachable AI teammates built on Claude, and Claude Code mods for hacking your own CLI."
---

**Three posts this week, and the common thread is control: who gets to steer the model, the agent, and the tool.** One model refuses to write a single word and only hands you code-typed decisions, Asana shows what it takes to treat AI agents like coachable colleagues, and Anthropic hands you the keys to Claude Code itself.

Jev swaps chatty paragraphs for calibrated probabilities, Asana's Arnab Bose explains how agents get roles, memory and an audit trail, and Claude Code mods let you rewrite the product with a few lines of TypeScript. Grab a coffee, and let's dive in.

<!--more-->

---

## Generative AI

* [**Jev: The AI Model That Decides Instead of Writes: A Complete Guide From Concept to Production**][1]. In this post, Sai Bhargav Rallapalli takes a developer's deep dive into **Jev**, the first "System One" model from TypeSafe AI. Jev doesn't generate text. You hand it unstructured state plus typed questions, and it returns typed decisions with calibrated probabilities in a single parallel forward pass, in roughly 70-500ms, at about $0.042 per million input tokens with output tokens free. Every question is one of three primitives: **Choice** (pick from up to 255 options, with a full probability distribution), **Score** (place something on an ordered scale of 2-10 levels), or **Noul** (the probability that a yes/no proposition is true). If you've ever parsed a chat completion, validated it, and then written a fallback for when the LLM invented a fourth category, you already understand the pitch.

  The most useful part of the post is the architecture advice: don't replace your LLM with Jev; split the work. Jev judges (route, classify, score, gate), the LLM writes (plan, explain, generate), and your deterministic code owns policy, with thresholds such as auto-execute above 0.9 confidence, LLM review between 0.6 and 0.9, and a human below 0.6. The evidence comes from Harness, which tested Jev as an eval judge, model router, and risk scorer. It was 7-9x faster than Claude Sonnet 4.5 as a judge, beat it on department classification (88.9% vs 77.8%), but lost on severity scoring. As a router, it cost *more* than always-Sonnet, because one planning task burned 44 Opus turns. Not a silver bullet, then, but a very sharp tool.

  Rallapalli doesn't oversell it either. His caveats are a pleasant surprise in an AI-hype feed: calibration is statistical, not per-instance; small early errors can compound in agent loops; there's no reasoning trace; accuracy varies by dimension; and the model is only days old, so pin your version. For anyone building data pipelines, routing layers or guard checks around LLM output, this is a genuinely interesting new primitive, and a reminder that "which of these five buckets?" has never needed 200 words of eloquent prose.

---

* [**Agents you can coach: how Asana builds human-agent teams with Claude**][2]. This post by Arnab Bose, Asana's Chief Product Officer (as told to Anthropic), is the third in Anthropic's series on building human-agent teams, and it looks at what changes when agents work on the same platform as the people. Asana's answer is to put agents inside the existing Work Graph, with defined roles, assigned tasks, activity-feed presence and profile pages listing their purpose, admins, skills, integrations and permissions. One elegant safeguard: an agent's effective access is bounded by the permissions of the person who triggers it, so something learned in a private context can't leak to someone who shouldn't see it.

  The second big idea is separating *working with* an agent from *training* it. Anyone can give feedback on a task, but only admins and editors can commit it to the agent's permanent shared memory. The communications team owns the voice-and-tone agent, and the CPO can draft with it but not rewire it. Add the transparency rule (agents post their plan and steps on the shared task so reviewers can comment and steer), and you get a setup where a few experts configure the agent and everyone else benefits. Asana's three examples are an agent that turns Slack product questions into tasks and backlog items, an At-Risk Renewal agent that delivers a daily digest to executives, and Command, where agents fill the planning board. At the same time, humans decide what goes into the cycle.

  Here's what strikes me: this is the clearest articulation, yet the hard part of agents isn't the model; it's the org chart. Scoped roles, named owners, an audit trail and a memory that people can edit are boring governance ideas, and they're exactly what makes an agent trustworthy enough to leave alone. It echoes what I keep seeing building my own [Event Management System][ems] with Claude Code: the agent is only as good as the context, permissions and review loop wrapped around it.

  What I find most telling is Arnab's line that "code generation is no longer the bottleneck", and that planning, decision-making and refinement are. Every team racing to generate more code with agents will hit that wall. The ones who invest in structure, ownership and visible agent work will be the ones who turn speed into outcomes rather than into bloated cycles.

---

* [**Customize Claude Code with mods**][3]. In this post by Anthropic, the team introduces **mods**: small TypeScript functions that change how Claude Code works. Every time Claude Code does something (calls a tool, asks for permission, draws part of the screen), it emits an event, and a mod can hook in before, after, instead of, or around it. That means a mod can rewrite a prompt, block or retry a tool call, approve or deny permissions, redact secrets from tool output, or add whole new UI to the terminal and desktop app. They ship inside plugins, so you install and share them like any other plugin, and you can even ask Claude Code to write, install and hot-reload a mod in your own session.

  Hooks gave us some control, but they couldn't rewrite events, draw UI or replace features. Mods can, and Anthropic is already moving built-in features over: `/diff` is now a mod you can turn off or replace. For teams, there's a built-in `sec-default` mod that loads first and stops user-installed mods from doing risky things like overriding permission deny rules, plus ideas such as CI/CD status panes, production safeguards and audit logging. The caveat is stated plainly: mods are not sandboxed and run with the same access as Claude Code itself, so only install them from sources you trust.

  What fascinates me here is the direction of travel: Claude Code shrinking to a small core with everything else pluggable. That's powerful, and it makes the extension ecosystem a security story as much as a productivity one. A mod that redacts secrets is wonderful; a malicious mod is a nightmare, so treat these like any dependency. I'll try a few and write my own where it makes sense. What would *you* mod first?

---

## WIND (What Is Niels Doing)

Yesterday I spent the day in Cape Town at **Dev Days Cape Town 2026**, where I presented a session on analysing data with GitHub Copilot CLI. The talk went fairly well, and I got some great questions from the audience, always the best part of any session. It was a long day: an early-morning flight out, and a delayed return flight meant I didn't get home until midnight. Ouch!

Now I need to catch up on some rest before diving into the next set of events.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[ems]: https://nielsberglund.com/contact-event-claude-code/

[1]: https://pub.towardsai.net/jev-the-ai-model-that-decides-instead-of-writes-a-complete-guide-from-concept-to-production-5020603d02fd?sk=v2%2Fa5495f2c-4b32-43cc-a70f-262c159efb01
[2]: https://claude.com/blog/agents-you-can-coach-how-asana-builds-human-agent-teams-with-claude
[3]: https://claude.com/blog/claude-code-mods
