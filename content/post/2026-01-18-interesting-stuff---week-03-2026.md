---
type: post
layout: "post"
title: Interesting Stuff - Week 03, 2026
author: nielsb
date: 2026-01-18T14:53:06+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-03-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-03-26.jpg"
categories:
  - roundup
tags:
  - Claude Code
  - ai agents
description: "Week 03, 2026 explores Claude Code team workflows, Anthropic's Cowork for non-developers, AI agent evaluation frameworks, GitHub Copilot's memory system, and running multiple coding agents in parallel to maximize productivity."
---

Week 03 kicks off 2026 with laser focus on making AI agents production-ready for team environments, from Joe Njenga's battle-tested playbook for transforming Claude Code into a full-team productivity system to Anthropic's strategic expansion of Claude Code's agentic capabilities into everyday work tasks with Cowork. The quality assurance challenge takes centre stage as Njenga breaks down Anthropic's evaluation framework that separates agents that ship from those that fail in production. 

At the same time, GitHub unveils its elegant "just-in-time verification" solution for cross-agent memory that sidesteps the staleness problem plaguing persistent knowledge systems. Rounding out the week, Eivind Kjosbakken makes the provocative case that running multiple coding agents in parallel isn't just a productivity boost, it's the new baseline for developers who don't want to fall behind, though the workflow's cognitive demands raise questions about whether this represents the future of programming or just the early adopter frontier.

<!--more-->

---

## Generative AI

* [**18 Proven Claude Code Onboarding Tips for Teams that Ship Faster (Copy Them Now)**][1]. In this post by AI automation engineer Joe Njenga, developers get a comprehensive playbook for transforming Claude Code from a personal coding assistant into a full team productivity system that slashes onboarding time from weeks to just 1-2 days. Drawing from his experience managing a 4-developer team, Njenga reveals that most teams are using Claude Code wrong by treating it as an individualised tool where everyone figures out their own approach, resulting in inconsistent code quality, wasted tokens on repeated explanations, and confused new team members. The solution? Implementing 18 battle-tested strategies that establish team-wide standards, from creating a `CLAUDE.md` file as a single source of truth to leveraging specialised subagents that act like dedicated team specialists for code review, testing, documentation, and security auditing.

  The article walks through practical implementation details that make Claude Code team-friendly, including the critical "memory hierarchy" that separates team standards from personal preferences, custom slash commands that standardise workflows (like `/project:onboard` for new developer orientation), and the powerful Research-Plan-Code-Verify workflow that reduces complex feature development time by forcing thoughtful planning before implementation. Njenga emphasises cost-saving measures like keeping `CLAUDE.md` under 150 instructions (since LLMs can effectively follow about 150-200 instructions total), using hooks for automated verification that catch bugs before commits, and aggressive context management to prevent token waste. He shares real examples, like reducing an OAuth implementation from several hours with 3 bugs to 1-2 hours with zero bugs, simply by following structured workflows.

  What makes this guide particularly valuable is the emphasis on team collaboration patterns rather than individual productivity hacks, from git integration strategies that let Claude handle 90% of version control operations to permission modes that balance safety with speed across different workflows. For teams serious about AI-assisted development at scale, Njenga provides the actual commands, file structures, and configurations his team uses daily, complete with a foundation checklist to verify proper setup and advanced features like MCP server integrations that connect Claude to PostgreSQL, Slack, and Google Drive for true workflow automation.

---

