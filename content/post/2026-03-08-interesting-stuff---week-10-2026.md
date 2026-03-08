---
type: post
layout: "post"
title: Interesting Stuff - Week 10, 2026
author: nielsb
date: 2026-03-08T06:50:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-10-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-10-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Gas Town
  - Anthropic
  - Claude Code
  - Agent Skills
  - aimldatadurban
  - AI Unplugged
description: "Week 10 tech roundup: Netflix battles kernel-level mount lock contention at scale, Confluent explores autonomous data systems for real-time decisioning, Steve Yegge federates a thousand Gas Towns into the Wasteland, and Anthropic's Skill-Creator plugin brings rigorous testing to agent skills."
---

This week's roundup takes us from the depths of Linux kernel lock contention at Netflix to the ambitious vision of federating AI-powered coding agents into a collaborative workforce. Along the way, we explore how data architectures are evolving from passive reporting to autonomous decision-making systems, and how Anthropic is tackling the thorny problem of making sure your agent skills actually work reliably.

Whether you're a systems engineer wrestling with container scaling, an architect designing real-time data pipelines, or a developer building and testing agent skills, there's something here to spark your curiosity. Let's dive in!

<!--more-->

---

## Distributed Computing

* [**Mount Mayhem at Netflix: Scaling Containers on Modern CPUs**][1]. In this post, the Netflix Technology Blog (authored by Harshad Sane and Andrew Halaney) takes us on a deep-dive detective story into what happens when container orchestration meets CPU architecture at massive scale. After migrating to a modern kubelet and containerd runtime, Netflix began seeing nodes stall for 30+ seconds during simple health checks. The culprit? A kernel-level global mount lock that turned into a brutal bottleneck when launching hundreds of many-layered container images simultaneously. The new runtime assigns each container a unique host user range for improved security, but this means containerd performs thousands of mount and unmount operations, up to 20,200 for 100 containers with 50-layer images, all competing for the same global lock.

  The investigation revealed that hardware architecture matters enormously. Older dual-socket r5.metal instances with NUMA topology and centralised cache designs suffered the worst, with cache-line bouncing and false sharing consuming 95% of pipeline slots. Disabling hyperthreading improved latencies by 20–30%, and AMD's distributed chiplet-based cache architecture outperformed Intel's mesh-based design by roughly 20% under the same contention. Netflix ultimately worked with the containerd upstream to reduce mount operations from O(n) per container (where n is the number of image layers) to O(1) by mapping the common parent directory, effectively eliminating the lock as a launch-time bottleneck.

  What fascinates me about this piece is how it illustrates that "scaling" isn't just about adding more machines; sometimes, the real battle is deep inside the kernel and the CPU microarchitecture. The fact that a security improvement (unique user namespaces per container) introduced a performance cliff that only manifested on specific hardware generations is exactly the kind of emergent complexity that makes distributed systems engineering endlessly humbling. If you run containers at any meaningful scale, this is required reading.

---

## Generative AI

* [**How to Build Autonomous Data Systems for Real-Time Decisioning**][2]. This post by Bijoy Choudhury at Confluent lays out a compelling conceptual framework for the next evolution in data architecture: systems that don't just report on what happened, but autonomously decide what to do about it in real-time. The core distinction Choudhury draws is between real-time analytics (insight-oriented, dashboards for humans) and real-time decisioning (action-oriented, triggering automated responses in milliseconds). The architecture follows a four-component closed-loop model: continuous data ingestion from event streams, stateful enrichment that joins fast-moving signals with slow-moving context, a decision engine applying both deterministic rules and ML models, and action connectors that trigger downstream processes and feed outcomes back into the system for self-correction.

  The practical examples are where the framework really comes alive. A suspicious login gets challenged with MFA instantly, rather than being reviewed by a security analyst the next day. Inventory spikes trigger automatic price adjustments, rather than waiting for a merchandiser to notice on Monday morning. Server failures are preempted before they occur by detecting latency signatures and automatically spinning up additional instances. Choudhury is careful to address the risks, too; kill switches, logic observability, audit logs, and strict schema validation are all presented as non-negotiable guardrails for systems that can act without human approval.

  Here's what strikes me about this piece: the maturity model from "decision support" (the GPS that tells you where you are) to "autonomous operations" (the autopilot that steers the car) is an incredibly useful mental framework. Most organisations I see are still firmly in GPS mode, building dashboards and expecting humans to react. The shift to autopilot requires not just different technology but a fundamental change in how we think about the role of humans in data systems, from operators to architects of the rules. That's a cultural transformation as much as a technical one, and many companies underestimate just how hard that transition is.


---

