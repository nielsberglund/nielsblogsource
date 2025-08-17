---
type: post
layout: "post"
title: Interesting Stuff - Week 30, 2025
author: nielsb
date: 2025-07-27T08:17:39+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-30-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-30-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - GitHub Copilot
  - AI-assisted Coding
  - Kafka
  - Streaming
  - Data & AI Community Day Durban
description: "Week 30 tech roundup: GitHub Copilot's AI debugging breakthrough, ChatGPT Agent reality check, GitHub Spark's no-code revolution & reimagining Kafka. Call for help finding a venue for our next Data & AI Community Day Durban event."
---

This week's tech discoveries showcase AI agents moving from impressive demos to practical reality checks. We explore GitHub Copilot's breakthrough UI debugging capabilities, OpenAI's ChatGPT Agent's mixed real-world performance, and GitHub Spark's ambitious "describe-and-deploy" development platform. 

In Kafka land, Gunnar Morling takes us on a fascinating thought experiment reimagining Apache Kafka from the ground up with key-centric streams and modern cloud-native architecture. From debugging magic to distributed systems philosophy, it's been a week of both tangible progress and bold visions for the future of software development. Plus, a call for help in finding a venue for our next [**Data & AI Community Day Durban**][5] event.

<!--more-->

## Generative AI

* [**Debugging UI with AI: GitHub Copilot agent mode meets MCP servers**][2]. This post, by Chris Reddington, takes us along for a fascinating ride through the trenches of UI debugging, armed with GitHub Copilot's agent mode and the Playwright MCP server. Picture this: you dust off an old project (his OctoArcade Next.js app) only to discover it's riddled with UI gremlins that make you question your past self's coding decisions.

  What makes this particularly compelling is watching Copilot essentially become a debugging partner that can actually "see" the UI issues through Playwright's browser automation tools. The combination is genuinely impressive; Copilot can launch browsers, navigate pages, spot layout problems, and propose fixes, all while Reddington sits back like a conductor orchestrating an AI-powered debugging symphony.

  The main villain of this story? A navigation header that was photobombing game content across multiple pages. But here's where it gets interesting: Copilot didn't just slap a quick CSS band-aid on the problem. It identified that the app was rendering multiple navigation bars with conflicting states and suggested a more elegant architectural fix using a shared header context.

  **My thoughts:** This feels like a glimpse into the future of debugging workflows. The idea of having an AI assistant that can visually inspect your UI and iteratively fix issues is genuinely exciting. However, Reddington's biggest lesson resonates strongly: the bottleneck isn't the AI's capabilities, but rather our ability to clearly articulate requirements. His iterative prompt refinement process (from vague "there's a spacing issue" to detailed three-part requirements) shows that even with powerful tools, the human skill of precise problem definition remains crucial.

  The post includes a particularly enlightening table that shows how each prompt iteration brought new side effects, such as game paddles disappearing and content extending beyond viewports, highlighting that AI debugging is still very much a collaborative dance that requires human oversight and course correction.

  Reddington wraps up with practical wisdom: keep your Copilot instructions current, embrace iteration over perfection, and remember that progress beats paralysis. It's the kind of real-world AI adoption story that feels both inspiring and refreshingly honest about the current limitations.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**ChatGPT Agent: a big improvement but still not very useful**][3]. In this post, Timothy B. Lee delivers a refreshingly honest reality check on OpenAI's ChatGPT Agent, which attempts to merge the capabilities of Deep Research and Operator into a single unified tool. Lee puts the agent through its paces with four real-world tasks: grocery shopping, purchasing light bulbs, travel planning, and spreadsheet analysis.

  The results paint a mixed picture that's both impressive and frustrating. On the grocery shopping front, ChatGPT Agent demonstrated significant improvement over its predecessor, Operator, successfully transcribing 15 out of 16 items from a shopping list and adding them all to the cart. However, it still missed onions and got tangled up with an overzealous security monitor that blocked legitimate login attempts to Harris Teeter's Kroger-hosted authentication system.

  The light bulb purchasing task revealed similar patterns; technical success marred by practical limitations. The agent successfully navigated Amazon, found the right product, and completed the purchase, with the bulb even being delivered the next day. But Lee found himself second-guessing the agent's choices on price and product specifications, ultimately defeating the time-saving purpose.

  **My thoughts:** Lee's observation about trust hits the nail on the head. These agents create an interesting paradox: they're sophisticated enough to complete complex tasks but not quite reliable enough to eliminate the human verification step. This means they often end up adding complexity rather than reducing it. The grocery shopping example is particularly telling: even if the agent worked flawlessly, it can't read minds about brand preferences or budget constraints that humans naturally factor in.

  The travel planning task exposed a more fundamental problem: hallucinated flights. When asked to plan a trip to see OK Go perform, ChatGPT Agent confidently recommended specific United Airlines flights that simply didn't exist. This isn't just an inconvenience; it's the kind of error that could derail an entire trip.

  Interestingly, the agent excelled at spreadsheet manipulation, using Python scripts to filter crash data with impressive accuracy. Lee attributes this success to the maturity of ChatGPT's coding capabilities, which have been refined since 2023.

  Lee concludes with a thoughtful framework for understanding computer-use agents as "compatibility layers" for legacy software, similar to robotic process automation but more flexible. While this has value in enterprise settings with outdated systems, he's sceptical about consumer adoption, predicting that critical applications will either provide native API access or actively block agent use.

  The post serves as a valuable counterbalance to AI hype, demonstrating that while the technology is undeniably advancing, we're still far from achieving reliable autonomous agents for everyday tasks.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**GitHub Spark in public preview for Copilot Pro+ subscribers**][4]. GitHub, in this announcement, introduces Spark, their ambitious answer to the age-old developer frustration of getting stuck between brilliant ideas and actual implementation. Think of it as the "just add water" solution for app development: describe what you want in plain English, and Spark builds a full-stack application powered by Claude Sonnet 4.

  What makes Spark particularly compelling is its "batteries included" approach. Rather than forcing developers into yet another configuration nightmare, it provides data storage, LLM inference, hosting, deployments, and GitHub authentication right out of the box. It's like having a complete development infrastructure that materialises on demand, which is genuinely refreshing in a world where setting up a basic web app often requires wrestling with dozens of services and configuration files.

  The platform offers multiple ways to iterate on your creations, including natural language prompts, visual editing controls, and traditional coding with the assistance of Copilot. More importantly, everything can be exported to a proper GitHub repository with Actions and Dependabot already configured, ensuring you're not trapped in a proprietary sandbox.

  The AI integration is particularly noteworthy, as it supports models from OpenAI, Meta, DeepSeek, and xAI without requiring users to manage API keys or establish billing relationships with multiple providers. For developers who want to experiment with different LLMs or add intelligent features without the administrative overhead, this removes significant friction.

  **My perspective:** Spark represents GitHub's strategic move to own the entire development lifecycle, from ideation to deployment. It's essentially positioning itself as the "Figma for full-stack development", a collaborative, web-based environment where ideas can be rapidly prototyped and iterated upon. The fact that it's powered by Claude Sonnet 4 rather than OpenAI's models is particularly interesting, suggesting GitHub sees Anthropic's approach as better suited for code generation tasks.

  The timing feels right, too. As no-code and low-code platforms have proven their value for simple applications, there's clearly a demand for something that bridges the gap to more sophisticated, AI-powered applications without requiring an extensive technical setup.

  Currently limited to Copilot Pro+ subscribers, Spark appears to be GitHub's attempt to justify premium pricing while creating a new category of development tools. If the execution matches the promise, this could significantly lower the barrier to building intelligent applications

