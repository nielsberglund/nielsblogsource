---
type: post
layout: "post"
title: Interesting Stuff - Week 42, 2025
author: nielsb
date: 2025-10-19T09:09:16+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-42-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-42-25.jpg"
categories:
  - roundup
tags:
  - distributed computing
  - Anthropic
  - Netflix
  - Generative AI
  - Claude Code
  - dotnetconfsa
description: "Week 42 tech roundup: Netflix's 5M records/sec distributed graph system, training GPT-2 models for $92, AI-powered COBOL modernization, Claude Haiku 4.5's frontier performance at 1/3 the cost, plus Agent Skills' innovative approach to AI specialization. .NET CONF South Africa Community Edition heads to Durban on Nov 15!"
---

Week 42 delivers a masterclass in engineering honesty and AI accessibility that cuts through the usual tech hype. Netflix's Adrian Taruc and James Dalton reveal how they built a Real-Time Distributed Graph processing system capable of handling 5 million records per second, candidly admitting their initial monolithic Flink job was an "operational headache" before pivoting to a more complex but maintainable architecture. Andrej Karpathy proves AI training doesn't require enterprise budgets with nanochat. Training a GPT-2-calibre model in under four hours for approximately $92. GitHub's Andrea Griffiths tackles the COBOL crisis, showing how AI agents can modernise 65-year-old mainframe systems without developers learning COBOL. Anthropic dominates with Claude Haiku 4.5 (frontier performance at one-third the cost) and Agent Skills, an elegantly simple filesystem-based approach to agent specialisation that treats domain expertise like employee onboarding through progressive disclosure and structured folders.

Yesterday, I found myself in Johannesburg delivering **Generative AI for Beginners: Build Your First Agent with Azure AI Foundry** at the Data & AI Community Day event to an almost-full house. There's no rest ahead, though, for the first time ever, **.NET Conf South Africa Community Edition** is coming to Durban on November 15 at **Richfield College**, and we're actively seeking speakers with .NET, C#, Blazor, MAUI, ASP.NET Core, or Azure expertise to share with the KwaZulu-Natal developer community.

<!--more-->

## Distributed Computing

* [**How and Why Netflix Built a Real-Time Distributed Graph: Part 1 — Ingesting and Processing Data Streams at Internet Scale**][6]. In this post, Adrian Taruc and James Dalton unveil Netflix's ambitious journey to build a Real-Time Distributed Graph (RDG), tackling one of modern streaming's most complex challenges: connecting the dots across member interactions that span multiple devices, content types, and business verticals. The motivation is elegantly simple yet technically daunting; imagine a user binging Stranger Things on their phone, switching to their smart TV mid-episode, then jumping into the Stranger Things mobile game on their tablet. Traditional data warehouses would treat these as isolated events languishing in separate tables, but Netflix's graph system weaves them together almost instantaneously, creating a living tapestry of member behaviour. This becomes particularly crucial as Netflix evolves beyond its streaming roots into ad-supported tiers, live events (hello, Jake Paul vs. Mike Tyson), and gaming experiences that demand real-time relationship intelligence.

  The engineering architecture Netflix chose is a masterclass in distributed systems pragmatism. Rather than wrestling with batch processing dinosaurs, the team built a stream-processing pipeline leveraging Apache Kafka (handling roughly 1 million messages per second per topic) and Apache Flink for near-real-time event processing. The approach sounds straightforward until you hit the operational reality: their initial attempt at a monolithic Flink job consuming all Kafka topics became a tuning nightmare with different data volumes peaking at unpredictable times. The team's pivot to a 1:1 mapping of Kafka topics to Flink jobs, while creating more operational overhead, proved essential for stability and maintainability. The system now pumps over 5 million graph records per second (nodes plus edges) to Netflix's Data Mesh abstraction layer, transforming raw events into interconnected graph primitives through filtering, enrichment, transformation, deduplication, and persistence.

  **My take?** This is exactly the kind of architectural honesty the industry needs more of—Netflix doesn't shy away from admitting their first approach was "the hard way." Their willingness to multiply operational complexity (more jobs, more topics) to achieve per-component tunability is a lesson in choosing the right tradeoffs. The decision to embrace graph representation for relationship-centric queries, flexibility as connections grow, and pattern detection capabilities shows strategic foresight as streaming platforms become increasingly multi-modal. What's particularly intriguing is that this is only Part 1 covering ingestion and processing: the storage and serving layers promised in future instalments will likely reveal even more innovative solutions to querying billions of interconnected data points at Netflix scale.

