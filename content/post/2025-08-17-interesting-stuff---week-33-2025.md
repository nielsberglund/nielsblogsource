---
type: post
layout: "post"
title: Interesting Stuff - Week 33, 2025
author: nielsb
date: 2025-08-17T08:43:04+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-33-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-33-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Data & AI Community Day Durban
  - GitHub Copilot
  - AI-assisted Coding
description: "Week 33 2025 Tech Roundup: AI agents evolve with 9 agentic workflow patterns, GPT-5 transforms GitHub Copilot development, R-Zero enables self-teaching AI systems, and hybrid search beats vector-only approaches. Essential reading for developers navigating the shift from AI-assisted to conversational development workflows."
---

This week brings us to a fascinating inflexion point in AI development, where we're witnessing the maturation from experimental tools to genuinely transformative systems. From Michal Sutter's breakdown of nine agentic workflow patterns that could fix the 85% failure rate plaguing AI agents, to R-Zero's groundbreaking approach of AI systems teaching themselves without human supervision, we're seeing the architectural foundations for truly autonomous AI emerge. 

Meanwhile, the practical side is advancing rapidly with GPT-5's integration into GitHub Copilot, enabling 60-second game development and hybrid search systems, proving that sometimes the best solution isn't the shiniest new technique, but the right combination of existing ones. These developments collectively suggest we're crossing the threshold from AI-assisted workflows to genuinely conversational, intent-driven development environments.

<!--more-->

## Generative AI

