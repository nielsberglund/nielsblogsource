---
type: post
layout: "post"
title: Interesting Stuff - Week 31, 2025
author: nielsb
date: 2025-08-03T08:22:09+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-31-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-31-25.jpg"
categories:
  - roundup
tags:
  - Claude Code
  - OpenAI
  - Generative AI
  - NotebookLM
  - AI Coding
description: "Discover the latest AI breakthroughs transforming development and learning: OpenAI's Study Mode, LLM writing benchmarks, NotebookLM's video features, GitHub Copilot onboarding, and Claude's agent architecture. Plus insights from building with Claude Code."
---

This week's tech roundup reveals AI evolving from simple automation tools into sophisticated collaborative partners that understand how humans actually learn, write, and work. From OpenAI's Study Mode transforming ChatGPT into a patient Socratic tutor to Google's NotebookLM becoming a PowerPoint wizard, we're witnessing the emergence of AI systems designed for genuine partnership rather than replacement.

Meanwhile, GitHub Copilot's coding agent receives the proper onboarding treatment, and Claude's new agent architecture reveals the beautiful chaos of managing digital workforces where brilliant AI specialists can only communicate through you. These developments suggest we're finally cracking the code on making AI collaboration feel natural and productive rather than frustratingly robotic.

<!--more-->

## Generative AI

* [**Introducing study mode**][1]. OpenAI introduces "Study Mode" for ChatGPT in this post, a feature that transforms the AI from a homework-completing machine into something resembling a patient tutor who won't just hand you the answers. Available across all ChatGPT tiers starting July 29th, this new mode represents a fascinating shift in how we think about AI's role in education, moving from instant gratification to genuine learning facilitation.

  The brilliance lies in the implementation details. Under the hood, study mode leverages custom system instructions developed with teachers, scientists, and pedagogy experts to encourage active participation, manage cognitive load, and foster metacognition. Instead of spitting out complete solutions, it employs Socratic questioning, scaffolded responses, and personalised support that adapts to each student's skill level. The feature includes interactive prompts, knowledge checks, and the flexibility to toggle on and off mid-conversation, essentially creating what one student described as "a live, 24/7, all-knowing office hours."

  What's particularly interesting is OpenAI's honest acknowledgement of current limitations. They've chosen to implement this through system instructions rather than training it directly into their models, accepting some inconsistency in exchange for rapid iteration based on real student feedback. Future plans include clearer visualisations, goal tracking, and deeper personalisation. This feels like a significant step toward addressing the legitimate concerns about AI potentially undermining genuine learning. However, time will tell whether students actually prefer the more challenging path of guided discovery over instant answers.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**How to Choose the Best LLM for Writing**][2]. Fabio Chiusano, in this post, tackles one of the most pressing questions in AI-assisted writing: how do you choose an LLM that doesn't make everything sound like it was written by the same overly helpful robot? The piece dives deep into the notorious "AI-ese" phenomenon, that peculiar cocktail of words like "delve," "leverage," and "tapestry" that has become so prevalent it's spawned the "delve anomaly" in academic papers. The culprit? Reinforcement Learning with Human Feedback (RLHF), where human trainers inadvertently taught AI models to amplify their own linguistic quirks.

  The real meat of this analysis lies in Chiusano's comprehensive breakdown of modern LLM evaluation methods. Moving beyond the limitations of static benchmarks like MMLU (which models have essentially "beaten"), the post explores the evolution toward AI-judged evaluations and specialised writing benchmarks. The EQ-Bench suite emerges as particularly fascinating, measuring everything from emotional intelligence through role-play scenarios to creative writing prowess and long-form narrative consistency. These benchmarks reveal surprising insights, like how a model's ability to navigate messy human arguments correlates strongly (r=0.94) with its performance on academic tests.

  Here's where it gets interesting: the post reveals that emotional intelligence might be the secret sauce for better AI writing. Models that excel at understanding social dynamics and empathy consistently outperform others across multiple writing tasks. However, Chiusano wisely cautions that benchmarks are starting points, not gospel, prompt sensitivity can dramatically alter results, and the ultimate test remains hands-on experimentation with your specific use case. For developers and writers overwhelmed by LLM choices, this analysis offers a much-needed roadmap for matching models to writing tasks. However, it also highlights how much the field still resembles an ongoing "arms race" between improving models and evolving evaluation methods.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**What’s new in NotebookLM: Video Overviews and an upgraded Studio**][3]. This post by Google's Shan Wang and Usama Bin Shafqat announces NotebookLM's expansion into video territory, marking a significant evolution from its popular Audio Overviews feature. The new Video Overviews take the form of narrated slides, essentially transforming complex documents into AI-generated presentations complete with visuals, diagrams, and data pulled from your source materials. Think of it as your research assistant finally learning to use PowerPoint—and doing it surprisingly well.

  The real game-changer here isn't just the video format itself, but the customisation capabilities that come with it. Users can specify learning goals, target audiences, and focus areas, allowing for highly tailored content creation. Want a beginner-friendly explanation of quantum physics diagrams? Done. Need an expert-level deep dive for your specialised team? Also covered. This level of personalisation suggests Google is positioning NotebookLM as more than just a research tool; it's becoming a comprehensive content creation platform that adapts to different knowledge levels and use cases.

  Perhaps even more significant is the revamped Studio panel that now allows multiple outputs of the same type per notebook. This seemingly simple change unlocks powerful workflows: creating multilingual Audio Overviews for global accessibility, generating role-specific content for different team members, or building chapter-by-chapter study materials. The ability to multitask within the Studio, listening to an audio overview while exploring a mind map, hints at Google's vision of AI-assisted learning as an immersive, multimedia experience rather than a linear, single-format process. For researchers and content creators drowning in information overload, this update represents a meaningful step toward AI that doesn't just process content but actively helps reshape it for human consumption.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Onboarding your AI peer programmer: Setting up GitHub Copilot coding agent for success**][4]. Author Christopher Harrison, in this post, treats GitHub Copilot's coding agent like what it essentially is: a new team member who needs proper onboarding to be productive. The post walks through the systematic approach of setting up the Copilot coding agent for success, drawing clever parallels to how you'd orient any new developer. When you assign an issue to this AI teammate, it follows a predictable workflow—creating branches, pull requests, exploring codebases, and iterating toward solutions—all without requiring coffee breaks or complaining about legacy code.

  The technical meat of the guide focuses on environment configuration through GitHub Actions workflows and the strategic use of custom instructions. Harrison emphasises creating a `.github/workflows/copilot-setup-steps.yml` file that ensures Copilot has access to all necessary tools and dependencies, much like setting up a development environment for human developers. The custom instructions system is particularly intriguing, supporting both repository-wide guidelines (`copilot-instructions.md`) and file-specific rules (`<file-name>.instructions.md`) that help encode institutional knowledge that's usually just "known" by experienced team members. The post includes practical examples, like documenting that "rectangle" is always abbreviated as "rect" in a particular framework—the kind of tribal knowledge that trips up new developers.

  What sets this guide apart is its emphasis on extending Copilot's capabilities through Model Context Protocol (MCP) servers, allowing the AI to interact with external services and gather additional context. The firewall management section addresses legitimate security concerns about data exfiltration while providing flexibility for teams that need internet access. Harrison's approach treats AI integration not as a replacement for good development practices, but as an amplifier, emphasising that clear documentation, well-structured projects, and explicit issue descriptions benefit both human and AI team members. It's a refreshingly pragmatic take that acknowledges AI agents work best when they're given the same foundational support we'd provide to any new developer joining the team.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Vibe Check: Claude’s New Agents Are Confusing as Hell—And We Love Them**][5]. Katie Parrott, in this post, captures the wonderfully messy reality of testing Claude's new agent system during Every's company retreat, complete with midnight debugging sessions and existential crises about AI architecture. The piece follows two engineers, Kieran and Danny, as they attempt to create "agents that create other agents" in what amounts to a very on-brand tech company afterparty. What emerges is both hilarious and revealing: Claude's agents are powerful but operate in isolation, like brilliant specialists who can only communicate through their manager (you), and nobody knows how the printer works.

  The technical reality Parrott uncovers is fascinatingly counterintuitive. While you'd expect AI agents to work like a coordinated team sharing context and building on each other's work, Claude's implementation keeps each agent in its own context window, completely isolated from its digital colleagues. This design choice prevents agents from stepping on each other's toes, but also means they can't use basic slash commands or coordinate directly. The result is an architecture where slash commands serve as orchestrators that spawn and direct agents, but the agents themselves are more like specialised employees than autonomous collaborators. It's simultaneously limiting and liberating, depending on your use case.

  What makes this piece particularly valuable is its honest portrayal of bleeding-edge technology in action—not the polished demo version, but the "Why isn't this working?" reality that actually ships. Parrott's narrative reveals the fundamental shift happening in programming: engineers are evolving from individual contributors to managers of digital workforces. Kieran's eventual deployment of more agents than Every has human employees hints at a future where success depends less on coding skills and more on orchestrating swarms of specialised AI workers. It's the kind of authentic, in-the-trenches reporting that captures not just what's possible, but what it actually feels like to work with these systems when the documentation is sparse and the paradigms are still being invented.




