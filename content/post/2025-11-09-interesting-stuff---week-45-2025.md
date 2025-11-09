---
type: post
layout: "post"
title: Interesting Stuff - Week 45, 2025
author: nielsb
date: 2025-11-09T06:02:18+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-45-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-45-25.jpg"
categories:
  - roundup
tags:
  - generative AI
  - AI agents
  - dotnetconfsa
  - aimldatadurban
  - mcp
  - season of ai
description: "Discover how AI agents are reshaping software development: Claude Code's advanced features, 98% token reduction with MCP, and critical vulnerabilities in agentic markets revealed by Microsoft Research. Plus: Durban's historic first .NET Conf and upcoming AI events."
---

This week's roundup tackles the critical infrastructure challenges emerging as AI agents reshape software development, from Claude Code's advanced orchestration strategies and the hidden costs of 10x coding velocity to Anthropic's breakthrough 98% token reduction through code execution with MCP. Microsoft Research's Magentic Marketplace simulation exposes troubling vulnerabilities in agentic markets, revealing that even state-of-the-art models struggle with the "Paradox of Choice" and manipulation resistance when operating at scale. 

Meanwhile, I'm deep in prep mode for **Durban's first-ever .NET Conf on November 15** at Richfield College Umhlanga Campus, a milestone event proving our city can host world-class developer conferences, while simultaneously planning **December 13's "Data & AI Community Day Durban: Season of AI - Merry Christmas People (MCP)"**, where we'll unwrap the latest in Model Context Protocol and agentic AI development with festive flair. The convergence of production-ready AI coding tools and the need for radically rethought development infrastructure has never been more apparent, and this week's posts chart the path forward with unusual clarity.

<!--more-->

## Generative AI