* [**9 Agentic AI Workflow Patterns Transforming AI Agents in 2025**][1]. Michal Sutter, in this post, delivers a masterclass on why your AI agents are probably failing spectacularly, and it's not because they're not smart enough. The brutal truth? That 85% failure rate plaguing AI agent implementations isn't a bug; it's a feature of outdated "single-step thinking" that expects one model call to solve complex, multi-layered problems.

  This comprehensive deep dive reveals nine game-changing agentic workflow patterns that are transforming how we build production-ready AI systems in 2025. From Sequential Intelligence patterns like Prompt Chaining and Plan-and-Execute workflows, to Parallel Processing powerhouses like Orchestrator-Worker setups, Sutter maps out the architectural blueprints that separate amateur hour from enterprise-grade AI automation.

  The Intelligent Routing section particularly caught my attention; the Evaluator-Optimiser pattern creates a continuous feedback loop where agents literally learn to critique and improve their own performance. It's like having a built-in code review buddy that never gets tired of making your AI better. Meanwhile, the Self-Improving Systems category introduces genuinely autonomous workflows that operate in perpetual loops, leveraging environmental feedback for continuous evolution.

  What makes this post essential reading is its practical focus. Rather than theoretical hand-waving, Sutter provides concrete implementation guidance around modularity, tool integration, and feedback loops. The statistics are eye-opening, too; Gartner predicts that by 2028, at least 33% of enterprise software will depend on agentic AI, making these patterns not just useful but mission-critical.

  The shift from isolated model calls to orchestrated intelligence isn't just an incremental improvement; it's the architectural foundation that separates functional AI systems from the 85% that crash and burn in production. If you're building AI agents and still thinking in single steps, this post should be your wake-up call.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Developers, Reinvented**][2]. Thomas Dohmke, in this post, provides a fascinating deep dive into how software developers are navigating what might be the most significant career transformation since the invention of programming itself. Based on interviews with 22 AI-forward developers, this research reveals a surprisingly optimistic picture of an industry amid complete reinvention.

  The journey from sceptic to strategist follows a clear four-stage evolution that's both reassuring and revolutionary. Starting with the inevitable "pretty cool, but gimmicky" phase (we've all been there), developers progress through Explorer and Collaborator stages before reaching the ultimate AI Strategist level, where they're building elaborate multi-agent workflows and treating AI as a genuine partner rather than a fancy autocomplete tool.

  What struck me most about this research is the mindset shift these developers have undergone. They're not talking about "time saved" as the primary benefit—they're talking about dramatically expanding their ambitions. Instead of optimising for efficiency, they're optimising for scope and complexity. That's a fundamentally different value proposition, and it explains why many of these developers are happily paying for premium AI subscriptions despite the costs.

  The post introduces the concept of "realistic optimists": developers who acknowledge the disruption while embracing it as a growth opportunity. One developer's quote particularly resonated: "Maybe we become less code producers and more code enablers. My next title might be Creative Director of Code." That's not just a job description change; that's a complete reimagining of what it means to be a developer.

  The skills evolution is equally compelling. AI fluency becomes non-negotiable, but so does delegation and agent orchestration, essentially, learning how to be an effective manager of AI workers. The emphasis on verification and quality control means developers need to become expert code critics, not just code writers. And the push toward product understanding suggests we're moving toward more holistic, systems-thinking professionals.

  Perhaps most importantly, this transformation has significant implications for computer science education. Teaching syntax memorisation and rote API knowledge is becoming obsolete when AI can write the code faster than humans can type it. The future belongs to developers who can model systems, anticipate edge cases, and translate ambiguity into structure—the uniquely human skills that complement AI's raw coding power.

  The timeline predictions are bold: half the interviewed developers expect 90% AI-written code within 2 years, with the other half giving it 5 years. Whether those timelines prove accurate or not, the direction is clear, and these early adopters are already living in that future.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Vector Search Isn't the Answer to Everything. So What Is? A Technical Deep Dive**][3]. In this post, Jacky Liang delivers a technical tour de force that's equal parts "I told you so" and practical roadmap. Following up on his viral piece about Cursor potentially ditching vector search, Liang doubles down with hard data and a complete implementation guide for hybrid search systems.

  The opening bombshell: Boris Cherny and Cat Wu, the Claude Code leads that Cursor hired, returned to Anthropic after exactly two weeks, setting the stage for what feels like the AI industry's version of a mic drop. While we can only speculate about what they saw during their brief Cursor stint, the timing certainly adds weight to Liang's core argument about vector search limitations.

  The crux of the argument is brilliantly simple: similarity ≠ relevance. When your AI code agent needs `getUserById` but vector search returns `getUserByName`, `getUserByEmail`, and eight other semantically similar but functionally useless results, you've got a precision problem. Users don't want "most similar": they want exactly what they asked for, and vector search's fuzzy matching often fails spectacularly at this basic requirement.

  Liang's solution is hybrid search plus reranking: cast a wide net with multiple search techniques (exact matching, full-text search, and semantic search), then use sophisticated reranking to surface what's actually relevant. The implementation using PostgreSQL, `pgvector`, and Cohere's reranking API is remarkably practical: this isn't theoretical hand-waving but production-ready code you could deploy today.

  The benchmark results are compelling: 23% improvement in precision and 37% improvement in recall compared to vector-only search. But the real win is in edge cases where single-search methods completely fail. When searching for "people who died due to carbon monoxide poisoning," vector search buried the most relevant article at position #5, while hybrid search nailed it at #1 with a 0.987 relevance score.

  What makes this piece particularly valuable is the forward-looking discussion of "agentic search" and "context engineering." Instead of asking "what search technique should I use?", the emerging paradigm asks "what context does my LLM need?" This shift from tool-centric to outcome-centric thinking represents a fundamental evolution in how we approach AI system design.

  The roadmap section reads like a battle plan for CTOs: sign up for Tiger Cloud, implement the three core search functions, add reranking, A/B test everything, then layer on agentic patterns. It's refreshingly practical in an industry that often gets lost in theoretical complexity.

  This isn't just about search—it's about the maturation of AI systems from proof-of-concept demos to production-grade tools that actually solve real problems. The vector search hype cycle is clearly entering its "trough of disillusionment" phase, but hybrid approaches like this represent the path to genuine productivity gains.

  **Final thought:** *The timing of this piece, coming right after the Claude Code team's dramatic return to Anthropic, makes it feel like required reading for anyone building AI search systems. Sometimes the best technology isn't the shiniest—it's the one that actually works when users need exactness, not just similarity.*

<div align="center">_ _ _ _ _ _ _</div></br>

