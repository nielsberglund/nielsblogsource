---
type: post
layout: "post"
title: Interesting Stuff - Week 20, 2025
author: nielsb
date: 2025-05-18T10:36:44+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-20-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-20-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - vibecoding
  - Data & AI Community Day Durban
  - Data & AI Community Day Joburg
  - Season of AI
  - AI Agents
  - Windsurf
description: "We dive this week into major advances in agentic AI, including Microsoft's ARTIST, OpenAI's Codex, and the fast-growing A2A and MCP protocols. We also explore top open source projects, real-world multi-agent implementations, and Windsurf's new SWE-1 models. Plus, a quick recap of my talk at Data & AI Community Day Joburg and a look ahead to the Durban event on May 24."
---

This week's roundup explores the cutting edge of agentic AI, from Microsoft's ARTIST framework and the rise of the A2A protocol to GitHub's top open source projects driving multi-agent innovation. We dive into real-world implementations with LangChain, Codex's leap into parallel coding, and Windsurf's SWE-1 models redefining the developer experience.

I also had a great time presenting **Vibe Coding: Where AI Handles the Syntax, and You Build the Future** at the [**Data and AI Community Day Joburg May 2025**][7], and now, all focus shifts to our Durban event on May 24. It's a packed week in AI, and the momentum shows no signs of slowing down.

<!--more-->

<!--
## Podcast

If you rather listen to the summary:



Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here]().
-->

## Generative AI

* [Microsoft Researchers Introduce ARTIST: A Reinforcement Learning Framework That Equips LLMs with Agentic Reasoning and Dynamic Tool Use][1]. In this post, Sana Hassan introduces ARTIST (Agentic Reasoning and Tool Integration in Self-improving Transformers), a groundbreaking framework developed by Microsoft Research that combines agentic reasoning, reinforcement learning (RL), and dynamic tool integration. ARTIST enables large language models (LLMs) to autonomously interact with external tools, such as code execution platforms and APIs, significantly enhancing their problem-solving capabilities. Unlike traditional models restricted by static inference and manual prompts, ARTIST dynamically chooses when and how to invoke these external resources, achieving impressive accuracy gains, notably outperforming GPT-4o by up to 22% on challenging mathematical benchmarks. The ARTIST framework is fascinating as it moves AI capabilities closer to human-like autonomy in complex reasoning tasks. The idea that LLMs can now independently decide their tool interactions—without step-by-step human supervision—opens exciting possibilities and significant challenges regarding oversight and transparency.
* [From MCP to multi-agents: The top 10 new open source AI projects on GitHub right now and why they matter][2]. This post by Jeimy Ruiz from the GitHub Blog dives into the hottest new open source AI projects lighting up GitHub, and more importantly, why they matter. It's a well-curated guide to what's shaping the future of AI tooling, from Model Context Protocol (MCP)-based integrations to multi-agent orchestration and portable AI containers. Projects like OWL show how agents move from solo performers to collaborative teams, while innovations like Letta provide a "Docker-for-agents" approach to AI portability. We also see creative intersections of AI with 3D design in Blender-MCP, and voice synthesis stepping up with tools like VoiceStar and CSM. What struck me in this roundup is the rapid emergence of MCP as a unifying standard. Think USB-C for AI, everything plugs in and works. That kind of integration power is critical if we're to build AI systems that aren't siloed but can orchestrate across services and environments. As developers, the opportunity here is massive: interoperability means more composability and faster innovation. Are we finally seeing the infrastructure emerge that allows us to build agentic systems as easily as web apps?
* [Empowering multi-agent apps with the open Agent2Agent (A2A) protocol][3]. In this post, Yina Arenas and Bas Brekelmans from Microsoft explore the Agent2Agent (A2A) protocol, a new standard designed to allow AI agents to securely and efficiently collaborate across platforms, clouds, and organisational boundaries. A2A is being integrated into Azure AI Foundry and Copilot Studio, enabling developers to build dynamic, composable, agentic systems that maintain governance and trust. With support for tools like Semantic Kernel and LangChain, and security layers including mutual TLS and Azure AI Content Safety, A2A is positioned as a critical backbone for next-gen intelligent applications. What excites me about A2A is the vision of software shifting from monolithic apps to swarms of cooperating agents. This protocol doesn't just make multi-agent communication possible; it formalises it in an observable, secure, and interoperable way. It's a pragmatic move that may finally break down silos across AI ecosystems. If you've experimented with agent-based systems before, this could be the glue that makes your setup production-ready. Are we heading toward a future where your data analyst agent chats with your customer support agent like colleagues over Slack? 
* [A2A + MCP + LangChain = Powerful Agent Communication][4]. Gao Dalie delivers in this post an in-depth tutorial on how to build a multi-agent chatbot that integrates Google's A2A (Agent2Agent) protocol, MCP (Model Context Protocol), and LangChain. The result? A powerful, real-time system where intelligent agents communicate with each other and intelligently select and invoke tools, like fetching stock prices and scraping financial news, based on the user's query. Gao walks us through every step: dynamic port allocation, setting up OpenAI agents, designing tools using yFinance and BeautifulSoup, converting them into LangChain-compatible components, and finally integrating them into a seamless meta-agent. I particularly appreciate how Gao doesn't just talk about agentic interoperability; he builds it and shares the code to prove it. This real-world application shows how far we've come from hardcoded APIs and brittle prompts. If you're developing with LangChain or are interested in building intelligent assistants that "think with tools," this guide is pure gold. It also raises a provocative thought: are we nearing a future where systems like these replace static dashboards with interactive, multi-agent financial analysts? What do you think—just clever demos or the start of a new UX paradigm?
* [AI Agents Now Write Code in Parallel: OpenAI Introduces Codex, a Cloud-Based Coding Agent Inside ChatGPT][5]. In this post, Asif Razzaq explores Codex, OpenAI's new cloud-native coding agent embedded directly into ChatGPT. Far beyond simple autocomplete, Codex can run tests, generate pull requests, fix bugs, and even understand your project's coding style and structure—all in isolated cloud sandboxes. The agent is powered by a specialised model, codex-1, that enables developers to offload parallel tasks and receive testable, context-aware code snippets, complete with diffs and terminal output. What really piqued my interest is the idea of agent-driven development—a shift from tooling that "assists" to agents that collaborate. This isn't just about faster coding; it's about redefining developer workflows. When you can tell an AI, "add input validation to this endpoint," and it returns a working patch aligned with your coding style, we're moving into a space where knowing what to build and why may matter more than knowing how to write every line.
* [Windsurf Wave 9][6]. Windsurf, formerly Codeium, has unveiled its Wave 9 update, introducing the SWE-1 family of AI models specifically designed for the software engineering lifecycle. This release marks Windsurf's transition from solely a tool provider to a developer of foundational AI models. The SWE-1 series comprises three distinct models: SWE-1: a full-scale model offering advanced reasoning and tool usage capabilities, available to paying users; SWE-1-lite: a lightweight version replacing the previous Cascade Base, accessible to all users and finally SWE-1-mini: an ultra-light model providing quick code predictions within the Windsurf Tab feature, also available to all users. These models are engineered to handle various aspects of software development, from coding and testing to documentation and deployment, aiming to accelerate the development process by up to 99%. Windsurf claims that the SWE-1 models perform comparably to leading AI models like Claude 3.5 and GPT-4.1 in software engineering tasks. The models are integrated into the Windsurf Editor, providing users with an AI-powered development environment. 

