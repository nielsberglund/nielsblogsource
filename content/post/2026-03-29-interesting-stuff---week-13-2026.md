---
type: post
layout: "post"
title: Interesting Stuff - Week 13, 2026
author: nielsb
date: 2026-03-29T06:45:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-13-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-13-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - Harness Engineering
  - AI Agents
  - Kafka Connect
  - Robin Moffatt
  - Joe Njenga
description: "Week 13 tech roundup: the anatomy of the .claude/ folder demystified, harness engineering explained as the discipline beyond prompting, Claude Code's /dream for memory consolidation, and Robin Moffatt builds a Kafka Connect connector in Java without knowing Java."
---

This week's roundup lands at the intersection of two themes that keep resurfacing: making AI agents more reliable in production and more useful for people who aren't experts in the language or framework they need. From the nuts and bolts of configuring Claude Code's .claude/ folder, to the emerging discipline of harness engineering, to a delightful story about building a Kafka connector in a language you don't know, there's a common thread here about building better systems around AI rather than just throwing prompts at it.

We also look at Claude Code's new `/dream` feature for memory consolidation, which tackles the very real problem of your coding agent's memory slowly turning into a contradictory mess over time.

<!--more-->

---

## Generative AI

* [**Anatomy of the .claude/ folder**][1]. In this post, Akshay Pachaar provides a thorough walkthrough of the `.claude/` folder: the control centre for how Claude Code behaves in your project. Most users, Akshay argues, treat this folder as a black box, and that's a missed opportunity. The post covers the two-folder architecture (project-level `.claude/` for team configuration committed to git, and global `~/.claude/` for personal preferences), the critical role of `CLAUDE.md` as Claude's instruction manual (kept under 200 lines for optimal adherence), and modular `rules/` files that can be path-scoped to activate only when Claude is editing specific directories. He walks through custom slash commands in `commands/`, skills in `skills/` that Claude can auto-invoke based on task matching, and custom subagent personas in `agents/` with their own tool restrictions and model overrides.

  The practical details are what make this post valuable. The `settings.json` permission system, with explicit allow/deny lists for tools and commands, plus the middle ground where anything not listed triggers a confirmation prompt is well explained with sensible defaults. Akshay also covers `CLAUDE.local.md` and `settings.local.json` for personal overrides that stay gitignored, and the global `~/.claude/projects/` directory where Claude Code stores session transcripts and auto-memory. The five-step "practical setup to get started" progression (from `/init` through to skills and agents) gives newcomers a clear on-ramp.

  Here's what strikes me: the `.claude/` folder is essentially a declarative API for shaping agent behaviour, and the post makes the analogy explicit, it's "a protocol for telling Claude who you are, what your project does, and what rules it should follow." The more precisely you define that protocol, the less time you spend correcting Claude mid-session. For anyone who's been using Claude Code but hasn't dug into the configuration layer, this is the guide to read.

---

* [**Why Everyone Is Talking About Harness Engineering**][2]. This post by Louis-François Bouchard tackles the buzzy new term "harness engineering" and makes a compelling case that it's not just prompt engineering with a fancier name. The core argument is sharp: agents got good enough to be useful but not reliable enough to trust on their own, and that gap created a whole new engineering discipline. Bouchard draws clear distinctions between prompt engineering (what to ask), context engineering (what to send the model so it can answer well), and harness engineering (how the whole system operates) — the tools, permissions, state, tests, logs, retries, checkpoints, guardrails, and evals that prevent an agent from drifting into nonsense. His car metaphor lands well: the model is the engine, context is the fuel and dashboard, and the harness is the steering, brakes, lane boundaries, and the fact that the doors shouldn't fall off on the highway.

  Bouchard traces the lineage from Karpathy's December 2025 inversion (mostly agent-driven coding with manual edits), through Anthropic's long-running agents post (externalised memory, split roles between initialiser and coding agents), to Mitchell Hashimoto naming the concept in February 2026 with the key insight: every time the agent makes a mistake, engineer the environment so it can't make that specific mistake the same way again. The evidence is stacking up — LangChain reportedly moved a coding agent from outside the Top 30 to Top 5 on Terminal Bench 2.0 by changing only the harness, not the model. Stripe has agents producing over 1,000 merged PRs per week in isolated environments with strict CI limits.

  What fascinates me about harness engineering is how it reframes the programmer's role. Less time typing every line by hand, more time designing habitats where agents can do useful work without wrecking everything around them. Bouchard is honest about the limits, too: memory still breaks, validation misses things, tool use creates security risk, and "harness debt" is real because your harness becomes its own product with its own bugs. But the direction is clear, the future is less "one genius model does everything" and more "models operating inside well-engineered environments that make them usable." If you've been wondering what comes after prompt engineering, this is the post that answers that question.

