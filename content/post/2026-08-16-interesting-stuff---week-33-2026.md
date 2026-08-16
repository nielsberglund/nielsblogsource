---
type: post
layout: "post"
title: Interesting Stuff - Week 33, 2026
author: nielsb
date: 2026-08-16T09:01:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-33-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-33-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
  - PostgreSQL
  - aimldatadurban
  - pluggedin
  - Dev Days 2026
description: "Week 33 roundup: agent memory you can actually trust, the vanishing middle class of software engineering, OKF token hand-offs, cheaper Claude Code sessions, and Cassandra to PostgreSQL."
---

**This week is all about trust, and who pays for it.** Two posts poke at Google's Open Knowledge Format from opposite ends: one asks who gets to declare a piece of agent memory "verified"; the other bolts a token pointer onto the frontmatter and hands raw integers between three models. Both land on the same lesson: the format is never the guarantee.

Elsewhere, a sharp essay argues AI is hollowing out the middle of our profession, Anthropic explains exactly where your Claude Code tokens go (and how to stop wasting them), and Warner Music's engineering team does the unthinkable in 2026: they migrate *off* NoSQL and back to PostgreSQL. Grab a coffee; this one has opinions.

<!--more-->

---

## Generative AI

* [**From Self-Updating OKF Wiki to Production Trust System**][1]. In this post, Udaykiran Estari picks at a thread that most agent-memory projects would rather leave alone: your coding agent has opened a pull request updating the team's shared knowledge bundle, the Markdown is clean, the YAML parses, and buried in the frontmatter is a tidy little `verified: by: human:finance-owner` event. There is only one problem. The agent wrote that event itself. A YAML parser cannot authenticate an identity, cannot establish that a review happened, and cannot prove the cited source supports the claim. The file *represents* a trust signal; it does not enforce one, and that distinction is the entire production boundary for agent-maintained memory.

  The post is a tour of OKF v0.2, which adds optional fields that let consumers ask five practical questions before acting on a concept: where it came from, who generated it, who verified it, whether it is current, and whether a reported computation can be reproduced. Actor prefixes matter here (`process:` for automation, `human:` for people, `producer/version` for tools), and consumers derive three advisory trust tiers from them. Estari's architecture splits the lifecycle into four roles with four different authorities: the **producer** drafts and may only propose `status: draft`; the **verifier** checks the claim against its source; the **publisher** pulls reviewer identity from authenticated pull-request metadata rather than from anything the producer wrote; and the **consumer** applies a trust policy before a single byte reaches an agent's context. His enforcement layer is refreshingly boring: GitHub CODEOWNERS, protected branches, dismissal of stale approvals, separate bot and human identities, and, critically, protecting the CODEOWNERS file itself so an agent can't weaken the gate evaluating its own change.

  There is a lovely section on truth maintenance too, treating the knowledge graph as a cache with all the coherence problems that implies: invalidate reverse dependencies when a source changes, keep tombstones so deletion is represented rather than silently forgotten, distinguish a rename from a replacement, and fail closed when the reconciler can't tell whether a concept is still valid. He also takes a swipe at the "95% fewer tokens" genre of claim, pointing out these are hypotheses until you define the workload and the quality baseline, because a smaller context is not an improvement if the agent misses a dependency.

  What I find compelling here is that this is a security argument dressed up as a documentation argument, and almost nobody in the agent-memory space is making it. We spent a decade learning not to trust a JWT without validating its signature, and then we cheerfully invented a shared state store in which the thing being audited writes its own audit row. The line I'd tattoo on the inside of every architect's eyelids is "the mistake is asking the file to prove itself." If you're building any persistent agent memory, and if you're using Claude Code with a `CLAUDE.md` and a pile of skills, you *are*, this is the post that tells you which parts of your setup are load-bearing and which parts are vibes with a timestamp.

---

