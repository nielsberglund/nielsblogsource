---
type: post
layout: "post"
title: Interesting Stuff - Week 29, 2025
author: nielsb
date: 2025-07-20T09:39:28+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-29-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-29-25.jpg"
categories:
  - roundup
tags:
  - streaming
  - tigerdata
  - generative AI
  - AI agents
  - OpenAI
  - AI coding
  - Claude Code
description: "This week brought developments that signal we're crossing major thresholds in AI and data architecture, from MIRIX's revolutionary memory system to OpenAI's ChatGPT Agent marking the shift from conversational AI to actionable digital colleagues. The common thread is clear: we're moving from AI as a tool to AI as a collaborator, where the future belongs to those who can design intelligent systems and master orchestration over implementation."
---

This week brought some truly fascinating developments that signal we're crossing major thresholds in AI and data architecture. From MIRIX's revolutionary memory system, which enables AI agents to genuinely learn and evolve, to OpenAI's ChatGPT Agent, marking the shift from conversational AI to actionable digital colleagues, we're witnessing the emergence of AI as true collaborators rather than just sophisticated tools. 

Meanwhile, developers like Kieran Klaassen are shipping faster than ever without writing a single line of code. At the same time, Google's Richard Seroter argues that architectural thinking now matters more than implementation, suggesting the future belongs to those who can design intelligent systems rather than just build them. The common thread across all these developments is clear: we're moving from AI as a tool to AI as a collaborator, and the winners will be those who master orchestration over implementation.

<!--more-->

## Generative AI

* [MIRIX: Multi-Agent Memory System for LLM-Based Agents][1]. In this groundbreaking research paper, Yu Wang and Xi Chen from MIRIX AI tackle one of the most critical limitations facing modern AI agents: the ability to truly remember and learn from past interactions. While current LLM-based agents excel at complex tasks, they remain fundamentally stateless, unable to build lasting memories that enable genuine personalisation and continuity.

  The researchers introduce MIRIX, a sophisticated multi-agent memory system that surpasses traditional flat storage approaches. What sets MIRIX apart is its human-inspired architecture featuring six distinct memory types: Core Memory (persistent user preferences), Episodic Memory (time-stamped events), Semantic Memory (abstract knowledge and relationships), Procedural Memory (step-by-step workflows), Resource Memory (documents and files), and Knowledge Vault (sensitive information like credentials).

  The system's innovation lies in its multi-agent coordination; eight specialised agents work together, with six Memory Managers handling individual memory components and a Meta Memory Manager orchestrating the entire process. This approach enables dynamic routing of information to appropriate memory stores while maintaining efficiency at scale.

  MIRIX demonstrates remarkable performance improvements in challenging scenarios. On their novel ScreenshotVQA benchmark, requiring analysis of up to 20,000 high-resolution computer screenshots , MIRIX achieves 35% higher accuracy than RAG baselines while reducing storage requirements by an astounding 99.9%. On the LOCOMO conversational benchmark, it reaches a state-of-the-art performance of 85.4%, significantly outperforming existing memory systems.

  Here's what makes this particularly exciting: The researchers haven't just built an academic proof of concept. They've developed a practical application that monitors your screen in real-time, building personalised memory that can answer questions about your digital activities. This bridges the gap between research and real-world utility in a way that could fundamentally change how we interact with AI assistants.

  The implications extend beyond personal computing. The paper envisions applications in wearable devices, creating AI companions that truly evolve with users, and even proposes an "Agent Memory Marketplace" where personalised memories could become valuable digital assets. This isn't just about better chatbots; it's about AI systems that genuinely understand and adapt to individual users over time.

<div align="center">_ _ _ _ _ _ _</div></br>

