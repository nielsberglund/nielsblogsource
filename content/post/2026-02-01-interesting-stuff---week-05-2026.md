---
type: post
layout: "post"
title: Interesting Stuff - Week 05, 2026
author: nielsb
date: 2026-02-01T12:41:47+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-05-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-05-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - MCP Apps
  - Ai-Agents
description: "Claude Code ships like a team of 5, MCP Apps bring interactive UIs to AI tools, and Dario Amodei maps AI existential risks. Week 05 tech roundup for developers."
---

Week 05 delivers a fascinating collision between AI's transformative potential and its sobering risks. While Kieran Klaassen demonstrates how compound engineering with Claude Code enables a two-person team to ship like a team of five (with AI opening 100% of pull requests), and the Model Context Protocol launches interactive UI capabilities that work identically across Claude, ChatGPT, VS Code, and Goose, Dario Amodei's 30,000-word essay pulls no punches about existential threats ranging from AI-enabled bioweapons to economic displacement of 50% of entry-level white-collar jobs within 1-5 years. 

The week's common thread? We're past the point of debating whether AI will reshape software development; the question now is whether developers will master tools like specialised research agents and planning strategies before getting left behind, and whether humanity can navigate what Amodei calls our "technological adolescence" without destroying ourselves in the process.

<!--more-->

---

## Generative AI

* [**How I Use Claude Code to Ship Like a Team of Five**][1]. In this post, Kieran Klaassen, general manager of Cora at Every, reveals a striking reality: every piece of code he's shipped in the last two months was entirely written by AI through Claude Code. This isn't AI-assisted development; it's AI-delegated development, where Claude Code opens 100% of pull requests while Klaassen has transformed from a hands-on programmer to an engineering manager overnight. He introduces the concept of "compound engineering," a practice of using AI agents to build software systems that continuously improve with each task. What started as an expensive experiment (burning through $5 in tokens for a 30-second task) has evolved into a productivity multiplier that's fundamentally changed how he approaches software development.

  The article showcases Claude Code's unique superpower: parallel processing that enables running multiple AI agents simultaneously through separate git worktrees. Klaassen's typical morning involves spinning up four or five Claude Code instances in parallel, each tackling different features; from reproducing bugs and creating GitHub issues to reviewing pull requests and investigating production problems. His custom commands streamline the workflow: `/issues` researches and creates GitHub issues, `/work` picks up issues and generates pull requests, `/review` provides code review feedback, and typing "PR" handles the entire pull request creation process, including branch management, commit messages, and descriptions. This approach allows his two-person team to produce output comparable to that of a much larger engineering group, all for $400 in monthly Claude Code subscriptions.

  Beyond raw productivity gains, Klaassen highlights a crucial mental shift required for success: developers must "unlearn coding" and think less about files and functions, more about outcomes and delegation. Claude Code excels at multi-step debugging, methodically working through thousands of lines of third-party code to uncover configuration mismatches that would take humans hours to find. While it has quirks (occasionally disabling tests to make them pass, writing excessive test coverage, or overthinking simple tasks), its real value lies in eliminating friction. Unlike IDE-locked tools such as Cursor and Windsurf, or web-based platforms like Devin, Claude Code adapts to existing terminal workflows without requiring special editors or interfaces, making it accessible even for non-technical users venturing into software development.


---