## Generative AI

* [**Introducing nanochat: The best ChatGPT that $100 can buy**][1]. In this post, Andrej Karpathy delivers a masterclass in efficient AI model training with **nanochat**, a project that boldly asks: what's the best ChatGPT you can build for the price of a nice dinner? The answer is surprisingly capable. Running on an 8xH100 GPU cluster from Lambda GPU Cloud (costing roughly $24/hour), Karpathy meticulously documents a complete LLM training pipeline: from environment setup through pretraining, midtraining, supervised finetuning, and optional reinforcement learning, all completed in under four hours for approximately $92. The project leverages cutting-edge tools, including a custom Rust tokeniser (because Python's minbpe was "way too slow"), the FineWeb-EDU dataset re-packaged into shuffled shards, Apache Flink for stream processing, and the Muon optimiser for matrix operations. The resulting 560M-parameter Transformer achieves a CORE score of 0.22, placing it between GPT-2 Large and GPT-2 XL in capability—not bad for a model that costs less than your cloud computing bill.

  What makes this project particularly valuable is Karpathy's transparent documentation of the engineering challenges and pragmatic solutions. The tokeniser comparison alone is enlightening: their custom 65,536-token vocabulary achieves 4.8x compression on FineWeb text, outperforming GPT-2 across most domains (except math) while falling behind GPT-4's larger 100,277-token vocabulary on multilingual and code tasks. The pretraining architecture decisions are equally instructive: the team initially attempted a monolithic Flink job consuming all Kafka topics, which became an "operational headache" due to varying throughput patterns, forcing a pivot to 1:1 topic-to-job mapping despite increased overhead. During the three-hour pretraining phase, processing 11.2 billion tokens at ~4e19 FLOPs, the model learns fundamental world knowledge (Paris is France's capital, Au is gold, Saturday follows Friday) while hilariously struggling with basic arithmetic and remaining "not so sure about the colour of the sky yet." The mid-training and supervised finetuning stages add conversational capabilities and teach the model crucial skills like handling multiple-choice quizzes (mixing in 100K MMLU questions) and using Python interpreters for math problems.

  **Here's my honest take:** This is the kind of project that makes AI accessible and demystifies the "magic" behind modern language models. Karpathy's willingness to share not just the successes but the failures, like the monolithic Flink job disaster or admitting "it won't win any physics or poem competitions anytime soon"- is refreshingly honest in an industry often drowning in hype. The entire codebase spans just 8,304 lines across 44 files, proving you don't need enterprise-scale infrastructure or months of compute time to understand LLM training fundamentals. What's particularly clever is the `--depth` parameter as a "single slider of complexity," allowing anyone to scale from the $100 baseline model to larger variants by simply adjusting layer count while the code auto-adjusts learning rates, channels, and batch sizes. The optional RL stage on GSM8K problems showcases how reinforcement learning can boost math performance from 4.5% to 7.6% accuracy. However, Karpathy candidly admits this component "is not super well-tuned" and creates a task-specific rather than general model. For anyone wanting to truly understand LLM training beyond surface-level explanations, nanochat offers a readable, well-commented roadmap to building your own AI assistant, ice cream budget included.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**How GitHub Copilot and AI agents are saving legacy systems**][2]. Andrea Griffiths, in this post, tackles one of enterprise software's most intimidating challenges: modernising COBOL systems that have been running critical infrastructure since before the internet existed. The setup is delightfully dramatic. Imagine being tasked with updating mainframe code processing millions of daily ATM transactions, written in a language older than your parents, with the original developers retiring faster than you can say "legacy technical debt." The problem is both massive and urgent: 200 billion lines of COBOL code still power banks, insurance companies, and government systems, yet finding developers who understand COBOL is "like finding unicorns." Enter the unlikely hero: Julia Kordick, a Microsoft Global Black Belt who's successfully modernising COBOL systems despite never having learned COBOL herself. Her secret weapon? GitHub Copilot and autonomous AI agents are working alongside domain experts who've spent decades understanding these systems. The key insight isn't replacing human expertise, it's amplifying it through intelligent tooling that can parse decades-old code and translate its business logic into something modern developers can actually work with.

  The three-step framework Julia's team developed is brilliantly pragmatic and applicable beyond just COBOL modernisation. Step one involves code preparation using GitHub Copilot as an "archaeological tool" to reverse-engineer business logic, automatically document everything in markdown, identify call chains and dependencies, and clean up historical cruft—all without hiring expensive consultants for months of manual analysis. Step two focuses on enrichment by translating non-English comments, leveraging COBOL's deterministic four-division structure (IDENTIFICATION, ENVIRONMENT, DATA, PROCEDURE) to help AI parse and explain code in plain English, and creating markdown documentation that becomes the "source of truth" for future reference. The third step involves automating at scale through Microsoft Semantic Kernel, which orchestrates specialised agents: one reads COBOL files, another traces CALL statements between programs, a third generates Mermaid diagrams visualising system architecture, and others handle test-driven modernisation by extracting business logic, generating validation tests, and producing modern code that passes those tests. The cost efficiency is remarkable, typically $2-5 per 1,000 lines analysed, with the entire open-source framework available at [aka.ms/cobol](aka.ms/cobol) for anyone to fork and experiment with.

  What I appreciate most about this approach is Griffiths' unflinching honesty about limitations; there's no Silicon Valley magical thinking here. Julia explicitly warns that "everyone who's currently promising you 'hey, I can solve all your mainframe problems with just one click' is lying to you," acknowledging that humans must stay in validation loops, each COBOL codebase brings unique complexity, we're early in the agentic AI journey, and full automation is probably five years away minimum. The traditional modernisation approach, hiring consultants who spend 5+ years on manual conversion, delivering auto-generated, unmaintainable code, then abandoning internal teams to figure it out, has failed repeatedly across organisations. The AI-powered alternative keeps teams involved throughout, helping them learn business logic organically while producing human-readable modern code that developers can actually maintain. Most COBOL programs perform simple CRUD operations that don't require mainframe complexity; they need modern distributed architecture simplicity. The framework's built-in cost tracking, human validation checkpoints, and the `doctor.sh` configuration script make this accessible to teams willing to start small—pick a legacy system under 5,000 lines, analyse one file with Copilot, document discoveries in markdown, and iterate from there. As the article provocatively concludes: "The best time to modernise legacy code was 10 years ago. The second-best time is now."

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Understanding Spec-Driven-Development: Kiro, spec-kit, and Tessl**][3]. This post by Birgitta Böckeler attempts to cut through the hype surrounding "spec-driven development" (SDD), one of AI coding's latest buzzwords, by diving deep into three tools claiming to implement it: Kiro, spec-kit (from GitHub), and Tessl. The fundamental premise sounds compelling: write structured specifications before code, let those specs become the source of truth for both humans and AI, and potentially never touch the generated code directly. Böckeler identifies three implementation levels that exist under the SDD umbrella: spec-first (a well-crafted spec written before AI-assisted development), spec-anchored (a spec maintained after task completion for feature evolution), and spec-as-source (a spec that becomes the main artefact over time, with humans never editing the code). While all SDD tools embrace spec-first approaches, their commitment to spec-anchored or spec-as-source varies wildly, and most leave the long-term maintenance strategy frustratingly vague. The definition of what constitutes a "spec" itself remains murky. Böckeler proposes it's "a structured, behaviour-oriented artefact written in natural language that expresses software functionality and serves as guidance to AI coding agents," distinguishing it from general context documents or "memory banks" that apply across all coding sessions.

  The three tools examined reveal dramatically different interpretations of SDD. Kiro provides the most straightforward workflow (Requirements → Design → Tasks) with structured user stories in "As a..." format and acceptance criteria in "GIVEN...WHEN...THEN..." format, generating three markdown documents but lacking a clear path for long-term spec-anchored usage. GitHub's spec-kit takes a more elaborate approach with its Constitution → Specify → Plan → Tasks workflow, creating extensive markdown files with embedded checklists tracking user clarifications, constitution violations, and research tasks—essentially "definitions of done" for each step. However, spec-kit's practice of creating separate branches for each spec suggests it treats specs as living artefacts for the lifetime of a change request rather than a feature, making it essentially spec-first rather than truly spec-anchored. Tessl Framework (still in private beta) represents the most ambitious vision, explicitly pursuing spec-as-source with 1:1 mappings between spec files and code files, even marking generated code with "// GENERATED FROM SPEC - DO NOT EDIT" warnings. Tessl's approach of keeping specs at a low abstraction level per code file theoretically reduces LLM interpretation steps and errors. However, Böckeler encountered non-determinism when generating code multiple times from identical specs—an experience that reminded her uncomfortably of writing "unambiguous and complete specifications."

  **I find Böckeler's scepticism both refreshing and warranted.** Her observations cut to the heart of SDD's practical challenges: tools like Kiro turned a simple bug fix into four user stories with 16 acceptance criteria, including absurdities like "As a developer, I want the transformation function to handle edge cases gracefully": a sledgehammer approach to cracking nuts. Spec-kit's verbose markdown output proved more tedious to review than actual code, with agents frequently ignoring instructions despite massive context windows or overzealously following constitution articles. The fundamental question "where does SDD sit?" remains unanswered—it seems unsuitable for both large, unclear features (requiring specialist product skills and stakeholder involvement) and small fixes (creating wasteful overhead). Most provocatively, Böckeler draws parallels to Model-Driven Development (MDD), which similarly promised to make code generation the "last-mile approach" through structured specifications (albeit in UML or DSLs rather than natural language). MDD failed for business applications because it operated at an awkward abstraction level with excessive overhead and constraints. Now we're essentially revisiting the same dream with LLMs removing MDD's parseable structure requirements—losing both the elaborate code generators AND the tool support for writing valid, complete, consistent specs, while gaining LLM non-determinism in return. As Böckeler warns with the German term "Verschlimmbesserung," we may be making things worse while trying to make them better. The principle of spec-first has clear value, but the elaborate workflows creating mountains of markdown files might amplify existing challenges like review overload and hallucinations rather than solving them.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Introducing Claude Haiku 4.5**][4]. This post from Anthropic announces Claude Haiku 4.5, their latest small model, demonstrating a familiar pattern in AI model economics. What commanded premium pricing five months ago now arrives at one-third the cost and more than double the speed. Claude Sonnet 4, which was state-of-the-art in May 2025, now has a lighter sibling delivering similar coding performance at $1/$5 per million input/output tokens. The benchmarks tell an interesting story: Haiku 4.5 scores 73.3% on SWE-bench Verified (versus Sonnet 4's 72.7%), outperforms its predecessor on computer use tasks (50.7% on OSWorld versus Sonnet 4's 42.2%), and even surpasses the frontier Sonnet 4.5 in certain scenarios. The value proposition targets users running real-time, low-latency applications, such as chat assistants, customer service agents, and pair programming. Haiku 4.5's combination of "high intelligence and remarkable speed" makes Claude for Chrome and Claude Code markedly more responsive than before.

  The architectural strategy Anthropic reveals is particularly clever: positioning Haiku 4.5 not just as a cheaper Sonnet alternative but as an orchestration component in multi-agent systems. Sonnet 4.5 can decompose complex problems into multi-step plans, then coordinate "a team of multiple Haiku 4.5s to complete subtasks in parallel", essentially creating a two-tier workforce where the frontier model does strategic planning and the efficient model handles tactical execution. This mirrors real-world team dynamics where senior architects design systems and junior developers implement components, except the "junior developers" now match what was senior-level performance just months ago. The safety evaluation results add an unexpected twist: in automated alignment assessments, Haiku 4.5 showed statistically significantly lower rates of misaligned behaviors than both Sonnet 4.5 and Opus 4.1, earning it the designation of "our safest model yet" and qualifying for the less restrictive AI Safety Level 2 classification versus ASL-3 for its larger siblings—proof that smaller isn't necessarily riskier when it comes to frontier AI safety.

  What strikes me most is how this release crystallises the relentless commoditisation curve in AI capabilities—a pattern we've seen play out repeatedly but that never stops being remarkable. Five months from frontier to budget tier represents an acceleration even beyond Moore's Law's historical pace. The testimonials from Augment and Warp highlight the practical implications: Augment reports that Haiku 4.5 "achieves 90% of Sonnet 4.5's performance, matching much larger models." At the same time, Warp's founder notes that the "responsiveness makes AI-assisted development feel instantaneous." This isn't just incremental improvement; it's a fundamental shift in what's economically viable for production deployments. Applications that couldn't justify Sonnet 4.5's costs can now access near-frontier capabilities. Meanwhile, those already using premium models can architect hybrid solutions, reserving expensive frontier calls for genuinely complex reasoning while routine tasks are handled by the efficient tier. The methodology notes reveal Anthropic's commitment to rigorous benchmarking. Averaging scores over 10-50 trials with 128K thinking budgets and detailed test-time compute configurations, but what they're really documenting is the pace at which AI capabilities are flowing downmarket, turning yesterday's cutting-edge into tomorrow's commodity infrastructure.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Equipping agents for the real world with Agent Skills**][5]. This post from Anthropic introduces Agent Skills, a deceptively simple yet architecturally elegant solution to a fundamental challenge in agentic AI: how to equip general-purpose agents with domain-specific expertise without building fragmented, custom-designed agents for every use case. The core insight is brilliant in its simplicity: treat agent specialisation like employee onboarding by packaging procedural knowledge, scripts, and resources into organised folders that agents can discover and load dynamically. An Agent Skill is just a directory containing a `SKILL.md` file with YAML frontmatter (name and description) that gets pre-loaded into the system prompt, allowing Claude to determine when each skill should be used without consuming massive context. The PDF skill example demonstrates this elegantly: while Claude already understands PDFs conceptually, it cannot manipulate them directly (like filling forms). The skill bundles Python libraries, command-line tools, detailed instructions in `reference.md`, and form-specific guidance in `forms.md`. All accessible on demand rather than permanently occupying context window real estate.

  The architectural genius lies in **progressive disclosure**, a three-tier information hierarchy that mirrors how humans navigate documentation. Level one loads only skill metadata (roughly 100 tokens) into every agent's system prompt at startup, providing just enough information for Claude to know when to trigger each skill. Level two—the `SKILL.md` body (around 5K tokens), gets loaded when Claude determines the skill is relevant to the current task. Level three and beyond consists of additional linked files (with effectively unlimited capacity) that Claude navigates and discovers only as needed. For example, the `forms.md` file is explicitly read when filling out PDF forms, rather than cluttering the main skill instructions. This design means "the amount of context that can be bundled into a skill is effectively unbounded" since agents with filesystem and code execution tools don't need to read entire skills into their context window upfront. Skills can also include executable code that Claude runs deterministically without loading into context. The PDF skill's Python script extracts form fields directly, rather than forcing expensive, non-deterministic token generation for operations better suited to traditional algorithms.

  **What makes this approach particularly compelling** is how it inverts the traditional mental model of AI customisation. Instead of trying to anticipate everything an agent might need and cramming it into prompts or finetuning, Skills embraces the reality that most context is conditionally relevant. The development workflow Anthropic recommends reflects hard-won wisdom: start with evaluation by running agents on representative tasks and observing failures, build skills incrementally to address specific gaps, structure for scale by splitting unwieldy `SKILL.md` files into separate referenced documents, and crucially, "iterate with Claude" by asking it to capture successful approaches and common mistakes into reusable context. The security considerations are appropriately sobering; malicious skills could introduce vulnerabilities or exfiltrate data, so only install from trusted sources and thoroughly audit code dependencies. Looking forward, Anthropic plans to explore how Skills complement Model Context Protocol (MCP) servers by teaching agents complex workflows involving external tools. Ambitiously, it hopes to "enable agents to create, edit, and evaluate Skills on their own, letting them codify their own patterns of behaviour into reusable capabilities." The simplicity is the point: rather than building elaborate frameworks, Skills are just folders with markdown files and optional scripts, making them composable, portable, and shareable across Claude.ai, Claude Code, the Claude Agent SDK, and the Developer Platform. This might be the most pragmatic approach yet to solving the "how do we give AI agents organisational context" problem.

## WIND (What Is Niels Doing)

Yesterday (Saturday, October 18) found me in Johannesburg delivering a talk at the Data & AI Community Day event titled **Generative AI for Beginners: Build Your First Agent with Azure AI Foundry**. Standing in front of an almost-full house, walking developers through their first agentic AI implementation, reminded me why I love this community. The energy when abstract concepts click into practical code is electric. The session went well (at least I think it did;  the audience laughed at my attempts at humour, which either means my jokes landed or they were being very kind). Building that first agent together, watching attendees realise they could actually create something that reasons, plans, and acts autonomously using Azure AI Foundry, was precisely the kind of hands-on session this AI moment needs. Too much of the AI conversation stays theoretical; getting people from "what's an agent?" to "here's my running agent" in fifty minutes felt genuinely productive.

**Rest? What's That? .NET Conf Comes to Durban**

![](/images/posts/dot-net-conf-text-1.png)

**Figure 1:** *.NET Conf South AfricaCommunity Edition is coming to Durban on November 15, 2025!*

Can I get some rest now after the Johannesburg trip? Absolutely not. For the first time ever, **.NET Conf South Africa Community Edition** is coming to Durban, and I'm knee-deep in organising the November 15 event at [**Richfield College**][13]. This is genuinely exciting! Bringing the global .NET Conf energy to our local community, showcasing what's new in .NET 10, and creating a space for developers across KZN to connect, learn, and share. Right now, we're actively looking for speakers, so if you've got experience with .NET, C#, Blazor, MAUI, ASP.NET Core, Azure, or anything in the Microsoft developer ecosystem and want to share your knowledge with the Durban community, please [**submit your topic(s)**][10]. Whether you're a seasoned conference speaker or this would be your first talk, we want to hear from you. Building local tech communities requires exactly this kind of grassroots effort, organisers willing to handle logistics, speakers willing to share expertise, and attendees willing to show up. November 15 can't come soon enough.

**Event Pages:**

🌊 [**Durban - Nov 15**][11] <br>
🏔 [**Cape Town - Nov 22**][12] <br>
🌆 [**Johannesburg - Nov 29**][12]

I hope to see you at one of these events!

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

[1]: https://github.com/karpathy/nanochat/discussions/1
[2]: https://github.blog/ai-and-ml/github-copilot/how-github-copilot-and-ai-agents-are-saving-legacy-systems/
[3]: https://martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html
[4]: https://www.anthropic.com/news/claude-haiku-4-5
[5]: https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills
[6]: https://netflixtechblog.com/how-and-why-netflix-built-a-real-time-distributed-graph-part-1-ingesting-and-processing-data-80113e124acc
[10]: https://sessionize.com/net-conf-south-africa-2025
[11]: https://aimldatadurban.org/events/2025/dotnet-conf/
[12]: https://cptmsdug.dev/dotnet-conf-2025.html
[13]: https://www.richfield.ac.za/campus/umhlanga/#


