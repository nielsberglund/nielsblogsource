---
type: post
layout: "post"
title: Interesting Stuff - Week 40, 2025
author: nielsb
date: 2025-10-05T08:25:55+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-40-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-40-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Distributed Computing
  - Netflix
  - Anthropic
  - SQL Server 
  - VSCode
  - Data & AI Community Day Durban
description: "Week 40, 2025: Netflix's Write-Ahead Log ensures data reliability at scale, Anthropic's Claude Sonnet 4.5 dominates coding benchmarks, Armin Ronacher ships 90% AI-generated production code, and GitHub engineers treat Markdown as source code. Explore how experienced developers are delegating implementation to AI while guarding architecture decisions, plus urgent call for lunch sponsors for Data & AI Community Day Durban Oct 11."
---

This week brings a convergent narrative around AI-assisted development that's impossible to ignore: from Netflix's Write-Ahead Log solving data reliability at massive scale, to Anthropic's Claude Sonnet 4.5 claiming the coding benchmark crown, to Armin Ronacher shipping production infrastructure that's 90% AI-generated, and GitHub's Tomas Vesely treating Markdown specs as source code with AI as the compiler. The throughline is clear: we're witnessing a fundamental shift where experienced engineers are radically expanding what's possible by delegating implementation to AI while jealously guarding architectural decisions. 

Tooling from Microsoft's MSSQL extension for VS Code provides the visual verification layers that make this workflow sustainable. The question is no longer whether AI will write most of our code, but whether we're building the right guardrails and developing the right instincts to know which decisions must remain human. Meanwhile, with less than a week until [**Data & AI Community Day Durban**][10] on October 11, we're still urgently seeking a lunch sponsor to support our attendees, speakers, and community. If you know anyone interested in backing Durban's tech community, please get in touch. 

<!--more-->

## Distributed Computing

* [**Building a Resilient Data Platform with Write-Ahead Log at Netflix**][1]. In this post, the Netflix Technology Blog team dives deep into their solution for one of those "holy cow, we almost lost everything" engineering challenges that keep platform teams awake at night. When you're serving hundreds of millions of users and a developer's innocent `ALTER TABLE` command nearly causes permanent data loss, you know it's time to build something bulletproof. Enter the Write-Ahead Log (WAL); Netflix's distributed safety net, essentially saying, "trust us, we've got your back," to every critical application on their platform.

  The engineering team walks through how WAL handles everything from accidental data corruption and cross-region replication to those nightmare scenarios where bulk deletes cause out-of-memory crashes on key-value nodes. What's particularly clever is the "persona" approach; the same core architecture shape-shifts between being a delayed queue for Product Data Systems, a cross-region replication engine for EVCache, and a multi-partition mutation handler for Key-Value services. The API is refreshingly simple (just one main endpoint, `WriteToLog`), abstracting away the internal complexity while supporting multiple underlying storage systems like Kafka and SQS, depending on the use case. They've built a Swiss Army knife for data reliability that prevents the kind of production incidents that turn engineers' hair grey, all while enabling teams to onboard with minimal friction by toggling a flag.

  **My take:** The real genius here isn't just the technical architecture. It's the recognition that at Netflix scale, *every* data platform needs to assume failure as the default state rather than the exception. By building WAL as a pluggable abstraction that sits between applications and their datastores, they've created what amounts to an insurance policy for data operations. The delayed queue functionality alone saves countless hours of manual retry logic across teams. What I find most impressive is how they've taken lessons from multiple production incidents and technical debt scenarios to build a single, coherent solution rather than accumulating more bespoke patches. If you're running data infrastructure at any meaningful scale and haven't thought about write-ahead logging patterns, this post should be your wake-up call, because the question isn't *if* you'll face these problems, but *when*.

## SQL Server 

