---
type: post
layout: "post"
title: Interesting Stuff - Week 35, 2025
author: nielsb
date: 2025-08-31T09:20:30+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-35-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-35-25.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Data & AI Community Day Durban
  - Claude Code
  - AI-assisted Coding
  - dotnetconfsa
description: "Week 35 tech roundup: Discover why the cheapest AI model beats expensive ones at human behavior, Anthropic's Claude for Chrome security challenges, and Claude Code's developer revolution. Plus: .NET Conf SA returns to Durban after years." 
---

Week 35 brings a fascinating paradox in AI development: while Anthropic pilots Claude for Chrome with impressive capabilities but sobering security vulnerabilities, researchers discover that the most human-sounding AI model costs just pennies compared to premium alternatives. From Claude Code's meteoric rise among developers to Google's "nano-banana" image generation model, this week highlights how the AI landscape is being shaped as much by user experience design and cost-effectiveness as raw technical performance. 

The developments span from browser automation and coding assistants to image generation and market research, revealing an industry where authenticity and accessibility often trump expensive computational power. On the local front, after years without a dedicated .NET conference in Durban due to venue constraints, **.NET Conf SA** is tentatively scheduled for November 15 at the Umhlanga Campus of **Richfield College**, marking a significant milestone for the regional developer community.

<!--more-->

## Generative AI

