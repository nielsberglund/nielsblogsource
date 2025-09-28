---
type: post
layout: "post"
title: Interesting Stuff - Week 39, 2025
author: nielsb
date: 2025-09-28T08:24:48+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-39-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-39-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - OpenAI
  - NVIDIA
  - LLMs
  - ChatGPT Pulse
  - Data & AI Community Day Durban
description: "Tech roundup, week 39, 2025 : OpenAI's $100B NVIDIA partnership, ChatGPT Pulse launch, 10 LLM myths killing projects, and why human thinking still matters in AI coding. Plus Durban AI community event updates."
---

Week 39, 2025, brought some reality-checking insights about building production AI systems, along with infrastructure announcements that could reshape the entire industry. From Mayank Bohra's brutal takedown of the 10 myths killing LLM projects to OpenAI's jaw-dropping $100 billion partnership with NVIDIA for 10 gigawatts of computing power, this week highlighted both the practical challenges and astronomical ambitions driving AI development.

OpenAI also launched ChatGPT Pulse, shifting from reactive Q&A to proactive research assistance. At the same time, thoughtful analysis from Calvin French-Owen reminded us that even with sophisticated AI coding tools, human thinking remains irreplaceable. Plus, exciting updates on our October 11 [**Data & AI Community Day Durban**][10] event, where we're creating a dedicated space for students and recent graduates to showcase their innovations to industry professionals.

<!--more-->

## Generative AI

