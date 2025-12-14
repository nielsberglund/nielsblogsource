---
type: post
layout: "post"
title: Interesting Stuff - Week 50, 2025
author: nielsb
date: 2025-12-14T12:24:39+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-50-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-50-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - aimldatadurban
  - seasonofai
  - mcp
  - Claude Code
  - Hugging Face Skills
  - Agent Lightning
description: "Week 50, 2025: AI agents transform software development with Hugging Face Skills, Agent Lightning, Compound Engineering, and MCP standardization. Plus Data & AI Durban finale."
---

This week explores how AI agents are fundamentally transforming software development, from Hugging Face enabling Claude to orchestrate complete LLM fine-tuning workflows through natural language, to Microsoft's Agent Lightning adding reinforcement learning capabilities without code rewrites, and Every's pioneering Compound Engineering methodology, where single developers now accomplish what once required entire teams. 

We also examine GitHub's research, revealing how developers are evolving from "code producers" to "creative directors of code," the Model Context Protocol's transition to the Linux Foundation, and practical tutorials on building procedural memory agents. Plus, a special celebration of our triumphant Data & AI Community Day Durban Year-End-Finale, where nearly 200 attendees gave exceptional ratings despite the festive season, now it's time for well-deserved rest before 2026! 🎄

<!--more-->

## Generative AI

* [**We Got Claude to Fine-Tune an Open Source LLM**][1]. Hugging Face has released **Hugging Face Skills**, an open-source framework that enables AI coding agents such as **Claude Code**, **OpenAI Codex**, and **Google Gemini CLI** to orchestrate complete LLM fine-tuning workflows via natural language instructions. Published December 4, 2025, this breakthrough extends beyond generating training scripts to also include submitting jobs to cloud GPUs, monitoring progress in real time, and pushing finished models to the **Hugging Face Hub**. The **hf-llm-trainer skill** provides comprehensive domain knowledge to teach agents how to select the right GPU for specific model sizes, configure Hub authentication, decide when to use **LoRA versus full fine-tuning**, and handle the dozens of technical decisions required for successful training runs. Users can instruct "Fine-tune Qwen3-0.6B on the dataset open-r1/codeforces-cots" and the agent will validate dataset formats, select appropriate hardware (t4-small for 0.6B models), configure training scripts with **Trackio monitoring**, submit jobs to Hugging Face Jobs, report job IDs and estimated costs, check progress on demand, and assist with debugging failures.

  The framework supports **production-grade training methods** spanning supervised fine-tuning (SFT), **direct preference optimisation (DPO)**, and **reinforcement learning with Group Relative Policy Optimisation (GRPO)** for verifiable tasks like mathematics and code generation. Users can train models from 0.5B to 70B parameters, with automatic LoRA adapter selection for models exceeding 3B parameters to enable single-GPU training while preserving quality comparable to full fine-tuning. The skill handles critical workflow components, including dataset validation, checking for proper column formats (chosen/rejected for DPO, messages for SFT), hardware mapping from cost-effective t4-small instances ($0.75/hour) for sub-1B models to a100-large configurations for 7B+ models, and **GGUF conversion** for local deployment via llama.cpp, LM Studio, and Ollama. Integration with **Trackio** provides real-time visibility into training loss, learning rate schedules, and validation metrics, enabling early problem detection and iterative optimisation.

  This **conversational AI approach to model fine-tuning** democratises capabilities previously requiring specialised machine learning expertise, transforming the workflow from specialised technical knowledge to natural language orchestration. The system provides transparent cost estimation (a typical 0.6B model fine-tuning run costs approximately $0.30 for 20 minutes), supports asynchronous job execution, allowing users to close terminals and return later, and automatically distributes trained models to the Hub with proper versioning and documentation. Hugging Face Skills is compatible with Claude Code marketplace plugins, Codex AGENTS integration, and Gemini CLI extensions, with integrations planned for **Cursor, Windsurf, and Continue** development environments. The framework enables multi-stage training pipelines combining SFT for initial behaviour shaping, followed by DPO for preference alignment or GRPO for task-specific optimisation, representing a significant advancement in making **open source LLM customisation** accessible to developers without deep reinforcement learning backgrounds while maintaining enterprise-grade training quality and infrastructure reliability.

---

