---
type: post
layout: "post"
title: Interesting Stuff - Week 07, 2026
author: nielsb
date: 2026-02-15T07:31:50+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-07-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-07-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - Claude Code
  - Agent Teams
  - Claude Opus 4.6
  - GPT-5.3-Codex
  - PostgreSQL
  - aimldatadurban
  - Data & AI Community Day Durban
description: "Week 07 tech roundup: GPT-5.3-Codex vs Claude Opus 4.6 showdown, Agent Teams multi-agent orchestration in practice, PostgreSQL scaling to 800M ChatGPT users, and why taste beats code in Software 2.0."
---

Week 07 asks the question the entire industry is wrestling with: if AI can write all the code, what's actually left for us humans? Armin Ronacher argues we may need entirely new programming languages designed for agents rather than people, while a software engineering retreat and Aaron Stannard both land on the same answer: taste, judgment, and knowing when to stop. 

The GPT-5.3-Codex vs Claude Opus 4.6 showdown reveals that the frontier model gap has all but vanished, making Claude Code's Agent Teams and multi-agent orchestration the real differentiators, as explored in both hands-on experiments and Anthropic's official documentation. Meanwhile, OpenAI proves that boring old PostgreSQL can scale to 800 million users, and Steve Yegge warns that AI is already a vampire invited through the front door, irreversibly transforming how software teams work, whether they're ready or not.

<!--more-->

---

## Databases

* [**Scaling PostgreSQL to Power 800 Million ChatGPT Users**][7]. OpenAI's engineering team reveals the surprisingly PostgreSQL-centric architecture behind ChatGPT's meteoric growth from a small internal tool to a platform serving 800 million users. Rather than reaching for exotic distributed databases or building custom storage engines, OpenAI scaled PostgreSQL through a combination of pragmatic engineering decisions: aggressive connection pooling with `PgBouncer`, strategic read replicas, careful query optimisation, and a sharding strategy that partitions data by workspace and conversation. The numbers are staggering: their PostgreSQL clusters handle millions of queries per second across petabytes of conversation data, with p99 latencies that would make most database administrators weep with joy. The post details specific challenges, such as managing schema migrations across a fleet of sharded databases without downtime, handling the bursty traffic patterns of a consumer AI product, and the operational tooling they built for automated failover and capacity planning.

  What I find most refreshing about this post is how it challenges the prevailing narrative that you need specialised AI-native databases or bleeding-edge distributed systems to build at massive scale. OpenAI's team explicitly chose PostgreSQL for its maturity, operational predictability, and the depth of institutional knowledge available, then invested in making it work rather than chasing architectural novelty. The migration stories are particularly instructive: moving from a single primary to a multi-region active-active setup while maintaining zero downtime, and developing a custom logical replication framework when native PostgreSQL replication couldn't meet their latency requirements across regions. For database architects and infrastructure engineers, this is a masterclass in scaling a well-understood technology to extraordinary demands, and a compelling argument that the most boring technology choice is often the most correct one.

---

## Generative AI

* [**I Tried (New) Claude Code Agent Teams (And Discovered New Way to Swarm)**][1]. The author of this post walks through a hands-on exploration of Claude Code's new Agent Teams feature, going beyond the official documentation to discover emergent patterns for multi-agent orchestration. The author sets up a real-world scenario, refactoring a medium-sized TypeScript codebase, and experiments with different team configurations: a lead agent delegating to specialist sub-agents for testing, documentation, and implementation. What they discover is that the most effective pattern isn't the hierarchical orchestration you might expect, but rather a "swarm" approach where agents work semi-independently on adjacent parts of the codebase, periodically syncing through git commits rather than direct communication. This organic coordination pattern, where agents discover each other's changes through the shared repository rather than explicit messaging, mirrors how effective distributed human teams often work.

  The post provides practical insights on prompt engineering for multi-agent setups, including how to structure the lead agent's system prompt to effectively delegate without micromanaging, and how to scope sub-agent tasks to avoid merge conflicts. The author also documents failure modes: agents stepping on each other's changes, context window exhaustion from overly verbose status reporting between agents, and the challenge of maintaining code consistency when multiple agents have slightly different interpretations of architectural decisions. What's most valuable here is the honest documentation of what doesn't work alongside what does. Agent Teams is powerful but not magic, and understanding the failure modes is more useful than knowing the happy path, especially for teams considering adopting multi-agent workflows for production development. The "swarm via git" pattern the author stumbled upon is worth watching as a potentially more robust approach to multi-agent coordination than structured orchestration.

