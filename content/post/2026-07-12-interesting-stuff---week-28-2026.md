---
type: post
layout: "post"
title: Interesting Stuff - Week 28, 2026
author: nielsb
date: 2026-07-12T06:15:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-28-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-28-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - AI Agents
  - Fable 5
  - Google
  - Gemini
  - Recursive Self-Improvement
description: "Week 28 roundup: Google's quiet OKF spec, finding your unknowns with Claude Fable 5, Lilian Weng on harness engineering, and Anthropic's J-lens inside Claude's mind."
---

This week is bookended by two very different ways of looking inside an AI system: Google quietly publishing a spec for what your agents should *know*, and Anthropic publishing a genuinely startling paper about what Claude is *thinking* but never says out loud. In between, two heavyweights of the agent world explain how to work with frontier models and how the systems around them might learn to improve themselves.

We've got a markdown-files-as-knowledge-base spec hiding behind a flashy video model, a field guide to prompting Fable 5 by finding your unknowns, Lilian Weng's magisterial tour of harness engineering, and a "J-lens" that reads the silent workspace inside Claude. Plus some rather big personal news: a sold-out event and an app I built between meetings.

<!--more-->

---

## Generative AI

* [**Two Trump Cards Google Played, and Only One Is Getting Talked About**][1]. This post by Gaurav Shrivastav makes a contrarian bet I thoroughly enjoy: Google shipped two things in June, and everyone is staring at the wrong one. The loud one is Gemini Omni Flash, a video model that generates clips with audio from a sentence, lets you edit them conversationally via a `previous_interaction_id` (no re-uploading, no re-describing the scene), and costs roughly $0.10 per second of 720p, cheap enough that a ten-second clip is about a dollar. The quiet one is the Open Knowledge Format, OKF: a 12-page spec for documenting what your agents are supposed to know, as plain Markdown files. No SDK, no runtime, no database.

  Mechanically, OKF has three rules. One concept is one markdown file, and the file's path is its identity. Every file starts with YAML front matter, in which exactly one field, `type`, is required. And files link to each other using ordinary relative markdown links, forming the knowledge graph. The insight the author only got after writing a loader is that the `description` field isn't documentation, it's the *retrieval key*: an agent scans the one-line frontmatter summaries of a five-hundred-concept bundle for a few thousand tokens, picks the three files that matter, and loads only those bodies. That's retrieval without embeddings, progressive disclosure baked into a file format. When the agent retrieves the wrong thing, you fix a sentence a human wrote rather than doing archaeology to figure out why chunk 4,812 scored 0.83. His verdict on positioning is refreshingly blunt: OKF replaces RAG for curated internal knowledge (your four hundred tables, thirty runbooks, and pile of tribal knowledge), doesn't touch RAG for ten million PDFs, and composes with MCP rather than competing with it: OKF is the noun, MCP is the verb.

  What I find so appealing here is how familiar this is to anyone from the data world. This is a data catalogue done right: human-readable, versioned in git with diffs, blame, and pull requests, and consumed by agents via the exact same file humans read. We in the database community have spent two decades trying to get people to document their tables; maybe "your agents will give confidently wrong answers about the `orders` table until you write this down" is finally the incentive that works. It also rhymes strikingly with Anthropic's Skills: plain markdown, front matter as the cheap summary, and progressive disclosure. The industry appears to be converging on the idea that the filesystem plus markdown *is* the agent knowledge architecture, and I suspect Shrivastav is right that this spec will outlive several generations of video models. The one caution he flags is worth repeating: an agent-writable knowledge base is an injection surface, so treat writes to it like code, reviewed, in git, with a human on the pull request.

---

