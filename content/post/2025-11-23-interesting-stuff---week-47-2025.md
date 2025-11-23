---
type: post
layout: "post"
title: Interesting Stuff - Week 47, 2025
author: nielsb
date: 2025-11-23T05:29:19+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-47-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-47-25.jpg"
categories:
  - roundup
tags:
  - Github Copilot
  - AI agents
  - Data Streaming
  - Kafka
  - Apache Iceberg
  - Google Gemini
  - Generative AI
  - aimldatadurban
  - seasonofai
  - mcp
  - dotnetconfsa
 
description: "Explore GitHub Copilot agents, AI memory systems, Apache Iceberg for lakehouse analytics, Google Gemini 3.0 Pro insights, plus .NET Conf Cape Town highlights and event updates."
---

This week's roundup explores the critical shift from vague AI assistants to specialised, instruction-driven agents that actually deliver value, covering everything from GitHub Copilot's instruction file architecture to sophisticated memory systems that transform digital amnesia into persistent Intelligence. We dive deep into Apache Iceberg's emergence as the open table format of choice for unified real-time and batch analytics, examining why the appealing "Zero Copy" dream of streaming Kafka topics directly into lakehouse tables often backfires in production.

The Generative AI section examines Google's competitive panic mode as Gemini 3.0 Pro accelerates toward release, reveals how proper memory architectures enable AI agents to learn and adapt across sessions, and dissects why effective agents need operating manuals rather than mission statements. Plus, I share updates from .NET Conf Cape Town and details about our final **Data & AI Community Day Durban** event of 2025, complete with a holiday-themed MCP deep-dive that's opening registrations today (grab your tickets before they disappear faster than free pizza at a developer meetup!).

<!--more-->

##  Generative AI

* [**Unlocking the full power of Copilot code review: Master your instructions files**][1]. Ria Gopu, in this post, looks at the often-overlooked craft of writing effective instruction files for GitHub Copilot Code Review, transforming what could be a frustrating "why won't it listen to me?" experience into a finely-tuned automated code review powerhouse. With GitHub's recent addition of both repo-wide `copilot-instructions.md` files and path-specific `*.instructions.md` files (complete with `applyTo` frontmatter for targeting specific languages), developers now have unprecedented control over how Copilot evaluates their code, but with great power comes the need for some practical guidance. The post tackles three critical questions that keep developers up at night: when is Copilot actually reading your instructions, why doesn't it follow them exactly, and how can you ensure it listens to your guidance without sending it into non-deterministic chaos?

  The article delivers a masterclass in instruction file architecture, emphasising that less is genuinely more, keeping files under 1,000 lines, using imperative commands rather than verbose paragraphs, and leveraging structured headings with bullet points that even an LLM can process efficiently. GitHub's team has identified common pitfalls that make developers feel like they're shouting into the void: trying to change comment formatting (spoiler: it won't work), including external links (Copilot won't follow them), or adding vague directives like "be more accurate" that just confuse the underlying model. Instead, the post advocates for concrete, actionable rules like "Prefer `const` over `let`" combined with code examples that demonstrate both correct and incorrect patterns, exactly how you'd mentor a human teammate, but optimised for silicon-based code reviewers.

  What makes this particularly valuable is the complete TypeScript instruction file example and the detailed prompt for using the Copilot coding agent to automatically revise your existing instructions, turning meta-AI assistance into a practical workflow improvement tool. For teams struggling to maintain code quality standards across distributed repositories, this represents a significant shift from manual review bottlenecks to scalable, customisable automated enforcement—though success hinges entirely on understanding that Copilot Code Review is a non-deterministic assistant, not a deterministic rule engine. The guide essentially teaches developers to write instruction files that work with the AI's capabilities rather than against them, a crucial skill as code review increasingly becomes a human-AI collaboration rather than a purely human activity.

---