---

* [**Orchestrate Teams of Claude Code Sessions**][2]. Anthropic lays out the official architecture and practical usage patterns for Agent Teams, the headline feature of Claude Opus 4.6's Claude Code integration. The documentation describes a model in which a lead agent can spawn and coordinate multiple sub-agents, each running as an independent Claude Code session in a separate terminal context. Each sub-agent gets its own context window, can execute tools independently, and reports back to the lead agent, enabling genuinely parallel development workflows. The key architectural decisions are notable: sub-agents share a filesystem but maintain separate git worktrees, communication happens through a structured message-passing protocol rather than shared context, and the lead agent can monitor, redirect, or terminate sub-agents at any point.

  The documentation covers several orchestration patterns: "fan-out" for parallelising independent tasks, such as running tests across modules; "pipeline" for sequential, dependent workflows, such as build-then-test-then-deploy; and "review," where one agent writes code while another immediately reviews it. What's particularly useful is the guidance on resource management, including how to set context budgets per sub-agent, when to use compact mode versus fresh sessions, and strategies for handling the inevitable merge conflicts when multiple agents modify adjacent files. For developers already using Claude Code, this is the definitive reference for understanding what Agent Teams can do and, equally important, their current limitations around maximum concurrent agents and token throughput. If you've been following the parallel-agents experiments from previous weeks, this official documentation provides the production-ready framework for putting those ideas into practice.

---

* [**GPT-5.3-Codex vs. Claude Opus 4.6: Two Titans Launched Minutes Apart**][3]. In this head-to-head showdown, Kushal Banda delivers a timely comparison of two frontier AI models that dropped within minutes of each other: OpenAI's GPT-5.3-Codex and Anthropic's Claude Opus 4.6. The timing alone tells a story about the intensifying competition in the AI coding assistant space. Banda benchmarks both models across coding tasks, reasoning challenges, long-context handling, and real-world developer workflows. On raw coding benchmarks like SWE-bench and Terminal-Bench, the two models trade blows, with Codex showing strength in code completion and refactoring. At the same time, Opus 4.6 pulls ahead in multi-file agentic tasks and long-context code understanding thanks to its 1M-token context window. The pricing comparison reveals interesting strategic choices: OpenAI aggressively prices Codex for high-volume API usage, while Anthropic holds steady on Opus pricing but delivers substantially more capability per token.

  The comparison gets really interesting in the qualitative assessment of developer experience. Banda notes that Opus 4.6's Agent Teams feature, which allows parallel Claude Code sessions coordinating on a shared codebase, gives it a unique advantage for complex software engineering workflows that Codex currently lacks. Conversely, Codex benefits from tighter integration with the broader OpenAI ecosystem, including ChatGPT, the Assistants API, and GitHub Copilot. Banda's verdict isn't a simple "X wins": for individual coding tasks and API-heavy workflows, Codex is highly competitive, but for autonomous agentic development, large codebase navigation, and multi-agent orchestration, Opus 4.6 currently has the edge. The real takeaway? The frontier model gap has effectively closed to near-zero on standard benchmarks, meaning the differentiators are increasingly about tooling, ecosystem, and workflow integration rather than raw model intelligence.

---

