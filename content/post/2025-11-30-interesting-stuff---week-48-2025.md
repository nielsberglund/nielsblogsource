---
type: post
layout: "post"
title: Interesting Stuff - Week 48, 2025
author: nielsb
date: 2025-11-30T06:19:04+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-48-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-48-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - aimldatadurban
  - seasonofai
  - mcp
  - dotnetconfsa
  - Claude Code
  - Anthropic
  - PostgreSQL
  - AI agents
description: "Week 48 AI roundup: Open-source pg-aiguide teaches LLMs production PostgreSQL, Claude Opus 4.5 drops to $5/25 per million tokens, deep agent architectures explained."
---

This week's roundup showcases the infrastructure layer that's transforming AI coding from impressive demos to genuinely trustworthy production tools. Tiger Data open-sourced `pg-aiguide` to teach LLMs production-ready PostgreSQL, Anthropic released Claude Opus 4.5 with dramatic efficiency gains and frontier-level capabilities, researchers mapped the architectural gulf between shallow and deep AI agents, and Anthropic's engineering team revealed how they solved long-running agent consistency by borrowing practices from effective software engineering teams. 

Meanwhile, I delivered my **C# MCP Servers and Azure AI**"** talk at the **.NET Conf 2025 Johannesburg** yesterday (literally blowing attendees away in the windy outdoor venue!). We're putting final touches on [**Data & AI Community Day Durban: Season of AI - Merry Christmas People (MCP)**][10] on December 13, CfS closes today. We've got a few tickets left for what promises to be an epic Year-End Finale!

<!--more-->

## Generative AI

* [**We Taught AI to Write Real Postgres Code (And Open Sourced It)**][1]. Matvey Arye, in this post, tackles one of AI coding's dirty secrets: the SQL your AI assistant generates today might look fine, but it's quietly setting you up for disaster six months from now. Tiger Data has open-sourced **pg-aiguide**, a Model Context Protocol (MCP) server that gives AI coding agents the PostgreSQL-specific judgment they desperately need. The tool combines three critical components: AI-optimised "skills" containing curated Postgres best practices, semantic search across version-aware official documentation (Postgres 15-18), and extension ecosystem docs starting with TimescaleDB. What makes this compelling isn't just that it prevents common mistakes like mixing SERIAL and UUID primary keys or defaulting to the dreaded `timestamp without time zone`, it's that the guidance is embedded directly into AI workflows through MCP, working seamlessly with Claude Code, Cursor, and other compatible editors.

  The post demonstrates the dramatic difference between generic AI-generated schemas and those created with pg-aiguide enabled. Without guidance, you end up with arbitrary VARCHAR limits, case-sensitive email uniqueness checks, and mixed identity strategies that create technical debt. With pg-aiguide, you get `BIGINT GENERATED ALWAYS AS IDENTITY`, proper `TIMESTAMPTZ` handling, and case-insensitive uniqueness enforcement, the kind of production-ready code experienced PostgreSQL developers write instinctively. The secret sauce lies in the skills themselves, which aren't tutorials but dense, token-efficient guidance encoding hard-won lessons like "Postgres doesn't auto-index foreign key columns" and "precision overflows error out rather than silently truncating." These skills give LLMs judgment, not just syntax knowledge, addressing the surprising finding from a METR study that experienced developers using AI actually took 19% longer to complete tasks because "almost right" code is the hardest to debug.

  This is exactly the kind of infrastructure innovation that transforms AI coding from "impressive demo" to "actually trustworthy." The project is fully open source at github.com/timescale/pg-aiguide, with Tiger Data actively seeking community contributions for new skills, extension documentation, and battle-tested expertise. For developers building on PostgreSQL, which, let's be honest, is most of us in the data-intensive application space, this bridges the dangerous gap between "the AI gave me code that runs" and "the AI gave me code I'd actually want in production three years from now when the table has 50 million rows."

---

