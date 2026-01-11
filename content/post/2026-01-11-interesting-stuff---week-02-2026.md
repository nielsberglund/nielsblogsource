---
type: post
layout: "post"
title: Interesting Stuff - Week 02, 2026
author: nielsb
date: 2026-01-11T05:21:40+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-02-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-02-26.jpg"
categories:
  - roundup
tags:
  - Claude Code
  - ai agents
  - a2ui
  - Microsoft Foundry
description: "Week 02 2026: Claude Code production tips, GitHub Copilot GH-300 guide, Google A2UI agent protocol, Ralph Loop autonomous coding, Microsoft Foundry memory systems."
---

Welcome to the first tech roundup of 2026, where AI agents finally learned to speak UI instead of drowning us in conversational ping-pong, and autonomous coding tools decided sleep is optional. This week's collection spans Google's A2UI protocol for civilised agent interfaces, Microsoft's memory systems that cure AI amnesia, Ralph Loop's stubborn persistence that ships $50K projects for $297, and production wisdom from the engineer who created Claude Code while landing 259 PRs in 30 days. 

We've also got Simon Willison preserving the "why" behind AI-assisted codebases, a comprehensive GitHub Copilot certification guide that's actually useful, and a tutorial on building churn-prevention agents that catch customers before they ghost you. Buckle up, this is what happens when agents stop asking permission and start shipping production code while you sleep.

<!--more-->

---

## Generative AI

* [**Google Introduces A2UI (Agent-to-User Interface): An Open Sourc Protocol for Agent Driven Interfaces**][1]. In this post by Asif Razzaq, Google unveils A2UI (Agent-to-User Interface), an open-source protocol that finally solves the age-old problem of AI agents drowning users in text when a simple form would do. Rather than making us suffer through conversational ping-pong ("What date?" "January 15th." "What time?" "7 PM." "How many guests?"...), A2UI lets agents describe rich, interactive interfaces using declarative JSON; think date pickers, time selectors, and submit buttons that actually make sense. The protocol addresses a critical gap in agent-driven interfaces by enabling AI systems to communicate UI components as structured data rather than executable code, ensuring both security and seamless multi-agent collaboration across organisational boundaries.

  The genius of A2UI lies in its security-first architecture and LLM-friendly design. By treating UI as data rather than code, agents can only reference pre-approved component catalogues (buttons, cards, text fields), drastically reducing UI injection risks and preventing rogue scripts from sneaking into model outputs. The flat, updateable component structure is optimised for large language models, supporting streaming updates and progressive rendering, allowing users to watch interfaces assemble in real-time while agents continue to think. Better yet, A2UI is framework-agnostic, rendering seamlessly across Angular, Flutter, React, and SwiftUI, making it a true polyglot solution for modern agentic applications.

  Currently at version 0.8 under the Apache 2.0 license, A2UI is already powering production systems like Gemini Enterprise, Opal, and Flutter GenUI. For developers building AI agent ecosystems or multi-agent meshes, this open standard offers a practical path forward for creating secure, visually consistent, and brand-controlled interfaces across trust boundaries; no more janky iframes or visual Frankenstein's monsters. The future of agent interfaces got a whole lot more civilised.

---

* [**How to Build a Proactive Pre-Emptive Churn Prevention Agent with Intelligent Observation and Strategy Formation**][2]. This post by Asif Razzaq provides a comprehensive tutorial on building a preemptive churn-prevention agent that catches customers before they ghost you. Instead of the traditional reactive approach where you scramble after someone cancels, this intelligent system leverages Google's Gemini 2.5 Flash to proactively monitor user behaviour, identify inactivity patterns, and draft personalised re-engagement emails with surgical precision. The tutorial walks developers through building a complete agentic workflow that observes customer signals (like that ominous "last login: 45 days ago"), analyses behavioural patterns to assess churn risk, strategises appropriate incentives, and generates empathetic, human-ready email drafts; all before the customer even thinks about hitting that cancel button.

  The architecture is elegantly modular, featuring a mock customer database simulation, a ChurnPreventionAgent class powered by Gemini that evaluates risk levels (Medium/High/Critical) and selects specific win-back strategies, and an automated email drafting system that personalises messaging based on user history and favourite features. What sets this implementation apart is its practical attention to human-in-the-loop workflows, including a ManagerDashboard component that simulates real-world approval processes before any emails fly. The system uses structured JSON outputs from Gemini to maintain consistency and reliability, supports incremental updates, and keeps the entire pipeline transparent and auditable for customer success teams who need to maintain brand voice and compliance standards.

  The complete Python implementation connects seamlessly with Google's generative AI libraries and demonstrates production-ready patterns for agentic customer retention systems. With complete code examples covering everything from environment setup to orchestration loops, developers can adapt this framework to integrate with real CRMs, databases, and automation platforms, transforming reactive customer success operations into proactive retention engines that scale intelligently.