* [**A Language For Agents**][4]. Armin Ronacher follows up on his earlier exploration of Pi with a deeper dive into what programming languages actually mean in the age of AI agents. He argues that existing languages were designed for humans to write and read. Still, agents are fundamentally different: they work one token at a time, lack visual feedback, and often struggle with the syntactic overhead that makes code readable to us. Ronacher introduces the concept of an "agent-native" language, one optimised for how AI models actually generate and manipulate code, with less boilerplate, more explicit state management, and forgiving syntax. He examines how current agents spend a surprising amount of their token budget on formatting, indentation, and structural overhead that serve human comprehension but actively slow agentic workflows, particularly in long-running sessions where every token counts.

  What makes this post particularly thought-provoking is Ronacher's analysis of the mismatch between how we evaluate programming languages today and what agents actually need. Traditional metrics like readability, expressiveness, and community ecosystem matter far less when the "developer" is a language model that can learn any syntax in its context window. Instead, agents benefit from deterministic parsing, minimal ambiguity, compact representation, and strong typing that catches errors before execution rather than at runtime. Ronacher doesn't propose a specific language but sketches design principles: explicit over implicit, compact over readable, and state as a first-class citizen. This is a genuinely provocative line of thinking, and one that makes me slightly uncomfortable. We've spent decades building ecosystems, tooling, and careers around languages optimised for human cognition, and the suggestion that our agents might be better served by something entirely different challenges some deep assumptions about the future of developer tools. For anyone building agentic coding systems, this is essential reading on a topic most of us haven't considered deeply enough: that the languages we love may be the wrong medium for the agents we're building.

---

* [**Software 2.0: Code is Cheap, Good Taste is Not**][5]. Aaron Stannard confronts head-on the existential question simmering beneath every AI coding discussion: if AI can generate code nearly for free, what's actually valuable in software engineering? His answer is "taste", that ineffable quality of knowing what to build, how to structure it, and when to stop. Stannard argues that we've entered a "Software 2.0" era where the marginal cost of producing code has collapsed, much as digital photography reduced the cost of taking pictures, but this abundance doesn't make great software easier; it makes curation and judgment skills exponentially more important. He draws a sharp distinction between "code generation" (which AI excels at) and "software engineering" (which encompasses architecture, trade-off analysis, user empathy, and long-term maintainability), arguing that the industry is conflating the two at its peril.

  The post digs into specific examples where taste manifests: choosing the right abstraction level, knowing when a microservice architecture is genuine complexity management rather than résumé-driven development, recognising when a simple script is the right solution rather than an over-engineered pipeline, and the discipline to delete code that's no longer earning its keep. Stannard makes the provocative case that cheap code actually increases the risk of bad software, because the friction that previously prevented developers from implementing every idea also acted as a natural filter; when it's easy to generate code, you get more of everything, including more technical debt, more unnecessary features, and more complexity. His prescription is that organisations need to shift their hiring and evaluation criteria from "can this person write code" to "does this person have the judgment to build the right thing," a transition he admits most companies are poorly equipped to make. Here's what resonates with me: I've seen this play out in my own workflows, where the temptation to generate "just one more feature" because it's cheap is real, and the discipline to say "no, this is enough" has become the actual hard skill. This is the kind of post that should be mandatory reading for engineering managers currently celebrating their teams' AI-boosted velocity metrics without asking whether they're building the right things faster or just building more things.

---

* [**The AI Vampire**][6]. Steve Yegge, in characteristically irreverent and sprawling fashion, introduces a provocative metaphor for what's happening across the tech industry: AI is a vampire, and it's been invited in. Drawing on vampire mythology (you have to invite them in, they transform what they touch, and there's no going back), Yegge argues that companies and developers who have started using AI coding tools are undergoing an irreversible transformation. The "vampire bite" metaphor extends to how AI adoption spreads within organisations: one developer starts using Claude Code or Copilot, ships features at 5x speed, and suddenly the whole team feels compelled to follow or risk looking unproductive. But the real horror, Yegge contends, isn't the AI itself; it's that the transformation reveals uncomfortable truths about how much of traditional software engineering was ceremony, process overhead, and organisational scar tissue rather than genuine value creation.

  Yegge connects this to his earlier "Hive Mind" observations at Anthropic, arguing that AI isn't just making individual developers faster; it's dissolving the need for the coordination layers (sprint planning, ticket grooming, detailed design docs, lengthy code reviews) that exist primarily because coding was slow and expensive. When code generation is cheap, the bottleneck moves upstream to decision-making and downstream to verification, and the middle layer of project management and process gets, well, vampired away. He's careful to note this isn't a utopian vision; the disruption is painful, and many roles that feel essential today (including, he provocatively suggests, a significant percentage of senior engineering positions that are really "code review and meeting attendance" positions) may not survive the transition intact.

  What gives the post its emotional weight is Yegge's refusal to sugarcoat the implications. He recounts conversations with engineers who intellectually understand the AI revolution but are paralysed by the personal implications, comparing it to knowing the vampire is at the door but opening it anyway because the alternative (falling behind) feels worse. His advice is characteristically blunt: stop debating whether AI will transform software engineering (it already has), stop protecting processes that exist because coding was hard (it isn't anymore), and start investing in the skills that AI can't replicate: taste, judgment, user empathy, and the ability to verify that AI-generated systems actually work correctly. Whether you find the vampire metaphor illuminating or overwrought, the underlying analysis of how AI adoption is restructuring the economics and sociology of software teams is sharp and worth reckoning with.