* [**Introducing Claude Opus 4.5**][2]. In this announcement, Anthropic reveals Claude Opus 4.5, positioning it not just as incrementally better but as fundamentally different in how it handles real-world software engineering challenges. The model achieves 80.9% on SWE-bench Verified, leading across seven out of eight programming languages on multilingual benchmarks, and, perhaps most remarkably, scored higher than any human candidate ever on Anthropic's notoriously difficult two-hour performance engineering take-home exam. What sets Opus 4.5 apart isn't raw capability alone but what testers consistently describe as judgment: the model handles ambiguity, reasons about tradeoffs without hand-holding, and tackles complex multi-system bugs with the kind of contextual understanding that previously required senior engineering expertise. The pricing has dropped dramatically to $5/$25 per million tokens, making frontier-level intelligence accessible for production workloads rather than just impressive demos.

  The technical innovations that support Opus 4.5's capabilities centre on efficiency and composability. The new effort parameter on the Claude API lets developers choose between minimising time and spending or maximising capability. Opus 4.5 matches Sonnet 4.5's best SWE-bench score while using 76% fewer output tokens, and at the highest effort, it exceeds Sonnet 4.5 by 4.3 percentage points while still using 48% fewer tokens. Combined with advanced context management, memory capabilities, and multi-agent orchestration, these techniques boosted Opus 4.5's deep research evaluation performance by nearly 15 percentage points. The model demonstrates something genuinely new in AI safety: it's the most robustly aligned frontier model released to date, with industry-leading resistance to prompt-injection attacks (scoring just 4.7% susceptibility to k=1 attacks, versus competitors ranging from 7.3% to 33.6%).

  Here's what strikes me about this release: we've moved past the "AI that codes" phase into "AI that understands engineering judgment." The example where Opus 4.5 creatively solved an airline booking problem by upgrading the cabin first, then modifying flights, a solution the benchmark didn't anticipate, illustrates precisely the kind of contextual problem-solving that transforms AI coding from automation to augmentation. For developers in markets like South Africa, where access to senior engineering expertise can be constrained by geography and cost, having Opus-level capabilities at one-fifth the previous price fundamentally changes what's economically viable to build. Claude Code gaining desktop support with parallel sessions means you could legitimately run one agent fixing bugs, another researching documentation, and a third updating specs simultaneously; that's not science fiction, that's available today at `claude-opus-4-5-20251101`.

---

