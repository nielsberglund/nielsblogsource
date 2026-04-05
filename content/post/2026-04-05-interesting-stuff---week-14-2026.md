---
type: post
layout: "post"
title: Interesting Stuff - Week 14, 2026
author: nielsb
date: 2026-04-05T06:06:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-14-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-14-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - Claude Mythos
  - Harness Engineering
  - AI Agents
  - Microsoft Agent Framework
description: "Week 14 tech roundup: Claude Skills and Cowork Projects for beginners, Claude Mythos leaks as Anthropic's most dangerous model, harness engineering playbook from Anthropic's research, Claude Code gets computer use from the CLI, and Microsoft's Agent Framework hits 1.0 with a major architectural shift."
---

What a week. An accidental (or was it?) leak reveals Anthropic's most powerful model yet, one they describe as "genuinely dangerous", while the practical side of AI development keeps maturing at breakneck speed. We've got beginner-friendly guides to Claude's skill system, Anthropic's own research distilled into a harness engineering playbook, computer use arriving in the CLI, and Microsoft shipping a 1.0 agent framework that finally separates the runtime from the control plane.

The thread connecting all of this? AI agents are no longer experimental toys. They're production systems that need proper engineering, proper governance, and proper safety rails. Whether that's designing habitats for coding agents or deciding who gets early access to a model that automatically finds zero-day vulnerabilities, the stakes just got very real.

<!--more-->

---

## Generative AI

* [**A 101 guide to Claude Skills and Cowork Projects**][1]. In this post, Devi provides a beginner-friendly walkthrough of Claude Skills and Cowork Projects: two features that have been shipping rapidly but can feel overwhelming to newcomers. The core distinction is clean: a Skill is a set of markdown instructions you load into Claude's context to give it a specific capability (not a plugin or extension, but "a detailed recipe"), while a Cowork Project bundles everything related to a goal, conversations, local files, instructions, skills, and memory, into a single workspace where Claude already knows what it's for. Devi covers how Anthropic maintains a library of public skills for common tasks (docx, PDF, spreadsheets, presentations) and how you can chain custom skills together with built-in ones.

  The demo is where this comes alive. Devi builds a "One Piece Content Hub" project in Cowork with a two-step workflow: first, Anthropic's docx skill produces a research document on a topic, then a custom zine skill transforms that research into a styled HTML file with One Piece's official colour palette, page-by-page reveal animations, and Bebas Neue typography. Two skills, two prompts, two outputs; both saved to the right folders, both reusable the next time the project is opened. The practical advice on when this setup is worth it (for repeatable outputs where format matters) versus when it isn't (for one-off thinking, quick emails, brainstorming) is sensible guidance that will save newcomers from over-engineering simple tasks.

---

