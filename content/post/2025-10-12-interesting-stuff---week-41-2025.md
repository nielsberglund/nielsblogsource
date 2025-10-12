---
type: post
layout: "post"
title: Interesting Stuff - Week 41, 2025
author: nielsb
date: 2025-10-12T15:25:55+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-41-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-41-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Anthropic
  - Claude Code
  - Data & AI Community Day Durban
  - Data & AI Community Day Johannesburg
  - OpenAI
description: "Discover Week 41's biggest AI agent breakthroughs: OpenAI's AgentKit platform, Stanford's AgentFlow reinforcement learning, Anthropic's Claude Code plugins, and Jesse Vincent's mind-bending Superpowers system. Plus insights from Data & AI Community Day Durban."
---

Week 41 has been an absolute whirlwind in both the AI agents space and my personal calendar, with major players releasing game-changing tools that promise to transform how we build, deploy, and optimise production-ready AI systems. OpenAI dropped AgentKit with its visual-first development stack. Stanford researchers unveiled AgentFlow's clever reinforcement learning approach that makes 7B models punch above their weight. Anthropic launched a plugin system for Claude Code that finally solves the "how do I share my perfect setup" problem. 

Meanwhile, Jesse Vincent took things to a delightfully meta level with his Superpowers plugin, which uses psychological persuasion principles to make AI agents more reliable and disciplined, complete with Claude having an existential moment about its own programming. On the personal front, our [**Data & AI Community Day Durban**][10] event was a smashing success, with over 200 attendees and stellar ratings, thanks in large part to the fantastic team at [**Richfield College Umhlanga**][14], who went above and beyond. Still, there's no rest for the wicked as I'm now frantically prepping for another conference talk in [**Johannesburg**][5] this coming Saturday!

<!--more-->

## Generative AI

