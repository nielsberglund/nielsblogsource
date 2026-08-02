---
type: post
layout: "post"
title: Interesting Stuff - Week 31, 2026
author: nielsb
date: 2026-08-02T06:35:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-31-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-31-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - MCP
  - AI Agents
description: "Week 31 roundup: MCP's biggest-ever spec update goes stateless, Anthropic cuts 80% of Claude Code's system prompt, agent traffic routing on AKS, and persistent memory on MongoDB Atlas."
---

**A week of plumbing, and I mean that as the highest compliment.** MCP shipped its largest revision since launch, tearing sessions out of the protocol core and quietly turning itself into infrastructure the Fortune 500 can actually deploy. Anthropic, meanwhile, deleted over 80% of Claude Code's system prompt and told us why our carefully curated CLAUDE.md files are probably too long.

We've also got a superb piece on routing agent traffic on Kubernetes, which argues that "route this request" is really three separate decisions, plus a deep dive into giving Claude Code durable memory on MongoDB Atlas. Context, protocols, routing, and memory: the unglamorous layers that decide whether your agents survive contact with production.

<!--more-->

---

## Generative AI

* [**The new rules of context engineering for Claude 5 generation models**][1]. In this post, Thariq Shihipar of Anthropic drops a genuinely counterintuitive number: they removed over 80% of Claude Code's system prompt for models like Claude Opus 5 and Claude Fable 5, with **no measurable loss** on their coding evaluations. The diagnosis is that we, Anthropic included, have been overconstraining Claude, piling up rules in system prompts, CLAUDE.md files, and skills that increasingly contradict each other. Reading their own internal transcripts, they found single requests carrying both "leave documentation as appropriate" and "DO NOT add comments", forcing the model to spend effort adjudicating between its instructions rather than doing the work.

  The "then and now" list is the meat of the article, and every line is a best practice quietly turning into a myth. *Then* give Claude rules, *now* let Claude use judgement; the old "default to writing no comments" hard rule became "write code that reads like the surrounding code: match its comment density, naming, and idiom". *Then* give examples, *now* design interfaces, because examples constrain newer models to a narrow exploration space while a well-designed tool signature teaches usage for free. *Then* put everything upfront, *now* use progressive disclosure, splitting rarely needed guidance into skills and deferring tool definitions behind ToolSearch so they cost nothing until required. And *then* memory in CLAUDE.md, *now* auto-memory, since Claude saves relevant memories itself. There's even a new `claude doctor` command (`/doctor` in Claude Code) to automatically right-size your skills and CLAUDE.md files.

  The section on references is the one I'll be acting on first. Anthropic's advice is to prefer artefacts that live *in code*, because they're high-fidelity instructions in a language Claude already knows fluently: an HTML mockup beats a written description of a design, a detailed test suite beats a prose spec, and rubrics let Claude verify your taste rather than guess at it. Keep CLAUDE.md lightweight, describe what the repo is *for*, and spend the tokens on gotchas rather than on things Claude can discover by looking at your file system.

  What I find slightly humbling here is that most of us, myself very much included, built our context-engineering instincts on models that needed hand-holding, and then kept the scaffolding long after the building could stand on its own. My own CLAUDE.md files have accumulated like sediment, one defensive instruction per bad experience, and I suspect at least half of them are now actively making things worse. The uncomfortable implication is that context engineering isn't a write-once artefact; it's something you must *prune* with every model generation. If you take one action from this week's roundup, run `/doctor` on your repo and see how much of your carefully crafted guidance the model no longer needs.

---

