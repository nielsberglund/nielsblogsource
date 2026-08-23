---
type: post
layout: "post"
title: Interesting Stuff - Week 34, 2026
author: nielsb
date: 2026-08-23T07:15:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-34-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-34-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Microsoft Fabric
  - KQL
  - Real-Time Analytics
  - Data Engineering
  - Power BI
  - Claude Code
  - Agent Skills
  - AI Agents
  - Matt Pocock
description: "Week 34 roundup: sub-second real-time analytics with Fabric Eventstream and KQL, and Matt Pocock's /wayfinder skill for planning through the fog of war."
---

**A short roundup this week, but the two posts pair up better than they have any right to.** Both are about doing useful work when you can't see the whole picture yet: one at the level of streaming telemetry, the other at the level of a project you haven't fully figured out.

First, Microsoft Fabric Eventstream feeding a KQL Database, with materialised views and in-engine anomaly detection landing in under half a second. Then Matt Pocock's `/wayfinder` skill, which hands your agent an orchestrator for the planning phase and calls the thing you don't know yet, the "fog of war". Grab a coffee.

<!--more-->

---

## Generative AI

* [**The /wayfinder Skill: Navigating the "Fog of War" of Planning**][2]. Richard MacManus, in this post, looks at `/wayfinder`, a new skill from Matt Pocock, whose "AI Skills for Real Engineers" project, per the interview, has north of 220,000 GitHub stars and a YouTube audience of 347,000 subscribers. The problem `/wayfinder` solves is one I suspect a lot of you have felt without naming it: the *planning* stage is now the bottleneck. Pocock had built a solid pipeline for turning a spec into tickets that AFK agents could grind through overnight, but found the planning itself onerous, because he was constantly doing mental arithmetic about session management. How many tokens am I into this context window? How deep can I go before this thread starts forgetting things? So he built an orchestrator layer that takes the planning off your hands, splits it across multiple threads, runs prototyping and research in parallel, and pulls the results back together.

  The design story is the best part of the interview, and it's really a story about vocabulary. Pocock's reasoning goes as follows: a skill is fundamentally about context management, so start with the information flow. What does a managed child session need? A vague overview of everything else that's happening, plus its own specific task. That gives you two artefacts: the **map** (all the decisions already made) and the **ticket** (the work going into a session). And then the crucial bit: once you have the kernel of the idea, you have to find the *words* for it. Call everything a "ticket", or refer to the same entity three different ways in three different places, and the agent gets confused and behaves strangely. Use precise "leading words", and the entities map cleanly. Pocock says he's been obsessed with terminology for months and has an unreleased AI coding dictionary, a navigable graph defining agent, harness, model and the rest, that all his courses and skills now share, so everything works off the same assumptions. He calls it a ubiquitous language between him and the agent.
  
  The `/wayfinder` ticket taxonomy is worth stealing wholesale: **grilling tickets** for interrogation sessions, **prototype tickets**, **research tickets**, and **task tickets** for anything the human has to do that the agent can't. Which is why he's been using it well outside engineering, course planning, for one. The "fog of war" concept is the framing that ties it together: you can't decide everything at the start, but each decision you *can* make pushes the boundary outward, Warcraft III style. As for when to reach for which skill, Pocock's rule is crisp: use `grill me` when you can plan the whole thing in one session and need to align with the agent before you go, which covers most small features. Use `/wayfinder` when you can genuinely feel the fog in front of you.

  Here's what strikes me: we spent two years insisting prompt engineering was dead, and Pocock has quietly rebuilt it as *domain modelling*: which, as a distinctly less glamorous discipline, is a much better fit for what's actually going on. Naming your entities precisely and consistently so a collaborator doesn't get confused isn't an LLM trick; it's Eric Evans' ubiquitous language from Domain-Driven Design, aimed at a new kind of collaborator. That's why it works, and it's also why so many home-grown skills don't: people write instructions instead of defining a vocabulary. I've felt this acutely while writing skills for the Event Management System series: the ones that behave predictably are the ones where I committed to a single word for a single concept and used it everywhere. The other observation I can't shake is that Pocock's real innovation isn't the skill at all; it's admitting that a planning session is itself a context-window problem, and that the fix is orchestration rather than a bigger window. Everyone else is waiting for the next model to have a million tokens. He built a map instead. I know which approach I'd bet on.

