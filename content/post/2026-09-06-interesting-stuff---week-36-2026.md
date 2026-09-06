---
type: post
layout: "post"
title: Interesting Stuff - Week 36, 2026
author: nielsb
date: 2026-09-06T06:15:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-36-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-36-26.jpg"
categories:
  - roundup
tags:
  - Anthropic
  - Claude Fable 5.1
  - Claude Mythos 5.1
  - Claude Code
  - aimldatadurban
  - pluggedin
  - Dev Days 2026
description: "Week 36 roundup: Pinterest on what it really takes to become an AI team, plus Claude Fable 5.1 and Mythos 5.1 - cheaper cache reads, protein binders, and three breaking API changes."
---

**Three posts this week, and they split neatly into two halves of the same story: what the models can now do, and what that does to the humans standing next to them.** Anthropic shipped Claude Fable 5.1 and Mythos 5.1, and Pinterest published the most honest piece I've read on the messy middle of an AI transition.

There's a lot in here beyond the benchmark table: a 75% cut to cache reads, protein binders with a 50% hit rate, a new elevation map of Venus, three breaking API changes that will bite anyone running agent loops, and a Pinterest engineering manager quietly admitting that the hard part isn't the tools. Grab a coffee.

<!--more-->

---

## Generative AI

* [**Becoming an AI Team**][1]. In this post, John Grass, Sr. Manager of Engineering at Pinterest, makes an argument I've been waiting for someone with real production experience to make: an **AI team** is not a team that uses AI tools. It's a team that has restructured how it defines ownership, plans, and executes. The framing lands because Pinterest's infrastructure teams sit under a product serving billions of Pins, boards, and real-time signals, so "becoming an AI team" got treated as an operational necessity rather than an innovation-week side project. You cannot keep scaling reliability, cost efficiency and developer productivity on traditional playbooks alone.

  The concrete examples are the good bits, and they're squarely in database and data-engineering territory. Investigating distressed database clusters used to take several days of engineer time; it's now front-loaded by agents that sift through logs, generate candidate hypotheses, and draft remediation commands. AI-assisted tooling for **MySQL, TiDB, and cache infrastructure** has enabled the Storage Foundations team to clear entire classes of maintenance work that had been parked in the backlog indefinitely. Grass is careful with the claim, and I respect him for it: this doesn't mean they "saved X engineers"; it means the same engineers spend far more time on roadmap questions and far less on chronic firefighting and manual KTLO. The legacy-refactor example is the headline number, though: a "replace foo with bar across the codebase" project that would have taken several engineers a year can now be executed and verified in a week or less.

  The part of the post to be quoted next year is the **capacity model**. Teams used to assess capacity, commit to deliverables, and land at roughly 70% of them. Early, non-uniform AI adoption bumped capacity maybe 20%, so teams now hit 90% of commitments and are still, crucially, 100% busy. The tipping point that actually matters is the moment capacity *exceeds* commitments, because that surplus is the only place skill development can happen. Most teams are stuck in the transitional phase: learning the tools while still being measured on the old delivery expectations. Grass puts the fix on management: filter the noise, fund experimentation as work rather than as diversion, and build enough psychological safety that "I tried this, and it didn't work" is a shareable result.

  What I find useful here is that Pinterest has named the trap most organisations are currently sitting in without realising it. If you hand your team AI tools and then immediately absorb the productivity gain into a bigger backlog, you have permanently locked them out of ever getting good at this. The 20% never compounds, because compounding requires slack. That's an uncomfortable read for every engineering leader who has quietly celebrated hitting 90% instead of 70% and moved the target up. The maxim buried in the middle of the post is the one to print out: *just because something is feasible does not mean it is strategic.* Agents have exploded the set of possible projects, which makes prioritisation harder, not easier, and prioritisation was already the thing most teams were worst at.

---

* [**Claude: Fable 5.1 and Mythos 5.1**][2]. This post by Anthropic announces **Claude Fable 5.1** and **Claude Mythos 5.1**, three months after the Fable 5 launch we [covered back in week 24][f5]. Same underlying model, two different safeguard layers: Fable 5.1 is generally available as `claude-fable-5-1` on the Claude API, Amazon Bedrock, Claude Platform on AWS, Google Cloud, and Microsoft Foundry, while Mythos 5.1 remains within trusted-access programmes for vetted cyberdefenders and life scientists. The headline capability number is **52.6% on Terminal-Bench-Science 0.1**, compared with 29.0% for Opus 5, 24.7% for Fable 5, and 22.4% for GPT-5.6 Sol. Elsewhere: 55.8% on Terminal-Bench 4.0 (60.9% for Mythos 5.1), 73.4% on CursorBench 3.2.0, and 1853 on GDPval-AA v2.

  Commercial news is arguably bigger than benchmark news. Base pricing remains unchanged at **$10 per million input and $50 per million output**, but **cache reads drop by 75%, from $1.00 to $0.25 per million tokens**. Anthropic measures that as roughly **25% lower cost on typical workloads and up to about 45% on highly agentic ones**, because on context-heavy, tool-heavy work, cache reads are most of your bill. There's also a genuine answer to data retention: **Enterprise Frontier Safeguards** stores data in cloud infrastructure that the customer controls, with any human review performed by the customer, providing zero-data-retention privacy without abandoning misuse detection. It rolls out in phases from this fall, and eligible customers get ZDR on Fable 5.1 in the meantime.

  The science section is where the post stops being a product launch and starts being something else. Mythos 5.1, given open-source protein design and folding tools, produced binders with **roughly a 50% hit rate across 12 targets**, against a 10-15% norm, and affinities 10x better than the best entries in Adaptyv Bio's competitions on three targets, all lab-validated. Fable 5.1 trained a neural network on 30-year-old NASA Magellan radar data and built a new **elevation map of a third of Venus** at 2-3 km resolution instead of 10-20 km, released under Creative Commons ahead of the VERITAS and EnVision missions. And Mythos 5.1 wrote custom GPU kernels that sped up seven open-source genomics and protein models by up to **2.5x with identical outputs**, cutting estimated GPU costs on genome-wide analyses by 30-60%. That last one is the sleeper: weeks of specialist performance engineering, unaffordable for most academic labs, done in days from public source code.

  Here's what strikes me: the safeguards story is finally moving in the direction developers have been begging for. Cyber safeguards now permit **vulnerability discovery but not exploit development**, cutting interventions in Claude Code by around 60% per session, and biology safeguards fire **85% less often** on benign requests. Anyone who has had a perfectly innocent security-hardening session redirected mid-flow knows exactly how much friction that removes. But note what Anthropic did *not* do: penetration testing, exploit generation and binary-based vulnerability scanning still route to Opus. The precision improved; the policy didn't loosen. I'd also flag the anti-distillation change, because it's a rare case of a safety mechanism landing directly on your integration code: new API accounts can no longer edit prior context while preserving Claude's thinking transcripts, which closes a documented distillation technique and breaks a certain style of agent harness at the same time. Safety with a migration cost attached, disclosed up front. I'll take that trade.

