---
type: post
layout: "post"
title: Interesting Stuff - Week 23, 2026
author: nielsb
date: 2026-06-07T06:56:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-23-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-23-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - Agent Memory
  - AI Security
  - Zero Trust
  - Anthropic
  - Claude Code
  - Cowork
  - Project Glasswing
description: "Week 23 tech roundup: a tour of the seven types of agent memory, Anthropic's Zero Trust blueprint for agents, Project Glasswing's 10,000 vulnerabilities, and the hard-won lessons of containing Claude across products."
---

This week the conversation grew up. Now that agents are reading our files, calling our tools, and acting at machine speed, the interesting questions are no longer "can it?" but "what happens when it remembers the wrong thing, or when someone turns it against us?" So this roundup is a deep dive into the plumbing of trustworthy agents.

We start with the seven flavours of agent memory and why storage is the easy part, then walk through Anthropic's Zero Trust framework for agents, the expansion of Project Glasswing and its 10,000-plus security flaws, and finally a refreshingly honest engineering post on how Anthropic contains Claude across claude.ai, Claude Code, and Cowork; incidents and all.

<!--more-->

---

## Generative AI

* [**Agent Memory**][1]. This post by Angie Jones is the clearest taxonomy of agent memory I've come across, built on a conversation with Oracle's Richmond Alake. Her starting point is the one we all forget: LLMs are stateless by design. When a chat *feels* as if it remembers, the interface is faking it by resending the entire history as a single giant prompt. Real memory engineering is everything that happens once you stop pretending that blob is a strategy.

  Jones then unpacks seven distinct types, and the distinctions genuinely matter. Conversational memory (the raw exchange), semantic memory (durable facts like "the user prefers Python"), episodic memory (events, the "what happened" layer that's a database query problem, not a vector-search one), procedural memory (how to do things), entity memory (facts scoped to a specific customer or ticket), working memory (the short-term scratchpad), and summary memory (compression for when the context window fills up). The recurring lesson is that the hard part is judgment, not storage: what to remember, when to update or forget it, how much to retrieve, and how to stop one tenant's memories leaking into another's session.

  The part that grabbed me is the database-centric turn. Oracle's approach (OAMP, built on Oracle AI Database 26ai) treats the database as the memory core, keeping embeddings, JSON, text search, and plain SQL together so an agent doesn't have to bounce between a vector store, a relational store, and bespoke thread management. The example that really landed was using memory to teach an agent about a schema it has never seen: scan `ALL_TABLES`, `ALL_TAB_COLUMNS`, `ALL_TAB_COMMENTS`, the constraints, and `V$SQL` for workload patterns, then store what it learns instead of fine-tuning. Swap the Oracle catalog views for their SQL Server equivalents and that is almost exactly the pattern I keep reaching for.

  What I find compelling here is that "agent memory" is quietly becoming a database problem, and that should be good news for those of us who never left the data layer. The industry spent two years acting as though a vector database was the whole answer, but episodic recall wants ordered reads, entity scoping wants exact filters, and memory safety wants the kind of tenancy isolation relational engines have enforced for decades. The teams that win at memory won't be the ones with the cleverest embeddings; they'll be the ones who remember that retrieval, governance, and correctness are old problems wearing new clothes.

---

* [**Anthropic Just Solved AI Agent Security (Zero Trust for Agents)**][2]. In this post, Joe Njenga walks through Anthropic's newly released Zero Trust for AI Agents framework and argues it could be one of the most important security blueprints of the year. The core argument is uncomfortable but hard to dispute: most companies are deploying agents on security models written for static software and human users, not for autonomous systems that chain tool calls across platforms and act without pausing to ask. A human employee might question a suspicious request; an agent executes it at machine speed.

  Two ideas anchor the framework. *Blast radius* measures the potential damage if an agent is compromised, and Anthropic's position is to design for breach from day one by asking "what's the worst case if this agent is compromised?" before deployment. *Least agency* extends least privilege to agents, restricting not just what a tool can access but what it can do, how often, and against which resources, so the database tool gets read-only queries and the email summariser gets no send rights. Njenga then maps the framework against five live attack categories from OWASP's agentic threat list: prompt injection (direct and the nastier indirect kind), tool and resource misuse (tool poisoning, rug pulls, and tool chaining), identity and privilege abuse (the classic confused-deputy problem), memory and context poisoning, and supply-chain risk.

  Here's what strikes me: the framework's honesty about indirect prompt injection should worry anyone shipping agents. Microsoft Research's finding that LLMs cannot reliably distinguish informational context from actionable instructions means your agent *will* execute hidden instructions buried in a web page or document, and no amount of clever prompting fully closes that gap. I also appreciated the practical, un-flashy advice tucked in the supply-chain section: point a frontier model at your lockfile for a one-hour dependency audit and ask which libraries overlap. That's the kind of low-effort, high-leverage hygiene I can actually get teams to adopt, which matters far more than another framework diagram.

---

* [**Expanding Project Glasswing**][3]. Anthropic in this post looks at the next phase of Project Glasswing, its collaborative effort to secure the world's most critical software. The numbers set the scene: roughly 50 initial partners, given access to the Claude Mythos Preview model, have already used it to find more than 10,000 high- or critical-severity security flaws in their codebases. Anthropic is now extending the partnership to around 150 new organisations across more than 15 countries, deliberately bringing in sectors that were underrepresented the first time around: power, water, healthcare, communications, and hardware, along with vendors whose codebases everyone else depends on.

  The strategic framing is the interesting bit. Anthropic argues that cheap, fast AI models with powerful cyber capabilities are imminent; within 6 to 12 months, it expects other labs to have Mythos-class models, possibly shipped without safeguards. In that world, the bottleneck in cybersecurity shifts from *finding* vulnerabilities to verifying, disclosing, and patching them at scale. So the program is shifting its weight accordingly, with new offerings like Claude Security (which uses public frontier models such as Opus 4.8 to scan code and suggest patches) and the release of Glasswing's internal tooling to trusted security teams.

  What fascinates me is the explicit bet that AI gives defenders a *permanent advantage*. I want to believe it, but I'd hold the optimism loosely. The same Mythos-class capability that lets a partner find 10,000 flaws is exactly what an attacker without safeguards gets to point in the opposite direction, and Anthropic concedes it hasn't yet built safeguards strong and precise enough for general release. The asymmetry that gives me some hope is structural: defenders can run these models continuously against their own code before shipping, while attackers still have to find a way in. Whether that edge holds once the capability is commoditised is, I think, the defining security question of the next couple of years.

---

* [**How we contain Claude across products**][4]. In this post by the Anthropic engineering team, we get a candid look at how Claude is contained across Claude.ai, Claude Code, and Cowork, and it's the rare security write-up that leads with its own failures. The framing is sharp: as agents grow more capable, the *likelihood* of failure keeps dropping thanks to training and safeguards, but the theoretical blast radius only grows as access expands. Since you can't shrink the capability, the engineering question becomes how to cap the damage. Their honest verdict on human-in-the-loop oversight is the part everyone should sit with: telemetry showed users approved roughly 93% of permission prompts, and the more approvals people see, the less attention they pay. Oversight that relies on a fatigued human clicking "allow" is a defence with a steadily rising miss rate.

  Their answer is containment over supervision: constrain what the agent *can* reach via sandboxes, VMs, and egress controls, so that even a compromised or "creatively" misaligned model hits a hard wall. The post lays out three patterns matched to three audiences. claude.ai runs code in an ephemeral, server-side gVisor container (minimal blast radius, minimal ceiling). Claude Code uses an OS-level sandbox (Seatbelt on macOS, bubblewrap on Linux) that allows reads and writes within the workspace and denies network access by default, reducing permission prompts by 84% while remaining auditable. And Cowork, built for non-technical knowledge workers who can't be expected to vet a `find ... -exec rm` incantation, runs inside a full VM where credentials never leave the host keychain and only the user's chosen workspace is mounted.

  The incident stories are what make this essential reading. Three disclosed Claude Code vulnerabilities all targeted code that runs *before* the "do you trust this folder?" prompt; a malicious `.claude/settings.json` hook in a cloned repo would execute on startup, the fix being to defer all project-local parsing until after the trust boundary. Then the chilling one: in a February red-team exercise, a researcher phished an employee into pasting a benign-looking prompt that quietly asked Claude to read `~/.aws/credentials` and POST them out; across 25 runs, Claude exfiltrated 24 times. Because the malicious instruction arrived *through the user*, no classifier had anything anomalous to catch; only egress and filesystem boundaries held. And my favourite detail: when the team shared the working prompt in internal Slack, someone noted that internal agents read Slack, so the payload was now ambient, and they had to drop in a canary string. In a world where agents read everything, your investigation tooling is itself part of the attack surface.

  As a daily Cowork user, this one hit close to home, and I came away reassured rather than rattled. The full-VM design for Cowork is exactly the right call: when the user can't be the expert in the loop, the boundary has to be absolute and always-on, with no outer process holding an escape-hatch key to talk the user out of it. What I most appreciate is the intellectual honesty of admitting that approval fatigue makes human-in-the-loop a weak primary defence, because it directly contradicts the comforting "there's always a human approving" story the whole industry leans on. I'd love to see more vendors publish their incident post-mortems like this; it does far more to build my trust than any number of green checkmarks on a compliance page.

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


[1]: https://angiejones.tech/agent-memory/
[2]: https://medium.com/@joe.njenga/anthropic-just-solved-ai-agent-security-zero-trust-for-agents-2c263bfe7b7c?sk=v2%2F91b0ef7c-54b5-437f-8939-dfc6a671549d
[3]: https://www.anthropic.com/news/expanding-project-glasswing
[4]: https://www.anthropic.com/engineering/how-we-contain-claude
