---
type: post
layout: "post"
title: Interesting Stuff - Week 08, 2026
author: nielsb
date: 2026-02-22T06:15:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-08-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-08-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - Ai-Agents
  - Sonnet 4.6
  - Compound Engineering
  - Agentic Coding
  - Andrej Karpathy
  - aimldatadurban
  - AI Unplugged
description: "Week 08 tech roundup: Anthropic's 2026 Agentic Coding Trends Report predicts orchestrators over coders, Calvin French-Owen compares Claude Code vs Codex workflows, Sonnet 4.6 outperforms Opus at 80% less cost, compound engineering ships as a plugin, and Karpathy declares Claws the next AI layer."
---

This week's roundup is all about the maturing ecosystem of AI-powered software development and the emerging layers being built on top of it. Anthropic drops a comprehensive trends report predicting that engineers will become agent orchestrators rather than code writers. At the same time, Calvin French-Owen offers a practitioner's view of juggling Claude Code and Codex in his daily workflow. Sonnet 4.6 arrives and promptly embarrasses its more expensive sibling on several benchmarks, and Kieran Klaassen packages his compound engineering philosophy into a plugin you can install with a single command.

Meanwhile, Andrej Karpathy coins the next evolution of the AI stack: Claws, persistent AI agents that live on dedicated hardware and orchestrate your digital life. Whether you are building with agents, managing agents, or just trying to keep up with what agents can do, this week delivers a masterclass in where agentic development is heading and how practitioners are actually using these tools in the trenches.

<!--more-->

---

## Generative AI

* [**2026 Agentic Coding Trends Report**][1]. Anthropic's latest report identifies eight trends poised to define agentic coding in 2026, and the headline is stark: software development is shifting from writing code to orchestrating agents that write code. The report, drawing on customer case studies and internal research, reveals that while developers use AI in roughly 60% of their work, they can "fully delegate" only 0-20% of tasks, suggesting AI is a constant collaborator rather than an autonomous replacement. The trends span three categories: foundation shifts (the SDLC collapsing from weeks to hours, engineers becoming "full-stack" through AI augmentation), capability expansions (single agents evolving into coordinated teams, long-running agents building complete systems over days rather than minutes), and impact predictions (productivity gains driven by output volume rather than speed, with 27% of AI-assisted work consisting of tasks that would never have been attempted manually).

  Among the most compelling findings is the "collaboration paradox": engineers report significant productivity gains but develop intuitions about delegation over time, tending to hand off easily verifiable or low-stakes tasks while keeping conceptually difficult design work for themselves. The report predicts that multi-agent orchestration will become standard, with companies like Fountain achieving 50% faster screening through hierarchical agent coordination, and that onboarding timelines will collapse from weeks to hours, enabling dynamic "surge" staffing. On the security front, the dual-use reality is acknowledged head-on: the same capabilities that let any engineer become a security reviewer also help threat actors scale attacks, making security-first architecture non-negotiable.

  What I find most thought-provoking about this report is the tension between the "orchestrator" vision and the collaboration paradox. If engineers can only fully delegate 0-20% of tasks today, and the most valuable work (architecture, system design, "taste") remains stubbornly human, then the trajectory is less "developers replaced by agents" and more "developers amplified by agents into broader, more strategic roles." The case studies are compelling: an Augment Code customer finishing a 4-8 month project in two weeks, TELUS saving 500,000 hours, and CRED doubling execution speed. But I keep coming back to the unnamed engineer's quote: "I'm primarily using AI in cases where I know what the answer should be." That's an important nuance for anyone rushing to hand over the keys to agent swarms. The future is collaborative, not autonomous, and the organisations that figure out how to scale human oversight without creating bottlenecks will be the ones that actually capture these productivity gains. For anyone building a strategy around AI coding tools, this report is essential reading.

---

