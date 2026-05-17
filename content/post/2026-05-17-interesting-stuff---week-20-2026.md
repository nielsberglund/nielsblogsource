---
type: post
layout: "post"
title: Interesting Stuff - Week 20, 2026
author: nielsb
date: 2026-05-17T06:25:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-20-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-20-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - AI Agents
  - Agent Skills
  - Cognitive Atrophy
description: "Week 20 tech roundup: Microsoft's Aspire team learns that AI makes production cheaper but maintenance harder, Perplexity reveals how they design and maintain agent skills at scale, and a sharp essay argues agentic coding is a cognitive trap."
---

This week's roundup is a masterclass in honest reflection. A Microsoft Distinguished Engineer shares hard-won lessons from integrating AI across the full engineering loop on the Aspire team, revealing that the bottleneck doesn't disappear; it just moves. Meanwhile, Perplexity's Agents team pulls back the curtain on how they design, refine, and maintain skills at production scale, with insights that will make you rethink everything about context costs.

On the provocative end of the spectrum, a thoughtful essay argues that agentic coding is a cognitive trap eroding the very skills needed to supervise the agents, Ted Neward draws historical parallels between coding agents and the IDE revolution, and a former Google engineer chronicles how the company's fragmented IDE landscape converged into a single platform that changed everything.

<!--more-->

---

## Misc.

* [**A History of IDEs at Google**][4]. In this post by Laurent Le Brun, a former Google engineer who spent 12 years on developer tools, we get a fascinating chronicle of how Google's fragmented IDE landscape converged into Cider V, a VSCode-based cloud IDE used by 80% of developers on the main monorepo by 2023. The story begins in 2011 when Jeff Dean was asked about a uniform IDE and replied: "Trying to get a group of developers to all agree on a common editor is a recipe for unhappiness." For years, this was the prevailing wisdom. Engineers picked their own editors, and useful integrations (Bazel support, code search, formatters) had to be reimplemented across each one.

  The turning point came with Cider, a web-based editor that leveraged Google's investment in backend code intelligence, a language graph updated with every commit across a codebase receiving multiple commits per second. When the team switched to VSCode as the frontend in 2020, they inherited a mature extension ecosystem that unlocked teams across the company. The conclusion resonates deeply with the discussion of the coding agent: standard tooling creates leverage. Once 80% of engineers used the same IDE, the company could invest more in each feature because each change had more impact. Around 100 internal extensions emerged, AI features became trivial to integrate across the whole developer population, and the question "what's the best IDE?" gave way to "what can we build on top of a shared platform?" It's a compelling argument for why the IDE that best integrates coding agents will win the next era.

## Generative AI

* [**Things I Think I Think... about Coding Agents and IDEs**][1]. In this post, Ted Neward, an old colleague of mine, draws a historical line from IDE wizards through VB drag-and-drop to today's coding agents. His thesis is straightforward: every generation of developer tooling has faced the same pattern: resistance from experienced engineers with working workflows, followed by inevitable adoption once the utility becomes undeniable. The wizards of the MFC era generated "garbage code" that grizzled C++ developers hated, yet they won anyway. Coding agents are following the same trajectory: too useful to discard entirely, but nowhere near mastered yet.

  What fascinates me is Ted's prediction about where this settles. He argues coding agents won't replace IDEs but will be "baked in" to IDEs in deep, meaningful ways, giving agents direct access to debuggers and profilers rather than forcing models to "run code in their head." The first IDE vendor to figure this out, he says with a not-so-subtle cough toward JetBrains, will find themselves back on top. He also drops a practical warning: tokens are already getting less cheap than they used to be, and the era of burning them indiscriminately on everything is ending. The smart move is using agents solely for what they excel at, not for everything.

---

* [**AI Made Us Faster. That Was the Problem**][2]. This post by David Fowler, a Distinguished Engineer at Microsoft, is one of the most honest accounts I've read of what happens when a real product team goes AI-first. The Aspire team (an open-source platform for orchestrating application stacks) is treating AI as part of the full engineering system: planning, implementation, docs, testing, review, and release. The TypeScript support work crystallises the core tension: Fowler produced what felt like six months of code in about a week, but this created an overconfidence problem. When there's no back pressure on output, you generate more code than the team can reasonably absorb, understand, and review.

  The central insight is devastating in its simplicity: the cost of production has gone down, but the cost of maintenance has not. AI makes it trivially easy to create code, tests, docs, and surface area. It does not automatically make those things coherent, durable, or worth owning. This raises the bar for engineering judgment rather than lowering it. If a team can produce more in less time, they need stronger mechanisms for deciding what should exist at all. The bottleneck moves from "can we build this?" to "should we build this?", and that second question requires exactly the kind of product context, customer history, and architectural intent that agents currently lack.

  Here's what strikes me about Fowler's cultural observations: adopting agents can feel like a step backwards for experienced engineers. You already know how to build software, and suddenly you're learning to decompose tasks differently, provide context to an agent, and recover from bad output. He frames this as a confidence-and-trust problem, not a tooling problem. The teams that learn fastest will be those that adjust workflows without lowering standards. His line, "AI accelerates the work. Engineers still own the result," should be tattooed on every engineering leader's forehead. This connects directly to the "agent-readiness is codebase health" argument: if your repo doesn't have a clear structure, good tests, and enough context for agents to make reasonable decisions, the mess scales faster than ever.