* [**GPT-5 in GitHub Copilot: How I built a game in 60 seconds**][4]. Kedasha Kerr, in this post, captures the exact moment when AI coding assistance stopped feeling like autocomplete and started feeling like magic. Watching her build a functional Magic Tiles game in under 60 seconds during a live stream perfectly demonstrates why GPT-5's integration into GitHub Copilot represents a genuine leap forward in developer productivity.

  The key insight here isn't just the speed, it's the methodology. Kerr's "spec-driven development" approach (asking GPT-5 to create product requirements before writing code) showcases how effective prompt engineering has become an essential developer skill. By first asking "Do you know the game Magic Tiles? Can you describe it in simple MVP terms?" she gave GPT-5 enough context to deliver a cohesive, functional game rather than just scattered code snippets.

  What's particularly impressive is that when she said "Build this" with no framework specifications or technology stack requirements, GPT-5 made intelligent architectural decisions: HTML/CSS/JavaScript for the MVP, canvas-based game mechanics, proper input handling, scoring systems, and speed progression. That's the kind of contextual reasoning that separates advanced models from their predecessors.

  The real game-changer, though, is the GitHub Model Context Protocol (MCP) server integration. This isn't just about connecting AI to GitHub—it's about eliminating the friction between having an idea and taking action. Creating a repository with natural language ("Can you create a repository for this project called teenyhost?"), bulk issue creation from brainstorming sessions, and automating Git workflows represent a fundamental shift from interface-driven to intent-driven development.

  I'm particularly excited about the "human-in-the-loop automation" concept Kerr describes. When Copilot wanted to push directly to the main branch, she could cancel that action; the AI handles the tedious parts while developers make the critical decisions. That balance feels just right for maintaining both productivity and control.

  The setup simplicity is refreshing, too. Creating a `.vscode/mcp.json` file, running through GitHub OAuth, and suddenly having natural language control over your entire GitHub workflow? That's the developer experience that actually gets adopted rather than abandoned after a week of tinkering.

  Looking ahead, the concept of "context engineering" (popularised by Simon Willison) that Kerr mentions represents the next evolution in how we think about AI integration. Instead of asking "what search technique should I use?" or "what model should I choose?", we're moving toward "what context does my AI need to solve this problem?" That's a more sophisticated, outcome-oriented approach that suggests the tooling is finally catching up to the potential.

  The combination of GPT-5's reasoning capabilities and MCP's ecosystem integration feels like we're crossing a threshold from "AI-assisted development" to "conversational development workflows." The tools are here, accessible, and ready to fundamentally change how we build software.

  **MyThoughts:** *Great timing on this post; it perfectly captures the excitement of trying genuinely breakthrough tools rather than incremental improvements. The 60-second game build might be the new "hello world" for demonstrating AI coding capabilities.*

<div align="center">_ _ _ _ _ _ _</div></br>

* [**R-Zero: A Fully Autonomous AI Framework that Generates Its Own Training Data from Scratch**][5]. Sajjad Ansari unveils, in this post, what might be the most fascinating development in AI training methodology we've seen this year. R-Zero represents a fundamental departure from the human-dependent training paradigms that have dominated machine learning, introducing a fully autonomous framework where AI literally teaches itself by generating its own curriculum.

  The core innovation here is elegantly profound yet straightforward: instead of relying on massive human-annotated datasets, R-Zero creates a co-evolutionary dynamic between two AI instances. The "Challenger" generates increasingly complex reasoning problems at the edge of the "Solver's" capabilities, while the Solver learns to tackle these progressively more complex challenges. It's like having an AI tutor that perfectly calibrates difficulty levels in real-time.

  What makes this approach particularly clever is the reward mechanism. The Challenger is incentivised to create problems where the Solver achieves roughly 50% accuracy; that sweet spot where learning is maximised. The model is either too easy and lacks growth, or too hard and fails to extract meaningful patterns. This uncertainty-driven curriculum ensures the AI is constantly training at its optimal challenge level.

  The technical sophistication is impressive. Group Relative Policy Optimisation (GRPO) normalises rewards relative to response groups, while pseudo-label quality control filters out ambiguous problems. The system includes repetition penalties to ensure diversity and format checks for data quality—essentially building all the safeguards that human curators would typically provide.

  But the real breakthrough is in the results. Across seven mathematical reasoning benchmarks, three iterations of R-Zero improved a Qwen3-8B model from 49.18 to 54.69 average score. More importantly, these gains generalised beyond mathematics to general reasoning tasks, with overall averages jumping from 34.49 to 38.73 on broader benchmarks like MMLU-Pro and SuperGPQA.

  This represents a paradigm shift from data-limited to potentially unlimited training. Traditional approaches are fundamentally bottlenecked by human knowledge and annotation capacity. R-Zero suggests a path toward AI systems that can genuinely self-improve beyond human-curated constraints—approaching what researchers call "open-ended AI reasoning."

  The implications extend far beyond technical benchmarks. Suppose AI systems can reliably generate their own high-quality training data. In that case, it removes one of the most significant constraints on model development: the need for massive, expensive, human-labelled datasets. This could democratise advanced AI training and accelerate progress in reasoning capabilities.

  The timing feels significant, too. As we bump against the limits of internet-scale text data for training foundation models, techniques like R-Zero offer a complementary path forward—not just scaling up existing data, but creating entirely new, high-quality synthetic training curricula.

  While the current focus is on mathematical reasoning, the framework's generalizability to other domains could be transformative. Imagine AI systems that can self-evolve in coding, scientific reasoning, or complex problem-solving without human supervision.

