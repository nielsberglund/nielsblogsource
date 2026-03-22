---
type: post
layout: "post"
title: Interesting Stuff - Week 12, 2026
author: nielsb
date: 2026-03-22T06:15:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-12-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-12-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - AI Agents
  - NVIDIA
  - NemoClaw
  - OpenClaw
description: "Week 12 tech roundup: Claude Code Agent Skills 2.0 turns instructions into programmable agents, NVIDIA's NemoClaw secures OpenClaw for enterprise deployment, and Claude Code channels push real-time events into your coding session."
---

This week, it's all about AI agents growing up: from programmable skills that turn your coding assistant into a full agent platform, to enterprise security stacks that finally make autonomous agents safe for corporate networks. Whether you're building skills for Claude Code or trying to convince your security team that AI agents won't burn down the infrastructure, there's something here for you.

We also look at a brand-new Claude Code feature that lets external events, Telegram messages, CI webhooks, Discord pings, flow directly into your running session, turning Claude from a tool you talk to into a tool that listens.

<!--more-->

---

## Generative AI

* [**Claude Code Agent Skills 2.0: From Custom Instructions to Programmable Agents**][1]. In this post, Rick Hightower delivers a comprehensive deep dive into Claude Code's reimagined skill system, arguing that what was once a collection of simple markdown instructions has become a full-blown agent-programming platform. The key evolution is the unification of commands and skills: skills can now spawn isolated subagents with their own 200,000-token context windows via the `context: fork` frontmatter, inject live data into prompts using shell command preprocessing (the `!` backtick syntax), restrict tool access, override models, and hook into lifecycle events. Four bundled skill-like commands ship out of the box, including `/batch`, which decomposes large-scale codebase changes into 5–30 independent units, spawns parallel agents in separate git worktrees, and produces individual pull requests.

  Hightower walks through the full anatomy of a skill, directory structure, frontmatter reference, permission controls, and the invocation matrix that determines whether you, Claude, or both can trigger a skill. He also covers the Agent Skills open standard at agentskills.io, which makes skills portable across AI tools rather than locked to Claude Code. The testing section is particularly practical: triggering tests (does the skill load when it should?), functional tests (does it produce correct output?), and A/B risk-quality comparisons that measure whether the skill actually helps or burns tokens.

  What fascinates me about Skills 2.0 is how it reframes the relationship between developer and AI assistant. We've gone from "give Claude instructions" to "program Claude's behaviour," and the difference is not cosmetic. Subagent execution, dynamic context injection, and granular permissions are the primitives of an agent runtime, not enhancements for a chatbot. Rick's observation that he canonicalises mastered workflows as agentic skills, "so I don't have to remember the secret prompts and magic spells", captures the real shift: we're not writing prompts anymore, we're writing programs that happen to run on language models.

---

* [**Nvidia bets on OpenClaw, but adds a security layer - how NemoClaw works**][2]. This post by Radhika Rajkumar on ZDNET covers NVIDIA's big play at GTC 2026: NemoClaw, a security and infrastructure stack designed to make OpenClaw, the viral open-source AI agent framework, safe enough for enterprise deployment. Jensen Huang opened the keynote by asking, "What's your OpenClaw strategy?" and then answered with NemoClaw, which bundles NVIDIA's new OpenShell runtime (a sandboxed environment co-built with CrowdStrike, Cisco, and Microsoft Security), the Nemotron open model family for local inference, and a privacy router that strips PII from cloud model calls. The entire stack installs in a single command and runs on any platform.

  The larger narrative Rajkumar draws out is Huang's vision of "agents-as-a-service" (AaaS) replacing software-as-a-service, with NemoClaw providing the governance layer that enables that transition for enterprises. NVIDIA also announced the Nemotron Coalition, a collaboration with Mira Murati's Thinking Machines Lab, Perplexity, Cursor, and Mistral AI to co-develop open-source models on NVIDIA DGX Cloud. The coalition's first output will be a jointly trained open model that will serve as the foundation for NVIDIA's Nemotron 4 family.

  Here's what strikes me: NVIDIA is essentially positioning itself as the Red Hat of agentic AI, the company that takes a powerful but risky open-source project and wraps it in the enterprise governance, security, and support that corporate buyers need. Whether that analogy holds depends on how fast NemoClaw matures from alpha to production-ready, but the strategic intent is unmistakable. The fact that launch partners include Adobe, Salesforce, CrowdStrike, and Google suggests this isn't a speculative bet: it's a coordinated industry move.

