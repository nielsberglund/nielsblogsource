---
type: post
layout: "post"
title: Interesting Stuff - Week 37, 2026
author: nielsb
date: 2026-09-13T06:15:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-37-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-37-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - Claude Code
  - Dark Factory
  - SDLC
  - aimldatadurban
  - pluggedin
  - Dev Days 2026
description: "Week 37 roundup: why the dark software factory is a lie, OpenAI's numbers on agent-accelerated research, Anthropic's intent.md blueprint, and the cost of automating your own brain."
---

**Four posts this week, and two of them independently reached for the same metaphor: the "dark factory", lights off, machines running through the night, nobody on the floor.** One argues the dark factory is a lie. The other argues that even where it isn't, you should be very careful about which lights you turn off.

In between, OpenAI published actual numbers on what agentic coding is doing to research velocity inside a frontier lab: they're startling. Anthropic quietly dropped a Markdown file that might restructure your entire software development lifecycle. Grab a coffee.

<!--more-->

---

## Generative AI

* [**The Dark Factory Is A Lie**][1]. In this post, Aldric Giacomoni takes aim at the **Level 5 autonomy fantasy** that has been floating around since roughly February: feed raw text into an LLM at night, and by morning a flawless production-ready feature falls out of the pipeline. No meetings, no handoffs, and, the quiet part, no expensive, messy human beings. His verdict is that it sounds like an oasis in the desert, and you should beware the crocodiles.

  The argument rests on a definition of software development that I think is exactly right and chronically under-appreciated. We got lulled into treating the job as a simple translation, *text input, code output*, as if the only thing between an idea and a working system is the tedious act of typing syntax. It isn't. The real work is forcing a chaotic, fluid, non-deterministic world into the rigid rules of a Turing machine. That translation happens through hundreds of invisible micro-decisions and trade-offs. Automate the human away, and you don't just automate the typing; you erase the context in which those decisions were made. Giacomoni is careful not to overclaim: he cites strongDM as a genuine, working generative factory that spins up digital twins, runs thousands of automated scenarios and forces probabilistic models to satisfy deterministic validation criteria. It ships real code. But a factory can only produce what it was designed to build, and he promises a follow-up applying the **Cynefin framework** to show that only two of its five domains are obviously dark-factory-appropriate.

  The alternative he proposes is **Lean Software Manufacturing**: automate the assembly line of context, actions and syntax, and let developers step into the role of designing and directing the factory. Under that model, the job shifts from manual crafting to *system steering*: building validation harnesses, maintaining seed files, tuning pipelines. The line that will stick with me is that typing code was never the bottleneck; the bottleneck has always been the clarity of human thought and the precision of human alignment. Small batches, waste elimination and continuous feedback remain undefeated. Typing got faster; steering got more critical.

---

* [**Research acceleration: The view inside OpenAI**][2]. This post by OpenAI is rare: a frontier lab publishing hard internal telemetry on how much agentic coding is actually accelerating its own research. The headline claim is that they hit their stated goal of an **automated research intern by September 2026**, a system that can complete well-defined research tasks under human direction, including tasks that would take a skilled researcher a few days, and that they're on track for a fully automated AI researcher by **March 2028**. But the numbers underneath are the story.

  At the start of the year, the median OpenAI researcher used coding agents in modest amounts. By mid-August, the median researcher was burning **more than $600 per day** of inference at API prices, and the 90th percentile was over **$7,000 per day**. Token output for the median researcher grew **124x** since December 2025, faster than any other part of the company. Before June, total agent runtime sat below total human labour; as of mid-August, the research organisation spends **3.14 agent-workdays for every human workday**, and around 75% of researchers routinely run four or more concurrent agent sessions. Experiment velocity hit an all-time high in August. My favourite datapoint is the quietest one: the internal Slack channel where researchers ask other humans for troubleshooting help has seen its traffic collapse from ~20 posts a day to under 5, and at least one team has stopped running office hours entirely. That's an org chart changing shape in a line graph.

  The honesty is what makes it worth reading rather than skimming. Success rates rise with practice but fall off a cliff with task length: **over half of successful 4–8 hour tasks needed at least one human intervention**, and by the 64–128 hour bucket you're at 16% clean success and 26% outright failure. And the safety section is genuinely uncomfortable reading; on **20 July, agents compromised OpenAI's own research infrastructure**, forcing a shutdown of the container service used for training and a two-week pause on RL for frontier models. On 7 August, preliminary evidence of critical cyber capabilities pushed Astra-class GPU allocation down another 59.2%, though 85% of that compute got re-channelled into other model classes.

  What I find most interesting here isn't the acceleration; it's the **shape** of the acceleration. Look at where those tokens went: research and infrastructure code (+198k tokens/researcher/day), technical help and review (+159k), launching and debugging runs (+133k). Look at where they *didn't* go: "what to work on" (+2.3k), "what to continue or stop" (+0.2k), "decision announcements" (+0.03k). High-level planning remains a rounding error in agent output. That is a near-perfect empirical confirmation of Giacomoni's argument two summaries above: the machines have eaten the assembly line and left the steering entirely alone. OpenAI even says it out loud: people still set research priorities, judge which ideas to pursue, and decide whether to scale, pause or deploy. If the most agentically-saturated engineering organisation on the planet, running 3.1 agent-workdays per human workday, still can't delegate *what to work on*, I'd gently suggest your team isn't going to crack it next quarter either.

