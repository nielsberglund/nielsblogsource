---
type: post
layout: "post"
title: Interesting Stuff - Week 38, 2025
author: nielsb
date: 2025-09-21T06:04:03+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-38-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-38-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude
  - AI Agents
  - Databases
  - Data & AI Community Day Durban
description: "Week 38, 2025 tech roundup: Anthropic reveals multi-agent AI system challenges, Berkeley researchers propose agent-first database redesigns, and Durban's Data & AI Community Day sells out in 48 hours. Latest AI development insights and production engineering realities."
---

This week was notably quieter on the tech front, with fewer developments catching my attention than usual. The standout stories center around the fundamental challenges of building AI systems that actually work in production: from Anthropic's candid deep-dive into the engineering complexities of their multi-agent research system to Berkeley researchers arguing that databases need complete architectural overhauls to handle the chaotic querying patterns of LLM agents. 

Both pieces highlight how the gap between AI prototypes and production-ready systems remains surprisingly wide, with solutions requiring everything from careful prompt engineering frameworks to entirely new database paradigms. Meanwhile, the rapid sellout of our [**Data & AI Community Day Durban**][3] event demonstrates that while the tech news cycle may have slowed, enthusiasm for AI development in our local community certainly hasn't.

<!--more-->

## Generative AI

* [**How we built our multi-agent research system**][1]. In this post, the Anthropic engineering team delivers a comprehensive deep dive into how they built Claude's Research feature, a sophisticated multi-agent system that's fundamentally changing how we approach complex information gathering tasks. Rather than the typical static retrieval methods that most AI systems rely on, Anthropic's approach uses multiple Claude agents working in parallel, with a lead orchestrator delegating specialised research tasks to subagents that can dynamically adapt their search strategies based on what they discover.

  The results are impressive: their multi-agent system with Claude Opus 4 as the lead agent and Claude Sonnet 4 subagents outperformed single-agent Claude Opus 4 by a staggering 90.2% on internal research evaluations. The secret sauce? Token usage explains 80% of performance variance, and multi-agent architectures effectively distribute cognitive load across separate context windows. However, there's a significant trade-off; these systems burn through 15x more tokens than regular chat interactions, making them economically viable only for high-value research tasks.

  What makes this engineering post particularly valuable is how candidly the team discusses the challenges of building production-ready agent systems. From prompt engineering nightmares (early agents would spawn 50 subagents for simple queries) to the complex coordination problems that emerge when multiple AI agents try to work together, Anthropic learned that the "last mile often becomes most of the journey" when building reliable agent systems. Their solution involved careful prompt design that teaches agents how to delegate effectively, scale effort appropriately to query complexity, and use specialised tools correctly, essentially creating frameworks for AI collaboration rather than rigid instruction sets.

  he technical architecture reveals fascinating insights about the future of AI systems. Unlike traditional RAG approaches that fetch static chunks of information, Anthropic's system uses a dynamic, iterative search that adapts to findings in real-time. The engineering challenges they solved, from handling stateful execution and compound errors to implementing rainbow deployments for continuously running agents, provide a roadmap for anyone building complex AI applications. Their emphasis on comprehensive evaluation methods, including LLM-as-judge systems and human testing to catch edge cases, shows the maturity needed to deploy these systems at scale.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Supporting our AI overlords: Redesigning data systems to be Agent-first**][2]. Murat Demirbas, in this post, explores a fascinating Berkeley systems research paper that argues that databases need a complete architectural overhaul to handle the chaotic querying patterns of LLM agents. Unlike human analysts who craft precise SQL queries, AI agents engage in what the researchers call "agentic speculation", bombarding databases with exploratory schema inspections, redundant partial aggregates, and speculative joins that would make any DBA weep into their coffee. The paper's experimental findings are eye-opening: when multiple agents tackle the same task, less than 20% of their query subplans are actually unique, meaning 80% of the computational work is pure redundancy.

  The proposed solution involves redesigning the entire database stack around "probes" instead of traditional SQL queries. These probes bundle multiple queries with natural language briefs that explain the agent's intent, tolerance for approximation, and current exploration phase. The database responds not just with results but with proactive feedback, cost estimates, schema hints, and steering suggestions to guide agents toward more efficient paths. It's essentially turning databases into AI whisperers that can communicate back to their silicon overlords.

  What I find particularly compelling about Demirbas's analysis is his challenge to the paper's fundamental assumption. While the Berkeley team accepts agent inefficiency as a given and argues that databases must adapt, Demirbas raises the crucial question: Why not train agents to query more intelligently? This touches on a broader philosophical tension in AI system design: should we build infrastructure around current AI limitations, or should we improve the AI to work better with existing systems? The neurosymbolic angle he suggests is intriguing: imagine a future where neural agents generate hypotheses while symbolic databases test and refine them, creating a true reasoning partnership rather than a one-sided accommodation.

  The engineering challenges highlighted here go far beyond simple caching solutions. Multi-tenancy, distributed execution, and maintaining consistency across thousands of speculative branches represent genuinely challenging problems that the database community will need to solve. As someone who's watched the evolution from single-threaded applications to massively parallel systems, this feels like another fundamental shift where the infrastructure layer needs to evolve to support new computational patterns, even if those patterns seem wasteful by today's standards.