* [**Piloting Claude for Chrome**][1]. Anthropic's latest announcement puts Claude directly into your Chrome browser, and this post details what might be the most significant leap forward in AI-powered web automation yet. The company is piloting Claude for Chrome with 1,000 Max plan users, giving the AI assistant the ability to see web pages, click buttons, fill forms, and essentially act as your digital assistant across the entire web. It's the logical next step after connecting Claude to calendars and documents, but it comes with some serious security considerations that make this rollout particularly fascinating from a safety perspective.

  What makes this development particularly noteworthy is Anthropic's refreshingly transparent approach to the security challenges. In this post, the team reveals some genuinely concerning vulnerabilities they discovered during testing, including a 23.6% attack success rate for prompt injection attacks in their initial testing. The most striking example shows Claude being tricked by a malicious email into deleting a user's entire inbox without confirmation, simply because the email claimed to be from a "security team" requesting "mailbox hygiene." It's the kind of real-world security nightmare that keeps AI safety researchers up at night, and Anthropic deserves credit for being so open about these risks.

  The technical details surrounding their mitigation strategies are awe-inspiring. They've implemented site-level permissions, action confirmations for high-risk activities, improved system prompts, and advanced classifiers to detect suspicious instruction patterns. Their new safety measures reduced the attack success rate from 23.6% to 11.2%, and completely eliminated four specific browser-based attack vectors they tested. While those numbers still aren't perfect, the methodical approach to red-teaming and the honest presentation of ongoing vulnerabilities suggest Anthropic is taking the right approach to rolling out potentially dangerous but beneficial capabilities. This measured rollout could set the standard for how AI companies handle powerful new features that blur the line between helpful automation and potential security risks.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Claude vs Co Pilot**][2]. Giovann Adonis, in this post, delivers a brutally honest comparison between Claude Code and GitHub Copilot that reads like a developer's diary after a particularly intense coding session. The Cape Town-based developer doesn't mince words with his opening line: "Claude is 10 million times better!", and while that might be hyperbole, his detailed breakdown of a real-world coding test reveals some genuinely eye-opening differences between these AI coding assistants. What makes this comparison particularly valuable is that it comes from someone who actually burned through Copilot's credits mid-month and had to switch to Claude to finish his project.

  The cost analysis presented here is absolutely fascinating and something every development team should consider. This post reveals that Claude's variable pricing can easily hit $44 per day (ouch!), potentially reaching $300+ per developer monthly for maximum value, while Copilot sits at a predictable $34 per user per month. However, the author suggests you can "conservatively manage with around $120 per month on Claude", which puts it in a competitive range if you can control your usage. The real kicker is his experience with Copilot's token limits: premium tokens can be exhausted in just 5 days for power users, leaving you stuck with GPT-4.1 for the rest of the month.

  The technical comparison is where this gets really interesting. Adonis describes GPT-4.1 as creating "structural issues everywhere" and performing absurd actions, such as selecting entire databases to perform simple text comparisons instead of proper lookups. Meanwhile, Claude apparently understood his existing codebase structure instantly and could even fix the architectural problems that GPT had introduced. The UX trade-off is real, though. Copilot's GUI versus Claude's command-line interface that gives the author "PTSD of early development days." His practical tips about using Git for rollbacks (since Ctrl+Z won't save you from AI-generated code disasters) and leveraging multimodal inputs like wireframes are gold for anyone diving into AI-assisted development. If you're on the fence about AI coding tools, this real-world battle report might help you pick your side.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**The Coding Agent Metagame**][3]. In this post, Calvin French-Owen delivers what might be the most thoughtful analysis of why Claude Code has captured developers' hearts, beyond its technical capabilities. Writing from his unique perspective as someone who worked on Codex at OpenAI, French-Owen explores what he calls the "coding agent metagame", the idea that there are actually two optimisation loops happening when you use Claude Code: building your actual product, and optimising the "product harness" (the tools, environment, and prompts that make the CLI work better for you).

  What strikes me most about this analysis is how French-Owen frames Claude Code as fundamentally different from traditional IDEs by embracing what it is *not*. Rather than trying to cram every feature under the sun into a bloated interface, Claude Code stays lightweight and CLI-focused, which paradoxically makes it feel more future-oriented. The retro gaming aesthetic isn't just eye candy; it's a deliberate design choice that makes the terminal feel alive with animated icons, colour-changing text, and playful flavour text like "Contemplating" and "Flibbertigibetting" that actually communicate progress rather than just looking pretty.

  The "metagame" concept here is genuinely brilliant and explains why Claude Code has become such a social phenomenon on developer Twitter. When users can "own" their product harness through custom configurations, hooks, and automations, they naturally want to share their discoveries and optimisations with others. This creates a virtuous cycle where the tool becomes more valuable as the community discovers new ways to use it. French-Owen's insight that "it's not just the evals that matter, the product harness matters too" feels like it could reshape how we think about AI tooling beyond just coding. The comparison to Minecraft over "1950s-era accounting" software is particularly apt; the best tools let users hack their own workflows rather than forcing them into rigid, predetermined patterns.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**The Most Human AI Model Is Also One of the Cheapest**][4]. Michael Taylor, in this post, delivers what could be the most counterintuitive finding in AI model evaluation this year. When it comes to mimicking real human behaviour, you literally cannot buy your way to authenticity. After running 60 experiments across 12 leading AI models to test how well they could replicate actual human responses from market research studies, Taylor discovered that Gemini 2.0 Flash; costing just $0.008 per 100 responses achieved an 84% "quality" score for sounding human, while Claude 4 Sonnet cost 23 times more and managed only an 8% quality score despite slightly better accuracy.

  The methodology here is particularly clever. Taylor didn't just test accuracy (whether AI models made the same choices as humans in real studies), but also used another LLM trained specifically to distinguish between AI and human responses to measure how "human" the outputs actually sounded. The results expose a fascinating disconnect between technical performance and believability. When asked about gaming preferences, Gemini 2.0 Flash responded naturally: "I'm really into cozy games right now. After debugging code all day, I just want something relaxing like Stardew Valley or maybe a puzzle game I can pause when I need to." Meanwhile, Claude 4 Sonnet delivered robotic corporate-speak about "prioritising games with optimal engagement-to-time ratios" and "intellectual stimulation while accommodating irregular play schedules."

  What makes this research particularly valuable is Taylor's discovery that models excel at logical, binary choices but completely fail at emotional, complex decision-making. The college planning study, which tested how students and parents respond to education marketing, saw every single model fail catastrophically, with an average accuracy of just 14.8%. This suggests that while AI personas can handle straightforward preferences and purchasing decisions, they're still far from being ready for high-stakes, emotionally charged decisions that involve family dynamics and future planning. For anyone building AI-powered market research tools, this data provides a crucial reality check: cheaper doesn't just mean more cost-effective; it might actually mean more human-like. However, you still need to validate your specific use case rather than assuming expensive models will perform better.

