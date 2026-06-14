---
type: post
layout: "post"
title: Interesting Stuff - Week 24, 2026
author: nielsb
date: 2026-06-14T06:45:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-24-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-24-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - AI Agents
  - Claude Managed Agents
  - Fable 5
  - Mythos 5
  - Data Engineering
  - Elon Musk
  - Ponzi Scheme
description: "Week 24 tech roundup: writing loops instead of prompts, self-service analytics with Claude, Managed Agents on a schedule, the Fable 5 launch, and the US government's directive to pull it days later."
---

What a week to be paying attention. We swing from a Claude Code creator who merges 150 PRs a day from his phone, through the quiet plumbing of agents that run on a schedule, to the launch of the most capable model Anthropic has ever shipped, and then to that same model being yanked off the shelves by a government directive 72 hours later.

If you ever needed proof that the AI story in 2026 is as much about governance and infrastructure as it is about raw capability, this is the week. Grab a coffee; there's a lot to unpack, and I've got opinions on most of it.

<!--more-->

---

## Generative AI

* [**Claude Code's Creator Stopped Prompting Claude — He Writes Loops and Merges 150 PRs a Day From His Phone**][1]. In this post by Chew Loong Nian, we get a deep dive into how Boris Cherny, the creator of Claude Code, actually works in mid-2026, and the headline numbers are genuinely startling. Cherny hasn't hand-written a line of code since October 2025, runs five to ten Claude sessions at a time, spawns a few hundred agents across them during the day, and lets a few thousand run overnight. On one record day, he merged 150 pull requests. His primary development machine? His phone.

  The line Chew Loong Nian rightly fixates on is deceptively simple: Cherny no longer prompts Claude; he writes loops. The whole first wave of "AI coding" was about getting the prompt right, more context, better instructions, the perfect one-shot. The claim here is that the next abstraction jump isn't a longer prompt at all, it's a verifiable process: a loop that schedules Claude, checks the result, and runs again. The human stops being the prompter and becomes the person who designs and supervises the loop, moving from the inner loop (where every iteration waits on you) to the outer loop (where you define the goal and the success check once, then supervise a fleet). The post is also refreshingly honest about the primitives that trip everyone up, `/loop` is process-bound and dies when you close the terminal, whereas cloud tasks or headless mode wired into your own cron are what actually run while you sleep.

  What I find compelling, and slightly uncomfortable, is how cleanly this reframes the skill that matters. For two years, we've been told prompt engineering is the new literacy; this article quietly buries that idea, replacing it with something closer to test engineering. Designing a loop means designing a verification step that the agent can grade itself against, and that is a fundamentally different muscle, one that data and platform people have been exercising for decades. The honest caveat, of course, is that Cherny is the head of Claude Code at Anthropic with an API budget the rest of us can only dream of, so nobody's spinning up a few thousand agents on a hobby repo this weekend.

  Here's the bit I keep wrestling with, though: the loop pattern genuinely scales down. One cron job, one repo, one "fix the CI and open a PR if the tests pass" instruction, and you've got a tiny version of the same machine working for you overnight. The barrier isn't access anymore; it's the discipline to define success crisply enough that an agent can check its own homework. That's a far more interesting problem than wordsmithing prompts, and I suspect the developers who internalise it first will, a year from now, look like they have superpowers.

---

* [**How Anthropic enables self-service data analytics with Claude**][2]. In this post, Anthropic's data science team shares how they got to a place where 95% of business analytics queries are automated via Claude with roughly 95% aggregate accuracy, freeing the humans to do the strategic work, causal modelling, forecasting, and machine learning instead of grinding out ad-hoc SQL. As someone who has spent a career in and around the data layer, this is the article I've been waiting for someone to write properly.

  The central insight is one every data engineer should tattoo somewhere visible: analytics accuracy is a context-and-verification problem, not a code-generation issue. Pointing Claude at a warehouse and letting it execute creates a *false sense of precision*. Coding is an open-ended space where documentation and tests act as natural guardrails. Still, analytics often relies on a single correct answer from a single correct source, with no deterministic way to prove its correctness. The team pins the bulk of inaccurate responses on three failure modes: concept-to-entity ambiguity (which of the hundreds of plausible fields actually defines an "active user"?), data staleness (definitions and schemas drift, and assets quietly rot), and retrieval failure (the right answer exists and is annotated, but the agent doesn't find it in the vastness).

  Their answer is an agentic data stack where each layer attacks one of those problems: strong data foundations and sources of truth shrink entity ambiguity until "revenue" resolves to one governed dataset instead of forty candidates; maintenance and validation processes fight staleness; and skills ensure the agent reliably finds and correctly uses the right answer. The mental shift they name is the big one: the end user of your data model is no longer a data expert; it's an agent acting on behalf of someone who can't validate the underlying correctness because they don't know enough to do so.

  What fascinates me here is how thoroughly this vindicates the unglamorous work. The industry spent two years implying that a clever model plus a vector store would make data modelling obsolete; this post says the opposite, that the model only gets to 95% *because* the data foundations, governance, and semantic definitions underneath it are solid. Garbage in, confidently-worded garbage out, just faster. If you've been quietly maintaining your dbt models, your tests, and your metric definitions while everyone else chased the shiny thing, congratulations, you built the moat. This is exactly the pattern I keep reaching for in my own SQL Server work, and it's good to see it spelt out by a team operating at this scale.

---

* [**New in Claude Managed Agents: run agents on a schedule and store environment variables in vaults**][3]. In this post, Anthropic looks at two new public-beta features for Claude Managed Agents that, taken together, push agents a meaningful step closer to genuinely autonomous teammates. The first is scheduled deployments: give an agent a cron schedule, and each time it fires, the agent spins up a fresh session and completes its task, with no scheduler for you to build or host. Think nightly data syncs, weekly compliance scans, or daily digests, and you can pause, resume, archive, or trigger extra runs on demand.

  The second feature is the one that quietly solves a real headache: storing environment variables in vaults so CLIs and other tools can make authenticated requests, without the agent ever seeing your keys. You register an API key with a variable name and the domains it's allowed to reach. The sandbox only ever holds a placeholder, and the real key is attached at the network boundary, only on requests to domains you've approved. It's a clean piece of security design, and it means tools like Browserbase, KERNEL, Notion, Ramp, and Sentry CLIs can be wired in without handing secrets to the model. The post points to real usage, too: Rakuten producing weekly reports and decks on a schedule; Actively AI and Ando refreshing answers regularly; and others connecting agents securely to their databases to flag usage surges as they happen.

  I'll admit a personal stake in this one: a scheduled agent that wakes up, does a defined job, and goes back to sleep is precisely the pattern I lean on, and seeing the credential story handled this carefully is reassuring. Keys never reaching the model isn't a nice-to-have; it's the difference between "interesting demo" and "thing my security team will actually sign off on." This is the boring, essential plumbing that turns Cherny's "loops, not prompts" philosophy from a power-user flex into something a normal team can deploy.

---

* [**The evolution of agentic surfaces: building with Claude Managed Agents**][5]. In this post, Anthropic's Applied AI team traces the arc of the company's agentic building blocks, from the deliberately simple 2023 API (tokens in, tokens out, you build the harness) to Claude Managed Agents, a suite of composable APIs for deploying production-grade agents. The throughline is a lesson the team says it sees on repeat: getting an agent into production takes far more than a good prompt, and infrastructure is what separates a prototype from a production agent.

  The post is a useful map of the evolution. First came the raw API, where turning Claude into an agent meant building your own loop, asking the model, running the tool, feeding the result back, repeating, and owning all the scaffolding. Then Claude Code arrived in 2025 with a tuned harness (the loop, tool execution, subagents, and context management), and developers naturally wanted that machinery for their own domains, which led to the Claude Agent SDK. But even with a great harness, production raised hard questions the team enumerates honestly: hosting and scaling for multi-hour tasks, session management that survives interruptions, filesystem workspaces, execution isolation and its blast radius, credentials, and observability. A recurring architectural culprit is harnesses running in the same container as the filesystem they act on, so a startup cost is paid before Claude can even think. Code execution lives right next to your credentials.

  Read alongside the scheduling-and-vaults announcement, this is the "why" behind that post's "what," and together they sketch a coherent thesis: Anthropic is methodically commoditising the unglamorous infrastructure that has been quietly eating away at everyone's agent-building budget. I find that a more interesting story than any single benchmark, because it's the part that determines whether agents stay impressive demos or become dependable colleagues.

---

* [**Claude Fable 5 and Claude Mythos 5**][4]. This post by Anthropic announces the launch of Claude Fable 5, a Mythos-class model made safe for general use, alongside Claude Mythos 5 for a small group of cyberdefenders and infrastructure providers. The capability claims are eye-watering: state-of-the-art on nearly all tested benchmarks, with the lead over previous models *growing* the longer and more complex the task. Stripe reported Fable 5 compressed months of engineering into days, performing a codebase-wide migration on a 50-million-line Ruby codebase in a single day, work that would have taken a team over two months by hand.

  The capability tour is a victory lap. Fable 5 tops Cognition's FrontierCode evaluation even at medium effort, takes the highest score on Hebbia's senior-level finance benchmark, and becomes the new state-of-the-art for vision, extracting precise numbers from scientific figures and rebuilding a web app's source code from screenshots alone. It beat Pokémon FireRed with a vision-only harness, where earlier models needed elaborate scaffolding, and, with persistent file-based memory, it reached the final act of Slay the Spire three times more often than Opus 4.8. Pricing lands at $10 per million input tokens and $50 per million output, less than half the cost of Claude Mythos Preview. Crucially, Anthropic shipped Fable 5 with conservative safeguards that reroute some sensitive queries to Opus 4.8, triggering in under 5% of sessions. At the same time, Mythos 5 has those safeguards lifted in some areas and is being deployed through Project Glasswing with the US government.

  Here's what strikes me, and it's a slightly uneasy thought: the gap between "general use" and "too dangerous for general use" is now a software toggle on the *same underlying model*. Fable and Mythos are the identical brain wearing different safety harnesses, which is an elegant engineering answer and a genuinely thorny governance question at the same time. The capability is real, and the safeguards are, by Anthropic's own account, deliberately over-broad to the point of annoying users. I respect shipping it that way rather than waiting for perfection. But "same model, different guardrails" will be the defining tension of frontier AI, and, as the very next article shows, that tension didn't take long to detonate.

---

* [**Statement on the US government directive to suspend access to Fable 5 and Mythos 5**][6]. In this post by Anthropic, published just three days after the Fable 5 launch, the company reports that the US government, citing national security and export-control authorities, issued a directive to suspend all access to Fable 5 and Mythos 5 by any foreign national, anywhere, including Anthropic's own foreign-national employees. The practical effect was that Anthropic had to abruptly disable both models for *all* customers to ensure compliance; access to all other Anthropic models remains unaffected.

  The detail is remarkable. Anthropic says it received the directive at 5:21pm ET, with no specific national-security rationale provided, and that its understanding is that the government became aware of a method of "jailbreaking" Fable 5. Anthropic reviewed a demonstration and found it surfaced a small number of previously known, minor vulnerabilities, ones it says other publicly available models (including OpenAI's GPT-5.5) can find without any bypass, and which defenders use every day. The company restates its launch posture: safeguards red-teamed for thousands of hours with the US government, the UK AISI, and third parties; no universal jailbreak found; a defence-in-depth strategy that aims to make jailbreaks either narrow or very expensive, backed by 30-day data retention to research and mitigate attacks. It is complying with the legal directive while openly disagreeing that a narrow potential jailbreak justifies recalling a commercial model deployed to hundreds of millions of people.

  I'm wrestling with what this means, and it unsettles me more than any claim about capability could. Set aside who's right on the technical merits (Anthropic's argument that this standard would "essentially halt all new model deployments for all frontier model providers" is a strong one) and sit with the precedent: a frontier model can now be switched off, for everyone, by government directive within hours, with no public technical justification. That's a profound shift in who actually controls access to this technology, and the foreign-national clause means even a company's own engineers can be cut off from the tool they built. Anthropic frames it as a misunderstanding it expects to resolve, and I hope it's right. But the lesson for the rest of us is sobering: if your workflow depends on a single frontier model, you just watched it vanish over a weekend. Build for portability, keep a fallback model in your back pocket, and treat "the model I rely on will always be available" as the assumption it clearly no longer is.

  And now allow me to put on my tinfoil hat, because the official "narrow jailbreak" story doesn't pass my personal smell test. A frontier model that's been red-teamed for thousands of hours, switched off for *everyone* within hours, over a vulnerability that Anthropic says GPT-5.5 can find on a Tuesday? Pull the other one. My very personal view is that this looks more like payback than national security: Anthropic has consistently declined to hand the US military a blank cheque to do whatever it likes with its models, and governments have long memories and short fuses. Cross the people who control the export-control rubber stamp, and don't be shocked when the rubber stamp comes down on you. And on a decidedly less serious note, part of me can't help wondering whether there's a whiff of Muskian envy in the air, too. Paul Krugman recently dubbed Elon a [human Ponzi scheme][krugman], and buried in that piece is the inconvenient detail that Grok is, by most accounts, not really up to scratch and that the administration has been quietly nudging agencies (the Pentagon included) to use it anyway, with little success. So forgive me if I raise an eyebrow when the one model that actually *is* state-of-the-art gets benched the very week it ships. Coincidence? Probably. But it's a fun conspiracy to chew on over coffee.

---

## WIND (What Is Niels Doing)

The big news on my side of the world: I'm deep in preparations for our next event, [**Data & AI Community Day Durban: AI Unplugged II — The Maskandi Sessions**][daid], happening on **July 25** at our favourite venue, **Richfield College, Umhlanga Campus**. If you've been to one of our Durban community days before, you know the vibe; if you haven't, this is your sign to fix that.

The Call for Sessions opened a week ago, and the early submissions have been genuinely top-class, but we still have room for more. So if you've got something interesting brewing in the world of Data and AI, please submit at [**sessionize.com/durban-ai-maskandi**][7]. The CfS doesn't close until **July 3**, but here's the catch: we run on a First Come First Serve principle, so if we're choosing between two submissions we rate equally, the earlier one wins. In other words, don't sit on it, submit *now*. Registrations will open soon, so keep your eyes peeled, and I'll have more news in the coming weeks.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to
[sd]: https://streamingdata.io
[jovpop]: https://www.youtube.com/channel/UCbR1-Tp8DKJKULzAy0DOCVw

[daid]: https://aimldatadurban.org/events/2026/maskandi/
[krugman]: https://substack.com/home/post/p-201723331


[1]: https://pub.towardsai.net/claude-codes-creator-stopped-prompting-claude-he-writes-loops-and-merges-150-prs-from-his-phone-b096ba603c13?sk=v2%2F8a36894e-bbe3-48f4-8e03-aed83a813bba
[2]: https://claude.com/blog/how-anthropic-enables-self-service-data-analytics-with-claude
[3]: https://claude.com/blog/whats-new-in-claude-managed-agents
[4]: https://www.anthropic.com/news/claude-fable-5-mythos-5
[5]: https://claude.com/blog/building-with-claude-managed-agents
[6]: https://www.anthropic.com/news/fable-mythos-access
[7]: https://sessionize.com/durban-ai-maskandi/