* [**Cowork: Claude Code for the rest of your work**][2]. This post from Anthropic announces Cowork, a research preview feature that extends Claude Code's agentic capabilities beyond programming to handle everyday work tasks for anyone, not just developers. Available now for Claude Max subscribers on the macOS app, Cowork gives Claude direct access to a folder on your computer where it can read, edit, and create files with remarkable autonomy. Instead of the typical back-and-forth chat experience, Cowork operates more like delegating to a coworker: you can queue multiple tasks, Claude makes a plan and steadily executes it while keeping you informed, and you maintain control by choosing which folders and connectors Claude can access. The platform can reorganise messy downloads by sorting and renaming files, generate spreadsheets from expense screenshots, or draft reports from scattered notes, all while you continue working on other things.

  Built on the same technical foundations as Claude Code, Cowork supports existing connectors that link Claude to external information sources, as well as a new set of skills specifically designed for creating documents, presentations, and other non-code files. When paired with the Claude Chrome extension, it can also complete tasks that require browser access. However, Anthropic emphasises important safety considerations: Claude will ask for confirmation before significant actions, but it can take potentially destructive steps, such as deleting local files, if instructed, and there's always the industry-wide risk of "prompt injection" attacks, where malicious content encountered online could alter Claude's behaviour. The company recommends taking precautions while learning the tool, particularly during this early research preview phase, where they're gathering user feedback to shape improvements, including planned cross-device sync and Windows support.

  **My take?** The democratisation of Claude Code's agentic workflow to non-developers feels like a significant strategic move. Still, I'm curious whether mainstream users will embrace the shift in mental model from "chat assistant" to "autonomous coworker with file system access." The safety warnings around file deletion and prompt injection are prudent, yet they might create friction for less technical users who aren't accustomed to thinking about these risks. Will average professionals trust an AI enough to let it reorganise their files unsupervised, or will the fear of accidental deletion limit adoption to power users who already understand the underlying architecture from Claude Code? The real test will be whether Anthropic can maintain the delicate balance between agency and safety as they scale this beyond the research preview.

---

* [**Anthropic New Guide Shows How to Build Quality AI Agents (Without Getting Fooled)**][3]. Joe Njenga, in this post, tackles the elephant in the room that most AI agent developers conveniently ignore: proper evaluation and testing before shipping to production. Breaking down Anthropic's recently released guide on demystifying evals for AI agents, Njenga challenges the typical "pick a model, connect tools, write a prompt, test a few times, ship it" workflow that leaves developers drowning in guesswork when users inevitably report unanticipated bugs. The core problem? Testing AI agents fundamentally differs from testing traditional code because agents exhibit non-deterministic behaviour, ask the same agent to create a GET endpoint three different times, and you might get three valid but entirely different approaches, yet rigid test expectations will fail two of them. This creates what Njenga calls the "compounding problem", where early mistakes cascade through every subsequent decision, turning single errors into architectural disasters.

  The article methodically walks through Anthropic's three-grader framework for agent evaluation: code-based graders for objective verifiable outcomes like "does the code run?", model-based graders using LLMs to judge subjective quality against defined rubrics (which require calibration against human judgment to avoid unreliability), and human graders serving as the gold standard for periodic verification despite their speed and cost limitations. Njenga introduces critical distinctions between capability evals (testing what agents struggle with, where 90% pass rates indicate tests are too easy) and regression evals (ensuring agents maintain existing functionality at near 100%), plus the deceptive metrics of pass@k versus pass^k, the former measuring "at least one success in k attempts" while the latter demands all k attempts succeed, revealing that an agent with 73% success looks fantastic at 10 attempts for pass@k but exposes painful inconsistency through pass^k for production scenarios. The practical 8-step roadmap spans everything from starting with just 20-30 real failure scenarios to implementing the "Swiss cheese model" of layered defences combining automated evals, manual review, production monitoring, and user feedback.

  **Here's my perspective:** The timing of this guide feels strategic. As agentic AI moves from demos to production deployments, the industry desperately needs systematic quality frameworks to prevent the "ship it and pray" mentality from creating a backlash against AI tooling. But Njenga's breakdown, while thorough, inadvertently reveals a deeper problem: we're essentially reinventing software QA practices from scratch for AI agents because the underlying non-determinism breaks every assumption of traditional testing. The real question isn't whether teams will adopt these evaluation practices, but whether the cognitive overhead of maintaining three grader types, calibrating model-based judges against human evaluators, and tracking dual metrics like pass@k versus pass^k becomes so burdensome that only well-resourced teams can afford proper quality assurance. Will this create a two-tier ecosystem in which enterprises ship reliable agents? At the same time, indie developers remain stuck in reactive bug-fixing loops, or will tooling emerge to democratise these evaluation practices?

---

