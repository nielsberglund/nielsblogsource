---
type: post
layout: "post"
title: Interesting Stuff - Week 09, 2026
author: nielsb
date: 2026-03-01T07:55:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-09-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-09-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - Agentic Coding
  - Andrej Karpathy
  - Boris Cherny
  - aimldatadurban
  - AI Unplugged
description: "Week 09 tech roundup: Fine-tune LLMs with a single English sentence via Hugging Face Skills, Claude as your personal coding instructor, Block's three-layer Actionable CI pipeline, Karpathy on how programming changed overnight, Boris Cherny's 8 insights from Claude Code, and a coding skeptic's deep-dive into agentic development."
---

This week's roundup spans the full spectrum of how AI is reshaping software development, from fine-tuning open-source models with a single English sentence to using Claude as your personal coding instructor. We've got Block Engineering turning CI failures into actionable fixes with a three-layer intelligence pipeline, Andrej Karpathy declaring that programming fundamentally changed in December, and Boris Cherny sharing eye-popping stats from Claude Code's first year.

But the piece that truly stands out is Max Woolf's brutally honest, data-driven account of going from AI coding sceptic to reluctant convert, complete with Rust benchmarks that beat established libraries by orders of magnitude. Whether you're fine-tuning models, learning new frameworks, or trying to figure out where humans fit in the agentic coding revolution, this week has something for you.

<!--more-->

---

## Generative AI

* [**Fine-Tune an Open Source LLM with Claude Code/Codex**][1]. Kushal Banda, in this post, walks through a workflow that would have sounded like science fiction a year ago: fine-tuning an open-source LLM using nothing but natural language instructions to a coding agent. The secret sauce is Hugging Face Skills, a plugin system that enables agents like Claude Code and OpenAI Codex to handle the entire fine-tuning lifecycle: dataset validation, hardware selection, job submission to cloud GPUs, real-time monitoring, and model deployment, all via English sentences rather than Python scripts. Banda demonstrates the end-to-end process by turning Qwen3-0.6B into a customer support ticket router, from configuring the experiment and building a fixed evaluation set to launching training on an A10G GPU, all orchestrated by the agent.

    The results are compelling: the fine-tuned model leaps from 3.3% accuracy on the base model to 90% on the ticket routing task, all for about $0.30 in compute and 20 minutes of wall-clock time. What makes this tutorial stand out is the emphasis on rigorous evaluation; Banda builds a fixed evaluation slice *before* training (a step most tutorials skip), runs structured JSON extraction to verify outputs, and provides a clear before-and-after comparison. The skill handles everything from choosing LoRA versus full fine-tuning to monitoring training with Trackio.

    What fascinates me here is the democratisation angle. Fine-tuning used to be a dark art requiring intimate knowledge of CUDA drivers, dependency management, and GPU memory hierarchies. Now it's a conversation with your coding agent. The entire skills repository is open-source, so you can extend and customise it, but the out-of-the-box experience already eliminates the most painful barriers. If this trajectory continues, we'll see a world where domain experts who've never written a training loop can produce specialised models tailored to their exact use case, and that's a bigger shift than any single model release.

---

* [**Claude the Instructor**][2]. This post by Robin Moffatt explores a fascinating and often overlooked use case for agentic AI: using Claude not as a code-generating workhorse but as a *personal tutor*. Moffatt had an existing data pipeline he'd written manually in SQL and wanted to migrate it to dbt, but instead of asking Claude to crank out the code, he recruited "Claude the Instructor" to teach him how to do it himself. The approach involved setting up a CLAUDE.md brief that outlined the agent's role as pedagogical: explain concepts, guide through exercises, provide hints rather than answers, and adapt to the learner's pace. The result was something that combines the best of an online tutorial (you can ask, "but why?"), an in-person course (you can go on tangents without the class sighing), and a quickstart guide (it can look at your broken code and tell you what to fix).

  Moffatt identifies something he calls "agentic tutoring", the fact that Claude can not only explain a concept but also interact with your learning environment, spinning up databases, running queries, and validating your work in real time. He contrasts this with traditional learning modes (books, tutorials, YouTube, StackOverflow) and argues that agentic tutoring is fundamentally superior because it adapts to you rather than the other way around. The blog post doesn't shy away from limitations either: context window constraints mean you need to carefully brief the agent upfront, and there's a risk of the agent "doing too much" if you don't explicitly tell it to teach rather than do.

  Here's what strikes me about this piece: we spend so much time discussing AI as a productivity multiplier that we forget its potential as a *learning* multiplier. Moffatt's experience suggests that the biggest long-term value of coding agents might not be writing code faster — it might be upskilling developers faster. Imagine onboarding a junior developer with an AI tutor that knows your entire codebase, your conventions, and your architecture. The implications for tech education are enormous, and I think this use case deserves far more attention than it currently gets.