---

## Streaming

* [**From Eventstream to KQL Database: Sub-Second Real-Time Analytics in Microsoft Fabric**][1]. In this post, Sandip Palit walks through building an end-to-end real-time analytics pipeline in Microsoft Fabric, and he opens with a line that will resonate with anyone who has spent a decade babysitting nightly ETL: we built a culture around "yesterday's data". The argument for moving on is not fashion; it's decay. The value of an event degrades exponentially with every second it sits in a queue, whether you're tracking logistics, watching IoT sensors on a factory floor, or reacting to live market signals. Fabric's answer is Real-Time Intelligence, and Palit's walkthrough takes high-velocity telemetry from Kafka, Azure Event Hubs, or a custom app endpoint, converts it into a Fabric **Eventstream**, and routes it natively into a **KQL Database**.

  The most valuable section is the one that answers the question every architect asks about ninety seconds into the demo: if Fabric is built around OneLake and open Delta Parquet, why not just stream into the Lakehouse and query it with the SQL Analytics Endpoint? Because you match the engine to the workload. Delta Parquet requires continuous compaction, and writing micro-files every few milliseconds walks you straight into the small-file problem. The Kusto engine, by contrast, was purpose-built for append-only telemetry: in-memory caching, columnar storage, and automatic indexing of every column on ingest, including nested JSON attributes and full-text strings. Hunting for a `DeviceId` or an error code inside a raw log line becomes an index lookup rather than a full table scan. Lakehouse for curated historical batch, KQL Database for live operational telemetry — that's the split, and it's a genuinely useful rule of thumb.

  The KQL itself is compact and worth reading even if you never touch Fabric. A `.create table` for the incoming `DeviceTelemetry` schema, then a **materialised view** that pre-aggregates by `bin(Timestamp, 1m)` so dashboards query a small pre-calculated summary instead of re-scanning millions of raw rows on every refresh. Then the part that made me sit up: `make-series` to build a gap-filled time-series array, piped into `series_decompose_anomalies`, which applies Seasonal Trend Loess decomposition, isolates the baseline and seasonality, and scores the remainder against a sensitivity threshold. Machine learning inside the query engine, no Spark cluster, no Scikit-Learn, no writing predictions back. Append `| render timechart` and you have a chart. On the serving side, DirectQuery or, better, Fabric's native Real-Time Dashboards polling the Kusto engine every ten seconds; please don't undo all that work with Power BI Import Mode and a scheduled refresh.

  What I find interesting here is that Kusto has quietly been the most underrated engine in the Microsoft data stack for years, and Fabric is finally putting it somewhere people will trip over it. Most of us met KQL through Azure Monitor or Log Analytics, decided it was "the thing you grep logs with", and went back to T-SQL. That was a mistake. `series_decompose_anomalies` doing STL decomposition inline is the kind of feature that, in any other product, would be a separate SKU with a marketing page and a webinar. And the broader point Palit is making is to pick the compute engine based on the access pattern rather than the platform diagram. That is the same lesson the Warner Music team landed on from the opposite direction when they migrated [off Cassandra back to PostgreSQL][wmg] last week. Two posts, two opposite migrations, one identical moral.

---

## WIND (What Is Niels Doing)

In last week's roundup I mentioned that the Call for Speakers for [**Data & AI Community Day Durban: Plugged In**][daid] and the co-located **GitHub Copilot Dev Days** would be opening real soon. Well, "real soon" has arrived: the [**CfS is now open**][cfs], and I'd love to see your submission. We already have some genuinely interesting talks in the pile, but there's always room for more. If you have something to say about data, AI, agents, or shipping software, get it in.

Full details on the event are live on the [event page][daid], and I'll keep you posted here as speakers, sessions, and registration news firm up.

---

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me with suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

I look forward to hearing from you.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: https://every.to

[daid]: https://aimldatadurban.org/events/2026/pluggedin/
[cfs]: https://sessionize.com/durban-pluggedin/
[wmg]: https://tech.wmg.com/rethinking-nosql-why-we-migrated-from-cassandra-to-postgresql-rds-561450d83c65

[1]: https://pub.towardsai.net/from-eventstream-to-kql-database-sub-second-real-time-analytics-in-microsoft-fabric-d9076ce1c7d6
[2]: https://www.latent.space/p/wayfinder-skill
