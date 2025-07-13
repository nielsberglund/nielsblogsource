---
type: post
layout: "post"
title: Interesting Stuff - Week 28, 2025
author: nielsb
date: 2025-07-13T10:49:48+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-28-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-28-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - SQL Server MCP
  - Microsoft MVP
  - AGI
  - Context Engineering
description: "Week 28 brings a fascinating shift in how we think about AI intelligence and engineering. From context engineering emerging as the new alternative to endless model scaling, to Microsoft's MSSQL MCP Server democratizing database interactions through natural language, we're witnessing AI mature from experimental curiosity into disciplined engineering practice. These developments collectively point to AI transitioning from impressive demos to essential infrastructure that genuinely augments human capability."
---

Week 28 brings a fascinating shift in how we think about AI intelligence and engineering. I'm thrilled to share that I've been renewed for my ninth year as a Microsoft MVP! From context engineering emerging as the new alternative to endless model scaling to pragmatic AGI definitions based on economic utility rather than philosophical debates, we're seeing the field mature beyond experimental curiosity into disciplined engineering practice. 

Microsoft's MSSQL MCP Server is democratising database interactions through natural language while the industry grapples with whether vector search is truly the silver bullet we thought it was. These developments collectively point to AI transitioning from impressive demos to essential infrastructure that genuinely augments human capability.

<!--more-->

## Generative AI

