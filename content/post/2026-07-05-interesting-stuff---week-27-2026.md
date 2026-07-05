---
type: post
layout: "post"
title: Interesting Stuff - Week 27, 2026
author: nielsb
date: 2026-07-05T06:15:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-27-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-27-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - AI Agents
  - Fable 5
  - LLM Ops
  - aimldatadurban
  - AI Unplugged
  - AIMaskandi
description: "Week 27 roundup: is agent 'self-improvement' just string mutation, SkillOpt trains skills like weights, agentic loops explained, and Fable 5 is back."
---

If there's a single thread running through this week, it's that the interesting action in AI has quietly moved from the model's weights to the text wrapped around them. Skills, prompts, loops, and proxies are where the reliability is won or lost now, and everyone from Nous Research to Microsoft to the Claude Code team seems to have arrived at the same neighbourhood at once.

We've got a spicy takedown of what "self-improving agents" actually do, a Microsoft paper that treats a skill file like a trainable parameter, a field guide to agentic loops, a practical LiteLLM proxy walkthrough, and Anthropic bringing Fable 5 back from export-control exile with a new jailbreak framework in tow. Plenty for the agent-builders and the ops crowd alike, and I've got opinions on most of it.

<!--more-->

---

## Generative AI

* [**Hermes Agent Doesn't Learn. It Mutates Strings. Nous Research Built a Genetic Algorithm and Called It Self-Improvement.**][1]. This post by Dr Swarneendu AI takes a scalpel to one of 2026's biggest open-source darlings. Hermes Agent, from Nous Research, rocketed from roughly 40,000 to 188,000 GitHub stars between April and June, was chewing through 224 billion tokens per day on OpenRouter, and topped the global rankings for coding, productivity, personal, and CLI agents simultaneously. The pitch everyone repeats is that Hermes "lives on your server, remembers what it learns, and gets more capable the longer you use it." The author's uncomfortable point: that's true, but almost every reviewer reads it as something the architecture never claims.

  The dissection is clean. Hermes never updates model weights, by design. Its memory is plain text files (`memory.md`, `user.md`) plus a session database, and its skill library is around 118 conditionally loaded `SKILL.md` files. The famous "learning" layer is a separate, optional companion system that pairs DSPy with GEPA (Genetic-Pareto Prompt Evolution) to evolve skill files, tool descriptions, and system prompts. It runs seed generation, simulation, fitness evaluation, selection, and mutation, the textbook shape of a genetic algorithm, entirely over API calls with no GPU training. The genuinely fair part is that the author calls this a defensible design choice, not a con: GEPA reads execution traces to learn *why* a task failed, can improve a skill from as few as three examples, and stays gated behind test suites, size limits, and pull-request review, so it's self-evolution with a human firmly in the loop.

  What I find bracing here is the question the piece ends with, because it's the one I keep circling back to myself: if "self-improvement" means an evolutionary search over a frozen model's prompt space, what's the ceiling? Can text-level evolution ever exceed the underlying model's capability, or does it just get more reliable at surfacing what the model could already do? My money is on the latter, and I don't think that's a criticism. Most of the value in production agents isn't a smarter brain; it's a system that consistently finds the brain's existing competence, not just occasionally. The marketing of "it learns" oversells the mechanism, but the mechanism itself, disciplined, auditable, human-gated evolution of the text layer, is exactly the direction I'd bet on. It also rhymes uncomfortably well with the next paper in this list.

---

* [**Running LiteLLM as a Proxy in Front of Multiple Model Providers**][2]. In this post, Gary A. Stafford writes the practical guide most of us needed about eighteen months and several provider migrations ago. If you're building LLM apps or just juggling Opus 4.8 on Anthropic, GPT-5.5 on OpenAI, something on Bedrock because your data has to stay on AWS, and Ollama locally for the private workloads, you already feel the pain: N apps times M SDKs times M keys, every team reinventing the same plumbing and nobody sharing a log. LiteLLM's answer is one HTTP surface, one key per caller, and one place to see everything.

  Stafford is careful to untangle the vocabulary that trips everyone up. The LiteLLM *library* is an in-process SDK that gives you a uniform way to call a dozen providers; the LiteLLM *proxy* is the platform, the shared gateway your apps, CI, tooling, and production services all point at. The walkthrough scales the same YAML config from a single developer running Docker locally to an enterprise deployment with governance, security, and cost control. The two patterns worth stealing: `model_name` is an alias your application code references, so repointing `cheap-small-model` at a different upstream provider is a one-line edit with zero caller changes; and secrets stay in environment variables via `os.environ/...`, keeping provider keys out of source control while apps authenticate to the proxy with a separate key. Add Postgres for spend tracking and Redis for prompt caching, and you've got an auditable, cost-tracked front door.

  As someone who spends a lot of time thinking about data plumbing, this is my kind of unglamorous. The proxy is essentially a database-of-record for your model traffic, an aliasing layer, an audit trail, and a spend meter, which is exactly the shape of infrastructure that turns a pile of clever scripts into something an organisation can actually govern.

---

* [**SkillOpt: Agent skills as trainable parameters**][3]. In this post, Microsoft Research looks at the same wound Hermes exposed and reaches for a far more rigorous suture. Their framing is sharp: today's agent skills come from experts writing them by hand, a frontier model one-shotting them, or the agent loosely revising them after a run, and none of those behaves like a real optimiser. There's no step-size control, no held-out validation, no memory of failed revisions. So skills bloat and drift with every rewrite, and a change that looks perfectly sensible can quietly degrade performance. SkillOpt reframes the question from "how do we write a better prompt?" to "how do we *train* the skill?"

  The mechanism is a forward-backwards-update loop that will feel eerily familiar to anyone who's trained a network. A frozen target model executes a batch of tasks with the current skill (the forward pass); a separate optimiser model reads the resulting trajectories in reflection minibatches, distilling what to keep from successes and what to fix from failures (the backward pass). It proposes small add, delete, and replace edits, clipped by a "textual learning rate", a per-step edit budget. Every candidate skill must pass a strict validation gate: it is adopted only if it strictly beats the current skill on a held-out split, and rejected edits don't vanish; they feed into a rejected-edit buffer as negative feedback. A slower epoch-wise meta-update consolidates longer-horizon lessons. Bounded edits plus validation gating mean the skill *converges* instead of drifting.

  The numbers are the headline. Across six benchmarks, seven target models ranging from GPT-5.5 to a 4B Qwen, and three execution modes, SkillOpt was best or tied for best across all 52 evaluation cells, without touching a single weight. With GPT-5.5 in direct chat, it lifted the six-benchmark average from 58.8 to 82.3, a +23.5-point jump, with the biggest gains on procedural work like SpreadsheetBench (41.8 to 80.7). And it carried straight into agentic harnesses, +19.1 points inside Claude Code.

  Here's what strikes me, and it's why I'm pairing this with the Hermes piece deliberately: two independent groups have converged on treating the skill file as the real learnable surface of an agent, and SkillOpt is what happens when you bring an ML engineer's discipline to it, learning rates, validation splits, negative feedback, convergence guarantees. That last stat matters most to me personally. My entire weekly workflow, this very post, runs on a `SKILL.md` and a scheduled job, and I've felt the exact drift they describe: you tweak an instruction, it seems reasonable, and something three tasks downstream gets subtly worse. The idea that skill maintenance could become a measured, gated optimisation loop rather than vibes-based editing is genuinely exciting. If SkillOpt-style tooling lands in the agent frameworks we actually use, "prompt engineering" starts to look less like folklore and more like training, and I am here for it.

---

* [**Getting started with loops**][4]. In this post by the Claude Code team, the fuzzy X-timeline debate about "designing loops instead of prompting" finally gets a straight, useful definition. Their working definition: a loop is an agent repeating cycles of work until a stop condition is met, categorised by how it's triggered, how it's stopped, which Claude Code primitive drives it, and what kind of task it suits. The refreshing framing note is that not everything needs an elaborate loop; start with the simplest thing that works and selectively reach for fancier patterns.

  They lay out four types. Turn-based loops are the everyday agentic loop. You prompt, Claude gathers context, acts, checks its work, and hands back; you improve it by encoding your manual verification as a `SKILL.md` so Claude can self-check end to end (their example verifies a frontend change by actually opening the page, clicking the control, screenshotting, and checking the console). Goal-based loops use `/goal` with an explicit success criterion and a turn cap, so an evaluator model keeps sending Claude back until deterministic conditions like "Lighthouse score 90+, stop after 5 tries" are met. Time-based loops use `/loop` to re-run a prompt on an interval (checking a PR, addressing review comments, fixing CI) and graduate to `/schedule` when you want it running in the cloud instead of on your machine. Proactive loops run on an event or schedule with no human in real time, ideal for recurring streams like issue triage or dependency upgrades, and you manage cost by routing routine work to smaller models and reserving the big model for judgment calls.

  I'll declare my bias immediately: the post you're reading is a proactive loop. A `SKILL.md`, a `/schedule`d headless run, PDFs dropped in a folder, and a draft waiting for me on Sunday morning. So I read this less as news and more as the Claude Code team writing down the mental model I'd been assembling by trial and error. The bit I'd underline for anyone starting out is the progression: don't jump to a scheduled autonomous routine because it sounds cool. Nail the turn-based loop, harden your verification into a skill, add a `/goal` when a single turn stops being enough, and only reach for `/loop` and `/schedule` once the underlying task is genuinely reliable on its own. The loop doesn't create reliability; it multiplies whatever reliability, or unreliability, you already had.

---

* [**Redeploying Fable 5**][5]. This post by Anthropic closes out a genuinely dramatic month for the model. On Friday, June 12, the US government slapped export controls on Fable 5 and Mythos 5, requiring that access be restricted to foreign nationals; with no way to verify nationality in real time and the order effective immediately, Anthropic suspended both models for everyone. As of June 30, those controls were lifted, and Fable 5 came back globally on July 1 across the Platform, Claude.ai, Claude Code, and Claude Cowork, with Mythos 5 access restored to a set of US organisations.

  The timeline is the interesting bit. The directive followed an Amazon report showing a method to bypass Fable 5's safeguards, prompting it to identify software vulnerabilities and, in one case, produce code demonstrating an exploit. Anthropic's testing then found that many less capable models, including Opus 4.8, GPT-5.5, and Kimi K2.7, could identify the same vulnerabilities, and that every model they tested could reproduce the single-exploit demonstration. Their read is that this was a borderline case, routine defensive work that the safeguards block out of an abundance of caution, rather than any unique Mythos-level capability. They trained an improved classifier that now blocks the specific technique in over 99% of cases (routing blocked requests to Opus 4.8), had it validated by the Department of Commerce's CAISI, and acknowledged the honest trade-off: more false positives on benign coding and debugging.

  The broader signal is the push for a shared industry framework, with Amazon, Microsoft, Google, and other Glasswing partners, to consistently assess and communicate the severity of jailbreaks. That's the thread that continues in the next post.

---

* [**More details on Fable 5's cyber safeguards and our jailbreak framework**][6]. In this post, Anthropic goes a layer deeper on two fronts: exactly what Fable 5's cyber classifiers are and aren't built to stop, and an early draft of a proposed jailbreak severity framework developed with their Glasswing partners. The classifier design sorts cybersecurity use into four buckets: prohibited use (block), high-risk dual use (block), low-risk dual use (monitor, sometimes block as a safety margin), and benign use (allow with some monitoring), with detailed examples of what lands in each. The "safety margin" concept is the honest core. Because so much security work is dual-use, Fable 5 deliberately blocks some clearly benign requests out of caution, accepting more false positives in exchange for greater confidence that genuinely harmful outputs are caught. They also launched a HackerOne program, inviting researchers to submit cyber jailbreaks for review.

  The jailbreak severity framework is the part I think matters most beyond Anthropic. Their argument is that there's currently no agreed-upon vocabulary for describing how bad a given jailbreak is; some only unblock minor nuisances, others crack open a wide range of harmful outputs, and without a shared scale, AI developers and governments end up talking past each other. A common framework would let everyone triage new findings and communicate risk in consistent terms.

  What fascinates me is watching the industry try to build the equivalent of a CVSS score for jailbreaks in real time, and how much of this is really governance and communication rather than model capability. The whole Fable 5 saga, an export control triggered by a borderline bypass, walked back once testing showed every comparable model could do the same thing, is a case study in what happens when there's no shared language for severity. Everyone overreacts because nobody can calibrate. I'm sympathetic to the effort and a little wary of who ends up holding the pen. A severity scale co-authored by the largest labs and their government partners is enormously useful, and it also quietly sets the terms on which the next capable open model gets judged. Worth watching not just as a safety story but as a standards-setting one, because whoever defines the ruler tends to like their own measurements best.

---

## WIND (What Is Niels Doing)

Preparation is in full swing for the next [**Data & AI Community Day Durban: AI Unplugged II - The Maskandi Sessions**][daid], happening July 25 at our favourite venue, Richfield College's Umhlanga Campus. The Call for Speakers closed this past Friday, July 3, and we spent yesterday wading through the submissions to decide what's in and what's out, which is a wonderful problem to have and a genuinely hard one, because there were far more excellent talks than we have slots for. The good news: we now have a preliminary line-up of speakers and topics, everyone has been notified, and we're busy shaping the draft agenda.

Registrations should open in a couple of days, so keep an eye on my LinkedIn and the [event website][daid] for the details as they land. If you're anywhere near Durban on the 25th, this one is shaping up to be something special.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to
[sd]: https://streamingdata.io

[daid]: https://aimldatadurban.org/events/2026/maskandi/

[1]: https://pub.towardsai.net/hermes-agent-doesnt-learn-24fb958f18d7?sk=v2%2F497823b0-4825-4218-9e67-159bfe820dc2
[2]: https://garystafford.medium.com/running-litellm-as-a-proxy-in-front-of-multiple-llm-providers-528f74ebb30b
[3]: https://www.microsoft.com/en-us/research/blog/skillopt-agent-skills-as-trainable-parameters/
[4]: https://claude.com/blog/getting-started-with-loops
[5]: https://www.anthropic.com/news/redeploying-fable-5
[6]: https://www.anthropic.com/news/fable-safeguards-jailbreak-framework
