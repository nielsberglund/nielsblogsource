---
type: post
layout: "post"
title: Interesting Stuff - Week 43, 2025
author: nielsb
date: 2025-10-26T08:22:43+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-43-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-43-25.jpg"
categories:
  - roundup
tags:
  - streaming
  - generative AI
  - kafka
  - Netflix
  - Claude Web
  - dotnetconfsa
description: "Week 43, 2025: Anthropic's Claude Code for web autonomous coding agent, GitHub MCP Registry revolutionizes AI tool discovery, Netflix's real-time recommendation engine at scale, plus .NET Conf 2025 comes to Durban for the first time. CfS still open!"
---

Welcome to Week 43, 2025! This week's roundup explores the cutting edge of AI-assisted development and streaming infrastructure, from Anthropic's Claude Code for web revolutionising autonomous coding with smart sandboxing, to GitHub's new MCP Registry bringing order to the AI tooling chaos. 

We also dive into Netflix's engineering marvel that delivers real-time recommendations to over 100 million devices without melting their infrastructure. Plus, I'm excited to share my personal news: I've submitted talks to all three .NET Conf 2025 South Africa events, including the historic first-ever .NET Conf in Durban. The Call for Speakers is still open if you want to be part of this milestone moment for our developer community!

<!--more-->

## Generative AI