* [**Google Gemini 3.0 Pro and Nano Banana Pro Release Next Week (Here’s What to Expect)**][2]. This post by Joe Njenga unpacks the mounting evidence that Google is accelerating its Gemini 3.0 Pro release to the week of November 22, 2025, a strategic departure from their traditional December launch window that screams "competitive panic mode." With OpenAI's GPT-5 Codex and Anthropic's Claude 4.5 Sonnet already grabbing developer mindshare, Google apparently can't wait another month while its market position erodes. The smoking gun? A preview label reading "gemini-3-pro-preview-11-2025" was spotted in VertexAI code, alongside A/B testing already running in AI Studio, Gemini Advanced users receiving upgrade notifications, and Polymarket predictions indicating a high probability of a November release. The post delivers a comprehensive breakdown of expected features, including a 1-million-token context window that finally solves Gemini's notorious "forgetting" problem, structured reasoning with built-in self-correction, and notably improved coding performance, particularly for SVG generation. This task has historically made both ChatGPT and Claude look silly.

  What makes this particularly interesting is the unexpected reveal of Nano Banana Pro, discovered through a promotional reference buried in Google Vids, which suggests Google is positioning its popular image generator as a "Pro" tier product running on the full Gemini 3.0 flagship model rather than the Flash variant. Early benchmark results paint a mixed picture: Gemini 3.0 Pro reportedly achieves human-expert parity on the GDP Evo benchmark and ranks highly on ARK AGI 2 and Kingbench leaderboards, while simultaneously showing a significant gap on SWE-Bench (63.8% for Gemini 2.5 Pro versus Claude Sonnet 4.5's 77%). The strategic play here goes beyond raw model performance. Google is building a complete AI stack that combines reasoning and visual generation across its entire ecosystem, from Gmail to Slides to Vertex AI for enterprise deployments, creating an integrated experience that competitors can't easily match, even if their individual models perform better on isolated benchmarks.

  **My take:** The AI model release cycle has officially become a high-stakes game of chicken, and Google just swerved first. What's fascinating isn't just the technical capabilities, though that 1-million-token context window is genuinely impressive for processing entire codebases, but the strategic desperation driving an early release. When you're Google and you're breaking your own December launch tradition because you can't afford another month of market share loss, that tells you everything about how seriously they're taking the Anthropic and OpenAI threat. The real question isn't whether Gemini 3.0 Pro will be good (it probably will), but whether Google can overcome its historical weakness in developer adoption despite having technically competitive products. Also, can we appreciate that someone at Google actually approved "Nano Banana Pro" as an official product name? In an industry drowning in serious-sounding acronyms, that's either brilliant marketing or someone's practical joke that made it too far up the approval chain.

---

* [**Building AI Agents That Actually Remember: A Deep Dive Into Memory Architectures**][3]. In this post, Sai Kumar Yava tackles one of the most frustrating limitations of modern AI systems, digital amnesia, where every conversation starts from scratch, like you're meeting someone with severe short-term memory loss for the first time. The article dissects the fundamental shift from stateless language models (where context evaporates the moment a session ends) to persistent AI agents that maintain state across days, weeks, and months through sophisticated memory architectures. Yava breaks down five distinct types of long-term memory that mirror human cognition: episodic memory for timestamped events ("John completed DevOps training on September 20"), semantic memory for generalised knowledge ("User prefers markdown format"), procedural memory for learned workflows (multi-step fraud detection processes), factual memory for durable entity information, and working memory for active reasoning scratchpads. The real revelation is understanding that modern production systems don't choose between these memory types; they layer them strategically, using three complementary architectural paradigms that work together like a cognitive orchestra.

  The article delivers detailed technical blueprints for implementing this three-layer memory stack: vector databases (Pinecone, Milvus, Weaviate) enable semantic similarity search at scale, knowledge graphs (Neo4j, Zep, GraphRAG) model entity relationships and enable multi-hop temporal reasoning, and event sourcing (LangGraph checkpoints, EventStoreDB) maintains immutable audit trails of every state change for perfect reconstruction and compliance. What separates this from typical AI architecture pieces is the practical implementation patterns, complete with code examples showing how to combine LangGraph's checkpointing for short-term memory with vector stores for cross-session retrieval, how to diagnose incidents using temporal knowledge graphs that track system dependencies with time-aware relationships, and how to implement learned procedural strategies that improve based on user feedback loops. The author addresses real production challenges head-on: information overload requiring intelligent consolidation and priority scoring, temporal inconsistency requiring validity checks on ageing facts, and privacy compliance requiring selective deletion with "right to be forgotten" purges.

  The most compelling insight? Research from Pinecone shows that maintaining appropriate conversational context improves user satisfaction by 40%, because when an agent remembers what you said five minutes ago, it fundamentally shifts from feeling like a tool to working with a colleague. Yava provides a pragmatic development roadmap from MVP (weeks 1-2 with basic LangGraph checkpointing) through enterprise deployment (months 3+ with distributed Kafka event logs and multi-region graph replication), making this immediately actionable for teams at any maturity level. The bottom line crystallises beautifully: "Intelligence without memory is just a costly search engine. Intelligence with memory? That's when things get interesting." As AI agents move from research demos into production environments handling financial compliance, customer service, and enterprise automation, memory architecture isn't just a nice-to-have: it's becoming as critical as the language model itself, because the agents that will succeed aren't necessarily those with the best models, but those with the best memory systems enabling them to learn, adapt, and build genuine understanding over time rather than perpetually starting from zero.

---

* [**How to write a great agents.md: Lessons from over 2,500 repositories**][4]. Matt Nigh explores GitHub's recently released custom agents feature through an exhaustive analysis of over 2,500 agents.md files across public repositories, revealing a stark divide between agents that fail spectacularly and those that deliver real value. The difference comes down to one brutal truth: vague prompts like "You are a helpful coding assistant" are worthless, while "You are a test engineer who writes tests for React components, follows these examples, and never modifies source code" actually works. GitHub Copilot's agents.md files allow developers to build specialised AI teammates (@docs-agent for technical writing, @test-agent for quality assurance, @security-agent for security analysis) where each file acts as an agent persona defined through frontmatter and custom instructions covering the exact tech stack, project file structure, workflows, executable commands, code style examples, and critically, clear boundaries of what not to do. The challenge isn't technical complexity; it's specificity, and Nigh's data-driven analysis shows that successful agents cover six core areas: commands (with flags and options, not just tool names), testing practices, project structure, code style with actual examples, git workflow, and explicit boundaries.

  The article delivers immediately actionable patterns that separate effective agents from digital dead weight: put executable commands early because agents reference them constantly (`npm test`, `pytest -v`, `cargo test --coverage`), prioritise real code snippets over explanatory paragraphs (one example showing your style beats three paragraphs describing it), and implement three-tier boundaries using "always do, ask first, never do" frameworks that prevent destructive mistakes like committing secrets or modifying production configs. Nigh provides detailed blueprints for six essential agents worth building immediately, from @docs-agent (reads code from `src/`, writes documentation to `docs/`, runs `markdownlint` to validate its own work) to @dev-deploy-agent (handles builds and deployments to local dev environments but requires explicit approval for anything risky). What makes this particularly valuable is the complete starter template with YAML frontmatter, persona definition, project knowledge section, tools catalogue, standards with naming conventions, and boundary specifications that developers can copy-paste and customise rather than starting from scratch.

  The fundamental insight crystallises around a simple principle: AI agents need operating manuals, not mission statements. The best agents.md files function as detailed instruction sets that grow through iteration rather than upfront planning. You start minimal with just three elements (agent name, description, persona), test it against real tasks, then add specificity when the agent makes mistakes. For teams drowning in documentation debt, test coverage gaps, or code style inconsistencies, this represents a shift from hoping AI "just figures it out" to engineering specialised teammates with clearly defined responsibilities, executable toolchains, and guardrails preventing chaos. The analysis shows that successful implementations specify tech stacks with versions ("React 18 with TypeScript, Vite, and Tailwind CSS" not "React project"), provide concrete code examples showing good versus bad patterns in actual TypeScript/Python/whatever, and crucially set boundaries preventing agents from touching secrets, vendor directories, production configs, or any folder where autonomy becomes dangerous rather than helpful.

## Streaming

* [**Data Streaming Meets Lakehouse: Apache Iceberg for Unified Real-Time and Batch Analytics**][5]. Kai Waehner, in this post, distils the key insights from his Open Source Data Summit 2025 talk on Apache Iceberg, tackling the fundamental tension in modern data architectures: data lakes alone can't satisfy real-time business demands, but splitting operational and analytical workloads across separate systems makes building consistent, trusted data products nearly impossible. Apache Iceberg has emerged as the open table format of choice for organisations building modern lakehouses precisely because it enables governed, ACID-compliant tables in object storage (your own S3 bucket) that are accessible across every major engine: Kafka, Flink, Spark, Trino, and beyond, without vendor lock-in. When paired with Apache Kafka and Flink for data streaming, Iceberg unlocks powerful patterns: real-time streams transform into governed tables, those tables get reused across batch processing, SQL queries, and machine learning workloads, and critically, data quality and governance rules are enforced at the point of ingestion rather than discovered downstream when problems are exponentially more expensive to fix.

  The article delivers a reality check on the "Zero Copy" dream of writing Kafka topics directly into Iceberg tables, methodically dissecting why this appealing approach often backfires in production: streaming directly to Iceberg introduces write latency that kills operational systems requiring millisecond responsiveness, removes Kafka's ability to replay and reprocess events from source (losing the durable event log that enables recovery), forces data processing to happen at rest rather than in motion (delaying Bronze => Silver => Gold transformations), and adds hidden operational complexity around compaction, retention, catalog synchronisation, and tiered storage tuning. Waehner advocates storing data twice: Kafka maintains a raw event log, similar to a Write-Ahead Log in databases (providing durability and reprocessability), while Apache Iceberg stores structured, governed tables for downstream analytics, machine learning, and SQL workloads. He also tackles the Iceberg versus Delta Lake debate head-on: while Databricks even acquired Tabular (founded by Iceberg's original creators) to improve interoperability, Delta Lake remains tightly coupled to the Databricks platform, whereas Iceberg's vendor-neutral design and broad support across cloud providers, query engines, and open source projects makes it the default choice for enterprises prioritising flexibility, portability, and open governance.

  **My take:** The "store data twice" pattern Waehner advocates, Kafka as the durable event log, Iceberg as the governed analytical layer—mirrors proven database architecture for a reason, and too many teams learn this lesson the expensive way after trying to force Kafka topics to be everything simultaneously. What's particularly valuable here is the candid breakdown of operational complexity that vendor marketing glosses over: schematisation of semi-structured events, type conversions between Avro/Protobuf and Iceberg-compatible engines, safe schema evolution that maintains backward compatibility, data quality rules applied in motion, metadata synchronisation to catalogues like AWS Glue, and compaction of high-frequency event streams into query-optimised large files. These aren't edge cases; they're the core engineering challenges that determine whether your lakehouse architecture delivers on its promises or becomes another expensive science project. The session highlights how platforms like Confluent Cloud with Tableflow address these challenges through integrated governance, schema management, stream processing, and catalogue integration. Still, the architectural decisions around when to use Kafka versus Iceberg, how to handle schema evolution, and whether to embrace the "store data twice" pattern remain critical regardless of which vendor tools you choose.



