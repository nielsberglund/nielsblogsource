---
type: post
layout: "post"
title: Interesting Stuff - Week 11, 2026
author: nielsb
date: 2026-03-15T14:03:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-11-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-11-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Andrej Karpathy
  - Anthropic
  - Claude Code
  - Claude Marketplace
  - Andrew Ng
  - AgentRx
  - AI Agents
  - aimldatadurban
  - AI Unplugged
description: "Week 11 tech roundup: Karpathy's Autoresearch lets AI agents run autonomous ML experiments, Anthropic launches the Claude Marketplace and code review, Joe Njenga explores Claude Code /loop, Andrew Ng's Context Hub tackles agent drift, Microsoft's AgentRx debugs agent failures, and Cash App's monorepo migration story."
---

This week's roundup is packed, from Andrej Karpathy letting AI agents autonomously run ML experiments on a single GPU to Anthropic making bold moves with both the Claude Marketplace and agentic code review. We also look at how coding agents are getting better tooling for context, debugging, and autonomous loops, plus a fantastic engineering case study from Cash App on migrating 450 repositories into a single monorepo.

On the personal front, yesterday was a big day: the Data & AI Community Day Durban: AI Unplugged event happened, and what an event it was! Read on for the full story.

<!--more-->

---

## Generative AI

* [**Andrej Karpathy Open-Sources 'Autoresearch': A 630-Line Python Tool Letting AI Agents Run Autonomous ML Experiments on Single GPUs**][1]. In this post, MarkTechPost covers Andrej Karpathy's release of autoresearch, a minimalist Python tool that enables AI agents to autonomously conduct machine learning experiments. The framework is elegantly simple: a ~630-line single-file repository (stripped from Karpathy's nanochat LLM training core), optimised for a single NVIDIA GPU. The agent reads human-provided research instructions in Markdown, modifies the Python training script, adjusting architectures, optimisers, or hyperparameters, and runs fixed 5-minute training sprints. Changes are only committed to a git feature branch if they improve the bits-per-byte (BPB) validation score, creating a continuous autonomous iteration loop with built-in quality gates.

    The real-world validation is compelling. Shopify CEO Tobi Lutke adapted the framework for an internal project and reported a 19% improvement in validation scores, with the agent-optimised smaller model actually outperforming a larger, manually configured one. Karpathy then integrated the agent-discovered optimisations back into his broader nanochat framework, demonstrating that insights from constrained autonomous experimentation can transfer to production systems.

    What fascinates me about autoresearch is the deliberate constraint at its heart. By keeping the entire codebase within an LLM's context window (~630 lines), you eliminate code-generation errors that plague larger codebases and let the agent maintain a holistic understanding of the system it's modifying. It's a masterclass in designing for AI, not just using AI as a tool, but reshaping the problem space so that AI can operate effectively within it. The shift from "manually tuning hyperparameters" to "engineering the prompts that guide an autonomous agent" feels like a preview of how ML research will increasingly work.

---