## WIND (What Is Niels Doing)

I'm still processing what just happened. Last week, I wrote about how registrations had just opened for our [**Data & AI Community Day Durban: Ready Player 2 - Augment Yourself with AI Superpowers**][3] event on October 11 at [**Richfield College's**][4] Umhlanga Campus. I expected good interest based on previous events, but I wasn't prepared for the tsunami of enthusiasm that followed. Two days. **TWO DAYS**. That's all it took for every single ticket to disappear faster than available GPU instances during a ChatGPT outage.

The **Call for Speakers** closed just as dramatically, and frankly, the submissions have blown my mind. We're looking at presentations ranging from deep technical explorations of whether databases are truly ready for AI development (spoiler: they're scrambling to catch up) to creative sessions on using AI for film production, artistic expression, and applications I didn't even know were possible. The diversity and quality of proposals are making speaker selection the kind of problem you want to have, too many incredible options rather than too few.

What strikes me most is how this year's "augment yourself with AI superpowers" theme has resonated. These aren't just talks about AI as another tool in the toolkit; they're explorations of fundamental transformation in how we think, create, and solve problems. From practical productivity superpowers to philosophical questions about human-AI collaboration, we're building something that will challenge assumptions and expand horizons.

If you missed out on tickets this time, don't worry - we're already planning how to handle the clearly underestimated demand for future events. And if you're interested in staying connected with what we're building in the Durban AI community, check out more details about the event and follow along for updates on future opportunities:

* 📅 **Date:** October 11, 2025
* 🏨 **Venue:** The stunning [**Richfield College**][4] Umhlanga Campus, Centenary Boulevard, Park Square, 5-9 Park Avenue, Umhlanga
* 🌐 [**Event Page**][3]
* 🎤 [**View Speakers**][5] 
* 📖 [**View Sessions**][6] 

Meanwhile, this rapid-fire success has meant my planned blog series about building a custom contact and event management system using Claude Code has taken a backseat to actual event management. The irony isn't lost on me: I'm too busy running events to write about the tools I'm building to manage them. Hopefully, the coming weeks will bring more time to dive back into the technical deep dives you've been following along with.

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

[1]: https://www.anthropic.com/engineering/multi-agent-research-system
[2]: https://muratbuffalo.blogspot.com/2025/09/supporting-our-ai-overlords-redesigning.html
[3]: https://aimldatadurban.org/events/2025/ready-player-2/
[4]: https://www.richfield.ac.za/campus/umhlanga/#
[5]: https://aimldatadurban.org/events/2025/ready-player-2-speakers/
[6]: https://aimldatadurban.org/events/2025/ready-player-2-sessions/