---

* [**A new way to extract detailed transcripts from Claude Code**][3]. Simon Willison, in this post, unveils `claude-code-transcripts`, a Python CLI tool that transforms ephemeral Claude Code sessions into richly detailed HTML transcripts, essentially creating a permanent archaeological record of your AI-assisted coding adventures. The tool addresses a genuinely fascinating problem: as developers increasingly delegate coding work to Claude Code (Simon admits he's now writing more code via Claude than in traditional editors, and even codes on walks using the iPhone app), the actual *work* is now captured in conversational transcripts rather than Git commits and issue threads. These transcripts contain invaluable project context, design decisions, Claude's reasoning, and your strategic choices that would otherwise vanish into the ether once the chat window closes.

  The tool works beautifully with both local Claude Code sessions and Claude Code for web (using reverse-engineered private APIs), offering one-command transcript extraction via `uvx claude-code-transcripts`. Power users can instantly publish sessions as GitHub Gists with the `--gist` flag, creating shareable static HTML that's far more human-friendly than raw JSON dumps. The generated pages include summary views, paginated detailed breakdowns, and, critically, Claude's default-invisible thinking traces that reveal the agent's internal reasoning process. Simon's meta-approach here is delicious: every commit in the project links to Claude Code transcripts showing how Claude built the tool itself, creating a recursive documentation loop that's both practical and philosophically satisfying.

  **Here's what's genuinely compelling about this:** we're witnessing the emergence of a new category of technical documentation that didn't exist five years ago. Pre-LLM, project context lived in issue trackers, code comments, and commit messages. Now, the *conversation* is the artefact. Simon built this entirely using Claude (with one cheeky exception: he had OpenAI's Codex reverse-engineer Claude Code's authentication system, which is beautifully subversive). The tool uses a questionnaire for interactive CLI selection, Jinja2 for templating, Syrupy for snapshot testing, and even extracts OAuth tokens from the macOS Keychain using `security find-generic-password`. If you're doing serious work with Claude Code and want to preserve the "why" behind your codebase, this tool is essential infrastructure for the AI-assisted development era.

---

* [**Introducing Memory in Foundry Agent Service**][4]. This post by Lewis Liu, Paul Hsu, and Takuto Higuchi announces the public preview of memory capabilities in Microsoft's Foundry Agent Service, finally liberating AI agents from their amnesia-riddled existence. Until now, most agents operated like digital goldfish, each conversation resetting to zero, forgetting user preferences from minutes or weeks ago. At the same time, developers cobbled together hacky workarounds involving embedding databases, manual message retrieval, and context-stuffed prompts that added latency, cost, and complexity without truly solving the problem. Microsoft's fully managed, long-term memory store changes the game by natively integrating with Foundry Agent Service, enabling agents to seamlessly store, retrieve, and manage chat summaries, user preferences, and critical context across sessions, devices, and workflows without developers reinventing the wheel.

  The memory system works through a sophisticated four-phase pipeline: extracting what matters (capturing user preferences like "allergic to dairy" or "prefers dark roast coffee"), consolidating to keep things clean (merging similar memories and resolving conflicts using LLMs), retrieving where needed (hybrid search techniques surface relevant context instantly), and customising memory for specific use cases via the `user_profile_details` parameter. Developers can enable memory with a single click in the Foundry portal or leverage Python APIs/SDKs for advanced configurations. The system extracts both user profile information and chat summaries from conversation histories, achieving state-of-the-art performance on common memory benchmarks; agents with memory scored 88.85% accuracy on GPT-4.1 tests compared to just 11.23% for memory-less agents.

  Built for developer velocity, the service scales from rapid prototyping to enterprise deployments, supporting millions of users and terabytes of data. Microsoft continuously applies cutting-edge memory retrieval, relevance, and personalisation techniques, with rigorous evaluation frameworks ensuring quality across semantic fact recall, user preference management, and real-world conversation scenarios. The unified API supports Foundry's managed service and offers plans for bring-your-own-storage, delivering advanced retrieval, memory extraction, and consolidation without added architectural complexity. For teams building conversational AI applications, customer service bots, or any agent requiring persistent context awareness, this managed memory service eliminates infrastructure headaches while delivering production-ready personalisation capabilities.

---

* [**Ralph Wiggum: Claude Code New Way to Run Autonomously (For Hours Without Drama)**][5]. Joe Njenga introduces Ralph Loop (brilliantly named after The Simpsons' most persistently incompetent character), a Claude Code plugin that solves a fundamental flaw in AI coding agents: the single-pass problem. Claude Code historically operates like an overeager intern who declares victory the moment something kinda-sorta works, stopping as soon as the output reaches "good enough" rather than iterating toward actual excellence. Ralph Loop hijacks this behaviour by implementing a continuous feedback loop using Claude Code's stop hook mechanism, essentially forcing Claude to review its own work, identify improvements, and keep refining until a completion promise (like `<promise>DONE</promise>`) appears in the output. The results speak volumes: developers shipped six complete repos overnight at a Y Combinator hackathon, rewrote browser-use from Python to TypeScript autonomously, and completed a $50,000 project for just $297 in API costs.

  The technical implementation is deceptively simple—at its core, it's a bash while loop (`while :; do cat PROMPT.md | claude ; done`) that continuously feeds prompts back to Claude, but is adequately integrated with stop hooks to create intelligent iteration rather than mindless repetition. Installation requires Claude Code v2.0.76+ and a simple `/plugin install ralph-wiggum@anthropics` command, after which developers get access to `/ralph-wiggum:ralph-loop`, `/ralph-wiggum:cancel-ralph`, and help commands. The magic isn't in the loop mechanism itself; it's in the prompt engineering. Vague prompts like "build a todo API and make it good" will loop endlessly, with no progress. In contrast, structured prompts with clear completion criteria, incremental goals, self-correction patterns, and measurable success metrics enable Claude to autonomously build, test, debug, and refine code over hours or even days.

  **Here's what's fascinating and slightly terrifying:** we're entering an era where you can describe a complex software system before bed, set `--max-iterations 30`, and wake up to working, tested, documented code that iteratively improved itself overnight. The philosophical shift is profound; we're moving from "AI as coding assistant" to "AI as autonomous development team that doesn't sleep and learns from its own mistakes in real-time." The name Ralph Loop captures this perfectly: like Ralph Wiggum's childlike persistence in failing forward until accidental success, Claude now stubbornly refuses to quit until the task is genuinely complete. Cost efficiency is remarkable when prompts are well-crafted. Still, poorly defined tasks burn tokens fast; operator skill in writing clear, structured prompts with explicit success criteria matters more than model capability. For greenfield projects, TDD workflows, overnight development sprints, and any task with automatic verification, Ralph Loop represents a genuine paradigm shift in AI-assisted development.

---

* [**Master GitHub Copilot: The Ultimate GH‑300 Exam + Deep‑Dive Guide**][6]. Laura Verghote delivers an exhaustive, beginner-friendly exam preparation guide for the GH-300 GitHub Copilot certification, consolidating Microsoft's official study materials, practice assessments, and hands-on insights into a single, coherent narrative. The exam validates understanding across seven core domains: Responsible AI principles (fairness, reliability, privacy, inclusiveness, transparency, accountability), Copilot plans and features (Free, Pro, Pro+, Business, Enterprise with their respective capabilities), data handling and prompt lifecycle (inbound/outbound flow with toxicity filtering and LLM interaction), prompt engineering fundamentals (zero-shot, one-shot, few-shot, chain prompting), developer use cases across the SDLC, testing workflows with Ask/Edit/Agent modes, and privacy fundamentals including content exclusions and governance controls. The guide methodically unpacks each domain, using practical examples, visual diagrams, and real-world scenarios to translate abstract concepts into actionable knowledge.

  What makes this guide particularly valuable is its emphasis on understanding *why* Copilot works the way it does, not just memorising feature lists. Laura explains the nuanced data flow, how prompts travel from your IDE through GitHub's proxy server (with toxicity filtering at multiple stages), to the LLM for generation, back through post-processing filters (including duplication detection that blocks suggestions resembling 150+ characters of public code), and finally to your editor with telemetry feedback loops. Critical distinctions emerge: Copilot Individual users who don't opt out may have training copies created for fine-tuning GitHub-owned ranking layers. In contrast, Business/Enterprise customers never have code or prompts used for model training; they have runtime processing only, with immediate discard after inference. The guide also introduces GitHub Copilot Spaces (curated mini-LLM sessions grounded in specific files/issues for consistent, reproducible results), scoped context via @workspace and @file agents, and slash commands like /tests, /explain, /optimise that dramatically improve suggestion accuracy.

  **Here's what stands out for developers preparing for this certification:** the GH-300 exam isn't about tricks or gotchas; it's genuinely testing whether you understand how to use Copilot responsibly, effectively, and securely in production environments. The exam format (65 multiple-choice questions in 120 minutes) is straightforward. Still, the underlying competencies matter deeply: crafting SSSS prompts (Single, Specific, Short, Surround with context), understanding role prompting techniques ("act as a cybersecurity expert" to bias suggestions toward secure patterns), recognising when content exclusions prevent runtime context leakage of sensitive files, and knowing the difference between IDE agent mode (local multi-file editing) versus the GitHub coding agent (autonomous branch creation, commits, and PR workflows running in sandboxed Actions environments consuming Premium Request Units). Laura brilliantly includes an optional section on agentic workflows and the Model Context Protocol (MCP), not on the exam yet, but essential for real-world practice; explaining how Copilot can now orchestrate multi-step tasks across systems, access external APIs via MCP servers, and operate as an autonomous collaborator rather than a reactive assistant. For anyone pursuing AI-assisted development skills, GitHub certification, or wanting to deeply understand modern coding tools, this guide is certification prep gold.

---

* [**Boris Cherny Claude Code Creator Shares These 22 Tips (You’re Probably Using It Wrong)**][7]. Joe Njenga, in this post, distils production wisdom directly from Boris Cherny, the engineer who created Claude Code as a side project in September 2024 and now ships production code at an absolutely ridiculous scale: 259 PRs in 30 days, translating to 497 commits, 40,000 lines added, and 38,000 lines removed, all written by Claude Code paired with Opus 4.5. These aren't theoretical best practices cobbled together from Reddit threads; they're battle-tested workflows from someone living inside Claude Code's capabilities daily, pushing it harder than probably anyone else on the planet. Boris's setup is borderline absurd in the best way: he runs five Claude sessions simultaneously in numbered terminal tabs with system notifications enabled (via iTerm2 configuration). Hence, he knows which instance needs attention, plus an additional 5-10 sessions on claude.ai/code that he hands off using the `--teleport` command, and he even kicks off sessions from his iPhone during morning walks. His philosophy? Never be blocked waiting for one task to finish when you can parallelise everything.

  The tactical gold here centers on three force multipliers: **CLAUDE.md as shared team memory** (a 2.5k token file checked into Git that captures code style conventions, common bash commands, state management patterns, and crucially, gets updated whenever Claude makes a mistake; Boris's team tags `@claude` on PRs to automatically add learnings via the Claude Code GitHub action using `/install-github-action`), **Plan mode workflows** (press Shift+Tab twice to enter read-only planning mode where you refine the approach conversationally before switching to auto-accept edits, ensuring Claude can "one-shot" entire implementations), and **slash commands for inner-loop workflows** (stored in `.claude/commands/`, checked into Git, with inline bash using backticks to pre-compute info like `git status` or `git log --oneline -5` so Claude doesn't waste tokens asking). Boris uses subagents like `code-simplifier` and `verify-app` for everyday post-work tasks, configures `/permissions` to pre-allow safe bash commands (avoiding `--dangerously-skip-permissions` prompts without surrendering security), sets PostToolUse hooks for auto-formatting code after edits, and connects Claude to external services via MCP; his setup queries BigQuery for analytics, searches Slack, and pulls error logs from Sentry, all with configurations checked into `.mcp.json` for team-wide sharing.

  The single most transformative tip? **Give Claude a feedback loop for verification**. Boris insists this 2-3x's output quality. Verification varies by domain (running test suites, executing bash commands, testing in browser/phone simulators), and he uses the Claude Chrome extension to test every UI change by opening a browser, validating UX, and iterating until it works correctly. For hours-long autonomous tasks, he deploys the `ralph-wiggum` plugin to keep Claude looping until success rather than stopping after a single attempt. He uses Stop hooks to trigger automated verification when long-running sessions complete. Boris exclusively uses Opus 4.5 with thinking enabled because even though it's slower and heavier than Sonnet, you steer it less, and it excels at tool use. The net result is faster development because you spend less time dramatically correcting mistakes. For developers serious about maximising Claude Code productivity, these 22 tips represent the difference between "using an AI assistant" and "running a parallel autonomous dev team that ships production code while you sleep."

---

## WIND (What Is Niels Doing)

While most sensible humans spent the holiday season perfecting their couch-to-fridge navigation skills and pretending calories don't count between Christmas and New Year's, I apparently decided productivity was the real gift that keeps on giving. 

Instead of exclusively eating, drinking, and resting (shocking, I know), I dove back into my [**Building an Event Management System with Claude Code**](/contact-event-claude-code) tutorial series. The holiday break turned out to be the perfect time to give the series some much-needed love; Claude Code's installation process has evolved significantly since I first wrote those posts, becoming considerably more straightforward and more streamlined. So I went back and completely edited the first two posts to reflect the current reality, removing outdated friction points and updating the setup instructions so new readers don't run into unnecessary roadblocks.

But I didn't stop at maintenance mode. I also managed to publish **three brand-new posts** in the series, advancing with real implementation patterns and practical workflows that actually matter when building production applications with Claude Code.

Look, I'm not going to pretend I wasn't also consuming an unreasonable amount of festive food and enjoying some well-deserved downtime. But there's something deeply satisfying about starting the new year with momentum rather than having to climb out of a productivity deficit in January. The series is now in much better shape, more accessible to newcomers, and covering genuinely helpful territory.

**Am I proud of myself?** Absolutely. Did I also take naps and watch too much television? Also absolutely. Balance, my friends. Balance.

If you're curious about the series or want to follow along as I continue building (and inevitably breaking, then fixing) things with Claude Code, you can find all the posts at [**Building an Event Management System with Claude Code**](/contact-event-claude-code). More tutorials coming soon, because apparently, I can't help myself. 🚀

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

[1]: https://www.marktechpost.com/2025/12/22/google-introduces-a2ui-agent-to-user-interface-an-open-sourc-protocol-for-agent-driven-interfaces/
[2]: https://www.marktechpost.com/2025/12/23/how-to-build-a-proactive-pre-emptive-churn-prevention-agent-with-intelligent-observation-and-strategy-formation/
[3]: https://simonwillison.net/2025/Dec/25/claude-code-transcripts/
[4]: https://devblogs.microsoft.com/foundry/introducing-memory-in-foundry-agent-service/
[5]: https://medium.com/@joe.njenga/ralph-wiggum-claude-code-new-way-to-run-autonomously-for-hours-without-drama-095f47fbd467?sk=v2%2Fc47fc457-a8ec-457c-8c31-cbf578d10d39
[6]: https://pub.towardsai.net/master-github-copilot-the-ultimate-gh-300-exam-deep-dive-guide-371a5871ba64?sk=v2%2F470f52fe-b44e-4606-a307-1a489c0556ac
[7]: https://medium.com/@joe.njenga/boris-cherny-claude-code-creator-shares-these-22-tips-youre-probably-using-it-wrong-1b570aedefbe?sk=v2%2F4cc6b362-edf7-4a9d-a357-44d5247af4a4