## WIND (What Is Niels Doing)

A couple of weeks ago I launched a comprehensive blog series documenting his journey to build a custom contact and event management system using Claude Code, Anthropic's AI-assisted command-line development tool. A wee (or so) ago I posted the first part of the series:

* [**Building an Event Management System with Claude Code: Claude Code Installation and Initialisation**][6]. This post walks through Claude Code installation and setup on both Mac and Windows (via WSL), complete with authentication flows and initial configuration, before demonstrating the tool's capabilities by creating a simple `Node.js` "Hello World" application that showcases Claude Code's planning, file creation, and collaborative development process.

I am currently working on the second post in the series, which will cover how to set up Claude Code with your IDE of choice (is there anything other than VSCode :smile:) for a more seamless development experience.

Additionally, I am developing a dedicated resource page with curated links for Claude Code resources (think "Tips & Tricks") yet to be published. I have also created a comprehensive Claude Code [**YouTube playlist**][7] for additional learning materials and tutorials. I will add resources and YouTube videos to the resource page and YouTube playlist as I come across them.

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

[1]: https://openai.com/index/chatgpt-study-mode/ 
[2]: https://pub.towardsai.net/how-to-choose-the-best-llm-for-writing-4d2741d900f8?sk=v2%2F83613c6f-7c5e-4ad2-b04c-6f97ce809ca9
[3]: https://blog.google/technology/google-labs/notebooklm-video-overviews-studio-upgrades/
[4]: https://github.blog/ai-and-ml/github-copilot/onboarding-your-ai-peer-programmer-setting-up-github-copilot-coding-agent-for-success/
[5]: https://every.to/vibe-check/vibe-check-claude-s-new-agents-are-confusing-as-hell
[6]: https://nielsberglund.com/post/2025-07-29-building-an-event-management-system-with-claude-code-claude-code-installation-and-initialisation/
[7]: https://www.youtube.com/playlist?list=PLratGHE9a0TQfk9Qo5WLnTyttfpoWOjNZ