* [**AI is removing the middle class of software engineering**][2]. This post by Florian Herrengt opens with a scene that will make a certain kind of tech lead put down their coffee. It's 2020, you go on holiday, you come back, and the codebase is a mess: unreviewed merges, someone denormalised the database because it was easier, someone else added Kafka with no evidence they needed it. Fixable. Fast forward to 2026 and it's just a normal Monday: seven PRs waiting, the first one is +24,506 / -3,938 lines with an AI-generated description, and your team has produced more change since Friday than they used to manage while you were away for a fortnight. AI, as he puts it, removed the speed limit.

  The tragedy, Herrengt argues, is that to the untrained eye it works. Pull the branch, test it, get something functional, keep going. Until a user reports a weird bug, it's the fourth attempt at fixing it, and the conversation goes: "So where does the data come from?" "Hmm, actually I don't know. Let me ask Claude." He compares it to buying a luxury car on a credit card: you don't see the debt, you see the car. And the reversal cost is brutally asymmetric. An LLM can add a pile of tables and columns in ten minutes; once real customers are storing data in them, you're writing a migration plan, worrying about orphaned foreign keys, and planning for a failed cutover, all while five more bad decisions get merged behind you.

  His conclusion is the provocative bit: implementation is now cheap, so you are paid for judgement, and that pushes salaries *apart*. Good engineers become more valuable because AI multiplies them and they no longer need a supporting cast to do the typing. Weak engineers become far more expensive to hire because the blast radius of their bad decisions has expanded while the review capacity to catch them has not. He expects the same dynamic to spread across most knowledge work, not just software.

  Here's what strikes me: I agree with the diagnosis, and I'm suspicious of the metaphor. "Middle class" implies a stable stratum that's being eliminated, when what I actually see is the *entry ramp* being pulled up. Every senior engineer I know, myself very much included, became senior by shipping mediocre code, having someone senior tear it apart, and doing better next time. If the mediocre code is now free and infinite, where does the next generation of judgement come from? Nobody has a good answer to this yet, and the ones being offered ("juniors will just supervise agents") sound to me like teaching someone to be a head chef without ever letting them cook. If you have a genuinely good answer, I'd love to hear it in the comments, because this is the question I keep circling back to.

---

* [**How to Utilise OKF Efficiently to Enable Knowledge Exchange Among LLMs**][3]. In this post, Anubhab Banerjee looks at the same Open Knowledge Format from a completely different angle, and the framing gag is worth the price of admission. Three Qwen2.5-Coder agents (7B, 3B, 1.5B) chained together over one shared design document, and every single one of them loads its own tokeniser and runs BPE over the exact same characters the previous agent just processed. "Hello, I am a beautiful, stateless newborn." The fix: tokenise once in Agent 1, drop the `int64` NumPy array into `/dev/shm/qwen_tokens/`, and let downstream agents call `model.generate(input_ids=...)` straight off the loaded tensor.

  The OKF part is the glue. Each block gets a Markdown file with YAML front matter carrying `block_id`, `source_agent`, `stage`, `tags`, `token_count`, `tokenizer_model_id`, and, the load-bearing addition, `token_pointer`: an absolute path to the precomputed array in shared memory. Human-readable body, machine-readable pointer. Banerjee is admirably honest that this makes his files *not* valid Google-OKF bundles as-is (they lack `type`; they add `token_pointer`), conforming in spirit rather than to the letter. The structural insight underneath is neat: you can never share a KV cache across these three models, because `hidden_size` differs (3584 / 2048 / 1536) and the maths closes that door permanently. But the tokeniser layer *is* shared because the whole Qwen2.5-Coder family ships a single identical BPE vocabulary.

  And then comes the guardrail, which the author correctly identifies as the actually interesting engineering. Feeding a downstream model integers that mean a different subword under its own vocabulary doesn't crash anything; it produces a fluent, coherent-looking, completely wrong report. So before any agent trusts another's integers, the pipeline runs a full ~151,936-entry `get_vocab()` dictionary equality check, not a lazy `vocab_size` comparison. The receipts: median of 7 trials, TTFT on the 3B model down from 69.3 ms to 49.9 ms (28.0%) and on the 1.5B from 49.6 ms to 30.9 ms (37.8%), with the smaller model showing the bigger percentage because its GPU-side floor is lower. Full pipeline wall clock: 41.3 s. Modest numbers, honestly reported, and the author is the first to say the 20 ms isn't the point; the check that turns a footgun into a reliable move is.