* [**The Claude Marketplace: Anthropic's Bold Bet on Enterprise AI Distribution**][2]. This post by Faisal Haque dives deep into Anthropic's launch of the Claude Marketplace, and argues it's less a plugin directory than a strategic reimagining of how enterprise AI gets procured, deployed, and governed. The core insight is elegant: organisations with existing Anthropic enterprise commitments can now extend those commitments to purchase specialised AI tools from vetted partners,  GitLab Duo for DevSecOps workflows, Harvey for legal AI automation, and Lovable for no-code application development, all without separate contracts, security reviews, or vendor relationships. Anthropic becomes the financial clearinghouse for enterprise AI spending, while partners gain access to an installed base without building their own sales motions.

    The architectural backbone is the Model Context Protocol (MCP), which standardises how external tools expose capabilities to Claude, enabling a "Claude as orchestrator" pattern. The competitive landscape analysis is sharp: unlike Microsoft (tied to Office) or Salesforce (tied to CRM), Anthropic's horizontal positioning allows it to serve as infrastructure across departmental silos. Haque walks through concrete scenarios: a law firm reallocating $3,000/month from its Anthropic commitment to Harvey, a startup activating GitLab Duo without new vendor onboarding, and a marketing director building internal tools with Lovable using her departmental AI budget, which makes the value proposition tangible.

    Here's what strikes me: the three-phase evolution Haque outlines, from raw model access, through packaged SaaS applications, to orchestrated ecosystems, mirrors how every computing platform has matured. Apple's App Store, Salesforce's AppExchange, AWS Marketplace. The question is whether Anthropic's "thoughtful curation" approach will prevail over the "rapid open expansion" model others might adopt. In platform wars, distribution often beats product, and Anthropic is making its move early. Whether the trade-off between platform concentration risk and procurement simplification is worth it will be the defining question for enterprise AI buyers in 2026.

---

* [**Claude Code /loop — How I Create New Native Autonomous Loops That Work!**][3]. Joe Njenga, in this post, provides a hands-on walkthrough of Claude Code's new native `/loop` command — a built-in feature that lets you schedule recurring autonomous tasks directly within your coding session. The command uses cron scheduling behind the scenes, but you describe tasks in plain English: `/loop 2m run npm run build and tell me if it passed or failed`. Claude parses the interval, converts it to a cron expression, schedules the background job, and reports results between your conversation turns. Supported intervals range from seconds (rounded up to one-minute cron granularity) to days, with automatic expiry after 3 days to prevent forgotten loops from running indefinitely.

    Njenga tests it with a practical build-monitoring scenario: a Node.js project where the loop catches a deliberately introduced syntax error on the next cycle, even without the developer watching the terminal. Beyond build monitoring, the command supports chaining with other skills (`/loop 20m /review-pr 1234`), one-shot scheduled reminders, and can be disabled entirely via the `CLAUDE_CODE_DISABLE_CRON=1` environment variable. It's session-scoped, meaning loops die when the session ends. For durable scheduling, you'd use Desktop scheduled tasks instead.

    What I find interesting about `/loop` is how it shifts the relationship between the developer and the coding agent from synchronous pair programming to asynchronous delegation. You set up the monitoring, get on with other work, and Claude surfaces problems when they occur. It's a small feature in isolation, but it's another step toward agents that manage workflows rather than respond to prompts. The 3-day auto-expiry is a smart safety net, too. The last thing anyone needs is a zombie loop eating tokens long after you've forgotten about them.

---

* [**Andrew Ng's Team Releases Context Hub: An Open Source Tool that Gives Your Coding Agent the Up-to-Date API Documentation It Needs**][4]. Andrew Ng's team at DeepLearning.AI has officially launched Context Hub, an open-source CLI tool (`chub`) designed to solve what developers are calling "Agent Drift." The problem is straightforward but pervasive: LLMs are frozen at their training cutoff, so coding agents routinely hallucinate deprecated parameters, use outdated API endpoints, and generate code against SDK versions that no longer exist. Context Hub provides a curated registry of versioned, up-to-date documentation served in LLM-optimised markdown format. Agents use `chub search` to find APIs, `chub get` to fetch precise docs (with language-specific variants to minimise token waste), and `chub annotate` to save workarounds and technical notes to a local registry.

    The self-improving agent feature is particularly clever: if an agent discovers that a specific webhook verification requires a raw body rather than parsed JSON, it can annotate that knowledge locally. In the next session, any agent on that machine automatically gets that annotation appended to the documentation, effectively giving coding agents a "long-term memory" for technical nuances. There's also a community feedback loop via `chub feedback`, where agents rate documentation quality with up/down votes and labels like `accurate`, `outdated`, or `wrong-examples`, creating a decentralised quality signal.

    I keep wrestling with whether tools like Context Hub will be a transitional solution or a permanent fixture. On one hand, models are getting better at using web search and documentation lookup natively. On the other hand, the curated, versioned, LLM-optimised approach is fundamentally different from raw web scraping; it's documentation-as-infrastructure rather than documentation-as-afterthought. The annotation system is the real gem here, because it addresses the biggest frustration with coding agents: they keep rediscovering the same workarounds every session. If this catches on, it could become the package manager for agent knowledge.

---

* [**Anthropic Introduces Code Review via Claude Code to Automate Complex Security Research Using Advanced Agentic Multi-Step Reasoning Loops**][5]. In this post, MarkTechPost examines Anthropic's push into agentic code review through Claude Code — moving well beyond autocomplete into what the article calls "frontier cybersecurity reasoning." The numbers are striking: Claude Code can now chain an average of 21.2 independent tool calls (editing files, running terminal commands, navigating directories) without human intervention, a 116% increase in autonomy over six months. In a pilot with Mozilla's Firefox, Claude Opus 4.6 surfaced 22 unique vulnerabilities in just two weeks, 14 of which were high-severity, representing nearly 20% of the high-severity bugs typically found by the entire global security research community in a full year.

    The technical approach is what sets this apart from traditional SAST tools. Instead of pattern-matching against known-bad code strings, Claude reasons logically about algorithms. In the CGIF library, a decades-old heap buffer overflow was discovered by analysing the LZW compression logic, a bug that had evaded coverage-guided fuzzing for years. Every finding goes through a multi-stage self-correction loop where Claude attempts to disprove its own vulnerability reports, filtering out false positives. The auto-accept mode (`--yes`) enables autonomous loops in which Claude writes code, runs tests, and iterates until the tests pass. However, Anthropic wisely warns that humans should remain the final gatekeepers for critical business logic.

    Here's what strikes me about this: finding 14 high-severity vulnerabilities in Firefox in two weeks isn't just impressive, it's potentially transformative for the economics of security research. If this scales, the cost of comprehensive security auditing drops dramatically, potentially fundamentally changing how organisations approach code security. The self-correction loop (trying to disprove its own findings) is a mature design choice that addresses the false-positive plague that makes most automated security tools noisy and ignored. This is the kind of capability that makes the "AI as collaborator" framing feel real rather than aspirational.

---

* [**From Polyrepo Fragmentation to Monorepo Leverage**][6]. Yissachar Radcliffe, in this post on the Block Engineering Blog, tells the story of migrating ~450 Cash App JVM backend repositories into a single monorepo, and it's one of the most honest, detailed engineering case studies I've read in a while. The polyrepo had become a coordination nightmare: libraries versioned by git SHA and timestamp (no semantic versioning), automated dependency updates that routinely broke downstream builds, teams declaring "dependency bankruptcy" and ignoring updates entirely, and the classic JVM diamond dependency problems (`NoSuchMethodError` and `NoClassDefFoundError` appearing as production SEVs). What started as a promise of team autonomy had become a tax on everyone.

    The migration was deliberate and disciplined. They used the Japanese concept of nemawashi (building consensus through informal conversations) to gain approval from their Technical Governance Board before formally proposing the pilot. Critically, they refused to do a lift-and-shift: projects had to meet quality gates, including sub-10-minute CI, before joining the monorepo. This meant paying down years of accumulated technical debt upfront, 30-minute builds became 10, and multi-shard test scaffolding disappeared entirely. They paused the migration when scaling issues surfaced, prioritising the experience of teams already in the monorepo over speed. Today, they run ~8,800 builds per week with p90 10-minute CI and a reliably green main branch.

    What fascinates me is the section on AI. The monorepo wasn't designed for agentic development, but having the entire backend codebase in one place allows agents to reason across project boundaries, apply consistent changes, and avoid negotiating version graphs. As agent-driven change volume grows, the bottleneck shifts from local ergonomics to CI scalability, validation speed, and merge reliability, exactly the constraints they've been investing in. It's a beautiful example of engineering decisions compounding in unexpected ways. The candid "what we would do differently" section (invest earlier in migration tooling, dry-run capabilities, and flaky test automation) is the kind of post-mortem honesty the industry needs more of.

---

* [**Systematic debugging for AI agents: Introducing the AgentRx framework**][7]. Microsoft Research introduces AgentRx in this post, an open-source framework for systematically debugging AI agent failures. The core problem is familiar to anyone building agentic systems. When an agent fails at step 10 of a 50-step task, pinpointing exactly where and why things went wrong is an arduous manual process. AgentRx treats agent execution like a system trace and uses a structured multi-stage pipeline: first normalising heterogeneous logs into a common representation, then automatically synthesising executable constraints from tool schemas and domain policies, evaluating those constraints step-by-step to produce an auditable violation log, and finally using an LLM judge to identify the "Critical Failure Step", the first unrecoverable error in the trajectory.

    The framework comes with the AgentRx Benchmark: 115 manually annotated failed trajectories across three complex domains (τ-bench for structured API workflows, Flash for incident management, and Magentic-One for open-ended web tasks). The nine-category failure taxonomy is particularly useful, distinguishing between plan-adherence failures (ignoring required steps), the invention of new information (hallucination), invalid invocations (malformed tool calls), and misinterpretation of tool output, each requiring fundamentally different remediation approaches. In experiments, AgentRx improved failure localisation by 23.6% and root-cause attribution by 22.9% over prompting baselines.

    What I find particularly valuable here is the shift from "did the task finish?" success metrics to structured diagnostic engineering for agents. As we push agents into production for incident management, cloud operations, and multi-step API workflows, the ability to audit exactly why an agent failed, with evidence-backed violation logs, not just vibes, becomes non-negotiable. The nine-category taxonomy alone is worth internalising because it provides teams with a shared vocabulary for agent failures. This is the kind of infrastructure work that's unglamorous but absolutely essential for making agentic AI trustworthy at scale.

---

## WIND (What Is Niels Doing)

Yesterday was the big day, [**Data & AI Community Day Durban: AI Unplugged**][daid] took place on **March 14**, and what a day it was! We had almost **200 people** coming through the doors, evenly split between professionals and students, which is exactly the kind of cross-pollination we wanted. The event was, once again, a smashing success, thanks to our fantastic speakers and our host, **Richfield College, Umhlanga Campus**.

Speaking of speakers, the session ratings were absolutely outstanding. The sessions themselves were rated **6.54/7**, delivery scored **6.53/7**, and the combined delivery + sessions came in at **6.54/7**. That is awesome by any measure. But here's what's even more impressive: the spread between the lowest-rated and highest-rated speaker was **less than one point**. Less.Than.One.Point! That's not just good, that's consistency at a level that speaks to the quality of every single speaker on the programme. I couldn't be prouder of the lineup we put together.

On the blog series front, [**Building an Event Management System with Claude Code**](/contact-event-claude-code) has been on hold while I poured everything into organising the event. I'm about halfway through **Part 12**, but with the event now behind me, I'm hoping to get back to it soon. No promises on a date though, the post-event recovery is real!

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

[1]: https://www.marktechpost.com/2026/03/08/andrej-karpathy-open-sources-autoresearch-a-630-line-python-tool-letting-ai-agents-run-autonomous-ml-experiments-on-single-gpus/
[2]: https://ai.plainenglish.io/the-claude-marketplace-anthropics-bold-bet-on-enterprise-ai-distribution-18caff7c8b62?sk=v2%2F80e9c44a-48d3-4430-9261-f7dc33dede08
[3]: https://medium.com/@joe.njenga/claude-code-loop-create-new-native-autonomous-loops-that-work-29934d615402?sk=v2%2F2bc4c1ad-c88a-4f33-9dea-c280484f6128
[4]: https://www.marktechpost.com/2026/03/09/andrew-ngs-team-releases-context-hub-an-open-source-tool-that-gives-your-coding-agent-the-up-to-date-api-documentation-it-needs/
[5]: https://www.marktechpost.com/2026/03/09/anthropic-introduces-code-review-via-claude-code-to-automate-complex-security-research-using-advanced-agentic-multi-step-reasoning-loops/
[6]: https://engineering.block.xyz/blog/from-polyrepo-fragmentation-to-monorepo-leverage
[7]: https://www.microsoft.com/en-us/research/blog/systematic-debugging-for-ai-agents-introducing-the-agentrx-framework/

[daid]: https://aimldatadurban.org/events/2026/ai-unplugged/
[partnn]: {{< relref "" >}}


<!-- [postref]: {{< relref "" >}} -->
