---
type: post
layout: "post"
title: Interesting Stuff - Week 32, 2025
author: nielsb
date: 2025-08-10T09:30:24+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-32-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-32-25.jpg"
categories:
  - roundup
tags:
  - OpenAI
  - Generative AI
  - MCP
  - GPT-5
description: "Weekly AI & Tech Roundup: OpenAI's open-weight GPT models, Microsoft's enterprise MCP registries, Google's LangExtract library, and the shift from flashy AI demos to production-ready tools. Plus Context Engineering with DSPy and GPT-5 review."
---

This week brought remarkable developments across the AI landscape, from OpenAI's strategic pivot with their first open-weight models since 2019 to Google's practical LangExtract library that finally tackles the "last mile" problem in information extraction. 

We're witnessing a maturation in AI tooling, moving beyond flashy capabilities toward systematic engineering practices, with Microsoft's enterprise MCP registries, sophisticated multi-agent orchestration frameworks, and Context Engineering approaches that separate hobbyist projects from production-ready applications. 

The standout theme is the shift from raw model performance to skilful orchestration, reliability, and genuine enterprise adoption, exemplified by Simon Willison's assessment of GPT-5 as simply "competent"; perhaps the highest praise an AI tool can receive.

<!--more-->

## Generative AI

* [**Claude Flow: The Definitive Guide to AI Development Orchestration**][1]. In this post by Sebastian Redondo, CTO at Guavapay, we dive into what might be the most ambitious take on AI-assisted development yet conceived. Forget your humble coding copilot, Claude Flow introduces the concept of orchestrating entire swarms of specialised AI agents to tackle software projects. Think of it as replacing your solo AI assistant with a whole development team that never needs coffee breaks.

  The framework builds atop Claude Code and introduces a "Hive-Mind" architecture where a Queen agent coordinates specialised workers: architects design systems, coders implement features, testers validate everything, and security agents audit for vulnerabilities. Each agent operates with its own expertise while contributing to a shared SQLite-based memory system that learns and evolves across sessions.

  What's particularly fascinating is the persistent memory approach, the system maintains context through an SQLite database storing agent interactions, training data, and project history. This means your AI swarm actually gets smarter over time, remembering successful patterns and architectural decisions from previous projects.

  **My take:** This feels like a natural evolution of AI tooling, moving from single-purpose assistants to coordinated teams. The real test will be whether the coordination overhead justifies the parallel processing benefits. The concept of AI agents that genuinely collaborate rather than assist could be transformative, or it could be an over-engineered solution to problems that simpler tools already solve well. Either way, it's the kind of bold experimentation that pushes the entire field forward.

  The practical walkthrough demonstrates building an authentication microservice by simply describing the requirements in natural language, then watching specialised agents architect, code, test, and secure the solution automatically. Whether this represents the future of software development or an elaborate tech demo remains to be seen, but it's certainly worth watching.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**MCP Registry with Azure API Center**][2]. This Microsoft post tackles a critical challenge that's emerging as AI tooling matures: how do enterprises maintain control and security when their AI agents need access to specialised tools? Microsoft's solution? Build your own private MCP (Model Context Protocol) registry using Azure API Center.

  The premise is compelling, while public MCP registries have driven innovation, enterprises need "tighter security, governance, and control" as they scale their AI implementations. Microsoft's approach transforms Azure API Center into a curated, enterprise-grade catalog where organisations can discover, govern, and share MCP servers internally without the wild-west nature of public repositories.

  The security benefits are substantial: thorough review and verification of every MCP server before internal access, reduced attack surfaces through controlled tool access, and enterprise-grade authentication. Perhaps most importantly, it addresses the "shadow AI" problem: those inevitable scenarios where individual teams independently develop AI tools without central oversight.

  **My thoughts:** This feels like Microsoft reading the enterprise tea leaves correctly. As AI adoption moves from experimentation to production, the "move fast and break things" mentality of public registries becomes a liability. The irony is that we're essentially recreating the same governance patterns we've seen with container registries, package managers, and API catalogs for AI tools this time.

  The partnership approach is smart too, with early adopters like Atlassian, Box, and Neon already making their MCP servers discoverable through Azure's discovery page. It's a classic platform play: provide the infrastructure, encourage ecosystem participation, and position Azure as the enterprise-friendly choice for AI governance.

  Whether organisations will embrace yet another registry to manage remains to be seen, but the underlying need for AI tool governance is undeniably real.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Guest Blog: Building Multi-Agent Solutions with Semantic Kernel and A2A Protocol**][3]. Author Kinfey Lo explores a fascinating convergence in this post, showing how Microsoft's Semantic Kernel can be enhanced with Google's Agent-to-Agent (A2A) protocol to create truly interoperable multi-agent systems. This isn't just theoretical—it's a working implementation that bridges different AI frameworks and platforms.

  The key insight here is understanding what A2A actually solves. Unlike MCP (Model Context Protocol), which connects agents to tools and data sources, A2A enables peer-to-peer agent collaboration. Think of it as the difference between giving an agent a toolbox versus teaching it to work with a construction crew. The protocol introduces "Agent Cards" for discovery, structured task management with lifecycle tracking, and enterprise-grade security built on familiar web standards.

  The implementation demonstrates a centralised routing pattern where an Azure AI Foundry-powered host agent intelligently delegates tasks to specialised remote agents, a Playwright agent for web automation and a tool agent for development tasks. Each agent leverages Semantic Kernel's MCP integration for extensible capabilities while communicating through A2A's standardised protocol.

  **My perspective:** This represents a significant maturation in the multi-agent space. We're moving beyond proprietary agent frameworks toward standardised protocols that enable true ecosystem interoperability. The combination of Microsoft's enterprise-focused Semantic Kernel with Google's open A2A protocol creates a compelling bridge between different AI development approaches.

  What's particularly interesting is the hybrid architecture, using MCP for tool integration and A2A for agent communication. This suggests we're entering an era where different protocols will complement rather than compete, each optimised for specific interaction patterns.

  The real test will be adoption. With over 50 technology partners backing A2A, there's clearly momentum, but enterprise adoption often moves slowly. The ability to gradually migrate existing Semantic Kernel applications to A2A without significant architectural changes could be the key to widespread adoption.

  This feels like early glimpses of the future where AI agents truly collaborate across organisational and technical boundaries.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Introducing LangExtract: A Gemini powered information extraction library**][4]. This post by Akshay Goel and Atilla Kiraly introduces LangExtract, Google's new open-source Python library that tackles one of the most persistent challenges in AI applications: reliably extracting structured information from unstructured text while maintaining traceability back to the source.

  What sets LangExtract apart isn't just another wrapper around LLMs; it's the thoughtful engineering around common pain points. The library provides precise source grounding by mapping every extracted entity back to exact character offsets in the original text, making verification and quality assessment much more manageable. The visual highlighting feature alone could save countless hours in evaluation workflows.

  The technical approach is pragmatic: LangExtract uses a chunking strategy with parallel processing and multiple extraction passes to handle long documents, addressing the well-known issue where LLM recall decreases in million-token contexts. The library leverages Gemini's Controlled Generation for reliable structured outputs, using few-shot examples to enforce schemas without requiring model fine-tuning.

  The Shakespeare example demonstrates the simplicity: define a prompt, provide a quality example, and extract structured entities with attributes. The interactive HTML visualisations make it easy to review thousands of annotations, which is crucial for real-world applications where humans need to validate AI outputs.

  **My take:** This feels like Google addressing the "last mile" problem in information extraction. While we've had powerful LLMs for text processing, the tooling around reliability, traceability, and evaluation has lagged behind. LangExtract's focus on source grounding and interactive visualisation suggests Google understands that enterprise adoption requires more than just accurate extraction; it requires trust and auditability.

  The RadExtract demo for structured radiology reporting showcases the real-world potential. Converting free-text medical reports into structured formats while highlighting important findings could significantly improve clinical workflows and research data quality.

  This represents the kind of practical, production-ready tooling that moves AI from impressive demos to reliable business applications. Sometimes the most valuable innovations aren't the flashiest; they're the ones that solve the unglamorous but critical problems that prevent widespread adoption.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**OpenAI Just Released the Hottest Open-Weight LLMs: gpt-oss-120B (Runs on a High-End Laptop) and gpt-oss-20B (Runs on a Phone)**][5]. I need to address this significant development with some scepticism, as OpenAI did indeed release `gpt-oss-120B` and `gpt-oss-20B` on August 5, 2025, marking their first open-weight models since GPT-2 in 2019. However, the breathless tone of the original article seems more focused on generating excitement than providing balanced analysis.

  The technical specs are genuinely impressive: `gpt-oss-120B` achieves near-parity with OpenAI's o4-mini on core reasoning benchmarks while running efficiently on a single 80GB GPU, and `gpt-oss-20B` delivers similar results to o3-mini on common benchmarks while requiring only 16GB of memory. Both models use Mixture-of-Experts architecture with MXFP4 quantisation, making them surprisingly resource-efficient for their capabilities.

  The strategic implications are fascinating. OpenAI reported $13 billion in annual recurring revenue as of August 2025, up from $10 billion in June, with 5 million paying business customers, which raises questions about why they'd release competitive open-weight models that could cannibalise their API business.

  **My take:** This feels less like altruism and more like strategic necessity. With DeepSeek R1 offering near-parity in performance and Meta, Mistral, and others advancing rapidly in open-weight models, OpenAI needed to maintain relevance in the open ecosystem. The company carefully avoided releasing proprietary training techniques or architectural innovations; this is calculated openness that protects their competitive moats while appearing community-friendly.

  The real test will be whether these models live up to the performance claims in practice. Early reports suggest impressive results, but the gap between marketing materials and real-world deployment is often significant. Still, having OpenAI-grade reasoning capabilities available for local deployment represents a meaningful shift toward democratised AI access.

  The timing, coinciding with increasing regulatory pressure and calls for AI transparency, is not coincidental either. Sometimes strategic business moves and genuine community benefits align: this might be one of those moments.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Context Engineering — A Comprehensive Hands-On Tutorial with DSPy**][7]. Author Avishek Biswas tackles one of the most critical yet underexplored aspects of AI development in this comprehensive tutorial. Context Engineering isn't just another buzzword; it's the systematic approach to managing how information flows through LLM applications, bridging the gap between simple prompts and production-ready systems.

  The core insight here is powerful: cramming everything into an LLM's context window actually hurts performance due to "context poisoning" and "context rot." Instead, Context Engineering advocates for breaking complex problems into specialised subproblems, with different agents handling specific tasks using appropriate context and capabilities.

  Biswas demonstrates these concepts using DSPy, which elegantly separates input/output contracts (Signatures) from control flows (Modules). The framework's approach to structured outputs with automatic validation and retry logic addresses a significant pain point in LLM development: the brittleness of parsing free-form text responses.

  The tutorial progresses through increasingly sophisticated patterns: sequential processing with different model sizes for different tasks, iterative refinement with feedback loops, conditional branching for multi-output systems, and advanced tool calling. The RAG section is particularly valuable, covering practical optimisations like query rewriting, HYDE (Hypothetical Document Embedding), and multi-hop retrieval.

  **My perspective:** This represents a maturation in how we think about LLM applications. We're moving beyond the "throw everything at the model and hope for the best" approach toward systematic engineering practices. The emphasis on evaluation-first design and structured outputs resonates with traditional software engineering principles, exactly what the AI space needs.

  What's refreshing is the focus on production considerations: failure handling, monitoring, and observability. Too many LLM tutorials ignore these unsexy but crucial aspects. The integration with MLflow for tracking prompts, costs, and performance metrics shows an understanding of real-world deployment challenges.

  Context Engineering feels like the discipline that will separate hobbyist AI projects from enterprise-grade applications. As LLM capabilities plateau, the competitive advantage will increasingly come from how skillfully we orchestrate these models rather than relying on raw model performance alone. 