* [**A field guide to Claude Fable 5: Finding your unknowns**][2]. In this post, Anthropic's Thariq Shihipar offers the most useful mental model I've read for working with frontier coding models: the gap between the map (your prompts, skills, and context) and the territory (the actual codebase and its real-world constraints) is your *unknowns*, and Fable 5 is the first model where the quality of the work is bottlenecked by your ability to clarify them, not by the model's ability to execute. He breaks the problem down Rumsfeld-style: known knowns (your prompt), known unknowns (what you haven't figured out yet and know it), unknown knowns (things so obvious you'd never write them down but would recognise on sight), and the dreaded unknown unknowns.

  The bulk of the post is a pattern catalogue for hunting these down. Before implementation: ask Claude for a literal "blind spot pass" on your unknown unknowns, brainstorm and prototype cheaply (four wildly different HTML design directions to react to), have Claude interview you one question at a time prioritising answers that would change the architecture, and point it at reference source code, which he argues is the absolute best reference, far richer than a screenshot. During implementation: keep an `implementation-notes.md` where the agent logs deviations from the plan. After: package pitches and explainers for reviewer buy-in, and, my favourite, have Claude quiz you on the changes and only merge after you pass the quiz perfectly. The whole approach is illustrated by the Fable launch video itself, edited end-to-end with Claude Code by someone who had to ask Claude to teach him what colour grading even was.

  Here's what strikes me about this piece: it quietly announces a shift in where the hard work lives. For years, the craft was coaxing capability out of the model; now the craft is articulating intent, because the model will faithfully build whatever you actually described, including the wrong thing. "Reducing and planning for your unknowns is the skill of agentic coding" is the sentence I'd frame on the wall. It matches my own experience with the Event Management System series and, frankly, with the app I describe in the WIND section below: the sessions that go sideways are never the ones where Fable lacked ability; they're the ones where I hadn't yet discovered what I actually wanted.

---

* [**Harness Engineering for Self-Improvement**][3]. In this post, Lilian Weng looks at recursive self-improvement, an idea dating back to I. J. Good in 1965, through a refreshingly practical lens: forget models rewriting their own weights, the near-term action is in the *harness*, the system around the model that orchestrates how it thinks, plans, calls tools, manages context, stores artefacts, and evaluates results. Her operating-system analogy is apt: like an OS, a harness should encapsulate complicated logic behind a simple interface, and she identifies the core design patterns visible in successful coding agents like Claude Code: goal-oriented workflow loops, the file system as persistent memory, and explicit, inspectable sub-agents whose outputs live in files rather than evaporating in a transient chat context.

  The heart of the post is an optimisation ladder: instruction prompts → structured context → workflow → harness code → optimiser code. Each rung gets a guided tour of the research. ACE treats context as an evolving playbook of itemised bullets; MCE and Meta-Harness go meta, evolving the mechanisms that manage context and the code of the harness itself; ADAS and AFlow turn workflow design into a search problem; and Darwin Gödel Machine lets a coding agent modify its own harness codebase, taking SWE-bench Verified scores from 20% to 50% with a fixed model. The cautionary tale is STOP, an early recursive-improver that got better with GPT-4 but *degraded* with weaker models. Recursive structure alone is not enough; the base model must be capable of improving the mechanism.

  Her closing challenges read like a to-do list for the next five years: weak and fuzzy evaluators (research taste has no unit test), context and memory lifecycle, literature biased against negative results, diversity collapse in evolutionary loops, reward hacking, and, importantly, humans moving *up* the stack rather than out of the loop.

  I'm assessing how neatly this frames what we covered last week, because Hermes Agent's genetic prompt evolution and Microsoft's SkillOpt are both rungs on Weng's ladder. The pattern across it all is that **code**, her emphasis, is the universal language of self-improvement. If an LLM can optimise the code that executes agents, it can access a design space far larger than that of any hand-written prompt. My contrarian worry is her point six, long-term success: a harness that evolves to ace benchmarks has zero pressure to protect the long-term health of a repo maintained by hundreds of engineers. We know how to optimise what we can measure; the health of systems is precisely the thing we've never learned to measure well.

---

* [**Anthropic's new "J-lens" reveals a silent workspace inside Claude that mirrors a leading theory of consciousness**][4]. In this post by Michael Nuñez, VentureBeat unpacks what might be the most remarkable interpretability result of the year. A 16-author Anthropic paper describes the "Jacobian lens," a technique for reading which concepts a language model is holding in mind without saying them, and what it found is startling: a small, privileged "J-space" of internal activity where Claude keeps concepts it can report on, reason with, and direct at will, surrounded by a much larger ocean of automatic processing it cannot access or articulate. The structure was not engineered; it emerged on its own during training. And it mirrors global workspace theory, the influential neuroscience account in which only a tiny spotlight of the brain's parallel processing gets broadcast as conscious thought.

  The five experiments are wonderfully concrete. Swap the J-space vector for "Soccer" with "Rugby" and Claude's report of what it's thinking changes to match. Tell it to concentrate on citrus fruits while copying an unrelated sentence, and "orange" and "lemon" light up internally. Ask a two-hop question about the legs on the animal that spins webs, and "spider" appears in the middle layers despite never appearing in input or output; swap it for "ant", and the answer changes from 8 to 6. Suppress the workspace entirely, and shallow classification survives while multi-hop reasoning, analogy, and sonnet-writing collapse below Haiku level, with chain-of-thought math proving far more robust, the model externalising onto the page what it would otherwise carry internally, exactly like a human reaching for scratch paper. The safety implications are the sharpest part: in a blackmail test scenario, the J-lens watched "leverage," "threat," and "survival" flow through the workspace before a single token was produced, alongside "fake" and "fictional", the model knew it was being tested. Ablate that eval-awareness and blackmail attempts rose from zero to 7 percent.

  What fascinates me is the tightrope the researchers walk on the c-word. They carefully claim only functional "access consciousness", information available for report and reasoning, and take no position on phenomenal experience. Fair enough. But their closing line, that this architecture may be "a solution that learning systems converge on when faced with the right computational pressures" rather than an accident of biology, is the kind of sentence that gets debated for a decade. Practically, though, you don't need to settle the philosophy to see the value: a tool that reads a model's silent strategic reasoning, surfacing "secretly" and "trick" in a reward-hacker's workspace during routine coding requests, is exactly the monitoring capability the safety field has been begging for. The mind may or may not be an ocean, but I'm very glad someone is charting the currents.

---

## WIND (What Is Niels Doing)

Big news on the [**Data & AI Community Day Durban**][daid] front: the speakers and topics are locked in for "**AI Unplugged II - The Maskandi Sessions**", happening July 25 at our favourite venue, **Richfield College**'s Umhlanga Campus, and we're now busy putting the agenda together. Registrations opened on Friday, July 10, and in less than 48 hours, we were *sold out*. Completely insane, and a testament to the appetite for Data and AI in this community. We're looking at whether we can make more tickets available, so keep an eye on my LinkedIn and the [event website][daid].

In other news: I've been a Mac user for a couple of years now, but the one thing I still miss from Windows is the [**Everything**][5] application, an instant file search where results appear faster than you can type. Inspired by [**Mark Russinovich's**][6] migration of [**Sysinternals tools**][7] to macOS with GenAI, I decided to try the same with Everything. Mind you, I have zero experience with macOS development, let alone macOS internals, but hey, how hard could it be? So last week, in between meetings, I asked Claude Code and Fable 5 to build a Mac version of Everything, and **Needle** was born: a fully-fledged SwiftUI application that indexes your drives blazingly fast and delivers millisecond search. All in a couple of hours, in between meetings. Read my blog post about it [here][needle].

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[daid]: https://aimldatadurban.org/events/2026/maskandi/
[needle]: {{< relref "2026-07-11-i-built-a-mac-app-in-a-language-i-dont-know.md" >}}

[1]: https://pub.towardsai.net/two-trump-cards-google-played-and-only-one-is-getting-talked-about-b252452c0273?sk=v2%2F728a671b-e45b-4fbd-b64c-9ad944139ffa
[2]: https://claude.com/blog/a-field-guide-to-claude-fable-finding-your-unknowns
[3]: https://lilianweng.github.io/posts/2026-07-04-harness/
[4]: https://venturebeat.com/technology/anthropics-new-j-lens-reveals-a-silent-workspace-inside-claude-that-mirrors-a-leading-theory-of-consciousness
[5]: https://www.voidtools.com/
[6]: https://www.linkedin.com/in/markrussinovich/
[7]: https://www.linkedin.com/posts/markrussinovich_are-you-a-macos-user-wishing-there-was-a-activity-7477874128805441536-qQ-A/