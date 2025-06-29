---
type: post
layout: "post"
title: Interesting Stuff - Week 26, 2025
author: nielsb
date: 2025-06-29T08:34:01+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-26-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-26-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - AI Coding
  - streaming
  - Kafka
  - Flink
description: "This week's tech exploration reveals a fundamental shift from simple chatbots to sophisticated AI agents that can collaborate, remember, and reason across time. We're witnessing revolutionary developments like Google's A2A protocol for agent interoperability, SQL-powered architectures, and advanced context engineering that manages AI 'working memory.' As these technologies become production-ready, success depends less on code generation speed and more on the architectural judgment we bring to building truly intelligent systems."
---

This week's tech exploration reveals a fundamental shift in AI agent development, from simple chatbots to sophisticated, memory-enabled systems that can collaborate, remember, and reason across time. We're witnessing the emergence of revolutionary protocols, such as Google's A2A, that enable seamless agent interoperability. Meanwhile, innovative approaches are transforming everything from how we architect agents (think SQL-powered systems) to how we manage their cognitive "working memory" through advanced context engineering. 

The tools and frameworks are rapidly maturing, with practical implementations now available for multi-session memory, multimodal retrieval, and persistent agent behaviours that feel truly conversational rather than stateless. As AI accelerates development speed by 55%, the real differentiator becomes not the code we can generate but the judgment, expertise, and architectural thinking we bring to building production-ready intelligent systems.

<!--more-->

## Generative AI