* [**Context Engineering in AI: The Real Secret Behind Smarter, More Useful Language Models**][1]. In this post by MD Rafsun Sheikh, we discover a compelling alternative to the constant pursuit of larger AI models: context engineering. Sheikh argues that instead of endlessly scaling model parameters, the real breakthrough lies in how we design and structure the information we feed to language models.

  The author presents context engineering as "the practice of designing the right environment for an AI model to operate," which involves structuring prompts, feeding relevant knowledge, deciding what information to include or exclude, and organizing content strategically. Sheikh uses a compelling analogy, comparing it to setting up a workspace for a new teammate - without clear instructions and proper tools, you'll get mediocre results regardless of their capabilities.

  What makes this particularly relevant for week 28, 2025, is how context engineering addresses the practical limitations we're hitting with current LLMs. Sheikh points out that with models like GPT-4 Turbo's 128K context limit, every token matters, and poor context management can break multi-agent systems entirely. The post outlines six core techniques: system prompt design, prompt chaining, context compression, dynamic retrieval, memory engineering, and tool-aware context.

  **My take**: Sheikh's emphasis on context as "the new programming" feels like a natural evolution in how we interact with AI systems. Rather than treating prompts as simple requests, we're moving toward architecting entire information environments. This shift represents a maturation of the field; we're no longer just asking AI to be smarter but learning to be smarter about how we communicate with it. The practical applications he mentions, ranging from support bots to legal search systems, demonstrate that this isn't just theoretical but is already driving real-world improvements in AI effectiveness.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Toward a Definition of AGI**][2]. This post by Dan Shipper presents a refreshingly pragmatic approach to defining Artificial General Intelligence (AGI). Rather than getting caught up in philosophical debates about consciousness or intelligence benchmarks, Shipper proposes a simple, observable metric: "AGI is achieved when it makes economic sense to keep your agent running continuously."

  Shipper draws a compelling parallel between AI development and child development, noting how both progress from complete dependency to gradual independence. He argues that we're already seeing this pattern with AI; we're keeping sessions open longer, returning to AI tools more frequently, and trusting them with increasingly continuous workflows.

  What makes this definition particularly elegant is its binary nature. Unlike the Turing Test (which sets moveable goalposts) or OpenAI's definition, which focuses on "economically valuable work" (and constantly evolves as we create new hybrid human-AI roles), Shipper's threshold is irreversible. Once we're running agents 24/7, we've definitively crossed the AGI line.

  The author identifies five key capabilities that would need to emerge for this continuous operation: continuous learning, sophisticated memory management, goal generation and achievement, proactive communication, and trust/reliability. He notes these capabilities already exist in rudimentary forms; ChatGPT has basic memory and can initiate conversations, while tools like Claude Code can run autonomously for 5-20 minutes.

  **Here's what strikes me most**: Shipper's definition sidesteps the endless philosophical debates about what constitutes "real" intelligence and instead focuses on practical utility. It's less about whether AI can think like humans and more about whether it's valuable enough to keep thinking. This economic lens feels particularly relevant as we watch companies struggle with AI adoption; the question isn't whether AI is "intelligent enough" but whether it's "useful enough" to justify continuous operation. The trajectory from seconds (GitHub Copilot) to minutes (current agents) to eventual always-on operation seems both inevitable and measurable, making this one of the more actionable AGI definitions I've encountered.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Introducing MSSQL MCP Server (Preview)**][3]. Author Arun Vijayraghavan introduces a groundbreaking development in this post that could fundamentally change how we interact with SQL databases. The MSSQL MCP Server (Preview) utilises the Model Context Protocol to facilitate natural language conversations with SQL Server databases via AI agents, thereby eliminating the need for complex query languages and specialised database administration skills.

  The post explains how MCP serves as a standardised communication layer that allows AI models to dynamically discover and invoke database functionalities through natural language. The MSSQL MCP Server provides a comprehensive suite of tools, including table listing, schema description, data manipulation, and index creation. All are accessible through conversational commands rather than SQL syntax.

  Vijayraghavan demonstrates practical integration with popular development environments, such as Visual Studio Code (with GitHub Copilot) and Claude Desktop. The setup process involves configuring connection strings and authentication, after which users can ask their database questions, such as "which database are you connected to?" and receive intelligent responses with actionable insights.

  The server supports both cloud and on-premises SQL environments, including Azure SQL Database and SQL Database in Microsoft Fabric, making it versatile for different deployment scenarios. Available in both .NET and Node.js implementations, it offers developers flexibility in their technology stack choices.

  **This feels like a significant democratisation moment for database interaction**. For years, the power of enterprise databases has been locked behind the complexity of SQL syntax and the expertise required for database administration. By enabling natural language queries through AI agents, Microsoft is effectively removing the technical barrier that has kept valuable data insights inaccessible to non-technical stakeholders. The implications extend beyond convenience; this could reshape how organisations approach data-driven decision-making, allowing business users to directly interrogate their data without waiting for technical intermediaries. The preview nature suggests we're seeing the early stages of what could become a standard way of interacting with enterprise data systems.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Why Cursor is About to Ditch Vector Search (and You Should Too)**][4]. Jacky Liang presents a provocative perspective on the AI industry's fixation with vector databases in this post, arguing that "AI is just search" and questioning the prevailing assumption that every AI application requires vector search capabilities. Liang, drawing on his experience at vector database companies, offers an insider's perspective on why the vector hype may be overblown.

  The core argument centres on a fundamental distinction: similarity doesn't equal relevance. When searching for specific function names, such as `getUserById`, you need exact matches, not semantically similar alternatives like `findUserByEmail`. Similarly, part numbers, SKUs, and product codes require precise keyword matching rather than semantic similarity that might surface similar but incorrect results.

  Liang uses the Claude Code vs. Cursor comparison as his primary case study. He describes personally cancelling his Cursor subscription after 12 months of use because Claude Code's lexical search approach (using tools like grep) automatically finds the right files, while Cursor requires constant manual file tagging with @ symbols. The evidence supporting his thesis: Cursor hired two Claude Code leads (Boris Cherny and Cat Wu) in July 2025, suggesting they recognise the superiority of Claude Code's approach.

  The post advocates for hybrid search strategies that combine lexical and vector approaches tailored to the specific use case. For code assistance, exact matching wins. For customer support understanding intent, vector search excels. For e-commerce, you likely need both approaches working together.

  **What's particularly compelling here is Liang's prediction about the correction in the vector database market**. His experience at Pinecone gives him credibility when he suggests the 2023 investment peak in vector databases was driven more by hype than practical utility. The industry is indeed maturing beyond the "one-size-fits-all" mentality, with companies like Pinecone adding cascading retrieval and hybrid search capabilities. This feels like a natural evolution; we often see technology markets swing from oversimplified solutions to more nuanced, problem-specific approaches as the field matures. A major AI coding tool like Cursor, which is potentially reorienting its entire search architecture, speaks to the potential significance of this shift.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Generative AI: A Self-Study Roadmap**][5]. In this comprehensive post, Vinod Chugani provides a practical roadmap for developers and data practitioners looking to build expertise in generative AI. The guide takes a refreshingly hands-on approach, emphasising that generative AI engineering requires a fundamentally different mindset from traditional machine learning, focusing on working with pre-trained foundation models rather than training from scratch.

  Chugani structures the learning path across seven parts, beginning with fundamentals that highlight how generative AI represents a shift from pattern recognition to content creation. He emphasises that most generative AI work happens at the application layer using APIs and frameworks, making the field more accessible to developers without deep neural network expertise.

  The roadmap covers essential skills, including prompt engineering excellence, implementation of the RAG system, and production deployment considerations. Particularly valuable is the emphasis on building a portfolio through three progressive projects: a smart chatbot with custom knowledge, a content generation pipeline, and a multimodal AI assistant. Each project is designed to demonstrate increasingly sophisticated capabilities while providing concrete evidence of skills to potential employers.

  What sets this guide apart is its focus on practical considerations often overlooked in theoretical treatments. Chugani addresses cost optimisation strategies, quality evaluation frameworks, content safety measures, and the unique challenges of deploying non-deterministic systems. The sections on responsible AI development and staying current in the rapidly evolving field provide crucial guidance for sustainable career growth.

  **This roadmap reflects the maturation of generative AI from experimental curiosity to a business necessity. ** Chugani's emphasis on systematic approaches, structured prompt engineering, robust evaluation frameworks, and ethical considerations suggests the field is moving beyond the "move fast and break things" mentality toward more disciplined engineering practices. His recommendation to contribute to open-source projects and engage with practitioner communities underscores how this field values both technical expertise and community involvement. For developers entering this space, the roadmap provides not just technical guidance but a realistic path for building credible expertise in an area where traditional credentials matter less than demonstrated capability through practical projects.