* [Topic Model Labelling with LLMs][2]. Petr Koráb and colleagues address a critical challenge in topic modelling with their comprehensive tutorial on automating topic labelling using GPT-4-o-mini. While topic models excel at discovering hidden themes in large text collections, they traditionally output cryptic numerical IDs that require manual interpretation by domain experts—a process that becomes increasingly unwieldy as the number of topics grows.

  This post by Koráb demonstrates how the new Turftopic Python package revolutionises this workflow by seamlessly integrating cutting-edge FASTopic models with LLM-based labelling. The FASTopic model, presented at NeurIPS, outperforms established methods, such as BERTopic, on key metrics, including topic diversity, making it particularly valuable for business intelligence applications.

  The tutorial guides you through a complete pipeline using synthetic customer care email data, demonstrating how to train a FASTopic model on customer complaints and automatically generate human-readable labels, such as "Billing and Payment Issues" or "Product Quality and Defects," instead of generic "Topic 0" or "Topic 1" designations.

  What makes this approach particularly compelling is its practical benefits: independence from subjective human labellers, scalability to handle large numbers of topics that would overwhelm manual reviewers, and enhanced reproducibility through documented code rather than ad-hoc copy-pasting into ChatGPT interfaces.

  The authors demonstrate the complete workflow from data preprocessing through bigram vectorisation to final visualisation with word clouds. Their use of bigrams (two-word phrases) over single words provides more contextually rich insights, distinguishing between "delivery" and "poor delivery" or "stomach" and "sensitive stomach" for more actionable business intelligence.

  Here's what I find most intriguing: this tutorial represents a broader shift toward hybrid AI workflows where traditional machine learning models are enhanced by large language models for interpretation tasks. Rather than replacing topic modelling entirely, LLMs serve as intelligent interpreters that bridge the gap between algorithmic outputs and human understanding.

  The approach also highlights an important consideration for practitioners. While the labels remain slightly different across training runs due to model randomness, this variability stems from the underlying topic model rather than the LLM labeller, emphasising the importance of understanding your entire pipeline.

<div align="center">_ _ _ _ _ _ _</div></br>

* [Reflections on OpenAI][3]. Author Calvin French-Owen reveals the paradoxes of working at OpenAI, a company that operates like a research lab but accidentally created the most viral consumer app in history. The culture he describes is refreshingly bottom-up and meritocratic, where "good ideas can come from anywhere" and researchers function as "mini-executives" pursuing their own interests. This explains both OpenAI's remarkable innovation speed and some of its organisational chaos.

  The technical details are particularly illuminating. Everything runs on Slack (no email!), the entire codebase is a giant Python monorepo, and they're heavily dependent on Azure's limited service offerings compared to AWS. Most strikingly, French-Owen notes that "nearly everything is a rounding error compared to GPU cost", a single niche Codex feature consumed as much compute as Segment's entire infrastructure.

  What I find most compelling about French-Owen's account is his description of the Codex launch: built from the first line of code to full public release in just 7 weeks with a small team working brutal hours. The product has since generated 630,000 public pull requests—roughly 78,000 PRs per engineer, in just 53 days post-launch. These numbers are staggering and demonstrate the potential impact that occurs when cutting-edge AI capabilities are combined with effective execution.

  The cultural observations paint OpenAI as serious but not stuffy, with leadership deeply engaged (executives regularly chime in on Slack) and teams that can rapidly reorganise around promising ideas. French-Owen notes the company "runs on Twitter vibes" as much as analytics, reflecting its unique position as both a research organisation and consumer-facing brand.

  Perhaps most intriguingly, French-Owen positions this as a "three-horse race" between OpenAI, Anthropic, and Google, each taking different paths based on their DNA (consumer vs business vs infrastructure). His advice for founders whose startups aren't gaining traction? Join one of the big labs during this incredible moment in AI development.

  This insider account arrives at a crucial inflection point where understanding these organisations' internal dynamics could be key to predicting how AGI development unfolds. What aspects of OpenAI's culture will be most vital as they scale toward their ultimate goal?


<div align="center">_ _ _ _ _ _ _</div></br>

