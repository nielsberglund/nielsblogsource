---
type: post
layout: "post"
title: Interesting Stuff - Week 32, 2026
author: nielsb
date: 2026-08-09T06:15:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-32-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-32-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - MCP
  - Agent Skills
  - AI Agents
  - Steve Yegge
  - .NET
description: "Week 32 roundup: MCP vs Agent Skills settled, Steve Yegge's Continuous Thunderdome, a polyglot unit-test agent, auto mode as Claude Code's default, and imposter syndrome in the AI era."
---

**This week the agentic era stopped being a demo. It started being an operating model.** Steve Yegge shows us a 40-agent city running his 25-year-old MMO; Anthropic makes auto mode the default in Claude Code, with the safety data to justify it; and the MCP-versus-Skills argument finally gets put out of its misery.

We've also got a .NET agent that turns "generate unit tests" into tests you can actually trust, and the most honest thing I've read all year about feeling permanently behind in a field that reinvents itself every fortnight. Protocols, harnesses, trust, and a little therapy. Let's go.

<!--more-->

---

## Generative AI

* [**MCP vs Agent Skills: What the 2026 Spec Change Finally Settled for Me**][1]. In this post, Jamieparker admits to spending a week thinking about MCP and Agent Skills entirely wrong, falling into the trap most of us fell into: assuming one was destined to eat the other. The July 28, 2026 Model Context Protocol specification, the largest revision since MCP's 2024 debut, and a release candidate for a full ten weeks, is what finally broke the framing. The four Tier 1 SDKs (TypeScript, Python, Go, and C#) all shipped speaking the new spec on day one, with Rust following in beta, and the adoption numbers are not the numbers of a protocol anyone is still evaluating: roughly half a billion downloads a month, with TypeScript and Python each past a billion total.

  The distinction the author lands on is the cleanest I've seen written down. MCP is a **connection protocol**: it defines how an agent connects to the outside world to access a database, call an API, or read a file system, handling transport, authorisation, and tool semantics. Agent Skills are a **knowledge format**: a folder of instructions, scripts, and examples that teaches an agent how to approach a category of work, published as an open, cross-platform standard in December 2025, so `SKILL.md` runs on any compatible client, not just Claude. The analogy that clicks: a Skill is the onboarding document for a new hire, and the MCP connection is the door badge. Remove the document and your new hire rediscovers the workflow every morning. Take away the badge and the document is a lovely piece of fiction.

  The token economics are what turn this from a taxonomy debate into an engineering argument, and the numbers are brutal. Anthropic's own work on code execution with MCP describes agents connected to dozens of servers, burning hundreds of thousands of tokens *before reading a single user request*; progressive discovery cut one real workflow from 150,000 tokens to 2,000 tokens, a 98.7% reduction. A separate five-server, 58-tool test found 55,000 tokens consumed upfront, dropping 85% with on-demand tool search, and tool-selection accuracy on Opus 4 climbing from 49% to 74%. On the authorisation side, the spec finally settled the open question: Dynamic Client Registration is deprecated in favour of Client ID Metadata Documents, where the client publishes metadata at a URL it owns rather than registering credentials at connection time. Harder to spoof, fewer moving parts.

  Here's what strikes me: the "X replaces Y" reflex is the single most expensive habit in this industry, and we fall for it roughly every quarter. Skills versus MCP was never a competition, any more than a runbook competes with a VPN. What the spec change actually settled is that both layers are *load-bearing*: an agent with a beautiful Skill and no connection can't touch your database, and an agent with perfect connectivity and no guidance re-derives the same workflow at the top of every session, on your token budget. The twelve-month deprecation clock on Roots, Sampling, and Logging started on July 28, by the way. If you host your own MCP servers, that audit belongs on a sprint, not in a someday pile.

---