<div align="center">_ _ _ _ _ _ _</div></br>

* [**Introducing Gemini 2.5 Flash Image, our state-of-the-art image model**][5]. This post introduces Gemini 2.5 Flash Image (adorably nicknamed "nano-banana") as Google's latest salvo in the AI image generation wars, and the feature set is genuinely impressive. The model addresses some of the most persistent challenges in AI image generation, including character consistency across multiple images, natural language-based editing, and multi-image fusion, while leveraging Gemini's world knowledge for contextually aware creations. At $0.039 per image, it's positioned as a developer-friendly option that integrates seamlessly with Google AI Studio's updated "build mode," allowing developers to create and deploy image editing apps with simple prompts.

  The standout feature here is character consistency, which has been a significant challenge for anyone attempting to create visual narratives with AI. This post demonstrates how you can now place the same character in different environments while preserving their appearance, thereby opening up possibilities for a range of applications, from marketing campaigns to storytelling. The prompt-based editing capabilities are equally compelling. Being able to blur backgrounds, remove objects, or colourise black and white photos through natural language commands rather than complex UI manipulations could democratise photo editing significantly.

  What's particularly interesting is how Google is positioning this as part of a broader ecosystem play. The integration with Google AI Studio enables developers to build, test, and deploy image-editing apps directly within the platform, while partnerships with OpenRouter.ai and fal.ai expand distribution to millions of developers. The invisible SynthID watermarking for AI-generated content also demonstrates Google's proactive stance on AI transparency. However, the acknowledgement that they're still working on "long-form text rendering" and "more reliable character consistency" suggests we're still in the early innings of truly robust AI image generation. For developers building visual applications, nano-banana represents a significant step forward in making sophisticated image manipulation accessible through simple APIs.

## WIND (What Is Niels Doing)

The Call for Speakers for our [**Data & AI Community Day: Ready Player 2 - Augment Yourself with AI Superpowers**][6] has been live for just one week, and I'm thrilled with the response. We've already received numerous compelling submissions for the October 11 event at [**Richfield College's Umhlanga Campus**][8]. If you're a developer or AI practitioner looking to share your insights on how artificial intelligence is transforming our capabilities, there's still time to [**submit your speaking proposals**][7]. The **Ready Player 2** theme captures the moment we're living through, where AI tools are genuinely augmenting human potential rather than just automating tasks.

The bigger news might be what's happening in November. After years without a dedicated .NET conference in Durban, I'm excited to announce that **.NET Conf SA** is tentatively scheduled for November 15, also at Richfield College's Umhlanga Campus. The prolonged absence of .NET events in our region was due to a simple yet critical factor: venue availability: 

![](/images/posts/richfield-2.png)

**Figure 1:** **Richfield College Umhlanga Campus**

Richfield College's decision to open its doors to the tech community has suddenly made Durban a viable location for these larger conferences. This represents a significant shift for our local developer ecosystem, giving .NET developers in KwaZulu-Natal their first major regional conference in years.

Both events highlight the crucial role that venue partnerships play in building thriving tech communities. Richfield College's support is transforming Durban from a city that developers had to travel to for major conferences into one that hosts them. Keep watching for more details on **.NET Conf SA**!

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

[1]: https://www.anthropic.com/news/claude-for-chrome
[2]: https://giovann-adonis.co.za/2025/08/26/claude-vs-co-pilot/
[3]: https://calv.info/coding-agent-metagame
[4]: https://every.to/also-true-for-humans/the-most-human-ai-model-is-also-one-of-the-cheapest
[5]: https://developers.googleblog.com/en/introducing-gemini-2-5-flash-image/
[6]: https://aimldatadurban.org/events/2025/ready-player-2/
[7]: https://sessionize.com/dbn-ready-player-2/
[8]: https://www.richfield.ac.za/campus/umhlanga/#
