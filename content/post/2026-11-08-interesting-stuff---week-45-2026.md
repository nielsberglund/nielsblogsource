---
type: post
layout: "post"
title: Interesting Stuff - Week 45, 2026
author: nielsb
date: 2026-11-08T08:08:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-45-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-45-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - Claude Code
  - Anthropic
  - Andrej Karpathy
  - CI
  - CLAUDE.md
  - Community Day
  - .NET Conf
  
description: "Week 45 roundup: Karpathy's HackerTube built with Claude Code, Anthropic's message threads, CI 20x faster for coding agents, and LLMs writing neural network weights."
---

**This week's theme is making the machines (and the pipes around them) go faster.** Andrej Karpathy builds a YouTube replacement in a Saturday morning with Claude Code, Anthropic shaves latency off long-running agents with message threads, and one engineering head shows how to drag CI from 40 minutes to 2 because agents never get tired of pushing.

Then we go a bit deeper down the rabbit hole: an MIT paper where an LLM reads and writes neural network weights directly, and a practical guide to the six files that turn Claude Code from a clever stranger into a teammate. Grab a coffee, and let's dive in. There is also a WIND section at the end, because November in South Africa is conference month and my calendar looks like a bad game of Tetris.

<!--more-->

---

## Generative AI

* [**HackerTube**][1]. In this post, Andrej Karpathy explains how a Friday-night scroll through an "enshittified wall of slop" on YouTube turned into a Saturday-morning project. He gave **Claude Code** (running **Opus 5.5**) one task: build a YouTube clone from the videos people have recommended on Hacker News. Opus downloaded all HN comments, filtered them, ran Sonnet over them in a Workflow to throw out spam, and ended up with around 40,000 comments recommending 6,454 videos across 150 topics from 2007 to 2026. The result is hackertube.org, with sensible thumbnails, "For You" recommendations that need no user accounts, keyboard shortcuts, and a data export so you can point your own agent at it and build your own version.

  The whole thing took about two hours, and the edit at the bottom is the juicy part. Karpathy says he no longer does anything resembling traditional engineering: he doesn't read or write code or run terminal commands; he talks to Claude. His only manual work was creating a Google Cloud API key, booting a VPS and buying the domain. Once the box was up, he handed Claude the IP address and told it to deploy, secure, harden and optimise. That is a **Claude Code** workflow in its purest form, and a nice reminder that the agent can own the boring ops tail too.

  What I find fascinating is not the clone; it is the pattern: when building a bespoke, personal version of a product takes a morning, the algorithm that serves "the median person" stops being the only game in town. I recognise the feeling from my own Event Management System series, where Claude Code builds things I would previously have put on a someday list. The risk, to my mind, is the "secure and harden" step. Handing a fresh VPS to an agent works great right up to the point where you cannot explain what it did. Would you let your agent loose on a server the way Karpathy did?

---

* [**Make long-running agents faster with message threads**][2]. This post by Anthropic announces **message threads**, now in public beta on the **Claude Platform**. The problem is simple: a coding agent can make hundreds of requests in a session, and each request resends every earlier message and tool result. Once the conversation hits hundreds of thousands of tokens, resending it all adds delay before Claude starts answering. With message threads, you send the full conversation once, start a thread, and every following request carries only what is new plus the ID of the previous response.

  The numbers are the point: with message threads on by default for most **Claude Code** users, requests with 500k to 1M tokens see median time to first token drop by about 35%. The catch list is short and sensible. Threads are held in memory (encrypted, never written to disk) and expire five minutes after the last request, at which point your client resends everything. Claude still reads the whole conversation every turn, so token usage stays the same. It shines for long-running coding agents, computer use agents (screenshots stay with the thread) and document- or image-heavy workflows.

  It is available on the native Claude Platform, Claude Platform on AWS, Claude in Microsoft Foundry, and Claude Models on Google Cloud, at standard token rates. A small API parameter, a big quality-of-life gain for anyone building **AI agents**.

---

* [**How I made our CI 20x faster (steal this)**][3]. In this post, Owen Gretzinger shows how Boardy cut PR waits from up to 40 minutes to 2. His reasoning is neat: when every PR is written by coding agents, which push, wait for CI, fix the red check and push again without ever getting tired, CI becomes the bottleneck of the whole loop. So he treated CI like a product and walked through nine changes. They include moving off GitHub's default runners (a machine now starts in 8 seconds instead of up to 11 minutes), replacing ESLint with Oxlint (2 minutes to 5 seconds), switching typecheckers whenever a faster one ships, sharding tests onto bigger machines, and setting Vitest's `isolate: false`.

  The best war story is the audit. He asked an agent to pull the last 150 runs and split each job into waiting, setup and running, and it found that half the test jobs were missing the dependency cache, because GitHub scopes PR caches to their own branch and nothing seeded one from main. The bug had been there all year, and the agents just retried instead of fixing it. Other wins: running everything in parallel, `nx affected` with a nightly full run, a pre-push hook (format, lint and typecheck in under 9 seconds) instead of a line in AGENTS.md, because agents skip steps. The CI bill went from $230 to $4,300 a month, which he calls the cheapest money spent on making agents faster.

  Here's what strikes me: the real lesson isn't the tool list; it is that agents expose every weakness in your feedback loop, and they do it relentlessly and silently. A human would have complained about a 40-minute CI long ago; the agents just burned retries. Gretzinger ends by naming the next bottleneck as himself clicking merge, and I suspect that is true for a lot of us. If the human review step is the new slowest part, how do we speed it up without giving up the judgement it exists for?

