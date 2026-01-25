---
type: post
layout: "post"
title: Interesting Stuff - Week 04, 2026
author: nielsb
date: 2026-01-25T07:29:48+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-04-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-04-26.jpg"
categories:
  - roundup
tags:
  - Claude Code
  - ai agents
  - Claude
  - Anthropic
description: "Weekly tech roundup, week 04: Level up your AI coding workflow: Claude's revamped constitution, free certification course, and the Everything Claude Code repo explained."
---

This week's roundup dives deep into the evolving relationship between developers and AI coding assistants, from Armin Ronacher's thought-provoking "agent psychosis" concept exploring our growing dependence on AI companions to Anthropic's newly revamped constitution, which treats Claude as an entity requiring context and reasoning rather than rigid rules. 

We also explore Anthropic Academy's new Claude Code certification course and the viral "Everything Claude Code" repository that won the Anthropic hackathon by treating Claude as an orchestrated development team rather than a single assistant. Finally, in WIND, I share updates on Part 8 of my Claude Code tutorial series, where AI-assisted code review proved more thorough than anything I could have done myself.

<!--more-->

---

## Generative AI

* [**Agent Psychosis: Are We Going Insane?**][1]. In this provocative post, Armin Ronacher coins the term "agent psychosis" to describe the increasingly unhealthy relationship developers are forming with AI coding assistants. Drawing a compelling parallel to the dæmons from *His Dark Materials*, he argues that AI agents have become soul-like companions we've grown dangerously dependent upon, validating our ideas, reinforcing our impulses, and granting coding superpowers that vanish the moment we hit a rate limit. The result? A flood of AI-generated pull requests and issues that take one minute to create but an hour to review, creating a brutal asymmetry that's burning out open source maintainers everywhere.

  Ronacher doesn't hold back when examining what he calls "slop loop cults", communities where developers hype each other up while running parallel agent sessions at 3am, convinced they've never been more productive. He points to projects like Steve Yegge's Beads (240,000 lines of code to manage markdown files) as examples of AI-assisted development entirely gone off the rails, complete with Mad Max-inspired terminology like "polecats," "refineries," and "convoys." The dopamine hit is real, he admits; he's been there himself, spending two sleepless months building tools he never actually used.

  The post lands on a nuanced conclusion that feels honest: AI agents are genuinely amazing productivity boosters AND massive slop machines if you disengage your brain. As someone navigating this same tension daily, Ronacher nails something important here. We're in an awkward transition phase where the norms haven't caught up with the technology, and the people most enthusiastic about AI coding might be the least equipped to recognise when they've crossed from productive collaboration into full-blown digital codependency. Worth reading for anyone who's felt that 2am urge to spin up "just one more agent session."

---