* [**Coding Agents in Feb 2026**][2]. Calvin French-Owen, who helped launch the Codex web product and has worked extensively with Claude Code, delivers a practitioner's guide to navigating the coding agent landscape in February 2026. His central insight is refreshingly pragmatic: the biggest change to his workflow is that his own time is now the primary bottleneck, and he chooses his coding agent based on how much time he has and how long he wants it to run autonomously. He pays for Claude Max, ChatGPT Pro, and Cursor Pro+, and considers them among the best money he spends. The guiding principle underpinning everything? You must understand context. Since agents do next-token prediction within finite context windows, your work needs to be chunked appropriately, compaction is lossy, and externalising context into the filesystem (plan documents with checkable stages) allows agents to selectively read and remember without filling up conversation context.

  The Claude Code versus Codex comparison is where things get interesting. Opus excels at working across context windows efficiently, frequently spinning up multiple sub-agents simultaneously via Explore and Task calls, with strong tool use for git, GitHub, and MCP servers. French-Owen finds Opus more "creative" during planning, pointing out areas of ambiguity he may have forgotten to mention. Codex, running on GPT-5.3-Codex-xhigh, writes code with demonstrably fewer bugs: fewer dangling references, off-by-one errors, and forgotten component registrations. But Codex is slower because it hasn't yet mastered delegation across context windows. The practical result? He starts with Claude Code for planning and orchestration, then flips to Codex when it's time to actually write code. His automation journey through skills is particularly illuminating: from a simple `/commit` to `/worktree` to `/implement` to `/implement-all` to `/pr-pass`, each automation layer built incrementally by noticing repetitive patterns, not designed top-down.

  French-Owen's closing vision, inspired by Steve Yegge's "Gas Town" post, is that the future involves laptops (or cloud sandboxes) constantly churning on ideas in the background. At the same time, developers nudge them in the right direction, review the output, and come back. He already kicks off 3-4 tasks in Codex before bed, so they are ready for review in the morning. But two barriers remain: context window coordination (agents can't endlessly compact and recycle) and resistance to prompt injection (running agents overnight in `--yolo` mode feels too risky). As a solo engineer, he's already finding that he is the bottleneck when it comes to the right ideas, not the implementation. That's a statement that would have been unthinkable even a year ago, and it underscores just how rapidly the bottleneck in software development is shifting from coding capacity to strategic vision.

---

* [**Claude Sonnet 4.6 Is Here: Does Better Than Expensive Opus 4.6 (Here's The Breakdown)**][3]. Joe Njenga, in this post, dives into the release of Claude Sonnet 4.6, which has pulled off something remarkable: outperforming the significantly more expensive Opus 4.6 on several key benchmarks while costing roughly 80% less. The numbers are eye-catching. Sonnet 4.6 scores 72.5% on OSWorld-Verified for computer use (up from 61.4% on Sonnet 4.5), 79.6% on SWE-bench Verified for agentic coding, and achieves 1633 Elo on GDPval-AA for real-world office tasks, beating Opus 4.6's 1606. Perhaps the most jaw-dropping improvement is on ARC-AGI-2, the novel problem-solving benchmark, where Sonnet leaps from 13.6% (Sonnet 4.5) to 58.3%, though Opus 4.6 still leads at 68.8%. The financial analysis benchmark is where Sonnet truly flexes: 63.3% on Finance Agent v1.1, the highest score of any model tested.

  Njenga provides a clear breakdown of where each model wins. Sonnet 4.6 takes the crown in office tasks and agentic financial analysis, and is tied in computer use. Opus 4.6 retains its edge on terminal coding (65.4% vs 59.1%), agentic search (84.0% vs 74.7%), multidisciplinary reasoning, and the raw agentic coding benchmark. The practical recommendation is straightforward: Sonnet 4.6 is the go-to for everyday production workflows, financial analysis, automated computer use, and cost-sensitive deployments. Opus 4.6 remains the better choice for large codebases that require the 1M-token context window, complex terminal coding sessions, and tasks that demand deep multi-step reasoning.

  What strikes me about this release is how it upends the traditional assumption that bigger and more expensive always means better. Sonnet 4.6, beating Opus on office tasks and financial analysis, suggests that Anthropic's training approach is becoming increasingly sophisticated at targeting specific capability profiles rather than just scaling up uniformly. For anyone running production AI workloads, this is a welcome development: you can now get Opus-level (or better) performance on many real-world tasks at a fraction of the cost. The question is whether this signals a broader trend where mid-tier models increasingly eat into premium model territory, making the "always use the biggest model" strategy not just wasteful but actually suboptimal for certain workloads.

---

* [**Compound Engineering: Make Every Unit of Work Compound Into the Next**][4]. Kieran Klaassen, whose "Ship Like a Team of Five" and "Teach Your AI to Think Like a Senior Engineer" posts featured in recent roundups, has now packaged his entire AI-native engineering philosophy into a comprehensive guide and an open-source plugin. The core thesis of compound engineering is deceptively simple: each unit of engineering work should make subsequent units easier, not harder. While most codebases accumulate complexity over time (each feature negotiating with the old ones), compound engineering flips this by ensuring that bug fixes eliminate entire categories of future bugs, and patterns become reusable tools. Every, the publication behind Cora, runs five products with primarily single-person engineering teams, and the system making this possible is a four-step loop: Plan, Work, Review, Compound. It's that fourth step, Compound, where the magic happens: documenting what worked, tagging it with metadata for retrieval, and updating CLAUDE.md so the agent learns for next time.

  The plugin ships with 26 specialised agents, 23 workflow commands, and 13 skills, installable with a single command in Claude Code, OpenCode, or Codex. The `/workflows:plan` command spawns three parallel research agents (codebase patterns, framework documentation, industry best practices) before merging findings into a structured plan. The `/workflows:review` unleashes 14 specialised reviewers simultaneously, from a security-sentinel scanning for OWASP vulnerabilities to a dhh-rails-reviewer enforcing 37signals conventions. But the real standout is `/lfg` (let's go): describe a feature, and the agent chains the full pipeline from planning through implementation, review, bug resolution, browser testing, and compounding, spawning over 50 agents across all stages. Klaassen also introduces a five-stage maturity model, from Stage 0 (manual development) to Stage 5 (parallel cloud execution), with the critical transition happening at Stage 3, where developers shift from line-by-line review to plan-first, PR-only review.

  The guide doesn't shy away from the cultural shifts required, and this is where it gets truly interesting. Klaassen identifies eight beliefs developers need to let go of, including "code is self-expression" (the code was never really yours; it belongs to the team and users), "every line must be manually reviewed" (fix the trust system instead of compensating by doing everything yourself), and "first attempts should be good" (first attempts have a 95% garbage rate; second attempts are still 50%). His "50/50 rule" is provocative: allocate 50% of engineering time to building features and 50% to improving the system. In traditional engineering, that split is 90/10, which is precisely why codebases accumulate debt. Whether you adopt the full plugin or internalise the compound mindset, this guide is the most comprehensive playbook I've seen for structuring AI-assisted development at scale.

---

* [**Andrej Karpathy on Claws: The Next Layer of the AI Stack**][5]. Andrej Karpathy, in this post on X, declares the arrival of what he sees as a new layer in the AI stack: Claws. Having bought a Mac mini specifically to tinker with them over the weekend (the Apple Store staff told him they are selling like hotcakes and everyone is confused), Karpathy articulates the progression succinctly: "First there was chat, then there was code, now there is claw." The concept is straightforward: just as LLM agents sit on top of LLMs, Claws sit on top of LLM agents, adding orchestration, scheduling, context persistence, and tool calls that take the autonomous agent paradigm to its next logical evolution. But Karpathy is characteristically clear-eyed about the risks: he's "a bit sus'd" about running OpenClaw specifically, noting that giving private data and keys to 400,000 lines of vibe-coded code that is being actively attacked at scale is "not very appealing at all," citing reports of exposed instances, RCE vulnerabilities, supply chain poisoning, and malicious skills in the registry.

  What catches his attention instead is NanoClaw, a lightweight alternative with a core engine of approximately 4,000 lines of code ("fits into both my head and that of AI agents"), running everything in containers by default. Karpathy is particularly taken with NanoClaw's approach to configurability. Instead of config files that breed if-then-else monsters, configuration is handled via skills that instruct your AI agent on how to modify the codebase to integrate services (for example, `/add-telegram` modifies the codebase rather than adding a config entry). He calls this "the implied new meta": write the most forkable repo possible, and then have the skills to fork it into any desired configuration. Drawing on his deep learning background, he connects this to meta-learning approaches such as MAML (2017), which aim to optimise the model's ability to adapt rather than a specific task.

  I find Karpathy's framing genuinely compelling and a bit dizzying. If he's right that Claws represent a new layer of the AI stack, we're watching the infrastructure for persistent, always-on AI agents take shape in real time, complete with the same security growing pains that every new computing paradigm goes through. The tension between OpenClaw's feature-richness and its security nightmare, versus NanoClaw's auditable minimalism, mirrors debates we've seen before: the Linux kernel versus microkernels, monolithic frameworks versus microservices. His observation about the "aesthetically pleasing" quality of a physical device "possessed by a little ghost of a personal digital house elf" also hints at something deeper, a shift from AI as a tool you invoke to AI as a persistent companion that inhabits your environment. For anyone tracking the evolution of AI infrastructure, Karpathy's signal is clear: the Claw layer is happening whether we're ready or not, and the battle for its soul is between feature-rich security nightmares and auditable minimalism.

---

## WIND (What Is Niels Doing)

I'm about to publish **Part 11** of my [**Building an Event Management System with Claude Code**](/contact-event-claude-code) blog series! This instalment tackles campaign tracking and communication, specifically how to set up a system to send personalised emails to multiple recipients. It's been a meaty one to write, but getting the campaign management workflow right felt like a milestone worth spending extra time on.

On the [**Data & AI Community Day Durban: AI Unplugged**][daid] front, we're in the final days of our Call for Speakers, and the response has been fantastic: we've received lots of very promising topics covering everything from generative AI to data engineering and beyond. That said, there's always room for more, so if you've been on the fence about submitting, [**now is the time**][6]! And here's the bit that should get your attention: registrations will be opening in a day or two, so keep your eyes peeled for the announcement. You won't want to miss this one!

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions. I look forward to hearing from you.

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

[1]: https://resources.anthropic.com/hubfs/2026%20Agentic%20Coding%20Trends%20Report.pdf
[2]: https://calv.info/agents-feb-2026
[3]: https://medium.com/ai-software-engineer/claude-sonnet-4-6-is-here-it-does-better-than-expensive-opus-4-6-heres-full-breakdown-b7650b226c3b?sk=v2%2Fd85d27b4-76ef-404b-8501-1c3893ad09ed
[4]: https://every.to/guides/compound-engineering
[5]: https://x.com/karpathy/status/2024987174077432126
[6]: https://sessionize.com/durban-ai-unplugged/

[daid]: https://aimldatadurban.org/events/2026/data-ai-community-day-dbn-1/



<!-- [postref]: {{< relref "" >}} -->

<!-- [series1]: [SQL Server R Services](/sql_server_2k16_r_services) -->
<!-- [series2]: [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) -->
<!-- [series3]: [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) -->


<!-- [findstr]: findstr /I <word_to_find> * -->
<!-- [findstr]: findstr /I /c:<"phrase to find"> * -->