---

* [**Maximizing the value of your Claude Code sessions**][4]. In this post by Lydia Hallie, Anthropic finally writes down the thing every heavy Claude Code user has been reverse-engineering from their usage graph: what actually decides the price of a session. Until recently, your editor cost the same whether you fixed one test or fifty. With agentic tools, it doesn't, and the same completed task can cost wildly different amounts depending on how you ran it. Being efficient with tokens, she notes, doesn't mean using fewer of them; it means making sure the ones you spend go towards the thing you actually asked for.

  The mechanics are explained better here than anywhere else I've read. Three things decide a token's price: the model, whether it's input or output (decode keeps the GPU busy far longer, so output is priced at roughly 5x input), and whether it was cached. Cache reads cost 0.1x the input; cache writes cost up to 2x, but the write happens once, and the cheap reads happen on every turn after. The catch is that the cache has to match from the very start of the request, and requests always go out in the same order: tool definitions, system prompt, then the conversation with `CLAUDE.md` at the front. Change anything towards the front, and everything behind it gets prefilled again at full price. That's why `/model`, `/effort`, fast mode, and `/compact` all bust the cache, and why the cheap moments to switch are at the start of a session or right after a `/clear`, not forty turns deep.

  The second half is about volume, and the key sentence is "nothing gets sent just once." Every file Claude reads, and every command's output, gets re-sent on every subsequent turn for the rest of the session. Big outputs are fine, oddly, because past 30,000 characters, Claude Code writes to a file and puts a preview in the conversation. It's the test runner printing 400 passing tests one line at a time that quietly rides along in every remaining turn. Hence the practical list: run `/context` in a fresh session to see what's loaded before you type anything, keep `CLAUDE.md` to specific instructions and push workflow guidance into skills that load on demand, turn off MCP servers you don't need with `/mcp`, `@`-mention files instead of naming them so there's no `Read` call at all, put your everyday commands with quiet flags into `CLAUDE.md`, and hand noisy jobs like log-trawling to a subagent with its own context (and ideally its own `model: haiku`). Two tips I'd underline: `/rewind` instead of `/compact` when the last few turns went somewhere you don't want, because rewinding costs nothing while compacting always rewrites the whole conversation; and `/compact` *before* you walk away, since summarising is much cheaper while the conversation is still cached.

  What fascinates me about this post is how much of it is really about *thinking*, not billing. Every recommendation that saves you money also shrinks the pile of irrelevant junk the model has to reason around on every turn, which is the far more valuable currency. I've been running long, sprawling sessions on the Event Management System series and telling myself the accumulated context was helping; this post is a fairly direct rebuke of that instinct. Turn 40 isn't just paying to re-read the 39 turns in front of it; it's *thinking around* them. The mental model I'm taking away: treat a session like a workbench, not a filing cabinet. Clear it between jobs, and stop being sentimental about context you're never going to use again.

---

### Databases

