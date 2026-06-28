---
type: post
layout: "post"
title: Interesting Stuff - Week 26, 2026
author: nielsb
date: 2026-06-28T06:15:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-26-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-26-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - AI Agents
  - Claude Cowork
  - Open Weights
  - GLM
  - Enterprise AI
  - OpenClaw
description: "Week 26 tech roundup: the GLM 5.2 open-weights underdog, the full Claude Desktop on AWS, Google Cloud and Foundry, and why Claude Code is the OpenClaw alternative you already have."
---

This week is a study in three different answers to the same question: how do you actually get an AI to *do* things rather than talk about them? One says the secret is in the architecture, another says it's in the deployment plumbing, and a third says you've had the answer sitting on your laptop for over a year.

We've got a contrarian deep dive on the GLM 5.2 open-weights architecture, Anthropic rolling the full Claude Desktop experience onto AWS, Google Cloud, and Microsoft Foundry, and a genuinely fun argument that Claude Code is the OpenClaw alternative you already own. Grab a coffee; there's plenty here for the agent-builders and the enterprise-deployers alike, and I've got opinions on most of it.

<!--more-->

---

## Generative AI

* [**The Open-Weights Underdog Nobody Is Talking About: GLM 5.2**][1]. This post by Addepalle Nikhil Varma makes a deliberately spicy argument: while the entire industry copy-pastes the same left-to-right, next-token causal decoder, Zhipu AI and Tsinghua have quietly built a structural lead with the General Language Model architecture, and the GLM 5.2 family has made the gap impossible to ignore. The thesis is that standard decoders treat the context window as a flat, unidirectional sequence and pay a heavy computational tax for it, degrading badly on rich relational structure, the exact thing our RAG and long-context pipelines lean on hardest.

  The mechanism Varma points to is the autoregressive blank-filling objective. Rather than always predicting the next word, GLM masks random contiguous spans and trains the network to reconstruct them, routing the surrounding context via fully bidirectional attention while the masked block self-attends causally. The other eye-catching claim is native tool-calling: instead of the model emitting a JSON blob that LangChain has to intercept, parse, and serialise back, GLM 5.2 maps tool execution into native token transitions, which the author says collapses a 1.2-second middleware round-trip to under 50 milliseconds. He pairs this with a swipe at leaderboards, arguing they reward single-turn human preference while missing RAG context collapse, agentic halting, and the dense-token efficiency that supposedly lets GLM hit the same accuracy with 40% fewer parameters.

  What I find irresistible about this piece is also what makes me reach for the salt: it is a gorgeously confident story, and confidence is not the same as a benchmark. Some of the framing is hand-wavy, the throwaway code sample literally imports a Google GenAI SDK while talking about GLM, and "sub-50ms native tool tokens" is the sort of number I'd want to see reproduced before I rebuild my stack around it. But the *direction* of the argument deserves a hearing. We have spent two years assuming the transformer monoculture is the final word, and the most interesting question in open weights right now isn't "who tops LMSYS this month" but "is anyone challenging the training objective itself?" If even half of the long-context reliability claims hold up under independent testing, the data and agent crowd should be paying far more attention to architecture and far less to leaderboard theatre. I'm intrigued, and that is a good place to start a week.

---

* [**The full Claude Desktop experience on AWS, Google Cloud, and Microsoft Foundry**][2]. In this post, Anthropic announces that organisations running Claude Desktop through AWS, Google Cloud, and Microsoft Foundry now get the *complete* surface, chat, Claude Cowork, and Claude Code, all in one app, where previously those cloud-marketplace customers only had Cowork and Code. Inference runs on your own cloud in the regions you configure, conversation history stays local, and you decide which endpoints the data connectors can reach and what aggregated telemetry Anthropic sees. It's a deployment story dressed as a product launch, and for regulated enterprises that distinction is the whole point.

  The IT-friendly details are where it earns its keep. Sign-in rides on whatever you already run, IAM Identity Center, Workforce Identity Federation, Microsoft Entra ID, or any OIDC provider like Okta, so there are no shared keys to rotate and no cloud credentials on end-user machines. Policy templates are exported from the setup UI and pushed through Intune, GPO, or Jamf, and an offline installer covers air-gapped environments. Crucially, each surface, chat, Cowork, and Code gets its own policy key, so you can hand non-technical teams chat and Cowork while reserving Code for engineering and broaden access as adoption grows. There's a model guard that keeps routing on Claude even in GovCloud if someone fat-fingers a setting, plus a Microsoft 365 connector that reaches mail and documents through your own Entra app, with a local-connector option for the strictest data-residency requirements.

  Here's what strikes me: this is the quiet, unsexy work that decides whether agentic AI actually lands inside big organisations or stays a fun toy for individual power users. The headline-grabbers are always the model benchmarks, but what gets Cowork and Claude Code past a security review is per-surface policy keys, SSO you already trust, and inference that never leaves your tenant. As someone who keeps banging on about Cowork as the place non-developers finally get an agent that touches their real files, I find it genuinely significant that it now ships through the same governed channel as Code, behind its own policy key, on the clouds enterprises already buy from. The frontier isn't always a smarter model; sometimes it's an MDM template that lets a Fortune 500 say yes.

