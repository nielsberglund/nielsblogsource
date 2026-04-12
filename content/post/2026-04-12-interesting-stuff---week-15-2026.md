---
type: post
layout: "post"
title: Interesting Stuff - Week 15, 2026
author: nielsb
date: 2026-04-12T06:15:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-15-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-15-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - Claude Mythos
  - Project Glasswing
  - AI Agents
  - .NET
description: "Week 15 tech roundup: Claude Code Unpacked visualises the full 519K-line codebase, Absurd goes to production as durable execution on Postgres, Anthropic launches Project Glasswing with Claude Mythos finding zero-days in every major OS, the Advisor Tool makes cheap models think like Opus, and building SQLite devtools with AI in three months."
---

What a packed week. Anthropic dominated the headlines with Project Glasswing, a coalition with AWS, Apple, Google, Microsoft, and others using Claude Mythos to find zero-day vulnerabilities in every major operating system and browser. But the quieter stories this week are just as fascinating: Armin Ronacher reports on running his Postgres-native durable execution system in production, someone builds the SQLite devtools the industry has needed for a decade in just three months with AI, and Anthropic ships an Advisor Tool that lets cheap models consult Opus mid-generation for a fraction of the cost.

We also look at practical guides for running Claude Code agents in parallel, a visual walkthrough of Claude Code's 519K-line codebase, and a .NET library that converts anything to Markdown for your RAG pipelines.

<!--more-->

---

## .NET

* [**Convert Anything to Markdown in .NET — Meet ElBruno.MarkItDotNet**][3]. Bruno Capuano (El Bruno), in this post, introduces ElBruno.MarkItDotNet: a .NET library that converts files to clean Markdown, designed as the C# equivalent of Python's `markitdown` but with dependency injection, streaming support, and a plugin architecture. The core package handles 12+ formats out of the box: plain text, JSON, HTML, URLs (fetches and converts web pages), Word DOCX (headings, tables, links, images, footnotes), PDF (word-level extraction with heading detection), CSV/TSV (Markdown tables), XML, YAML, RTF, EPUB, and images. Satellite packages add Excel spreadsheets, PowerPoint slides, AI-powered OCR and image captioning via Microsoft.Extensions.AI, and local audio transcription with Whisper.

  The streaming API using `IAsyncEnumerable<string>` is a thoughtful touch for processing large documents without loading them entirely into memory, and the DI registration (`services.AddMarkItDotNet()`) makes it drop-in for ASP.NET applications. The extensibility story is clean: implement `IMarkdownConverter` with your supported extensions and conversion logic, or bundle multiple converters into an `IConverterPlugin`. For anyone building RAG pipelines, AI preprocessing workflows, or document ingestion systems in .NET, this fills a surprisingly empty gap.

---

## Databases