* [**Welcome to the Wasteland: A Thousand Gas Towns**][3]. Steve Yegge, in this post, unveils the Wasteland, the next evolution of his Gas Town AI coding orchestrator, and it's every bit as ambitious and irreverent as you'd expect. The Wasteland federates thousands of individual Gas Town instances into a collaborative trust network, built around a shared "Wanted Board" of open work items. The core protocol borrows Git's battle-tested fork/merge model: you claim a task, submit a PR-style completion, a validator reviews and stamps it, and those stamps accumulate into a portable, evidence-backed professional reputation. Think of it as a résumé you never have to write, one that proves what you can do, verified by the people who reviewed your work, not your own LinkedIn self-assessment.

  The technical backbone is Dolt, a SQL database with Git semantics created by Tim Sehn's team, which enables branching, merging, and pull requests on structured data, exactly what you need for a federated work protocol. Yegge reports that Gas Town itself has matured dramatically, with 2,400 submitted PRs and 1,500 merged from over 450 unique contributors in just two months. The Wasteland introduces rigs (participants backed by AI agents), posters (who put up work), and validators (who attest to quality), with a trust ladder from registered participant through contributor to maintainer. The multi-dimensional stamp system scores quality, reliability, and creativity independently, and the whole thing is auditable, versioned, and append-only.

  I keep wrestling with the tension in Yegge's vision. On one hand, the idea of a federated, evidence-based reputation system for AI-augmented work is genuinely compelling; it addresses a real problem as coding agents make contribution tracking increasingly murky. On the other hand, the RPG gamification layer (character sheets, leaderboards, levelling systems) could either be the secret sauce that drives massive adoption or a distraction that undermines credibility with enterprise users. Yegge's candid admission that their levelling system was "the most broke-ass" ever invented and got scrapped right before launch is both hilarious and telling. Whether the Wasteland becomes the LinkedIn-killer for the agentic era or remains a fascinating experiment, it's the most interesting thing happening in developer collaboration right now.

---

* [**Anthropic (New) Skill-Creator Measures If Your Agent Skills Work (No More Guesswork)**][4]. Joe Njenga provides an in-depth walkthrough of Anthropic's new Skill-Creator plugin. This testing framework brings the rigour of software engineering practices to the world of agent skill authoring. The core problem it addresses is one every Claude Code user has felt: you write a `SKILL.md` file, it seems to work today, but tomorrow it might silently break because models are changing constantly, and what worked last week may not work next week. The Skill-Creator formalises testing by letting you define eval prompts (the tasks your skill should handle) and expectations (what success looks like), then runs them automatically with pass/fail tracking, timing metrics, and token usage measurement.

  Njenga draws an important distinction between two types of skills: capability-uplift skills (like PDF processing, where the skill teaches Claude techniques the base model can't do well) and encoded-preference skills (like NDA review workflows, where the skill sequences existing capabilities according to your team's process). The benchmark results are eye-opening; the PDF skill achieved a 100% pass rate on five evals with the skill loaded, versus just 40% without it, confirming the skill adds genuine value for tasks like filling non-fillable forms and OCR-to-searchable conversions. The multi-agent testing mode is particularly clever, spinning up independent agents to run evals in parallel with clean contexts and no cross-contamination between tests.

  What I find particularly valuable about this approach is that it shifts agent skills from "vibes-based development" to an actual engineering discipline. The idea that capability uplift skills might become unnecessary over time as models improve, and that your evals will tell you when that happens, is a nuanced insight that most people in the agent skill space aren't considering. If you're building agent skills for Claude Code or Cowork, this plugin should be part of your workflow from day one.

---

## WIND (What Is Niels Doing)

The countdown is on, less than one week until [**Data & AI Community Day Durban: AI Unplugged**][daid] on **March 14**! We finalised the agenda this weekend, and I'm thrilled (and a little overwhelmed) to share that the event is **completely sold out**. The response from the Durban data and AI community has been nothing short of phenomenal, and I can't wait to see everyone there. If you want to check out the agenda and event details, head over to the [event page][daid].

On the blog series front, [**Building an Event Management System with Claude Code**](/contact-event-claude-code) has taken a bit of a back seat while I've been heads-down organising the event. I'm about halfway through **Part 12**, but between finalising the agenda, coordinating speakers, and handling all the logistics of a sold-out event, I don't know when it will be published. Stay tuned, it's coming, just not as quickly as I'd like!

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

[1]: https://netflixtechblog.com/mount-mayhem-at-netflix-scaling-containers-on-modern-cpus-f3b09b68beac
[2]: https://www.confluent.io/blog/real-time-decisioning-autonomous-data-systems/
[3]: https://steve-yegge.medium.com/welcome-to-the-wasteland-a-thousand-gas-towns-a5eb9bc8dc1f
[4]: https://medium.com/ai-software-engineer/anthropic-new-skill-creator-measures-if-your-agent-skills-work-no-more-guesswork-840a108e505f?sk=v2%2Ff28915b3-a772-4f54-b7a3-ddd2bc543f44

[daid]: https://aimldatadurban.org/events/2026/ai-unplugged/
[1]: https://aimldatadurban.org/events/2025/season-of-ai-mcp-agenda/



<!-- [postref]: {{< relref "" >}} -->

<!-- [series1]: [SQL Server R Services](/sql_server_2k16_r_services) -->
<!-- [series2]: [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) -->
<!-- [series3]: [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) -->


<!-- [findstr]: findstr /I <word_to_find> * -->
<!-- [findstr]: findstr /I /c:<"phrase to find"> * -->