---

* [**Future of Software Engineering: Retreat Findings**][8]. This post presents the findings from a collaborative retreat bringing together software engineering leaders to grapple with a question that's keeping CTOs up at night: what does software engineering look like when AI can write most of the code? The document synthesises discussions across multiple working groups covering AI-augmented development, the evolution of engineering roles, organisational redesign, and the shifting economics of software. The core thesis is that we're witnessing a fundamental phase transition, not just incremental tooling improvements, where the ratio of human-written to AI-generated code is inverting rapidly, and organisations that don't adapt their structures, hiring practices, and quality assurance processes will find themselves unable to compete.

  Several key findings stand out. The retreat participants identified that the biggest bottleneck is shifting from writing code to reviewing and verifying AI-generated code, a skill set most engineering organisations haven't optimised for. They propose new roles such as "AI Code Auditor" and "Prompt Architect," alongside a reimagined career ladder in which taste, judgment, and system-level thinking replace raw coding output as the primary differentiators. The economic analysis is particularly sobering: if AI reduces the marginal cost of producing code to near zero, the value of individual features drops, pushing companies to compete on integration quality, user experience, and iteration speed rather than feature count. I find this aligns with what we're seeing across the industry: the real skill premium is moving from "can you build it" to "should you build it, and can you verify it works correctly." For engineering leaders and anyone planning their career trajectory, these retreat findings offer a useful framework for thinking about the structural changes ahead.

---

## WIND (What Is Niels Doing)

[Part 10][part10] of my **Building an Event Management System with Claude Code** series is out! In this instalment, we tackle integrating with the Brevo MCP Server for email communication, bringing our event management system one step closer to being a fully-fledged production tool. I've already started on Part 11, where we continue down the comms rabbit hole and look at campaign tracking and batch sending, because apparently, one email at a time is for people with smaller ambitions.

On the community front, exciting news: preparation is underway for the first **Data & AI Community Day Durban** event of 2026, themed [**AI Unplugged**][aiup]. The [**Call for Speakers**][cfs] is open, so if you've been sitting on a talk about AI, data engineering, or anything in between, now's your chance. Registrations will open soon, so keep your eyes peeled. Between finishing the tutorial series and getting this event off the ground, sleep has become more of a theoretical concept than a practical reality!

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post or [ping][ma] me if you have suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions. I look forward to hearing from you.

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

[1]: https://medium.com/@joe.njenga/i-tried-new-claude-code-agent-teams-and-discovered-new-way-to-swarm-28a6cd72adb8?sk=v2%2Fe07d9f2a-7d57-467d-a356-e0077eff5951
[2]: https://code.claude.com/docs/en/agent-teams
[3]: https://pub.towardsai.net/gpt-5-3-codex-vs-claude-opus-4-6-two-titans-launched-minutes-apart-2ad3b316d32c?sk=v2%2Fd27c912e-abc8-475b-9556-fc2f38f49d02
[4]: https://lucumr.pocoo.org/2026/2/9/a-language-for-agents/
[5]: https://aaronstannard.com/beginning-of-software-2.0/
[6]: https://steve-yegge.medium.com/the-ai-vampire-eda6e4f07163
[7]: https://openai.com/index/scaling-postgresql/
[8]: https://www.thoughtworks.com/content/dam/thoughtworks/documents/report/tw_future%20_of_software_development_retreat_%20key_takeaways.pdf

[part10]: {{< relref "2026-02-14-building-an-event-management-system-with-claude-code-part-10---email-infrastructure-with-brevo-mcp.md" >}}
[aiup]: https://aimldatadurban.org/events/2026/ai-unplugged/

[cfs]: https://sessionize.com/durban-ai-unplugged/

