---
type: post
layout: "post"
title: Interesting Stuff - Week 44, 2026
author: nielsb
date: 2026-11-01T07:45:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-44-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-44-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - Claude Code
  - Anthropic
  - Skills
  - Steve Yegge
  - Saga Pattern
  - aimldatadurban
  - Encore
  
description: "Week 44 roundup: Claude Code skills nobody writes by hand, Steve Yegge's Counting House for enterprise AI, and why hunger beats tenure for junior engineers."
---

**This week's theme is who does the work now: the designer, the clerk and the newcomer.** Three posts look at how Anthropic's design lead for Claude Code actually works with skills and auto mode, Steve Yegge's blueprint for putting cheap AI models on very short leashes, and an Anthropic engineering manager explaining why he stopped giving coding interviews.

Prompted skills, stateless AI "clerks" and a hiring manager declaring the end of the whiteboard puzzle: quite a menu. Grab a coffee, and let's dive in. There is also a WIND section at the end, because I spent yesterday in Johannesburg.

<!--more-->

---

## Generative AI

* [**Nobody Writes Skills by Hand Anymore: Meaghan Choi, Designer at Anthropic**][1]. In this post, Yelpin Sergey walks through a talk by Meaghan Choi, who leads design for **Claude Code** and **Cowork** at Anthropic, and adds his own "my take" after each of her moves. The headline joke is that nobody writes **Claude Code skills** by hand anymore: you simply prompt Claude for them. Her `/prototype` skill takes a one-line task ("add autocomplete", no specs, no mockup) and produces five versions of the feature in an HTML preview. Her twist is to ask Claude to pick one and explain why, then compare that with her own taste.

  From there, Claude implements the chosen option, tests it, tweaks the styles and opens a pull request with a screenshot or recording. It checks its own work with Claude in Chrome, and Choi runs in **auto mode**, as everyone at Anthropic does. The honest part is the limits. Claude is "not good at design yet", so what ships stays her decision, and a scheduled routine that DM'd engineers about interface changes without a designer had to be switched off for exactly that reason. The post also covers the follow-up podcast (Slack-driven changes through Claude Tag, and a review check built from four questions) and the `INTENT.md` brief from Anthropic's AI-native SDLC playbook for big tasks.

  What I find most useful here is how undramatic it all is. No grand agent architecture: one-line tasks, several options, a browser check, a recording in every PR, and a human making the call on taste. That is more or less how I work with **Claude Code** on my own projects, including the Event Management System series, and I recognise the "Claude will just do what you asked, so checking the task itself is on you" warning all too well. In my experience, Claude's inability to tell you your idea is wrong is its sneakiest limitation.

  I would also steal the "pick one and explain why" trick for non-design work. Ask for three schema designs, let Claude choose, and see whether its reasoning matches yours; the mismatch is where you learn something. And the skills-written-by-Claude habit is worth a thought: if the author of the skill is also its user, who reviews the skill? How do you handle your skills, hand-written or prompted?

---

* [**The Counting House — Steve Yegge**][2]. This post by Steve Yegge introduces the **Counting House**, a pattern for adding AI to systems that handle millions of human work items a year, customer service above all. However, he says it fits claims processing and other casework just as well. It is the polar opposite of his own software factory, the Wheelhouse (2,000 to 4,000 commits a week from always-on, long-lived agents with names, memories and credentials). In a Counting House, models are stateless "clerks". Each invocation handles exactly one work item, never sees a credential, has no memory and can never write to a system of record. A policy table decides which model may handle which customer intent, with which tools and at which autonomy tier: off, shadow, assist, contain or transact.

  Models earn those tiers through classic data science. You build a "gold set" of 200 to 1,000 human-scored cases per intent, with two blind scorers and a third to adjudicate. You then train an LLM judge that never touches live contacts, and compare candidate models against the humans. Yegge's confusion-matrix section (with carnival ducks to explain precision and recall) makes the point that accuracy is a vanity metric, because a misrouted ticket costs a few dollars. In contrast, a child stranded at an airport can cost tens of thousands. The right question is what the mistakes cost, and which model keeps that bill below the human baseline.

  The architecture is where the data engineers will perk up. PII is stripped and tokenised at a gateway, reads go through a read-only MCP gateway, and models never write. Instead, they emit a "write intent" that a purely mechanical **orchestrator** validates against the live system of record, makes idempotent, routes through approvals and executes as a **saga** with compensating actions, ideally on a durable-execution engine such as Temporal. Yegge also argues that this is a multi-team effort (customer service ops, QA, data science, finance, legal and platform), warns about the inevitable internal pushback, and closes with a section on model welfare in a world without persistent seats.

  What fascinates me is the core idea: "don't trust the model, trust the transaction". Idempotency keys, eligibility re-checks, an audit trail and compensating actions are the kind of unglamorous data-engineering plumbing that database people have been building for decades, and the model is just a very chatty client of it. It is a long read (35 minutes, by the author's own count), but it is the clearest picture I have seen of agents in a regulated enterprise that is neither a toy demo nor a YOLO mode factory.

---

* [**Hunger beats tenure: Advice for junior engineers**][3]. Felix Rieseberg looks at what happens to careers when execution stops being expensive. As an engineering manager at Anthropic, he has stopped giving candidates a traditional coding interview, since Claude now beats most humans at the little React challenge, and he is watching comparatively new engineers fly past more experienced colleagues. His thesis: hunger beats tenure. His advice is aimed at anyone without social capital, status or power, and it starts with knowing both your advantage (fresh eyes, and not knowing which things are "impossible") and your handicap (nobody cares what you think yet).

  The practical recipe is five steps: pick business impact over your backlog, pick a radical idea that would help your organisation reach its goals, build it over a weekend as a working prototype, focus on one good idea rather than twenty, and lean into your fresh perspective. The anecdotes are good, from the offline mode at Notion that everyone "knew" was impossible until a newcomer asked, to the dashboard TVs he failed to get and a new hire got the next day. Even the graphical interface for **Claude Code** started as a weekend prototype by two relatively new engineers and shipped about eight days later.

  Here's what strikes me: the advice is great for juniors, but it is just as uncomfortable for seniors. If a weekend prototype now beats a requirements document, then those of us with tenure have to ask what we are bringing besides memory of why things failed in 2014. Rieseberg is honest that he has not yet figured out how to interview for "people who build well with AI", and he is scanning for prototypes that show taste, empathy and principled thinking. I suspect many hiring managers are in the same boat. If you have found a better way, please tell me about it in the comments.

---

## WIND (What Is Niels Doing)

Yesterday I spent the day in Johannesburg, speaking at the **Data & AI Community Day Johannesburg** event. My session was about analysing data with GitHub Copilot CLI, and it went fairly well, with some great questions from the audience. It was a long day: I flew out early and returned late.

The call for speakers for [**Data & AI Community Day Durban: Encore**][encore] and [**.NET Conf 2026 Community Edition South Africa**][encore], on November 21, closed on Friday. I am now looking forward to reviewing the submissions and planning the next steps for this event. It will be exciting to see the range of topics and speakers in these community gatherings.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[ems]: https://nielsberglund.com/contact-event-claude-code/

[encore]: https://aimldatadurban.org/events/2026/encore/

[1]: https://pub.towardsai.net/nobody-writes-skills-by-hand-anymore-meaghan-choi-designer-at-anthropic-cc4c8c2cb26b
[2]: https://steve-yegge.medium.com/the-counting-house-steve-yegge-83f5145cc35b
[3]: https://felixrieseberg.com/hunger-beats-tenure-advice-for-junior-engineers/