* [How I Use Claude Code to Ship Like a Team of Five][4]. Kieran Klaassen makes a bold claim that demands attention: he hasn't typed a function in weeks, yet he's shipping code faster than ever using Claude Code. As the general manager of Cora, Every's email management tool, Klaassen has transformed from a programmer into what he calls an "engineering manager overnight," directing a team of AI developers who never sleep or complain.

  This post by Klaassen illustrates a fundamental shift in software development, from manually implementing code to orchestrating outcomes. What sets Claude Code apart from other AI coding tools isn't just its capability, but its seamless integration into existing workflows. Unlike IDEs that lock you into specific editors or platforms, forcing you into their interfaces, Claude Code adapts to your terminal, Git worktrees, and command-line tools.

  The real power emerges in Klaassen's parallel processing workflow, which involves running multiple Claude Code instances simultaneously across different terminal tabs, each handling distinct tasks such as bug fixes, code reviews, changelog generation, and production debugging. His monitor resembles "mission control" with multiple agents working on separate features through different git worktrees simultaneously.

  What's most compelling is how this changes the mental model of programming. Instead of thinking about files and functions, the "letters and words of code", developers now focus on feature specifications, system architecture, and product outcomes. The mundane implementation details are delegated, freeing cognitive resources for higher-level design decisions.

  Klaassen's morning workflow is particularly revealing: by 11 AM, he has five Claude Code instances, each creating a separate pull request with proper descriptions, linked issues, and team conventions. His two-person team produces output equivalent to a much larger engineering group, spending just $400 monthly on Claude Code subscriptions that "pay for themselves in days."

  The debugging example showcases Claude Code's senior-level capabilities—methodically walking through thousands of lines of third-party Ruby gem code to discover a production environment mismatch that would have taken human developers hours to uncover. This isn't just autocomplete; it's systematic problem-solving.

  For junior developers, Klaassen positions Claude Code as an always-available mentor, encouraging them to ask questions like "What are the 10 things wrong with this pull request?" or "How would a Python engineer approach this versus a Ruby engineer?" This could dramatically accelerate learning curves and democratise access to senior-level guidance.

  Here's what strikes me most: Klaassen argues this transition requires "unlearning coding" and thinking more like a tech lead focused on delegation and outcomes rather than implementation details. The successful developers of the future may be those who master this shift from doing to directing.

<div align="center">_ _ _ _ _ _ _</div></br>

* [Introducing ChatGPT agent: bridging research and action][5]. OpenAI unveils ChatGPT Agent, marking a significant leap toward AI systems that not only converse but also actively take action in the digital world.  This unified agentic system combines the web interaction capabilities of Operator with the analytical depth of deep research, creating what OpenAI calls its most capable AI assistant to date.

  OpenAI in this product release demonstrates how the ChatGPT agent bridges the gap between research and execution.. Users can now request complex, multi-step tasks, such as "look at my calendar and brief me on upcoming client meetings based on recent news" or "analyse three competitors and create a slide deck," and watch as ChatGPT intelligently navigates websites, filters results, runs code, and delivers editable presentations.

  The system's architecture is particularly impressive; it operates through its own virtual computer with access to visual browsers, text-based browsers, terminal access, and direct API connections. This allows ChatGPT to choose the optimal path for each task, whether gathering calendar information through APIs, reasoning over large text documents, or visually interacting with human-designed websites.

  What sets this apart from previous AI tools is the collaborative workflow design. Users maintain control throughout the process, able to interrupt, take over the browser, or redirect tasks at any point. ChatGPT proactively seeks clarification when needed and requires explicit permission before consequential actions, such as making purchases or sending emails.

  The performance benchmarks are striking: ChatGPT agent achieves 41.6% on Humanity's Last Exam (a new state-of-the-art), 27.4% on FrontierMath (the hardest known math benchmark), and significantly outperforms humans on data science tasks. On complex knowledge-work tasks, it performs comparably to or better than humans in roughly half the cases across various professional scenarios.

  Here's what makes this release particularly significant: OpenAI has implemented comprehensive safety measures, treating the system as having "High Biological and Chemical capabilities" under their Preparedness Framework. They've developed extensive safeguards against prompt injection attacks, where malicious websites might try to manipulate the agent's behaviour through hidden instructions.

  The rollout strategy is measured; Pro users get 400 messages monthly, other paid users receive 40 messages, with availability expanding gradually to Team and Enterprise customers. The system acknowledges its limitations, particularly noting that slideshow generation is still in beta and may have rudimentary formatting at times.

  This represents a fundamental shift from AI as a conversational partner to AI as an active digital collaborator capable of complex, multi-tool workflows. The implications extend beyond productivity—this could reshape how we interact with digital systems entirely. Rather than learning specific software interfaces, users can describe desired outcomes and let AI handle the implementation details.

  What concerns or opportunities do you see in this transition from AI assistants that chat to AI agents that act directly in digital environments?