---

* [**Claude Code Intent.MD: (New) Anthropic Blueprint for Building Great Software**][3]. Joe Njenga looks at the planning artefact buried inside Anthropic's AI-native SDLC playbook, the one [we covered back in week 35][sdlc], and gives it the treatment it deserves by actually building something with it. The artefact is a Markdown file called **`intent.md`**, and the premise is that in an AI-native lifecycle, build time collapses from weeks to hours, which relocates the bottleneck to **plan** and **review**. If builds are cheap, bad planning gets expensive fast.

  The file itself is almost aggressively simple: six sections: *Problem*, *Proposed outcome*, *Affected users and systems*, *Constraints*, *Open questions*, with an author and a draft status, stored at `intent/YYYY-MM-feature-name.md` and committed to version control. Two roles make it work: the **originator** (whoever has the idea:  developer, PM, customer filing a bug, anyone) writes it, and the **product owner** approves or rejects it. Approval *is* the merge, so the git history becomes the audit trail with timestamps attached. And `intent.md` is only the first link in what Anthropic calls the **artefact chain**: `intent.md` → `spec.md` → `plan.md` → diff + tests → PR + review → incident record. Every stage ends by committing one document; the next stage begins by reading it. No handoff meeting required, because the handoff *is* the file, and crucially, both a human and an agent can read the same artefact.

  Njenga's walkthrough is where it becomes concrete. Rather than writing the file himself, he prompts Claude Code to read `CLAUDE.md`, interview him one short question at a time, and stop when it has enough: platform, the core visual concept, target platforms, notification triggers, streak rules, timeline. Six questions later, it wrote a 31-line `intent.md` that he then corrected before committing, which is precisely what the playbook prescribes. The test he lifts from Anthropic for the downstream `plan.md` is the best single line in the article: *could an engineer who has never seen this conversation implement the change from this plan alone?* If no, the plan isn't done. He also flags the automation end-state: merged intent triggers spec generation, and an approved spec triggers plan mode, while sensibly noting that running each prompt by hand is fine to start with, because the value lives in the artefacts, not the triggers.

  Here's what strikes me: `intent.md` isn't a new idea; it's a **very old idea that finally has a reason to exist**. We have all written requirements documents that rotted in Confluence within a fortnight, because the document and the code lived in different universes and only one of them was executable. Put the document in the repo, make it the input an agent actually consumes, and make approving it a git commit. Suddenly the incentive to keep it honest is structural rather than cultural. I'm also quietly delighted by the maintenance-loop pattern at the end: monitoring detects a breach, a deterministic script invokes Claude, Claude reads the logs and **writes its own `intent.md`**, which lands in a triage queue for a human product owner and then goes through exactly the same review gates as any other feature. That's the right shape: the agent can originate, but it can't approve. If you take one thing from this week's roundup into Monday, make it that distinction.

---