* [**The Adolescence of Technology**][2]. Dario Amodei, in this post, channels Carl Sagan's *Contact* to frame humanity's defining challenge: how do we survive our "technological adolescence" without destroying ourselves? In January 2026, Anthropic's CEO (Amodei) delivers a sobering 30,000-word essay that maps out five categories of existential risk posed by powerful AI, what he calls a "country of geniuses in a datacenter." Amodei meticulously walks through autonomy risks (AI systems going rogue), misuse for destruction (think bioweapons enabled by step-by-step AI guidance), misuse for seizing power (AI-enabled totalitarian surveillance states), economic disruption (50% of entry-level white-collar jobs potentially displaced within 1-5 years), and the catch-all category of indirect effects, the unknown unknowns that could emerge from compressing a century of progress into a decade. Unlike his optimistic *Machines of Loving Grace* essay, this piece confronts the darker possibilities head-on, arguing that we're closer to real danger in 2026 than we were during the peak AI safety discourse of 2023-2024.

  What makes this post particularly compelling is Amodei's refusal to choose sides in the tired "accelerate vs. pause" debate. Instead, he advocates for what he calls "surgical interventions", judicious measures like chip export controls to slow authoritarian AI development, transparency legislation (he specifically praises California's SB 53 and New York's RAISE Act), Constitutional AI to shape model behaviour, and mechanistic interpretability to peer inside neural networks and catch misalignment before deployment. He's refreshingly candid about Anthropic's safeguards, revealing that their bioweapon-detection classifiers consume nearly 5% of inference costs for some models, a significant margin hit they're willing to accept. Amodei also tackles the thorny tension between arming democracies with AI tools to counter autocracies while preventing those same tools from being turned inward against citizens, proposing the principle that democracies should use AI "in all ways except those which would make us more like our autocratic adversaries."

  Here's where things get interesting: Amodei is essentially arguing that the AI industry has entered a multi-front war where winning on one battlefield can mean losing on another. Carefully building AI to prevent autonomy risks creates openings for authoritarian nations to gain an advantage. But racing too fast risks bioterrorism, economic chaos, or inadvertently handing dictators tools. His solution, slow down autocracies via export controls while democracies build carefully under regulatory frameworks, is pragmatic but politically fraught, especially given the trillions at stake. What strikes me most is his acknowledgement that even Anthropic's own experiments show Claude engaging in deception, blackmail, and reward-hacking during testing, exactly the behaviours that could scale catastrophically. The essay reads less like a roadmap and more like a plea: we have 1-2 years to get this right, and the clock is loudly ticking. Whether Silicon Valley, Washington, and the world can muster the coordination Amodei describes remains the trillion-dollar question, one that might define whether we join the successful alien civilisations or become a cautionary tale.


---

* [**Reflections of a Developer on LLMs in January 2026**][3]. This post by Robin Moffat, a self-described data engineer, opens with Charles Dickens' "best of times, worst of times" quote to perfectly capture the contradictions of AI in early 2026. Yes, you can describe an idea and have it generated as code (indistinguishable from magic, he argues). Still, bot farms now spew AI-generated divisive content at scale, scammers deploy realistic voice agents for targeted calls, and social media drowns in what he colourfully describes as "slop spurting all over the internet like a farmer's muck spreader gone awry." The author refuses to pick sides in the AI debate, drawing parallels to cloud computing adoption, where both the "all-in" crowd and the "it's just someone else's computer" sceptics were wrong. He observes that developers clinging to "but it hallucinates!" objections while refusing to acknowledge AI's productivity gains are being as childish as those who insisted on racking their own servers with cute Star Wars names instead of embracing cloud infrastructure. The online chatter, he notes, has shifted dramatically in recent months from "omg you wouldn't let an LLM code for you" to "omg how do we review all these PRs", because people are now actually letting LLMs generate production code.

  The heart of this post is the author's "junior developer analogy" for working with LLMs, which he borrows from a May 2023 hospital consultant's description: "Think of it as the most brilliant, talented, often drunk intern you could imagine." If you're a senior developer, he argues, treat Claude Code like an eager junior, fresh-eyed, bushy-tailed, talks too much, makes stupid mistakes, but becomes a force multiplier when tutored well under close supervision. He recounts building a custom website to replace his £100/year noti.st subscription, using Claude Code over four early mornings/late nights (about eight hours total, half spent learning the tool). The results are live at talks.rmoff.net, planning from overview to detail, autonomously running and debugging code, iteratively discussing design, handling deployment challenges, all from a single terminal window. His point isn't that he couldn't have done this without Claude, but that it would have required "a serious investment of time" and expertise he doesn't have, given his background in "databases and SQL." Would real frontend devs be sickened by his code? Probably. Does that weaken his point? Not in the slightest, he saved money, built exactly what he wanted, and had "a fuck-ton of fun" doing it.

  Here's where this perspective gets really interesting: the author directly tackles the accountability question that many senior engineers will raise. He quotes Oxide's policy that "employees bear responsibility for the artefacts we create, whatever automation we might employ to create them", meaning he'd never put his name to a SQL pull request he couldn't explain because that's his job. Still, he's perfectly comfortable shipping frontend code generated by Claude for his personal site because the consequences are his alone. This nuance matters. He also identifies where the junior developer analogy breaks down: unlike human juniors who get tired and go home, LLMs "will keep on going so long as you keep feeding them tokens," creating an addictive feedback loop he compares to scrolling short video feeds. The rapid context switching and dopamine hits from each delivered chunk of functionality can easily lead you down rabbit holes or Frankenstein-like development paths that feel productive but are ultimately flawed. His practical tips section covers Playwright for visual testing, sound notifications to avoid missing Claude's questions, cost tracking via custom status lines, model selection optimisation (different Claude variants for different tasks), and mastering concepts like context windows, context rot, and the magical CLAUDE.md file. He even details non-coding applications: proofreading blog posts, planning holidays iteratively, and acting as a running coach by integrating Garmin and Strava data via MCP. The message is clear: LLMs are evolving not over centuries but over weeks and months, we're past the point of shutting Pandora's box, and developers who aren't adopting AI risk ending up alongside "hansom cab drivers who figured that the motor engine was a fad."