<div align="center">_ _ _ _ _ _ _</div></br>

* [Code was the least interesting part of my multi-agent app, and here’s what that means to me][7]. Richard Seroter offers a thought-provoking perspective on the evolving nature of software development in an era where AI can generate the vast majority of implementation code. As Google Cloud's Chief Evangelist with 27 years in tech, Seroter built a multi-agent roofing appointment system where AI generated 90% of the code; yet, the code itself was the least interesting part of the entire endeavour.

  This post by Seroter illuminates a fundamental shift in software engineering priorities.. His central thesis resonates with many developers: most of the code we've ever written could have been produced by AI, probably at a higher quality. The straightforward database access, web APIs, and presentation logic that constitute the bulk of typical applications represent solved problems that AI can handle effectively.

  What makes Seroter's exploration compelling is his systematic breakdown of the eight architectural decisions that truly mattered in his agentic system. These choices—from evaluating whether agents make sense for the problem to selecting frameworks, designing tool interactions, and managing agent boundaries—represent the kind of higher-order thinking that remains distinctly human..

  The technical architecture he describes is particularly insightful: separate agents for appointments and invoicing are connected via Google Cloud Pub/Sub, with sub-agents handling specialised tasks such as weather checking and promotional offer retrieval. His decision to use Google's Agent Development Kit (ADK) with its support for multiple agent patterns, flexible tools, and runtime-agnostic deployment demonstrates thoughtful framework selection rather than default choices..

  Seroter's approach to agent boundaries showcases sophisticated system design thinking. Rather than cramming everything into a single agent with complex prompts and dozens of tools, he created focused agents that can operate within the same process space while maintaining clear separation of concerns. The Sequential Agent pattern enables distinct agents to run sequentially without the overhead associated with a distributed system..

  What strikes me most about Seroter's analysis is his emphasis on "context engineering", crafting precise instructions, constraints, and tool access for each agent. His booking agent instructions include core principles, operational steps, must-have data requirements, decision trees, and explicit tool usage patterns. This represents a new form of software specification that's more conversational yet equally rigorous.

  The practical implementation details reveal the current state of agentic development: containerised components are deployed to Cloud Run for maximum flexibility, MCP (Model Context Protocol) is used for database access, and careful consideration is given to when to use function calling versus API integration. His choice to treat agents "like any other type of code" rather than using specialised agent hosting platforms reflects a pragmatic approach to a rapidly evolving technology landscape.

  Looking at Seroter's final system, from initial conversation through weather checking, appointment booking, Pub/Sub messaging, database queries, and PDF generation, it's clear that the architectural orchestration required significantly more thought than any individual code component. This suggests that we're moving toward a future where software engineering focuses more on designing intelligent workflows and less on implementing algorithms. 

  How do you see this shift toward architectural thinking over implementation affecting the skills and career paths that will be most valuable for software professionals?

## Streaming