* [**Building an agentic memory system for GitHub Copilot**][4]. Tiferet Gazit, in this post, reveals GitHub's ambitious architectural solution to one of agentic AI's most persistent problems: how do you make agents remember useful context across sessions without drowning in stale, contradictory, or outright wrong information? Now available in public preview for all paid Copilot plans, GitHub's cross-agent memory system enables the Copilot coding agent, CLI, and code review to build a cumulative knowledge base that grows with every use, allowing, for example, the code review agent to notice that API version numbers must stay synchronised across client SDK, server routes, and documentation files, then having the coding agent automatically update all three locations in future tasks without explicit instructions. The core engineering challenge wasn't information retrieval but validation: ensuring stored knowledge remains accurate as code evolves across branches, with conventions potentially modified, superseded, or abandoned in unmerged branches.

  GitHub's solution elegantly sidesteps the complexity of offline curation services (which would introduce massive engineering overhead and LLM costs at their scale) by using "just-in-time verification", storing memories with citations that reference specific code locations, then verifying those citations in real time before applying the memory. When an agent encounters a stored memory, it checks whether the cited code still supports the fact on the current branch, adding negligible latency through simple read operations while eliminating the risk of acting on outdated information. Memory creation itself is implemented as a tool call that agents invoke when discovering actionable patterns, with strict privacy scoping ensuring memories for a repository can only be created by contributors with write permissions and used by users with read permissions on that same repository. The results speak volumes: A/B testing showed a 7% increase in pull request merge rates for coding agent tasks (90% vs 83% without memory) and a 2% increase in positive feedback for code review comments (77% vs 75%), both highly statistically significant (p-values < 0.00001).

  **Here's what strikes me as brilliant, and risky:** GitHub essentially transformed the memory staleness problem from "how do we curate a perfect knowledge base?" into "how do we verify citations fast enough that users don't notice?" It's the same philosophical shift that made Wikipedia work: don't try to prevent bad information from being added, make it trivially easy to verify and correct. But I'm sceptical about one critical detail they glossed over: what happens when agents create thousands of memories for a large repository with years of history? Even with real-time verification, there's a combinatorial explosion risk where each new task must verify dozens or hundreds of potentially relevant memories, and the "negligible latency" claim might not scale. The 3-4% precision/recall improvements in their evaluation are promising but modest, which makes me wonder whether we're seeing early-stage benefits before memory pollution becomes a problem, or whether this represents the realistic ceiling for what cross-agent memory can achieve without more sophisticated curation mechanisms that they're explicitly avoiding.


---

* [**How to Run Coding Agents in Parallel**][5]. Eivind Kjosbakken, in this post, argues that if you're not running multiple coding agents in parallel, you're already falling behind as a software engineer, a bold claim backed by the reality that modern agents like Claude Code can autonomously implement entire features across multiple repositories while you work on other tasks. The evolution has been dramatic: coding agents progressed from simple line auto-completion to single-file edits, then multi-file awareness, and now full-stack implementations requiring zero human intervention. Kjosbakken's core insight challenges traditional programming wisdom about minimising context switching. At the same time, that advice still applies to human cognition; agents fundamentally change the equation by working autonomously for 5-20 minutes at a stretch, creating natural windows to spin up additional agents on different tasks. His four-step framework revolves around maintaining a strict prioritised task list based on value-effort graphs, using plan mode liberally (spending 15-20 minutes upfront discussing implementation details with the agent), spinning up agents via CLI tools like Claude Code or Gemini CLI, and cycling through high-impact tasks until the first agent needs feedback.

  The article emphasises three critical requirements that separate effective parallel agent usage from chaotic multitasking: maintaining an actively curated priority list in project management tools like Todoist or Notion that ranks tasks by impact versus effort; refusing to skimp on plan mode preparation time because the 20 minutes invested upfront pays dividends through fewer mistakes and less post-implementation iteration; and using CLI-based tools paired with terminal multiplexers like Warp that provide easy visual oversight of all running agents. Kjosbakken counters explicitly the temptation to use cheaper, faster models for routine tasks, arguing that a penny-wise-pound-foolish approach ultimately costs more through higher error rates and longer iteration cycles. Larger, more expensive models make fewer mistakes and reach correct solutions faster despite higher upfront latency. He references Boris Cherny, the creator of Claude Code, who casually mentioned running 10-20 agents in parallel at any given time, suggesting this isn't an aspirational workflow but rather the current state of the art for developers maximising AI-assisted productivity.

  **My perspective?** This represents a fundamental rethinking of software development from sequential problem-solving to parallel task orchestration. Developers become project managers, delegating to a team of AI specialists rather than individual contributors writing code. But I'm sceptical about whether this workflow scales beyond a narrow band of senior engineers with exceptional task prioritisation skills and deep domain knowledge. The framework assumes you can instantly identify "high-impact tasks," spend 15 minutes efficiently scoping work in plan mode without scope creep, and context-switch between 10-20 concurrent implementations without cognitive overload when agents inevitably hit blockers requiring human judgment. For most developers, especially those still building intuition about architecture trade-offs, maintaining that prioritised task list while mentally tracking the state of a dozen parallel agents sounds less like productivity nirvana and more like a recipe for burnout and shallow work. The "if you're not doing this, you're falling behind" framing also feels premature; we're extrapolating from early adopters like Cherny, who literally built these tools, to suggest this should be "default behaviour for a lot of programmers." Still, we have no longitudinal data on whether running agents at this scale actually produces better software or just more code faster. What if the real competitive advantage isn't maximising parallel agents but developing the judgment to know which problems require deep human thought versus delegation?

