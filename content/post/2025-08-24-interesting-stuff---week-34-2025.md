---
type: post
layout: "post"
title: Interesting Stuff - Week 34, 2025
author: nielsb
date: 2025-08-24T09:25:46+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-34-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-34-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Data & AI Community Day Durban
  - MCP
  - AI-assisted Coding
description: "Discover this week's AI breakthroughs: Why MCP needs code over tools, how context engineering is replacing RAG, Monte Carlo methods for RL, and self-describing databases for LLMs. Plus: Data & AI Community Day Durban CfS now open!"
---

Welcome to another week of fascinating developments in the AI and data space! This week's roundup explores some thought-provoking shifts in how we approach foundational AI infrastructure: from Armin Ronacher's bold argument that MCP servers should ditch dozens of specialised tools in favor of single "ubertools" that accept code directly, to Jeff Huber's provocative claim that traditional RAG is dead and should be replaced by disciplined "context engineering." 

We also dive into Monte Carlo methods for reinforcement learning and discover how TigerData is tackling the challenge of making databases self-describing for LLMs through semantic catalogues. Plus, I'm excited to share an update about the upcoming Data & AI Community Day Durban event: the Call for Speakers is now officially open!

<!--more-->

## Generative AI

* [**Your MCP Doesn’t Need 30 Tools: It Needs Code**][1]. In this post, Armin Ronacher argues that Model Context Protocol (MCP) servers are overengineered with dozens of specialised tools when they should instead expose a single "ubertool" that accepts programming code as input. He identifies key problems with current CLI-based approaches: platform dependencies, version conflicts, encoding issues with non-ASCII characters, and the frustrating reality that agents often lose track of stateful sessions (like tmux debugging sessions) and abandon tasks over minor syntax errors. The core insight is that command-line interfaces work well precisely because they're composable through bash - something MCP currently breaks by requiring multiple inference calls for chained operations.

  Ronacher demonstrates this philosophy through his pexpect-mcp project, which replaces potentially 36 different pexpect API tools with a single Python interpreter that maintains state between calls. The elegance becomes clear in practice: when debugging a crashing C program with LLDB, the initial exploration takes 45 seconds and 7 tool calls, but the agent can then export its entire debugging process into a standalone Python script that runs in under 5 seconds. This "do it, then do it again" workflow transforms exploratory debugging into immediately reusable automation without complex tool-to-tool translation.

  The author doesn't shy away from security concerns around running eval() on agent code, but argues we're already comfortable with agents writing and executing code throughout our systems - the security model was already compromised, and this approach is simply more honest about it. He's extending this concept to other domains, such as web automation with "playwrightess," which replaces Playwright's ~30 MCP tools with a single JavaScript execution environment. The broader implication is that instead of building domain-specific tools for every use case, we should leverage programming languages that AI models already understand deeply while focusing MCP on what it does best: session management and state persistence.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**"RAG is Dead, Context Engineering is King"**][2]. This post by Jeff Huber from Chroma presents a provocative argument that traditional RAG (Retrieval Augmented Generation) is fundamentally flawed and should be replaced by "context engineering", the discipline of optimising what goes into an LLM's context window. Huber argues that RAG has become a meaningless buzzword that conflates three separate concepts (retrieval, augmentation, and generation) and has been reduced to basic dense vector search. Instead, he advocates for context engineering as a high-status job focused on both the inner loop (what should be in the context window right now) and outer loop (how to continuously improve context selection over time).

  The discussion centers on Chroma's research revealing "context rot", the phenomenon where LLM performance degrades as context length increases, contradicting the marketing claims of frontier models about perfect context utilisation. Huber presents five key principles for modern retrieval systems: ship retrieval (not RAG), win the first stage with hybrid recall using 200-300 candidates, always re-rank before assembling context, respect context rot by favouring tight structured contexts over maximal windows, and invest in creating small gold datasets for evaluation. The conversation also covers practical patterns emerging in the field, such as using LLMs as re-rankers and leveraging hybrid approaches combining vector search, lexical search, and metadata filtering.

  Throughout the interview, Huber emphasises the importance of treating context engineering as a serious engineering discipline rather than alchemy, drawing parallels to how successful AI companies fundamentally excel at context engineering. He also discusses Chroma's evolution from a simple vector database to a modern distributed retrieval engine, their focus on developer experience, and their research contributions, including technical reports on context rot and generative benchmarking. The discussion touches on broader themes around building with purpose, maintaining high standards across all aspects of company culture, and the role of values-driven leadership in Silicon Valley's increasingly competitive AI landscape.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Back Again to Monte Carlo**][3]. This post explores Monte Carlo (MC) methods as the second major approach for solving reinforcement learning problems, building on their previous tutorial on value function implementation. Unlike Dynamic Programming, which requires complete knowledge of the environment, Monte Carlo methods learn purely from experience: interactions with the environment, whether real or simulated. The key distinction is that MC waits until episode completion before updating value estimates and improving the policy, making it suitable only for episodic tasks where the agent learns by averaging returns across episodes.

  The author walks through Monte Carlo Policy Evaluation, explaining both Every-visit MC (counting each state occurrence per episode) and First-visit MC (counting only the first occurrence), with both methods converging to the true value function as episodes increase. The progression moves to Monte Carlo Control, where the challenge becomes balancing exploration and exploitation. Since MC methods don't have full access to the environment model, they estimate action-values Q(s,a) rather than state-values V(s), making Q-functions essential for model-free control.

  The critical insight addresses the exploration problem: pure greedy policy improvement would cause the agent to quickly lock onto one action and stop learning about potentially better alternatives. The solution involves on-policy methods using ε-greedy policies that maintain exploration by choosing random actions with probability ε while favouring the best-known action most of the time. This creates ε-soft policies where every action has some probability of being selected, ensuring continuous exploration while gradually shifting toward the optimal deterministic policy. The tutorial concludes by positioning these concepts as stepping stones toward more advanced RL solutions, with promises to cover off-policy methods and practical implementations in future posts.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**The Database Has a New User—LLMs—and They Need a Different Database**][4]. This post by Matvey Arye from TigerData tackles a fundamental problem: databases aren't self-describing, creating a significant challenge for LLMs trying to generate accurate SQL queries. Without proper context about what tables like "orders1" actually represent (purchase orders vs. customer orders vs. forgotten experimental tables), LLMs struggle to understand database structures and relationships. TigerData's internal experiments revealed that 42% of context-less LLM-generated SQL queries missed critical filters or misunderstood relationships, silently returning misleading data, a problem that worsens with larger, more complex databases.

  Their solution centres on semantic catalogues that embed natural language descriptions directly alongside database schemas, providing LLMs with the contextual understanding they need. The approach involves four core principles: embedding semantics alongside schema elements, maintaining versioned and governed descriptions in version control, implementing self-correcting querying using Postgres's `EXPLAIN` command to catch errors preemptively, and building transparent evaluation systems to distinguish between retrieval errors (bad metadata) and reasoning errors (bad SQL generation). Their experimental implementation showed SQL generation accuracy improvements from 58% to 86% in certain schemas when using semantic descriptions.

  The system works through a four-step process: LLM-generated initial YAML descriptions of database structures, human review and refinement of these descriptions with crucial business logic context, import into the semantic catalogue for vector search indexing, and finally SQL generation from natural language queries. Key insights include that semantic context dramatically improves model performance beyond just schema names, and that narrow, tightly-scoped interfaces (starting with functions, then views, then raw tables) build confidence in agentic systems. The team emphasises that successful retrieval isn't just about algorithm choice; the semantic meaning between similar concepts like "payment_aborts" vs "refunds" requires rich contextual descriptions that go far beyond what automated retrieval mechanisms can distinguish from schema names alone.