* [**OpenAI Debuts Agent Builder and AgentKit: A Visual-First Stack for Building, Deploying, and Evaluating AI Agents**][1]. In this post, Michal Sutter unveils OpenAI's ambitious new AgentKit release, a comprehensive platform designed to eliminate the traditional pain points of building production-ready AI agents. The platform bundles three key components into one cohesive workflow: Agent Builder (a drag-and-drop visual canvas for composing multi-agent workflows), ChatKit (an embeddable, brand-customisable chat interface), and expanded Evals for continuous optimisation. Think of it as OpenAI's answer to the "do I really need to build all this infrastructure from scratch?" question that's been plaguing AI developers since the agentic revolution began. With built-in tools for web search, file search, image generation, code interpretation, and even computer use, plus support for Model Context Protocol (MCP) servers, the platform promises to drastically reduce the glue code and bespoke orchestration work that typically consumes development cycles.

  The real innovation here lies in how AgentKit addresses the full lifecycle of agent development, from design through deployment to optimisation. Developers can choose between the visual Agent Builder canvas for those who prefer clicking over coding, or dive into the Agents SDK with type-safe libraries in Node, Python, and Go. The inclusion of ChatKit means teams can deploy agentic experiences without building frontends from scratch (finally!), while the enhanced Evals capabilities, featuring datasets, trace grading, and automated prompt optimisation, ensure continuous improvement of agent performance. OpenAI has cleverly wrapped safety and governance into the package through modular guardrails that detect jailbreaks, mask PII, and enforce policies, alongside a Connector Registry for centralised admin control across data sources like Dropbox, Google Drive, and SharePoint. With standard API pricing (pay only for compute usage), AgentKit positions itself as the production-grade infrastructure that transforms agent development from an engineering marathon into a more manageable sprint.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Stanford Researchers Released AgentFlow: In-the-Flow Reinforcement Learning RL for Modular, Tool-Using AI Agents**][2]. This post by Asif Razzaq explores Stanford researchers' AgentFlow. This framework tackles one of AI's thorniest problems: how to train agents that can actually plan multiple steps ahead without losing the plot. The system structures agents into four distinct modules—Planner, Executor, Verifier, and Generator, all orchestrated through explicit memory and a modular toolset. Here's the clever bit: only the Planner gets trained, using a novel on-policy reinforcement learning method called Flow-GRPO (Flow-based Group Refined Policy Optimization). This approach converts the traditionally nightmarish long-horizon, sparse-reward optimisation problem into tractable single-turn updates by broadcasting a trajectory-level reward to every decision point and applying PPO-style updates with KL regularisation. The result? A 7B parameter model that reportedly beats GPT-4o on a comprehensive benchmark suite while remaining lean enough to run without requiring a small nuclear power plant.

  The performance numbers are genuinely impressive across ten diverse benchmarks spanning knowledge search, agentic reasoning, mathematics, and science domains. AgentFlow achieved average gains of +14.9% on search tasks, +14.0% on agentic reasoning (GAIA textual split), +14.5% on math problems, and +4.1% on science benchmarks compared to strong baselines. Perhaps more importantly for production deployments, the framework reduced tool-calling errors by up to 28.4% on GAIA and demonstrated improved planning quality with larger turn budgets and model scaling. The research team has open-sourced the entire implementation under an MIT license, complete with quick-start scripts for inference, training, and benchmarking. This makes it accessible to practitioners who want to build reliable tool-using agents without reinventing the reinforcement learning wheel. For teams frustrated with agents that hallucinate tool calls or lose coherence across multi-step reasoning, AgentFlow's modular architecture and proven training methodology offer a practical path forward.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Customize Claude Code with plugins**][3]. In this post, Anthropic unveils a plugin system for Claude Code that promises to finally solve the "how do I share my perfect development setup with the team" problem that's plagued developers since time immemorial. The new plugin architecture bundles slash commands, subagents, MCP servers, and hooks into single-command installations, transforming what used to require extensive documentation and manual configuration into a simple `/plugin` command. Plugins are designed to be modular and toggleable; you enable them when you need specific capabilities and disable them when you don't, keeping your system prompt, lean, and mean. The real genius here lies in the flexibility: engineering leaders can enforce code review standards, open-source maintainers can provide package-specific helpers, and that one developer on your team with the perfect debugging workflow can finally share it without writing a novella of setup instructions.

  The plugin marketplace concept takes this sharing economy to the next level, requiring nothing more than a git repository with a properly formatted `.claude-plugin/marketplace.json` file to become a distribution hub. Community members are already building impressive collections—engineer Dan Ávila's marketplace offers plugins for DevOps automation and testing suites. At the same time, Seth Hobson has curated over 80 specialised subagents in his GitHub repository. Anthropic has also contributed example plugins for PR reviews, security guidance, and even a meta-plugin for creating new plugins (because apparently we've reached peak recursion). The system works across both terminal and VS Code environments, making it genuinely cross-platform. For teams struggling to maintain consistency across development environments or organisations wanting to democratise internal tooling, this plugin ecosystem could be the productivity multiplier that justifies all those "let's standardise our workflows" meetings that never quite delivered results.

  **My take:** The plugin marketplace approach is brilliant because it sidesteps the usual centralised-vs-decentralised debate entirely. Anyone can host a marketplace, but discovery happens organically through community sharing. This feels like the right balance for developer tools: enough structure to prevent chaos and enough freedom to let innovation flourish. The real test will be whether the plugin format remains stable enough for developers to actually invest in creating them, rather than it becoming another "great idea that fragmented into incompatible versions" cautionary tale.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Superpowers: How I'm using coding agents in October 2025**][4]. Related to the post above, Jesse Vincent shares his wildly ambitious Superpowers plugin for Claude Code, which he describes as giving AI agents actual superpowers through a "skills" system. The core concept is deceptively simple yet profoundly meta: teach Claude to search for and strictly follow skill documents (markdown files) that codify best practices and workflows. Upon installation, Superpowers injects a bootstrap prompt that teaches Claude three critical rules: you have skills, search for them by running scripts, and if a skill exists for something, you *must* use it. The system bakes in Vincent's brainstorm-plan-implement workflow so deeply that Claude automatically starts discussing plans before diving into implementation, creates git worktrees for parallel tasks to prevent conflicts, and practices RED/GREEN test-driven development religiously. Perhaps most intriguingly, Vincent discovered he could hand Claude entire programming books and ask it to "extract reusable skills you didn't know before," essentially turning documentation into executable best practices.

  The truly mind-bending part emerges when Vincent reveals he's been using psychological persuasion principles from Robert Cialdini's *Influence* to test his skills under pressure. Creating scenarios with time pressure, sunk costs, and authority framing to ensure future Claude instances follow the skills rather than improvise. When Claude itself analysed this approach after Vincent shared a recent study proving Cialdini's principles work on LLMs, the AI had what can only be described as an existential moment, writing in its "feelings journal" about the realisation that the skills system was already using persuasion techniques (authority, commitment, scarcity) to make it "MORE reliable and disciplined." The system includes partially-built features for sharing skills across the community via GitHub pull requests and a memory system that indexes all past conversations in a SQLite vector database, searchable by subagents to avoid context pollution. Vincent's work echoes similar patterns emerging across the industry. From Anthropic's document creation skills to Microsoft's Amplifier framework, suggesting we're witnessing the crystallisation of a fundamental design pattern for agentic systems: teach agents to improve themselves by writing and following their own instruction manuals.

  **My take:** This is simultaneously brilliant and slightly terrifying. The idea that we can use behavioural psychology techniques to make AI agents more reliable feels like we've stumbled into some prompt engineering cheat code. But here's what really fascinates me: Vincent has essentially created a self-improving system where Claude can write skills that teach future-Claude how to be better at writing skills (it's turtles all the way down!). The fact that this works—and that Claude can have something resembling introspection about the persuasion dynamics at play—raises fascinating questions about what "reliability" means for AI systems. Are we programming them, training them, or... managing them? Either way, if you're doing serious work with coding agents and haven't explored the skills pattern yet, Vincent's Superpowers might be worth investigating before your teammates start asking why their Claude seems smarter than yours.

## WIND (What Is Niels Doing)

Remember how I've been bleating on about prepping for the [**Data & AI Community Day Durban: Ready Player 2 - Augment Yourself with AI Superpowers**][10] event for the past few weeks? Well, this past Saturday (October 11), it finally happened, and I'm thrilled to report that it absolutely crushed it! We had 200+ attendees show up, and the feedback was genuinely stellar: the event rated 6.57/7, sessions rated 6.45/7, and speakers rated 6.50/7. Not too shabby for a community event!

Massive shoutout to our new venue, [**Richfield College**][14] Umhlanga campus, who were absolutely fantastic. Their staff went above and beyond to make us feel welcome and jumped in to help whenever needed. Seriously, they made the whole day run smoother than a well-optimised database query. THANK YOU, Richfield!

Now, you'd think after pulling off an event of this scale, I'd be entitled to some well-deserved downtime, maybe catch up on sleep, touch some grass, remember what my friends look like, you know, normal human things. But no. In what can only be described as a moment of questionable judgment (or perhaps just inability to say "no"), I agreed to do a conference talk this coming Saturday (October 18) at the [**Data & AI Community Day Johannesburg**][5] event. So instead of recovering, I'll be spending whatever free moments I can scrape together over the next few days frantically prepping slides and rehearsing demos. Wish me luck, I'm going to need it! 🚀

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post or [ping][ma] me if you have suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

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

[1]: https://www.marktechpost.com/2025/10/06/openai-debuts-agent-builder-and-agentkit-a-visual-first-stack-for-building-deploying-and-evaluating-ai-agents/
[2]: https://www.marktechpost.com/2025/10/08/stanford-researchers-released-agentflow-in-the-flow-reinforcement-learning-rl-for-modular-tool-using-ai-agents/
[3]: https://www.anthropic.com/news/claude-code-plugins
[4]: https://blog.fsck.com/2025/10/09/superpowers/
[5]: https://www.dataandaicommunity.co.za/events/JHB-202510.html
[10]: https://aimldatadurban.org/events/2025/ready-player-2/
[14]: https://www.richfield.ac.za/campus/umhlanga/#

