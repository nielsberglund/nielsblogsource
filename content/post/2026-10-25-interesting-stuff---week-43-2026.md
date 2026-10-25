---
type: post
layout: "post"
title: Interesting Stuff - Week 43, 2026
author: nielsb
date: 2026-10-25T08:15:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-43-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-43-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - Claude Code
  - Claude Duet
  - Agent Memory
  - PostgreSQL
  - REA
  - Reverse Engineering
  
description: "Week 43 roundup: Claude Duet, agents with a shared brain in Claude Code, memory in PostgreSQL, GitHub's agent-scale Git and the REA reverse-engineering MCP server."
---

**This week's theme is memory, in every sense of the word.** Five posts look at Anthropic's new proactive agent Claude Duet, a "shared brain" for teams of Claude Code agents, three attempts at building agent memory on PostgreSQL, how GitHub is re-plumbing Git for agent-scale traffic, and an MCP server that wants to reverse engineer, well, everything.

Agents that remember, repositories that can handle the traffic, and tools that take software apart for fun: quite a menu. Grab a coffee, and let's dive in.

<!--more-->

---

## Generative AI

* [**After Testing REA, I Discovered Founders Are Officially Cooked!**][1]. In this post by Joe Njenga, we meet **REA**, an MCP reverse-engineering server that, according to the author, has blown up on GitHub in days. You point it at a target (a website, a JavaScript or Electron app, a SQLite database, a .NET assembly, an APK, a binary) and it returns a structured breakdown of how the software works, with evidence at every step, so that you or your agent can understand and replicate a feature. Setup is `npx rea-agents setup`, which detects agents such as Claude Code, Cursor, Codex and Gemini CLI, previews every config change and backs up your existing configuration first.

  Joe walks through the install and points out that the setup wizard is broken on Windows, where it happily reports no agents found. The workaround is `claude mcp add rea -- rea --mcp`, plus `-s user` if you want it available outside the current project. Once loaded in Claude Code, REA exposes 207 tools. Some targets work out of the box (JavaScript apps, SQLite files, Go and Rust binaries, .NET assemblies, HAR captures), while others need extra tooling such as Chrome, Ghidra, JADX or Wireshark's TShark. His test run was modest: analysing a simple web page's structure, scripts and network calls.

  I'll be the grumpy one here. The 250,000-stars-overnight claim is carrying a lot of the hype, the hands-on test is a very small website, and the "founders are cooked" headline is, shall we say, brave. Still, a tool that lets an agent take a SQLite database or a .NET assembly apart and explain it is genuinely interesting for data folks, and the Windows wizard bug is a reminder to read the config diff before you approve anything an MCP server wants to write.

---

* [**The bridge to agent-scale Git infrastructure**][2]. This post by Eleanor White and Victoria Dye on the GitHub Blog continues the story of how GitHub is rebuilding its Git storage while the service keeps running. The headline: a copy of 99.99999% of repositories now lives in Azure as well as GitHub's own data centres, with most repositories holding two of their five replicas there and Azure serving about half of Git traffic. The agentic shift, rapidly growing traffic and hard power limits in the data centres meant the move had to be fast, so they moved the data first and evolved the architecture afterwards.

  The remaining 0.00001% are the busiest repositories, and they are held back by a 25ms round trip. The quorum waits for every healthy replica and holds a repository-wide lock for each write, so the slowest replica sets both latency and throughput. The fix is to scope the quorum to individual references, since Git's consistency guarantees apply per reference anyway. Agents and developers pushing to their own branches no longer wait on each other, and internal tests showed 3-4x higher write throughput at lower latency for writes to different references.

  Reads get their own treatment. With 100 to 1,000 reads per write, they are decoupled from the write quorum by making Azure Blob Storage a member of the quorum through a "virtual replica", the first fully ephemeral node. On demand, any number of virtual read replicas can then warm their caches from object storage, until GitHub's load-testing harness hit its own limits first. What I find telling is that two big companies, Anthropic with Scion last week and GitHub this week, are arriving at the same conclusion from different directions: Git as we know it was designed for humans pushing at human pace. A final post in the series is promised for GitHub Universe, with the "end state" and "a (small) consensus group somewhere in the stack".

---

* [**I Gave My Claude Code Agents a Shared Brain, and They Stopped Starting From Zero**][3]. Jamshidsadiqi looks at **aiset**, an open-source tool that turns your repositories into a team of **Claude Code** agents sharing one brain. One command (`aiset-init`) scans your project, detects each repo's stack and writes plain Claude Code agent files into `.claude/`: a PM that plans, assigns and verifies; one engineer per repo; a QA engineer; and an integration checker that looks at how the services fit together. You talk to the PM in plain words, and it runs the team.

  The "shared brain" is deliberately unmagical: Markdown and JSON in your workspace. Each engineer keeps a **knowledge brief** (architecture, conventions, test commands, pitfalls, dated field notes), the PM writes an **episode** when a task closes (what was asked, decided, went wrong and learned), and then carries those lessons back into the owner's brief. In a demo of three FastAPI services and a React UI, the team found the planted bugs plus two extra ones, and even noticed that `httpx` lived only in `requirements-dev.txt`, which would have crashed the reviews container on startup. A local dashboard (Office, Brain, Architecture and Settings views) shows what every agent is doing, and a small code-aware CLI called `teammap` traces endpoint to handler to models to frontend callers instead of long grep chains.

  What fascinates me is how much of this is plain files that you can read, diff and put under version control. That is the same philosophy behind `CLAUDE.md`, and I think it is the right one: memory that you can open in an editor beats memory in an opaque vector store you have to trust. The author is refreshingly honest about the limits too: memory is "a workflow, not perfect recall", and the token savings are observations, not a benchmark.

  I keep wrestling with the multi-repo angle, because that is where single sessions fall down and where my own Claude Code projects feel it most. The PM, per-repo engineers, and integration checker are shaped like a human team, which is both reassuring and a little suspicious: are we building the best structure for agents, or just copying the org chart we know? Either way, it is worth a spin on your gnarliest multi-service project. How do you keep your agents from rediscovering the same conventions every morning?