* [**Building an A2A-Compliant Random Number Agent: A Step-by-Step Guide to Implementing the Low-Level Executor Pattern with Python**][1]. This post by Arham Islam offers a comprehensive, hands-on tutorial for implementing Google's new Agent-to-Agent (A2A) protocol, which promises to revolutionise the way AI agents communicate and collaborate. The A2A protocol addresses one of the most significant challenges in the multi-agent ecosystem: ensuring seamless interoperability between agents built on different frameworks and developed by different teams.

  The tutorial walks through building a simple random number generator agent that demonstrates the core A2A concepts. What makes this particularly valuable is how it breaks down the protocol into digestible components - from setting up the Agent Executor that handles the core business logic to creating Agent Card (essentially the agent's "business card" containing metadata about its capabilities) and finally implementing the client-server communication flow.

  The implementation showcases several key A2A architectural patterns. The Low-Level Executor Pattern is central to the design, where the `RandomNumberAgentExecutor` wraps the agent's functionality and handles the standardised message formatting. The Agent Card system is equally important, providing a standardised way for agents to advertise their capabilities, supported input/output modes, and available skills to potential collaborators.

  What's particularly compelling about this approach is how it abstracts away the complexity of inter-agent communication while maintaining flexibility and adaptability. Instead of building custom integration logic for each agent pairing, developers can rely on HTTP-based standardised messages and well-defined schemas. This could significantly accelerate the development of complex multi-agent systems where different specialised agents need to work together seamlessly.

  The practical implications here are substantial. As AI systems become more modular and specialised, the ability to compose agents from different vendors and frameworks into cohesive workflows becomes crucial. Google's A2A protocol could emerge as the TCP/IP of the AI agent world - providing the foundational communication layer that enables a truly interoperable ecosystem of AI agents.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**This AI Agent Should Have Been a SQL Query**][2]. Gunnar Morling presents a fascinating thought experiment in this post that challenges conventional wisdom about building AI agents. Drawing inspiration from Seth Wiesman's argument that many microservices should be implemented as SQL queries, Morling explores whether the same principle applies to agentic systems, specifically, whether AI agents could be more effectively implemented as streaming SQL queries on platforms like Apache Flink.

  The premise is both unconventional and compelling. Rather than viewing AI agents as complex, stateful applications, Morling suggests treating them as event-driven data processing pipelines that incorporate LLM interactions. His research paper summarisation example elegantly demonstrates this concept, where incoming papers trigger SQL-based workflows that extract text, invoke OpenAI models for summarisation, and output structured results, all declaratively expressed through streaming SQL.

  What's particularly intriguing about this approach is how it leverages Flink's robust streaming capabilities to address core agent requirements. The platform's native support for LLM integration through FLIP-437's `CREATE MODEL` statements and `ML_PREDICT()` functions transforms what might traditionally require custom application code into declarative SQL operations. The event-driven nature aligns perfectly with many enterprise AI use cases, where agents need to react to real-time data streams rather than user conversations.

  The architectural benefits extend beyond mere simplicity. Stream processing platforms offer built-in solutions to address challenges that often plague custom agent implementations, including fault tolerance, scalability, state management, and event ordering. Flink's ecosystem of connectors provides seamless integration with diverse data sources, while its unified batch and stream processing enables both real-time reactions and historical data reprocessing for agent improvements.

  However, Morling acknowledges the limitations thoughtfully. While SQL excels at structured data processing and can incorporate LLM calls, it falls short when agents require complex decision-making, tool selection, or sophisticated state management. The emergence of standards like Anthropic's Model Context Protocol (MCP) for dynamic tool integration highlights capabilities that surpass what is reasonable in a SQL-based implementation.

  The broader implications are significant for the AI infrastructure landscape. As organisations grapple with deploying reliable, scalable AI agents in production, the appeal of leveraging proven stream processing infrastructure becomes clear. The democratisation aspect is equally important - enabling SQL-familiar data engineers to build agentic systems could dramatically expand the talent pool capable of implementing these solutions.

  Looking ahead, the announcement of Flink's Agents sub-project (FLIP-531) suggests the community recognises this direction's potential, aiming to create a dedicated runtime that combines Flink's proven foundation with agent-specific capabilities. This could bridge the gap between declarative SQL-based workflows and more sophisticated agentic behaviours.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Why developer expertise matters more than ever in the age of AI**][3]. This post by Laura Lindeman and the GitHub Staff addresses one of the most critical questions facing our industry today: as AI tools make coding faster and more accessible, what defines developer value in this new landscape? Their answer is both reassuring and challenging - it's not about rejecting AI but about elevating the uniquely human skills that AI cannot replace.

  The central thesis is compelling: while GitHub Copilot can increase coding speed by up to 55%, junior developers see particularly dramatic productivity gains; however, speed without judgment creates significant risks. The authors argue that true developer expertise lies not in code production but in understanding why code works, how it fits into larger systems, and what happens when things inevitably break down.

  What's particularly valuable about this perspective is how it reframes the AI conversation from replacement anxiety to capability amplification. GitHub's CEO, Thomas Dohmke, observes that "Startups can launch with AI-generated code, but they can't scale without experienced developers." This crystallises the point perfectly. The challenge isn't competing with AI but becoming the multiplier that transforms AI's raw output into resilient, scalable, and secure software.

  The three fundamental skills they highlight, pull requests, code reviews, and documentation, seem basic, but they represent the foundation of thoughtful software development. Their emphasis on asking "why" before accepting AI suggestions is crucial. In an era where AI can generate entire code blocks instantly, the ability to evaluate, contextualise, and improve those suggestions becomes the differentiating skill.

  The practical guidance is immediately actionable. The pull request checklist, code review heuristics, and documentation framework utilising the Diátaxis structure provide concrete steps for developers at all levels. The skills progression matrix effectively illustrates how these fundamentals evolve from junior to senior levels, with senior developers not just using these tools but mentoring others and thinking systematically about architecture and security implications.

  Perhaps most importantly, this post challenges the notion that AI democratises programming to the point where deep expertise becomes unnecessary. Instead, it suggests that AI raises the stakes for expertise by accelerating the pace at which good and bad decisions compound. When you can ship code 55% faster, the quality of your judgment becomes 55% more consequential.

  The "human-in-the-loop" concept they champion isn't just about oversight; it's about bringing critical thinking, a systems perspective, and contextual understanding that transforms AI from a code generator into a true force multiplier for building robust software systems.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Multi Modal Multivector Representations in Qdrant for Reranking powered by Adaptive Refresh**][4]. My good friend [Indrajit][8], in this post, demonstrates a sophisticated approach to overcoming traditional RAG limitations by implementing a unified multimodal and multivector system using Qdrant. The work addresses a critical pain point in current retrieval systems: the loss of fine-grained semantic information when compressing entire documents into single dense embeddings.

  The architecture presented is particularly compelling because it elegantly combines three distinct embedding strategies within a single Qdrant collection. The dense text embeddings using BAAI/bge-small-en provide fast initial retrieval through traditional single-vector search. The ColBERT token-level multivector embeddings enable precise late-interaction reranking by preserving granular semantic details at the token level. Finally, CLIP-based image embeddings support accurate cross-modal retrieval between text and visual content.

  What sets this implementation apart is the strategic use of Qdrant's indexing configuration. The system disables HNSW indexing for the ColBERT multivector field while maintaining it for dense text and image vectors, creating an optimised two-stage retrieval pipeline. This design choice reflects a deep understanding of retrieval efficiency trade-offs, utilising approximate search for initial candidate generation and exact matching for reranking precision.

  The late-interaction reranking mechanism, utilising MaxSim operations, represents a significant advancement over traditional approaches. Rather than relying on pre-aggregated document representations, the system performs token-wise matching at query time, enabling much more nuanced relevance scoring. This is particularly valuable for complex queries where specific phrases or concepts within documents matter more than overall document similarity.

  The adaptive refresh mechanism adds practical production value by automatically detecting and embedding new text-image pairs while avoiding reprocessing of existing content. This ensures the vector store stays synchronised with evolving datasets without manual intervention, a crucial feature for dynamic content environments.

  However, the implementation reveals an important architectural distinction that's worth noting: while the system is both multimodal and multivector, these capabilities operate independently. Image vectors remain separate single embeddings rather than being integrated into the multivector ColBERT field, which maintains a clear separation between modalities while enabling cross-modal search.

  The technical depth here is impressive, from the detailed embedding pipeline configuration to the sophisticated query execution strategy that combines prefetch operations with multivector reranking. This represents a production-ready framework that could significantly improve retrieval accuracy for complex multimodal content, particularly in scenarios requiring precise semantic matching across both textual and visual information.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Why Context Engineering Matters More Than Prompt Engineering**][5]. The author of this post articulates a paradigm shift that's reshaping how we think about AI development. Using Andrej Karpathy's powerful analogy of LLMs as CPUs and context windows as RAM, the author makes a compelling case that we've moved beyond the era of crafting perfect prompts to managing the entire "working memory" of AI agents.

  The central insight is profound: while prompt engineering optimises individual interactions, context engineering manages the accumulated cognitive load across extended agent sessions. This shift reflects the maturation of AI applications from simple Q&A tools to sophisticated systems that maintain state, execute tools, and engage in hundreds of conversational turns.

  The six context channels framework provides excellent mental models for understanding where complexity accumulates. Tool calls, RAG documents, memories, and structured outputs all compete for precious context window real estate. The author's real-world example of a research agent burning through 500,000 tokens in a single session illustrates why this isn't just an academic concern; it's a production reality affecting both costs and performance.

  What's particularly valuable is the three-pillar framework of compress, persist, and isolate. The compression strategies, especially the recommendation to compress at tool boundaries using smaller LLMs, offer immediate practical value. The memory system approaches, from simple file-based storage to sophisticated embedding-based retrieval, provide a clear progression path for implementation.

  The custom context formats section delivers concrete results, achieving a 35% token reduction through structured XML/YAML approaches versus standard message formats. This demonstrates how treating the context window as an engineerable interface rather than a dumping ground for conversation history can yield significant efficiency gains.

  However, the post also honestly addresses the challenges, particularly those related to multi-agent systems. The warning about 15 times higher token usage and coordination complexities provides a necessary balance to the enthusiasm surrounding parallel agent architectures.

  The three-phase implementation roadmap feels particularly actionable, emphasising measurement first; you can't optimise what you don't track. Starting with token instrumentation and state schema design and then moving to advanced patterns reflects sound engineering principles.

  Perhaps most importantly, this post positions context engineering not as an isolated technique but as a foundational infrastructure for the entire AI application stack. The argument that dismissing LLM applications as "ChatGPT wrappers" misses the sophisticated software layer coordinating individual LLM calls into functional applications resonates strongly as the field matures.

  The discipline may be young, but the trend is clear: as AI agents become more capable and autonomous, the skill of engineering their cognitive working memory becomes the differentiating factor between prototype demos and production-ready systems.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**AI Agent with Multi-Session Memory**][6]. Mauro Di Pietro presents a hands-on tutorial in this post that addresses one of the most fundamental challenges in AI agent development: building memory that persists across sessions. By drawing parallels to computer memory hierarchies, primary (RAM), secondary (storage), and tertiary (backup), the author provides an intuitive framework for understanding how AI agents can maintain context beyond individual conversations.

  What makes this tutorial particularly valuable is its practical accessibility. Using only Python and Ollama (no GPU or API keys required), Di Pietro demonstrates how to build a fully functional agent with persistent memory using open-source tools. The choice of Alibaba's Qwen model and ChromaDB for vector storage creates an entirely local, privacy-preserving solution that keeps all conversation data on the user's machine.

  The technical implementation is well-structured around three key components: the local LLM setup with Ollama, ChromaDB for conversation storage, and a tool-based retrieval system. The vector database approach is particularly effective, as it automatically generates metadata keywords for each conversation using the LLM itself. This enables the system to create rich, searchable context without incurring manual annotation overhead.

  The code walkthrough is thorough and educational, demonstrating how to extract conversation history, store it with enriched metadata that includes timestamps and auto-generated tags, and implement retrieval-augmented generation (RAG) to access relevant past conversations. The tool-based architecture, where memory retrieval and final answer generation are treated as separate tools, provides a clear separation of concerns, making the system more modular.

  What's especially practical is the conversation flow management. The agent is designed to first use the retrieval tool to search for relevant past conversations, then process that information along with the current query to provide a contextually aware response. The implementation ensures each tool is used only once per query, preventing infinite loops while maintaining efficiency.

  The real-world demonstration effectively shows the memory system in action. When asked about a topic not directly related to the previous session, the agent automatically searches its conversation history, retrieves relevant context, and incorporates that knowledge into its response. This seamless integration of past and present context is precisely what makes agents feel truly conversational rather than stateless.

  The tutorial's strength lies in its completeness, from initial setup through database configuration to the final working agent. The three-tier memory model offers a clear conceptual framework that developers can extend to support more sophisticated use cases, whether building personal assistants, customer support bots, or specialised domain agents.

  For developers seeking to transition from single-session chatbots to persistent, contextually aware AI agents, this implementation offers both the theoretical foundation and practical code necessary to get started. The local-first approach also addresses growing concerns about data privacy while demonstrating that sophisticated AI capabilities don't always require cloud-based solutions. 

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Agentic AI: Implementing Long-Term Memory**][7]. Ida Silfverskiöld, in this post, delivers a comprehensive exploration of one of the most challenging aspects of building production AI agents: implementing effective long-term memory. Using the compelling analogy of the movie Memento, where the protagonist must constantly be reminded of what happened before, she illustrates the fundamental problem with stateless LLMs and the complexity of building systems that can remember and reason about information across time.

  The article's strength lies in its systematic breakdown of the memory problem into distinct components. The distinction between "pocket-sized facts" (specific, structured information, such as user preferences) and "long-span memory" (complete conversation histories and summaries) provides a clear framework for understanding different memory requirements. This mirrors how ChatGPT implements its memory system, using classifiers to identify facts worth storing and organising them into predefined categories.

  The architectural comparison between vector-based and knowledge graph approaches is particularly insightful. While vector databases with hybrid search represent the more accessible starting point for most developers, Silfverskiöld clearly articulates their limitations: memory bloat, conflicting facts, and challenges with temporal reasoning. Knowledge graphs, while more complex to implement, offer structured relationships that enable better multi-hop reasoning and the ability to invalidate outdated facts while preserving historical context through timestamped relationships.

  The vendor analysis section provides practical value by evaluating current solutions, such as Mem0, Letta, Zep, and others, across key dimensions, including architecture choice, self-editing capabilities, and enterprise features. The inclusion of pricing estimates is beneficial for understanding the economics of implementing memory at scale. The observation that costs can quickly escalate beyond a few thousand messages underscores the importance of strategic implementation, which involves using classifiers to determine which information warrants expensive cloud-based storage versus local storage and compression.

  What makes this analysis especially valuable is the honest assessment of current limitations. Silfverskiöld notes that even with sophisticated memory systems, hallucinations remain an inherent challenge, and no current system achieves perfect accuracy. This pragmatic perspective helps set realistic expectations for developers implementing these systems.

  The economic considerations section deserves particular attention. The reminder that memory systems add both complexity and cost to applications is crucial for production planning. The suggestion of hybrid approaches, utilising cloud solutions for high-value data while implementing local vector storage for bulk conversation history, provides a practical path for effectively scaling costs.

  The temporal reasoning examples are compelling: understanding that "I'll move to Berlin in two months" should update location information when asked about it months later requires a sophisticated understanding of time and state changes. This highlights why knowledge graphs, with their ability to structure relationships and timestamps, may be superior for applications requiring complex reasoning across time.

  For developers building agentic systems, this article serves as both a technical guide and a strategic roadmap. It demonstrates that effective memory isn't just about storage; it's about creating systems that can extract, update, connect, and reason information in ways that feel natural and intelligent to users. The field may be young, but the fundamental challenges and architectural patterns outlined here provide a solid foundation for building memory-enabled AI agents.

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

[1]: https://www.marktechpost.com/2025/06/21/building-an-a2a-compliant-random-number-agent-a-step-by-step-guide-to-implementing-the-low-level-executor-pattern-with-python/
[2]: https://www.morling.dev/blog/this-ai-agent-should-have-been-sql-query/
[3]: https://github.blog/developer-skills/career-growth/why-developer-expertise-matters-more-than-ever-in-the-age-of-ai/
[4]: https://medium.com/@official.indrajit.kar/multi-modal-multivector-representations-in-qdrant-for-reranking-powered-by-adaptive-refresh-231fd240d812
[5]: https://pub.towardsai.net/why-context-engineering-matters-more-than-prompt-engineering-8fd01cd2d0b6?sk=v2%2F5dd47d05-aa18-4059-89a7-1907b5a1cfdf
[6]: https://towardsdatascience.com/ai-agent-with-multi-session-memory/
[7]: https://towardsdatascience.com/agentic-ai-implementing-long-term-memory/
[8]: https://www.linkedin.com/in/indrajit-kar/