<div align="center">_ _ _ _ _ _ _</div></br>

* [**GPT-5: Key characteristics, pricing and model card**][8]. Simon Willison provides the first comprehensive hands-on review of GPT-5 after two weeks of preview access, and his assessment is refreshingly grounded: it's not revolutionary, but it's remarkably competent. The key insight from his daily usage? "At no point have I found myself wanting to re-run a prompt against a different model to try and get a better result."

  The architecture is fascinating; GPT-5 in ChatGPT operates as a "weird hybrid" with a smart router that switches between different models based on conversation complexity and explicit user intent (like saying "think hard about this"). The API offers more straightforward access with three tiers (regular, mini, nano), each supporting four reasoning levels from minimal to high.

  The pricing strategy is aggressive: GPT-5 at $1.25/million input tokens undercuts GPT-4o by half while maintaining the same output pricing. More importantly, the 90% discount on cached tokens within minutes could dramatically reduce costs for chat applications. The competitive positioning is clear from Willison's comparison table: GPT-5 slots strategically between premium models like Claude Opus 4.1 and mid-tier options.

  The system card reveals interesting training focuses: writing, coding, and health emerged as ChatGPT's most common use cases, explaining the emphasis on these areas. The "safe-completions" approach represents an evolution from binary refusal to nuanced responses that maximise helpfulness while avoiding harmful content, a more sophisticated approach to AI safety.

  **My take:** This feels like the maturation moment for LLMs, less about flashy capabilities and more about reliability and competence. Willison's observation about rarely encountering hallucinations echoes my experience with recent models, suggesting we've crossed a threshold where these tools become genuinely dependable for daily work.

  The pricing war implications are significant. When premium AI capabilities become commodity-priced, the competitive advantage shifts to application design, user experience, and specialised implementations rather than raw model access. The prompt injection results (56.8% attack success rate) serve as a sobering reminder that fundamental security challenges persist despite improvements.

  Most telling is Willison's casual mention of using GPT-5 as his daily driver; that's the real test of any tool's maturity.

