---
type: post
layout: "post"
title: Interesting Stuff - Week 25, 2025
author: nielsb
date: 2025-06-22T08:30:15+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-25-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-25-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - AI Coding
  - PostgreSQL
  - OpenAI
  - o3
description: "This week explores the convergence of traditional engineering excellence and AI-native approaches: from HTAP's death and OpenAI's PostgreSQL mastery to Microsoft's autonomous debugging agents and O3's breakthrough reasoning capabilities. The developments signal the early stages of Software 3.0's transformation, where organizational dynamics continue to shape enterprise adoption despite unprecedented technical advances."
---

This week's tech landscape reveals a fascinating convergence: while HTAP databases officially die and give way to modular data stacks, OpenAI proves that PostgreSQL mastery can handle ChatGPT's massive scale with just one primary instance and dozens of replicas. Meanwhile, Microsoft's Code Researcher demonstrates AI agents evolving from simple code completion to autonomous system-level debugging. At the same time, OpenAI's O3 family introduces true reasoning models that think through problems rather than relying on pattern matching. 

The meta-narrative emerging is clear: traditional engineering excellence is converging with AI-native approaches, while organisational dynamics continue to trump pure technical merit in enterprise adoption. From self-evolving agents that develop strategic planning autonomously to comprehensive frameworks democratising AI development, we're witnessing the early stages of Software 3.0's promised transformation.

<!--more-->

## Databases

* [**HTAP is Dead**][1]. In this post, Zhou Sun from Mooncake presents a compelling obituary for HTAP (Hybrid Transactional/Analytical Processing) databases, tracing the fascinating evolution of database architectures from the 1980s to the present day. Drawing from his decade-long experience building HTAP systems at SingleStore, Sun chronicles how we've come full circle, from unified databases in the '80s to specialised systems in the '90s-2000s, back to attempted reunification with HTAP in the 2010s, and finally to today's disaggregated data stacks.

  The author walks us through key historical moments: the "Great Divide" of the 1990s, when OLTP and OLAP workloads were separated due to competing resource demands, the rise of NoSQL and MapReduce in the 2000s, and the unexpected reconciliation in the 2010s when NewSQL and cloud data warehouses began converging on similar architectural principles. Sun explains how HTAP emerged in 2014 as Gartner's vision for the "next big DB architecture," promising to bridge operational and analytical systems for real-time use cases, such as fraud detection and personalisation.

  Despite technical achievements, SingleStore's hybrid row-store/column-store approach and TiDB's dual-engine architecture, HTAP ultimately failed to achieve market fit. Sun identifies four critical factors: the extreme difficulty of replacing existing OLTP systems (Oracle and SQL Server still dominate), most workloads not requiring distributed OLTP given improved hardware, cloud architectures favouring shared-disk over shared-nothing designs, and organisational silos where different teams own OLTP versus OLAP systems.

  The post concludes with a thought-provoking observation: today's modular data stacks, combining OLTP systems, stream processors, open table formats like Iceberg, and real-time query engines, essentially recreate HTAP functionality through composition rather than consolidation. The fundamental challenge remains unchanged: enabling fast analytical queries on fresh transactional data, now achieved through streaming pipelines and lakehouse architectures rather than monolithic databases.

  This analysis offers valuable insights into why some technical innovations succeed while others don't, highlighting how organisational dynamics and practical constraints often trump pure technical merit in enterprise technology adoption.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**OpenAI: Scaling PostgreSQL to the Next Level**][2]. This post by Bohan Zhang from OpenAI reveals how one of the world's most prominent AI companies scales PostgreSQL to handle millions of queries per second using an unsharded, single-writer architecture. Speaking at PGConf.dev 2025, Zhang shared OpenAI's battle-tested approaches for managing PostgreSQL at a massive scale, where database downtime directly impacts the availability of ChatGPT.

  OpenAI's architecture is refreshingly simple: one primary database with dozens of read replicas running on Azure Database for PostgreSQL. This setup demonstrates that PostgreSQL can handle enormous read loads gracefully, challenging the assumption that distributed databases are always necessary for scale. However, write requests have become their primary bottleneck, leading to sophisticated optimisation strategies.

  Author Zhang outlined OpenAI's multi-pronged approach to managing write load limitations inherent in PostgreSQL's multi-version concurrency control (MVCC) design. Their strategies include smoothing write spikes through lazy writes and careful backfill frequency control, aggressively offloading read operations to replicas, and implementing strict query optimisation practices. Particularly interesting is their cautious approach to Object-Relational Mappers (ORMs), which they've found can easily generate inefficient queries, and their implementation of comprehensive timeout controls at the session, statement, and client levels.

  The presentation also highlighted OpenAI's operational discipline, which involves maintaining strict schema management policies. These policies allow only lightweight changes with 5-second timeouts and prohibit operations that require full table rewrites. They also implement sophisticated request prioritisation, allocating dedicated read replicas for high-priority requests to prevent interference from lower-priority workloads.

  Zhang's results are impressive: their cluster handles millions of combined read and write QPS, supports dozens of replicas without increased replication lag, operates read-only replicas across geographic regions while maintaining low latency, and has experienced only one PostgreSQL-related SEV0 incident in nine months. The presentation concluded with practical feature requests to the PostgreSQL community, including index disabling capabilities, enhanced observability with percentile metrics, and improved default parameter settings.

  What makes this case study particularly compelling is how it reinforces the "distributed databases are a false need" argument that's gaining traction in the industry. OpenAI's success with a single PostgreSQL cluster serving their entire business, combined with modern hardware capabilities, suggests that many organisations might be overengineering their database architectures. Sometimes, the most sophisticated solution is simply doing the fundamentals exceptionally well.