* [**MSSQL Extension for VS Code: Schema Compare, Schema Designer, Local SQL Server Container GA**][4]. The Microsoft SQL Server team announces the general availability of three major features in the MSSQL Extension for VS Code v1.35.0: Schema Compare, Schema Designer, and Local SQL Server Containers. This update transforms VS Code into a comprehensive SQL development environment that rivals dedicated database tools. Schema Compare offers a diff-style visualisation for tracking schema differences between databases or database projects, complete with one-click update capabilities. Schema Designer provides an interactive diagramming experience that enables developers to visually create and modify table structures, relationships, and constraints without writing T-SQL. It features foreign-key icons, relationship lines that persist through filtering, and tooltips for truncated names. The Local SQL Server Container feature eliminates Docker CLI friction entirely, allowing developers to provision SQL Server 2025 containers (complete with vector data types and AI-ready features) directly from the extension with automatic connection profile creation, port conflict detection, and lifecycle controls.

  The release emphasises developer experience polish that addresses real-world friction points. Schema Compare now remembers previous type selections and displays profile names. Enhanced option settings include granular include/exclude functionality, driven by community feedback. Schema Designer has gained performance improvements, including fast loading, collapse/expand buttons for tables with many columns, and support for self-referencing foreign keys. That is the kind of edge cases that break visual designers. The Local SQL Server Container experience adds progress indicators during image downloads (critical for slow networks), step-by-step Docker prerequisite checks with live status indicators, and automatic port assignment when the default 1433 is occupied. Beyond these headline features, v1.35.0 fixes Microsoft Entra ID sign-in issues that caused blank dropdowns, introduces session-based SQL Authentication password persistence, and adds a new Text View mode for query results. These unglamorous fixes make daily workflows less frustrating.

  **What's particularly smart about this release:** Microsoft is meeting developers where they already work rather than forcing them into separate database management tools. For teams already invested in VS Code (which, given GitHub Copilot integration, is increasingly everyone), this eliminates context-switching between editors and eliminates the "which tool do I use for which task" cognitive overhead. The Schema Designer competes directly with tools like MySQL Workbench and pgAdmin, but lives inside the same environment where you're writing application code. The Local SQL Server Container integration is especially clever—by defaulting to SQL Server 2025 with vector data types and enhanced JSON functions, Microsoft is essentially making it frictionless for developers to experiment with their newest AI-focused database features during local development.

  The subtext here aligns perfectly with the AI-assisted development narrative from Armin Ronacher's post below: when AI agents are writing raw SQL (as Ronacher described), having visual schema tools becomes *more* important, not less, because humans need efficient ways to verify that the AI-generated database interactions match the intended architecture. Schema Compare and Schema Designer provide exactly that: a quick visual confirmation that the database state matches expectations without the need for manual inspection of dozens of `CREATE TABLE` statements. This is tooling built for a workflow where humans design and AI implements, which is precisely the division of labour that's emerging as the sustainable pattern for high-quality software development.

## Generative AI