* [**Rethinking NoSQL: Why We Migrated From Cassandra to PostgreSQL RDS**][5]. This post by Mark Lin and Patrick Cosmo of the WMG Innovation Lab is the sort of thing you rarely see published: an engineering team explaining, in detail and without embarrassment, why they moved *back* to a relational database. Their platform, Tango, processes over 7 TB a year and manages more than $1 billion in annual royalties across 2.5 million works. It ran on Cassandra, chosen around 2012–13 when the industry was infatuated with NoSQL, wrapped in an in-house ORM built on a 1.2.x client and bolted to Spring 3.1.x. It did what they asked of it for a decade. Then their access patterns caught up with reality.

  The reality is that music publishing is a deeply interconnected web of relationships: a user belongs to a territory, a territory defines a royalty split, a split points back to an identity. Cassandra, as the authors put it with admirable bluntness, hates relationships. It wants flat data duplicated across tables to satisfy specific queries. So they bolted on an external Elasticsearch cluster to index secondary fields, then leaned on Elasticsearch and in-memory caching for reporting, often building indexes that *reconstructed a relational schema* in a search engine. Then came the complexity tax of dual writes and sync lag, and the operational overhead of babysitting cluster health and repair jobs instead of shipping features. Their diagnosis is the line the whole post turns on: "we weren't suffering from a scale problem anymore; we were suffering from a complexity problem."

  The migration deserves study in its own right. With 10 billion rows, they ruled out a big-bang cutover immediately, on the entirely correct logic that if something goes wrong eight hours into a twelve-hour window, your rollback plan is a nightmare. Instead: a phased, entity-by-entity rollout, custom extraction pipelines, controlled background backfills, and, because they operate in a compliance-mandated environment, **parallel royalty runs for two full quarters** with old and new implementations side by side so they could prove correctness rather than assert it. The payoff: ingestion and calculation runtimes down roughly 20%, Elasticsearch and the custom ORM eliminated entirely, and stability transformed from at least one Cassandra node outage a day (three a day during quarter close, naturally) to a managed service that runs. On cost, they were already at 32 nodes with projections to 64 within two years; that curve is now gone. And delta extraction for downstream BI, which NoSQL couldn't do natively and which forced full table extracts, is now a `WHERE` clause.

  I keep wrestling with how much of our industry's technical debt is really just *fashion* debt, and this post is Exhibit A. Nothing about Cassandra failed here. It did precisely what it says on the tin. What failed was a 2013 assumption about scale being carried forward as an unexamined constraint into a 2026 world where managed Postgres eats this workload for breakfast. Their advice, "don't let choices made a decade ago dictate your architectural future out of sheer habit", is the most valuable sentence in the piece, and I'd add a corollary: the choices you're making *this* week under the current fashion cycle are the ones somebody will be unpicking in 2036. The bravest engineering move genuinely isn't adopting the shiniest tool; it's admitting the classic one was right and eating the migration. Two quarters of parallel runs to prove it, though? That's discipline most teams talk about and very few actually fund.

---

## WIND (What Is Niels Doing)

Less than a month ago, we wrapped [**Data & AI Community Day Durban: AI Unplugged II — The Maskandi Sessions**][daid] at Richfield College's Umhlanga Campus, and somewhere during the pack-down, we all said: "never again". Reader, we lied. We're at it again, and we're currently finalising the details for the next one: [**Data & AI Community Day Durban: Plugged In**][daid2], hosted once more by our good friends at Richfield College, Umhlanga Campus, on **September 19**.

The big news, and I've been sitting on this one with great difficulty, is:
 
{{< imgfig2 "/images/posts/social-github-copilot-dev-days-durban-cropped.png" "Figure 1: " "GitHub Copilot Dev Days 2026" >}}
 
Yes, you read that right. The **GitHub Copilot Dev Days** is coming to Durban, and we run it as part of **Data & AI Community Day Durban: Plugged In**! This is a global event series that brings together developers, engineers, and tech enthusiasts to explore the latest in AI-powered coding and development tools. The event will feature hands-on workshops, live coding sessions, and talks from industry experts on how to leverage GitHub Copilot for enhanced productivity and innovation.

Check back often for the latest on both the community day and Copilot Dev Days; announcements on speakers, sessions, and registration are coming shortly.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[daid]: https://aimldatadurban.org/events/2026/maskandi/
[daid2]: https://aimldatadurban.org/events/2026/pluggedin/

[1]: https://pub.towardsai.net/from-self-updating-okf-wiki-to-production-trust-system-b014dbd12149?sk=v2%2F8b534209-ea20-4695-8548-60def992b092
[2]: https://blog.florianherrengt.com/ai-removing-middle-class-software-engineering.html
[3]: https://towardsdatascience.com/how-to-utilize-okf-efficiently-to-enable-knowledge-exchange-among-llms/
[4]: https://claude.com/blog/maximizing-the-value-of-your-claude-code-sessions
[5]: https://tech.wmg.com/rethinking-nosql-why-we-migrated-from-cassandra-to-postgresql-rds-561450d83c65