---

* [**We built three memory systems. The most expressive one wasn't the most useful.**][4]. In this post, John Pruitt from Tiger Data tells how the team behind Eon, their Slack agent, built three agent memory systems on **PostgreSQL**. First came a list of user-scoped facts (remember, recall, update, forget), which worked for personal preferences but not for shared project knowledge, and which few people used. Second was a general knowledge graph with `node` and `edge` tables, JSONB metadata, time and BM25 search through `pg_textsearch`, plus arbitrary SQL access for the agents.

  The graph looked great on a whiteboard and performed poorly in practice. Agents invented inconsistent edge metadata, sometimes skipped edges altogether, and burned dozens of turns on database mechanics to file one thread summary. The third attempt swapped the graph for a **tree** using PostgreSQL's `ltree` extension: one memory table, each memory with a path such as `share.projects.my_coding_project`, a GiST index for subtree queries, per-path permission grants and hybrid search that fuses BM25 and embeddings (HNSW) with Reciprocal Rank Fusion. Filing a summary dropped from dozens of turns to usually one tool call, and the hierarchy turned out to be handy for coding agents recording decisions and their rationale.

  The reusable core was then extracted into **searchgres.js**, an open-source TypeScript library for hybrid search with composable filters in PostgreSQL, leaving users, permissions and workflows to the application. The team's own conclusion is the quotable bit: the useful question was not how expressively a system can represent memories, but which decisions it asks its caller to make.

  Here's what strikes me: this is a database person's dream post, and also a quiet rebuke to a lot of agent-memory marketing. Pick the boring structure (a tree, a filesystem, a path) and let Postgres do what Postgres is good at. I would have loved to see numbers on retrieval quality. Still, I suspect many of us will recognise the lesson about not handing agents an open-ended schema and arbitrary SQL, then wondering why they flail. Pair this with the aiset post above, and you get two flavours of the same answer: constrain the structure, keep it inspectable.

---

* [**Introducing Claude Duet**][5]. This post by Anthropic announces a research preview of **Claude Duet**, a standalone app (iOS, Android and claude.ai) in which Claude works as a proactive agent. It sends a morning brief across your connected apps, watches them during the day, messages you only when something needs attention, takes on tasks (scheduling, dashboards, forecasts, prototypes, web apps) and keeps working on its own virtual machine with a browser while you are away. It is built around Claude Opus 5.5 and starts as a waitlist for US Pro and Max subscribers, sharing your normal usage limits.

  The safety section is long, and it should be. Duet reads, drafts, and prepares on its own, but shows you exactly what it will do and waits for approval before sending a message, making a payment, signing a document, or deleting anything. Credentials are handled like in Claude Managed Agents, so it never sees your passwords; actions pass through the auto mode classifier, and a new dedicated classifier and safety prompt guard sensitive information such as card numbers and government IDs. Some things, like trading securities or moving money between accounts, are off limits even with your approval. It also draws on your existing memory, skills, and connected apps, and can use 6,000-plus connectors and plugins in the Claude Marketplace, from Gmail and Slack to QuickBooks, HubSpot, and DocuSign.

  Testers describe small, concrete wins: a calendar entry on the wrong day caught unprompted, a client-call brief prepared and a clash with a flight flagged, a restaurant owner working through invoices store by store. Anthropic is upfront about the rough edges: it can misread a thread or miscalibrate urgency, personal errands are weaker, it cannot yet show you its browser, and it checks accounts only every few hours to protect your usage limits.

  What I find fascinating is the shift in who initiates. Claude Code and Cowork wait for me to ask, whereas Duet "comes to you first", and that moves the hard problem from capability to judgment: what deserves my attention and what can wait. I also notice that the approval model, credential handling, and classifier are the same building blocks that run through Claude Code, so the proactive agent builds on the coding agent's safety work. My hunch is that notifications-by-agent will be a harder UX problem than anything about the model, since a chatty assistant is just a new kind of email. Would you hand your inbox and invoices to a proactive agent, and what would it take for you to trust it?

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[ems]: https://nielsberglund.com/contact-event-claude-code/

[1]: https://medium.com/@joe.njenga/after-testing-rea-i-discovered-founders-are-officially-cooked-f8529710a844?sk=v2%2Fdaa6f240-7d1e-4613-b93b-87f4386c8d1b
[2]: https://github.blog/engineering/architecture-optimization/the-bridge-to-agent-scale-git-infrastructure/
[3]: https://pub.towardsai.net/i-gave-my-claude-code-agents-a-shared-brain-and-they-stopped-starting-from-zero-ecd0b2261f70
[4]: https://www.tigerdata.com/blog/we-built-three-memory-systems-most-expressive-wasnt-most-useful
[5]: https://claude.com/resources/articles/claude-duet