## Streaming

* [**What If We Could Rebuild Kafka From Scratch?**][1]. Gunnar Morling, in this post, takes us on a fascinating journey of reimagining Apache Kafka from the ground up, inspired by recent developments like KIP-1150 ("Diskless Kafka") and AutoMQ's S3-integrated fork. Rather than just dreaming about incremental improvements, he boldly asks: what would "Kafka.next" look like if we started fresh today?

  His wishlist reads like a greatest hits album of distributed systems pain points. First up: ditching partitions entirely. Morling argues that while partitions made sense when we were limited to node-local disks, they're essentially legacy baggage in the cloud era, where object storage is effectively infinite. The ordering guarantees they provide? Not as useful as you'd think; you either want global ordering or key-based ordering, not the arbitrary "happens to hash to the same partition" variety.

  Instead, he envisions a key-centric world where millions of entity-level streams provide surgical access to exactly the data you need. Think of it as going from a sledgehammer (partitions) to a scalpel (key-based streams). This approach would elegantly solve head-of-line blocking issues and make dynamic scaling actually... well, dynamic.

  **My take:** This vision of key-centric streams is compelling, but I wonder about the operational complexity it entails. Managing millions of streams sounds like it could turn into a different kind of nightmare; imagine debugging performance issues across that many individual streams. Sometimes constraints (like partitions) force good architectural decisions, even if they're not perfect.

  The post continues with equally ambitious ideas: topic hierarchies for pattern-based subscriptions, optimistic locking for concurrency control, and first-class schema support. His point about broker-side schema validation resonates strongly; how many production incidents have we all seen from malformed messages sneaking through?

  Morling wraps up by acknowledging this is his personal wishlist (carefully noting it doesn't represent Confluent's official stance) and teases that an LSM tree would likely be the architectural foundation. It's the kind of post that makes you simultaneously excited about the possibilities and grateful that someone else has to figure out how to actually build it.

## WIND (What Is Niels Doing)

While we're still riding the high from our last event, the wheels are already turning for the next [**Data & AI Community Day Durban**][5], scheduled for late August or early September. The content will be fresh, the speakers will be sharp, and the AI jokes will be even more niche. But… we have a small (read: big) problem. We don't have a venue. Nada. Zilch. And without one, we'll all be giving talks from a Wi-Fi hotspot in a parking lot, which, while edgy, isn't ideal.

Here's our call for help: if you know of a venue in or around Durban that can accommodate a crowd of passionate techies, fast internet, and the occasional burst of spontaneous applause, ***please*** get in [touch][ma]. Boardrooms, lecture halls, fancy hotels, secret volcano lairs, we're open to ideas. Bonus points if the venue has coffee strong enough to fuel back-to-back AI sessions. ☕💡

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

[1]: https://www.morling.dev/blog/what-if-we-could-rebuild-kafka-from-scratch/
[2]: https://github.blog/ai-and-ml/github-copilot/debugging-ui-with-ai-github-copilot-agent-mode-meets-mcp-servers/
[3]: https://www.understandingai.org/p/chatgpt-agent-a-big-improvement-but
[4]: https://github.blog/changelog/2025-07-23-github-spark-in-public-preview-for-copilot-pro-subscribers/
[5]: https://aimldatadurban.org/