---

* [**Designing, Refining, and Maintaining Agent Skills at Perplexity**][3]. The Perplexity Agents team in this post explains how they build, evaluate, and maintain the skill library powering their frontier-agent products, including Perplexity Computer. The opening provocation sets the tone: many useful Python patterns are actively misleading when applied to writing skills. "Simple is better than complex" becomes "Complexity is the feature." "If the implementation is easy to explain, it may be a good idea" becomes "If it's easy to explain, the model already knows it. Delete it." This isn't abstract philosophy; it's hard-won production experience from a team maintaining skills across finance, law, health, and hundreds of long-tail use cases.

  The three-tier context cost model is the most actionable framework I've seen for skill design. The index tier (name + description) costs ~100 tokens per skill and is paid by every session, every user, always. The load tier (full SKILL.md body) should stay under 5,000 tokens because once loaded, the rest of the conversation pays that cost until compaction. The runtime tier (scripts, references, assets) is unbounded but only loaded on demand. Their U.S. income tax skill example is extraordinary: 1,945 sections of the Internal Revenue Code organised into three levels of topical nesting, because presenting it flat actually performed worse than no skill at all. The hierarchy wasn't free; it required custom search utilities and quick reference guides, but the curation produced dramatically better results.

  What I find most valuable is the "every skill is a tax" philosophy. Perplexity's test for every sentence: "Would the agent get this wrong without this instruction?" If not, it cannot afford to be there. The description isn't documentation, it's a routing trigger. Write "Load when...", not "This skill does..." Include what frustrated users actually say ("babysit my PR", "watch CI") rather than formal descriptions. They also share a striking finding: self-generated skills (skills written by LLMs) provide no benefit on average, because models cannot reliably author the procedural knowledge they consume. You need to inject your own opinion and domain expertise. Combined with their gotcha flywheel (append a gotcha every time the agent fails) and multi-model eval suites, this is the most mature skill-maintenance methodology I've encountered.

---

* [**Agentic Coding is a Trap**][5]. Lars Faye, in this post, delivers the sharpest critique I've read of the "spec-driven development" narrative, arguing that the entire agentic coding workflow has a fundamental contradiction at its heart: it actively diminishes the very skills needed to manage the agents effectively. The piece opens by challenging the "AI does the coding, human is the orchestrator" narrative and systematically dismantles the assumption that developers are "moving up the stack" into a new abstraction. A higher level of ambiguity, Faye argues, is not a higher level of abstraction. When FORTRAN replaced assembly, or Java replaced C++, developers didn't report brain fog. Something genuinely different is happening now.

  The evidence Faye marshals is uncomfortable (see below for more). Simon Willison, with nearly 30 years of experience, reports not having a "firm mental model" of applications built with AI assistance. Anthropic's own research acknowledges a "paradox of supervision": effectively using Claude requires the coding skills that may atrophy from overuse. A 47% drop-off in debugging skills. LinkedIn's Director of Engineering is asking his 50 engineers not to use AI for "tasks that require critical thinking." And during a Claude outage, entire teams are at a standstill because their coding abilities have already atrophied to dependency. Faye calls this "vendor lock-in" across an entire industry skill set, and the financial dimension is equally sharp: you know how much employees cost, but you have no idea what tokens will cost next month.

  I am the first to admit that some of Lars' points land, and the post tells some uncomfortable truths. At Derivco, we are battling with some of this. That said, I think the piece is doing some advocacy work it doesn't fully own up to. Most of his "evidence" links resolve back to Reddit threads, which is a self-selecting sample; people who feel productive aren't posting about it. He quotes the Anthropic study's risk-acknowledgement paragraph but skips the productivity findings sitting next to it in the same paper. Simon Willison's quote is about applications outgrowing the developer's mental model, not skill atrophy. A different problem. And the FORTRAN dismissal feels too easy: assembly programmers really did lose register-allocation intuition, and the industry survived because what they gained was worth more than what they lost.
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


[1]: https://blogs.newardassociates.com/blog/2026/titit-agents-as-ides.html
[2]: https://www.linkedin.com/pulse/ai-made-us-faster-problem-david-fowler-mgnzc/
[3]: https://research.perplexity.ai/articles/designing-refining-and-maintaining-agent-skills-at-perplexity
[4]: https://laurent.le-brun.eu/blog/a-history-of-ides-at-google
[5]: https://larsfaye.com/articles/agentic-coding-is-a-trap