* [**Claude MYTHOS Anthropic's "Most Dangerous Model"**][2]. This post by Wes Roth covers the story that dominated the AI news cycle this week: a Fortune reporter discovered that Anthropic had misconfigured their content management system, exposing nearly 3,000 internal files to the public. Among them was a draft blog post for a model called Claude Mythos, described internally as "by far the most powerful AI model we've ever developed" and "a step change": a new tier above Opus called Capybara. The leaked draft detailed dramatically higher scores in software coding, academic reasoning, and cybersecurity, as well as plans for an invite-only CEO summit in the UK, where Mythos was to be demonstrated privately before any public announcement.

  The cybersecurity angle is what moved markets. The draft described Mythos as "currently far ahead of any other AI model in cyber capabilities," capable of automatically identifying previously unknown vulnerabilities in production codebases. Anthropic's own internal language warned of "an upcoming wave of models that can exploit vulnerabilities in ways that far outpace the efforts of defenders." Cybersecurity stocks collapsed: CrowdStrike fell 7%, Palo Alto 6%, and the Nasdaq dropped over 2%. Anthropic's plan, per the leaked documents, is to give cyber defenders early access first: let the shield reach people before the sword becomes widely available.

  Here's what strikes me about this story: whether the leak was accidental or deliberate (and Wes explores both possibilities with appropriate scepticism), the effect is the same; everyone now knows Mythos exists and what it can do. The timing is notable too: OpenAI finished pretraining their next major model (codenamed Spud) the same day the story broke, with Sam Altman telling staff it will "really accelerate the economy" and renaming the product division "AGI Deployment." Two of the largest AI labs are simultaneously preparing their biggest model releases, both describing them as step changes. The gap between what AI can do and what most people think AI can do is closing faster than the industry can communicate it.

---

* [**Anthropic's New Harness Engineering Playbook (Shows Why Your AI Agents Keep Failing)**][3]. Joe Njenga distils Anthropic's two connected research papers on harness engineering, November 2025 and March 2026, into practical guidance for anyone building AI agents. The problem is well-documented: agents work fine on short tasks but degrade predictably on complex multi-session work. Njenga identifies four specific failure modes from the research: agents trying to do everything at once (burning context without a plan), "context anxiety" (where models like Claude Sonnet 4.5 sense they're approaching their context limit and start prematurely wrapping up), declaring victory too early (seeing progress and concluding the project is complete), and self-evaluation bias (agents almost always approve their own output).

  The two-part solution from the November paper is elegantly simple: an initialiser agent creates the infrastructure (`feature_list.json`, `claude-progress.txt`, `init.sh` + initial git commit), and a coding agent follows a strict orientation sequence every session before writing any code; confirm working directory, read progress and git log, pick the highest-priority incomplete feature, start the dev server, run a baseline test, then work on one feature at a time. The March 2026 paper pushes further with a three-agent architecture inspired by GANs: a planner expands a brief prompt into a full product spec, a generator builds the application one sprint at a time (negotiating sprint contracts with the evaluator), and an evaluator uses Playwright MCP to test the live app as a real user would, grading against hard pass/fail thresholds for design quality, originality, craft, and functionality.

   What fascinates me is the direct comparison Njenga highlights. Given the same one-sentence prompt ("create a 2D retro game maker"), the solo agent produced something that looked reasonable until you used it: broken game mode, non-responsive entities, disconnected wiring. The harnessed three-agent system produced a working sprite editor, richer level editor, built-in Claude integration, and a functional game mode, expanding the original prompt into a 16-feature spec across ten sprints. Same model, radically different outcomes. If you take one thing from this week's roundup, let it be this: the bottleneck in agentic AI is no longer model capability, it's the engineering of the environment around the model.

---

* [**Let Claude use your computer from the CLI**][4]. In this post from the Claude Code documentation, Anthropic introduces computer use for Claude Code on macOS, a research preview that lets Claude open apps, click, type, scroll, and see your screen, all from within your terminal session. The key insight is the escalation hierarchy: Claude tries the most precise tool first (an MCP server for structured APIs, Bash for shell commands, Chrome extension for browser work) and falls back to screen control only when nothing else can reach the task. This means computer use handles genuinely GUI-dependent work, native macOS apps, iOS Simulator, design tools, and hardware control panels, rather than being a blunt instrument for everything.

  The setup is straightforward: enable the `computer-use` MCP server via `/mcp`, grant macOS Accessibility and Screen Recording permissions, and approve specific apps per session. The security model is well thought out: per-app approval (not blanket access), sentinel warnings for apps with broad reach (terminals, Finder, System Settings), terminal windows excluded from screenshots so Claude never sees its own output (preventing feedback loops), a global Esc key to abort from anywhere, and a machine-wide lock ensuring only one session controls the computer at a time. The example workflows build a Swift menu bar app and click through every control to verify, reproduce a layout bug by resizing windows and screenshotting the clipped state, drive the iOS Simulator through an onboarding flow, and show the real value: closing the loop between writing code and visually validating it without leaving the conversation.

  I keep wrestling with where computer use fits in the tool hierarchy long-term. Right now, it's the fallback of last resort, which is the right design choice; it's the broadest and slowest option. But as models get better at interpreting screen content and taking precise actions, the line between "use the API" and "use the GUI" will blur. The fact that Claude Code already implements view-only mode for browsers and trading platforms, click-only for terminals, and full control for everything else suggests Anthropic is thinking carefully about the trust gradient. This feature will quietly become indispensable for anyone doing native app development.

---

* [**Microsoft Agent Framework Just Changed in a Big Way — Here's What Developers Need to Know**][5]. Gaurav Bhardwaj, in this post, breaks down the 1.0.0 release of Microsoft's Agent Framework, and the message is clear: this isn't a polish pass, it's a fundamental architectural rethink. The headline change is `FoundryAgent`, which shifts the mental model from "create and manage agents through provider patterns in your code" to "agents already exist in Azure AI Foundry; your application connects to them." Foundry becomes the control plane, your app becomes the runtime consumer. The practical impact is significant: the old pattern required CRUD operations via provider-specific classes, whereas the new pattern provides a clean connection to a pre-configured agent with credentials and an endpoint.

  The deeper story is the extraction of provider-specific code from the core package. OpenAI and Azure implementations now live in dedicated lightweight packages (`agent-framework-openai`, `agent-framework-foundry`), leaving the core focused on abstractions, middleware, and telemetry. The unified `model` parameter consolidates the previous proliferation of `model_id`, `deployment_name`, and `model_deployment_name` into a single, consistent field. Streaming is simplified from a separate `run_stream()` method to a `stream=True` boolean flag on the standard `run()` method. And the naming overhaul is extensive: `ChatAgent` becomes `Agent`, `ChatMessage` becomes `Message`, `@ai_function` becomes `@tool`, `Role.USER` becomes the string `"user"`.

  What I find notable here is how this mirrors a pattern we're seeing across the industry: the separation of agent governance (where agents are defined, configured, and permissioned) from agent execution (where they actually run). It's the same architectural instinct behind NemoClaw separating OpenClaw's capabilities from its security layer, or Anthropic separating model capability from harness engineering. Microsoft is betting that enterprise customers want to manage their agents in a centralised control plane and consume them from lightweight runtime clients. Whether that bet pays off depends on how smoothly the migration goes, and the "gotcha" with `RawFoundryAgentChatClient` failing on unexpected tool schemas suggests there are still rough edges to sand down.

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

[1]: https://pub.towardsai.net/a-101-guide-to-claude-skills-and-cowork-projects-fd3acae6d7c8
[2]: https://natural20.beehiiv.com/p/claude-mythos-anthropic-s-most-dangerous-model
[3]: https://medium.com/ai-software-engineer/anthropics-new-harness-engineering-playbook-shows-why-your-ai-agents-keep-failing-174a5575ff92?sk=v2%2F7114050e-a095-4ea4-bebe-f473be927d7d
[4]: https://code.claude.com/docs/en/computer-use
[5]: https://pub.towardsai.net/microsoft-agent-framework-just-changed-in-a-big-way-heres-what-developers-need-to-know-52d032c06854


<!-- [postref]: {{< relref "" >}} -->