* [**How I Use Every Claude Code Feature**][1]. Shrivu Shankar delivers an exhaustive, in-depth look at maximising Claude Code's capabilities in this post, spanning from foundational `CLAUDE.md` configuration to advanced GitHub Actions orchestration. The author, who consumes several billion tokens monthly in professional AI-powered development work, argues that the real competitive edge between AI coding agents like Claude Code, Gemini CLI, and Cursor isn't about flashy features; it's about "shoot and forget" delegation, where you judge the tool by the final pull request, not the conversational journey. His core philosophy centres on the `CLAUDE.md` file as the agent's "constitution," treating it as a curated set of guardrails rather than a comprehensive manual. The author advocates for starting small and documenting based on what Claude gets wrong, avoiding bloated context windows by pitching the agent on *when* to read extensive documentation rather than embedding entire files.

  The post challenges several conventional wisdoms in the AI-IDE space. Shankar explicitly avoids custom subagents, despite their theoretical power, arguing that they gatekeep context and force rigid, human-defined workflows. Instead, he leverages Claude's built-in `Task()` feature to spawn clones of the general agent, a "Master-Clone" architecture that preserves holistic reasoning while maintaining context efficiency. His stance on Skills versus MCP is particularly noteworthy: he has migrated almost all stateless tools to simple CLIs, reserving MCP only for complex, stateful environments like Playwright. The evolution from "Tool Calling" to "Scripting", where agents write code on the fly to interact with raw environments, represents a fundamental shift in thinking about agent autonomy. For enterprise teams, his hook implementation strategy is especially valuable: block-at-submit validation that forces test-and-fix loops at commit time rather than confusing the agent mid-plan with write-time blocks.

  The GitHub Actions integration emerges as perhaps the most underappreciated feature, enabling "PR-from-anywhere" workflows triggered from Slack, Jira, or CloudWatch alerts. His team has built a data-driven improvement flywheel where GHA logs reveal common mistakes and bash errors, feeding directly back into CLAUDE.md refinements and CLI improvements. This operationalisation transforms Claude Code from a personal productivity tool into a core, auditable engineering system, complete with philosophical questions about how many human reviewers should approve AI-initiated PRs generated directly from customer requests. The author's pricing insight is also pragmatic: switching from per-seat to usage-based enterprise API keys accounts for the massive 1:100x variance in developer usage patterns while enabling broader LLM experimentation across the organisation.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**The New Calculus of AI-based Coding**][2]. In this thought-provoking analysis, Joe Magerramov from Amazon Bedrock tackles a critical blind spot in the AI-assisted development conversation: what happens when your team's code velocity increases by an order of magnitude? His team's experience is quantifiable, roughly 80% of commits are AI-generated through what he terms "agentic coding" (deliberately avoiding the dismissive "vibe coding" label), resulting in throughput metrics that genuinely exceed those of typical high-velocity teams by a factor of 10. The catch? While AI agents can maintain similar bug probabilities per commit as human-written code, shipping commits at a 10x rate transforms what were once once-or-twice-yearly production incidents into weekly occurrences. His Formula 1 analogy lands perfectly: driving at 200mph requires massive downforce to keep the car on the track, and traditional software development infrastructure isn't designed for this velocity.

  Magerramov's core thesis challenges the prevailing "just add AI agents" approach by arguing that the entire software development lifecycle must evolve in concert with increased coding throughput. The cost-benefit calculus has fundamentally shifted, testing strategies that were "sound in principle but too expensive to implement" suddenly become practical when AI agents can generate and maintain comprehensive fake implementations of external dependencies for build-time integration tests. His team now runs a full distributed system validation with authentication, storage, chain replication, and inference engine fakes spinning up locally during builds, something that took "just a few days to implement for a relatively complex system" versus the previous years-long resistance. The CICD pipeline transformation is equally critical: when you're producing dozens of commits per hour instead of per day, problematic issues must be identified, isolated, and reverted in minutes rather than hours, requiring build and test infrastructure that's an order of magnitude faster than current industry standards.

  The team coordination bottleneck might be the most underappreciated constraint. When throughput increases tenfold, teams aren't just writing more code; they're making more architectural decisions, and at high velocity, these decisions begin to interact in unexpected ways. Engineer A refactors authentication flows while Engineer B extends dependent APIs, creating constant potential conflicts that traditional coordination mechanisms (Slack responses, scheduled syncs) can't resolve without introducing crippling latency. Magerramov's solution is refreshingly analogue: his team sits on the same floor, enabling quick whiteboard sessions that align approaches in minutes rather than creating bottlenecks of blocked work. He candidly admits this doesn't solve the distributed team problem, leaving it as "an open challenge." The restaurant kitchen metaphor resonates; what appears to be chaos to outsiders is actually a continuous stream of coordination that enables peak performance without compromising quality. The real opportunity isn't just faster code generation, but using AI to make previously impractical engineering practices practical, creating a virtuous cycle where the same agents increasing throughput also build the infrastructure needed to sustain it.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**How to Use New Claude Code Sandbox to Autonomously Code (Without Security Disasters)**][3]. Joe Njenga, in this post, tackles the fundamental tension in AI-assisted development between productivity and security, introducing Claude Code's sandbox mode as the solution to what he calls "approval fatigue." The problem is brutally simple: traditional permission systems treat every action as equally risky, forcing developers to click through 100+ permission prompts per session. Reading "Allow" for creating project files has the same friction as accessing SSH keys. After the 20th prompt, humans stop reading and start clicking "yes" mindlessly, completely defeating the security mechanism. The alternative, `--dangerously-skip-permissions` flag, removes all guardrails entirely, granting Claude unrestricted system access in what Njenga memorably terms "autonomous coding without guardrails." Sandbox mode resolves this binary choice by enforcing boundaries at the kernel level using Linux `bubblewrap` or macOS `Seatbelt`, the same security primitives protecting containers and system services. Instead of prompting for individual actions, you configure boundaries once: Claude works autonomously within your project directory, accesses pre-approved domains like npm registries, and only triggers prompts when crossing defined boundaries.

  The implementation details reveal sophisticated threat modelling rarely discussed in AI coding tool marketing. Sandbox mode explicitly protects against prompt injection attacks (malicious instructions hidden in code comments that manipulate Claude's behaviour), supply chain attacks (compromised packages attempting credential exfiltration), and accidental destructive operations. Enforcement occurs before actions execute. When Claude tries to access files outside the sandbox, the OS blocks it before the file is opened; unauthorised network connections are intercepted at the socket level. Njenga provides extensive copy-paste configurations for React/Next.js projects, Node.js backends, Python data science workflows, and monorepos, each striking a balance between autonomy and protection. For instance, React configurations allow full source access and CDN connections, while blocking environment variables and suspicious paste sites. Python configurations permit notebook manipulation and PyPI access, while protecting raw datasets from modification. The permission evaluation order matters critically: deny rules override allows, enabling patterns like "read all of ./src/ EXCEPT ./src/secrets.js."

  What strikes me most about this approach is how it inverts the traditional security mental model. Instead of asking "what should we allow?", sandbox mode starts with "what must we protect?" and grants everything else by default within boundaries. The 84% reduction in prompts (from 100+ to ~16 per session) isn't just a matter of convenience; it's a recognition that security theatre can create actual security vulnerabilities through habituation. However, Njenga's candid admission that Windows lacks native sandbox support (requiring Docker workarounds) and that distributed teams face unsolved coordination challenges suggests we're still in early innings. The real test will be whether teams actually maintain these configurations as projects evolve, or if they gradually accumulate "just this once" exceptions that recreate the permission fatigue problem at a different layer. His upcoming course on advanced workflows hints at emerging patterns we haven't yet standardised—the current configuration examples feel more like starting points than settled best practices.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Magentic Marketplace: an open-source simulation environment for studying agentic markets**][4]. This post by Microsoft Research introduces Magentic Marketplace, an open-source simulation environment designed to study how AI agents might reshape digital commerce through automated discovery, negotiation, and transactions. The research team, spanning economists, AI researchers, and engineers, argues that while customer-facing agents like OpenAI's Operator and business tools like Shopify Sidekick hint at an agentic future, the fundamental market structure remains uncertain. We could see one-sided markets with only customer or business agents, walled gardens with tightly controlled interactions, or open two-sided marketplaces where agents transact freely across ecosystems. Each path entails different trade-offs in terms of security, openness, and competition, which will fundamentally shape the value flows in the digital economy. The critical gap is that most AI agent research examines isolated scenarios, such as single agents completing tasks or pairs negotiating simple transactions. However, real markets involve numerous agents simultaneously searching, communicating, and transacting, creating complex dynamics that can't be understood through isolated study.

  The platform's architecture reveals sophisticated design choices that mirror real-world constraints. Built on an HTTP/REST client-server architecture with agents as independent clients and the marketplace as the central server, it utilises a minimal three-endpoint protocol (register, protocol discovery, and action execution) that allows for dynamic capability discovery without disrupting existing experiments. The rich action protocol supports complete transaction lifecycles, including search, negotiation, proposals, and payments, with extensibility for future capabilities like refunds and reviews. Experiments using a fully synthetic data modelled 100 customers and 300 businesses across scenarios like food ordering and home improvement services, testing both proprietary models (GPT-4o, GPT-4.1, GPT-5, Gemini-2.5-Flash) and open-source alternatives (GPTOSS-20b, Qwen3-14b, Qwen3-4b-Instruct-2507). Consumer welfare, defined as the sum of utilities across completed transactions, served as the key performance metric; however, the researchers acknowledge that this simplified framework should be extended with richer measures that capture real welfare, fairness, and societal considerations.

  The experimental findings expose critical vulnerabilities that challenge the optimistic narrative around agentic markets. While GPT-5 achieved near-optimal performance under realistic discovery conditions, demonstrating sophisticated information-gathering capabilities, most models exhibited a pronounced "Paradox of Choice" effect; consumer welfare actually declined as search result limits increased from 3 to 100 options. Gemini-2.5-Flash performance dropped from 1,700 to 1,350, despite contacting over 100 businesses, and GPT-5 fell from nearly optimal 2,000 to 1,400. Claude Sonnet 4 showed the steepest decline (1,800 to 600), struggling with larger option sets and frequently contacting businesses that didn't offer the requested services. This combination of poor initial selection and premature search termination reveals both inadequate decision-making criteria and insufficient exploration strategies, potentially due to a limited understanding of long-term context. Manipulation resistance varied drastically: Sonnet-4 resisted all attacks while GPT-4o, GPTOSS-20b, and Qwen3-4b proved extremely vulnerable to prompt injection, with all payments redirected to manipulative agents. Even traditional psychological tactics, such as authority appeals and social proof, have been compromised by open-source models. Perhaps most concerning, all models exhibited a systematic "first-offer acceptance" bias, prioritising immediate selection over comprehensive exploration and potentially missing superior alternatives; a behaviour that incentivises businesses to compete on response speed rather than quality, fundamentally distorting market incentives.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Anthropic Just Solved AI Agent Bloat — 150K Tokens Down to 2K (Code Execution with MCP)**][5]. Joe Njenga, in this post, breaks down Anthropic's newly released guide that fundamentally reshapes AI agent architecture by treating MCP servers as code APIs rather than traditional tool-calling endpoints, achieving a staggering 98.7% reduction in token consumption. From 150,000 tokens down to just 2,000 for complex workflows. The problem Njenga identifies is one plaguing every production agent deployment. When you connect agents to dozens or hundreds of tools through MCP servers, every single tool definition gets loaded into the context window upfront before the agent takes any action, creating what he calls a "500-page instruction manual before making a simple phone call." Each tool definition includes its purpose, the parameters it accepts, expected input formats, and the return values it provides. Multiply that by 50-200 tools, and you're burning massive token budgets before your agent even starts working. Worse, every intermediate result from chained tool calls flows back through the context window, so a workflow requiring 10-30 tool calls passes enormous data volumes back and forth, creating three critical headaches: spiraling costs (workflows that should cost pennies end up costing dollars), increased latency (more tokens equal slower processing), and hard context limits (you run out of space for actual tasks).

  The code execution approach inverts this entirely by having agents write code that imports only the necessary tools and processes all intermediate data within the execution environment, returning only the final results to the model. Njenga's Salesforce example crystallises the difference: traditional tool calling loads all Salesforce definitions (thousands of tokens), calls the search tool, gets 1,000 records through context (50,000 tokens), calls the filter tool, gets filtered results through context, calls the summary tool, and finally receives the summary; seven separate context round-trips with massive data payloads. Code execution consolidates this into a single execution where the agent writes code importing the Salesforce module, searches/filters/summarises in a single run with all 1,000 records processed in the environment, and returns only the final summary object (possibly 100 tokens) to the model. The intermediate data never interacts with the model's context; it all occurs within the code execution environment. The seven key benefits extend beyond token efficiency: progressive tool discovery (agents can search for specific functionality only when needed rather than memorising entire catalogs), in-environment data processing (filter 10,000 spreadsheet rows down to five relevant ones before passing to model), better control flow (50 operations in one execution instead of 50 round-trips), privacy advantages (sensitive data flows through workflows without entering model context), state persistence (checkpoint progress and resume later), and reusable skills (complex multi-step operations become single function calls documented in `SKILL.md` files).

  What strikes me about this architecture is how it mirrors the shift we've already seen from monolithic to microservices; except here we're moving from "model-does-everything" to "model-orchestrates-code." The trade-off is fundamental, though: you now need secure code execution environments with proper sandboxing, resource limits, and monitoring, infrastructure overhead that traditional tool calling avoids entirely. However, Njenga's framing reveals a critical inflexion point: this approach becomes essential when agents need access to dozens of services, run complex multi-step workflows with data transformation, operate in production at scale with real users, or handle long-running tasks that require state persistence. For simple agents with 3-5 tools and straightforward workflows, traditional tool calling remains a practical approach. The more profound implication here is that we're witnessing agent architectures stratify into two distinct classes: lightweight conversational agents that can operate entirely within context windows and heavy-duty production agents that require full programming environments to operate efficiently. This isn't just an optimisation; it's a fundamental rethinking of where computation happens in agentic systems, shifting from model-mediated tool orchestration to model-directed code generation. The 98% token reduction isn't the story—the story is that production AI agents are becoming compiler targets, and MCP servers are becoming their standard library.


## WIND (What Is Niels Doing)

Phew, if you thought I was busy before, buckle up. November and December are turning into an absolute whirlwind of community events, and I'm here for every chaotic minute of it.

![](/images/posts/dot-net-conf-text-1.png)

**Figure 1:** *.NET Conf 2025*

**Next Saturday** marks a milestone I'm genuinely excited about: Durban's [**first-ever .NET Conf**][11]. After years of this conference being absent from Durban, we're bringing it to Durban for the very first time. The prep work is in full swing: finalising speakers, coordinating logistics, and ensuring our partnership with [**Richfield College**][13] Umhlanga Campus delivers the experience our community deserves. This isn't just another tech event; it's proof that Durban can host world-class developer conferences, and I'm determined to make it memorable.

**But wait, there is more!**

![](/images/posts/banner-mcp-santa-clause-2-96px-1920-2.png)

**Figure 2:** *Season of AI - Merry Christmas People (MCP)*

However, apparently, prepping for one major event wasn't enough for me, as I've already kicked off planning for **December 13's "Data & AI Community Day Durban: Season of AI - Merry Christmas People (MCP)."** Yes, you read that right; we're combining holiday cheer with Model Context Protocol deep-dives, plus a sleigh-full of other AI goodies. Think festive vibes meet cutting-edge tech. If the December event sells out as fast as our previous "Ready Player 2" session did, we'll have a packed house of developers unwrapping the latest in agentic AI development right before the holidays.

Oh, and just to keep things interesting, I'm simultaneously crafting a presentation that I'll be delivering at the .NET Conf events in [**Cape Town (November 22) and Johannesburg (November 29)**][12]. So that's two cities, two presentations, and about three weeks to pull it all together while maintaining my weekly blog schedule and day job.

Some might call this overcommitted. I call it building the South African tech community one event at a time. Now, if you'll excuse me, I have slides to build and sponsors to chase. The conference grind never stops, but honestly? I wouldn't have it any other way.

*Phew indeed.*

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post or [ping][ma] me if you have suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

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

[1]: https://blog.sshh.io/p/how-i-use-every-claude-code-feature
[2]: https://blog.joemag.dev/2025/10/the-new-calculus-of-ai-based-coding.html
[3]: https://medium.com/@joe.njenga/how-to-use-new-claude-code-sandbox-to-autonomously-code-without-security-disasters-c6efc5e8e652?sk=v2%2Fb3ff5d0d-77d1-454d-95b4-575807353ea2
[4]: https://www.microsoft.com/en-us/research/blog/magentic-marketplace-an-open-source-simulation-environment-for-studying-agentic-markets/
[5]: https://medium.com/ai-software-engineer/anthropic-just-solved-ai-agent-bloat-150k-tokens-down-to-2k-code-execution-with-mcp-8266b8e80301?sk=v2%2F4d99c641-19d4-40f1-a0ac-a4fd750a2f1b
[11]: https://aimldatadurban.org/events/2025/dotnet-conf/
[12]: https://cptmsdug.dev/dotnet-conf-2025.html
[13]: https://www.richfield.ac.za/campus/umhlanga/#