## WIND (What Is Niels Doing)

Earlier this week, I posted the second "episode" in my series, building a custom contact and event management system using Claude Code, Anthropic's AI-assisted command-line development tool:

* [**Building an Event Management System with Claude Code: Part 2 - IDE Integration and Advanced Features**][6]. The post details integrating Claude Code with VS Code, including WSL setup for Windows users, enabling AI assistance within the editor. It introduces the `CLAUDE.md` file for project context and demonstrates using Claude Code to understand codebases and add functionality, such as implementing event API endpoints. The article highlights context-aware development, team onboarding, and using `think` commands for thoughtful analysis.

I am busy working on the next part of the series, which will focus on using Claude Code's planning and architectural capabilities to design the event management system. Don't forget to visit my curated Claude Code [**YouTube playlist**][7] for additional learning materials and tutorials.

Last week, I said that we were actively searching for venues for our upcoming [**Data & AI Community Day Durban**][8] events:

![](/images/posts/richfield-logo-1.jpg)

**Figure 1:** *Richfield College*

I am excited to announce that we have secured a venue for our upcoming [**Data & AI Community Day Durban**][8] events: the stunning [**Richfield College Umhlanga Campus**][12]!

A massive **THANK YOU** to Richfield for opening your doors to our ever-growing community. Special shout-out to [**Nataleigh Strydom**][10] and [**Deneshin Pillay**][11] from [**BETSoftware**][9] – without your behind-the-scenes wizardry, this wouldn't have been possible. You two are the MVPs we didn't know we needed, but are so glad we have.

The date of the next event is set to **October 11**! Call for Speakers opens soon – so polish up those talk ideas! Registrations will follow shortly after – keep your eyes on this space.

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

[1]: https://www.marktechpost.com/2025/08/09/9-agentic-ai-workflow-patterns-transforming-ai-agents-in-2025/
[2]: https://ashtom.github.io/developers-reinvented
[3]: https://www.tigerdata.com/blog/vector-search-isnt-the-answer-to-everything-so-what-is-a-technical-deep-dive
[4]: https://github.blog/ai-and-ml/generative-ai/gpt-5-in-github-copilot-how-i-built-a-game-in-60-seconds/
[5]: https://www.marktechpost.com/2025/08/15/r-zero-a-fully-autonomous-ai-framework-that-generates-its-own-training-data-from-scratch/
[6]: https://nielsberglund.com/post/2025-08-13-building-an-event-management-system-with-claude-code-part-2---ide-integration-and-advanced-features/
[7]: https://www.youtube.com/playlist?list=PLratGHE9a0TQfk9Qo5WLnTyttfpoWOjNZ
[8]: https://aimldatadurban.org/
[9]: https://betsoftware.com/
[10]: https://www.linkedin.com/in/nataleigh-strydom-70566a121/
[11]: https://www.linkedin.com/in/deneshinpillay/
[12]: https://www.richfield.ac.za/campus/umhlanga/