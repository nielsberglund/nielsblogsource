---
type: post
layout: "post"
title: Interesting Stuff - Week 51, 2025
author: nielsb
date: 2025-12-21T05:53:02+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-51-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-51-25.jpg"
categories:
  - roundup
tags:
  - SQL Server
  - Claude Code
  - aimldatadurban
  - ai agents
  - vector db
  - andrej karpathy
description: "Week 51, 2025 tech roundup: SQL Server log shipping scripts, router-based AI agent architectures, vector DB myths debunked, Claude Code's plan mode revealed, and Karpathy's LLM year-in-review. Final post of 2025!"
---

Welcome to the final roundup of 2025! This week brings us an exceptional collection of paradigm-shifting insights as we close out the year: a battle-tested SQL Server log shipping script that's been running uninterrupted in production for years, a comprehensive deep-dive into router-based agent architectures that are transforming monolithic AI systems, a mathematically rigorous takedown of vector database over-adoption in RAG systems, Armin Ronacher's investigation into what Claude Code's plan mode actually does under the hood, and Andrej Karpathy's characteristically brilliant year-in-review covering everything from RLVR to "ghosts vs. animals" and the rise of vibe coding.

After we explore these articles, I'll be signing off for the festive season to recharge with family and friends, returning in the new year with fresh insights and probably way too much excitement about whatever paradigm-shifting tech drops in January. Let's dive into Week 51's highlights!

<!--more-->

## SQL Server

* [**Automated Near-Zero RPO Log Shipping with a Readable Standby – The “Set It and Forget It” Script**][2]. In this post, my mate Jody Roberts shares a battle-tested SQL Server log shipping solution that's been running uninterrupted in production for years, solving a problem many DBAs face when migrating databases without SQL HA, replication, or traditional log shipping. The magic here is deceptively simple: one T-SQL script totalling 477 lines that requires zero SQL Agent jobs and runs continuously in an infinite loop, keeping your standby database fresh down to the last committed transaction. The script handles everything automatically, creates the standby undo folder (even with `xp_cmdshell` disabled), restores the latest full backup into `STANDBY` mode for readable queries, continuously tails new .trn files the instant they land, applies them in perfect LSN order while handling striped backups automatically, and maintains database readability 99.9% of the time.

  What elevates this from a clever hack to production-grade infrastructure is the robust error handling and observability built in. The script self-heals on errors, gaps, or corrupted logs with graceful `STANDBY`-to-`NORECOVERY` fallback chains, writes monitoring tables that track lag in a single-query dashboard, and includes comprehensive logging of every restore operation, including `LSN` chains, device paths, and timing metrics. Roberts addresses the inevitable objections head-on: yes, it uses `xp_cmdshell` (enabled for exactly 3 seconds only if needed, then immediately reverted), yes, it uses cursors (`LOCAL FAST_FORWARD` with set-based performance), and yes it's an infinite `WHILE` loop (that's literally the point, throw it in a SQL Agent job with auto-restart and forget about it). The deployment is refreshingly straightforward: change six variables at the top, save as `.sql`, create one SQL Agent job, and go back to sleep.

  This is ideal for Standard Edition deployments, scenarios where you need the standby to be readable almost constantly (classic log shipping kicks users out every cycle), simple backup folder structures without URL or third-party software complexity, and for anyone who prefers one script to managing three separate SQL Agent jobs. The real kicker? It delivers near-zero RPO with 5-minute log backup intervals while maintaining query access to the standby, a combination traditional log shipping struggles to achieve without complex scheduling gymnastics.

## Generative AI