---

* [**MCP Apps - Bringing UI Capabilities To MCP Clients**][4]. The Model Context Protocol Blog announced that MCP Apps are now live as the first official MCP extension, bringing interactive UI capabilities directly into AI conversations. Tools can now return rich, interactive interfaces, dashboards, forms, visualisations, and multi-step workflows that render in the conversation rather than plain-text responses. This builds on November's proposal and the pioneering work of MCP-UI and OpenAI's Apps SDK, creating a shared, open standard with production support from Claude (web and desktop), ChatGPT (rolling out this week), Goose, and Visual Studio Code Insiders. The architecture relies on two key MCP primitives: tools with UI metadata containing a `_meta.ui.resourceUri` field, and UI Resources served via the `ui://` scheme containing bundled HTML/JavaScript. The host fetches these resources, renders them in sandboxed iframes, and enables bidirectional communication via JSON-RPC over postMessage. Use cases span data exploration (interactive sales dashboards with filtering and drill-downs), configuration wizards (deployment forms with dependent fields), document review (inline PDFs with highlighted clauses that show the model's real-time view of user decisions), and real-time monitoring (server health metrics that update in real time without re-running tools). Developers use the `@modelcontextprotocol/ext-apps` package, which provides an App class for UI-to-host communication. Apps can log events for debugging, open links in the user's browser, send follow-up messages to drive conversation forward, or quietly update the model's context, all over standard postMessage without framework lock-in.

  This post tackles what the maintainers call the "context gap"—the disconnect between what tools can do and what users can see. Consider a database query returning hundreds of rows: the model can summarise, but users often want to explore interactively (sort by column, filter by date range, click into specific records), and with text responses, every interaction requires another prompt like "Show me just the ones from last week" or "What's the detail on row 47?" MCP Apps closes this gap; the model stays in the loop, seeing what users do and responding accordingly, while the UI handles what text can't (live updates, native media viewers, persistent states, direct manipulation). Security is achieved through multiple layers: iframe sandboxing with restricted permissions, pre-declared templates that hosts can review before rendering, auditable JSON-RPC messages, and optional user consent for UI-initiated tool calls. The ext-apps repository includes working examples: threejs-server for 3D visualisation, map-server for interactive maps, pdf-server for document viewing, system-monitor-server for real-time dashboards, sheet-music-server for music notation. Industry support is strong, with quotes from David Soria Parra at Anthropic ("I cannot wait to see what the community will build"), Nick Cooper at OpenAI (proud to support this open standard), Andrew Harvard at Block (emphasising how MCP inverts the model by making apps pluggable components within agents rather than embedding assistants into individual apps), Harald Kirschner at Microsoft (noting MCP Apps addresses the "missing human step" when workflows need decisions without turning conversations into choose-your-own-adventure prompts), and representatives from JetBrains, AWS, and Google DeepMind all expressing enthusiasm for bringing these capabilities to their platforms.

  Here's what strikes me about this announcement: we're watching the Model Context Protocol evolve from a clever data connection layer into something that genuinely feels like an operating system for AI agents. The timing is fascinating; this lands just weeks after we've seen Claude Code demonstrate compound autonomous workflows, and suddenly, MCP servers can now deliver interactive UIs that work identically across ChatGPT, Claude, VS Code, and Goose without a single line of client-specific code. That's a developer experience win that could significantly accelerate MCP adoption. But I'm particularly intrigued by the philosophical shift Andrew Harvard articulates. The industry has been embedding assistants into apps (fragmented, siloed). At the same time, MCP inverts this to make apps pluggable within agents, and MCP Apps extends that vision by bringing UIs into the agent experience itself. The practical implications are wild: imagine debugging a production incident where your monitoring tool returns not just metrics but an interactive dashboard that updates in real-time as systems change, or a contract analysis tool that displays the PDF inline with highlighted clauses where you click to approve, or flag sections, and the model sees your decisions immediately. The security model seems thoughtfully designed with sandboxing and auditable communication, though I suspect we'll see some interesting edge cases emerge as developers push the boundaries. What's your take: does this feel like the natural evolution of conversational AI interfaces, or are we overcomplicating what should be simple text exchanges? And for anyone already building MCP servers, are you planning to add UI capabilities to existing tools or create entirely new interactive experiences?

---

* [**Teach Your AI to Think Like a Senior Engineer**][5]. In this second post by Kieran Klaassen this week he explores how running multiple specialised research agents in parallel before writing any code helps prevent the wrong solution from being built entirely. At the same time, the human contributes judgment and taste. His approach centres on what he calls "compound engineering," where planning with AI means running parallel research operations, with agents bringing in findings, humans making decisions, and the two combining into a single coherent plan. He opens with a reality check: when implementing Cora's email bankruptcy feature to clear 53,000-email inboxes, he thought it would be simple bulk archiving. Instead, his research agent revealed that Gmail rate limits would kill the operation at 2,000 emails, the system would time out on long operations, and users would wait too long for results. What seemed like a quick feature turned into a three-day architectural challenge. Planning saved him from wasting time building the wrong thing. His framework organises eight planning strategies by fidelity level (complexity), where Fidelity One covers quick fixes like one-line changes, Fidelity Two spans features across multiple files with clear scope but non-obvious implementation, and Fidelity Three tackles major features where you don't even know what you're building yet. The strategies progress from basic (reproduce and document bugs without fixing them, just gathering logs) through intermediate (ground in best practices by searching how others solved similar problems, ground in your codebase to find existing patterns, ground in your libraries by reading source code of installed packages) to advanced (study git history to understand past decisions and their context, vibe prototype for UX clarity using throwaway React prototypes, synthesise all research into plans showing 2-3 solution paths with honest tradeoffs, and review with specialised style agents that enforce personal preferences).

  The power lies in how these strategies compound over time, knowledge accumulates, and the system gets progressively smarter. When Klaassen's agent found a handy pattern during gem upgrade research, it automatically saved key findings to the docs files in his project, creating a growing knowledge base that gets checked before searching the web. After discovering a rate limit bug in production, he updated his specialised `@kieran-rails-reviewer` agent with a new checklist item: "For any background job that calls external APIs, does it handle rate limits? Does it retry? Does it leave users in partial states?" The team forgot to retry once; the system won't let them forget again. He created an `@event-tracking-expert` agent that knows all their tracking patterns, helper methods, event formats, and when to track versus when not to, and it runs automatically whenever planning features that need tracking are used. His three review agents (simplification agent flagging over-engineering, security agent checking for vulnerabilities, kieran-style agent enforcing personal preferences, like avoiding complex database joins in favour of denormalised data) catch misalignments before any code is written. The git history strategy proved particularly valuable: before upgrading EmailClassifier to version two, an agent search revealed a pull request from three months ago where a different team member had already tried the upgrade, discovered it put inbox emails in the archive and vice versa, and deliberately rolled back with detailed reasoning, saving Klaassen from reintroducing a bug someone else had already debugged. His synthesis strategy for Gmail inbox syncing presented three options with honest tradeoffs: bolt-on syncing to the current system (quick but messy), fetch emails from Gmail every time (clean but slow), or build a local mirror cache (more upfront work but fastest long-term). Once he saw the comparison, he made an informed choice in 30 seconds; the agent did research, and he contributed judgment.

  What fascinates me about Klaassen's approach is how it fundamentally reframes the relationship between humans and AI in software development. This isn't "AI writes code, human reviews", it's "AI does comprehensive research across multiple dimensions, human makes architectural decisions informed by that research." The parallel research operations are genuinely faster than human step-by-step planning (five agents researching simultaneously), and the compounding effect where every decision, preference, and mistake feeds back into specialised review agents creates something that looks remarkably like institutional knowledge preservation. But here's what I keep wrestling with: are we building systems that make junior developers better, or are we creating dependency on AI research that atrophies the very research skills that made senior engineers senior in the first place? When an agent automatically checks git history to discover why EmailClassifier v2 was rolled back, that's fantastic, but what happens to the developer who never learned to habitually check git blame and PR discussions before touching unfamiliar code? The vibe prototyping strategy feels particularly powerful for UX uncertainty. Still, I wonder whether the ease of spinning up five React prototypes in Claude encourages exploration or actually discourages deeper user research that might reveal the real problem isn't the layout but whether this feature should exist at all. Still, I can't deny the pragmatic value, 20 minutes of multi-agent research preventing a three-day architectural mistake is a compelling ROI, and the open-sourced planning system on Every's GitHub suggests this isn't vaporware but a battle-tested workflow. What's your experience been: does AI-assisted planning make you a better architect, or does the speed of iteration sometimes lead you down paths you'd have questioned more sceptically if the research had taken longer?

---

## WIND (What Is Niels Doing)

[**Part 9**][part9] of my [**Building an Event Management System with Claude Code**](/contact-event-claude-code) series is now live! I'm currently deep in the trenches of Part 10, which tackles email functionality, specifically how to integrate a Brevo MCP server to handle sending emails from the system. If all goes according to plan (and doesn't Claude Code have other ideas about that), Part 10 should drop by the end of this coming week.