## WIND (What Is Niels Doing)

Yesterday (Saturday, November 22) I was in Cape Town and delivered a talk at .NET Conf 2025: **C# + MCP + Azure AI: Building Conversational Enterprise Applications That Actually Work**. The session resonated well with the audience, always a relief when you're presenting new material! I had several people come up afterwards to discuss how they're planning to implement Model Context Protocol servers in their own projects. Something energising happens when presenting to developers who are genuinely excited about pushing the boundaries of what's possible with AI integration.

Next weekend, I'm heading to Johannesburg for .NET Conf 2025, where I'll do the same talk. If you're in the Gauteng area and want to dive deep into how MCP servers can transform your Azure AI applications, come say hi! After that, I have one blissful weekend of doing absolutely nothing (famous last words, I know), and then it's time for our final Data & AI event of the year:

![](/images/posts/banner-mcp-santa-clause-2-96px-1920-2.png)

**Figure 1:** *Data & AI Community Day Durban: Season of AI - Merry Christmas People (MCP)*

Mark your calendars: **Saturday, December 13** is [**Data & AI Community Day Durban: Season of AI - Merry Christmas People (MCP)**][10]. Yes, we went there with the holiday pun, and no, we're not apologising. This is our last Data & AI Community Day event here in Durban for 2025, and we're planning to make it special. The Call for Speakers is still open for a couple more days, so if you have any "cool stuff" to present, please submit a session proposal. And here's the thing: it doesn't have to be about MCP! Essentially, anything you find interesting and think the community would benefit from is welcome. We're all about sharing knowledge and building each other up.

