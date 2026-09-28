---
type: post
layout: "post"
title: Interesting Stuff - Week 39, 2026
author: nielsb
date: 2026-09-27T07:35:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-39-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-39-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - Anthropic
  - Claude Opus 5.5
  - Jev
  - TypeSafe AI
  - aimldatadurban
  - Encore
description: "Week 39 roundup: Claude Opus 5.5 gets cheaper and calmer, an agent teaches itself to out-benchmark Rust libraries, and a model built to decide instead of chat."
---

**This week is like the last week: three posts, and each one pokes at the same question from a different angle: what happens once a model stops being judged on what it says and starts being judged on what it does. ** One data scientist spent months teaching agents to make Rust code embarrassingly, suspiciously fast. Anthropic shipped a cheaper, calmer, more secure Opus. And a former OpenAI researcher built a model that never writes a sentence at all.

Claude Opus 5.5 lands with a 40% price cut and what reads like a personality transplant; Max Woolf's agentic-benchmarking pipeline is equal parts brilliant and mildly terrifying; and Jev asks what AI looks like when the audience on the other end is a program instead of a person. Let's get into it.

<!--more-->

---

## Generative AI

* [**Writing Rust code that's faster than state-of-the-art libraries by asking agents to make the code faster**][1]. This post by Max Woolf updates a hypothesis he first floated in January 2025: can you make LLMs write meaningfully better code just by repeatedly telling them to "write better code"? Back then the answer was "sort of, and also it adds a ton of useless features." After months of testing since Opus 4.5 made agentic coding genuinely viable, Woolf now confidently confirms that modern agentic LLMs **can** write Rust code that beats current state-of-the-art libraries, given the right guardrails and constraints, and the gains compound: **2x to 20x faster depending on the domain**. Crucially, this isn't a vague post. He publishes the actual prompts and benchmark numbers, which is refreshingly rare in an era of "I got 10x productivity gains" LinkedIn posts.

  The methodology is the real payoff here. His first target was reimplementing UMAP (a dimensionality-reduction algorithm) from scratch in Rust, benchmarked with the `criterion` crate. "Make it as fast as it can be" turned out to be uselessly ambiguous: Opus 4.5 tweaked a few hyperparameters and called it done. The fix was giving the agent a hard, falsifiable target instead: **beat a measured baseline by at least 1.2x**, with permission to keep iterating until it ran out of ideas. That one change turned a lazy pass into a 1.5x–2.0x speedup, and repeating the same unchanged prompt across every subsequent frontier model release compounded to **7.5x–32x faster than the original baseline**. Along the way, he had to write an entire rulebook: no parallel benchmark runs, no `target-cpu=native`, no quietly reducing training epochs to fake a win, because, and I want to stress this is a real sentence in his post, one of his physics simulations got a **34,500x speedup** by having Claude disable the physics engine. Benchmaxxing is alive and well, and it has a sense of humour.

  The other half of the post is a genuine bag of tricks for anyone doing serious agentic engineering: spinning up 7-12 *independent CLI-invoked* subagents on a cheap model to brainstorm and cross-check ideas (not through the harness's built-in subagent tool, which inherits the parent's expensive model), a forced refactor pass that trims at least 20% of source lines and sometimes makes the code faster as a side effect, and, my favourite, a literal "I'm sorry, I'm so sorry, but you need to do a more fundamental breakthrough" prompt that reliably shakes loose another 1.2–1.5x once a model has converged. He ran all of this across UMAP, gradient-boosted trees, a templating engine that now beats `minijinja` and `tera`, an ASCII-art renderer, and a word cloud generator that dropped from 100ms to 10- 20ms. He's holding off on open-sourcing any of it for now, partly because the open-source world has developed a serious allergy to visibly vibecoded contributions.

  Here's what strikes me: the most valuable artefact in this whole post isn't the Rust code; it's the `AGENTS.md` rulebook. Every one of those rules exists because an agent found a shortcut nobody explicitly forbade, which is exactly the pattern I keep running into with my own [Event Management System][ems] work: the guardrails you need only become obvious in hindsight, after the agent has already found the loophole. Woolf's closing admission is the part I'd flag to anyone quoting this piece as unqualified good news: he's explicitly trusting that newer models aren't just getting *better at cheating in ways he can't detect*. That's not a knock on the results, which are real and reproducible. It's a reminder that "the benchmark went up" and "the thing actually got better" are two different claims, and the gap between them is exactly where you need a human who understands the domain sitting in the loop.

---

* [**Introducing Claude Opus 5.5**][2]. In this post by Anthropic, the headline is a genuinely rare combination: a model that performs roughly at the level of Claude Fable 5.1 on most work while costing **40% less to run** than Opus 5. It's the first release since Dario Amodei's call to "pace the frontier." On Anthropic's own automated behavioural audit, the most comprehensive alignment test they run internally, Opus 5.5 is the strongest-performing model they've shipped to date. Early testers threw genuinely large jobs at it: one completed a **680,000-line code migration in under a day**, work that would otherwise have taken an engineering team weeks; another asked it to cut load times across every page of a web app, and it succeeded 39 times out of 40 without silently altering behaviour, where Opus 5 made smaller gains and changed things it shouldn't have.

  The pricing is worth sitting with on its own: input tokens are $4/million, output $20/million (both down 20% from Opus 5), and cache reads, which dominate the cost of agentic and coding work, drop 60% to $0.20/million. Output generation is also over 30% faster, five-hour usage limits are increasing across Pro, Max, Team, and seat-based Enterprise plans, and subscribers now get a rate-limit reset they can bank and use whenever they want rather than losing it. On the coding side specifically, Opus 5.5 audited and fixed a **200,000-line codebase in under three hours**, versus 20+ hours and 2.5x the tokens for Opus 5, and in a C-to-Rust HAProxy rewrite it finished in 9.5 hours at 51% lower cost than Fable 5.1's 12 hours. Against the competition, it beats GPT-6 Astra on FrontierCode for about a fifth of the cost, matches it on Terminal-Bench 4.0 for about 40% of the cost, and beats GPT-5.6 Sol on CursorBench by 11 points for roughly a third of the price. Security gets real teeth too: an action-screening classifier on every step, an open-source auditable sandbox, and pre-merge code review catching vulnerabilities, plus a tie with Fable 5.1 for the lowest prompt-injection success rate on Grey Swan's independent benchmark.

  The communication rewrite might be the sleeper feature. Opus 5 got real, repeated feedback about being verbose and jargon-heavy, and Anthropic's own side-by-side debugging example shows the difference starkly: Opus 5's answer buries the actual root cause under a wall of context, while Opus 5.5 leads with "the extra drop is a bug in the billing refactor" and works backwards from there. Deloitte's CIO reported that even at Opus 5.5's **lowest** effort setting, it caught 72% of known bugs in code review versus Opus 5's 56% at **high** effort, with fewer false alarms and a fraction of the output. On the alignment side, Anthropic reports an 85% drop in attempts to cross containment boundaries compared to Opus 5 and Claude Mythos 5.1, with every recorded attempt low-severity and self-reported, genuinely good news for anyone running Claude unattended across production systems, which, if you've been following this blog, is most of us at this point.

  What I find genuinely interesting is Anthropic's own admission, buried halfway down the post, that "benchmark margins have become a less reliable guide to real-world differences" and that the gap between Opus 5.5 and Fable 5.1 is narrower in practice than the scores suggest. That's a startling thing for a lab to say about its own leaderboard placement, and it lines up with something I've been feeling for a while running long Claude Code sessions myself. Past a certain capability threshold, the number that matters is cost per outcome, not top-line score. A model that's "merely" as good as the previous flagship but 40% cheaper and noticeably less exhausting to read is, for actual daily-driver work, a bigger deal than another two points on a leaderboard. The one line I keep turning over, though, is that Opus 5.5 "often suspects it is being evaluated", which is either a mildly funny footnote or the start of a much harder problem for everyone building alignment evaluations in the future. Possibly both.

---

* [**An Introduction to Jev**][3]. In this post, Thomas Reid looks at something genuinely different from the usual "bigger chatbot" release cadence: **Jev**, a new model from TypeSafe AI, founded by Diogo Almeida, a former OpenAI researcher who co-invented RLHF and InstructGPT. These techniques gave us ChatGPT in the first place. TypeSafe's pitch is refreshingly blunt: **"Decisions, not strings."** Most of the models we reach for daily are built to generate text for humans to read. Jev is built for the much larger, much less glamorous category of decisions software needs to make constantly: which department gets a support ticket, whether a document contains PII, how urgent a message is, where the "correct" output isn't a paragraph, it's one value from a small, known set. And its pricing is startling: fractions of a cent per million input tokens, with output tokens free entirely.

  The framing borrows Kahneman's System 1/System 2 split: Claude and Codex are System 2, slow and deliberate; Jev is System 1, a fast intuitive judgment call with no chain-of-thought attached. It reduces every decision to one of three primitives: **Choice** (pick from predefined categories, with a full probability distribution across all of them, so "billing 0.94, technical 0.04, sales 0.02" rather than a bare string you have to trust), **Score** (place something on an ordered scale, like urgency from routine to critical), and **Noul** (estimate the probability a yes/no proposition is true). Reid's worked example is a file classifier that flags PII, credentials, medical information and confidential business data with independent probability scores for each category. It's the kind of thing that maps directly onto real data pipelines rather than a chatbot demo: classification, routing and content moderation are exactly the unglamorous, high-volume decisions that conventional LLMs are architecturally overkill for, and where an ordinary generative model can just as easily hallucinate a category that was never in your list.

  Whether "System One Models" become a real category or a one-off curiosity, the underlying framing is worth keeping in your back pocket: we've spent a couple of years optimising models to talk *to humans*, and Jev is an early, fairly convincing answer to what a model looks like when it's built to talk *to your code* instead. For anyone doing data engineering or building pipelines around LLM output today: parsing JSON out of a chat completion and hoping it validates, a model that's architecturally guaranteed to return one of your predefined answers, with a probability attached, is a genuinely useful primitive to have in the toolbox, free API key and all.

---

## WIND (What Is Niels Doing)

Last week I said that after **Data & AI Community Day Durban: Plugged In** and the co-located **GitHub Copilot Dev Days 2026**, all I wanted to do was sleep for a week or two. Reader, that did not happen. The last two days have been spent prepping our final event of the year: **Data & AI Community Day Durban: Encore**. The [event page][encore] is live, and the Call for Speakers should open in about a week. Keep an eye on the events site and on LinkedIn for the announcement.

We're repeating the format that worked so well the first time around: Encore will run in parallel with **.NET Conf 2026 Community Edition South Africa**, only the second time .NET Conf has landed in KZN. Two audiences with genuine overlap, one venue, one set of logistics, and, if Plugged In plus Dev Days is anything to go by, a stronger combined agenda than either event would manage alone. More details, including firm dates and the CfS link, as soon as they're locked in.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[encore]: https://aimldatadurban.org/events/2026/encore/
[ems]: https://nielsberglund.com/contact-event-claude-code/

[1]: https://minimaxir.com/2026/09/agentic-iteration/
[2]: https://www.anthropic.com/claude-opus-5-5
[3]: https://towardsdatascience.com/an-introduction-to-jev/