* [**Everyone’s Building with LLMs Wrong. Here Are the 10 Myths Killing Your Projects.**][1]. Mayank Bohra, in this brutally honest post, demolishes the rose-tinted glasses that most developers wear when building with Large Language Models. After eight months in the trenches building production AI systems with Claude, GPT, and custom models, he's witnessed enough project carnage to compile a definitive list of the 10 myths that consistently torpedo LLM initiatives. This isn't your typical "AI will change everything" fluff piece; it's a reality check that every developer needs to read before their next sprint planning meeting.

  The post systematically debunks everything from the persistent belief that LLMs "understand" like humans (spoiler: they're just very sophisticated pattern-matching engines) to the dangerous assumption that bigger models automatically mean better performance. Bohra's real-world examples hit particularly hard, such as his fine-tuned 7B model, which outperformed GPT-4 for code reviews while running 10 times faster and costing 90% less. He also tackles the productivity paradox that nobody discusses: most developers actually become slower before they become faster with AI tools, despite all the "10x productivity" marketing claims.

  What makes this post invaluable is Bohra's systematic framework for actually succeeding with LLMs. Instead of just pointing out what's broken, he provides a four-stage approach that covers reality-based planning, context architecture, production hardening, and systematic optimisation. The key insight? Successful AI teams don't have better prompts or bigger models; they have better systems for managing the inherent challenges of probabilistic AI in deterministic business contexts. This is essential reading for anyone building production AI systems who wants to avoid becoming another cautionary tale.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**OpenAI and NVIDIA announce strategic partnership to deploy 10 gigawatts of NVIDIA systems**][2]. This post by OpenAI announces what might be the most jaw-dropping infrastructure deal in AI history: a strategic partnership with NVIDIA to deploy 10 gigawatts of computing power backed by up to $100 billion in investment. To put that in perspective, 10 gigawatts could power roughly 7.5 million homes, but instead, it'll be used to train the next generation of AI models that could potentially achieve artificial general intelligence. The first gigawatt will come online in the second half of 2026, utilising NVIDIA's new Vera Rubin platform, which represents millions of GPUs working in concert.

  What's fascinating about this announcement is how it positions compute infrastructure as the foundation of the future economy; Sam Altman's quote, "everything starts with compute," really drives home how the AI race has become fundamentally about who can build the biggest, most powerful training systems. Jensen Huang and Altman are betting that the path to superintelligence runs through massive parallel processing power, and they're willing to put $100 billion where their mouth is. The partnership also complements OpenAI's existing collaborations with Microsoft, Oracle, SoftBank, and other Stargate partners, creating what amounts to a global AI infrastructure empire.

  The timing feels particularly significant given the current AI scaling wars and the increasing evidence that larger models continue to show emergent capabilities. With OpenAI now serving over 700 million weekly active users, this massive compute expansion suggests they're preparing for AI workloads that dwarf anything we've seen before. Whether this investment will actually lead to an AGI breakthrough or merely result in very expensive pattern matching remains to be seen. Still, one thing's certain: the hardware requirements for frontier AI development have officially entered the realm of national infrastructure projects.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Abundant Intelligence**][3]. Related to the post above, Sam Altman, in this ambitious blog post, essentially announces OpenAI's intention to become the Henry Ford of artificial intelligence infrastructure, with plans to create what he calls an "AI factory" capable of producing a gigawatt of new compute capacity every week. This isn't just scaling up: it's reimagining how we build the computational backbone for artificial general intelligence. Altman frames access to AI as potentially becoming a fundamental human right, arguing that as AI gets smarter, everyone will want more of it working on their behalf, creating an almost insatiable demand for computational resources.

  The post reveals the strategic thinking behind OpenAI's massive infrastructure investments, positioning compute capacity as the literal key to increasing revenue and unlocking transformative applications. Altman tantalises readers with specific examples of what 10 gigawatts of compute might achieve: perhaps curing cancer or providing customised tutoring to every student on Earth. The choice of these examples isn't accidental; they represent the kind of moonshot problems that could justify the enormous capital expenditure and help frame AI development as a humanitarian imperative rather than just a tech company's growth strategy.

  What's particularly intriguing is Altman's emphasis on building this infrastructure in the United States, explicitly acknowledging that other countries are currently outpacing America in critical manufacturing, such as chip fabs and energy production. This suggests OpenAI's infrastructure ambitions are as much about industrial policy and national competitiveness as they are about AI capabilities. The promise to reveal financing plans later this year hints at potentially revolutionary approaches to funding massive infrastructure projects; however, given the scale he's describing, it's hard to imagine anything short of government-level backing or entirely new financial instruments could make this vision a reality.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Introducing ChatGPT Pulse**][4]. OpenAI, in this announcement, reveals ChatGPT Pulse, a feature that fundamentally shifts the AI interaction paradigm from reactive Q&A to a proactive research assistant. Instead of waiting for users to ask questions, Pulse conducts overnight research based on your chat history, feedback, and connected apps, such as Gmail and Google Calendar, and then delivers personalised visual cards each morning with relevant updates. Think of it as having an AI intern who stays up all night researching topics you care about, then presents you with a curated briefing over your morning coffee: whether that's follow-ups on ongoing projects, healthy dinner ideas, or next steps toward your triathlon training goals.

  The strategic implications here are fascinating because Pulse represents OpenAI's attempt to address the "burden of knowing what to ask" problem that currently limits the adoption of AI. By synthesising information from your digital footprint and proactively surfacing relevant insights, ChatGPT moves closer to becoming an always-on productivity multiplier rather than just a sophisticated search engine. The integration with Gmail and Calendar hints at broader ambitions to become the central nervous system for your digital life. At the same time, the visual card format makes the experience scannable and mobile-first.

  What's particularly clever about the rollout strategy is how OpenAI is positioning this as deliberately anti-addictive: updates are available for only one day unless saved, and the goal is to provide you with helpful information so you can "get back to your life" rather than keep scrolling. This addresses growing concerns about AI creating new forms of digital dependency while potentially making ChatGPT stickier through genuine utility. The feedback from college students in the ChatGPT Lab suggests the real magic happens when users start actively curating what they want to see, transforming Pulse from a generic news feed into a personalised intelligence briefing. If successful, this could be the beginning of AI assistants that work for you even when you're not actively using them.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**You Still Need to Think**][5]. Calvin French-Owen, in this thoughtful analysis, tackles a critical question that many developers are grappling with: as AI coding agents become increasingly sophisticated, what role does human thinking actually play? His core insight about the "thinking budget"-the finite cognitive resources developers allocate across different aspects of coding —provides a compelling framework for understanding why different AI tools create vastly different user experiences. Rather than eliminating the need for human thought, these tools redistribute where that thinking happens across four key areas: supplying context, planning, implementation, and verification.

  French-Owen's breakdown of how different products shape cognitive workflow is particularly illuminating. Remote-first tools like Codex Cloud encourage users to focus on the end result rather than the process, while terminal-based tools like Claude Code prompt you to think more about high-level specifications and approaches. IDE-focused products, such as Cursor, optimise for quick accept/reject decisions but require more upfront problem decomposition. This isn't just a UI difference; it's fundamentally reshaping how developers approach problem-solving, with each interface encouraging different patterns of thought and attention.

  The ranking of where LLMs currently excel —implementation > verification > planning > context —feels accurate and suggests that the most valuable human contribution remains in understanding organisational context and gathering requirements. While AI can handle race conditions and error handling remarkably well, it still struggles with the messy, ambiguous world of real business requirements and legacy system constraints. French-Owen's conclusion that no single workflow will satisfy all users points toward a future where the most successful AI coding tools will be those that adapt to individual cognitive preferences rather than forcing developers into rigid interaction patterns. The real question isn't whether we still need to think, but how we want to distribute that thinking across the development process.

