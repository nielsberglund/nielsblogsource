---
type: post
layout: "post"
title: Interesting Stuff - Week 23, 2025
author: nielsb
date: 2025-06-08T08:11:28+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-23-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-23-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - AI Coding
  - MCP
  - Github Copilot
description: "This week's tech discoveries reveal how AI is becoming our most powerful collaborative partner, transforming everything from data visualization and coding workflows to API interactions through revolutionary tools like GitHub Copilot's autonomous agents, Microsoft's Data Formulator 2, and the emerging Model Context Protocol. The common thread? AI isn't replacing human creativity; it's amplifying it by handling repetitive tasks while freeing engineers for innovation, strategy, and uniquely human problem-solving. Welcome to an era where the most successful engineers will be those who master the art of human-AI collaboration."
---

🚀 The future of engineering is here, and it's not about replacement; it's about radical transformation through AI partnership. This week's discoveries reveal how AI is becoming our most powerful collaborative partner, from Mistral's intelligent agents and GitHub Copilot's autonomous coding teammates to Microsoft's revolutionary data visualisation tools and the emerging Model Context Protocol that's reshaping how AI systems interact with external resources.

What is the common thread across all these developments? AI isn't replacing human creativity—it's amplifying it by handling the repetitive while freeing us for innovation, strategy, and the uniquely human aspects of problem-solving. Welcome to an era where the most successful engineers will be those who master the art of human-AI collaboration. 🤖✨

<!--more-->

## Generative AI