* [**The new identity of a developer: What changes and what doesn’t in the AI era**][2]. GitHub's latest research reveals a fundamental transformation in **software developer identity** as AI-assisted coding tools like **GitHub Copilot** reshape daily workflows. Published December 8, 2025, this comprehensive study based on interviews with 22 advanced AI users demonstrates how developers are evolving from "code producers" to "creative directors of code," focusing on **delegation, orchestration, and verification** rather than direct implementation. The research identifies a four-stage maturity model, Sceptic, Explorer, Collaborator, and Strategist, showing how developers build **AI fluency** through persistent trial-and-error experimentation. Advanced users now operate multi-agent workflows, deploying several AI tools in parallel configurations while spending more time on **code verification** and architectural decisions than on writing individual lines of code. This shift represents not a loss of craft but a reinvention of the developer role, with core competencies moving toward **systems design**, agent orchestration, and quality assurance.

  The **2025 Octoverse report** provides compelling ecosystem evidence supporting this identity shift: TypeScript became the #1 programming language by monthly contributors on GitHub in August 2025, driven by developers choosing languages that provide better **guardrails for AI-generated code** through explicit type systems and structural clarity. Additionally, 80% of new developers on GitHub now use Copilot within their first week, indicating that AI integration is becoming foundational rather than optional in **developer onboarding**. Within five months of launching GitHub's autonomous coding agent, developers merged over 1 million AI-generated pull requests, demonstrating large-scale adoption of **agentic development workflows**. These metrics reveal that delegation and verification are becoming primary development activities as organisations embrace **AI-powered software development** at scale.

  The research outlines three critical skill categories for the emerging developer role: **Understanding the Work** (AI fluency, technical fundamentals, product understanding), **Directing the Work** (delegation, agent orchestration, architecture design), and **Verifying the Work** (quality control, continuous validation). Rather than replacing developers, **AI coding assistants** are elevating their focus toward judgment, architecture, reasoning, and outcome responsibility, moving work up the ladder of abstraction. For enterprises investing in **developer productivity tools** and **AI transformation strategies**, this research suggests that developer value increasingly lies in their ability to confidently orchestrate AI tools, articulate clear intent, set architectural boundaries, and rigorously validate outputs while maintaining a deep technical understanding of system behaviour and algorithmic foundations.

---

* [**MCP joins the Linux Foundation: What this means for developers building the next era of AI tools and agents**][3]. Anthropic's **Model Context Protocol (MCP)** is transitioning to the **Linux Foundation's Agentic AI Foundation**, marking a pivotal moment for developers building **AI agents and agentic workflows**. Published December 9, 2025, this announcement addresses the critical n×m integration problem that has plagued AI development: every LLM client must integrate separately with every external tool and system, resulting in brittle, platform-specific implementations. MCP emerged from Anthropic as an **open source protocol** designed to standardise how AI models communicate with external tools, databases, APIs, and enterprise systems through schema-driven, predictable interfaces. The **2025 GitHub Octoverse report** reveals explosive growth with 1.13 million public repositories now importing LLM SDKs (+178% year-over-year), 693,000 new AI repositories created, and over 1 million AI-generated pull requests merged via **GitHub Copilot** coding agents within five months of launch, demonstrating that developers are rapidly operationalising AI tools rather than merely experimenting.

  The protocol's rapid adoption stems from solving real **developer workflow challenges**: OAuth flows for secure remote server authentication, long-running task APIs for builds and deployments, consistent tool schemas, and predictable execution semantics across different MCP clients. Community contributions from Anthropic, Microsoft, GitHub, OpenAI, and independent developers expanded MCP from local-only integrations to enterprise-grade **remote MCP servers** with proper security models and governance controls. The **MCP Registry** provides discoverability and enterprise governance, while the protocol's design mirrors familiar patterns from API development and distributed systems, favouring contract-based interactions over unpredictable "magical" AI behaviours. This approach enables developers to expose tools once and use them across multiple AI clients, IDEs, shells, and agents without proprietary function-calling adapters, making MCP particularly valuable for regulated industries requiring auditable, cross-platform AI integrations.

  Under **Linux Foundation governance**, MCP joins critical infrastructure technologies like Kubernetes, GraphQL, and the CNCF stack, ensuring long-term stability, vendor-neutral stewardship, and equal participation rights for cloud providers, startups, and individual maintainers. The protocol unlocks practical capabilities for **AI-powered development**: one server serving many clients, testable tool invocation, agent-native workload support, secure execution across multi-machine orchestration, and a growing ecosystem of community-maintained servers connecting to issue trackers, code repositories, observability systems, internal APIs, and cloud services. As the next era of software development increasingly depends on how AI models interact with existing systems, **MCP standardisation** provides the connective tissue for building agents, tools, and workflows without vendor lock-in, positioning the protocol as essential infrastructure for the 36 million new developers joining GitHub annually and the broader enterprise AI transformation.

---