---

* [**Claude Code Is the OpenClaw Alternative You Already Have**][3]. Nityesh Agarwal, in this post (free subscription required), looks at the elephant in the agent room: OpenClaw became the most-starred software project in history in 60 days by showing people an AI that *does things*, managing calendars, sending email, driving a browser from a WhatsApp message, while Claude Code, which can do all of the same, got filed away as "just a coding tool." His argument, sharpened by months of building both at Every (including Claudie, an AI employee running their consulting back office), is that the difference was never capability. It was marketing. Both are, underneath, a harness around a model, and the only reason Claude Code feels narrower is that most people run it within a single project folder rather than pointing it at their entire machine.

  Agarwal walks through the five things people loved about OpenClaw and shows Claude Code matching each. It feels like a person because it can see your files, give Claude Code access to your whole computer, and you've got an "AI employee" (with `--dangerously-skip-permissions` if you want OpenClaw-style autonomy). It operates in the real world via direct computer control and MCP connectors to Google Workspace, your CRM, Asana, and a database. Its memory is arguably cleaner: three layers of plain-Markdown CLAUDE.md, a built-in memory system, and an optional local search index, rather than OpenClaw's eight bootstrap files and a "dreaming" consolidation process. Skills are literally the same Anthropic standard, so an OpenClaw skill runs in Claude Code unchanged. And the famous "heartbeat" that works while you sleep? That's a cron job plus headless mode, a setup even OpenClaw's own creator concedes is equivalent.

  The part of the data and reliability folks will nod at the hardest is where he explains *why* he steers people to Claude Code. OpenClaw keeps one long-lived session per user, so context piles up all day, by midday you might be carrying 50,000 tokens, and an unreliable 4 a.m. reset means typing "hi" can bill you for yesterday's bloated thread. Claude Code's model is one thread, one session, opening clean with just your CLAUDE.md baseline and auto-compacting when threads grow. And when OpenClaw forgets something, the cause could hide in any of half a dozen memory layers; in Claude Code, you open a Markdown file and *read* what it was told. Debugging is editing a text file. His diagnosis, that each OpenClaw layer exists to patch a weakness in the simpler one beneath it, is the most quietly devastating line in the piece.

  I keep wrestling with how on-the-nose this article is for me specifically, because the blog post you're reading was assembled using exactly the setup he's describing: a CLAUDE.md file, a skill, and a scheduled headless run to do the work while I sleep. I'll acknowledge my bias and then address the framing. OpenClaw earned every one of its 380,000 stars by making the "aha" land for a mass audience in a way a terminal tool never will, and "you already have the alternative" is cold comfort if the alternative needs you to know what a cron job and a flag are. The real lesson isn't "Claude Code beats OpenClaw"; it's that the magic was never the crustacean branding or the WhatsApp interface, it's the harness, the context you give it, and the plumbing you wire around it. Pick whichever harness you'll actually maintain, then spend your energy on the CLAUDE.md and the skills, because that's the bit that turns a clever demo into something you trust at 6 a.m.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to
[sd]: https://streamingdata.io

[1]: https://pub.towardsai.net/the-open-weights-underdog-nobody-is-talking-about-glm-5-2-e6d70c311274
[2]: https://claude.com/blog/the-full-claude-desktop-experience-on-aws-google-cloud-and-microsoft-foundry
[3]: https://every.to/source-code/claude-code-is-the-openclaw-alternative-you-already-have
