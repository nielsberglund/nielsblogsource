---
type: post
layout: "post"
title: Interesting Stuff - Week 42, 2026
author: nielsb
date: 2026-10-18T07:15:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-42-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-42-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - Anthropic
  - Claude Code
  - Claude Managed Agents
  - Agent Observability
  - Recursive Self-Improvement
  - Multi-Agent Systems
description: "Week 42 roundup: Anthropic's dynamic workflows, Scion replacing git, OpenTelemetry for agents, multi-agent self-improvement and how Claude Code reviews its own code."
---

**This week the theme is scale: what breaks when agents write, merge and review code faster than any human can keep up.** Five posts cover Anthropic's new dynamic workflows for Claude Managed Agents, the in-house version control system built to replace git, OpenTelemetry traces for agents, a paper on recursive self-improvement through multi-agent self-supervision, and how the Claude Code team reviews code at agent volume.

If last week was about letting go of the steering wheel safely, this week is about the road, the bridges and the traffic cameras that need rebuilding once everyone is driving at 30,000 merges a day. Grab a coffee, and let's dive in.

<!--more-->

---

## Generative AI

* [**How Anthropic’s Dynamic Workflows Coordinate Claude Agents**][1]. In this post, Richard MacManus reports from AI Engineer New York, where Anthropic's CJ Avilla and Harrison Stall introduced **dynamic workflows**, or "flows", for **Claude Managed Agents**. Instead of configuring a coordinator and a roster of subagents, the lead agent plans, writes an orchestration program, launches the agents, collects the results, and manages the information flow, all on its own. Think of it as Claude choosing its own multi-agent topology, with the option of passing in pre-configured specialist subagents if you want to keep a hand on the wheel. It all lives in Claude Console, including a graph view where you can inspect exactly what the lead agent passed to each subagent.

  The Q&A is where it gets fun. How many agents will Claude spin up for a simple ticker scan? "Evals and lower defaults", apparently. Does the lead agent know its budget? No, you set a session budget, and telling the model might make the agents "a little bit anxious". Subagents share a filesystem but cannot be told to message each other directly, and flows cost "much more" than a single agent in the stock-watchlist demo, while being "much more effective at finding all of the details". To make repeated flows cheaper over time, the presenters pointed to **dreaming**, a research preview feature that reads a memory store alongside past session transcripts and produces a tidier, reorganised one.

  The framing is the interesting bit: the presenters opened with Unix and Linux, and the lesson that big projects need organisation, from one hacker to layers of trusted maintainers. Flows are pitched as a way to throw test-time compute at hard problems, which is a polite way of saying "bring a budget". If you are building anything agentic on Claude, this is the post to read before your next invoice arrives.

---

* [**Redesigning source control at Anthropic**][2]. This post by Nick G. and the source control team explains why Anthropic outgrew git. Merges to the monorepo went from roughly 2,500 a day in May to over 30,000 a day in September, and the main branch history alone is almost 100 GB. With around 25 million checkouts a day for CI, naive git traffic would be over 600 PB daily, and at peak they ran several hundred internal git mirrors to cope. So a team of seven built **Scion**, an in-house version control system, plus a code review surface called **Antique**, and migrated the whole monorepo in five months.

  The design principles are a neat inversion of git's assumptions. Clients are always online (they are agents and jobs, after all); the server does the heavy lifting for commits, merges, blame, and history; and every source-control query is available through an API, so a CI job often needs no local repository at all. The unit of work is a "changeset" in a write-ahead log, with content-addressed blobs, derived data such as blame and path history computed recursively on demand, and tiered cache servers streaming objects straight from memory. The results: an infrastructure footprint 200x smaller than the git mirrors, checkouts two orders of magnitude faster, and a 25% CPU capacity win for CI. Even the ingestion pipeline was rewritten by an early Claude Mythos Preview snapshot to use 20x less memory and run 4x faster.

  What I find most revealing isn't the architecture; it's the list of lessons. The engineers all rate Claude as a better coder than themselves, yet "very often" their job was to tell Claude "no", whether that was agents brute-forcing the commit log or adversarial reviews that led to gold-plated validation. Their review habits shifted from reading every line to examining intent, and they even doubt that a classic merge queue makes sense at agent scale, preferring post-merge testing and letting Claude fix the conflicts. I keep asking myself what the equivalent bottleneck is in my world: for data folks it is probably CI against shared databases and migration pipelines, which were also built for human pace. The Anthropic team is careful to say Scion is no git replacement, but the ideas about server-side RPCs and smarter negotiation are aimed squarely at the git ecosystem.

  Here's the part that nags me: if a handful of engineers can swap out a core piece of infrastructure in five months while merge volume grows tenfold, what else in your stack is "too hard to replace" only because it used to cost years of human effort?

---