* [**Router-Based Agents: The Architecture Pattern That Makes AI Systems Scale**][1]. Sai Kumar Yava delivers a comprehensive deep dive into the architectural pattern that's transforming monolithic AI agents into production-grade multi-agent systems in this post. The core insight is both brilliant and straightforward: just as your brain doesn't devote its entire cognitive capacity to every tiny decision, modern AI systems shouldn't either. Router-based agents act as intelligent traffic controllers, making semantic decisions about which specialised agent should handle each task, considering intent, context, capabilities, resource constraints, and cost-performance trade-offs. The article walks through three distinct routing levels - from micro-decisions within individual agents (the ReAct pattern), to inter-agent coordination workflows, to orchestrator-level supervisors that decompose complex requests and delegate to specialised workers.

  What makes this article particularly valuable is its practical, production-focused approach. Yava doesn't just explain the theory; he provides detailed implementation patterns using LangGraph and LangChain, complete with code examples for semantic routing, LLM-based dynamic routing, and hybrid architectures that combine rule-based, semantic, and LLM routing strategies. The real-world cost analysis is eye-opening: a naive all-LLM routing approach for 1 million monthly requests costs $30,000, while a hybrid production-optimised system achieves the same quality for just $3,300, an 89% savings with 70% faster average latency. The article covers critical production considerations often ignored in theoretical discussions: observability with comprehensive routing traces, integration with durable execution platforms like Temporal for crash-proof workflows, auditability for regulated industries, and graceful fallback chains that prevent catastrophic failures.

  The key takeaway? The intelligence of your routing layer often matters more than the intelligence of your individual agents. As agentic AI transitions from experimental prototypes to production infrastructure, organisations that master multi-layered router architectures, combining the speed of rules, the accuracy of semantic understanding, and the flexibility of LLM reasoning, will have a sustainable competitive advantage over those stuck with monolithic, unscalable agent designs.

---