## WIND (What Is Niels Doing)

The past few weeks have been a whirlwind of event planning, speaker outreach, and countless spreadsheets (yes, even AI enthusiasts still rely on good old Excel sometimes). I've been deep in preparation mode for what's shaping up to be an incredible community gathering: 

![](/images/posts/logo-2-1920.jpg)

**Figure 1:** *Data & AI Community Day Durban: Ready Player 2 - Augment Yourself with AI Superpowers*

Yes, the [**Data & AI Community Day Durban: Ready Player 2 - Augment Yourself with AI Superpowers**][5] event happens October 11th at [**Richfield College's**] beautiful Umhlanga Campus:

![](/images/posts/richfield.jpg)

**Figure 2:** *Richfield College*

Today marks a milestone I've been working toward, [**the Call for Speakers is officially open**][6]! If you've been tinkering with AI models, wrestling with data pipelines, or have war stories about implementing machine learning in the real world, we want to hear from you. Whether you're a seasoned veteran or someone who's just discovered the magic of prompt engineering, there's a place for your voice in our community. You can submit your speaking topics [here][6], and trust me, we're looking for everything from technical deep-dives to those "what I wish I'd known before..." stories that save everyone else from making the same mistakes.

The event planning has been both exciting and time-consuming, which brings me to a confession: my blog series about building a custom contact and event management system using Claude Code has taken a bit of a backseat. Ironically, I've been so busy organising an event that I haven't had time to write about the very tools that could help organise events! The universe has a sense of humour, doesn't it? But don't worry - once the CfS dust settles and we get closer to the event (attendee registration opens mid-September, by the way), I'm planning to dive back into that series with fresh perspectives and probably a few lessons learned from this real-world event management experience.

For now, if you're curious about what we're building for October 11th, you can find all the details about the event [here][5]. And who knows? Maybe some of the challenges I've faced in organising this community day will become the perfect use cases for the next instalment of my Claude Code series. Sometimes the best content comes from the chaos of actually doing the work!

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

[1]: https://lucumr.pocoo.org/2025/8/18/code-mcps/
[2]: https://www.latent.space/p/chroma
[3]: https://pub.towardsai.net/back-again-to-monte-carlo-3964a727012c?sk=v2%2F767d18d9-c815-4cf1-86e9-a920911e3872
[4]: https://www.tigerdata.com/blog/the-database-new-user-llms-need-a-different-database
[5]: https://aimldatadurban.org/events/2025/ready-player-2/
[6]: https://sessionize.com/dbn-ready-player-2/
[7]: https://www.richfield.ac.za/campus/umhlanga/#