## WIND (What Is Niels Doing)

A couple of weeks ago, I mentioned that we were actively searching for venues for our upcoming [**Data & AI Community Day Durban**][9] events. I'm excited to share that we're almost there with securing a venue for our next event in early October!

The venue search process has been quite the journey, but we're now in the final stages of confirmation. As soon as everything is 100% locked in, I'll post the details here and simultaneously open registrations for the event.

Stay tuned for the announcement; I'm really looking forward to bringing the community together again for what promises to be another great day of learning and networking around data and AI topics.

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

[1]: https://www.linkedin.com/pulse/claude-flow-definitive-guide-ai-development-sebastian-redondo-i1ksf/
[2]: https://techcommunity.microsoft.com/blog/integrationsonazureblog/build-secure-launch-your-private-mcp-registry-with-azure-api-center-/4438016
[3]: https://devblogs.microsoft.com/semantic-kernel/guest-blog-building-multi-agent-solutions-with-semantic-kernel-and-a2a-protocol/
[4]: https://developers.googleblog.com/en/introducing-langextract-a-gemini-powered-information-extraction-library/
[5]: https://www.marktechpost.com/2025/08/05/openai-just-released-the-hottest-open-weight-llms-gpt-oss-120b-runs-on-a-high-end-laptop-and-gpt-oss-20b-runs-on-a-phone/
[7]: https://towardsdatascience.com/context-engineering-a-comprehensive-hands-on-tutorial-with-dspy/
[8]: https://simonwillison.net/2025/Aug/7/gpt-5/
[9]: https://aimldatadurban.org/