* [**The future of engineering belongs to those who build with AI, not without it**][1]. Rizwan Patel, in this post, challenges the doom-and-gloom narrative around AI replacing engineers, arguing that Marc Benioff's announcement about Salesforce not hiring engineers in 2025 due to AI productivity gains has been widely misinterpreted. Rather than signalling the end of engineering jobs, Patel contends we're witnessing a fundamental transformation of engineering work itself.

  The post examines how AI is transforming engineering across four key capabilities: summarising complex codebases and documentation, inferring patterns and suggesting optimisations, converting code between programming languages, and expanding through novel content creation. Patel illustrates these transformations with real-world examples from healthcare, pharmaceutical manufacturing, and banking, where AI enhances rather than replaces human expertise.

  The piece identifies emerging specialisations, such as LLMOps (Large Language Model Operations) and platform engineering, as the new frontier for engineers who want to stay relevant. Patel emphasises that successful AI integration requires robust governance frameworks, security-first approaches, and an understanding of the spectrum of human-AI collaboration—from simple recommendations to fully autonomous systems.

  What strikes me most about this analysis is Patel's vision of a "symbiotic" future between engineers and AI systems. While today's AI lacks true understanding and relies heavily on human guidance, he envisions tomorrow's systems as genuine collaborators that propose novel solutions and identify overlooked risks. Yet he maintains that the engineer's core role—understanding requirements, making ethical judgments, and translating human needs into technological solutions—will remain irreplaceable. This partnership perspective feels more realistic than the typical replacement rhetoric dominating current discussions.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Hands-On Guide: Getting started with Mistral Agents API**][2]. This post provides a comprehensive, hands-on tutorial for getting started with Mistral's new Agents API, demonstrating how developers can build intelligent, modular agents with advanced capabilities. The guide walks through creating a math-solving agent that leverages Mistral's code interpreter tool to handle complex mathematical problems programmatically.

  The author, Arham Islam, breaks down the implementation into three clear steps: setting up dependencies and API keys, creating a custom math agent using the mistral-medium-2505 model, and running the agent through practical examples, such as solving quadratic equations. Islam demonstrates how the agent maintains conversation memory and can extend interactions—first solving an equation and then plotting the results as a visual graph that can be downloaded and displayed.

  What makes this tutorial particularly valuable is its focus on the practical aspects of agent orchestration. The Mistral Agents API supports multimodal interactions, agent handoff mechanisms for collaboration between multiple agents, and built-in access to essential tools like web browsing and image generation. The code examples demonstrate how agents can maintain context across multiple user messages, facilitating more natural and coherent dialogues that build upon previous interactions.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Data Formulator 2: Iterative Creation of Data Visualizations, with  AI Transforming Data Along the Way**][3]. Researchers from Microsoft Research and Yonsei University introduce Data Formulator 2 in this post, a groundbreaking AI-powered visualisation system explicitly designed for iterative data analysis. Unlike existing AI visualisation tools that require users to describe complex charts in single, text-heavy prompts, Df2 combines graphical user interfaces with natural language inputs to enable more effective communication of user intent while delegating data transformation entirely to AI.

  This post demonstrates how Df2 tackles two fundamental limitations of current AI visualisation tools: the difficulty of precisely describing complex chart designs through text alone and the inability to handle branching or backtracking during iterative exploration. The system introduces a multimodal chart builder that blends shelf-configuration UI elements with natural language instructions, allowing users to drag existing fields and type in new field names that don't yet exist in their data.

  The researchers showcase Df2's innovative "data threads" feature, which represents the user's non-linear authoring history, enabling navigation to earlier results, forking new branches, and building upon previous contexts. This eliminates the need to re-specify intent from scratch for each iteration. Their user study with eight participants demonstrated that users could successfully complete challenging data exploration sessions requiring 16 visualisations, with participants developing their own distinct iteration styles—from "wide versus deep" tree organisations to "backtrack and revise" versus "follow up" approaches.

  What's particularly compelling about this research is how it reveals the deeply personal nature of data exploration workflows. The study uncovered surprising behavioural clusters among users, with some preferring to branch out frequently with shorter data threads while others created fewer but longer chains of analysis. This suggests that effective AI-powered visualisation tools need to accommodate diverse working styles rather than enforcing a single interaction paradigm. This insight could reshape how we design the next generation of data analysis interfaces.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**What is MCP? A Comprehensive Guide to Building Advanced AI Agents Beyond Traditional APIs.**][4]. Shreyansh Jain presents a comprehensive breakdown of the Model Context Protocol (MCP) in this post, positioning it as a revolutionary advancement beyond traditional APIs for building advanced AI agents. The author argues that while Large Language Models are powerful, they struggle with real-time data access and dynamic integration with external tools—limitations that traditional APIs weren't designed to handle for autonomous AI systems.

  This post explores how MCP fundamentally differs from conventional API architectures by functioning as modular gateways rather than centralised controllers, enabling AI agents to dynamically discover and invoke available resources in real-time. Jain uses compelling analogies throughout, comparing traditional APIs to a stressed office assistant constantly switching between departments with different rules. At the same time, MCP acts like "the ultimate smart office manager," seamlessly integrating all systems into a unified, intelligent interface.

  The tutorial portion demonstrates the practical implementation of predefined MCP servers from major organisations, including Microsoft (Playwright), Airbnb, and DuckDuckGo. Jain walks through the process of creating a JSON configuration file that connects these services, then builds a Python application using the Groq API and LangChain to create an interactive AI agent capable of browser automation, accommodation searches, and web searches—all through a single, coherent interface.

  What makes this analysis particularly valuable is its positioning of MCP within the broader ecosystem of AI development tools. The author presents compelling evidence of MCP's rapid adoption, demonstrating its surpassing of established frameworks, such as LangChain and CrewAI, in GitHub popularity metrics. This suggests we're witnessing a fundamental shift in how AI systems interact with external resources—moving from rigid, predetermined API integrations toward adaptive, context-aware protocols that can evolve with changing requirements and provide the autonomy that modern AI agents demand.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Assigning and completing issues with coding agent in GitHub Copilot**][5]. Alexandra Lietzke introduces GitHub Copilot's groundbreaking coding agent in this post, a new asynchronous software engineering agent that represents a fundamental shift from traditional autocomplete tools to autonomous, teammate-like functionality. Unlike the synchronous agent mode, which operates within your IDE as a real-time collaborator, this coding agent works independently through GitHub Actions, accepting issue assignments and delivering complete pull requests with code, tests, and documentation.

  This post details the four-step workflow that makes the coding agent so revolutionary: writing and assigning issues to Copilot like you would a human teammate, watching Copilot plan and break down the work into actionable checklists, observing the agent write code and run tests in real-time, and finally reviewing and merging the completed pull request. Lietzke emphasises that success hinges on crafting comprehensive issues with relevant background, expected outcomes, technical details, and formatting rules—essentially treating the agent like a new team member who needs proper briefing.

  The practical benefits are immediately apparent: developers can offload repetitive, boilerplate tasks, such as unit test creation, and maintain better issue hygiene through automated typo fixes and small refactorings. Additionally, they can improve the user experience by delegating bug fixes and accessibility improvements. This frees up human developers to focus on higher-level problem-solving, architectural decisions, and tackling accumulated technical debt that often gets postponed due to time constraints.

  What's particularly compelling about this development is how it maintains human control while providing genuine autonomy. The agent can view images in issues, follow custom repository instructions, and even handle batch assignments for tasks such as increasing test coverage. Yet humans remain firmly in control—deciding what to assign, monitoring progress through live session logs, and maintaining final approval authority through mandatory peer review processes. As Brittany Ellich notes, this technology enables developers to "do more things well" rather than replacing human creativity and judgment, suggesting we're entering an era where AI amplifies rather than replaces engineering capabilities.

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

[1]: https://venturebeat.com/ai/the-future-of-engineering-belongs-to-those-who-build-with-ai-not-without-it/
[2]: https://www.marktechpost.com/2025/06/03/hands-on-guide-getting-started-with-mistral-agents-api/
[3]: https://arxiv.org/pdf/2408.16119 (https://github.com/microsoft/data-formulator)
[4]: https://pub.towardsai.net/what-is-mcp-a-comprehensive-guide-to-building-advanced-ai-agents-beyond-traditional-apis-c110abbeabb2?sk=v2%2F545ccc55-82e4-479c-9332-423b990d9846
[5]: https://github.blog/ai-and-ml/github-copilot/assigning-and-completing-issues-with-coding-agent-in-github-copilot/