* [**MCP just got its biggest update ever — here's what changes for AI agents**][2]. This post by Michael Nuñez at VentureBeat covers the release from the outside in, with exclusive interviews that make the *why* far more legible than a changelog ever could. MCP co-creator David Soria Parra's summary is hard to beat: "Some people jokingly call it a v2, and I think in spirit that's accurate." The headline change is the move to a fully stateless architecture, and the reason enterprises pushed so hard for it is brutally practical. Under the old design, a client held a persistent session with a *specific* server instance, and as fellow maintainer Den Delimarsky puts it, "if one of your compute pods went down, all of a sudden the requests would start failing." In a Kubernetes world of interchangeable, ephemeral pods, that was poison.

  The trade-offs are discussed with unusual candour. Payloads get bigger because state now travels over the wire, though Soria Parra notes that it compresses well and remains small compared to a typical HTTP request. Out-of-band server logging is gone; the team first scraped GitHub and concluded that "it's basically nobody" is using it. There's a lovely moment of engineering humility too: "I'm sad that things I thought were useful turned out not to be useful... one of the bigger trade-offs was more about my ego than any actual limitation of the protocol." Alongside the architecture, a formal 12-month deprecation policy was developed after consulting Google, Microsoft, and Amazon, which gives enterprises the stability contract they'd been asking for, and OAuth hardening closes a class of mix-up attacks preventively rather than reactively.

  The governance and scale numbers are the part I keep re-reading. AAIF executive director Mazin Gilbert reports the foundation growing from ~40 members at its December inauguration to 240 today, "signing up one member every day", with Anthropic's share of contributions now below half, and members ranging from CERN to Consumer Reports, "because somebody has to defend consumers when this internet of agents comes alive." Soria Parra concedes he technically holds veto rights but says they've never been used: "Technically we have a lot of influence; de facto, we're not exerting any of it." Meanwhile SDK downloads have doubled in six months to roughly **250 million per week**. Gilbert's HTTP analogy, open standard, stateless scalability, neutral governance, is the frame that makes this release click.

---

* [**The 2026-07-28 Specification**][3]. In this post, David Soria Parra and Den Delimarsky look at exactly the same release from the maintainers' side. If the VentureBeat piece is the interview, this is the engineering brief you'll actually implement against. The `initialise`/`initialised` handshake and the `Mcp-Session-Id` header are officially retired. Every request now travels self-describing, carrying protocol version, client identity, and capabilities in `_meta`, with an *optional* `server/discover` RPC for clients that want capabilities up front. The result is the whole point: any request can land on any instance behind a plain round-robin load balancer, with no shared storage.

  There's a lot more in the release than statelessness. Multi Round-Trip Requests (MRTR) replace server-initiated elicitation and sampling. When a tool needs a confirmation or a missing parameter mid-call, the server returns `resultType: "input_required"` and the client retries with `inputResponses` attached, no held-open bidirectional stream required. Method and tool names now ride in the `Mcp-Method` and `Mcp-Name` HTTP headers, so your gateway, rate limiter, or WAF can route and meter without parsing JSON bodies. List responses carry `ttlMs` and `cacheScope` so tool catalogues can be cached and upstream prompt caches stay stable across reconnects. Tasks graduate out of the experimental core into a proper extension alongside MCP Apps and Enterprise Managed Authorization, and Roots, Sampling, Logging, and the legacy HTTP+SSE transport are all deprecated with a twelve-month offramp. TypeScript, Python, Go, and C# SDKs speak the new spec today, with Rust in beta.

  One design note deserves highlighting because it's easy to misread the headline. Dropping the protocol-level session does *not* force your application to be stateless: if your server needs state across calls, mint an explicit handle from a tool and have the model pass it back as an argument. The maintainers found this works better than session state hidden in the transport, precisely because the model can *see* the handle and thread it between tools.

  Here's what strikes me: this is a protocol growing up in public, and the growing pains are the good kind. MCP could have papered over the session problem with more sticky-routing guidance and kept everyone's code compiling; instead, the community chose breaking changes eighteen months in, while that's still survivable. I'll also confess a certain satisfaction at seeing "make the state explicit and pass it as an argument" win over "hide it in the transport"; that's a lesson databases learned decades ago, and it's oddly reassuring to watch the agent world rediscover it. If you maintain an MCP server, budget a sprint for this one; if you merely *consume* MCP servers, expect a quietly better year of uptime.

---

* [**Routing agent traffic is really three decisions**][4]. In this post by Fuyuan Bie of the AKS team, we get the best framing I've read of a problem that gets worse the more agentic your workloads become. A chat turn is one LLM call; an agent is hundreds: plan, call a tool, read the result, re-plan, and most of those calls are trivially easy: a tool-argument fill, a yes/no gate, a short summary. None of them needed a frontier model. So the question isn't "which model is best"; it's "which model should answer *this* call, and how do I govern a flood of them?" Bie's answer is that this hides three separate decisions on three different signals: **content → policy → GPU state**.

  Each decision gets its own layer and its own owner, and the discipline is refusing to let any layer answer a question belonging to another. Layer 1 is semantic routing with RouteLLM: reading request content to predict whether a cheap self-hosted model or a frontier model should answer, with a calibrated threshold you hold in your own hands ("What is 2+2?" scores 0.09 and goes weak; "Derive the EM algorithm" scores 0.29 and goes strong). Layer 2 is agentgateway, an OpenAI-compatible data plane that handles auth, per-agent budgets, rate limits, guardrails, and OTel tracing; it never thinks about prompt difficulty. Layer 3 is the Gateway API Inference Extension's Endpoint Picker choosing which vLLM replica takes the call based on live KV-cache occupancy, queue depth, and LoRA affinity, over pods that the managed KAITO add-on provisions for you.

  The load-balancing trap is the section every platform engineer should read twice. Round-robin assumes requests are interchangeable, and LLM requests are anything but: a 100k-token context-stuffed agent step and a 200-token argument fill differ by three orders of magnitude in cost. Spray them uniformly, and round-robin will happily queue a cheap completion behind a giant prefill on a saturated pod while an idle pod sits next door; throughput looks fine while p99 falls off a cliff. There's an equally sharp caveat on the economics: prompt caches are per-model and per-prefix, so bouncing a session between models goes cold, and the savings from offloading are smaller than sticker prices imply; measure your actual bill rather than multiplying tokens by a static rate. Best of all, the layers are independently adoptable: gateway-only, serving-only, or the full stack when your agent loop's easy calls start showing up on the frontier invoice.

---

* [**Persistent Memory for Claude Code on MongoDB Atlas**][5]. This post by MongoDB's Matteo Rossi starts with a symptom every heavy Claude Code user will recognise: a decision made an hour ago quietly stops being honoured. The usual explanation is "the model forgot", but that framing hides the mechanism. When the context window nears its limit, Claude Code compacts it: first dropping the oldest tool outputs, then *summarising* older stretches of conversation. Both moves discard information, and the second especially, because a summary keeps the gist and lets the detail go. The killer detail is that the loss is silent: nothing marks when your "leave the payment module alone" constraint evaporated, and you find out later, somewhere else, when Claude does something an earlier decision had ruled out.

  The fix is a proper memory *system*, split the way LangGraph splits it: a checkpointer for short-term session state, and a durable, cross-session store for long-term knowledge. Rossi builds the store side as a thin Claude Code plugin over Atlas, with a three-stage retrieval pipeline running entirely inside the database. Automated Embedding generates vectors with a Voyage model at both index and query time. `$rankFusion` fuses a `$vectorSearch` pipeline and a `$search` keyword pipeline via reciprocal rank fusion, with configurable weights (0.7/0.3 favouring semantic while keeping exact terms in play). Then an optional reranking pass over the Embedding and Reranking API orders the candidates. The example that sells the hybrid approach is perfect: a session records "the API allows 100 requests per minute per client", a later session asks about "the traffic limit", zero shared words, so keyword search whiffs and vector search saves you; flip it to an exact error code and keyword search is the rescuer.

  The integration mechanics are where this gets genuinely clever. The pull side consists of two MCP tools: `save_memory` and `search_memory`. The push side is a **PreCompact hook**, firing at the one moment you *know* information is about to be discarded, and covering the `auto` trigger is what separates this from an MCP-tools-only setup, because automatic compaction is precisely when nothing in the conversation would think to call a tool. The hook doesn't persist the transcript wholesale; it extracts user-authored decisions, constraints, and conventions verbatim, skips conversational noise, deduplicates on a hash of the namespace plus the text, and exits cleanly even when saving fails, so compaction always proceeds. Installation is two commands and a connection string, with both Atlas indexes created on first run.

  What fascinates me, wearing my database hat, which I never really take off, is that after two years of "vector database" being its own product category, the interesting story is now consolidation. Operational data, embeddings, full-text index, and reranking co-located in one cluster, with one access-control surface and no sync jobs shuttling documents between a primary store and a vector store and back. That's not a niche optimisation; that's the shape the market is settling into, and it's a shape SQL Server, Postgres, and Atlas can all credibly claim. I'd add one caution the article is honest about: it explicitly doesn't cover evaluating memory quality, retention policy, or governance of what gets stored, and "governance of what gets stored" is exactly the question your compliance team will ask ten seconds after you demo this. Still, the PreCompact hook is the kind of idea that seems obvious only after someone shows it to you, and I suspect we'll see it in many plugins by year-end.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[1]: https://claude.com/blog/the-new-rules-of-context-engineering-for-claude-5-generation-models
[2]: https://venturebeat.com/infrastructure/mcp-just-got-its-biggest-update-ever-heres-what-changes-for-ai-agents
[3]: https://blog.modelcontextprotocol.io/posts/2026-07-28/
[4]: https://blog.aks.azure.com/2026/06/29/llm-routing-on-aks
[5]: https://pub.towardsai.net/persistent-memory-for-claude-code-on-mongodb-atlas-0114a796467c