## Generative AI

* [**Microsoft AI Introduces Code Researcher: A Deep Research Agent for Large Systems Code and Commit History**][3]. This post by Asif Razzaq introduces Microsoft Research's groundbreaking Code Researcher, an AI agent that approaches system-level debugging like a detective rather than just another code completion tool. Unlike existing agents such as SWE-agent and OpenHands, which focus on application-level fixes with human guidance, Code Researcher operates autonomously in the treacherous terrain of operating systems and low-level system code, where a single misplaced semicolon can crash entire machines.

  The author explains how traditional coding agents fall short when faced with system-level crashes, those cryptic stack traces and crash reports devoid of helpful natural language descriptions that haunt kernel developers. These environments require an understanding not just of current code logic but also of architectural context, interdependencies, and the evolutionary history of modifications spanning decades and involving thousands of contributors.

  Code Researcher's three-phase architecture represents a fundamental shift in AI debugging methodology. The Analysis phase sees the agent methodically exploring crash contexts through symbol lookups, pattern searches, and critically commit history analysis. Razzaq highlights how the agent might search for terms like "memory leak" across past commits to understand code changes that introduced instability. The Synthesis phase filters accumulated evidence to generate patches that span multiple files, while the Validation phase tests these solutions against the original crash scenarios.

  The performance results are striking: Code Researcher achieved a 58% resolution rate on Linux kernel crashes, compared to SWE-agent's 37.5%, while exploring an average of 10 files per trajectory versus just 1.33 for baseline methods. Perhaps most impressively, it successfully tackled FFmpeg crashes, resolving 7 out of 10 reported issues and demonstrating its generalizability beyond kernel code.

  What makes this research particularly compelling is its philosophical approach, treating debugging as a research problem requiring exploration, hypothesis formation, and validation rather than pattern matching. The agent's ability to incorporate commit history analysis represents a crucial innovation that mirrors how experienced developers actually debug complex systems. This suggests that we're moving toward AI agents that not only write code but also truly understand the evolutionary context that shapes software systems, marking a significant step toward autonomous software maintenance for the most challenging codebases imaginable.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**O3 vs O3 Pro vs O3 Mini: Which Model Should You Choose?**][4]. Divyansh Bhatia explores the overwhelming choice between OpenAI's three O3 model variants in this post, offering a comprehensive buyer's guide for what he describes as "a quantum leap in AI reasoning capabilities." With O3 achieving near-human performance on ARC-AGI benchmarks (87.5% vs 85% human level), O3-mini offering 63% cost savings, and O3-Pro delivering premium reasoning at enterprise pricing, the decision isn't straightforward.

  The author explains how the O3 family represents a fundamental shift from traditional language models to "reasoning models" that actively think through problems using deliberative reasoning. Unlike previous models that generate responses based on learned patterns, O3 considers its own results and dynamically adjusts its reasoning, enabling breakthrough performance across multiple domains.

  Bhatia effectively breaks down the speed-performance trade-offs: O3-Mini champions speed with 24% faster responses (7.7 vs 10.16 seconds), making it ideal for real-time applications. Standard O3 takes several minutes per complex query but makes 20% fewer significant errors than o1. O3-Pro requires the longest processing time, with some complex reasoning tasks potentially costing thousands of dollars per query due to computational requirements.

  The benchmark results are striking. On ARC-AGI, O3 achieved 76% in low-compute settings and 88% in high-compute configurations, becoming the first AI to surpass human-level performance in these settings. Perhaps most impressively, O3 scored 25.2% on FrontierMath, featuring unpublished research-level problems that take professional mathematicians hours or days to solve, as no other model had previously exceeded 2%.

  Pricing reflects the performance hierarchy: O3-Mini costs $1.93 per million tokens, O3 ranges from $10 to $40 per million tokens, and O3-Pro commands $20 to $80 per million tokens. For practical decision-making, Bhatia recommends O3-Mini for 80% of users seeking cost-effective reasoning, O3 for professionals requiring balanced performance-to-cost ratios, and O3-Pro for cutting-edge applications where accuracy takes precedence over cost.

  What makes this analysis particularly valuable is the author's realistic perspective on limitations, acknowledging higher hallucination risks, Gary Marcus's criticisms about benchmark training, and OpenAI's own admission of reasoning failures on "easy" tasks. The rapid three-month progression from o1 to o3 suggests we're entering an era where AI reasoning capabilities will improve dramatically every quarter, making this guide both timely and forward-looking for navigating the reasoning model revolution.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Agents of Change: Self-Evolving LLM Agents for Strategic Planning**][5]. This research paper by Nikolas Belle and Dakota Barnes from the University of California, Santa Barbara, tackles one of AI's persistent challenges: enabling large language model (LLM) agents to develop coherent, long-term strategic planning abilities. The authors investigate whether LLM agents can autonomously self-improve when placed in environments that explicitly challenge their strategic reasoning, using Settlers of Catan as their testing ground through the open-source Catanatron framework.

  The study presents a fascinating progression of four increasingly sophisticated agent architectures. Starting with a BaseAgent that directly maps game states to actions, they advance through a StructuredAgent with human-crafted prompts, to a PromptEvolver that iteratively refines prompts through multi-agent collaboration, and finally, an AgentEvolver capable of autonomously rewriting its own decision-making code. The most advanced system employs specialised roles, including Analyser, Researcher, Coder, and Player, that collaborate to diagnose gameplay failures and implement strategic improvements.

  The results reveal compelling performance differences across different LLM backends. Claude 3.7 emerged as the standout performer, achieving a remarkable 95% improvement over baseline agents in the PromptEvolver architecture. The model demonstrated sophisticated strategic evolution, developing detailed prompts that outlined clear short-term and long-term plans, including settlement placement, resource prioritisation, and robust opponent response strategies. GPT-4o showed more modest but consistent improvements, while Mistral Large struggled with meaningful strategic refinement.

  What makes this research particularly intriguing is its demonstration that self-evolving agents can outperform static baselines by autonomously adopting strategies and demonstrating adaptive reasoning over multiple iterations. The PromptEvolver architecture proved especially effective, with agents learning to identify the types of input that work best for their own decision processes, essentially becoming self-aware of their optimal prompting strategies.

  However, the study also reveals important limitations. The computational expense of evolution cycles, strong dependence on base model capabilities, and evaluation restricted to a single game environment highlight current constraints. The AgentEvolver, while groundbreaking in its ability to generate executable code from scratch, struggled to consistently surpass simpler approaches, suggesting that autonomous code evolution remains a challenging frontier even for sophisticated LLM systems.

  If you find this paper interesting, I'd recommend checking out Wes Roth's [YouTube video][8] analysis of this paper.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**11 Best AI Agent Frameworks for Software Developers**][6]. Devashish Datt Mamgain, in this comprehensive guide, tackles one of the most critical decisions facing developers today: choosing the right AI agent framework for building autonomous systems that can reason, plan, and execute complex tasks with minimal human intervention. With AI agents evolving from simple chatbots to sophisticated systems capable of multi-step reasoning and collaborative problem-solving, selecting the appropriate framework has become crucial for project success.

  The author systematically examines 11 leading frameworks, starting with LangChain, the established leader known for seamlessly chaining LLM calls and integrating external data sources. LangChain's modular approach enables developers to build complex, multi-step AI applications, such as chatbots and RAG systems, with greater flexibility than working directly with raw LLM APIs. However, it requires advanced programming skills and can be complex for sophisticated agents.

  Microsoft's contributions feature prominently with both AutoGen and Semantic Kernel. AutoGen stands out for its transformative multi-agent collaboration capabilities, allowing specialised agents to work together through role-based interactions in both autonomous and human-in-the-loop scenarios. Semantic Kernel offers enterprise-grade AI integration across C#, Python, and Java, positioning itself as a lightweight yet flexible development kit for production-ready applications.

  The guide highlights emerging frameworks, such as CrewAI, which simulates real team dynamics by assigning specific roles, tools, and goals to collaborative agents, and LangGraph, which provides sophisticated visual workflow management for stateful applications. More specialised solutions include LlamaIndex for data orchestration and enterprise knowledge assistants, as well as Rasa for conversational AI applications that require advanced natural language understanding.

  Exciting are the newer entrants: Atomic Agents emphasises modularity and atomicity in agent development, MetaGPT can generate comprehensive project materials from single-line requirements by simulating software development teams, and CAMEL enables autonomous agent collaboration for complex computational problem-solving. Each framework addresses different architectural philosophies and use cases.

  The author provides practical guidance for framework selection, emphasising key evaluation criteria, including ease of use, flexibility, community support, integration capabilities, performance, and scalability. He notes emerging trends toward multi-agent systems, enhanced reasoning capabilities, simplified development interfaces, and low-code approaches that democratise AI agent development.

  Most valuable is the author's honest assessment of trade-offs: while open-source frameworks offer customisation and community support, they often require significant technical expertise. The conclusion emphasises that the rapidly evolving landscape favors open-source solutions for innovation and flexibility, with the 11 frameworks providing comprehensive options for different requirements and technical expertise levels, from conversational agents to complex workflow automation systems.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Why Andrej Karpathy Says Software 3.0 is eating 1.0 and 2.0**][7]. This post examines Andrej Karpathy's bold prediction that Software 3.0 will fundamentally transform the way we build applications. The former Tesla AI architect argues that natural language prompting represents a paradigm shift that will "eat" traditional programming approaches.

    > **NOTE:** You can see the video where Karpathy spoke about this [here][9].

  The author breaks down Karpathy's three-generation framework with compelling clarity. Software 1.0 requires writing every line of code manually, like giving overly literal directions to someone. Software 2.0 teaches machines to learn patterns from data rather than relying on explicit programming. Software 3.0 enables natural language requests to generate complete software solutions, potentially cutting development time from months to days.

  What makes this analysis particularly compelling is the realistic assessment of current limitations. The concept of "jagged intelligence" resonates strongly, as AI systems can solve complex problems while stumbling on simple questions, such as comparing 9.11 and 9.9. This unpredictability, combined with the "anterograde amnesia" problem where models can't learn from past interactions, suggests we're still in the early stages of this transformation.

  I find the career implications section especially valuable for my readers. The emphasis on hybrid approaches, combining all three software generations rather than relying solely on prompt engineering, feels like the most practical takeaway. The distinction between AI Engineers and Prompt Engineers is crucial here: success requires understanding system integration, not just clever prompting.

  The five actionable steps at the end provide a concrete roadmap for adaptation. However, I wonder if the timeline predictions might be overly optimistic. While the potential for dramatic productivity gains is real, the infrastructure and reliability challenges for mission-critical applications remain significant hurdles that could slow widespread adoption.

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

[1]: https://www.mooncake.dev/blog/htap-is-dead
[2]: https://www.pixelstech.net/article/1747708863-openai%3a-scaling-postgresql-to-the-next-level
[3]: https://www.marktechpost.com/2025/06/14/microsoft-ai-introduces-code-researcher-a-deep-research-agent-for-large-systems-code-and-commit-history/
[4]: https://ai.plainenglish.io/o3-vs-o3-pro-vs-o3-mini-which-model-should-you-choose-ef9fabf1cff1
[5]: https://arxiv.org/pdf/2506.04651
[6]: https://ai.plainenglish.io/11-best-ai-agent-frameworks-for-software-developers-afa1700644bc
[7]: https://pub.towardsai.net/why-andrej-karpathy-says-software-3-0-is-eating-1-0-and-2-0-967734817cc6?sk=v2%2Fc669488d-0e0b-47c9-a229-48e102e75dac
[8]: https://www.youtube.com/watch?v=1WNzPFtPEQs
[9]: https://www.youtube.com/watch?v=LCEmiRjPEtQ