---

* [**Anthropic Releases Claude Fable 5.1 and Claude Mythos 5.1: 52.6% on Terminal-Bench-Science and 75% Cheaper Cache Reads**][3]. Asif Razzaq in this post looks at the same launch from the only angle that matters if you actually ship agents for a living: **what breaks on Monday**. Three breaking changes, and every one of them will find somebody. First, **forced tool use is gone**: `tool_choice` set to `any` or `tool` now returns a 400, and you're expected to use `auto` with strict tool use or structured outputs instead. Second, **thinking blocks are model-bound**: Fable 5.1 can read earlier models' thinking, but no earlier model can read Fable 5.1's, so router and fallback setups silently lose reasoning the moment they downshift. Third, **editing earlier turns invalidates thinking blocks**: injecting and deleting per-turn reminders, or rebuilding the `system` or `tools` array mid-conversation, now errors, enforced for accounts created on or after 31 August 2026.

  The post is also refreshingly clear about the **regressions**, which the launch announcement understandably doesn't dwell on. Parallel tool calling is more variable, so agent loops that used to batch several calls may now issue one per turn. The model narrates less, answers from memory more often at low effort, and prefers **whole-file rewrites over targeted edits**: which, if you're diffing agent output into a review pipeline, is a meaningful change in blast radius. Razzaq also does the statistical housekeeping Anthropic buried in a footnote: the standard error on Terminal-Bench-Science is ±3.5-4.5 points per model, so treat the margin with more care than the ranking. And on the fixes: turn-scoped system messages and server-side context editing are the sanctioned replacements for the context surgery that no longer works.

  I keep wrestling with what "same model, two safeguard layers" really tells us, and this post surfaces the number that makes it concrete. Fable 5.1 scores 55.8% on Terminal-Bench 4.0; Mythos 5.1 scores 60.9%. Same weights. The five-point gap **is** the cost of the safeguards, published rather than hidden, and I can't think of another lab that has put a price tag on its own guardrails in a benchmark table. That's an unusually honest disclosure, and I hope it becomes a norm, because "how much capability does your safety layer cost?" is a question every enterprise buyer should be asking and almost none currently can.

  The practical read for the rest of us: if you run anything agentic, budget an afternoon this week. The cache-read cut is free money on context-heavy workloads, but the three breaking changes land hardest on exactly the sophisticated multi-turn harnesses that would benefit most from the pricing. Check your `tool_choice` calls, check your fallback routing, and check anything that rewrites conversation history mid-flight. Also worth noting for the compliance-minded: content provenance is no longer optional, with a statistical text watermark on all output and C2PA credentials on files, courtesy of the EU AI Act Code of Practice.

---

## WIND (What Is Niels Doing)

The Call for Speakers for [**Data & AI Community Day Durban: Plugged In**][daid] and the co-located **GitHub Copilot Dev Days 2026** on **19 September** closed on Friday, and yesterday we spent the day going through every submission to work out what's in and what's out. I can't say the process was smooth. The quality of the submissions made it challenging: we had far more sessions we wanted than we have slots, which is a lovely problem to have and a horrible one to solve. We got there in the end, and we now have a preliminary list of speakers and topics.

Next up on the agenda is fitting the right talks into the right rooms at the right times, which is the community-event equivalent of a constraint solver with human feelings attached. **Registration opens in a couple of days**, so if you're anywhere near Durban on the 19th, watch this space; I'll post the moment the doors open.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[daid]: https://aimldatadurban.org/events/2026/pluggedin/
[f5]: https://nielsberglund.com/post/2026-06-14-interesting-stuff---week-24-2026/

[1]: https://medium.com/pinterest-engineering/becoming-an-ai-team-866d6b567803
[2]: https://www.anthropic.com/claude-fable-and-mythos-5-1
[3]: https://www.marktechpost.com/2026/09/01/anthropic-releases-claude-fable-5-1-and-claude-mythos-5-1-52-6-on-terminal-bench-science-and-75-cheaper-cache-reads/