* [**Absurd In Production**][2]. This post by Armin Ronacher is a five-month production report on Absurd, the durable execution system built entirely on top of Postgres. The original pitch was that you don't need a separate service, compiler plugin, or entire runtime for durable workflows, just a SQL file and a thin SDK. The report confirms the design held up: the core model of tasks, steps, checkpoints, events, and suspending hasn't needed to change. The TypeScript SDK is about 1,400 lines (compare that to Temporal's Python SDK at ~170,000), making it easy to understand, debug, and port. The checkpoint-based replay model proved its worth: unlike systems requiring deterministic replay of entire workflow functions, Absurd loads cached step results and skips completed work, meaning code between steps doesn't need to be deterministic.

  Key additions since launch include decomposed steps (`beginStep()`/`completeStep()` for conditional logic and intentional failures), task results (spawn a child task and await its result), `absurdctl` as a proper CLI for debugging production issues, Habitat (a Go-based web dashboard), and agent integration with a bundled skill for coding agents. Ronacher is candid about what's missing: no built-in scheduler, no push model for webhooks, and no partition support yet (with a detailed explanation of why Postgres partition lifecycle management under real workloads is harder than it sounds). The meta-observation about open source in the agentic age, that durable execution is now something agents can build for you, making the value of curated libraries less obvious, is a question the entire OSS ecosystem is grappling with.

  Here's what strikes me about Absurd: the decision to put complexity in SQL and keep SDKs thin is the kind of architectural bet that only validates over time, and five months of production use across agent workloads, crons, and deploy surviving background processing is a meaningful signal. The 1,400-line SDK versus 170,000 lines isn't just a talking point; it's a fundamentally different relationship between developer and system. When something goes wrong, you can read the entire SDK in an afternoon. That's a form of reliability that no amount of testing can substitute for. The fact that Absurd's core model hasn't needed to change in five months of production use, even as it's been extended with new features, suggests the original design was robust. The checkpoint-based replay model is a particularly elegant solution to the problem of non-determinism in durable workflows, and it's something I expect we'll see more of in future systems.

## Generative AI

* [**I Found Claude Code Unpacked The Best Visual Walkthrough (We've Been Missing)**][1]. In this post, Joe Njenga highlights Claude Code Unpacked, an interactive visual exploration of Claude Code's leaked source code that maps all 519K+ lines of TypeScript across 1,900+ files into something you can actually navigate. The standout section is the agent loop broken down into 11 steps, from keyboard input through message formatting, history loading, system prompt assembly, API call, token streaming, tool decisions, loop continuation, rendering, post-sampling hooks (auto-compact, memory extraction, dream mode), and finally awaiting the next input. The interactive architecture explorer presents the entire source tree as a clickable treemap colour-coded by domain: tools and commands in yellow, core processing in green, UI in blue, infrastructure in orange.

  Njenga catalogues 53+ tools across eight categories (file operations, execution, search, agents and tasks, planning, MCP, system, and experimental) and 95+ slash commands across five categories, including several he'd never seen documented anywhere:`/think-back` for session replay, `/ctx_viz` for context visualisation, and the intriguing `/good-claude` which appears to be an internal reward trigger. The hidden features section reveals what's in the code but not yet shipped: Kairos (persistent mode with autonomous background actions), Coordinator Mode (a lead agent decomposing work and spawning parallel workers), Bridge Control (driving sessions from your phone), Daemon Mode (background sessions via tmux), and UDS Inbox (inter-process communication for multi-agent setups).

---

* [**Eight years of wanting, three months of building with AI**][4]. Lalit Maganti delivers one of the most honest and thoroughly evidenced accounts of building real software with AI coding agents in this post. The project is syntaqlite: high-quality devtools for SQLite (formatter, linter, language server) that Maganti had wanted to build for eight years but couldn't justify as a side project because the work sits at the intersection of being both hard (parsing SQLite has no formal spec, and the implementation goes straight from text to bytecode without a parse tree) and tedious (~400 grammar rules, each requiring manual mapping to parse tree nodes). Three months with Claude Code, across ~250 hours, made it happen.

  The journey has two distinct phases. Phase one was a month of vibe-coding: delegating almost all design and implementation to Claude, which produced a functionally reasonable but architecturally disastrous codebase, "complete spaghetti" with functions scattered in random files and several-thousand-line modules. Phase two was a complete rewrite in Rust, with Maganti taking ownership of all decisions and using Claude as "autocomplete on steroids" within a much tighter process: opinionated design upfront, reviewing every change, and investing in scaffolding to automatically check AI output. The result shipped with a VS Code extension, Python bindings, a WASM playground, a docs site, and multi-ecosystem packaging, features that would have been cut without AI, making them affordable to build.

  What fascinates me is the "relativity" framework Maganti develops for when AI helps versus when it hurts. When working on something you understand deeply, AI is excellent (parser rule generation: "agent team was successful beyond my wildest dreams"). When you can describe what you want but don't yet know the domain, AI is good but requires care (learning Wadler-Lindig for the formatter). When you don't even know what you want, AI is somewhere between unhelpful and harmful (architecture and API design). The addictive quality of AI coding, the slot-machine dynamic of send-prompt-wait-for-result, and the tiredness feedback loop where vague prompts produce worse output are things I suspect many developers recognise, but few have articulated clearly. This is the kind of post the industry needs more of.

---

* [**How to Run Claude Code Agents in Parallel**][5]. In this post, Eivind Kjosbakken tackles the practical mechanics of running multiple Claude Code agents simultaneously. This workflow sounds simple, but it has real pitfalls: agents writing over each other, context-switching costs, and losing track of what's running where. The core technique is git worktrees: Claude Code's `--worktree` flag automatically checks out a new worktree in a hidden `.claude` folder, guaranteeing agents don't interfere with each other while keeping the main directory clean. After an agent finishes, its work merges back into the main branch.

  The context-switching advice is where this goes beyond a tutorial into genuine workflow engineering. Kjosbakken's key principle: always finish your current task before switching, even when it seems faster to quickly set up the next agent. The hidden cost of switching, losing your mental model of task A, context-loading task B, then re-loading task A, almost always exceeds the apparent time saved. His terminal setup (Warp with one tab per repository, split subtabs for multiple agents within a repo, notifications when an agent needs interaction) is a practical template. The broader thesis, that humans are becoming orchestrators of AI agents and need to learn efficient parallelisation, feels like a preview of how software engineering workflows will look in 12 months.

---

* [**Project Glasswing**][6]. This post from Anthropic announces Project Glasswing: a coalition bringing together AWS, Apple, Broadcom, Cisco, CrowdStrike, Google, JPMorganChase, the Linux Foundation, Microsoft, NVIDIA, and Palo Alto Networks to use Claude Mythos Preview for defensive cybersecurity at scale. The premise is blunt: Mythos Preview has already found thousands of zero-day vulnerabilities, including some in every major operating system and every major web browser, many of them discovered entirely autonomously without human steering. Specific examples include a 27-year-old vulnerability in OpenBSD (remotely crashable by simply connecting), a 16-year-old FFmpeg vulnerability in a line of code that automated testing tools had hit five million times without catching, and an autonomous chain of Linux kernel exploits escalating from ordinary user to complete machine control.

  The benchmarks quantify the gap: Mythos Preview scores 83.1% on CyberGym versus Opus 4.6's 66.6%, 77.8% on SWE-bench Pro versus 53.4%, 82.0% on Terminal-Bench 2.0 versus 65.4%, and 93.9% on SWE-bench Verified versus 80.8%. Anthropic is committing up to $100M in usage credits for partners, plus $4M in direct donations to open-source security organisations (Alpha-Omega, OpenSSF, Apache Software Foundation). The model won't be made generally available; the plan is to develop safeguards that detect and block the most dangerous outputs, launching them with an upcoming Claude Opus model first.

  I keep wrestling with the implications here. Finding a vulnerability that survived decades of human review and millions of automated tests is not an incremental improvement; it's a phase change in what's possible. Anthropic's framing as "give the shield before releasing the sword" is strategically sound, but the uncomfortable truth is that this capability will proliferate regardless. The 90-day reporting commitment, the $100M in credits, the coalition of every major tech company; this has the feel of a genuine inflexion point where the AI safety rhetoric meets concrete, high-stakes action. Whether Project Glasswing succeeds in giving defenders a durable advantage will be one of the defining stories of 2026.

---

* [**Anthropic Just Made Cheap Models Think Like Opus (Claude Advisor Tool Is Wild)**][7]. Joe Njenga breaks down Anthropic's new Advisor Tool. This beta API feature lets a cheaper executor model (Sonnet or Haiku) consult a higher-intelligence advisor model (Opus) mid-generation for strategic guidance. The advisor reads the full conversation, produces a plan or course correction in 400–700 tokens, and the executor continues informed by that advice. The architecture inverts the typical multi-model pattern: instead of a large orchestrator delegating to small workers, the small model runs the show and consults the large model only when it reaches a decision it can't reasonably make on its own.

  The benchmarks are compelling. Sonnet with an Opus advisor scored 74.8% on SWE-bench Multilingual versus 72.1% solo: a 2.7-point improvement while spending 11.9% less per task. On Terminal-Bench 2.0, the gap widens: 63.4% versus 59.6% at a lower cost. But Haiku's transformation is the headline: on BrowseComp, Haiku with an Opus advisor scored 41.2%, more than double its solo 19.7%. Implementation is straightforward: add an advisor tool to your tools array with `type: "advisor_20260301"`, specify the advisor model, and optionally cap the number of calls per request with `max_uses`. All advisor inference happens server-side within a single API request; billing splits cleanly between advisor tokens at Opus rates and executor tokens at executor rates.

  What I find particularly significant here is how the Advisor Tool changes the economics of building intelligent agents at scale. If you're running thousands of agentic tasks per day, paying Opus rates for every token is prohibitive. But running Haiku alone produces mediocre results. The advisor pattern gives you a tunable knob: frontier-level intelligence where it matters, commodity pricing for the bulk of the work. The cross-model transferability from the UC Berkeley research (advisors trained on GPT-family models still improving Claude-family outputs) suggests this isn't a Claude-specific trick but a fundamental architectural pattern for cost-effective AI systems.

---

## WIND (What Is Niels Doing)

I'd hoped to have continued with **Part 12** of the [**Building an Event Management System with Claude Code**](/contact-event-claude-code) blog post series by now, but I've been bogged down with work, and the series is on the back burner for now. It's not abandoned, the draft is more than halfway done, but between the day job and keeping up with the pace of AI developments (as you can tell from this week's rather packed roundup), something had to give. I'll pick it back up as soon as things settle down.

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

[1]: https://medium.com/ai-software-engineer/i-found-claude-code-unpacked-the-best-visual-walkthrough-weve-been-missing-9dac5ed0a3f9?sk=v2%2F0e78d488-867b-4af1-b3a8-e95107efaa62
[2]: https://lucumr.pocoo.org/2026/4/4/absurd-in-production/
[3]: https://elbruno.com/2026/04/04/%f0%9f%93%9d-convert-anything-to-markdown-in-net-meet-elbruno-markitdotnet/
[4]: https://lalitm.com/post/building-syntaqlite-ai/
[5]: https://towardsdatascience.com/how-to-run-claude-code-agents-in-parallel/
[6]: https://www.anthropic.com/glasswing
[7]: https://medium.com/ai-software-engineer/anthropic-just-made-cheap-models-think-like-opus-claude-advisor-tool-is-wild-07b26351a527?sk=v2%2Fcfb59d9e-a47f-4c23-9349-3ed532750b14


<!-- [postref]: {{< relref "" >}} -->