## WIND (What Is Niels Doing)

Ah yes, July; the month when Microsoft MVPs everywhere suddenly develop a nervous twitch, obsessively refreshing their inboxes like teenagers waiting for a text back. It's that annual ritual where we all wonder, "Did I make the cut, or am I about to be demoted to mere mortal status?" 😅 

![](/images/posts/2025-MVP-Award-Certificate.png-1024.png)

**Figure 1:** *MVP Certificate*

Well, I'm happy (and very relieved) to report that I survived the renewal anxiety, and I've been renewed for another year in the MVP program! 🎉 This marks my ninth year as a Microsoft MVP (I know… I'm starting to sound like a legacy system at this point). For the third consecutive year, I have been named an MVP in the AI Platform category (having previously been an MVP in the Data category). Clearly, Microsoft still believes I have valuable insights to share about our AI capabilities.

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

[1]: https://pub.towardsai.net/context-engineering-in-ai-the-real-secret-behind-smarter-more-useful-language-models-397f0c168592?sk=v2%2Fa88f0677-e006-4482-94e3-3bab31709260
[2]: https://every.to/chain-of-thought/toward-a-definition-of-agi
[3]: https://devblogs.microsoft.com/azure-sql/introducing-mssql-mcp-server/
[4]: https://www.tigerdata.com/blog/why-cursor-is-about-to-ditch-vector-search-and-you-should-too
[5]: https://www.kdnuggets.com/generative-ai-a-self-study-roadmap
