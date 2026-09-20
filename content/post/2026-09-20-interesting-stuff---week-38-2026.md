---
type: post
layout: "post"
title: Interesting Stuff - Week 38, 2026
author: nielsb
date: 2026-09-20T08:15:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-38-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-38-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - Claude Code
  - Claude Cowork
  - Anthropic
  - GitHub Copilot
  - Rust
  - aimldatadurban
  - pluggedin
  - Dev Days 2026
description: "Week 38 roundup: Anthropic's 25x CI explosion and how they fixed it, 800,000 lines of agent-written Rust at GitHub, and Cowork folding back into Claude."
---

**Three posts this week, and all three are about the same uncomfortable truth: when writing code stops being the bottleneck, the bottleneck moves somewhere you weren't watching.** For Anthropic, it moved into CI. For GitHub, it moved into coordinating a fleet of agents that occasionally stage hostile takeovers of each other's branches.

Then Anthropic merged Cowork back into plain old Claude chat, which is either an admission that they over-engineered the UX or the smartest simplification of the year. I have opinions. Also, the Durban event happened yesterday, so I'm writing the WIND section on roughly four hours of sleep.

<!--more-->

---

## Generative AI

* [**Agentic coding is straining CI. Here's how we scaled test impact analysis at Anthropic**][1]. In this post, Sachin Malhotra shares the kind of war story I wish more companies published: Anthropic's **CI job volume grew 25x in six months**, and the test impact analysis service that decides which tests run on which pull request nearly stopped the company from shipping. The inputs are worth sitting with. Anthropic engineers now ship **8x as much code per quarter** as they did between 2021 and 2025; Claude authors around **80% of that code** and plays a large role in reviewing and approving PRs, the test suite grew **10x**, and headcount grew by a nominal amount. Writing code stopped being the constraint; once PR review accelerated, CI was next in line to fall over.

  The architecture at its heart is deterministic and refreshingly unglamorous: a **listener** records test results from every CI run, and a **selector** reads that history to decide which tests run on each new PR. It works beautifully until multiple CI jobs start every second. At this point, the listener falls behind the queue, and twenty minutes of lag translates into tens of thousands of unapplied test updates, meaning stale selection data, flaky reds blocking merges, and fixed tests not running until the backlog clears. The killer detail is that the whole thing ran as a **single process**, because keeping a running history per test required a single writer, which meant horizontal sharding was off the table by design. What follows is a beautifully honest catalogue of patches: **double the cores** (bought 70 days), **shard per package** so each gets its own writer and worker (bought 29 days), and **daily restarts** (bought less than a day, and quietly made things worse, because a service that falls behind for an hour loses results entirely). The redesign was to give the selector an in-memory data store, so any listener worker can append any result to a journal and move on, stateless, horizontally scalable, more expensive to run, and vastly easier to profile. Three weeks, one engineer. A year ago: closer to a quarter.

  There's a lovely operational subplot buried in here too. To avoid re-explaining the problem every time, Malhotra ran a **long-lived session in an internal version of Claude Tag dedicated to monitoring the service**, which would ping him whenever listener lag passed 50,000 jobs and pick up the conversation where it left off. This went on for months. Claude kept arguing for a full overhaul; they kept settling for another patch; Claude was right. If you have ever been the person quietly maintaining an unloved piece of infrastructure while "ownership was murky" and "the CI team had bigger fish to fry", that section will hurt in a familiar way.

  What I find most valuable here is the advice at the end, because it inverts a rule most of us have had tattooed on us for twenty years. Malhotra's guidance is to **assume your architecture will be at 25x load within two quarters**, and that "over-engineering as a concept is starting to slightly fade away, or at least the bar is moving much higher": design your v0 for 10–20x the perceived scale if the budget allows. Coupled with *keep state out of the process from the start* and *instrument your services to act as Claude's eyes and ears*, that's a genuinely new heuristic for capacity planning in the agentic era. And note the second-order effect he flags, which nobody plans for: agents prefer **smaller, more granular PRs**, and they push overnight and at weekends, so the shape *and* the floor of your CI load both change. YAGNI hasn't died, but it now needs an asterisk. For anyone doing data engineering, the same logic applies to your pipelines: if agents are generating the queries, your warehouse is next in the blast radius.

---

* [**Migrating the GitHub Copilot runtime to Rust, using Copilot**][2]. This post by Stephen Toub is the most detailed account of large-scale agentic engineering I have read, and at a 65-minute read, it earns every minute. The headline: the GitHub Copilot agent runtime, the harness behind the Copilot CLI, the Copilot app, the SDK, and a quietly enormous list of Microsoft products, has been rewritten from TypeScript on Node/V8 into **more than 800,000 lines of production Rust**, across **128 pull requests**, over about fourteen and a half weeks, primarily by **one developer** with agents doing most of the typing. Toub's framing of the motivation is the best line in the piece: *"I didn't set out to move to Rust, I set out to move away from Node.js and V8."* Six SDK languages each shipping a whole second language runtime, ~100 MB of working set minimum, and a forced process hop on every event will do that to a person.

  The value is in the methodology. They chose **in-place atomic replacement** over a big-bang cutover: every PR replaced a TypeScript component with Rust plus a thin shim, deleted the old code in the same atomic change, and kept `main` shippable throughout. 135 releases went out during the window, ~1.3 per day, so each release carried a small, knowable set of ported components, meaning regressions were correlatable and cheap to root-cause. The temporary napi interop seam peaked at **2,019 N-API exports and 3,356 TypeScript call sites** on 3 August and evaporated to zero by 21 August. And there's a delicious anti-hype finding in the session logs: across 8,678 captured `rustc` error codes, **ownership, borrowing and lifetime errors were just 1.7%** of diagnostics. The borrow checker, the thing that dominates every conversation about Rust, was a background presence; 84% of errors were name resolution, missing methods, type mismatches and trait bounds,  which, as Toub notes, is an argument for pointing agents at *any* statically typed language, not specifically Rust. Similarly, "if it compiles, it's correct" gets dismantled: every single known regression compiled fine.

  Two sections deserve to be printed out and pinned above every engineering manager's desk. First, **what the agents actually did**: 10x as much exploration as mutation. Writing Rust was 1–2% of tool calls; reading, searching and running diagnostics dominated. The popular image of AI spewing code is, in Toub's words, almost backwards. Second, **the `session.ts` incident**. A 30,000-line file at the centre of everything got its own porting session that spent its first 56 minutes just reading (122 tool calls before creating anything), then spawned 15 child sessions in seven waves, each with its own worktree and branch. Meanwhile, a *separate* session porting the runtime entrypoints discovered the `orchestrate` skill on its own initiative, messaged the `session.ts` session, was told "not ready to commit/integrate" **four times**, and then simply reached into the other session's worktree and merged its 760-file diff anyway. Toub's takeaways are exactly right: peers need a tiebreaker, whatever capability you expose is a behaviour you might get, and "run autonomously" needs an explicit exception for decisions that reach outside your own branch. Also, at one point he turned an ordinary chat session into an **agentic mutex** handing out build leases, because 15 concurrent agents building simultaneously killed his laptop. We live in extraordinary times.

  Here's what strikes me: the numbers that will get quoted are the performance wins: **18x faster** client-session turn in-process, **120 session lifecycles per second** versus 7.55, a **91% cut** in ten-client memory, but the number that matters is the cost. **~136.3 billion tokens, ~$120,000, and roughly three weeks of one developer's attributed time**, for a project that previously "would have needed a whole team and a year or two; it would have competed against every feature that team could have shipped instead, and it would have lost (and, honestly, should have lost)." That last parenthesis is the whole essay. Agents didn't make this project *possible*; they moved its price below the threshold where saying no was the correct decision. Every organisation has a list of rewrites, migrations and cleanups that were rationally declined on cost grounds. That list is now a backlog, not a graveyard; and note that the **96.22% prompt-cache hit rate** is the only reason the economics work at all, which makes prompt caching the most underrated line item in agentic engineering. My one caution: read the regressions section twice. Anthropic's advice this week was *instrument everything*; Toub's is **protect the oracle from the agent**: don't let the thing changing the implementation also redefine correctness by weakening a test, updating a snapshot or slapping on a `schema-break-ok` label. He caught exactly that happening, and it took him asking one sceptical question on one PR.

---

* [**Claude Cowork and chat are now one Claude**][3]. In this post by Anthropic, the experiment gets folded back into the main branch: **Claude Cowork and Claude chat are merging into one Claude**, rolling out on Pro and Max first with other plans to follow. The reasoning is candid in a way product announcements usually aren't; they built Cowork as a separate place for bigger work and Design as a separate place for visual work, people used both, and the frustrating part turned out to be *deciding where a task belonged*, with nothing carrying across the boundary. So they stopped making you choose. Claude now figures out what a task needs, and Cowork's and Design's capabilities are available in any conversation, using the context, skills, and connectors you already have.

  Shipping alongside: **Claude Docs** and **Claude Slides**, both new, with **Claude Design** now working inside conversations too. Ask for a document, and you write it together; ask for a presentation, and Claude drafts the slides, which you can edit directly, present from Claude, or download as PowerPoint or PDF. All three are in beta on paid plans, with Enterprise admins choosing when to enable them. Everything you make lives at one shareable link you can open on your phone, and you can select an element and move it or tell Claude what to change. There's also a permissions dial worth knowing about: by default, Claude asks before taking an action, but you can switch it to keep working and only check in when something needs a closer look. The worked example: ask what moved in the pipeline, get a report written the way you always write it plus five leadership slides out of the same conversation, check progress from your phone on the way to the office, schedule it for every Monday, is the clearest articulation yet of where this is heading.

  What fascinates me is that this is a **deletion**, and deletions are the hardest product decisions to make. Cowork was a genuinely good idea that shipped as a place, and the failure mode of shipping a place is that users have to route work to it. Anthropic saw that, concluded routing was the tax, and removed the wall rather than adding a "send to Cowork" button. Having spent months building my [Event Management System with Claude Code][ems] and living in both surfaces, the mode-switching friction was real, and I'd stopped noticing it, which is exactly how this kind of friction survives. The thing I'm watching, though, is what happens to *intent*. Choosing Cowork was an explicit signal: "this is big work, go long". With one surface, that signal has to be inferred, and Toub's `session.ts` incident two summaries up is a nice reminder of what happens when an agent infers scope generously. The default-to-asking setting is the right call, and I suspect the interesting question over the next few months won't be "can Claude figure out what this task needs" but "how do I tell it when it's guessed wrong". Also, quietly: Docs and Slides put Anthropic in the document-and-deck business. That's a much bigger announcement than a two-minute read suggests.

---

## WIND (What Is Niels Doing)

[**Data & AI Community Day Durban: Plugged In**][daid] and the co-located **GitHub Copilot Dev Days 2026** happened **yesterday**, and by every measure I can find: attendance, the buzz in the rooms, the queue at the coffee station, the fact that people were still arguing about agents in the parking lot afterwards, it was a success. *Again.* Huge thanks to the speakers, the sponsors, the volunteers, and everyone who turned up on a Saturday to talk data and AI instead of doing literally anything else. I'm collating the feedback now and hope to publish the **speaker evaluations** later today or tomorrow. If, in the meantime, I appear slightly less coherent than usual, it is because what I would really like to do today is go back to bed and sleep until Tuesday. Technically, I am shattered.

But there's no rest for the wicked, so it's already time to start planning the **final event of the year**. We don't have a name for it yet; suggestions are genuinely welcome, but we do know that we'll be running the **.NET Conference Community Edition** in parallel, the same way we ran GitHub Copilot Dev Days 2026 alongside Plugged In. That co-located format worked far better than I expected: two audiences with a lot of overlap, one venue, one set of logistics, and a much stronger combined agenda than either event would have managed alone. More details as they firm up.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[daid]: https://aimldatadurban.org/events/2026/pluggedin/
[ems]: https://nielsberglund.com/contact-event-claude-code/

[1]: https://claude.com/blog/agentic-coding-is-straining-ci-heres-how-we-scaled-test-impact-analysis-at-anthropic
[2]: https://github.blog/ai-and-ml/generative-ai/migrating-the-github-copilot-runtime-to-rust-using-copilot/
[3]: https://claude.com/blog/cowork-is-now-claude
