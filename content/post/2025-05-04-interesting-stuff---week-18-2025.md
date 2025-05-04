---
type: post
layout: "post"
title: Interesting Stuff - Week 18, 2025
author: nielsb
date: 2025-05-04T11:31:11+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-18-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-18-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - vibecoding
  - streaming
  - Confluent
  - Databricks
  - Data & AI Community Day Durban
  - Season of AI
  - AI Agents
description: "AI is transforming everything — from coding at Microsoft to how junior developers are leading the agent revolution. This week's roundup covers the rise of small language models, the true spirit of vibe coding, and the convergence of streaming with Confluent and Databricks. Plus, an update on the fast-approaching Data & AI Community Day Durban: Season of AI – The Age of Agency!"
---

This week's roundup dives into how AI rapidly reshapes the tech landscape! From Microsoft's AI-driven codebases and the rise of small but mighty language models to the real meaning of vibe coding and the junior developer revolution, the pace of change is breathtaking. 

We also explore how Confluent and Databricks break down the batch vs. stream divide, setting the stage for a real-time future. Plus, a quick update on planning for [**Data & AI Community Day Durban: Season of AI – The Age of Agency**][1] — it's shaping up to be something special!

<!--more-->

<!--
## Podcast

If you rather listen to the summary:



Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here]().
-->

## Generative AI

* [30 percent of some Microsoft code now written by AI - especially the new stuff][2]. The Register reports in this post that AI tools, notably GitHub Copilot, are now responsible for writing 30% or more of the code in specific Microsoft projects. The article highlights how AI is shifting from a helpful assistant to a true co-developer, handling routine coding tasks so that engineers can focus on higher-level work. Interestingly, it also raises the point that with AI's growing contribution, the definition of what it means to be a "software engineer" is evolving. This is both exciting and thought-provoking. While AI accelerating development is fantastic, it also challenges us to rethink our roles—becoming more about architecture, creativity, and critical thinking rather than just syntax. It's an inevitable evolution that we, as a community, need to actively shape.
* [One year of Phi: Small language models making big leaps in AI][3]. This post by Weizhu Chen and Ece Kamar on the Microsoft Azure Blog celebrates the evolution of the Phi family of small language models (SLMs), culminating in the launch of Phi-4-reasoning, Phi-4-reasoning-plus, and Phi-4-mini-reasoning. These new models punch far above their weight, demonstrating reasoning capabilities that challenge much larger models—perfect for environments where low latency and efficient computing matter. Particularly impressive is how Phi-4-reasoning-plus outperforms models five times its size on complex benchmarks like the AIME 2025 math test! Reflecting on this, I'm amazed by how small models close the capability gap with large frontier models. It's not just about scaling bigger anymore; it's about scaling smarter. This shift could make sophisticated AI reasoning accessible to far more applications, devices, and developers than ever—and I think that's a truly exciting development to watch.
* [Experiment-Driven AI Development: Building the Plane While Flying][4]. Towards AI dives into the reality of modern AI development in this post, where uncertainty is the norm and experimentation must replace rigid planning. He argues that instead of building AI systems with traditional, feature-driven roadmaps, we must embrace Experiment-Driven Development (EDD)—treating AI creation as a series of structured experiments to reduce critical uncertainties. Naleszkiewicz stresses that teams should focus on validating hypotheses rather than delivering pre-scoped features, changing how we measure success. Reading this, I couldn't agree more. AI is inherently messy, full of surprises both delightful and dangerous. Trying to fit it into traditional development moulds feels like using a ruler to measure the ocean. EDD reframes progress into learning milestones rather than feature checkboxes, and honestly, it's probably the mindset shift we need to build truly transformative AI systems.
* [Two publishers and three authors fail to understand what “vibe coding” means][6]. In this post, Simon Willison vents (rightfully!) about the misuse of the term vibe coding by two publishers and three authors who, according to him, fundamentally misunderstood the idea. Vibe coding, coined by Andrej Karpathy, isn't simply using AI tools to assist coding—it's about letting go, generating code without caring about the exact implementation, and "going with the vibes" to create throwaway projects. Willison expresses frustration that forthcoming books have already started redefining the term incorrectly to mean professional-grade AI-assisted development—missing the point entirely. Honestly, I sympathize with Simon's frustration here, and I have the same POV as Simon. It's, however, a fascinating glimpse into how quickly "semantic diffusion" happens in tech culture. New ideas get watered down before they've even had a chance to mature. Vibe coding, at its core, empowers non-programmers to build without fear—and we desperately need more tools, guides, and books that embrace that spirit, not confuse it.
* [Revenge of the junior developer][7]. This post by Steve Yegge on the Sourcegraph Blog offers a whirlwind tour through the fast-moving world of vibe coding, coding agents, and the upcoming "agent fleets." Yegge describes the six waves of AI-assisted software development—from manual coding to completions, chat, agents, clusters, and eventually fleets. He paints a picture where the role of a software developer shifts from writing code to orchestrating fleets of coding agents, with junior developers leading the charge because they're adapting faster than senior engineers. The "revenge" part? Juniors are embracing AI so successfully that they're positioning themselves as the workforce of the future. Reading this post, I can't help but smile (and nod). It's clear: adaptability is the ultimate superpower. Those who lean into AI workflows now—especially coding agents—will surf the coming waves rather than get washed away. It's not about replacing developers but evolving into something far more scalable and powerful. Honestly, seeing juniors take the lead here feels like a refreshing and much-needed shake-up.