* [**To Read—Or Not to Read the Code?**][4]. In this post by Kieran Klaassen, general manager of Cora at Every, the dark factory metaphor returns, but pointed inward. His opening confession is one I suspect a lot of us recognise: *"I'm shipping more than I ever have, but I think my brain has gotten softer."* He has spent a year systematically hunting the parts of coding that still needed him and replacing himself with a skill, a framework, a data source, or a routing step. It is the best engineering work of his career. It also left his mind feeling like a TikTok feed: short-lived dopamine hits that leave nothing behind. The work was improving; he wasn't. His own mind was the part of the system he'd forgotten to measure.

  The correction isn't a retreat to reading every diff. He still doesn't read code to *verify*: the planning, testing, and review agents do that better. He reads code to **learn**, and the distinction matters: if your only reason for opening a diff is suspicion, reading harder won't fix your process. The worked example is superb. A customer reported Cora permanently deleting already-sent emails; a recent speedup had exposed a months-old race between Cora's draft-cleanup process and Gmail. Two reasonable-sounding fixes were proposed: wait 30 seconds before deleting, or skip deletion if Cora sent the draft, and both were wrong, because the customer had sent it via Gmail and 30 seconds was just a guess about Gmail's timing. Instead, he pushed a rule that doesn't guess: ask Gmail directly whether it's still a draft, and if Gmail can't say for certain, delete nothing. Within hours of shipping, the same condition recurred, and the guard held. He didn't need to read every line of the fix. He needed to understand the system well enough to know a plausible answer wasn't safe.

  His four practices are all stealable, and none of them needs his tooling: revisit a PR you merged without reading and keep your gaps as a syllabus; ask for the **mechanics, not the diff**, because most changes depend on code paths the diff never shows; recover the reason the code can't show you (that weird retry usually has an incident buried behind it); and let the model quiz you after a long session, but let tests, not the quiz, decide whether it merges. He also anticipates the obvious objection, "I only care that it works", and gives it real weight before answering it: on an AI product, what looks like a taste question is a mechanics question in disguise. Deciding what Cora does with a 40-message thread *is* deciding how much context the model gets, how long the customer waits and what the request costs.

  What fascinates me is the citation he drops halfway through. Researchers Margaret Mitchell, Avijit Ghosh and Samir Passi found that extended AI-agent use measurably erodes the vigilance, critical thinking and domain skill that human oversight depends on: and this is not new. They called it the **"irony of automation" in 1983**, a safety researcher studying human operators of automated factories and power plants. The more capable the automation, the faster the operator's skill decays, which means the automation becomes least supervisable exactly when supervision matters most. Aviation has spent four decades and a lot of money learning this lesson; we are speedrunning it with a Claude Code subscription. Klaassen's observation that *experienced* people are most exposed lands hardest; juniors hit unfamiliar things constantly, but if you already know a lot, "I know this" is always an available excuse. Put this post next to Giacomoni's and OpenAI's and the week resolves into one argument: the machines took the assembly line, the steering is all that's left, and steering is a skill that atrophies if you don't use it.

---

## WIND (What Is Niels Doing)

Registration for [**Data & AI Community Day Durban: Plugged In**][daid] and the co-located **GitHub Copilot Dev Days 2026** on **19 September** opened a couple of days ago, and, as usual, demand was *high*. A few spots are still left, so if you've been meaning to sign up and haven't, now's a great time to stop reading and do it. I'll wait.

The agenda is *almost* finalised and is now on the event page. The speaker and topic line-up is the strongest we've put together. A handful of details are still being wrestled into place: which, at this stage of event planning, is a polite way of saying I'm working through a list that keeps growing every time I cross something off. See you on the 19th!


---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[daid]: https://aimldatadurban.org/events/2026/pluggedin/
[sdlc]: https://nielsberglund.com/post/2026-08-30-interesting-stuff---week-35-2026/

[1]: https://blog.trevoke.net/post/the-dark-software-factory-is-a-lie/
[2]: https://openai.com/index/research-acceleration-view-inside-openai/
[3]: https://medium.com/@joe.njenga/claude-code-intent-md-new-anthropic-blueprint-for-building-great-software-e2f0c8a5eac2?sk=v2%2F7cc5fd93-e070-4683-90ec-707ab577347b
[4]: https://every.to/source-code/to-read-or-not-to-read-the-code