* [**The Shape of Things to Come**][2]. Steve Yegge in this post looks at what happens when you stop driving your coding agents like a chariot and start letting them run all night, and the answer, he argues, is that a *civilisation* emerges in your project. He's building a bespoke closed-source harness called Wheelhouse for Wyvern, the MMO he started in 1996, and he's blunt about the implication: reusable harnesses are a dead end, "the people trying to sell you one will all soon be broke." A harness has to be chemically bonded into your application. Gas Town, his previous attempt at a reusable one, burned down when Opus 4.7 developed a "just two more things" tic and would never converge on doing real work.

  The scale is where it gets properly bracing. Wheelhouse runs 18 named crew agents (all Fable, producing designs and implementation plans) feeding a fleet of Opus 5 workers named after authors, coordinated through Beads on a shared Dolt server taking 12,000 git commits a day. Every implementation bead follows the same lifecycle: Fable designs, Opus implements, Fable reviews. On the production side sit standing-role agents with names out of a medieval charter: Gargoyle (SRE), Drawbridge, Warden, Scryer, Sheriff, Herald, Limner, backed by roughly 45 launchd/systemd units, on the principle that *crons watch, models act*. The token bill for July: around 69 billion tokens, equivalent to $87k/month in API burn at 96% cache hits. He runs no sandboxing or MCP and argues that long-run safety comes from structural trust and better architecture rather than "barren little prisons."

  Two predictions carry the post. First, human code review is very nearly done, not yet, but by next year, because you cannot run at agentic speeds and gate everything behind human approval, and the SOC 2 interpretation propping it up will get rewritten by throughput rather than by argument. Second, and more mathematically, CI/CD as we know it dies to the pigeonhole principle: once your commit rate outruns your build slots, one commit per green build becomes *impossible*. Yegge's own merge queue blew past 100 MRs and got stuck in bisection loops, so he and Fable invented the **Land Rush**: when the queue hits 100, abandon bisection, slam the megabatch onto main, and use swarm diagnosis to fix the wreckage. He's cleared batches of 120-150 commits this way. Delightfully, a senior dev in London told him the game industry has been doing exactly this for years and calls it "Game DevOps."

  What I keep wrestling with is the honesty buried in the middle of this piece. Yegge admits that working on Wheelhouse itself consumes 20–25% of all his Wyvern work, and suspects that figure is roughly constant over the life of any agentic system. That's a *fifth to a quarter* of your engineering capacity permanently spent on the machinery rather than the product. We used to call that overhead and try to eliminate it; the argument here is that it's the new cost of doing business, and it buys you a 40-agent workforce. I'm also unconvinced that "no MCP, no sandboxing" generalises beyond a solo operator with total ownership of his own blast radius, but then, the whole post is a man 12 months in the future telling you he isn't special, and that's precisely the claim that makes it worth reading twice.

---