---

* [**NVIDIA NemoClaw Explained: How It Secures OpenClaw AI Agents for Enterprise Use**][3]. Divy Yadav provides a technically detailed companion piece to the ZDNET coverage, focusing on exactly how NemoClaw's security layers work under the hood. The article opens with context that makes the need visceral: OpenClaw gathered 250,000+ GitHub stars in roughly 60 days, but a critical vulnerability (CVE-2026-25253, CVSS 8.8) enabled full remote code execution via a malicious webpage, and Meta restricted employees from running it on company devices. NemoClaw addresses this with four security layers: network (blocks unauthorised outbound connections), filesystem (restricts reads/writes to sandboxed directories), process (blocks privilege escalation), and inference (intercepts and routes every model API call),  each locked at different points in the sandbox lifecycle.

  The practical governance details are what differentiate this from the ZDNET piece. Yadav explains how the sandbox blueprint is versioned, enabling compliance teams to diff policy changes, roll back to previous states, and maintain audit trails. He also covers the "learn from real behaviour" approach: when an agent attempts to reach an unlisted host, OpenShell surfaces it in the operator terminal for approval or denial, and approved hosts get added to the policy in the future. The installation walkthrough (fresh OpenClaw installation required, `nemoclaw host` CLI as primary interface, dual-layer error diagnostics) is useful for anyone considering an actual deployment.

  I keep wrestling with the tension at the heart of NemoClaw's value proposition: it doesn't unlock new capabilities; it unlocks OpenClaw where OpenClaw was blocked. That's a genuinely important distinction. For individual developers experimenting on personal machines, NemoClaw is overhead. For enterprises with compliance requirements in healthcare, finance, or government, it's potentially the key that gets AI agents past the security team's veto. Yadav's framing of OpenClaw as "a brilliant new employee who will do anything asked" and NemoClaw as "the employment contract, access badge, and security clearance" is the most useful mental model I've seen for understanding where this fits.

---

* [**Push events into a running session with channels**][4]. In this post from the Claude Code documentation, Anthropic introduces channels, a new research preview feature (requiring Claude Code v2.1.80+) that lets MCP servers push real-time events into a running Claude Code session. Unlike integrations that spawn fresh cloud sessions or require polling, channels deliver events directly into your existing local session: a CI failure notification, a Telegram message from your phone, a Discord ping from a teammate, or a webhook from your deploy pipeline. Channels can be two-way, so Claude reads the incoming event and replies back through the same channel, effectively turning Claude Code into a chat bridge between your development environment and external platforms.

  The setup is plugin-based: install a channel plugin (Telegram and Discord ship in the research preview), configure credentials, restart with the `--channels` flag, and pair your account via a verification code. Security is handled through sender allowlists; only paired IDs can push messages, and everyone else is silently dropped. For Team and Enterprise plans, channels are disabled by default and must be explicitly enabled by an admin. The documentation also introduces `fakechat`, a localhost demo channel that lets you test the flow without connecting to any external service.

  What I find exciting about channels is how they complete a picture that's been forming over the past few months. We've had Claude Code on the web for async delegation, Remote Control for steering sessions from your phone, and `/loop` for scheduled autonomous tasks. Channels add the missing piece: reactive, event-driven interaction where external systems push into Claude rather than Claude pulling from them. The Telegram chat bridge use case alone, ask Claude something from your phone and get an answer while it works against your real local files, is the kind of workflow that makes the "AI as always-available collaborator" vision tangible rather than theoretical.

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

[1]: https://pub.towardsai.net/claude-code-agent-skills-2-0-from-custom-instructions-to-programmable-agents-ab6e4563c176?sk=v2%2F8ce75609-7bee-44cd-aef5-468146ad20a2
[2]: https://www.zdnet.com/article/nvidia-openclaw-nemoclaw-security-stack-gtc-2026/
[3]: https://pub.towardsai.net/nvidia-nemoclaw-explained-how-it-secures-openclaw-ai-agents-for-enterprise-deployment-6a606c2ddc33?sk=v2%2Ff02e22c5-51fb-4380-b2bf-ff7fdffb86b4
[4]: https://code.claude.com/docs/en/channels


<!-- [postref]: {{< relref "" >}} -->
