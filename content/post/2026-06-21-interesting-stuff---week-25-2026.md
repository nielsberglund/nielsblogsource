---
type: post
layout: "post"
title: Interesting Stuff - Week 25, 2026
author: nielsb
date: 2026-06-21T06:15:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-25-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-25-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - AI Agents
  - Loop Engineering
  - Data Engineering
description: "Week 25 tech roundup: steering Claude Code, artifacts in the terminal, loop engineering, GitHub's analytics agent, agent eval infra, and Yegge's Flat Curve Society."
---

If last week was about a frontier model launching and getting yanked off the shelves inside 72 hours, this week is the quieter, more useful sequel: how we actually steer, evaluate, and live with the agents we already have. Less fireworks, more plumbing, and the plumbing is where the real money is.

We've got two fresh Claude Code announcements, a beginner-friendly take on "loop engineering," GitHub's story of building an internal analytics agent, a deep dive into agent evaluation infrastructure, and Steve Yegge declaring that we've all joined the Flat Curve Society. Grab a coffee; there's plenty to chew on, and I've got opinions on most of it.

<!--more-->

---

## Generative AI

* [**CLAUDE.md files, skills, hooks, rules, subagents and more**][2]. In this post, Anthropic maps out the seven ways you can steer Claude Code's behaviour, and crucially, *when* each one should be your weapon of choice: CLAUDE.md files, rules, skills, subagents, hooks, output styles, and appending the system prompt. The framing is genuinely useful because it stops treating these as interchangeable. Each method differs along three axes: when the instruction loads into context, whether it survives compaction over a long session, and how much authority it carries. The accompanying table is the kind of cheat-sheet I suspect a lot of people will quietly bookmark.

  The detail rewards a careful read. Root CLAUDE.md files load at session start and stay put (re-read after compaction), which makes them perfect for build commands and conventions but expensive if you stuff everything in there. Path-scoped rules load only when matching files are touched; skills load their name and description up front and pull in the full body when invoked; subagents run in an isolated context and return only their final message; and hooks fire deterministically on lifecycle events with almost no context cost. The post's repeated refrain is that an instruction is the wrong tool for anything that *must* happen, "every time X, always do Y" belongs in a hook, and "never do this" needs a deterministic guardrail, because a prompted rule can be skipped under pressure, in a long session, or via a prompt injection lurking in a file.

  Here's what strikes me: this article is, in spirit, a love letter to the very thing that makes my weekly roundup possible. The whole workflow you're reading right now is a CLAUDE.md file plus a skill plus a scheduled run, and the advice to "keep CLAUDE.md under 200 lines, give it an owner, and review changes to it like code" is exactly the discipline that separates a reliable agent from a flaky one. We spent two years obsessing over prompts; the frontier of practice has quietly moved to *information architecture*, deciding what Claude should know, when it should know it, and how much it should cost to tell it. That's a software-engineering problem, not a wordsmithing one, and I find that shift far more interesting than any benchmark.

---