---

## WIND (What Is Niels Doing)

Since last week's roundup, I've maintained surprising momentum on my [**Building an Event Management System with Claude Code**](/contact-event-claude-code) tutorial series, publishing three new posts that dive deep into MCP server design, architecture, and implementation. The journey has been educational in ways I didn't anticipate. I've learned enough hard lessons about MCP server patterns and Claude Code workflows that I've had to pivot my implementation strategy a couple of times mid-flight. Turns out building a real-world system while documenting every decision, dead-end, and breakthrough creates a wonderful feedback loop of learning, but also exposes just how optimistic my initial planning was. I'm now gearing up to write part 8, which continues implementing the Import MCP server's functionality, and I'm finding there's more depth here than I initially estimated.

Speaking of estimates: if you're looking at an older table of contents for the series, well, you can safely discard it. My initial confidence that I could wrap everything up in 9-10 instalments has been thoroughly humbled by reality. At this point, I'll be genuinely pleased if I can bring the series home in 12-13 posts without it ballooning further. But honestly? The expanding scope reflects the richness of what we're building, and I'd rather do justice to the material than rush through it just to hit an arbitrary post count. The silver lining is that each additional post means more practical, battle-tested insights for anyone following along, and I'm learning that documenting the messy reality of building with AI agents is far more valuable than presenting a sanitised, perfectly planned tutorial that never existed.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post or [ping][ma] me if you have suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions. I look forward to hearing from you.

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

[1]: https://medium.com/@joe.njenga/18-proven-claude-code-onboarding-tips-for-teams-that-ship-faster-copy-them-now-7be8cdb871ce?sk=v2%2F6650c641-c648-487f-a37c-e41c60d803a1
[2]: https://claude.com/blog/cowork-research-preview
[3]: https://medium.com/ai-software-engineer/anthropic-new-guide-shows-how-to-build-quality-ai-agents-without-getting-fooled-29f378ec2609?sk=v2%2F053687bd-b8e7-4650-9dea-19cd63bf351d
[4]: https://github.blog/ai-and-ml/github-copilot/building-an-agentic-memory-system-for-github-copilot/
[5]: https://towardsdatascience.com/how-to-run-coding-agents-in-parallell/
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:

<!-- [postref]: {{< relref "" >}} -->

<!-- [series1]: [SQL Server R Services](/sql_server_2k16_r_services) -->
<!-- [series2]: [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) -->
<!-- [series3]: [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) -->


<!-- [findstr]: findstr /I <word_to_find> * -->
<!-- [findstr]: findstr /I /c:<"phrase to find"> * -->