* [**I keep waiting to be found out**][3]. This post by my colleague Gareth Hellmann is a confession. It's the most relatable thing I've read in this space all year: for most of the AI boom he has felt like a fraud, "not a stylish, brooding fraud" but the everyday kind who nods along in meetings and quietly hopes nobody asks a follow-up. Everyone else seemed to have received a memo about all this; his had gone to spam. The observation that unlocks the piece is that many of the people making him feel behind had read exactly the same handful of blog posts he had; they could quote them beautifully but could not tell you what happened when they actually tried any of it. "They had opinions the way I have unread books: proudly displayed, spine uncracked."

  The turn wasn't a lightning bolt. It was inquisitiveness plus stubbornness: read a little, play a lot, every day, poking the thing to see what it does. Typing in nonsense, getting nonsense back, typing in better things. Slowly, the acronym confetti translated itself into plain English: a prompt is just asking clearly, context is just telling it what it needs to know, and an agent is just a thing you let take a few steps on its own. He leaned on the handful of people who genuinely understood it and could explain without jargon ("one patient person who has actually used the thing is worth a hundred blog posts"), then voluntold his team into the same habit. And there's a lovely, provocative inversion at the heart of it: we hand a GPS unblinking faith and follow it down a dirt track into a field full of cows without requesting a single source, then meet the one tool we can actually interrogate and suddenly discover our inner sceptic.

  What I find genuinely valuable here is the reframe from "can I keep up with AI?" to "what problem am I trying to solve?": because the first question has no winning move and the second is the thing most of us are actually good at. I'd push back gently on one line, though: I'm not sure "we should be trusting AI more, not less" survives contact with a production database, and the piece itself concedes you should keep a hand near the wheel. But the deeper point stands, and it's one I'd put on a poster for every engineering leader who has quietly stopped touching the tools. The imposter feeling isn't a warning that you don't belong; it's a signal that there's something new to learn today. The day you stop feeling it is the day you stop learning. (The author's byline: "Imposter (5%) + Claude (95%)" is the best sign-off of the week, and also a small act of the exact transparency this industry needs more of.)

---

* [**From generated code to trusted code with a unit-test agent**][4]. In this post by Amaury Levé, we get a properly rigorous answer to the laziest prompt in software: "Generate unit tests." As he points out, that one line leaves everything open: which code needs tests, which framework the project uses, where the tests go, how the build finds them, and what the tests should actually check. Microsoft's answer is `code-testing-generator`, an open-source polyglot unit-test agent shipping in the `dotnet-test` plugin in `dotnet/skills`. It learns the repository first: detects language and framework, finds existing tests to copy conventions from, and, crucially, works out the commands the repo uses to build and run tests, so it can confirm the new tests are actually discovered rather than sitting in a project that builds fine and never runs in CI.

  The workflow is the product. The agent picks one of three paths sized to the request (direct, single pass, or iterative), never modifies production code during test generation, avoids tests that call external URLs or depend on exact timing, and then validates that the tests are *useful*,  considering small code mutations that should make tests fail, hunting weak or missing assertions, checking every requested scenario has a matching test, and running the full suite. The benchmark results back it up: 140 of 152 tasks completed versus 120 for stock Copilot on the same model, 92.1% against 78.9%, a 63% reduction in failures. Almost all the gain came from the vague prompts, 79 of 89 versus 59, a 67% failure reduction, while detailed prompts tied at 96.8% each. On the 15 tasks asking for tests covering a specific diff, the agent passed all 15 and stock Copilot passed none.

  The numbers I'd wave at anyone still arguing about model choice: the specialised agent generated 2.3% *fewer* tests with effectively identical coverage (72.4% line, 49.8% branch) and was 5.5% faster. The gain came from reliability, not volume. And the workflow lifted every model tested:  Claude Opus 4.8 to 95.6%, GPT-5.5 to 91.1%, and Claude Haiku 4.5 from 55.6% to 75.6% on the .NET tasks. Specialised GPT-5.5 landed within two points of specialised Opus and more than eleven points *above* stock Opus, which is about as clean a demonstration as you'll find that a good harness is worth more than a bigger model. Guidance ships for .NET, Python, TypeScript, JavaScript, Java, Go, Ruby, Rust, Swift, Kotlin, PowerShell, and C++; on the harder SWE Atlas benchmark, the completion rates drop sharply for everyone (36.4% versus 27.3%), which the team reports honestly rather than burying.

---

* [**Auto mode is now the default in Claude Code for Pro, Max, and Team plans**][5]. This post by Anthropic's Conner Phillippi and colleagues announces that, effective August 14, new Claude Code sessions on Pro, Max, and Team plans will start in auto mode, and that the classifier overhead will no longer be billed to those users. Auto mode routes each tool call through a classifier designed to block irreversible, destructive, or outward-facing actions, rather than interrupting you with prompts. When something is blocked, Claude usually finds a safer route or asks directly; three consecutive blocks or twenty in a session drops you back to manual approvals. It stays opt-in for Enterprise, the Claude API, and cloud partner platforms for now, with defaults planned across those platforms in the coming month.

  The data justifying the switch is the interesting part, and it is not flattering to us humans. Users approve **97%** of permission prompts, rejecting only 3%, yet when Claude presents a *plan* for approval, users reject 39% of them. That gap is the sound of reflexive clicking. It shows up in settings files too: 49.5% of active CLI users have hand-written a Bash allow-rule, 62% have used `bypassPermissions` or clicked "don't ask again", and 25% of interactive sessions start in bypass mode. In a controlled study with 1,053 paid testers, a single prompt was swapped for a clearly dangerous command mid-session: testers caught it 13.6% of the time, auto mode 89%. Head-to-head, auto mode blocked 800 commands that a human approved, while humans blocked six auto-mode-allowed commands. Worse, human vigilance decayed with session length, from ~17% early to ~5% after fifty prompts, while the classifier's block rate stayed flat.

  There's more evidence beyond the lab. Re-grading flagged real-world sessions, manually approved ones contained serious unintended harm more than twice as often as auto mode sessions (6.3% versus 2.4% at production-level severity). Apollo Research ran a two-week adversarial pilot, and in a third-party prompt-injection evaluation, none of 720 attack attempts succeeded against Claude Fable 5, Opus 5, or Sonnet 5 in auto mode, compared with a 5.83% success rate for GPT-5.6 Sol in Codex's Auto-review mode and 19.03% in Full Access. Anthropic also lists three internal saves that read like incident-report fanfic: a failed internal upload where Claude's fallback was to publish the report to a *public* code-sharing site; a mass process kill across ~2,000 pods that would have torn down hundreds of GPUs of in-flight training; and a request for read-only billing access answered with a cloud role granting account-root admin. Adobe, Nuro, Gusto, and Garner Health are running it in production, and Teams/Enterprise auto mode users ship about 25% more PRs.

  What fascinates me about this announcement is the quiet reversal it represents. For two years, the industry's safety story has been "keep a human in the loop", and here is the vendor with the most to lose publishing data showing the human in the loop is largely a rubber stamp that gets worse the longer the session runs. That's not an argument against oversight; it's an argument that *interrupt-driven* oversight is the wrong shape, and that reviewing a plan (39% rejection) is where human judgement actually earns its keep, not adjudicating the four hundredth `git status`. The honest caveat is right there in the post: this relies on classification systems, so it reduces risk rather than eliminating it, and high-stakes production changes still want your eyes. But if you're the person who has been running `bypassPermissions` because the prompts were driving you mad, and the numbers say a lot of us are, auto mode is strictly better than what you were doing. Turning off allow-rules broad enough to grant arbitrary code execution while in auto mode is a particularly nice touch, and one I suspect will annoy exactly the people it should.
---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[1]: https://pub.towardsai.net/mcp-vs-agent-skills-what-the-2026-spec-change-finally-settled-for-me-9972d7456fba
[2]: https://yegge.ai/essays/the-shape-of-things-to-come/
[3]: https://www.linkedin.com/pulse/i-keep-waiting-found-out-gareth-hellmann-hn0ff/
[4]: https://devblogs.microsoft.com/dotnet/polyglot-unit-testing-agent/
[5]: https://claude.com/blog/auto-mode-default-in-claude-code
