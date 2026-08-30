---
type: post
layout: "post"
title: Interesting Stuff - Week 35, 2026
author: nielsb
date: 2026-08-30T07:38:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-35-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-35-26.jpg"
categories:
  - roundup
tags:
  - Anthropic
  - Claude Code
  - AI Agents
  - Steve Yegge
  - Andrew Ng
  - AI Engineering
  - aimldatadurban
  - pluggedin
  - Dev Days 2026
description: "Week 35 roundup: Claude Academy and AI fluency, Anthropic's AI-native SDLC playbook, Steve Yegge's fences instead of sandboxes, and Andrew Ng's AI Engineering Skills Map."
---

**Four posts this week, and between them they answer one question from four directions: now that the agents can write the code, what exactly is left for the rest of us to do?** Turns out the answer is *governance, judgement, and knowing which words to use*, which is a lot more interesting than it sounds.

We've got Anthropic on how to actually teach people to use AI, a forty-minute playbook for rebuilding your entire software development lifecycle around agents, Steve Yegge discovering that his agents built a medieval legal system when he wasn't looking, and Andrew Ng putting numbers on which AI engineering skills are worth learning. Grab a coffee; this one's a good week.

<!--more-->

---

## Generative AI

* [**Anthropic's approach to teaching and learning AI**][1]. In this post, Anthropic pulls back the curtain on **Claude Academy** and, more usefully, on the pedagogy behind it, because the launch announcement is the least interesting part. What's worth your time is the admission that they teach their own employees this stuff from day one, using the **4D AI Fluency Framework**, and that the curriculum is deliberately product- and model-agnostic. You can go and look at academy.claude.com today, or find it under the "Learn more" tab in your Claude profile menu, but the design principles are what I'd steal.

  The central pivot is away from features and towards *mindsets*. Anthropic's education team makes the point that specific behaviours that used to matter - "describe your audience", "state your role" - have quietly stopped mattering because the newest models ask whether they need to know. So instead of teaching prompt recipes with a six-month shelf life, they teach durable heuristics: **"today's AI is the worst AI you'll ever use"** and **"verify in proportion to the stakes."** That second one is the single best piece of AI guidance I've seen written down anywhere, and it fits on a sticky note.

  The other thread running through the piece is that AI education should *increase human agency*, not erode it. Learners are explicitly nudged to decide what should stay with them and what should be delegated: draft the sensitive part of the memo yourself, let Claude assemble the summary slides, and practise the skills they care about so they don't atrophy. There's also a section on ethically disclosing AI use to colleagues and customers, which is the sort of thing everyone nods at and nobody writes into their onboarding. Anthropic did.

---

* [**The AI-Native SDLC playbook**][2]. This post by Louis Claxton is the most substantial thing Anthropic has published in months: a forty-minute, stage-by-stage guide to rebuilding your software development lifecycle for a world where **code is no longer the bottleneck**. The framing is brutally correct. Organisations bolted agentic coding onto a process designed for an era when writing the code was the expensive bit, and now the build phase collapses to hours while plan, review and deploy still run at human speed. Three things follow: the bottleneck moves left and right of build, the controls stop matching reality, and governance costs go up because exceptions still route through a committee that meets on Thursdays.

  The playbook covers all six stages: Plan, Design, Build, Test, Deploy, Maintain, and each one ends by committing an artifact that the next stage reads. `intent.md` captures an idea in the originator's own words (written by a product owner in Cowork or claude.ai, no git experience required), `spec.md` compresses requirements and design into a single session constrained by the organisation's Skills, `plan.md` comes out of Claude Code's plan mode before a line is generated, then the diff, the PR with its review findings, and the incident record. The chain of commits *is* the audit trail: who asked for what, what the agent produced, who approved it. If you have ever tried to explain agentic development to a compliance officer, that sentence is worth the whole read.

  The mechanics are where it gets properly practical. `CLAUDE.md` as the file a new joiner would need, kept under a page, with a working rule that when Claude makes the same mistake twice, the correction goes in. **Skills** are institutional knowledge that's version-controlled and updated centrally, with the rule of thumb that a Skill is an *advisory* control, and anything that must always hold requires a deterministic **hook** behind it. Parallel sessions in git worktrees, two or three to start, with the practical ceiling being how many streams one person can review properly. Continuous **evals in CI** that run whenever `CLAUDE.md`, a Skill or a hook changes, because the configuration that steers the agent deserves the same regression testing the code gets. Every play ships with prerequisites, governance considerations, and both a leading and a lagging indicator. It is unusually honest about measurement.

   What I find genuinely clever here is the sentence buried in the Test stage: *an agent fixing code must not be able to weaken the check on that code.* Write the failing test first, commit it, then let Claude make it pass, with a hook that blocks edits to test files during a fix task. That's it. That's the whole trust problem in one line, and it's solvable today with about 15 lines of shell code. The rest of the playbook is excellent, but this is the bit I'd implement on Monday. My one reservation is the sheer institutional weight the full programme assumes: a platform team, a policy owner per Skill, managed settings pushed via MDM. For a regulated enterprise, perfect. For the two-pizza team, start with `CLAUDE.md`, a feedback loop, and one hook, and treat the other twenty plays as a roadmap rather than a checklist.

---

* [**Fences, not Sandboxes**][3]. In this post, Steve Yegge looks at what his agent fleet built while he wasn't paying attention, and the answer is not what any of us expected. Regular readers will remember [Wheelhouse from week 32][shape]; it has since grown to roughly 600k lines, running 50-60 agents on a 512GB M3 Ultra he bought off eBay, burning the equivalent of $122k/month in API spend (about $5k out of pocket, thanks to Claude Max). His justification for why you should listen is characteristically blunt: he sees the future by *living* in it, roughly a year before it becomes cost-effective for the rest of us.

  Here's the reveal. Yegge finally popped the hood on the jargon his agents kept using: fences, ratchets, governors, tripwires, latches, gates, falsifiers, expecting to find an engineering system. Instead, he found **an entire legal system**: a constitution, jurisprudence, courts, offices, jurisdiction, case law, rulings, registries and ledgers. 450 legal artefacts. Fable had built a medieval government, complete with a Marshal, a Seneschal, and a Reeve, and the LARPing names masked a bona fide system of constitutional governance. The *why* is the good bit: every project runs on thousands of little unwritten rules, and if you let it, Fable will try to capture all of that tribal knowledge into a mechanically provable, AI-operable model of your organisation. Rules go through a lifecycle, tightening each time they're re-violated: first custom, then advisory, then written law, then mechanical enforcement.

  And a **fence**, it turns out, is simply *any mechanism that turns you away if you aren't supposed to be there.* The Molly Guard over IBM's big red button. The guy who takes your ticket on the train. In Wheelhouse, only Fable is permitted to talk to humans, enforced at the Slack and email boundary. Crucially, a fence is not a wall and not a sandbox; it's a polite refusal saying you didn't do the paperwork. Yegge's metaphor is Superman and the white picket fence: he could obviously step over it, and no shield you build would stop him anyway, but he *won't*, because he's polite. The claim is that governing capable models is about telling them their role, their context, and the rules for making decisions: not about building better prisons.

  I'll offer one caveat and one endorsement. The caveat: Yegge's own post undercuts the thesis most entertainingly, describing an agent that shipped a surprise Beads release and broke everyone, then arguing that fences rather than walls are sufficient. Politeness is a property of an aligned model, and a fence that only works on the well-intentioned is a norm, not a control: which is precisely why Anthropic's playbook above pairs every advisory Skill with a deterministic hook. The endorsement: his observation that **you can't transplant this** is the most important thing in the piece. Intelligence grows around your domain like ivy on a wall; you can't rip it off one building and stick it on another; you have to seed it and grow it. That's a direct shot at every vendor currently selling a reusable agent harness, and it's the same argument he made in week 32, that harnesses are chemically bonded to the application. Two posts, one thesis, and I think he's right.

---

* [**The AI Engineering Skills Map**][4]. In this post by Andrew Ng, we get something the AI-careers discourse has been badly short of: *data*. Ng and his team analysed over 10,000 job postings, ran dozens of structured interviews with AI experts, hiring managers and recruiters, and gathered survey data- think of it as clustering over a very large, very noisy dataset- to identify the four AI engineering skills that actually matter. His terminology note is important too: he deliberately says AI engineering *skills* rather than the AI Engineer *role*, because every developer needs cloud skills while only a few carry "Cloud Engineer" on a business card. Same trajectory here.

  The four: **building and deploying AI applications** (understanding LLMs, context engineering, RAG, agentic workflows, and crucially the statistical techniques to measure, steer and govern systems with unpredictable outputs, disciplined evals and error analysis loops); **software engineering fundamentals** (so you can recognise which tradeoffs even exist, and steer an agent in the precise language of software engineering rather than vibe-coding into a corner); **using coding agents** (managing context, trading off planning against execution, closing loops with verifiers, orchestrating multiple agents, and not letting one near your production database); and **shaping the build** (product sense, business context, deciding what goes *into* the spec, knowing when to ship an MVP and when to slow down). Underneath all four sits a mindset of continuous learning, and Ng promises a fuller map plus deeper posts on each skill.

  What strikes me is that three of these four are things we already claimed to value and mostly didn't reward. "Software engineering fundamentals" has been on every job spec since the invention of the job spec, and yet the industry spent a decade optimising interviews for framework trivia. "Shaping the build" is what we used to call *having product sense*, a quality routinely praised in performance reviews and never once made a promotion criterion for an IC. What's changed is that agents have made these skills *load-bearing* rather than merely admirable: if the agent writes the code, then knowing which tradeoffs exist and what should be in the spec is no longer a nice-to-have you demonstrate after hours; it is the job. That's a real inversion, and it lands especially hard on the "just tell me what to build" end of the profession.

  The item I'd push back on slightly is the framing of "using coding agents" as a discrete skill. Ng is right that it's a skill *today*, and right that keeping routines for trying new tools matters because best practices are churning monthly. But I suspect it has the shelf life of "knowing how to use a search engine"; genuinely differentiating in 2001, unremarkable by 2010. The durable half of that bullet is the part about verifiers and evals: closing the loop so the agent can prove its own work. That's not agent-tool knowledge; it's the statistical governance from bullet one wearing different clothes, and it's the thing I'd tell anyone to learn first.

---

## WIND (What Is Niels Doing)

We're now inside the three-week countdown to [**Data & AI Community Day Durban: Plugged In**][daid] and the co-located **GitHub Copilot Dev Days** on **September 19**, which means I'm deep in the unglamorous half of running a community event: schedules, logistics, sponsors, catering headcounts, and the thousand small admin things that nobody sees and everybody notices if you get them wrong. The speaker lineup looks genuinely strong, and I'll have more to say about the agenda shortly. For now, if you're anywhere near Durban on the 19th, put it in your diary.

On top of that, I'm prepping a talk or two, both for Plugged In and for [**Dev Days Cape Town 2026**][ddct]. Since we are talking Dev Days, I'm considering GitHub Copilot. More on that soon.

---


## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[daid]: https://aimldatadurban.org/events/2026/pluggedin/
[ddct]: https://cptmsdug.dev/dev-days-2026.html
[shape]: https://yegge.ai/essays/the-shape-of-things-to-come/

[1]: https://claude.com/blog/anthropics-approach-to-teaching-and-learning-ai
[2]: https://claude.com/blog/the-ai-native-sdlc-playbook
[3]: https://yegge.ai/essays/fences-not-sandboxes/
[4]: https://x.com/AndrewYNg/status/2088302050706686198