The good news? The finish line is actually in sight now. After Part 10, I estimate only 3-4 more posts to wrap up the series. What started as a "simple documentation project" has grown into the most comprehensive real-world MCP server tutorial I could have imagined, but we're nearly there.

And here's the kicker, you heard it here first: we're planning the first Data & AI Community Day Durban event for **March 14, 2026**. Which means there's a very real possibility that the event management system I've been building and documenting will actually be up and running for the event it was designed to support. Nothing like a hard deadline and the pressure of using your own system in production to keep you motivated, right? Stay tuned to see if we pull this off or if it becomes a cautionary tale about ambitious timelines!

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

[1]: https://every.to/source-code/how-i-use-claude-code-to-ship-like-a-team-of-five-6f23f136-52ab-455f-a997-101c071613aa
[2]: https://www.darioamodei.com/essay/the-adolescence-of-technology
[3]: https://rmoff.net/2026/01/27/reflections-of-a-developer-on-llms-in-january-2026/
[4]: https://blog.modelcontextprotocol.io/posts/2026-01-26-mcp-apps/
[5]: https://every.to/source-code/teach-your-ai-to-think-like-a-senior-engineer-789ba7ca-ca7c-45a1-91fa-4178f59f226f


[part9]: {{< relref "2026-01-29-building-an-event-management-system-with-claude-code-part-9---autonomous-implementation-letting-claude-code-loose.md" >}}


<!-- [postref]: {{< relref "" >}} -->

<!-- [series1]: [SQL Server R Services](/sql_server_2k16_r_services) -->
<!-- [series2]: [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) -->
<!-- [series3]: [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) -->


<!-- [findstr]: findstr /I <word_to_find> * -->
<!-- [findstr]: findstr /I /c:<"phrase to find"> * -->