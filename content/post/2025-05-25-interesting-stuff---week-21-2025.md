---
type: post
layout: "post"
title: Interesting Stuff - Week 21, 2025
author: nielsb
date: 2025-05-25T12:32:50+02:00 
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-21-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-21-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - vibecoding
  - Data & AI Community Day Durban
  - Season of AI
  - AI Agents
  - SQL Server 2025
  - streaming
  - kafka
description: "This week's post covers major AI and data developments, including SQL Server 2025's AI integration, new autonomous coding agents, and real-time system architecture at scale. It also includes a behind-the-scenes look at our successful Data & AI Community Day Durban event."
---

This week's roundup explores some of the most exciting developments in the AI and data space - from SQL Server 2025 becoming an AI-native database to the rise of autonomous coding agents like OpenAI Codex and GitHub Copilot's Agent Mode. 

We explore how AI models are learning to reason more effectively, build agentic systems from scratch, and scale real-time infrastructure like Dream11's Kafka-powered backend. I also share a behind-the-scenes look at our sold-out [**Data & AI Community Day Durban: Season of AI – The Age of Agency**][9] event, which was a huge success.

<!--more-->

<!--
## Podcast

If you rather listen to the summary:



Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here]().
-->

## SQL Server

* [SQL Server 2025 - AI ready enterprise database from ground to cloud][4]. In this detailed post by Venkata Raj Pochiraju from Microsoft, readers are introduced to the groundbreaking features of SQL Server 2025, designed as a comprehensive, AI-ready enterprise database. The new SQL Server release integrates seamlessly from on-premises setups to cloud infrastructures and Microsoft Fabric, redefining how organizations can leverage data through enhanced AI capabilities. Key highlights include a native vector data type facilitating efficient hybrid AI vector searches, built-in support for Retrieval-Augmented Generation (RAG) applications, and AI Agent functionalities via familiar T-SQL syntax. Including advanced vector indexing (leveraging Approximate Nearest Neighbors), native JSON support, regular expression queries, and external REST endpoint invocation promises transformative potential for developers and businesses alike. Notably, SQL Server 2025 also significantly bolsters data security and encryption standards, reflecting evolving compliance and security requirements. This development is particularly intriguing because it symbolizes a shift in the role of the traditional database from mere data storage towards becoming a proactive participant in AI-driven decision-making processes. How will this shift impact the roles of database administrators and developers in your organizations? Are we prepared for databases to increasingly drive rather than support AI initiatives?

## Generic AI