* [**When (Not) to Use Vector DB**][3]. Uri Peled challenges one of the most pervasive assumptions in the RAG ecosystem: that embeddings automatically equate to vector databases. The core argument is refreshingly contrarian yet mathematically rigorous. Vector databases solve a real problem and are often the right choice, but they're being massively overused in scenarios where simpler solutions would be faster, cheaper, and easier to maintain. Peled walks through a practical "Foo Example" where users upload a few text files, ask a handful of questions over a few minutes, then leave, making both the files and their embeddings ephemeral and disposable. In this pattern, the standard "I have embeddings, so I need a vector database" instinct completely misses what's actually happening: vector DBs don't just store embeddings, they build indexes that speed up similarity searches, and that indexing work is where both the magic and the cost live.

  The benchmarking results are eye-opening and deserve attention. Using 50,000 embeddings with 1,536 dimensions (matching OpenAI's text-embedding-3-small), naive KNN search takes 24.54ms per query while building an HNSW index takes 277 seconds, but once built, queries drop to just 0.47ms. The break-even calculation shows you need **11,510 queries** before the time saved per query compensates for the index construction time. Even varying the number of embeddings and top-k values keeps the break-even point firmly in the thousands of queries range, never dropping to "just a few dozen queries." For short-lived, per-user contexts with maybe 5-10 questions total, the indexing step delays when the system can answer the first question, adding operational complexity. Peled's real-world example from Planck (answering insurance questions about businesses) drives this home: they generate fresh context on demand that's relevant for mere minutes and queried only a few hundred times, making Redis with in-memory KNN far superior to any vector DB.

  **My take:** This article scratches an itch I've had for months. The vector DB vendor marketing has been so effective that I've seen teams reach for Pinecone or Weaviate before even asking, "How many queries will this actually serve?" The break-even analysis here should be required reading for every RAG implementation, knowing that you need thousands of queries to amortise indexing costs completely reframes the decision. It's a perfect example of how understanding the underlying mechanics (indexing overhead vs. query optimisation) beats following the crowd. The key lesson? Database choice should flow from a deep understanding of your data patterns and query workload, not from "what's trending on Twitter." Sometimes the shiniest, newest solution is exactly wrong for your use case, and a simple key-value store with basic KNN will smoke it on latency, complexity, and cost.


---

* [**What Actually Is Claude Code’s Plan Mode?**][4]. Armin Ronacher, in this post, dissects the inner workings of Claude Code's plan mode after realising he's been a religious "YOLO mode" user who never actually understood what plan mode enthusiasts were raving about. His investigation is driven by curiosity after conversations with developers who swear by plan mode, while other tools like Mario's pi and Amp are removing theirs. What he discovers through examining Claude Code's implementation is simultaneously illuminating and slightly underwhelming: plan mode is essentially a markdown file written to a specific folder, combined with recurring prompts reminding the agent it's in read-only mode and a four-phase workflow structure (Initial Understanding → Design → Review → Final Plan). The tools for writing files are still technically available; there's no hard enforcement, just prompt reinforcement changing behaviour. The agent can even enter plan mode itself since it's exposed as a tool, and interestingly, it edits its own plan file using the same edit file tool.

  The prompt differences reveal the actual mechanism behind the magic. When entering plan mode, Claude receives instructions that it "MUST NOT make any edits (except the plan file), run any non-readonly tools, or otherwise make any changes to the system." The workflow suggestions guide the agent through exploration, design with comprehensive background context and detailed implementation plans, review to ensure alignment with user intentions, and finally writing a concise-but-detailed plan to disk. The exit plan mode tool includes a description instructing the agent to recognise when it's done planning, and, critically, the plan content isn't passed as a parameter; it reads from the file the agent wrote. What Ronacher finds most interesting is that, given the brevity of the prompt, you could replicate most of this behaviour with a custom slash command that copies and pastes similar instructions. However, you'd lose the integrated UX for entering/exiting modes, as well as the confirmation screen.

  **My take:** This article hits on something I think about constantly: where does the harness end and the model begin? Ronacher's question, "Why can I not just ask the model to plan with me instead of switching UI modes?" gets at a fundamental tension in agentic tool design. We're so used to traditional software paradigms (modes, states, confirmations) that we may be over-engineering UX when natural language could handle it. His preference for having a file on disk that he can directly see, read, review, and edit before acting resonates strongly. It's about control and transparency. The revelation that plan mode is "mostly just a custom prompt, some system reminders, and a handful of examples" suggests we might be recreating traditional software complexity, even though the whole promise of LLMs was to simplify human-computer interaction. The best tools will figure out which complexity genuinely helps users versus which is just familiar but unnecessary scaffolding from the pre-LLM era.

---

* [**2025 LLM Year in Review**][5]. Andrej Karpathy delivers his characteristically insightful take on the "personally notable and mildly surprising paradigm changes" that defined 2025's LLM landscape in this post. The star of the show is Reinforcement Learning from Verifiable Rewards (RLVR), which emerged as the de facto fourth stage in the LLM production stack after pretraining, supervised finetuning, and RLHF. By training on automatically verifiable rewards in environments like math and code puzzles, LLMs spontaneously developed strategies that look like "reasoning" to humans, breaking problems down into intermediate calculations and learning to go back and forth to figure things out. Unlike the relatively thin SFT and RLHF stages, RLVR involves training on objective, non-gameable reward functions, which allows for much longer optimisation and offers high capability per dollar, gobbling up compute originally intended for pretraining. This gave us a whole new knob to control test-time compute capability by generating longer reasoning traces, with OpenAI's o3 release marking the obvious inflexion point where you could intuitively feel the difference.

  Karpathy's conceptual framework of "ghosts vs. animals" captures 2025's most important realisation about LLM intelligence: we're not evolving animals, we're summoning ghosts. Human neural nets are optimised for the survival of a tribe in the jungle. Still, LLM neural nets are optimised for imitating human text, collecting rewards in math puzzles, and getting upvotes in LM Arena, under entirely different optimisation pressures, producing entities in intelligence space that are completely different. This leads to amusingly jagged performance characteristics, where LLMs are simultaneously genius polymaths and confused grade-schoolers, seconds away from being jailbroken. The rise of RLVR exacerbates this because verifiable domains allow LLMs to "spike" in capability in those specific areas, and benchmarks (by construction) become immediately susceptible to benchmaxxing. Teams construct environments adjacent to little pockets of embedding space occupied by benchmarks and grow "jaggies" to cover them, making training on the test set a new art form. On the application front, Cursor convincingly revealed a new layer of "LLM apps" that bundle and orchestrate LLM calls for specific verticals through context engineering, complex DAG orchestration balancing performance and cost, application-specific GUIs for human-in-the-loop, and autonomy sliders.

  The emergence of Claude Code as the first convincing LLM agent demonstration stands out for running on your computer with your private environment, data, and context, a paradigm Karpathy believes OpenAI got wrong by focusing on cloud deployments in containers orchestrated from ChatGPT instead of localhost. While agent swarms in the cloud feel like the "AGI endgame," the intermediate world of jagged capabilities makes more sense for agents running directly on developers' computers, packaged as "a little spirit/ghost that 'lives' on your computer" rather than just another website. This enabled "vibe coding", the year AI crossed the capability threshold necessary to build impressive programs simply via English, forgetting the code even exists. Programming is no longer strictly reserved for highly trained professionals; it empowers regular people to approach programming and trained professionals to write vastly more ephemeral, single-use software that would otherwise never be written. Karpathy's final paradigm shift is Google's Gemini Nano "banana" as a first hint of the LLM GUI, just as GUIs were invented because people dislike reading text (it's slow and effortful) and prefer consuming information visually and spatially, LLMs should speak to us in images, infographics, slides, whiteboards, animations, and web apps rather than just Markdown-dressed text.

  **My take:** Karpathy's "ghosts vs. animals" framework is the single most clarifying mental model I've encountered for explaining why LLMs feel so uncanny; simultaneously brilliant and bafflingly stupid. The optimisation pressure insight cuts deep: of course, entities trained on "imitate humanity's text" and "get upvotes" would be fundamentally different from entities trained on "survive in the jungle." His point about benchmaxxing as a "new art form" of training on the test set resonates with Uri Peled's scepticism about vector DBs; we're so eager to adopt trendy solutions that we're not asking basic questions about what we're actually optimising for. The vibe coding observation hits home personally; I've absolutely created throwaway apps to solve single problems because the friction disappeared. But the nano banana / LLM GUI thesis might be the most underappreciated paradigm shift here; we're still in the "command console of the 1980s" phase of LLM UX, and whoever cracks the visual/spatial interface for LLM communication will create the next genuine platform. The TLDR captures the paradox perfectly: LLMs are simultaneously smarter and dumber than expected, the industry hasn't realised 10% of their potential even at current capability, and we'll see both rapid progress and tons of work remaining. Welcome to the age of summoning ghosts.