* [Tiger Lake: A New Architecture for Real-Time Analytical Systems and Agents][6]. TigerData (formerly Timescale) introduces Tiger Lake in this post. This groundbreaking architecture eliminates one of the most persistent challenges in modern data engineering: the artificial separation between operational systems running on PostgreSQL and analytical systems built on data lakehouses. This represents a fundamental shift toward unified, real-time data architectures.

  The post identifies a critical pain point that resonates across the industry, the fragmentation that forces teams to stitch together streams, pipelines, and custom jobs, each introducing latency, fragility, and cost. The result is a patchwork of systems that struggle to deliver complete context in real time, limiting what developers can actually build.

  Tiger Lake's approach is architecturally elegant: it creates a continuous, bidirectional data loop between Postgres and the lakehouse, using open standards throughout. Apache Iceberg tables stored in Amazon S3, continuous replication from Postgres into Iceberg, streaming ingestion back into Postgres for low-latency serving, and query pushdown from Postgres to Iceberg for efficient rollups—all working natively without external orchestration frameworks.

  What makes this particularly compelling is how it reimagines the medallion architecture for real-time systems. Instead of the traditional batch-oriented Bronze-Silver-Gold workflow, Tiger Lake enables a continuous operational medallion where enrichment and serving happen in real time. Raw data lands in Iceberg (Bronze), cleaned data is replicated to Postgres (Silver), and aggregates computed in Postgres stream back to Iceberg for analysis (Gold).

  The practical implications are significant. Customer-facing dashboards can now combine live metrics with historical aggregates in single queries, monitoring systems can inspect fresh telemetry alongside historical incidents, and AI agents can access both recent user activity and long-term interaction history without complex orchestration pipelines.

  The agentic use case is particularly intriguing: imagine a support agent system where the large body of historical support cases remains in Iceberg. At the same time, Tiger Lake automatically creates and maintains chunk and vector embeddings in Postgres. This enables vector search against operational databases for AI chat questions while ensuring embeddings stay fresh without complex pipeline maintenance.

  Looking at the roadmap, the upcoming "round-trip intelligence" capabilities promise even more integration: querying Iceberg catalogues directly from within Postgres and full round-trip workflows where you can ingest into Postgres, enrich in Iceberg, and stream results back automatically. This represents a move toward truly unified architectures where the distinction between operational and analytical systems becomes largely invisible to developers.

  Here's what strikes me as most significant: TigerData is positioning this as foundational infrastructure for "Agentic Postgres": a Postgres foundation specifically designed for intelligent systems that learn, decide, and act. This suggests they're anticipating a future where AI agents require seamless access to both real-time operational context and deep historical understanding.

  The timing feels crucial as more organisations struggle with the complexity of maintaining separate operational and analytical stacks while trying to build real-time, context-aware applications. Tiger Lake appears to eliminate the architectural trade-offs that have historically forced teams to choose between operational efficiency and analytical depth..

  How do you envision this type of unified, real-time architecture influencing the broader landscape of data infrastructure, particularly as AI applications increasingly require both fresh operational context and historical depth? 

## WIND (What Is Niels Doing)

As regular readers know (and if you didn't, now's a good time to catch up 👀), I've been co-organising the [Data & AI Community Day Durban][8] events for a while now. These events bring together a vibrant mix of participants, speakers, and sponsors, each with their own quirks and requirements. Behind the scenes, we rely on a contact and event management system to keep this ecosystem running. And while it's served us reasonably well, it's starting to feel like we're asking a tricycle to win a Formula 1 race.

At Derivco, where I am an Architect Lead, we've been exploring AI-assisted coding with tools like GitHub Copilot and Claude Code. The timing feels perfect to test these AI copilots in a real-world scenario: building a purpose-built contact and event management system tailored to the unique needs of [Data & AI Community Day Durban][8]. This isn't just about replacing one system with another; it's about seeing how far modern AI tools can stretch when applied to a complex, practical problem.

I'll be chronicling this journey in a new blog series, sharing insights, technical discoveries, and a few confessions about when the AI got it hilariously wrong. Keep an eye out for the upcoming posts; they promise to be as enlightening as they are entertaining.

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

[1]: https://arxiv.org/pdf/2507.07957
[2]: https://towardsdatascience.com/topic-model-labelling-with-llms/
[3]: https://calv.info/openai-reflections
[4]: https://every.to/source-code/how-i-use-claude-code-to-ship-like-a-team-of-five
[5]: https://openai.com/index/introducing-chatgpt-agent/
[6]: https://www.tigerdata.com/blog/tiger-lake-a-new-architecture-for-real-time-analytical-systems-and-agents
[7]: https://seroter.com/2025/07/17/code-was-the-least-interesting-part-of-my-multi-agent-app-and-heres-what-that-means-to-me/
[8]: https://aimldatadurban.org/