* [**Agent observability on the Claude Platform**][3]. In this post by the Claude team, Anthropic announces **OpenTelemetry (OTel) traces** from Claude Managed Agents, the Messages API and the Claude SDKs, now in public beta. Add a destination in the Claude Console, and every agent turn, model call and tool use shows up in your observability tool as a standard trace, with latency, tokens and IDs. The traces follow the OpenTelemetry GenAI semantic conventions, so Claude and other providers can share the same dashboards, and if you already send Claude Code or Cowork traces somewhere, your own agents can now land in the same place.

  The list of supported destinations reads like an observability who's who: Grafana Cloud, Honeycomb, Sentry and Splunk for debugging alongside your logs and metrics, Arize AI, Braintrust, Datadog, Langfuse, LangSmith, New Relic and PostHog for turning real traces into evals, and Databricks Unity Gateway for tracking token usage by team. Any OTLP endpoint works too. Customer quotes from Ramp, Foxglove and others make the case that agents touching real money have to "show their work", and Ramp reports cutting token usage by 10 to 20 percent on some agents by feeding traces into its own improvement loop.

  The post puts it nicely: trust an agent with more access by first tracing its model calls, tool use and MCP server calls, then widen its access as it proves reliable. It pairs very well with the dynamic workflows above, because a self-orchestrating swarm you cannot see into is just an expensive rumour.

---

* [**Recursive Self-Improvement through Multi-Agent Self-Supervision**][4]. Hyunin Lee and colleagues from Sakana AI, UC Berkeley and beyond in this post look at how a model can improve itself on open-ended research tasks where no human can reliably judge the output. Their method, **Multi-Agent Self-Supervision (MASS)**, alternates between two loops. In the inner loop, one base model proposes, runs and self-evaluates multi-agent workflows, using an evolutionary search with structural guardrails to discover which roles and information routing work best. In the outer loop, the model is fine-tuned on the resulting trajectories, then the whole thing starts again with a slightly smarter model playing agent, evaluator and optimiser.

  The numbers are promising. Using Qwen3.6-27B, two MASS cycles gave 1.2 to 1.6 times higher score per output token on four open-ended benchmarks, the win rate against the base model rose from 53.9% to 69.9%, and the evaluator's accuracy climbed from 73% to 93%. A student trained on multi-agent traces even beat a single-agent student trained on about 1.4x more tokens. The authors' ablations suggest the real bottleneck in a homogeneous loop is workflow optimisation, not evaluation.

  What fascinates me is how directly this connects to this week's other posts. Dynamic workflows hand Claude the job of designing its own agent topology, and MASS shows a way to *learn* better topologies and bake them into the weights. I'd read the "self-evaluator" with a healthy dose of scepticism, though: external judges assign the final scores, and a model grading its own homework has a long and distinguished history of giving itself an A. Still, orchestration as something you train rather than something you hand-wire is an idea worth watching.

---

* [**How the Claude Code team does code review**][5]. This post by Addy Osmani, Morgan Westlee Lunt and Qing Wang answers the question every team with coding agents is now asking: if Claude writes about 90 percent of Claude Code's own code, how do you review it? From June to September, merged pull requests more than doubled, while the share that had to be reverted fell by more than 40 percent. The goal is "at most one human in the loop" for most PRs, with revert and incident rates as the guardrail, so human time is saved rather than just moved around.

  The flow has layers. Work is verified before a PR exists (tests, builds, a fresh-context subagent review); every PR gets an AI review where several agents hunt for bugs, and others vote on each finding; a separate security review can block the merge, required CI runs, and human approval is scaled by risk, with a classifier setting the tier from the change and not the author. A merge queue, feature flags, gradual release and fast rollback sit underneath. Two details stood out: an agent's approval never fills a slot that requires a human, and the person who prompted the change is on the hook as one of the required reviewers. The `CLAUDE.md` and `REVIEW.md` files act as the reviewer's memory, and past incidents are turned into a daily eval for the reviewer.

  The most useful part is the honesty about failure. The agent author and agent reviewer can keep each other busy forever, and one CLI PR went through more than fifty rounds overnight. About 59 percent of what the reviewer kept flagging was code that had been there since its first pass. The fixes were a three-round cap, diff-only re-review and flagging the class of bug, which cut mean reviews to pass from 2.08 to 1.32 and five-plus-round PRs from 8.9% to 1.5%. And for the knowledge-sharing side of review, the answer is to ask Claude for an explainer of exactly the slice you are about to change.

  Here's what strikes me: this is the "bottleneck" story from the Scion post seen from the developer's chair. Reading every diff was never the point; understanding risk was, and I suspect many teams have used "a human read it" as a comfort blanket. The authors' honest caveat, that they still lack circuit breakers that tighten approval when revert rates rise, is exactly where I'd start. How is your team reviewing agent-written code today? I'd love to hear in the comments.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[ems]: https://nielsberglund.com/contact-event-claude-code/

[1]: https://www.latent.space/p/claude-dynamic-workflows
[2]: https://www.anthropic.com/engineering/redesigning-source-control
[3]: https://claude.com/resources/articles/agent-observability-on-the-claude-platform
[4]: https://arxiv.org/html/2610.12176v1
[5]: https://claude.dev/blog/solving-code-review-at-anthropic/