## Streaming

* [The Past, Present, and Future of Confluent (The Kafka Company) and Databricks (The Spark Company)][5]. Kai Waehner explores in this post the intertwined journeys of Confluent and Databricks, two giants that started with open-source roots—Kafka and Spark—and have evolved into full-fledged platforms, redefining modern data architectures. Confluent is now much more than Kafka, providing a comprehensive data streaming platform, while Databricks positions itself as a Data Intelligence Platform focused on AI, machine learning, and analytics. Waehner explains how real-time data movement (Confluent) and large-scale AI/BI processing (Databricks) increasingly converge, especially with integrations like Tableflow and Delta Lake, creating a seamless bridge between operational and analytical workloads. Reflecting on this, I find it fascinating how "batch vs. stream" has blurred into a more unified architecture. The future clearly belongs to platforms that can deliver agility across the data spectrum—moving from data at rest to data in motion easily. It's no longer a choice between Confluent or Databricks—it's about how to orchestrate both to drive next-gen AI and data-driven enterprises.

## WIND (What Is Niels Doing)

This past Friday, I extended the Call for Speakers (CfS) for [**Data & AI Community Day Durban: Season of AI – The Age of Agency**][1], which is happening on May 24! The CfS officially closes today, Sunday, May 4. We had such a strong response leading up to the deadline that extending it a couple more days was absolutely worth it.

Now comes the exciting part — I'm busy reviewing the fantastic submissions we've received and starting to plan the event agenda. Based on what I'm seeing, we're shaping up for a top-notch lineup covering AI Agents, the Model Context Protocol (MCP), the Power Platform, database development, and much more. As soon as the speakers and sessions are locked in, I'll update the event webpage so everyone can see what's in store!

🌟 **Event Details**:

* 📆 **Date:** Saturday, May 24, 2025
* 🏨 **Venue:** The venue has not been confirmed yet, but we are working on it. Check our event page for venue details and updates!
* 🌍 [**View Event Information**][1]

The event is sold out, but if you're interested in attending, please [**email us**][8]. If a spot opens up, we'll notify you!

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

[1]: https://aimldatadurban.org/events/2025/season-of-ai-agents/
[2]: https://www.theregister.com/2025/04/30/microsoft_meta_autocoding
[3]: https://azure.microsoft.com/en-us/blog/one-year-of-phi-small-language-models-making-big-leaps-in-ai/
[4]: https://pub.towardsai.net/experiment-driven-ai-development-building-the-plane-while-flying-7c9b0ac302eb
[5]: https://www.kai-waehner.de/blog/2025/05/02/the-past-present-and-future-of-confluent-the-kafka-company-and-databricks-the-spark-company/
[6]: https://simonwillison.net/2025/May/1/not-vibe-coding/
[7]: https://sourcegraph.com/blog/revenge-of-the-junior-developer
[8]: mailto:events@aimldatadurban.org