* [**Introducing Claude Sonnet 4.5**][2]. Anthropic, in this post, unveils Claude Sonnet 4.5, boldly declaring it "the best coding model in the world" while simultaneously demonstrating its capabilities across agentic tasks, computer use, and mathematical reasoning. The company isn't just releasing another incremental update. They're positioning Sonnet 4.5 as a paradigm shift in how AI handles complex, multi-step workflows. With a jaw-dropping 82% score on SWE-bench Verified (outpacing competitors like GPT-5 Coder at 74.5% and Gemini 2.5 Pro at 67.2%), and the ability to maintain focus for over 30 hours on complex tasks, this model is clearly targeting the enterprise development market. The computer use capabilities have leapt from 42.2% to 61.4% on OSWorld benchmarks in just four months, and they're backing it up with real product integration: the Claude for Chrome extension, checkpoints in Claude Code, and native VS Code support.

  But here's where it gets exciting: Anthropic is eating its own dog food and serving it to developers on a silver platter. They've open-sourced the Claude Agent SDK—the same infrastructure powering Claude Code, essentially saying "here's how we built our frontier product, now go build yours." This move, combined with new API features like context editing and memory tools for long-running agents, signals a fundamental bet on agentic workflows as the future of software development. The pricing remains identical to Sonnet 4 at $3/$15 per million tokens, which can be seen as either a generous or strategic positioning to capture market share. They've also included a wild research preview called "Imagine with Claude," where the model generates software on the fly with no predetermined functionality. It's like watching an AI improv performance, available to Max subscribers for five days.

  **My perspective:** What genuinely impresses me here isn't just the benchmark numbers (though 82% on SWE-bench is legitimately remarkable), it's the alignment story. Anthropic claims this is their "most aligned frontier model yet," with substantial reductions in deception, sycophancy, power-seeking behaviours, and susceptibility to prompt injection attacks. They've even incorporated mechanistic interpretability techniques in their evaluations for the first time. If these alignment improvements hold up in production, which is a big "if" that requires independent verification, it suggests we might finally be seeing capability gains that don't come at the cost of safety trade-offs. The ASL-3 safeguards with CBRN classifiers may occasionally flag false positives (though they claim a 10x reduction since their original deployment), but I'd rather have overcautious filters than the alternative. The real test will be whether enterprises adopt Sonnet 4.5 for mission-critical systems or stick with more conservative approaches. Either way, the gauntlet has been thrown down, and GitHub Copilot's early integration suggests the industry is taking notice.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**90%**][3]. Armin Ronacher, in this post, responds to Dario Amodei's prediction that AI will write "essentially all of the code" within 12 months by saying: it's already happening for him. The creator of Flask and Jinja2 reveals that his latest infrastructure project, a Go-based email service with 40,000 lines spanning OpenAPI specs, Pulumi configs, and custom SDKs, is "probably north of 90% AI-written code." But before you imagine this as some chaotic experiment, Ronacher sets strict boundaries: no emoji-laden commits, no duplicate implementations, no weird files that don't belong. Every line gets reviewed as if he wrote it himself, architecture decisions remain his domain, and operational reliability isn't negotiable. This isn't about surrendering control; it's about radically shifting where human judgment gets applied.

  The technical stack reveals what AI-assisted development unlocks when executed with discipline and precision. Ronacher abandoned ORMs entirely in favour of raw SQL (which Claude writes for him), adopted OpenAPI-first design with code generation for both client and server shims, and uses a dual-agent workflow where Claude Code handles debugging with tool access while Codex excels at PR-level code reviews. He highlights wins that would've been cost-prohibitive before: trying three different OpenAPI implementations in a single day, adopting testcontainers for Postgres test isolation in under an hour, and compressing weeks of AWS/Pulumi infrastructure work into just a few days. But he's equally candid about the failure modes: AI agents recreate existing functionality, misunderstand goroutines and threading, reach for outdated dependencies, and swallow errors instead of maintaining strong invariants. His workflow involves creating PR-sized chunks with either "agent loop with finishing touches" or a strict "lockstep" approach, constantly feeding context to prevent the AI from losing the plot.

  **Here's the uncomfortable truth this post exposes:** The "AI will never replace senior engineers" narrative misses the point entirely. Ronacher isn't being replaced; he's been *amplified* to the point where his individual output rivals what small teams used to produce, but only because he knows exactly which decisions to delegate and which to jealously guard. The architecture, state machines, database design, and operational trade-offs? All human. The boilerplate SQL, OpenAPI shims, Pulumi configurations, and test infrastructure? Increasingly AI-generated. What's genuinely striking is his assertion that he "would have built a different system" without AI because he would've made different trade-offs—meaning AI isn't just accelerating existing patterns, it's *expanding the solution space* by making previously expensive approaches viable.

  This directly validates Anthropic's Sonnet 4.5 positioning while simultaneously exposing a more complex reality: the skill floor for safely using these tools is rising, not falling. Ronacher can let AI write 90% because he has built and operated similar systems before and knows when a rate limiter implementation lacks jitter or makes poor storage decisions. For engineers without that hard-won operational knowledge, the same workflow produces "systems that appear to behave correctly but have unclear runtime behaviour"; precisely the kind of technical debt that becomes company-killing at scale. The future isn't "AI writes all the code," it's "experienced engineers let AI handle everything they've already mastered while remaining paranoid about the fundamentals." That's a very different future than most people are preparing for.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Spec-driven development: Using Markdown as a programming language when building with AI**][5]. Tomas Vesely describes a workflow in this post that inverts the traditional software development process. Instead of writing code and documenting it later, he writes comprehensive Markdown specifications and treats GitHub Copilot as a compiler that transforms those specs into executable Go code. For his GitHub Brain MCP Server project (40,000+ lines), he maintains four key files: `README.md` for user documentation, `main.md` as the actual "source code" containing the AI agent specification, `compile.prompt.md` to trigger code generation, and `main.go` as the compiled output he rarely edits directly. The `main.md` file reads like programming in English—storing variables in structs, defining loops through bullet points, specifying database schemas in Markdown tables, and even embedding GraphQL queries as code blocks. When he needs to add features or fix bugs, he edits the Markdown spec, invokes the compile prompt with GitHub Copilot's `/` command, and the agent regenerates the Go implementation.

  The workflow includes sophistication beyond simple spec-to-code translation. Vesely embeds `README.md` documentation directly into `main.md` using Markdown links, ensuring user-facing docs and implementation specs stay synchronised. If he wants to add a CLI argument alias, updating `README.md` automatically propagates to the implementation without manual syncing. He even created `lint.prompt.md` to clean up the Markdown spec itself, treating English as a programming language that needs refactoring for clarity and conciseness (eliminating synonyms like pull/get/fetch, removing duplicate content). The approach leverages GitHub Copilot not just for code generation, but also for editing the specs themselves. He demonstrates using Copilot to add pagination parameters across multiple MCP tools in `main.md`, where the agent recommends proper pagination styles and parameter naming conventions.

  **The limitations are as revealing as the benefits.** Vesely candidly admits compilation slows down as `main.go` grows (he wants to modify specs to break code into modules), he hasn't attempted tests yet (acknowledging they remain essential), and coding in Markdown can be more complicated than writing Go directly because "you have to clearly describe what you want, which might be the hardest part of software development." This isn't a silver bullet: it's a pragmatic recognition that the complex parts of programming (understanding state machines, runtime behaviour, system invariants) remain human responsibilities. At the same time, boilerplate implementation gets delegated to AI.

  This directly extends Armin Ronacher's "90%" thesis with a crucial architectural insight: by keeping specs separate from implementation, Vesely can theoretically "discard all Go code and regenerate the app from scratch in another language"—treating programming languages as interchangeable compile targets rather than the primary artefact. The spec becomes the canonical source of truth, and the actual code becomes disposable infrastructure. This is a fundamentally different mental model than "AI helps me write code faster." It's closer to how we think about compilers: nobody hand-optimises assembly anymore because we trust C compilers to do a better job. Vesely is betting that within a few years, nobody will handwrite CRUD boilerplate because AI agents will do a better job from well-written specifications.

  The open question Vesely poses at the end is genuinely profound: "Will the new code work right away?" Suppose you can regenerate a working application in a different language from the same Markdown specs. In that case, you've essentially created a programming language that's higher-level than any existing language—one where the abstraction is business logic and system behaviour rather than loops and functions. That's the fundamental shift happening here, and it explains why Microsoft, GitHub, and Anthropic are all racing to improve their agentic capabilities. The winner in this space won't be the AI that writes the best individual functions. It'll be the AI that most reliably translates human intent into working systems.