* [**A Coding Guide to Build a Procedural Memory Agent That Learns, Stores, Retrieves, and Reuses Skills as Neural Modules Over Time**][4]. This comprehensive coding tutorial demonstrates how to build a **procedural memory agent** that learns, stores, and reuses skills as neural modules through environmental interaction. Published by MarkTechPost on December 9, 2025, the guide provides complete Python implementations using NumPy and Matplotlib to create an AI agent capable of forming reusable behavioural patterns. The framework treats skills as neural modules with embedded representations, preconditions, action sequences, and usage statistics, enabling **similarity-based skill retrieval** using cosine similarity. The agent operates in a GridWorld environment, where it learns complex tasks such as key acquisition, door opening, and goal navigation by extracting skills from successful trajectories and building a growing skill library over time.

  The tutorial covers four key architectural components: **skill representation and storage** in a memory structure, **similarity-based retrieval mechanisms** for matching states to learned behaviours, a GridWorld testing environment for observable learning dynamics, and a **procedural memory training system** that balances exploration with skill reuse. The implementation includes detailed code for embedding creation, skill extraction from trajectories, and an agent training loop that demonstrates measurable improvements across episodes. As the agent progresses through training, it transitions from primitive action exploration to intelligent skill application, with visualisations showing declining episode lengths and increasing rewards as the skill library expands.

  This **machine learning tutorial** provides practical insights into **reinforcement learning** with procedural memory, demonstrating how agents develop internal competencies through experience. The complete Python code includes skill library management, trajectory analysis, and training visualisation tools, making it valuable for AI developers interested in **agentic systems**, **neural skill learning**, and **episodic memory** architectures. The framework demonstrates that even simple heuristics in constrained environments can yield meaningful learning dynamics, providing a concrete foundation for building more sophisticated agents that develop reusable behavioural repertoires over time.

---

* [**Agent Lightning: Adding reinforcement learning to AI agents without code rewrites**][5]. Microsoft Research Asia – Shanghai has released **Agent Lightning**, an open-source framework that enables developers to add **reinforcement learning (RL) capabilities to AI agents** with virtually no code modification. Published December 11, 2025, this breakthrough addresses a critical limitation in **LLM-based agent development**: while reinforcement learning can significantly improve agent performance on complex multi-step tasks, traditional RL integration requires extensive code rewrites that discourage adoption. Agent Lightning solves this by separating task execution from model training, converting agent experiences into standardised state-action sequences where each LLM call becomes an action paired with context, output, and reward data. The framework's **LightningRL algorithm** implements hierarchical reinforcement learning with a credit assignment module that determines each LLM request's contribution to outcomes, enabling compatibility with established single-step RL methods such as **Proximal Policy Optimisation (PPO)** and **Group Relative Policy Optimisation (GRPO)** without modification.

  The **Agent Lightning middleware architecture** features three core components that enable scalable, efficient RL training: an agent runner managing task distribution and data collection (CPU-optimised), an algorithm component orchestrating the RL cycle and hosting LLMs for inference and training (GPU-optimised), and LightningStore serving as the central repository with standardised interfaces. This decoupled design allows developers to maintain existing agent frameworks built on **LangChain, OpenAI Agents SDK, or AutoGen** while simply switching model calls to the Agent Lightning API, preserving the main agent code body unchanged. The system supports complex workflows, including multi-agent collaboration, dynamic tool use, and asynchronous task delegation, with each component scaling independently to optimise resource utilisation. Evaluation across three real-world scenarios demonstrated consistent performance improvements: Text-to-SQL generation accuracy increased through simultaneous optimisation of multiple agents, **retrieval-augmented generation (RAG)** performance improved on the MuSiQue multi-hop question-answering dataset; and mathematical reasoning accuracy rose through better tool calling and result integration.

  By simplifying **RL integration for agentic AI systems**, Agent Lightning enables continuous agent improvement through real-world practice without the traditional barrier of extensive code modifications. The framework's hierarchical approach keeps training sequences short and efficient while supporting flexible LLM input construction for complex agent behaviours, addressing the scalability challenges that plague traditional multi-step RL approaches. Microsoft Research plans to expand capabilities with automatic prompt optimisation and additional RL algorithms, positioning Agent Lightning as an open platform for creating **AI agents that learn from experience** and improve over time. This represents a significant advancement for enterprise **AI agent development**, particularly for organisations building production agents that require iterative improvement across domains such as software development, data analysis, customer service automation, and complex decision-making workflows, where agent-generated execution data can now directly feed performance optimisation.

---