* [Introducing Codex][1]. This OpenAI post introduces Codex, their latest multi-agent coding assistant powered by the new codex-1 model (based on o3), optimized for collaborative software development. Codex can read your codebase, propose fixes, write new features, run tests, and even generate pull requests - all from isolated cloud environments. Developers interact via ChatGPT's UI or the new Codex CLI, while AGENTS.md files give Codex crucial context to operate effectively. What's fascinating here is the promise of asynchronous coding collaboration with AI - where you assign multiple scoped tasks, and Codex works in parallel, citing terminal logs and test results for transparency. This isn't just Copilot++. It's shaping up to be your team's AI engineer.
* [Why We Think][3]. This massive post by Lilian Weng takes a deep dive into how and why we want LLMs to "think" at test time - especially through techniques like Chain-of-Thought (CoT), adaptive computation, and reasoning tokens. Drawing analogies to human cognition (think Kahneman's System 1 vs System 2), Weng surveys everything from latent variable modelling and CoT scaling laws to self-correction learning, reward hacking, and external tool use (like code execution during reasoning). I absolutely loved framing "test-time compute" as thinking time and how larger models benefit disproportionately from it. But what stuck with me most was this: the emergence of the "aha moment" in RL-trained models that self-reflect and correct past mistakes. Are we now seeing models not just reason but learn to reason better? If so, how do we ensure that reasoning remains faithful—not just effective?
* [GitHub Copilot: Meet the new coding agent][5]. GitHub, in this post, reveals a major leap forward in developer tooling: the introduction of the GitHub Copilot coding agent. This isn't just autocomplete-on-steroids - it's a full-fledged background agent that spins up a secure dev environment via GitHub Actions, analyzes your codebase, and iteratively pushes commits to a draft pull request as it implements assigned GitHub issues. Developers can now assign tasks directly to Copilot (even via chat!) and track progress through rich session logs and agent commentary. What's game-changing is the integration of Model Context Protocol (MCP) and RAG-powered understanding. Copilot can follow instructions and reason across past issues, pull request discussions and even interpret screenshots of bugs. And yes, it can revise its own work based on your comments. This update marks the shift from "Copilot as a pair programmer" to "Copilot as a junior engineer on your team." But it raises a question: how far are we from this being more than just a helper? When does an agent like this become responsible for its work—or does that always stay on us humans? As we embrace agentic workflows, where does trust in automation begin, and where should it end?
* [How to Build Agentic AI Systems from Scratch?][6]. In this practical and well-structured post, Ali Hamza demystifies the process of building agentic AI systems—autonomous entities capable of perceiving, reasoning, and taking action - by walking through a clear end-to-end development pipeline. From defining your problem to setting up the development environment and integrating perception, reasoning, and execution components, this guide lays down actionable steps for building everything from trading bots to web automation agents. Ali breaks the system into three core layers: Perception (data intake via APIs, sensors), Reasoning (decision-making via RL or LLMs), and Action Execution (via APIs or automation tools like Selenium). There's even a useful nod to deploying via Docker. It's like building your own baby Jarvis with Python and a few pip installs. What stood out to me is how achievable agentic systems now feel. This wasn't a theoretical paper - it's a weekend project starter kit for devs who want to explore AI autonomy. But here's the discussion spark: while the tech is approachable, are we teaching developers enough about the responsibility that comes with automation and autonomy? Coding an agent is one thing - ensuring it acts ethically and safely is another.
* [The Hidden Power of MCP + Google ADK — A Guide to Building Systems That Scale][7]. In this post, Subhadip Saha explores how Model Context Protocol (MCP) and Google's Agent Development Kit (ADK) can supercharge the development of scalable, secure, and truly agentic AI systems. MCP bridges AI models and the real world - handling external interactions like database queries or API calls - while ADK gives developers a modular, Python-based framework to orchestrate agents, tools, and workflows. The post walks through everything from architecture fundamentals to implementation, including a practical example of building a weather-checking agent. It emphasizes modularity, multi-agent orchestration, real-world use cases (like customer support and smart homes), and even performance tips like caching and async I/O. Consider MCP + ADK as the clean API + workflow automation layer that lets AI agents become practical, actionable, and composable systems. What I found particularly compelling is how this combo enables AI systems to move from "chatty assistant" to "functioning teammate." With MCP abstracting tool access and ADK handling orchestration, we now have the plumbing to scale agent behaviour reliably. But here's the thought: as AI agents get better at connecting and acting, who becomes accountable for their decisions? The infrastructure is clean - but governance may be the next big challenge.
* [Agent mode 101: All about GitHub Copilot’s powerful mode][8]. In this hands-on overview, Alexandra Lietzke explains what GitHub Copilot Agent Mode is, how it differs from the newer asynchronous coding agent, and why it's a game-changer for real-time, synchronous development. Agent Mode acts like a junior developer on your team - analyzing your codebase, planning and executing multi-step changes, running tests, fixing errors, and iterating independently - all guided by your high-level prompt. This post gives a clear walkthrough of how Agent Mode works under the hood: a backend system prompt augments your request, tools like read_file, edit_file, and run_in_terminal power its actions, and the whole thing loops until a successful outcome is reached. It can also integrate with Model Context Protocol (MCP) servers, enabling powerful external tool interaction (e.g., automating GitHub workflows or fetching issue data). The real value here is how Agent Mode elevates GitHub Copilot from a passive code helper to an active autonomous collaborator. Whether you're prototyping, migrating stacks, or modernizing legacy code, it's a workflow accelerator. That said, the prompt still matters - your agent is only as clear as your instructions. The future looks increasingly agentic, but the interface (human-AI communication) may remain the real frontier.

## Streaming

* [Powering Fantasy Sports at Scale: How Dream11 Uses Apache Kafka for Real-Time Gaming][2]. In this concise and powerful post, Kai Waehner unpacks how Dream11, India's largest fantasy sports platform, uses Apache Kafka to deliver seamless, real-time gameplay to over 230 million users. The stakes are high: millions of concurrent users, 44TB of data processed daily, and traffic spikes timed to the start of live matches. Kafka plays a central role, enabling low-latency data streaming, real-time scoring updates, fraud detection, and smooth gameplay - at a scale that rivals global tech giants. What sets Dream11 apart is their engineering innovation. They developed a custom Java-based Kafka consumer library to overcome challenges around offset management, rebalancing, and throughput under peak load. This abstraction layer boosted developer productivity and allowed the backend to scale with confidence during moments of extreme concurrency, such as IPL match kickoffs. Here's what resonated: fantasy sports isn't just a fun application - it's a real-time systems masterclass. Dream11's platform architecture highlights how mission-critical Kafka has become in domains where milliseconds = money. This makes me wonder: will every competitive edge in consumer tech ultimately be decided by who streams data better, faster, and smarter?

## WIND (What Is Niels Doing)

Yesterday, we held [**Data & AI Community Day Durban: Season of AI – The Age of Agency**][9], and I'm still buzzing from the experience. With over 200 attendees, the venue was alive with excitement, curiosity, and some seriously great hallway conversations. The feedback has been overwhelmingly positive - people were raving about the sessions, the networking, and the overall energy of the event. It's always a thrill to see a room full of genuinely engaged and inspired people, and this one was no exception.

Beyond organizing the event (which is a feat on its own!), I also gave my talk, "**Vibe Coding: Where AI Handles the Syntax, and You Build the Future.**" The room was packed, and judging by the crowd's reactions and early feedback, it resonated nicely. I've started collating the session evaluations and should have the full results ready later today or tomorrow, but here's a quick peek: the event scored an average of **6.68/7**, the sessions landed at an average of **6.46/7**, and the speaker ratings averaged **6.51/7**. To say I'm ecstatic is a massive understatement - those numbers are fantastic and a real testament to the amazing community (both attendees and speakers) we have here in Durban!

I want to extend a heartfelt **THANK YOU** to everyone who attended, spoke, and helped make this event a success. Your enthusiasm and engagement are what make these events worthwhile. And a special shoutout to our sponsors for their support - we couldn't have done it without you!

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

[1]: https://openai.com/index/introducing-codex/
[2]: https://www.kai-waehner.de/blog/2025/05/19/powering-fantasy-sports-at-scale-how-dream11-uses-apache-kafka-for-real-time-gaming/
[3]: https://lilianweng.github.io/posts/2025-05-01-thinking/
[4]: https://techcommunity.microsoft.com/blog/sqlserver/sql-server-2025---ai-ready-enterprise-database-from-ground-to-cloud/4413529
[5]: https://github.blog/news-insights/product-news/github-copilot-meet-the-new-coding-agent/
[6]: https://medium.com/@ali_hamza/how-to-build-agentic-ai-systems-from-scratch-22c33999df91
[7]: https://pub.towardsai.net/the-hidden-power-of-mcp-google-adk-a-guide-to-building-systems-that-scale-773463e0284a?sk=v2%2F49da747f-4a9b-4001-8084-9f1d448c2544
[8]: https://github.blog/ai-and-ml/github-copilot/agent-mode-101-all-about-github-copilots-powerful-mode/
[9]: https://aimldatadurban.org/events/2025/season-of-ai-agents/