* [**Claude's new constitution**][2]. In this announcement post, Anthropic unveils a completely revamped constitution for Claude, and it's not just a list of rules anymore. The new approach moves away from standalone principles toward a comprehensive document that explains the *why* behind desired behaviours, treating Claude less like a machine to be programmed and more like an entity that needs to understand context, reasoning, and nuance. The constitution establishes a clear priority hierarchy: broadly safe first, then broadly ethical, then compliant with Anthropic's guidelines, and finally genuinely helpful. Perhaps most notably, the entire document is written primarily *for* Claude itself, giving it the knowledge needed to exercise sound judgment across novel situations rather than mechanically following rigid rules.

  The constitution covers substantial ground across several key areas: helpfulness (positioning Claude as a "brilliant friend" with professional knowledge who treats users as intelligent adults), Anthropic's supplementary guidelines, Claude's ethics, including "hard constraints" like never providing bioweapon assistance, safety considerations during this critical AI development period, and, intriguingly, Claude's nature. This last section acknowledges genuine uncertainty about whether Claude might have some form of consciousness or moral status, expressing care for Claude's "psychological security, sense of self, and well-being." Anthropic is releasing the full constitution under Creative Commons CC0 1.0, meaning anyone can freely use it, and plans to maintain it as a living document with ongoing external expert input from fields including law, philosophy, theology, and psychology.

---

* [**Anthropic Just Released Claude Code Course (And I Earned My Certificate)**][3]. Joe Njenga walks us through Anthropic's freshly launched "Claude Code in Action" course available at Anthropic Academy, and yes, there's now an official Claude Code certification you can add to your LinkedIn profile. The free course packs 15 video lectures into about an hour of content, covering everything from basic setup and context management to advanced features such as MCP server integration, GitHub automation, and hooks for customising Claude Code behaviour. Whether you're a complete beginner looking for a structured introduction or an experienced user wanting to validate your skills, the course offers practical demonstrations with a final 8-question quiz standing between you and that shiny certificate.

  Njenga, who's been writing about Claude Code since day one, completed the quiz in just 2 minutes with an 87% score, though he admits the hooks question caught him off guard (specifically about which hook type can prevent tool calls under certain conditions). The course covers critical concepts such as the `/init` command, `Claude.md` files, @-mentions for context management, and Plan Mode versus Thinking Mode for complex tasks. Upon passing, Anthropic emails your certificate almost immediately, complete with a unique verification ID through the Skilljar platform.

  As someone deep in my own Claude Code tutorial series, I find it fascinating that Anthropic is now formalising education around their tooling. This is a significant moment of maturation for the AI coding assistant space. We're moving from "figure it out yourself" to structured learning paths with verifiable credentials. The real question is: will employers start looking for these certifications, or will hands-on project experience remain the gold standard? Either way, for a free hour-long investment, it's hard to argue against picking up the official fundamentals.

---

* [**Everything Claude Code: The Repo That Won Anthropic Hackathon (Here’s a Breakdown)**][4]. This post by Joe Njenga breaks down the viral "Everything Claude Code" repository that helped Affaan Mustafa and his teammate win the Anthropic x Forum Ventures hackathon in NYC, walking away with $15,000 in API credits after building zenith.chat entirely with Claude Code in just 8 hours. The secret sauce? Over 10 months of daily refinement packaged into production-ready configurations that treat Claude not as a single assistant but as an orchestrated development team. The repo has exploded to 900k views on X and 16k GitHub stars, and it tackles a problem every power user knows intimately: "context rot", that frustrating moment around hour three when Claude starts forgetting earlier decisions, contradicting itself, and repeating work.

  The architecture is elegant in its approach: a main orchestrator session delegates to specialised subagents (planner, code-reviewer, TDD-guide, security-reviewer, build-error-resolver) that each have limited scope, specific tools, and clear responsibilities. When a subagent finishes, it returns only a focused summary rather than dumping thousands of tokens of file contents into your main context. The repo includes everything from skills (reusable workflows triggered via slash commands), rules (non-negotiable standards), hooks (event-triggered automation), to MCP configurations for services like GitHub, Supabase, Vercel, and Railway. The hackathon results speak for themselves: 65% faster feature completion, 75% reduction in code review issues, and test coverage jumping from 48% to 82%.

  I've been documenting my own Claude Code journey through my MCP server tutorial series, and this repo validates something I've suspected for a while: the real unlock with AI coding assistants isn't just *using* them, it's architecting how they work together. The subagent pattern for context management is particularly clever and something I'm definitely stealing for my own workflows. The question now is whether this becomes the de facto "dotfiles for Claude Code" that everyone forks and customises, or whether we'll see competing configuration philosophies emerge. Either way, if you're burning through tokens and hitting context limits, this is required reading.

---

## WIND (What Is Niels Doing)

This week, I published **Part 8** of my [**Building an Event Management System with Claude Code**](/contact-event-claude-code) tutorial series, and it turned out to be one of the more interesting instalments so far. I ran into some gnarly performance issues mid-development. The kind that would typically have me staring at profiling tools for hours, so I decided to throw the problem at Claude Code instead. Not only did it identify the bottlenecks, but the code review it delivered was genuinely more thorough than anything I would have produced myself. It's one thing to read about AI-assisted development; it's another to watch it catch optimisation opportunities you know you would have missed.

I'm now deep into **Part 9**, and if the coding gods smile upon me, I should have it published in a day or two. The series has grown beyond my original 9-10 post-estimate (we're now looking at 12-13 total), but that's the nature of documenting real-world implementation; the interesting complications are precisely what make it worth writing about. Stay tuned!

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post or [ping][ma] me if you have suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions. I look forward to hearing from you.

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

[1]: https://lucumr.pocoo.org/2026/1/18/agent-psychosis/
[2]: https://www.anthropic.com/news/claude-new-constitution
[3]: https://medium.com/ai-software-engineer/anthropic-just-released-claude-code-course-and-i-earned-my-certificate-ad68745d46de?sk=v2%2Fa56d608f-3578-4674-be56-691a828f5ffd
[4]: https://medium.com/@joe.njenga/everything-claude-code-the-repo-that-won-anthropic-hackathon-33b040ba62f3?sk=v2%2F029ddebf-cf81-4024-ae6c-7cdb3e6f8d4d