---

* [**How I'm Using (New) Claude Code /dream & Auto Dream (To Never Lose Memory Again)**][3]. Joe Njenga, in this post, clears up the confusion around Claude Code's new memory consolidation features: the `/dream` slash command and its automated counterpart, Auto-Dream. The problem they solve is one every heavy Claude Code user has encountered: over time, auto-memory accumulates contradictions (you switched from React to Vue but both instructions still exist), stale information (debugging notes referencing deleted files), relative dates that have long expired ("feature due next Friday" from six months ago), and a bloated `MEMORY.md` index that eats context at the start of every session. The memory that was supposed to make Claude smarter starts making it slower and less accurate.

  Njenga explains that `/dream` and Auto-Dream perform the same consolidation work but differ in their trigger mechanisms. `/dream` is a manual command you run inside a session; Auto-Dream runs automatically between sessions when at least 24 hours and 5 sessions have passed since the last cycle. Auto-Dream is currently gated behind a feature flag and not yet live for most users, but the `/dream` prompt is publicly available on GitHub, so Njenga walks through building it as a custom skill you can use right now. The consolidation runs in four phases: orient (survey existing memory), gather recent signal (check for drifted facts without reading all transcripts), consolidate (merge duplicates, convert relative dates, delete contradicted facts), and prune the index back under 200 lines.

  I keep wrestling with whether automated memory management is a solved problem or an inherently leaky abstraction. On the one hand, the four-phase approach is well-designed: it's targeted (grep, not full transcript reads), conservative (only changing what's drifted), and respects the 200-line index limit. On the other hand, any system that has an AI cleaning up after an AI has a recursive trust problem: how do you know the consolidation didn't throw away something important? The answer, for now, is that `/dream` returns a summary of what changed, so you can audit it. That's a reasonable starting point, and the ability to scope it (`/dream`, `/dream user`, `/dream all`) gives you control over what gets touched.

---

* [**Look Ma, I made a JAR! (Building a connector for Kafka Connect without knowing Java)**][4]. Robin Moffatt, in this post, tells one of the most honest and entertaining stories I've read about using a coding agent to build something in a language you don't know. As a non-Java programmer who has spent ten years in the JVM-centric world of data engineering, Robin had always been stuck when a Kafka Connect connector didn't exist for his use case, resorting to cobbled-together pipelines built on kcat and shell pipes. The specific challenge: building a source connector for AIS (Automatic Identification System) maritime data from a live Norwegian government TCP endpoint, properly handling NMEA message parsing, TCP reconnection, configurable topic routing, and Avro schema generation.

  What makes this post exceptional is the transparency of the human-agent collaboration. Robin starts by asking Claude to create a skill for building Kafka Connect connectors, catches it completely misunderstanding the brief on the first attempt ("wow, you completely screwed up"), redirects it, then engages in genuinely substantive architectural dialogue, asking about TCP pipe semantics versus traditional request/response patterns, whether 1:N topic routing is idiomatic, Kafka message header strategies, and TCP reconnection logic that won't stall the `poll()` method. Claude's responses demonstrate real understanding of the domain: explaining `SO_TIMEOUT`, volatile stopping flags, and the difference between source connectors for finite sources versus live streams. The result is a working JAR file, Docker Compose setup, and a connector that successfully ingests live AIS data into typed Kafka topics.

  What I find particularly valuable here is what Robin demonstrates about the right way to work with coding agents on unfamiliar territory. He doesn't just prompt and accept; he probes the architecture, challenges assumptions, and brings his domain expertise (years of working with Kafka Connect as a user) to validate decisions he couldn't make as a Java developer. The line "Claude enables you to write tools that work as you want them, not make do and adapt your workflow to fit them" captures something profound about how AI-assisted development changes the power dynamic between developers and their tools. This is not vibe coding, it's expert-guided agent development, and the distinction matters enormously.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/