## WIND (What Is Niels Doing)

The agenda for [**Data & AI Community Day Durban: Ready Player 2 - Augment Yourself with AI Superpowers**][10] on October 11 is set, but here's what has me particularly excited about this event. We're doing something completely new that could change how we think about showcasing emerging talent in our local tech ecosystem.

After years of organising these community events, I've noticed a persistent gap: Durban is absolutely teeming with brilliant students and recent graduates who are building incredible projects in data and AI, but they have virtually nowhere to present their work to industry professionals. University presentations reach fellow students and academics, but rarely connect with the broader tech community, which could offer mentorship, collaboration opportunities, or even job prospects.

We've carved out a 50-minute session exclusively for students and recent graduates to take the stage and demo their coolest projects. Think of it as a rapid-fire showcase where the next generation gets to prove that age and experience aren't the only measures of innovation. Whether it's a machine learning model predicting local traffic patterns, an AI system analysing Zulu language sentiment, or a computer vision project tackling uniquely South African challenges – this is their moment to shine in front of seasoned practitioners, potential employers, and fellow innovators.

The format encourages bite-sized presentations that focus on impact rather than academic jargon, giving these emerging talents practice communicating their technical work to diverse audiences - a skill that's absolutely crucial for career development. Additionally, it creates networking opportunities that are not available elsewhere in the local ecosystem. If this experiment proves as successful as I hope, it may become a permanent feature of our community events. Sometimes the best way to augment yourself with AI superpowers is to learn from the people who grew up thinking this technology was normal.

**🎙 Event Details:**

📅 **Date:** October 11, 2025 <br>
🕗 **Time:** Registration starts at 08:00 AM. We expect to finish at 18:00.<br>
🏨 **Venue:** The stunning [**Richfield College**][14] Umhlanga Campus, Centenary Boulevard, Park Square, 5-9 Park Avenue, Umhlanga.<br>
🌐 [**Event Page**][10]<br>
🎤 [**Speakers**][11]<br>
📖 [**Sessions**][12]<br>
📝 [**Agenda**][13]<br>

If you're in Durban on October 11, I highly recommend attending. The full agenda is available on the event page, and registration is free. Whether you're a student looking to present or an industry professional eager to discover fresh talent, this event promises to be a unique convergence of experience and innovation.
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

[1]: https://pub.towardsai.net/everyones-building-with-llms-wrong-here-are-the-10-myths-killing-your-projects-105af22e57e4?sk=v2%2F7eb370eb-9430-4ca5-905c-4d5d86c8a922
[2]: https://openai.com/index/openai-nvidia-systems-partnership/
[3]: https://blog.samaltman.com/abundant-intelligence
[4]: https://openai.com/index/introducing-chatgpt-pulse/
[5]: https://calv.info/you-still-need-to-think
[10]: https://aimldatadurban.org/events/2025/ready-player-2/
[11]: https://aimldatadurban.org/events/2025/ready-player-2-speakers/
[12]: https://aimldatadurban.org/events/2025/ready-player-2-sessions/
[13]: https://aimldatadurban.org/events/2025/ready-player-2-agenda/
[14]: https://www.richfield.ac.za/campus/umhlanga/#