## WIND (What Is Niels Doing)

The countdown is on! It is less than a week until [**Data & AI Community Day Durban: Ready Player 2 - Augment Yourself with AI Superpowers**][10] on **October 11**. Right now, I'm deep in the trenches of last-minute logistics: finalising the agenda application for attendees, building out the evaluation system, and making sure our sponsors get the visibility they deserve.

![](/images/posts/sponsors.png)

**Figure 1:** *Thank You Sponsors*

**Speaking of sponsors: Urgent Call to Action:** We still need a lunch sponsor to provide food for our attendees, speakers, and community members. If you know anyone who might be interested in supporting the Durban tech community (and getting their brand in front of a highly engaged audience of data and AI practitioners), please put us in [**touch**][6]. Time is short, but the opportunity to make an impact is real.

As I wrote in last week's roundup, for this event, we are testing something completely new. Durban has an incredible pool of students and recent graduates doing genuinely impressive work in data and AI, but they rarely get a platform to showcase it. We've carved out an entire **50-minute session** exclusively for students and graduates to take the stage and present their projects. No gatekeeping, no "wait your turn until you're senior". Just pure talent and innovation on display.

**We're still seeking students and recent graduates to fill this position.** If you're working on something cool in the data/AI space, whether it's a machine learning project, a data pipeline you're proud of, an AI application you've built, or research you're conducting: this is your moment. The stage is yours. [**Reach out**][6] if you're interested in showcasing your work.

**🎙 Event Details:**

📅 **Date:** October 11, 2025 <br>
🕗 **Time:** Registration starts at 08:00 AM. We expect to finish at 18:00.<br>
🏨 **Venue:** The stunning [**Richfield College**][14] Umhlanga Campus, Centenary Boulevard, Park Square, 5-9 Park Avenue, Umhlanga.<br>
🌐 [**Event Page**][10]<br>
🎤 [**Speakers**][11]<br>
📖 [**Sessions**][12]<br>
📝 [**Agenda**][13]<br>

See you on the 11th. Let's make this one count!

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

[1]: https://netflixtechblog.com/building-a-resilient-data-platform-with-write-ahead-log-at-netflix-127b6712359a
[2]: https://www.anthropic.com/news/claude-sonnet-4-5
[3]: https://lucumr.pocoo.org/2025/9/29/90-percent/
[4]: https://devblogs.microsoft.com/azure-sql/vscode-mssql-schema-container/
[5]: https://github.blog/ai-and-ml/generative-ai/spec-driven-development-using-markdown-as-a-programming-language-when-building-with-ai/
[6]: mailto:events@aimldatadurban.org
[10]: https://aimldatadurban.org/events/2025/ready-player-2/
[11]: https://aimldatadurban.org/events/2025/ready-player-2-speakers/
[12]: https://aimldatadurban.org/events/2025/ready-player-2-sessions/
[13]: https://aimldatadurban.org/events/2025/ready-player-2-agenda/
[14]: https://www.richfield.ac.za/campus/umhlanga/#

