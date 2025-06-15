---
type: post
layout: "post"
title: Interesting Stuff - Week 24, 2025
author: nielsb
date: 2025-06-15T06:32:21+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-24-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-24-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
  - AI Coding
  - GAIA
description: "This week is a pivotal moment where AI-assisted development has evolved from experimental tooling to production-ready workflows that are fundamentally reshaping how software gets built. This week's roundup reveals a fascinating convergence around enterprise-grade AI implementation, from Meta's 10.7x training speedups to revolutionary frameworks like Dean Martin's GAIA that transform 'vibe coding' into disciplined methodology."
---

Week 24, 2025, marks a pivotal moment where AI-assisted development has evolved from experimental tooling to production-ready workflows that are fundamentally reshaping how software gets built. This week's roundup reveals a fascinating convergence around enterprise-grade AI implementation, from Meta's infrastructure breakthroughs, which achieve 10.7x training speedups, to revolutionary frameworks like [Dean Martin's][11] **GAIA**, which transform "vibe coding" into a disciplined methodology.

The common thread across every development, whether it's OpenAI's context-hungry o3-pro or sophisticated multi-agent coding workflows, is that AI serves as a multiplier, not a magic wand; the most successful implementations combine AI capabilities with strong engineering fundamentals to create compounding effects. We're witnessing the maturation of an entirely new engineering discipline where success depends not just on prompting skills but on the ability to orchestrate AI systems toward professional-grade outcomes.


## Generative AI

* [**Not Everything Needs Automation: 5 Practical AI Agents That Deliver Enterprise Value**][1]. In this post by Weiwei Hu, we get a refreshingly practical take on AI agents in enterprise settings that cuts through the strategic deck hype. While boardrooms are filled with ambitious AI visions, Hu argues that real value comes from focused agents that tackle specific, repetitive tasks rather than pursuing fantasies of full automation.

  The author identifies five types of AI agents that actually deliver measurable results in enterprise environments. **AI Knowledge Assistants** solve the institutional knowledge problem by using RAG-based approaches to surface answers from internal documentation, turning scattered SharePoint folders and Confluence sites into conversational resources. **Data Analysis Assistants** bridge the gap between business stakeholders and data teams, converting plain-language questions into SQL queries and eliminating the JIRA request bottleneck that frustrates both sides.

  **Tool Integration Assistants** tackle the messy reality of enterprise APIs and poorly documented systems, while **Web Automation Agents** handle the unavoidable manual browser tasks that legacy systems still require. Finally, **Custom Workflow Assistants** orchestrate multi-step processes with human checkpoints, avoiding the "black box" automation that makes risk teams nervous.

  What strikes me about Hu's approach is the emphasis on meeting organizations where they are rather than demanding wholesale digital transformation. Real-world examples, from supply chain contract management to e-commerce price tracking, demonstrate how AI agents can reclaim time without eliminating human oversight. This is the pragmatic AI deployment strategy that enterprises have been searching for, focusing on augmentation rather than replacement.

  The post's conclusion resonates strongly: "*You don't need to automate everything. Just enough to make what you're already doing smarter.*" In an era of AI maximalism, this measured approach might be precisely what enterprise leaders need to hear.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Meta Introduces LlamaRL: A Scalable PyTorch-Based Reinforcement Learning RL Framework for Efficient LLM Training at Scale**][2]. Author Nikhil highlights Meta's latest contribution to the AI infrastructure landscape in this post, with LlamaRL, a PyTorch-based reinforcement learning framework designed to address one of the most persistent challenges in large language model development: efficiently scaling RL training across massive GPU clusters.

  The timing of this release is particularly significant. As the industry continues to push toward ever-larger models, the infrastructure requirements for training have become a significant competitive differentiator. Traditional synchronous RL frameworks create substantial bottlenecks; imagine having hundreds of billions of parameters sitting idle while waiting for sequential operations to complete. It's an expensive problem that directly impacts both training costs and time-to-market for new models.

  **LlamaRL's approach is refreshingly practical.** The framework introduces fully asynchronous execution where different components, generators, trainers, and reward models operate independently rather than waiting for each other. The technical implementation leverages Distributed Direct Memory Access (DDMA) with NVIDIA NVLink to synchronise weights across massive 405 billion-parameter models in under two seconds. That's genuinely impressive when you consider the data volumes involved.

  The performance numbers tell a compelling story: **10.7x speedup on 405B parameter models** when scaling across 1024 GPUs, reducing training step times from over 10 minutes to just under a minute. For enterprises running continuous model training pipelines, these efficiency gains translate directly to substantial cost savings and faster iteration cycles.

  What strikes me most about this development is how it reflects the current state of AI infrastructure competition. While much attention focuses on model architectures and capabilities, the real competitive advantages increasingly lie in training efficiency and operational scalability. Meta's decision to open-source LlamaRL suggests they're betting on ecosystem adoption rather than keeping these optimisations proprietary—a strategic move that could accelerate industry-wide progress while establishing their framework as a standard.

  This represents exactly the kind of infrastructure innovation the field needs as models continue to scale beyond current hardware limitations.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**God is hungry for Context: First thoughts on o3 pro**][3]. Ben Hylak and Alexis tackle perhaps the most intriguing development in AI this week—OpenAI's o3-pro launch, alongside an 80% price cut on the base o3 model. This post provides the first hands-on review of o3-pro, and the insights are fascinating for anyone trying to understand where reasoning models are headed.

  **The central thesis here is compelling:** we're entering an era of task-specific models where traditional "chat with your AI friend" interactions are becoming obsolete. Hylak argues that o3-pro is fundamentally different—it's a "report generator" that requires substantial context to showcase its true capabilities. The authors discovered this through real-world testing: simple prompts yielded underwhelming results, but when they fed o3-pro comprehensive meeting histories, goals, and voice memos from their startup Raindrop, it produced a strategic analysis that "actually changed how we are thinking about our future."

  This observation highlights a critical challenge facing the industry: **how do you evaluate models that require extensive context to demonstrate their superiority?** Traditional benchmarks fall short when a model's strength lies in synthesising large amounts of information rather than answering isolated questions. It's like trying to evaluate a research analyst by asking them trivia questions instead of giving them a comprehensive dataset to analyse.

  The authors highlight o3-pro's improved "environmental awareness", its ability to understand what tools it has access to when to ask for external information, and how to choose appropriate tools for specific tasks. This represents a meaningful evolution beyond pure reasoning toward practical integration with real-world systems.

  Interesting for me is the "context hunger" phenomenon they describe. As models become more sophisticated, they reach a ceiling where simple tests can't reveal their full capabilities. The real differentiator isn't just intelligence anymore—it's the ability to process and synthesise vast amounts of contextual information into actionable insights. This suggests we may need entirely new frameworks for evaluating and deploying these next-generation reasoning models.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**The Gentle Singularity**][4]. Sam Altman, in this post, delivers what may be the most significant strategic communication from OpenAI's leadership to date, a sweeping vision of how artificial general intelligence will reshape humanity over the next decade. Writing with the confidence of someone who believes the most complex technical challenges are behind us, Altman argues that we've already crossed the event horizon into a "gentle singularity."

  **The central premise is both bold and reassuring:** while we're experiencing unprecedented technological acceleration, the transformation will feel manageable rather than catastrophic. Altman frames this around the concept of normalised wonder; how quickly we adapt from being amazed that AI can write paragraphs to expecting it to write novels or from celebrating medical diagnoses to demanding cures.

  His timeline predictions are remarkably specific and aggressive. **2025 brought cognitive agents that transformed coding. 2026 will deliver systems capable of novel insights. In 2027, robots may be handling real-world tasks.** By the 2030s, he envisions intelligence and energy becoming "wildly abundant," removing the fundamental constraints on human progress.

  What's particularly striking is Altman's emphasis on recursive self-improvement already beginning. He notes that scientists report being 2-3x more productive with AI assistance and, crucially, that AI is now accelerating AI research itself. This creates compounding loops where today's systems help build tomorrow's more capable successors.

  The economic implications he outlines are staggering: robots building other robots, datacenters constructing additional datacenters, and intelligence costs eventually converge toward the price of electricity. He even provides specific metrics; ChatGPT queries currently use about 0.34 watt-hours, comparable to running an oven for a second.

  Perhaps most tellingly, Altman positions this not as speculation but as inevitable trajectory management. His two-step framework, solve alignment, then democratise access, reads less like a research agenda and more like an implementation plan. The confidence is either inspiring or concerning, depending on your perspective on whether OpenAI has truly solved the technical challenges they claim are behind us.

  This feels like a CEO preparing stakeholders for a world where his company's technology fundamentally reshapes civilisation within the current decade.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**AI-assisted coding for teams that can't get away with vibes**][5]. Atharva Raykar, in this post, delivers what feels like essential reading for any engineering team grappling with AI integration, a practical playbook from the trenches of production software development that cuts through the hype to focus on what actually works.

  **The core insight here is profound yet simple:** AI is a multiplier, not a magic wand. If you're a weak engineer, AI will amplify your weaknesses. If you're skilled, it becomes a powerful force multiplier. Raykar emphasises that the best engineers extract dramatically more value from AI tools because they possess superior technical communication skills, refined taste, and what he calls "the mechanic's touch"—the ability to steer systems toward quality outcomes.

  The contrast between basic and thoughtful prompting is illuminating. Compare "Write a Python rate limiter" versus a detailed spec considering thread safety, memory management, and edge cases. The latter approach demonstrates how engineering excellence translates directly to better AI outcomes.

  **What's particularly valuable is Raykar's emphasis on environmental factors.** He argues that AI thrives in well-organised codebases with good test coverage, consistent patterns, and precise documentation, the same conditions where human engineers excel. This challenges teams to view AI adoption not as a shortcut around good practices but as an accelerant that rewards existing engineering disciplines.

  The practical recommendations are immediately actionable: use frontier models rather than cheaper alternatives, break features into smaller tasks, leverage "meta prompting" to improve prompt quality, and maintain extensive documentation. His suggestion to create `RULES.md` files encoding team standards shows how traditional engineering practices adapt to AI workflows.

  Perhaps most importantly, Raykar acknowledges the philosophical shifts AI brings to software development. He argues that sophisticated abstractions become less valuable when code generation is cheap and that the "generator-verifier gap" makes it easier to review and fix code than create it from scratch.

  This represents the kind of mature, production-tested wisdom that engineering teams need as they navigate the transition from AI as an experiment to AI as an essential development tool.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**How Two Engineers Ship Like a Team of 15 With AI Agents**][6]. This post by Dan Shipper captures a fascinating conversation with Kieran Klaassen and Nityesh Agarwal from Cora, who've developed what might be the most advanced AI-assisted development workflow I've seen documented. Their approach represents a fundamental shift from traditional coding practices to orchestrating multiple AI agents like a team of specialists.

  **The core insight here is "compounding engineering": each piece of work makes the next piece easier.** Kieran and Nityesh have built custom prompts that generate detailed technical specifications, which then serve as inputs for Claude Code to execute complex implementations. They've created a system where speaking an idea aloud can result in a pull request within minutes.

  Their workflow is remarkably sophisticated. They use Claude Code as their primary agent but strategically deploy different tools for specific tasks: Friday for UI work, Charlie for code reviews, and Claude Code for research and complex implementations. What's particularly impressive is their preparation strategy; before Claude 3.5 Sonnet launched, they spent hours creating 20+ detailed GitHub issues, essentially preparing a backlog for their "coding genie."

  **The technical execution details are enlightening.** They've developed custom commands (like "CCY" for Claude Code) that trigger comprehensive research workflows. These agents don't just write code—they analyse codebases, research best practices, create implementation plans, and even generate GitHub issues automatically. Kieran mentions running Claude Code for 25+ minutes on complex tasks, with the agent iteratively fixing tests and refining implementations.

  Perhaps most telling is their tier rankings of AI coding tools: Claude Code dominates at the S-tier, with Amp close behind, while traditional tools like Cursor rank at the A-tier and Windsurf drops to the C-tier without Claude 4 access. This reflects how quickly the landscape shifts when new model capabilities emerge.

  The conversation reveals both the promise and challenges of this approach—they emphasise catching errors "at the lowest value stage" and maintaining human oversight at critical decision points. It's not full automation but rather intelligent orchestration that amplifies human judgment rather than replacing it.

  This is a preview of how software development will evolve as AI agents become more capable teammates rather than simple tools.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**How I Use Claude Code**][7]. Philipp Spiess delivers one of the most comprehensive and practical deep dives into Claude Code usage in this post that I have encountered. Writing as an engineer at Tailwind Labs with extensive production experience, Spiess shares battle-tested patterns that go far beyond basic "how to prompt an AI" advice.

  **The standout insight here is the aggressive use of `/clear` to start fresh conversations.** This challenges the common assumption that a longer context is always better. Spiess argues that AI agents become unpredictable as conversations extend, especially when switching between different types of questions. This mirrors what many experienced users have discovered but rarely articulate so clearly.

  The technical depth is impressive. Spiess reveals Claude Code's hidden `Task` tool, which can spawn parallel sub-agents with different expertise areas—imagine running four specialised agents simultaneously to analyse a Tailwind component from design, accessibility, responsiveness, and styling perspectives. This kind of parallel processing represents a major productivity leap over sequential interactions.

  **His "yolo mode" approach is particularly revealing.** Running Claude with `dangerously-skip-permissions` might sound reckless, but for experienced developers working on longer tasks, the constant permission interruptions become genuine productivity killers. The fact that he's now hitting rate limits more frequently because Claude can work more autonomously tells its own story about usage intensity.

  The workflow patterns demonstrate sophisticated engineering thinking. Git worktrees for parallel Claude sessions, custom slash commands for repeated prompts, and an emphasis on staging changes early demonstrate how traditional development practices adapt to AI-assisted workflows. His point about avoiding "one-shot" approaches for complex changes—instead building incrementally with tighter feedback loops—challenges the "perfect prompt" mentality that many new users fall into.

  What's particularly valuable is Spiess's honesty about limitations. His struggles with autonomous feedback cycles and preference for human-in-the-loop verification provide a crucial counterbalance to AI maximalist claims. This feels like wisdom from someone who has pushed these tools to their limits in real-world production environments.

  This represents the kind of mature, nuanced understanding that emerges when skilled practitioners spend months integrating AI tools into serious development work.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**The Future of Software Development with (Generative) AI- Part 1**][8]. This post by Amir Piltan presents a comprehensive framework for understanding how AI is transforming software development, drawing on five years of hands-on experience building AI-assisted development products. This isn't just another "AI will change everything" piece; it's a systematic analysis of where we've been, where we are, and where we're heading.

  **The three-phase evolution framework is particularly insightful.** Piltan traces the journey from basic code completion tools (think IntelliSense from 1996) through today's "AI Development Bots," such as GitHub Copilot, to emerging "AI Development Agents" that can complete end-to-end tasks. ** The distinction isn't just semantic; each phase represents fundamentally different capabilities and human-AI relationships.

  What's striking is the market validation behind these trends. GitHub Copilot's growth to 1.3 million paid subscribers, with a 30% quarterly increase, combined with Gartner's prediction that 90% of enterprise engineers will use AI assistants by 2028, suggests we're witnessing genuine adoption rather than hype cycles.

  **The technical depth around multi-agent collaboration is noteworthy.** Piltan highlights frameworks like AutoGen and Crew AI that enable specialised agents to work together, citing Andrew Ng's claim that agent workflows may drive more AI progress than next-generation foundation models. The performance improvements are striking, with GPT-3.5 jumping from 48.1% to 95.1% accuracy on coding tasks through iterative agent workflows.

  His forward-looking vision becomes increasingly speculative but thought-provoking. The progression from "AI Co-Developers" to "Virtual AI Development Teams" represents a potential paradigm shift from AI-Assisted Development (AIAD) to Human-Assisted Development (HAD), where AI takes the lead, and humans provide oversight. This inversion could fundamentally reshape developer roles toward what he calls "Development Orchestrators."

  The analysis acknowledges crucial limitations, current LLMs' inability to truly understand the context or apply common sense reasoning, as emphasised by Yann LeCun. Yet Piltan envisions future training on recordings of real development teams in action, capturing not just code but entire collaborative processes as well.

  This piece stands out for its balanced perspective, combining industry experience with strategic foresight while acknowledging the substantial technical hurdles that remain. It's essential reading for anyone seeking to understand the direction of software development in the era of AI.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**GenAI Application Engineers**][9]. In this comprehensive piece from The Batch Issue 305, Andrew Ng identifies and defines an emerging role that's reshaping the tech landscape: the GenAI Application Engineer. This post articulates how these professionals represent a fundamental shift in software development, combining traditional engineering skills with AI-native capabilities to build applications faster and more powerfully than ever before.

  Ng, in this post, outlines two primary criteria that define skilled GenAI Application Engineers. First, they must master what he calls "AI building blocks": a diverse toolkit that extends far beyond basic LLM API calls to include prompting techniques, agentic frameworks, RAG systems, voice stacks, embeddings, vectorDBs, and emerging technologies like browser automation and reasoning models. Using a clever Lego brick analogy, the author explains how having access to multiple types of building blocks enables the creation of far more sophisticated and functional structures than relying on just one type of block.

  The second critical skill involves leveraging AI-assisted coding tools effectively. This post traces the evolution from GitHub Copilot's pioneering code autocompletion in 2021-2022 to today's highly agentic coding assistants, such as OpenAI's Codex and Anthropic's Claude Code. Ng emphasises that these tools reach their full potential only in the hands of engineers who understand both AI fundamentals and software architecture principles, those who don't just "vibe code" but can strategically guide systems toward well-defined product goals.

  **What strikes me as particularly insightful here is Ng's observation about the different obsolescence rates between AI building blocks and AI-assisted coding techniques.** While building blocks from 1-2 years ago remain relevant today, coding assistance tools become outdated much faster due to intense competitive pressure and massive investments from major players. This suggests that staying current with coding tools should be a higher priority for professionals in this space than constantly chasing new building blocks.

  The author also highlights the importance of product and design instincts as a significant bonus skill. In an environment where AI product managers are scarce, GenAI Engineers who can make independent decisions about user interfaces and product features from high-level guidance can dramatically accelerate development cycles.

  Perhaps most valuably, this post reveals Ng's key interview question for identifying top talent: "How do you keep up with the latest developments in AI?" The response reveals whether candidates have effective learning strategies, such as reading quality publications, building hands-on projects, and engaging with knowledgeable communities, versus relying on superficial sources like social media that lack the depth needed for true expertise.

  This piece effectively captures a pivotal moment in tech hiring, where traditional software engineering roles are evolving to require a fundamentally different skill set that bridges classical programming with AI-native development approaches.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**GAIA: The AI Coding Framework - Smart Software Development**][10]. In this remarkable repository, [Dean Martin][11] (a colleague and very good friend of mine) presents **GAIA** (named after the Greek personification of Earth). GAIA is a revolutionary framework that transforms the concept of "vibe coding" into a systematic approach for building complete, production-ready applications. The repository demonstrates how to leverage AI-powered development environments to go from idea to deployment in a single continuous conversation.

  **What makes Dean's approach particularly compelling is how it addresses the core challenge Andrew Ng highlighted about "vibe coding" versus structured engineering.** Rather than dismissing the intuitive, flow-state approach that many developers love, Dean has created a framework that harnesses that energy while ensuring professional-grade outcomes through automated quality assurance and comprehensive testing.

  The GAIA framework operates through a sophisticated, prompt-driven system that begins with reading design specifications and automatically progresses through complete system architecture, frontend development, backend implementation, database setup, containerisation, and CI/CD pipeline creation. The system's "GAIA NEVER STOPS" philosophy means it continues working autonomously without requiring constant "Continue" prompts, displaying milestone updates and progress reports throughout the development process.

  The repo showcases an impressive range of automatically detected project patterns, from e-commerce stores with payment integration to real-time chat applications and analytics dashboards. The framework intelligently adapts to project requirements, applying appropriate architectural patterns whether you're building a simple personal project or a system designed to support thousands of concurrent users.

  Dean's approach particularly shines in its emphasis on visual quality assurance. The framework includes mandatory Playwright screenshot testing, which acts as a "strict frontend UI/UX police," ensuring that applications not only function correctly but are also genuinely beautiful and professional. This addresses a common pain point where AI-generated interfaces might work technically but lack the visual polish expected in production applications.

  The repository's commitment to production readiness is evident in its zero-tolerance standards: 100% test coverage, zero build warnings, perfect linting, security by default with authentication and authorisation, and comprehensive end-to-end testing for all routes and controllers. The final verification process includes opening the completed application in the terminal to demonstrate the working end result.

  **This framework represents a fascinating evolution of the "vibe coding" concept - transforming it from a potentially chaotic approach into a disciplined methodology that maintains creative flow while ensuring enterprise-grade quality.** By combining intuitive development with automated quality gates, Dean has created a solution that bridges the gap between rapid prototyping and production deployment, making it an excellent complement to the GenAI Application Engineer skill set that Andrew Ng described.

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

[1]: https://towardsdatascience.com/not-everything-needs-automation-5-practical-ai-agents-that-deliver-enterprise-value/
[2]: https://www.marktechpost.com/2025/06/10/meta-introduces-llamarl-a-scalable-pytorch-based-reinforcement-learning-rl-framework-for-efficient-llm-training-at-scale/
[3]: https://www.latent.space/p/o3-pro
[4]: https://blog.samaltman.com/the-gentle-singularity
[5]: https://blog.nilenso.com/blog/2025/05/29/ai-assisted-coding/
[6]: https://every.to/podcast/how-two-engineers-ship-like-a-team-of-15-with-ai-agents
[7]: https://spiess.dev/blog/how-i-use-claude-code
[8]: https://pub.towardsai.net/the-future-of-software-development-with-generative-ai-part-1-5c346b45cad6
[9]: https://www.deeplearning.ai/the-batch/issue-305/
[10]: https://github.com/frostaura/fa.templates.vibe-coding
[11]: https://www.linkedin.com/in/deanmartinza/