[charlblog]: https://charlla.com/

[jovpop]: https://twitter.com/JovanPop_MSFT
[bobw]: https://twitter.com/bobwardms
[revod]: https://twitter.com/revodavid
[lonny]: https://twitter.com/sqL_handLe
[ewtw]: https://twitter.com/sqlOnIce
[buckw]: https://twitter.com/BuckWoodyMSFT
[mattw]: https://twitter.com/matthewwarren
[murba]: https://twitter.com/muratdemirbas
[daveda]: https://twitter.com/davidthecoder
[adcol]: https://twitter.com/adriancolyer
[jesrod]: https://twitter.com/jrdothoughts
[tomaz]: https://twitter.com/tomaz_tsql
[dataart]: https://twitter.com/dataartisans
[luis]: https://twitter.com/luis_de_sousa
[benstop]: https://twitter.com/benstopford
[conflu]: https://twitter.com/confluentinc
[tylert]: https://twitter.com/tyler_treat
[andrewng]: https://twitter.com/AndrewYNg
[lawr]: https://twitter.com/bytezn
[jue]: https://twitter.com/b0rk
[yan]: https://twitter.com/theburningmonk
[danny]: https://twitter.com/g9yuayon
[rmoff]: https://www.linkedin.com/in/robinmoffatt/
[ryansw]: https://twitter.com/ryanswanstrom
[pabloc]: https://twitter.com/pabloc_ds
[mklep]: https://twitter.com/martinkl
[mdavey]: https://twitter.com/matt_davey
[jboner]: https://twitter.com/jboner
[joeduff]: https://twitter.com/funcOfJoe
[charl]: https://twitter.com/charllamprecht
[dbricks]: https://twitter.com/databricks
[adsit]: https://twitter.com/SitnikAdam
[vicky]: https://twitter.com/vickyharp
[dscentral]: https://twitter.com/DataScienceCtrl
[natemc]: https://twitter.com/natemcmaster
[ads]: https://twitter.com/azuredatastudio
[travw]: https://twitter.com/radtravis
[emilk]: https://twitter.com/IsTheArchitect
[netflx]: https://netflixtechblog.com/
[hubert]: https://www.linkedin.com/in/hkdulay/
[jserra]: https://www.linkedin.com/in/jamesserra/
[lemi]: https://www.linkedin.com/in/lemimasalu/
[michael]: https://www.linkedin.com/in/michaeladrianjohnson/

[1]: https://x.com/akshay_pachaar/status/2035341800739877091
[2]: https://pub.towardsai.net/why-everyone-is-talking-about-harness-engineering-1ec6dd9fec97?sk=v2%2F4e2f862b-9150-4387-bf8a-b67287691e47
[3]: https://medium.com/@joe.njenga/how-im-using-new-claude-code-dream-auto-dream-to-never-lose-memory-again-ba0575f2881a?sk=v2%2F87fe79b5-0665-4437-b5c2-b7d0d89b34ee
[4]: https://rmoff.net/2026/03/27/look-ma-i-made-a-jar-building-a-connector-for-kafka-connect-without-knowing-java/


<!-- [postref]: {{< relref "" >}} -->