* [**Architectural Difference Between Shallow and Deep AI Agents**][3]. Alok Choudhary examines the architectural gulf separating shallow AI agents from their deep counterparts, revealing why this distinction fundamentally determines which kinds of problems AI systems can actually solve. Shallow agents, including basic LLM tool systems and even the improved ReAct (Reason and Act) framework, operate through simple reactive loops in which an LLM makes immediate decisions, calls tools, and iterates without explicit planning or persistent state management. These architectures fail on complex tasks not because of model limitations but because of structural constraints: they lack upfront planning capabilities, cannot decompose complex queries into manageable sub-tasks, suffer from limited context retention through transient loop-based passing, and have no formal state management or deep reasoning components. The result is agents that can handle straightforward queries but collapse when faced with multi-faceted problems requiring coordinated, multi-step execution.

  Deep agents represent a fundamentally different architectural paradigm, built around four essential components that work in concert. The Planning Tool acts as a project manager, analysing complex queries and generating structured to-do lists before any execution begins. Specialised Sub-agents function as domain experts, each equipped with specific tools and expertise for their assigned tasks; one might handle internet research while another focuses on academic papers or content writing. The System Prompt serves as the operational constitution, defining behavioural constraints and security policies across all agents (like Claude Code's instruction to refuse malicious code requests). Finally, the File System provides persistent shared memory, enabling asynchronous collaboration in which sub-agents build on each other's work rather than starting from scratch each iteration. This architecture mirrors how effective human teams operate: strategic planning followed by delegated execution with shared workspace access and governing policies.

  The practical implications are striking. Consider generating a comprehensive blog post from a topic prompt: a shallow agent might search and write in a linear sequence, while a deep agent creates a plan (background research, academic analysis, drafting, copyright checking), spawns specialised sub-agents for each task potentially running in parallel, maintains consistent tone through the System Prompt, and coordinates outputs through the shared File System where the research findings inform the writing agent's work. This isn't incremental improvement; it's a reimagining of AI problem-solving, moving from reactive execution to stateful, managed frameworks capable of handling complex, multidimensional tasks that previously required human oversight. For developers building agentic systems, understanding this architectural distinction is critical: you're not just choosing between model capabilities, you're selecting between fundamentally different approaches to problem decomposition and state management.

---

* [**Effective harnesses for long-running agents**][4]. This post by Anthropic's engineering team tackles one of the most persistent challenges in agentic AI: enabling agents to maintain consistent progress across multiple context windows without losing momentum or coherence. The core problem mirrors a software project staffed by engineers working in shifts, where each new engineer arrives with no memory of previous work because context windows are finite. Because complex projects spanning hours or days require agents to bridge gaps between coding sessions, this problem is particularly acute. Even with context compaction capabilities in the Claude Agent SDK, frontier models like Opus 4.5 struggle with two critical failure modes when given high-level prompts like "build a clone of claude.ai": attempting to one-shot entire applications and running out of context mid-implementation, or prematurely declaring victory after initial features are built while ignoring remaining requirements.

  Anthropic's solution draws explicit inspiration from effective software engineering practices, implementing a two-agent architecture with distinct responsibilities. The initialiser agent sets up foundational infrastructure during the first session: an `init.sh` script for running the development server, a comprehensive feature list file (200+ features in JSON format marked initially as "failing"), a claude-progress.txt file logging completed work, and an initial git commit establishing the baseline. Subsequent coding agents then follow a structured workflow, reading git logs and progress files, selecting the highest-priority incomplete feature, running basic end-to-end tests to verify the app isn't broken, implementing one feature incrementally, testing thoroughly using browser automation tools (Puppeteer MCP for web apps), and finally committing progress with descriptive messages and updated documentation. The feature list is stored in JSON rather than Markdown because models are less likely to modify JSON structures inappropriately, with strongly worded instructions prohibiting test removal or editing.

  What makes this approach particularly compelling is that it embodies software engineering best practices that experienced developers follow naturally, but which agents must be explicitly prompted to maintain. Every coding session starts with pwd, reads git logs and progress files, verifies basic functionality before touching code, and only then begins feature work. This prevents the agent from compounding existing bugs by implementing new features atop broken foundations. The emphasis on end-to-end testing proved critical; without explicit prompting to use browser automation and test as a human user would, Claude would mark features complete based on unit tests or curl commands, even when they didn't work properly in practice. Git becomes the recovery mechanism, allowing agents to revert bad changes and return to a working state rather than spiralling into increasingly broken codebases.

  The broader implications extend beyond web development—while this demo optimises for full-stack applications, the architectural principles (upfront planning, incremental execution, persistent state tracking, rigorous testing, clean handoffs between sessions) likely generalise to other long-running agentic tasks in scientific research, financial modelling, or any domain requiring work spanning multiple context windows. Open questions remain around whether specialised sub-agents (testing agent, QA agent, code cleanup agent) might outperform general-purpose coding agents for specific tasks. Still, the fundamental insight stands: effective long-running agents need structured environments, clear progress tracking, and explicit prompting to maintain the discipline that human experts apply instinctively.



## WIND (What Is Niels Doing)

As I mentioned in last week's post, yesterday (November 29), I was in Johannesburg presenting at the final leg of .NET Conf 2025. My **C# MCP Servers and Azure AI** talk went exceptionally well; you could say I literally blew the attendees away, given that we were presenting outside under a roof in incredibly windy conditions! All jokes aside, the session was genuinely well received, and it's always energising to see the South African developer community engage with cutting-edge AI.

This coming weekend, I'm actually FREE for once. However, I'll most likely spend it prepping for our final Data & AI event of 2025 here in Durban: [**Data & AI Community Day Durban: Season of AI - Merry Christmas People (MCP)**][10] on Saturday, December 13. The Call for Speakers closes today, and we've assembled an absolutely awesome lineup of speakers and topics! As for attendee tickets, we still have a couple left, so you'd better hurry up if you want to be part of the Year-End Finale. These events consistently sell out, so don't sleep on registration!

🎙️ **Event Details:**

🎄 **Event Name:** [**Data & AI Community Day Durban: Season of AI - Merry Christmas People (MCP)**][10]<br>
📆 **Date:** **December 13**, 2025 <br>
🏨 **Venue:** [**Richfield College, Umhlanga Campus**][11]. <br>
🌍 [**View Event Information**][10] <br>
👨‍🏫 [**Registration Page**][12] (only a few tickets left!)<br>
📝 [**Call for Speakers**][13] (Closes Today, November 30!)

I hope to see you all in Durban on **December 13** for what promises to be an exciting conclusion to our 2025 **Data & AI Community Day** series!

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

[1]: https://www.tigerdata.com/blog/we-taught-ai-to-write-real-postgres-code-open-sourced-it
[2]: https://www.anthropic.com/news/claude-opus-4-5
[3]: https://pub.towardsai.net/architectural-difference-between-shallow-and-deep-ai-agents-37fde45a6a40?sk=v2%2Fec7ce97f-1aea-419d-9209-dffbba4f2880
[4]: https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents
[10]: https://aimldatadurban.org/events/2025/season-of-ai-mcp/
[11]: https://www.richfield.ac.za/campus/umhlanga/#
[12]: https://www.quicket.co.za/events/349495-data-ai-community-day-durban-season-of-ai-merry-christmas-people-mcp/?ref=link-campaign&lc=blog
[13]: https://sessionize.com/soai-durban-mcp/