---

* [**Sparks of Weight-Space Programming: LLMs can natively read & write neural network weights**][4]. In this post by Rikiya Takehi, Jayden Teoh, Alex Zhang and Omar Khattab of MIT CSAIL, a frontier LLM (GPT-6 Astra) is given raw neural network weights and asked to understand, fix and write them, with no gradient descent and no training loops. They call it **Weight-Space Programming**. In the experiments, Astra reads the 17,253 weights of a small network and identifies, with 99% confidence, that it was trained on Breakout. It edits 3.5% of the weights of a failing control policy in one shot and takes it from 0% to 100% success. And it writes, from scratch, a Go-playing network that, given 50 forward passes, beats an equal-sized PPO network trained on 20 million games.

  The headline result is on a real language model. Asked to make Qwen3.5-0.8B better at math without gradients, Astra spotted the reasoning-loop issue that Qwen's own model card warns about and fixed it by editing 0.016% of the weights, lifting MATH-500 from 7.9% to 48.1% and tripling the IFEval score. It is not all roses, which I appreciate. In the sycophancy experiment, Astra could not tell the sycophantic model from the honest one using the weights alone, and only succeeded once it was allowed to look at attention patterns on texts it wrote itself. Still, the authors argue that our weights may soon be optimised by LLMs that deliberately reason about them, rather than by tiny symbolic optimisers like Adam or Muon.

---

* [**The Claude Code Setup I Wish I Had on Day One**][5]. This post by Tarun Agarwal tackles the classic **Claude Code** frustration: day one goes brilliantly, day two Claude runs `npm install` in your pnpm repo, because every session starts from zero with a very capable stranger. His fix is a folder, not a prompt, built from six pieces you add as you feel the pain. `CLAUDE.md` is the onboarding doc (keep it under 200 lines and write commands, not essays), plan mode (Shift+Tab) makes Claude think before it types, skills capture procedures once, subagents take the noisy work into a separate context window, hooks enforce rules, and permissions allowlist the safe and boring.

  The distinction I like most is the one between wishes and locks. `CLAUDE.md`, skills and subagents are instructions, and instructions can slip in a long, crowded context. Hooks and permission rules are enforced by Claude Code itself, so "never push to main" in `CLAUDE.md` is a wish, while a deny rule is a lock. His rule of thumb: if breaking a rule would be annoying, put it in `CLAUDE.md`; if it would be expensive, make it a hook. He also covers `/rewind` (press Esc twice) as a quick undo, with the caveat that it is not version control, and warns that an overbuilt setup, like a 900-line `CLAUDE.md`, is worse than none.

  What I find interesting is how neatly this lines up with the CI article above: Gretzinger put his checks in a pre-push hook "because agents skip steps", and Agarwal makes the same argument for hooks in general. Two unrelated authors arriving at the same conclusion tells me this is becoming the settled wisdom of agentic engineering: tell the model what you want, then enforce what really matters outside the model.

  My own `CLAUDE.md` files have a habit of growing like weeds, so the "run /context now and then" advice stung a little. How lean do you keep yours, and which hook do you wish you had added sooner?

---

## WIND (What Is Niels Doing)

November in South Africa is, for some reason, conference month, and boy do I know it this year. First, our own event: [Data & AI Community Day Durban: Encore + .NET Conf 2026 Community Edition South Africa][daid] on November 21, for which registration has just opened. But wait, there is more. This coming weekend, November 14 to 15, I am off to Cape Town to be a mentor and judge at the [**NASA Space Apps Challenge**][6].

The weekend after that is the Durban event, where I am organising and also speaking. On November 25, I am heading to Johannesburg to speak at .NET Conf Africa, and the two following weekends it is Cape Town and Bloemfontein for the .NET Conf 2026 Community Edition South Africa. Phew! If you are in any of those places, come and say hello.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[ems]: https://nielsberglund.com/contact-event-claude-code/

[daid]: https://www.quicket.co.za/events/406763-data-ai-community-day-durban-encore-net-conf-community-edition-south-africa/?ref=link-campaign&lc=blog

[1]: https://karpathy.bearblog.dev/hacker-tube/
[2]: https://claude.com/resources/articles/message-threads
[3]: https://www.linkedin.com/pulse/how-i-made-our-ci-20x-faster-steal-owen-gretzinger-dwvef/
[4]: https://rikiyat.github.io/blog/weight-space-programming/
[5]: https://pub.towardsai.net/the-claude-code-setup-i-wish-i-had-on-day-one-14157454a8ce?sk=v2%2Fe488782c-cfca-4f98-aba2-e76ea8e2b3b9
[6]: https://www.spaceappschallenge.org/