* [**Compound Engineering: How Every Codes With Agents**][6]. Every has pioneered **Compound Engineering**, a revolutionary software development methodology where 100% of code is written by AI agents, fundamentally inverting traditional engineering assumptions. Published December 11, 2025, CEO Dan Shipper and Cora GM Kieran Klaassen reveal how their team runs five production software products, each primarily built and maintained by a single developer, serving thousands of daily users through **AI coding agents** like Anthropic's **Claude Code**, Factory's Droid, and **OpenAI's Codex CLI**. The breakthrough insight: while traditional engineering expects each feature to make subsequent features harder to build due to accumulating complexity, compound engineering expects each feature to make the next feature **easier** by creating learning loops in which bugs, failed tests, and problem-solving insights are documented and reused by future agents. This productivity transformation enables a single developer today to accomplish the work of five developers from just a few years ago, with the AI's knowledge of the codebase growing alongside its complexity rather than lagging behind it.

  The **Compound Engineering methodology** follows a four-step loop where agents plan, write, and evaluate code while developers orchestrate and compound learnings: (1) **Plan**: agents research the codebase and internet best practices, then synthesise detailed implementation plans with architecture proposals and success criteria; (2) **Work**: agents execute step-by-step using **Model Context Protocols** like Playwright and XcodeBuildMCP to simulate user interactions and iterate on prototypes; (3) **Assess**: parallel code review using 12 subagents examining security, performance, complexity, and other perspectives alongside traditional linters and unit tests; and (4) **Compound**: the critical step where learnings from bugs, reviews, and solutions get documented as prompts that prime future agent work, automatically distributing knowledge across the entire development team. Developers spend roughly 80% of their time on planning and review, with only 20% on execution and compounding, representing a fundamental shift from manual code writing to agent orchestration and verification.

  This **AI-native development approach** eliminates traditional engineering constraints and practices: manually writing tests becomes unnecessary when agents can generate comprehensive test suites; human-readable documentation loses priority when agents understand codebases directly; new hires commit code immediately rather than spending weeks onboarding; and legacy platform lock-in disappears when replatforming costs plummet. Every has released a **Compound Engineering plugin for Claude Code** that implements their exact internal workflow, enabling developers to adopt this methodology immediately. The framework demonstrates that removing coding bottlenecks and scarce engineering talent as constraints requires fundamentally rethinking software development processes, moving from optimising for human code comprehension to optimising for agent learning loops, from expecting compound complexity to engineering compound capability, and from treating each codebase as a liability to treating it as an increasingly intelligent system that gets easier to extend over time.

## WIND (What Is Niels Doing)

Yesterday marked a triumphant conclusion to 2025's Data & AI Community Day Durban series with our [**Year-End-Finale: Season of AI - Merry Christmas People (MCP)**][10] event at [**Richfield College**][11], Umhlanga. Despite being deep in the festive season when most people are focused on holiday preparations, nearly 200 passionate community members chose to give up their Saturday to immerse themselves in the latest developments in AI and data. The dedication of our community never ceases to amaze. This turnout during December speaks volumes about the hunger for knowledge and connection within Durban's tech ecosystem.

The numbers tell the story of why this event was worth every minute: attendees rated the overall event at **6.45 out of 7**, the sessions at **6.42**, and our incredible speakers at **6.51**. These outstanding scores reflect the quality of content delivered, the expertise of our presenters, and the seamless execution by our team. From discussions on the Model Context Protocol (MCP) that inspired our festive theme, to hands-on workshops and networking sessions, the event delivered exactly what our community needed to close out the year on a high note.

As we celebrate this successful finale, it's time to acknowledge that even the most passionate community builders need to recharge. After a year of organising events, curating sessions, coordinating speakers, and bringing together hundreds of data and AI enthusiasts across multiple gatherings, **now is the time for rest and relaxation**. We'll be back in 2026 with renewed energy and even more exciting content, but for now, the Data & AI Community Day Durban team is signing off for the festive season. Thank you to everyone who made 2025 such an incredible year—see you in the new year! 🎄

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

[1]: https://huggingface.co/blog/hf-skills-training
[2]: https://github.blog/news-insights/octoverse/the-new-identity-of-a-developer-what-changes-and-what-doesnt-in-the-ai-era/
[3]: https://github.blog/open-source/maintainers/mcp-joins-the-linux-foundation-what-this-means-for-developers-building-the-next-era-of-ai-tools-and-agents/ 
[4]: https://www.marktechpost.com/2025/12/09/a-coding-guide-to-build-a-procedural-memory-agent-that-learns-stores-retrieves-and-reuses-skills-as-neural-modules-over-time/
[5]: https://www.microsoft.com/en-us/research/blog/agent-lightning-adding-reinforcement-learning-to-ai-agents-without-code-rewrites/
[6]: https://every.to/chain-of-thought/compound-engineering-how-every-codes-with-agents
[10]: https://aimldatadurban.org/events/2025/season-of-ai-mcp/
[11]: https://www.richfield.ac.za/campus/umhlanga/#