* [**Claude Code for web—a new asynchronous coding agent from Anthropic**][1]. **Simon Willison explores Anthropic's latest coding innovation** in this detailed walkthrough of Claude Code for web, the company's answer to OpenAI's Codex Cloud and Google's Jules. Launched on October 20th, this asynchronous coding agent brings the power of Claude Code CLI to a slick web interface at claude.ai/code (plus a shiny new tab in the iPhone app). The setup is refreshingly straightforward: point it at a GitHub repository, configure your network environment—from Fort Knox lockdown to wild west `*` access—and watch it churn through your coding tasks autonomously. The real party trick? While Claude Code for web is busy refactoring your mess, you can queue up additional prompts that execute sequentially, making it far more productive than the traditional "approve every keystroke" approach that kills developer flow faster than a meeting that could've been an email.

  Willison puts the tool through its paces with several real-world examples, including a fascinating MiniJinja-versus-Jinja2 performance benchmark that the agent designed, implemented, and visualised with matplotlib charts, all from a typo-laden mobile prompt (we've all been there). The post takes a deeper dive into what makes this launch particularly interesting: Anthropic's strategic focus on sandboxing as the key to safe autonomous coding. By implementing filesystem isolation and network restrictions via a proxy server, Claude Code for web tackles the notorious "lethal trifecta" attack vector head-on, cutting off data exfiltration routes that make prompt injection attacks truly dangerous. The agent includes three security modes—no network access for paranoid projects, trusted domains for dependency installation, and custom allow-lists for everything in between. It's a pragmatic acknowledgement that coding agents running in YOLO mode (`--dangerously-skip-permissions`, anyone?) are vastly more valuable than nanny-state bots requiring constant approval, but only if you can make them safe enough to actually trust with your repositories and secrets.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**How to find, install, and manage MCP servers with the GitHub MCP Registry**][3]. **Andrea Griffiths, in this post, tackles the chaos of discovering Model Context Protocol servers** with GitHub's elegant solution: a centralised MCP Registry that brings order to the AI tooling ecosystem. The blog opens with a relatable grocery store analogy, imagine cereal scattered across three aisles and milk hiding near self-checkout, which perfectly captures the previous state of MCP server discovery before GitHub launched its canonical registry. With 44 MCP servers currently available (including heavy hitters like Playwright for browser automation, GitHub's own 100+ tool server, and partner integrations from Notion, Unity, Firecrawl, and Stripe), developers finally have a single source of truth for finding and installing AI workflow connectors. The installation process is refreshingly simple: click "Install in VS Code," accept the pre-filled configuration. You're immediately ready to integrate MCP servers into your agentic workflows—no token wrestling required, thanks to OAuth handling for remote servers.

  The post delivers comprehensive guidance on publishing your own MCP servers using the MCP Publisher CLI, complete with step-by-step instructions for authentication (GitHub OAuth for io.github.* namespaces or DNS verification for custom domains), package verification across npm, PyPI, NuGet, and Docker, and automated publishing via GitHub Actions workflows. For enterprise teams managing sensitive data, Griffiths explains the registry allow list functionality that lets admins curate which MCP servers developers can install—a governance model that balances security compliance with developer autonomy. The roadmap teases exciting developments including self-publication capabilities arriving in the next couple months, expanded IDE support beyond VS Code, enhanced enterprise features for regulated industries, and bundled agentic workflows that transform raw API endpoints into simple, use-case-driven commands. The GitHub MCP Registry positions itself as the foundation for orchestrating AI-assisted development tools, moving beyond faster coding toward amplified developer impact through intelligent tool coordination.

## Streaming

* [**Behind the Streams: Real-Time Recommendations for Live Events Part 3**][2]. **The Netflix Technology Blog team dissects the engineering marvel** behind delivering real-time recommendations during record-breaking live events like the Crawford v. Canelo fight. The challenge Netflix engineers faced was simultaneously updating over 100 million devices for live streaming events without triggering a catastrophic "thundering herd effect" that would overwhelm their cloud infrastructure—imagine trying to whisper the same secret to 100 million people at exactly the same time without using a megaphone. Their ingenious solution split real-time recommendations into two phases: prefetching recommendations and metadata ahead of time (distributing load naturally as users browse their devices), then broadcasting low-cardinality messages at critical moments to trigger locally cached updates. This phased approach balanced three crucial constraints—time, request throughput, and compute cardinality—allowing Netflix to deliver updates to over 100 million devices in under 60 seconds during peak load while avoiding the resource-draining alternative of linear scaling.

  **Here's what fascinates me about this approach:** Netflix essentially gamified the latency problem by turning it into a constraint optimisation puzzle rather than just throwing more servers at it. Their architecture leverages a sophisticated two-tier pub/sub system built on Pushy (their WebSocket proxy), Apache Kafka, and a KV key-value store, with a Message Producer microservice centralising business logic and a Message Router handling low-latency fanout. But the real engineering gold emerged from unexpected discoveries during game-day simulations, like "mini thundering herds" appearing hours before and after events due to synchronised cache expirations, which they solved by adding jitter to TTLs. They also implemented adaptive traffic prioritisation that aggressively deprioritises non-critical server-driven updates during traffic spikes, resulting in significant declines in non-essential traffic volume. As Netflix expands into live sports, linear content, and gaming, this foundation for scheduled viewing experiences represents a critical infrastructure investment that extends far beyond boxing matches; it's the plumbing for the future of real-time streaming entertainment at unprecedented scale.

## WIND (What Is Niels Doing)

I'm thrilled to share that I've submitted a talk to all three .NET Conf 2025 South Africa events happening in **Durban, Cape Town, and Johannesburg**! This is particularly exciting because 2025 marks the **first time ever** that .NET Conf is coming to KZN and Durban. As someone passionate about the .NET ecosystem for years, being part of this historic moment for our local tech community is significant.

**Want to share your .NET knowledge?** The Call for Speakers (CfS) is **still open** across all three events! Whether you're a seasoned speaker or considering your first talk, now is the perfect time to submit your session. The .NET Conf is a fantastic platform to showcase your expertise, connect with the community, and help grow .NET development in South Africa.

**And if you're in Durban or nearby**, registration for the Durban event is **now open**! We still have some seats available, but they're filling up fast. This is your chance to be part of history, the first-ever .NET Conf in Durban. Don't miss out on this opportunity to learn from industry experts, network with fellow developers, and celebrate the arrival of this premier .NET event to our city. **Register today before seats run out!**

#### Event Details, CfS and Durban Registration

🌊 [**Durban Event Page** (Nov 15)][11] <br>
🎟️ [**Register for Durban (before it's too late!)**][14] <br>
🏔️ [**Cape Town Event Page** (Nov 22)][12] <br>
🌆 [**Johannesburg Event Page** (Nov 29)][12] <br>

👉 [**Submit your proposal**][10]

Let's make .NET Conf 2025 South Africa an unforgettable milestone for our developer community! 🚀

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

[1]: https://simonwillison.net/2025/Oct/20/claude-code-for-web/
[2]: https://netflixtechblog.com/behind-the-streams-real-time-recommendations-for-live-events-e027cb313f8f
[3]: https://github.blog/ai-and-ml/generative-ai/how-to-find-install-and-manage-mcp-servers-with-the-github-mcp-registry/
[10]: https://sessionize.com/net-conf-south-africa-2025
[11]: https://aimldatadurban.org/events/2025/dotnet-conf/
[12]: https://cptmsdug.dev/dotnet-conf-2025.html
[13]: https://www.richfield.ac.za/campus/umhlanga/#
[14]: https://www.quicket.co.za/events/341296-net-conf-2025-community-edition-south-africa-durban/?ref=link-campaign&lc=blog