---

* [**Actionable CI**][3]. In this post, Angie Jones describes how Block's DX team tackled a problem every developer knows too well: CI fails, you click into the results, and you're greeted with a wall of logs that takes longer to decipher than the original bug took to write. Block's solution, Actionable CI, is a three-layer intelligence pipeline that transforms cryptic build failures into clear, grouped explanations with optional automated fixes. Layer 1 is entirely deterministic; static analysis rules match common failure patterns, such as dependency conflicts and import violations, using simple pattern matching. Layer 2 sends the remaining logs to an LLM with instructions to identify distinct issues, explain them in plain language, and critically, group similar failures across jobs so that a single broken import causing 15 test suite failures shows up as one problem rather than fifteen. Layer 3, the agentic autofix, goes beyond explanation: for eligible failure categories (compile errors, dependency violations, lint failures, some test regressions), it invokes a headless instance of Goose to generate a fix, opens a draft PR, validates it through CI, and promotes it to ready-for-review if it passes.

  The developer experience details are where this really shines. The analysis is pre-computed and cached the moment a build fails, so it's already waiting when a developer opens the CI results page. Each issue gets an "Explain" button for deeper context and a "Go to Code" link for navigation. If a developer pushes their own fix before the autofix PR lands, the automated PR is quietly closed — a graceful handoff that respects developer autonomy. Early results show the system fully autonomously fixing 5% of all CI failures, with 70% of engineers regularly using the explanations.

  What I find particularly smart about this architecture is the layered approach. By handling the "known knowns" with cheap, fast static analysis first, they save the expensive LLM calls for genuinely ambiguous failures. And by making autofix opt-in rather than automatic, they've avoided the trust problem that plagues many AI-in-the-loop tools. This is the pragmatic, incremental AI integration that actually ships and helps, no grand vision of autonomous coding, just making the existing workflow less painful. Every engineering org with a CI pipeline should be studying this.

---

* [**Karpathy - Coding Changes**][4]. Andrej Karpathy, in this post on X, makes a bold claim: programming didn't change gradually over time but underwent a fundamental rupture specifically in December 2025. His argument is that coding agents basically didn't work before December, but now models have significantly higher quality, long-term coherence, and tenacity to power through large, long tasks. To illustrate, he describes a weekend project in which he typed a single prompt instructing the agent to log in to his DGX Spark, set up SSH keys, install vLLM, download and benchmark Qwen3-VL, build a web UI dashboard for video analysis, set up systemd services, and write a markdown report. The agent ran for 30 minutes, hit multiple issues, researched solutions, debugged them, and came back with everything working. What would have been an entire weekend project three months ago is now a 30-minute fire-and-forget task.

  Karpathy's framing of the new programming paradigm is characteristically sharp: you're no longer typing code into an editor (that era is over), you're spinning up AI agents, giving them tasks in English, and managing their work in parallel. The biggest prize, he argues, is ascending through layers of abstraction to set up a long-running orchestrator, Claws, with the right tools, memory, and instructions to manage multiple parallel Code instances. He's careful to add caveats: it's not perfect; it needs direction, judgment, taste, and oversight; and it works better for well-specified tasks with verifiable outputs, but he's unequivocal that this is not "business as usual" time in software.

  I keep wrestling with the tension in Karpathy's post. On one hand, his concrete example is genuinely impressive and mirrors what many practitioners are experiencing. On the other hand, the "era is over" framing risks oversimplifying a transition that's still uneven, as one reply astutely points out, production code involving UI, networking, and concurrency doesn't benefit nearly as much. Karpathy's response is telling: he suggests the commenter might be "holding it wrong," which implies the skill gap isn't just in using agents but in knowing *how* to decompose problems for agents. That meta-skill, knowing what to delegate and how to specify it, might be the defining competency of the next generation of software engineers.