Speaking of which, we're opening registrations [**today**][12]. Fair warning: these tickets tend to disappear faster than free pizza at a developer meetup. Our Durban events have consistently sold out quickly, proving there's a massive appetite for quality tech education in smaller cities. Don't sleep on this one, grab your ticket while you can! See below for event details, including link to registration and CfS:

🎙️ **Event Details:**

🎄 **Event Name:** [**Data & AI Community Day Durban: Season of AI - Merry Christmas People (MCP)**][10]<br>
📆 **Date:** **December 13**, 2025 <br>
🏨 **Venue:** [**Richfield College, Umhlanga Campus**][11]. <br>
🌍 [**View Event Information**][10] <br>
👨‍🏫 [**Registration Page**][12] <br>
📖 [**Call for Speakers**][13]

I hope to see you all in Johannesburg next weekend and then in Durban on December 13 for what promises to be an exciting conclusion to our 2025 Data & AI Community Day series!

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

[1]: https://github.blog/ai-and-ml/unlocking-the-full-power-of-copilot-code-review-master-your-instructions-files/
[2]: https://medium.com/ai-software-engineer/google-gemini-3-0-pro-and-nano-banana-pro-release-next-week-heres-what-to-expect-6db52a29e2ef?sk=v2%2Ffc5101f7-9bc7-48d5-8b71-dce888f08494
[3]: https://pub.towardsai.net/building-ai-agents-that-actually-remember-a-deep-dive-into-memory-architectures-db79a15dba70
[4]: https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/
[5]: https://www.kai-waehner.de/blog/2025/11/19/data-streaming-meets-lakehouse-apache-iceberg-for-unified-real-time-and-batch-analytics/
[10]: https://aimldatadurban.org/events/2025/season-of-ai-mcp/
[11]: https://www.richfield.ac.za/campus/umhlanga/#
[12]: https://www.quicket.co.za/events/349495-data-ai-community-day-durban-season-of-ai-merry-christmas-people-mcp/?ref=link-campaign&lc=blog
[13]: https://sessionize.com/soai-durban-mcp/