## WIND (What Is Niels Doing)

Yesterday (Saturday May 17), I had the pleasure of speaking at [**Data and AI Community Day Joburg May 2025**][7], where I presented my talk, **Vibe Coding: Where AI Handles the Syntax, and You Build the Future**. The room was packed (standing-room only!), and the energy was amazing. Seeing so many developers engaged and curious about how AI is reshaping the way we approach software development was great. Judging by the number of nods, laughs, and follow-up questions, it's safe to say the talk landed well!

Now, it's full steam ahead as I prep for our big Durban event, [**Data & AI Community Day Durban: Season of AI – The Age of Agency**][8], happening on May 24. The agenda is officially locked, and it's brimming with brilliant sessions covering everything from AI agents and the Model Context Protocol (MCP) to Microsoft Fabric, Vibe Coding, and beyond. I'm incredibly excited about the speaker lineup and can't wait to see our Durban community dive into the next wave of AI innovation. You can view all the details about the event below:

📌 **Event Details:**

* 📅 **Date:** May 24, 2025
* 🕘 **Time:** Registration from 08:00, kicking off at 08:20 sharp!
* 📍 **Venue:** [**Coastlands Umhlanga Hotel and Convention Centre**][9], 329 Umhlanga Rocks Drive, Umhlanga Ridge, Durban.
* 🌐 [**Event Info**][8]
* 🎤 [**Speakers**](https://aimldatadurban.org/events/2025/season-of-ai-agents-speakers/)
* 📖 [**Sessions**](https://aimldatadurban.org/events/2025/season-of-ai-agents-sessions/)
* 🔗 [**Agenda**](https://aimldatadurban.org/events/2025/season-of-ai-agents-agenda/)

I hope to see at the event. If you are in the area, please join us for a day of learning and networking with like-minded individuals.

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

[1]: https://www.marktechpost.com/2025/05/10/microsoft-researchers-introduce-artist-a-reinforcement-learning-framework-that-equips-llms-with-agentic-reasoning-and-dynamic-tool-use/
[2]: https://github.blog/open-source/maintainers/from-mcp-to-multi-agents-the-top-10-open-source-ai-projects-on-github-right-now-and-why-they-matter/
[3]: https://www.microsoft.com/en-us/microsoft-cloud/blog/2025/05/07/empowering-multi-agent-apps-with-the-open-agent2agent-a2a-protocol/
[4]: https://pub.towardsai.net/a2a-mcp-langchain-powerful-agent-communication-8bb692ed51d3?sk=v2%2Fa2a72c0b-be77-4420-9c85-297408bdc1e6
[5]: https://www.marktechpost.com/2025/05/16/ai-agents-now-write-code-in-parallel-openai-introduces-codex-a-cloud-based-coding-agent-inside-chatgpt/
[6]: https://windsurf.com/blog/windsurf-wave-9-swe-1
[7]: https://www.dataandaicommunity.co.za/events/JHB-202505.html
[8]: https://aimldatadurban.org/events/2025/season-of-ai-agents/
[9]: https://www.coastlands.co.za/umhlanga/