---

* [**The AI Revolution in Coding Is Here: 8 Game-Changing Insights from Anthropic's Boris Cherny**][5]. This post distils eight key insights from Boris Cherny, Head of Claude Code at Anthropic, based on a conversation on Lenny's Podcast. The numbers are staggering: 100% of Boris's own code has been written by AI since November 2025, he ships 10–30 pull requests per day, 4% of all public GitHub commits are now authored by Claude Code (predicted to hit 20% by the end of 2026), and engineering productivity at Anthropic has increased 200% per engineer. The insights range from the provocative ("coding is largely solved; the bottleneck is now ideas and prioritisation") to the practical ("underfund projects on purpose and give engineers unlimited tokens: they'll ship faster because they're forced to leverage AI maximally"). Cherny predicts the title "software engineer" will start disappearing in favour of "builder," as everyone on his team, PMs, designers, finance, data scientists, now codes.

  The measurement framework is where it gets especially interesting. Cherny warns against traditional productivity metrics (lines of code, story points) and instead advocates tracking "latent demand": work that would not be done without AI. He estimates that 27% of AI-assisted work consists of tasks that would never have been attempted manually, from polish improvements to small quality-of-life features. On the comparison front, he explicitly notes that Claude Code and Cursor serve different use cases: Claude Code is the power tool for experienced developers who want maximum control and can work in the terminal, while Cursor excels for developers who prefer visual, IDE-integrated workflows.

  What fascinates me about these insights is the cultural shift they imply. If coding is truly "largely solved" and the bottleneck is ideas, then we're looking at a fundamental revaluation of what makes an engineer valuable. The printing press analogy Cherny draws is apt: scribes didn't disappear when Gutenberg showed up, but their role changed dramatically. The engineers who thrive in this new world won't be the ones who can write the cleverest algorithm; they'll be the ones who can identify the right problem to solve and decompose it effectively for their AI collaborators. That's a very different hiring profile than what most companies optimise for today.

---

* [**An AI agent coding skeptic tries AI agent coding, in excessive detail**][6]. Max Woolf, in this post, delivers what might be the most thorough, data-driven account of an AI coding sceptic's journey to reluctant conversion. Woolf, a data scientist who wrote publicly last May about how he didn't find agents particularly useful, chronicles months of increasingly ambitious experiments with Claude Opus 4.5 (and later 4.6) and OpenAI's Codex. The journey starts small, using LLMs to clean up a Python package, and escalates to building a MIDI composer in the terminal, a physics simulator handling 10,000+ balls with Braille Unicode rendering, and ultimately porting machine learning algorithms to Rust with Python bindings that outperform established libraries by staggering margins.

  The benchmarks are where sceptics should pay attention. Woolf's agent-driven Rust implementations of UMAP run 2–10x faster than Rust's fast-umap and 9–30x faster than Python's umap. His HDBSCAN is 23–100x faster than the Rust crate and 3–10x faster than Python's implementation. Even gradient-boosted decision trees see 24–42x faster fitting versus XGBoost. He achieves this through a systematic multi-step pipeline: implement, benchmark, optimise for 60% runtime reduction, then chain Codex and Opus optimisations sequentially (because they apparently find different optimisation opportunities). The whole approach culminates in "rustlearn," an ambitious attempt to reimplement scikit-learn in Rust with these agent-optimised algorithms.

  Here's what strikes me most about Woolf's piece: it's precisely the kind of evidence the AI coding debate needs more of. Not breathless hype, not reflexive dismissal, but someone with domain expertise, healthy scepticism, and rigorous methodology saying "I tested this, and here are the numbers." His observation that agents work best when you have "approximate knowledge of many things with enough domain expertise to know what should and should not work" is perhaps the most important takeaway. The era of agentic coding doesn't make expertise obsolete — it makes it the multiplier. The developers who understand their domain deeply enough to specify the right constraints, validate the outputs, and catch the subtle errors are the ones who'll extract the most extraordinary results from these tools.

---

## WIND (What Is Niels Doing)

**Part 11** of my [**Building an Event Management System with Claude Code**][part11] blog series is now published! This instalment dives into campaign tracking and communication workflows, specifically how to build the infrastructure to send personalised emails and manage marketing campaigns. It was a beast to write, but I'm really happy with how it turned out. I've already started on **Part 12**, so stay tuned for the next instalment, which should land in the coming weeks.

On the [**Data & AI Community Day Durban: AI Unplugged**][daid] front, the Call for Speakers officially closed on Friday night, and the response has been nothing short of amazing. We've received so many incredible submissions covering everything from generative AI and agentic architectures to data engineering and machine learning. The quality has been outstanding, which is wonderful, but it also means we have a genuinely difficult task ahead: choosing which talks make the final cut. If you submitted a talk, know that we're working through them as fast as we can, and the competition is fierce! Watch this space for announcements.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/
[charlblog]: https://charlla.com/

[jovpop]: https://twitter.com/JovanPop_MSFT
[bobw]: https://twitter.com/bobwardms
[revod]: https://twitter.com/revodavid
[lonny]: https://twitter.com/sqL_handLe
[ewtw]: https://twitter.com/sqlOnIce
[buckw]: https://twitter.com/BuckWoodyMSFT
[mattw]: https://twitter.com/matthewwarren
[murba]: https://twitter.com/muratdemirbas
[daveda]: https://twitter.com/davidthecoder
[adcol]: https://twitter.com/adriancolyer
[jesrod]: https://twitter.com/jrdothoughts
[tomaz]: https://twitter.com/tomaz_tsql
[dataart]: https://twitter.com/dataartisans
[luis]: https://twitter.com/luis_de_sousa
[benstop]: https://twitter.com/benstopford
[conflu]: https://twitter.com/confluentinc
[tylert]: https://twitter.com/tyler_treat
[andrewng]: https://twitter.com/AndrewYNg
[lawr]: https://twitter.com/bytezn
[jue]: https://twitter.com/b0rk
[yan]: https://twitter.com/theburningmonk
[danny]: https://twitter.com/g9yuayon
[rmoff]: https://www.linkedin.com/in/robinmoffatt/
[ryansw]: https://twitter.com/ryanswanstrom
[pabloc]: https://twitter.com/pabloc_ds
[mklep]: https://twitter.com/martinkl
[mdavey]: https://twitter.com/matt_davey
[jboner]: https://twitter.com/jboner
[joeduff]: https://twitter.com/funcOfJoe
[charl]: https://twitter.com/charllamprecht
[dbricks]: https://twitter.com/databricks
[adsit]: https://twitter.com/SitnikAdam
[vicky]: https://twitter.com/vickyharp
[dscentral]: https://twitter.com/DataScienceCtrl
[natemc]: https://twitter.com/natemcmaster
[ads]: https://twitter.com/azuredatastudio
[travw]: https://twitter.com/radtravis
[emilk]: https://twitter.com/IsTheArchitect
[netflx]: https://netflixtechblog.com/
[hubert]: https://www.linkedin.com/in/hkdulay/
[jserra]: https://www.linkedin.com/in/jamesserra/
[lemi]: https://www.linkedin.com/in/lemimasalu/
[michael]: https://www.linkedin.com/in/michaeladrianjohnson/

[1]: https://pub.towardsai.net/fine-tune-an-open-source-llm-with-claude-code-codex-cec4650767c8
[2]: https://rmoff.net/2026/02/20/claude-the-instructor/
[3]: https://engineering.block.xyz/blog/actionable-ci
[4]: https://x.com/karpathy/status/2026731645169185220
[5]: https://waydev.co/8-game-changing-insights-from-anthropic-claudecode-boris-cherny/
[6]: https://minimaxir.com/2026/02/ai-agent-coding/

[daid]: https://aimldatadurban.org/events/2026/ai-unplugged/
[part11]: {{< relref "2026-02-22-building-an-event-management-system-with-claude-code-part-11---campaign-tracking--batch-sending.md" >}}


<!-- [postref]: {{< relref "" >}} -->

<!-- [series1]: [SQL Server R Services](/sql_server_2k16_r_services) -->
<!-- [series2]: [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) -->
<!-- [series3]: [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) -->


<!-- [findstr]: findstr /I <word_to_find> * -->
<!-- [findstr]: findstr /I /c:<"phrase to find"> * -->