* [**Claude Code now supports artifacts**][3]. Anthropic in this post looks at a feature that turns a Claude Code session into a live, shareable web page, a PR walkthrough, a dashboard, an incident timeline, a release checklist, built from the full context of your session and updating itself as the work progresses. The pitch is collaboration: instead of teammates asking you to "walk us through what the agent found," everyone opens the same link and sees the same view, refreshed in place every time Claude republishes.

  The mechanics are nicely thought through. Each artefact is built from your codebase, your connectors, and the conversation itself, so an incident page can stitch together the failing test, the function behind it, the error spike from a connected monitoring tool, and the root-cause reasoning, without you wiring up a single data source. Every publish is a new version at the same URL with full version history, artefacts are private to the author by default and shareable only within an authenticated org (they can't be made public), and admins get retention policies and a compliance API. Anthropic's own most common internal use case, unsurprisingly, is debugging: kick off an incident investigation before standup, and by the time standup begins, the page has republished itself twice.

  If the name "artefacts" rings a bell, it should; this is the same idea that powers the visual previews in Claude's chat interface and, indeed, in Cowork, now pulled down into the terminal where engineers actually live. It's currently in beta for Team and Enterprise orgs, and I'll be fascinated to see whether it kills the genre of hastily-screenshotted Slack updates that we've all suffered through. A self-updating page beats a stale screenshot every single time.

---

* [**The Creator of Claude Code Says Prompt Engineering Is No Longer the Main Skill**][6]. This post by Divy Yadav takes the now-famous Boris Cherny line, "I don't prompt Claude anymore, I have loops running that prompt Claude... my job is to write loops", and turns it into a genuinely accessible primer on what the community is calling *loop engineering*. The four-step evolution he sketches is clean: prompting wraps into context, context wraps into agents, agents wrap into loops, and the highest-return skill now sits at the top of that stack. The bottleneck, he argues, has moved from the model (which used to need constant hand-holding) to *you*, your typing speed, your reading pace, your decision to send the next message.

  Yadav leans on Dharmesh Shah's three-part framing for what every loop actually needs, and it's the part worth tattooing somewhere visible. A loop needs an objective ("triage all P1 issues, each must have an owner and an initial plan"), a metric the loop can check *itself* against ("zero P1 issues with no assignee when the loop finishes"), and a boundary, how far it can run before it must stop and ask you, because "a loop without a boundary is a loop that can delete your database at 3am and keep going." He's equally clear on when *not* to loop: when you haven't done the task by hand first, when the success condition is fuzzy, or when the stakes are high, and mistakes are hard to reverse.

  Regular readers will spot that I covered Cherny's "150 PRs from his phone" story last week, so why flag the companion piece? Because this one quietly corrects the most seductive misreading of the original. The dream is "the loop runs while I sleep and I step away," but Addy Osmani's line, quoted here, is the sober truth: "YOU are still the ceiling. Your review bandwidth decides how many loops you can run at once." The bottleneck moved; it didn't disappear. If you can't review agent output well, running loops means making mistakes faster, unattended. That's the unglamorous discipline nobody tweets about, and it's precisely why I keep saying the skill that matters now is closer to test engineering than prompt engineering.

---

* [**How we built an internal data analytics agent**][5]. In this post by GitHub's data and analytics team, we get the build story of Qubot. This Copilot-powered agent lets any "Hubber" ask questions of GitHub's data warehouse in plain language and get an answer in seconds. Critically, it's not a dashboard replacement; it's for exploratory questions like "which cohort of users has the highest retention on this feature?", the kind of thing that used to require collaring a data analyst. It's available through Slack, VS Code, and the Copilot CLI, and the Slack path needs zero configuration, which is rather the point.

  The architecture is the interesting bit, and it's made up of three parts: a user interface, a context layer, and a query engine. The context layer is built around the classic medallion model, bronze (raw telemetry), silver (conformed facts and dimensions), and gold (curated business datasets), with each tier owned and annotated by the team closest to it. Product teams contribute the telemetry schema, the data team maintains query examples and mandatory filters, and business teams own the metric definitions. A "context agent" ingests and normalises all of that federated knowledge, every change runs through an offline eval framework that measures accuracy and latency before it ships, and the query engine sits across both Kusto and Trino, defaulting to Kusto for fast exploratory work and switching to Trino automatically when a query needs heavier joins.

  What fascinates me here is the single sentence buried in the "what we learned" section: well-curated context didn't just make Qubot more accurate, it made it *three times faster* at returning the right answer. That has, as the team puts it, profound implications for the analytics-engineering discipline, because it makes curated context a first-class citizen of how you model data rather than an afterthought. This is the same drum I've been banging for years, and it's the same lesson Anthropic's own analytics team taught us last week: the model is only as good as the semantic foundations beneath it. Garbage in, confidently-worded garbage out, just faster.

  And there's a quieter organisational lesson I love. Qubot worked as a "hub-and-spoke" play; it removed strain from the central data team precisely *because* product teams owned their telemetry and business teams owned their definitions, while the agent acted as a gravitational force pulling all that distributed knowledge into one tool. Anyone who's watched a company fragment into forty competing internal dashboards knows how rare that outcome is. The agent didn't replace the data team; it gave everyone a reason to finally contribute to the commons.

---

* [**Hidden Technical Debt of AI Systems: Agent Evaluation Infrastructure**][1]. Han Lee, in this post, looks at the part of agentic AI that data and platform people care about most, and makes an argument they'll nod along to immediately: most eval conversations collapse into which SaaS tool to buy or which headline benchmark to worship, but those scores are just artefacts left behind by a much larger system. Real agent evaluation, he says, needs a *control plane* that decides what to run and whether the result should change what you ship, and a *data plane* that runs the agent and records what actually happened, and the data plane is the hard part.

  The core insight is that chat eval was a spreadsheet, but agent eval is a system. A single-turn assistant fits in a row, prompt, response, label, score, but an agentic episode can run hundreds of steps, calling tools, editing files, spawning sub-agents, and mutating its own memory, and the failure can hide at any of them. A coding agent might end with a patch that passes tests, while the trace reveals it deleted the tests it couldn't pass and leaked a token into a log. So you have to evaluate across five surfaces, output, trace, memory, environment, and (for those with full-stack access) mechanistic interpretability, and capture the *state delta* at each step, not just the final answer. His line, "agents do not only need datasets, but agents also need worlds," is the whole thesis in six words.

  Here's what I keep coming back to: this is dbt-and-CI thinking applied to non-determinism. Lee's call to treat every change as a hypothesis, run perturbation and ablation tests, pair your runs, and report confidence intervals rather than crowing about a 2.4-point bump that's probably noise, is just the scientific method dressed for agents. And his warning about "evaluation debt", the notebook, the CSV of test cases, the judge prompts in a shared Excel file, the green dashboard nobody can trace back to a run, will feel uncomfortably familiar to anyone who's inherited a data pipeline. The reproducibility crisis we spent a decade fixing in analytics is about to replay itself in agent-land, and the teams who internalised the lessons the first time round have a serious head start.

---

* [**The Flat Curve Society**][4]. This post by Steve Yegge picks up exactly where last week's Fable saga left off and runs somewhere genuinely provocative with it. His thesis: now that the US government has (briefly) switched Fable off, we've crossed into the era where model intelligence is "dangerous." He believes we're only two or three generations away from frontier AI being controlled like nuclear weapons, scarce not because the maths is hard but because the compute supply chain is a chokepoint governments can clamp down on. The exponential curve, he argues, isn't actually flattening; it just *looks* flat from where most of us stand, because the smartest models will be locked away from us.

  The two ideas worth stealing are his "horizons." The *demand horizon* is set by the hardest problem you bring: if your work isn't hard enough, a smarter model has no room to pull ahead, and every model feels the same (his React game client was smashed by Fable, but beyond that, every Opus-class model is the example). The darker *discernment horizon* is set by the hardest answer you can *judge*, past that line, you can't tell whether the model is right because checking the work is itself beyond you. "Superhuman means unverifiable," and that, he says, is the real reason the labs are starting to lock things down: you can't hand out an intelligence engine nobody can supervise. He even reframes model routing as "the discernment horizon encoded as infrastructure", and routes every task to the dumbest model that can handle it.

  The most practically useful chunk is his riff on AI literacy, built on a Netflix training study by Ezra Savard. Three beginner cohorts defined by token spend on a heavy-use day, roughly 0M (non-users), 4M (one synchronous agent), and 12–15M (two to four agents running unwatched), and the wonderful finding that people can jump a cohort in *five hours* of the right training: a whole team at once, manager included, on blessed company time, bringing their real work. Cut any corner, and it doesn't stick. Then the meta flips: once everyone's learned to *spend* tokens, the advanced skill becomes learning *not* to, token efficiency, the Genetec CEO's wry "I'm not not using AI, I'm just extremely token-efficient" being the bell-curve Jedi move.

  I keep wrestling with how much of this I actually buy. Yegge's "models are as good as we're going to get for most of us" is a bracing claim, and the SaaS-is-back corollary (companies blew their yearly token budgets in months, so buy-vs-build tilted hard back to buy) is a useful corrective to last year's "we'll just rewrite everything in-house" hubris. But the nuclear-lockdown framing sits uneasily with me, partly because I *want* it to be wrong, and partly because open models have a habit of trailing the frontier by months rather than disappearing entirely. Where I think he's dead right is the human part: the plateau, real or apparent, is good news for craft. A stable platform is exactly what lets us stop rebuilding on shifting sand and start mastering task decomposition, supervision, and the art of great outcomes for the least spend. If we really are all card-carrying members of the Flat Curve Society now, the dues are paid in AI literacy, and that's a bill worth settling early.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[1]: https://leehanchung.github.io/blogs/2026/06/13/hidden-technical-debt-agent-evaluation-infra/
[2]: https://claude.com/blog/steering-claude-code-skills-hooks-rules-subagents-and-more
[3]: https://claude.com/blog/artifacts-in-claude-code
[4]: https://steve-yegge.medium.com/the-flat-curve-society-36c8b01eb33b
[5]: https://github.blog/ai-and-ml/github-copilot/how-we-built-an-internal-data-analytics-agent/
[6]: https://pub.towardsai.net/the-creator-of-claude-code-says-prompt-engineering-is-no-longer-the-main-skill-afe8ed161c56?sk=v2%2F438ce30a-d046-4a3b-ab74-d583111a0480