## WIND (What Is Niels Doing)

As we roll deep into the festive season, it's time for me to practice what I preach about sustainable community building, which includes actually taking breaks! I'm stepping away from work to spend quality time with family and friends, recharge the batteries, and consume way too much good food. Part of this festive reset means taking a short hiatus from these weekly roundup posts, so this is the last one you'll see until the new year.

The December 13 [**Data & AI Community Day Durban: Season of AI - Merry Christmas People (MCP)**][6] event at the fantastic [**Richfield College**][7] was an incredible way to cap off 2025's community efforts, sold out with a waitlist, which still amazes me. Bringing world-class tech education to Durban and watching the local community's hunger for this content never gets old. We're proving week after week that smaller cities can absolutely host major technical events, and I can't wait to see what 2026 brings.

To everyone who's been reading, attending events, speaking at conferences, and building the South African tech community with me this year: thank you. You're the reason this works. Have a fantastic festive season, enjoy the break, and I'll see you back here in the new year with fresh articles, new insights, and way too much excitement about whatever paradigm-shifting tech drops in early January. 

Stay safe, eat well, and happy holidays! 🎄🎉

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

[1]: https://pub.towardsai.net/router-based-agents-the-architecture-pattern-that-makes-ai-systems-scale-a9cbe3148482
[2]: https://jodywp.wordpress.com/2025/12/15/automated-near-zero-rpo-log-shipping-with-a-readable-standby-the-set-it-and-forget-it-script/
[3]: https://towardsdatascience.com/when-not-to-use-vector-db/
[4]: https://lucumr.pocoo.org/2025/12/17/what-is-plan-mode/
[5]: https://karpathy.bearblog.dev/year-in-review-2025/
[6]: https://aimldatadurban.org/events/2025/season-of-ai-mcp/
[7]: https://www.richfield.ac.za/campus/umhlanga/#
