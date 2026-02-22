---
type: post
layout: "post"
title: "Building an Event Management System with Claude Code: Part 11 - Campaign Tracking & Batch Sending"
author: nielsb
date: 2026-02-22T09:09:35+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/claude-code-ai-11.png"
thumbnail: "/images/thumbnails/posts/claude-code-ai-11.png"
categories:
  - Claude-Code
  - AI-Coding 
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - AI-assisted Coding
  - MCP Servers
  - AI-Native Development
  - Brevo
  - Email Marketing
  - Campaign Tracking
description: "Part 11: Add campaign tracking and batch sending to your AI-native event system. Design tracking tables conversationally, send personalised campaigns to multiple recipients, and prevent duplicate emails—all through Claude Code and Claude Desktop."
---

Welcome back to the **Building an Event Management System with Claude Code** series! In Part 10, we integrated Brevo MCP for email sending, solved the template parameter-mapping challenge with our `templates.json` registry, and sent our first transactional email through natural language. A milestone, but we ended with three unanswered questions.

* **To see all posts in the series, go to:** [**Building an Event Management System with Claude Code**](/contact-event-claude-code).

Those questions were: "How do I know who's already received this email?", "How do I avoid emailing the same person twice?", and "How do I handle Brevo's 300/day free-tier limit?" Today, we answer the first two.

<!--more-->

---

## Why Single Sends Aren't Enough

Part 10 proved a concept: we can send a single email by asking Claude in plain English. That's useful for a quick test or a one-off message. But running a real event means sending *campaigns*, the same CFP invitation to 30 speakers, the same reminder to 250 attendees, the same logistics email to every presenter two weeks before the event.

With Part 10's approach, you'd need to send each email individually, and you'd have zero record of who received what. Forget who you've already emailed? Someone gets a duplicate. Want to know whether all speakers received the CFP invitation? You should check your email's sent folder manually, which rather defeats the purpose of an AI-native system.

The existing `email_log` table (which we are not using BTW) doesn't help much either. It was designed back in Part 5 as a blunt instrument: it logs *that* an email was sent, along with its subject and recipient count. But it doesn't track individual recipients, doesn't link sends to a campaign concept, and doesn't tell you anything about who *hasn't* been contacted yet.

We need a proper campaign infrastructure. And as always, we'll build it conversationally.

---

## What We're Building Today

By the end of this post, we'll have:

- ✅ Designed `campaigns` and `campaign_sends` tables through conversation with Claude Code
- ✅ Created and executed the database migration via MCP
- ✅ Sent our first batch campaign with personalised emails to multiple recipients
- ✅ Implemented campaign-aware duplicate prevention

> **NOTE:** My track record of covering everything listed here is... well, you've read the previous ten parts. Let's see how far we get this time.

---

## Claude Code Tips Before We Dive In

Before we dive into the campaign tracking design, a couple of quick things about Claude Code (I may have mentioned it before, but it bears repeating):

* When starting up Claude Code, I always do a `claude update` first to make sure I'm on the latest version. 

{{< imgfig2 "/images/posts/claude-code-11-1.png" "Figure 1: " "Running claude update before starting Claude Code" >}}

The Claude Code team is pushing updates frequently, and you want to be on the latest for the best experience, and as we see in *Figure 1*, a new update was available.

* When you work in Claude Code, you spend most of your time in the terminal. If you are like me, you probably have something like **Oh My Zsh** installed, which adds a lot of nice features to the terminal. However, when you are in Claude Code, the experience is barebones. Wouldn't it be cool if you could have the same terminal experience in Claude Code as you do in your regular terminal? Well, you can:

{{< imgfig2 "/images/posts/claude-code-11-2.png" "Figure 2: " "Claude Code with Claude Code Statusline" >}}

In *Figure 2*, you see (highlighted in red) a status line: the Claude Code Statusline. Claude Code Statusline is a customisable information bar at the bottom of the Claude Code interface that displays real-time details like model name, Git branch, context usage, and session cost without consuming tokens. I just installed it thanks to an [article by **Joe Njenga**][2], and it works perfectly.

> **NOTE:** Joe Njenga has a wealth of information about Claude Code. It is well worth subscribing to his blog.

I am not covering any details about the installation and configuration of the Claude Code Statusline. For that, I refer to [Joe's post][2].

---

## Designing Campaign Tables with Claude Code

This section follows the same pattern we used in Part 5 when we designed the original schema: describe the business requirements, let Claude Code propose a design, then refine through conversation. The difference is that we now have 10 tables already in the database, so Claude Code needs to *fit* the new tables into the existing structure, not start from scratch.

### Starting the Conversation

I opened Claude Code in the project directory and kicked things off:

```
We need to add campaign tracking to our event management database. Right now we have an email_log table that tracks sends at a high level, however it is not used, and - also - it's not enough. Can you plan what you think is needed to be able to track whos is being sent what, and for what events. Remember we will have multiple events per year. Also, we should think about other ways of comms than just email. At the moment we are using LinkedIn, with some success. In addition creating marketing materisl on the fly. Just plan this, do not write any code.
```
{{< gen-cap "Code Snippet 1" "Initial Prompt to Claude Code for Campaign Tracking Design" >}}

You see in *Code Snippet 1* that I am describing the *business problem* ("we need to know who's being sent what"), not the technical solution. I'm also explicitly asking Claude Code what it thinks is needed, rather than telling it what to do. This is a key part of the AI-native development approach: leverage the AI's ability to design solutions, not just execute them.

### Claude Code's Planning Process

Claude Code goes off planning:

```
● Entered plan mode
  Claude is now exploring and designing an implementation approach.

● Let me explore the current database schema to understand what we have before designing the campaign tracking plan.

[claude code investigates the datbase schema - snipped for brevity]

● Good, I now have a clear picture of the current schema. Before I design the plan, I have a couple of questions.

[prompting user for clarification - snipped for brevity]

● User answered Claude's questions:
  ⎿  · For LinkedIn, what types of outreach do you want to track? → Posts only
     · For marketing materials (flyers, social graphics, banners), what do you want to track? → Creation +
     distribution
     · What should happen to the existing email_log table? → Replace it
```
{{< gen-cap "Code Snippet 2" "Claude Code Exploring the Existing Schema and Asking Clarifying Questions" >}}

What you see in *Code Snippet 2* is very cool! Since we are in plan mode, Claude Code is taking the time to explore the existing database schema to understand what tables we already have and how they relate to each other. This is crucial for designing a new feature that fits well with the existing structure. 

After exploring, it asks clarifying questions about the requirements for LinkedIn tracking and marketing materials, as well as what to do with the existing `email_log` table. Having this back-and-forth in the planning phase ensures the design meets our needs before we start writing any code. I answered the questions, and Claude Code continued:

```
● Now let me read the existing templates.json for the full picture.

● Read 1 file (ctrl+o to expand)

● Now I have everything I need. Let me write the plan.

● Updated plan
  ⎿  /plan to preview

Ready to code?
```
{{< gen-cap "Code Snippet 3" "Claude Code Reviewing Existing Templates and Creating the Plan" >}}

As shown in *Code Snippet 3*, after gathering all the necessary information, including the existing database schema and the `templates.json` file, Claude Code is now ready to write the plan for the campaign tracking feature. It has synthesised all the information and is asking for confirmation before proceeding to code. This is a great example of how AI-native development enables a more thoughtful, informed design process by leveraging AI's ability to understand and integrate complex information before taking action. 

At this stage, instead of diving straight into coding, I asked Claude Code to document the plan, which it did. The plan is published as a `gist` at [Campaign & Communications Tracking — Schema Plan][3]:

```
 Here is Claude's plan:
╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌
 Campaign & Communications Tracking — Schema Plan

 Context

 The current email_log table tracks email sends at a high level (subject, recipient_count, template_used) but has no
 per-recipient tracking and is unused. As the system grows to multiple events per year and multiple communication
 channels (email via Brevo, LinkedIn posts, on-the-fly marketing materials), we need proper campaign tracking that
 answers: who was sent what, through which channel, for which event.

 This migration will replace email_log with a richer set of tables.

[Claude Code prints the whole plan - snipped for brevity]

 Claude has written up a plan and is ready to execute. Would you like to proceed?

 ❯ 1. Yes, clear context and bypass permissions
   2. Yes, and bypass permissions
   3. Yes, manually approve edits
   4. Type here to tell Claude what to change
```
{{< gen-cap "Code Snippet 4" "Claude Code Presenting the Campaign Tracking Plan and Asking for Confirmation" >}}

In *Code Snippet 4*, Claude Code has collected all the information gathered and written a comprehensive plan for the campaign-tracking feature. It covers the context, the new tables to be created, the relationships between them, the indexes needed, example queries that this design enables, the migration steps, and the impact on existing components. 

Now it is asking for confirmation before executing the plan. This step is crucial as it allows for a final review of the design before any changes are made to the database. If everything looks good, we can proceed with the migration that will implement this new campaign-tracking infrastructure.

### Doing the Migration

I reviewed the plan, made a couple of minor tweaks to the table designs, then gave the green light to proceed:

```
Plan to implement                                                                                                   │
│                                                                                                                   │
│ Campaign & Communications Tracking — Schema Plan                                                                  |   
|                                                                                                                   |
| [snipped for brevity]                                                                                             │
│                                                                                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

● I'll start by reading the existing files to understand the current state, then implement the migration.

● Searched for 4 patterns, read 5 files (ctrl+o to expand)

● Now let me check the current database state to confirm the existing tables before writing the migration.

[Claude Code checks the database - snipped for brevity]

● Good — email_log is empty, so safe to drop. I have everything I need. Let me create the migration file, then update
  DATABASE.md and CLAUDE.md.

[snipped for brevity]

● Now let me run the migration against the database.

[Claude Code creates the tables in the database - snipped for brevity]

● All tables created and email_log dropped. Now let me verify.

● 14 tables confirmed — email_log is gone, all 5 new tables present. Let me run a quick integration test and then
  update the docs.

[Claude Code runs integration tests - snipped for brevity]

● All verification passed. Now let me update the docs in parallel.

[Claude Code updates all documentation - snipped for brevity]

● All done. Here's a summary of what was implemented:

[snipped for brevity]

  Verified

  - All 14 tables confirmed in database
  - Test insert flow: campaign → communication → recipients → cross-table JOIN query worked
  - CHECK constraints validated (invalid campaign_type correctly rejected)
  - Test data cleaned up after verification

✻ Worked for 7m 2s

```
{{< gen-cap "Code Snippet 5" "Claude Code Executing the Campaign Tracking Migration" >}}

Claude Code followed the plan step by step. It first checked the existing database state to confirm that the `email_log` table was empty and safe to drop. Then it created the migration file with the necessary SQL to create the new tables, along with the appropriate indexes and constraints. 

After running the migration against the database, it verified that all tables were created correctly and that the `email_log` table was dropped. Finally, it ran integration tests to ensure that the new schema worked as expected and updated all relevant documentation. As you see in *Code Snippet 5*, the entire process took 7 minutes and 2 seconds, which is quite efficient for a migration of this scope.

#### Verifying the Migration

Trust but verify! I switched to Claude Desktop to independently verify that the new tables were created and the old table was dropped:

{{< imgfig2 "/images/posts/claude-code-11-3.png" "Figure 3: " "Claude Desktop Confirming 14 Tables After Migration" >}}

Everything looks OK in *Figure 3*. We have 14 tables now (up from 10), and `email_log` is gone. All the new tables are present. We're ready to start using this new campaign tracking infrastructure for our email campaigns, LinkedIn posts, and marketing materials.

---

## Sending Our First Campaign

This is the payoff. In Part 10, we sent a single email to a single person. Now, we're going to send a real campaign, the CFP Invitation, to multiple speakers, with full tracking.

### The Campaign Flow

Yes, we are ready to send a campaign, but before we do, let's walk through the flow of a campaign from start to finish:

```
With all the new tables in the database, can you explain to me the flow, from start to finish, of a campaign
```
{{< gen-cap "Code Snippet 6" "Asking Claude Code to Explain the Campaign Flow" >}}

Claude Code responds:

```
● Sure. Let me walk through a complete campaign lifecycle using the CFP invitation as an example.

  Campaign Flow: "CFP Invitation — Data & AI Day 2026"

  Step 1: Create the Campaign

[step 1 - snipped for brevity] 

  This is the umbrella that groups everything together.

  ---
  Step 2: Send Emails (Communication #1)

  You tell Claude: "Send the CFP invitation to all 2024 speakers. Deadline is Jan 31, submit link is ..."

  Three things happen:

[claude code describes the email communication creation and tracking - snipped for brevity]  


  Campaign status moves to "active".

  ---
  Step 3: Post on LinkedIn (Communication #2)

  You tell Claude: "Log that I posted about the CFP on LinkedIn"

[claude code describes the LinkedIn communication tracking - snipped for brevity]

  ---
  Step 4: Create Marketing Material (Asset)

  You tell Claude: "I created a CFP flyer for social media"

[claude code describes the marketing asset tracking - snipped for brevity]

  ---
  Step 5: Distribute the Material

  You tell Claude: "I shared the CFP flyer on LinkedIn and WhatsApp"

[claude code describes the asset distribution tracking - snipped for brevity]

  ---
  Step 6: Query Campaign Status

  Now you can ask things like:

  ┌──────────────────────────────────────┬────────────────────────────────────────────────────┐
  │               Question               │                 What gets queried                  │
  ├──────────────────────────────────────┼────────────────────────────────────────────────────┤
  │ "What have we done for CFP 2026?"    │ campaigns → communications + marketing_assets      │
  ├──────────────────────────────────────┼────────────────────────────────────────────────────┤
  │ "Who received the CFP email?"        │ communication_recipients → contacts                │
  ├──────────────────────────────────────┼────────────────────────────────────────────────────┤
  │ "Did Jane Smith get the CFP invite?" │ communication_recipients WHERE contact_id = Jane   │
  ├──────────────────────────────────────┼────────────────────────────────────────────────────┤
  │ "Where did we share the CFP flyer?"  │ asset_distributions for that asset                 │
  ├──────────────────────────────────────┼────────────────────────────────────────────────────┤
  │ "Show me a full timeline"            │ All communications + distributions ordered by date │
  └──────────────────────────────────────┴────────────────────────────────────────────────────┘

  ---
  Step 7: Close the Campaign

  Once CFP closes, you say: "Mark the CFP campaign as completed"

  Campaign status → "completed".

  ---
  The Full Picture

  Campaign: "CFP Invitation — Data & AI Day 2026"
  ├── Email blast (23 speakers)
  │     ├── Jane Smith → sent ✓
  │     ├── John Doe → sent ✓
  │     └── ... 21 more
  ├── LinkedIn post → published ✓
  └── CFP Flyer
        ├── shared on LinkedIn (reach: ~500)
        └── shared on WhatsApp (reach: ~120)


  Everything ties back to the event through campaigns.event_id, so you can always ask "What outreach have we done for
  the 2026 event across all campaigns?" and get the complete picture.
```
{{< gen-cap "Code Snippet 7" "Claude Code Explaining the Full Campaign Flow" >}}

In *Code Snippet 7*, Claude Code walks through a complete campaign lifecycle using the CFP invitation as an example. It covers everything from creating the campaign, sending emails, posting on LinkedIn, creating marketing materials, distributing them, querying the campaign status, and finally closing the campaign. 

> **NOTE:** The flow described above is the idealised version. In practice, you might not follow it perfectly — maybe you post on LinkedIn before sending the emails, or you create the flyer after the LinkedIn post. The beauty of this design is its flexibility, which allows it to accommodate different workflows while still providing robust tracking.

This comprehensive flow demonstrates how the new campaign-tracking infrastructure enables us to manage and track all communications and assets related to a campaign in a structured way, providing full visibility into our outreach efforts for each event.

#### Claude Desktop and the Campaign Flow

This is all well and good, but how does it work in Claude Desktop? Does Claude Desktop understand this flow, and can it execute it? Talking to Claude Code:

```
Above you laid out the workflow. Will Claude Desktop understand this, or do I need to further prompt it?
```
{{< gen-cap "Code Snippet 8" "Asking Claude Code if Claude Desktop Understands the Campaign Workflow" >}}

Claude Code thinks about it and comes back with an answer:

```
● I've reviewed the campaign flow. It's a clear 7-step lifecycle:

[Claude Code summarises the flow - snipped for brevity]

  Will Claude Desktop understand this out of the box?

  Partially. Claude Desktop with Postgres MCP can discover your schema via list_objects and get_object_details, so it
  will understand the table structure and foreign keys. If you say "create a CFP campaign for 2026", it can probably
  figure out the INSERT.

  But it won't know:

[Claude Code identifies potential gaps - snipped for brevity]

  Recommendation

  Add a condensed version of this flow to your Claude Desktop project instructions (the "Project Knowledge" section).
  Something like:

  Campaign workflow: Always create a campaigns row first (status: draft). Email sends create a communications row + one
  communication_recipients row per contact. Social posts create a communications row with no recipients. Marketing
  materials go in marketing_assets, distribution tracking in asset_distributions. Move campaign status: draft → active
  (on first send) → completed (when done).

  That single paragraph gives Claude Desktop enough context to follow the pattern correctly every time. Without it,
  you'll find yourself correcting it mid-conversation.

  Want me to draft a full project instructions block you can paste into Claude Desktop?
```
{{< gen-cap "Code Snippet 9" "Claude Code's Analysis of Claude Desktop's Understanding of the Campaign Workflow" >}}

You see in *Code Snippet 9* the answer to whether Claude Desktop understands the campaign workflow is "maybe". It can understand the schema and probably figure out how to insert records. Still, it won't inherently understand the *concept* of a campaign lifecycle or the relationships between the tables without some guidance. Claude Code offers to draft a project instructions block that condenses the workflow into a concise format that Claude Desktop can reference during conversations. 

This is a great example of how AI-native development often involves teaching the AI about the domain and workflows through project instructions, enabling it to execute complex patterns correctly without needing constant correction.

---

## Claude Skills

Project instructions would have worked, but I wanted to try something more powerful: **Claude Skills**.

A Claude skill is essentially a folder of instructions that teaches Claude how to do a specific task really well, in a repeatable way. At its core, every skill has a `SKILL.md` file; a plain markdown file with two parts: some metadata at the top (like the skill's name and a description of when to use it), followed by the actual instructions Claude should follow. That's it. No complex code required; skills can include scripts and other resources.

When you type instructions in a conversation, they only exist for that conversation. A skill is persistent, version-controllable (it's just files), and can include supporting scripts that actually execute code. not just text guidance. Typically, skills are associated with Claude Code. Still, they can also be used in both Claude Desktop and the API, making them portable across the different ways you interact with Claude. This makes them a powerful way to encapsulate complex workflows, like our campaign management, in a reusable format that can be easily shared and maintained.

### Creating the Campaign Management Skill

Instead of having Claude Code create the project instructions, I'll ask it to create a campaign management skill that I can use in both Claude Code and Claude Desktop:

```
Instead of a project instructions block, can you please create a campaign management skill, that I can use both in Claude Code, as well as Claude Desktop.
```
{{< gen-cap "Code Snippet 10" "Asking Claude Code to Create a Campaign Management Skill" >}}

Claude Code's response to the prompt above is as follows:

```
● Let me use the skill creator to build this properly.

● Skill(skill-creator)
  ⎿  Successfully loaded skill

[Claude Code loads the schema - snipped for brevity]

● Good, I have the full schema. Now let me create the skill.

[snipped for brevity]

● Now let me write the SKILL.md and the schema reference.

[snipped for brevity]

● The skill is packaged and valid. Let me verify the output.

● The skill is ready. Here's what was created:

[snipped for brevity]

  Contents:
  - SKILL.md - The main skill with the full campaign lifecycle workflow, common SQL queries, and segmentation patterns
  - references/schema.md - Complete table definitions for all 5 campaign tables plus related table summaries

  What it covers:

  1. Lifecycle steps - Create campaign, send email (with recipients), log social posts (without recipients), track
  assets, distribute assets, close campaign
  2. Ready-to-use SQL for every step with correct column names and CHECK constraint values
  3. Common queries - Campaign overview, recipient lists, contact history, suppression checks, campaign timeline,
  cross-campaign event reporting
  4. Segmentation patterns - Past attendees not registered, topic-based targeting, contacts not recently emailed, past
   speakers
  5. Key rules - Status transitions, when to create recipients vs not, unique constraints, suppression checks

  To install:

  - Claude Code: /install-skill skills/campaign-management/campaign-management.skill
  - Claude Desktop: Add the .skill file via project knowledge, or copy the SKILL.md content into your project
  instructions

  Want me to install it now in Claude Code?

✻ Worked for 2m 34s
```
{{< gen-cap "Code Snippet 11" "Claude Code Creating the Campaign Management Skill" >}}

What is really interesting in *Code Snippet 11* is that Claude Code used an existing skill, the `skill-creator`, to create our campaign management skill. This is a great example of how skills can be used to create other skills, enabling a modular approach to building out complex capabilities. The `skill-creator` provided a structured way for Claude Code to generate the necessary files and content for the campaign management skill, ensuring that it was well-organised and comprehensive.

Claude Code did not only create the `SKILL.md` file with detailed instructions on the campaign lifecycle, SQL queries, and segmentation patterns but also generated a `references/schema.md` file that provides complete table definitions for all the new campaign-related tables. This means that when you install this skill in Claude Desktop, you'll have immediate access to both the workflow guidance and the technical reference, making it much easier to execute campaign-related tasks without needing to remember specific table structures or query syntax.

### Installing the Skill

The instructions you see in *Code Snippet 11* for installing a skill are incorrect. 

> **NOTE:** I don't know why the install instructions are wrong. For now, I am going with the instructions from Anthropics official documentation.

Here's how to install the skill in Claude Code and Claude Desktop.

#### Claude Code

For Claude Code, a skill lives in a folder with the skill name located in the `skills` folder underneath `.claude` in either the project directory or the user home directory. You can have multiple skills, organised in subfolders. Each skill is a folder that contains a `SKILL.md` file with instructions, and optionally other files (such as our `references/schema.md`). I installed the campaign management skill in my user directory:

{{< imgfig2 "/images/posts/claude-code-11-4.png" "Figure 4: " "Campaign Management Skill Installed in Claude Code" >}}

You see in *Figure 4*, how the campaign management skill is installed at `~/.claude/skills/campaign-management`. In Claude Code, to see what skills you have installed, you execute the command `/skills`:

{{< imgfig2 "/images/posts/claude-code-11-5.png" "Figure 5: " "Listing Installed Skills in Claude Code" >}}

Outlined in yellow in *Figure 5* is me running the `/skills` command in Claude Code. You see the output outlined in red, which shows that the campaign management skill is installed and ready to use.

> **NOTE:** There was no real reason for me to install the campaign management skill in Claude Code, as I am mainly interested in using it in Claude Desktop, but I wanted to test the installation process in both environments. I also wanted to have it available in Claude Code for any future testing or development I might want to do there.

Let us now go to Claude Desktop to see how to install the same skill there.

#### Claude Desktop

To use skills in Claude Desktop, you:

1. Make a `.zip` file of the skill folder (the one that contains the SKILL.md and any other files)
1. Navigate to **Settings** -> **Capabilities**
1. Ensure that **Code execution** and **file creation** is enabled.
1. Scroll to the **Skills** section

In the **Skills** section, you click the **+ Add** button:

{{< imgfig2 "/images/posts/claude-code-11-6.png" "Figure 6: " "Adding a Skill in Claude Desktop" >}}

Having clicked the **+ Add** button, you see the **New skill** dialogue, as in *Figure 6*, with three options: 

* **Create with Claude** 
* **Write skill instructions**
* **Upload a skill**. 

You select **Upload a skill**:

{{< imgfig2 "/images/posts/claude-code-11-8.png" "Figure 7: " "Uploading a Skill in Claude Desktop" >}}

What is left to do is to drag and drop the `.zip` file of your skill into the **Upload skill** dialogue. Having done that, you should see the skill in your list of skills:

{{< imgfig2 "/images/posts/claude-code-11-7.png" "Figure 8: " "Campaign Management Skill Installed in Claude Desktop" >}}

As shown in *Figure 8*, the campaign management skill is now installed in Claude Desktop, and you can start to use it in your conversations.

---

## First Campaign and Campaign Communications

In the previous post in this series ([Part10][part10]), we sent a single email to a single person. Let us now take that a step further and send a real campaign to multiple recipients, with full tracking. But before we do that, let's ask: can we even do this? Can we orchestrate a multi-step workflow that involves multiple database interactions, API calls, and conditional logic, all through natural language prompts in Claude Desktop? It is a valid question, as the complexity of the campaign flow is significantly greater than that of sending a single email. This is a multi-step workflow involving *two* MCP servers:

1. **Create a campaign record** in the database (Postgres MCP)
1. **Query recipients** from the database (Postgres MCP)
1. **Read `templates.json`** to find the template and its parameter mappings
1. **Resolve template parameters** from the database for each recipient (Postgres MCP)
1. **Send the emails** via Brevo (Brevo MCP)
1. **Record individual sends** in `campaign_sends` (Postgres MCP)
1. **Update campaign status** to 'completed' (Postgres MCP)

That's seven steps bouncing between two MCP servers, with Claude as the orchestrator. No custom code. No middleware. No job queue. Just Claude following a logical sequence based on our instructions and the data model.

So, can we do it? Let us see!

### Campaign Creation and First Send

At the moment, we have mostly "mock" data in the database, even though the speaker data is from "real" speakers from past events. I asked Claude Desktop to retrieve the speakers and the events they spoke at. The result was that we had 16 speakers who spoke at the November 2024 event, "Data & AI Community Day Durban - November 2024". These are the speakers we will target with our first campaign, which is a CFP Invitation for the March 2026 event.

> **NOTE:** Since the speakers are "real" speakers from past events, they have real names and email addresses. Since this will be a test, I have changed all email addresses to those at the `aimldatadurban.org` domain, so that any emails sent during testing will come to that domain, not to the actual speakers. This is an important step to avoid sending test emails to real people.

Since I am feeling lucky, I want to see if we can do it all in one natural language conversation in Claude Desktop, leveraging the new campaign management skill for guidance:

```
Can we create a Call for Speakers campaign for the March 2026 event, and send the CFP invitation email, using template 49, to all speakers from the November 2024 event who haven't received it yet?
```
{{< gen-cap "Code Snippet 12" "Prompting Claude Desktop to Create and Send a Campaign in One Go" >}}

Claude Desktop went to work:

{{< imgfig2 "/images/posts/claude-code-11-9.png" "Figure 9: " "Claude Desktop Orchestrating Campaign Creation" >}}

*Figure 9* shows Claude Desktop working through the prompt. The colur highlights show what is happening at each stage: yellow for loading the campaign management skill and querying the database for event details and speakers, blue for figuring out that it needs some parameters, and red for prompting me for the missing parameters that are needed to send the campaign email using template 49. 

I answered the parameter questions, and Claude Desktop continued:

{{< imgfig2 "/images/posts/claude-code-11-10.png" "Figure 10: " "Claude Desktop Prompting for Missing Parameters and Sending" >}}

I thought I had answered all parameter questions, but, as highlighted in yellow in *Figure 10*, I apparently forgot the CfP deadline, which is a required parameter for template 49. Claude Desktop correctly identified that the parameter was missing. Still, instead of asking me again, it remembered the CfP deadline for that particular event from a previous run. Thank you, Claude Desktop, for remembering! 

Claude Desktop then orchestrated the rest of the campaign send: 

- creating the campaign record (outlined in blue)
- creating the communication record, mapping this email send to the campaign (outlined in yellow) 
- resolving the parameters for each recipient and sending the email (outlined in green)
- logging the sends in `communication_recipients` (outlined in red)

It finally returned a list with all the recipients. I have cut out most of the recipients for brevity and anonymity. If you remember, I updated all email addresses to point to `aimldatadurban.org`, so all the email addresses in the list end with that domain. So, if everything worked correctly, I should now have 16 emails in my inbox (one for each speaker):

{{< imgfig2 "/images/posts/claude-code-11-11.png" "Figure 11: " "The Result of the Campaign Send in the Inbox" >}}

Yay! We have emails in the inbox! Each email is personalised with the speaker's name and the correct event parameters. This means that Claude Desktop successfully orchestrated the entire campaign send, from creating the campaign record to mapping the communication to the campaign to sending the emails with the correct parameters to logging the sends in the database. All of this was done through natural-language prompts and guidance from the campaign management skill, without me needing to write any SQL or code. This is the power of AI-native development: building systems that can execute complex workflows through natural language interaction, leveraging AI's ability to understand and manipulate data without requiring the user to have technical expertise. Yay indeed!

### Fly in the Ointment

What Claude Desktop did, on the first try, is almost too good to be true. Looking more closely at the details, there are some areas for improvement. For example, Claude Desktop did not list the recipients before sending and did not ask for confirmation. This is a step that I expected, given that we had a similar confirmation step in Part 10 when sending a single email. With a campaign send, the stakes are higher, so having a confirmation step before sending is even more important.

Another issue becomes clear when you zoom into Step 3 of the campaign as in *Figure 10*, where the emails are being sent via Brevo:

{{< imgfig2 "/images/posts/claude-code-11-12.png" "Figure 12: " "Step 3: Send the emails via Brevo" >}}

Looking at *Figure 12*, you see how the emails were sent one by one and how the Brevo MCP tool was called 16 times (highlighted in yellow), once for each recipient. This is not ideal, as it is inefficient and could lead to rate-limiting issues with Brevo. Instead, it would be better if Claude Desktop used Brevo's batch email sending capability. This would be more efficient and would also ensure that all emails are sent at the same time, which is important for a campaign.

The above issues are not deal breakers, and the fact that we got this far with a single prompt is still very impressive. The issues are not with Claude Desktop's capabilities, but rather with the instructions in the campaign management skill. With some tweaks to the instructions to include a confirmation step and to use batch sending for Brevo, we could easily address these issues and make the campaign send process even smoother.

Let's tweak the campaign management skill to include these improvements and then test it again to see if it works as expected.

#### Tweaking the Campaign Management Skill

To hopefully address the issues identified above, I went back to the campaign management skill and made some tweaks to the instructions:

- I added a step before sending the emails to list the recipients and ask for confirmation. 
- I also updated the instructions for sending emails to use Brevo's batch sending capability instead of sending emails one by one.

After making the tweaks, I reinstalled the updated skill in both Claude Code and Claude Desktop, then ran the same prompt again to see if the improvements were applied correctly.

### Testing the Changes

I created a new event: "New Test Event". I then ran the same prompt as before, targeting the "New Test Event" instead of the March 2026 event. The send happened as before, but Claude Desktop neither asked for confirmation nor sent the emails in batches. The tweaks to the campaign management skill did not have the intended effect. What to do?

#### Debugging the Issues

I went back to the campaign management skill and reviewed the instructions to see if there were any issues with how I had written the new steps. I could not see anything wrong, so I asked Claude Code:

```
You created a skill for me to create and send campaigns "campaign-management". It works, but when I send emails, it does not ask for confirmation before the send, and it does not send emails in batch. I tried to edit the skill and include those steps, but it doesn't help. Can you please see what is wrong.
```
{{< gen-cap "Code Snippet 13" "Asking Claude Code to Debug the Campaign Management Skill" >}}

Notice how I, in *Code Snippet 13*, implied that Claude Code didn't create the skill properly (I am sneaky that way), and asked it to debug the issues with the skill. Claude Code's response was as follows:

```
● Let me read the current state of the skill to see what you've changed.

[● Read 1 file (ctrl+o to expand)]

● I see the problem. Step 2 jumps straight into INSERT statements without any instruction to pause for confirmation or
  batch the sends. The skill reads like a pure database recording guide - it never tells Claude to stop and ask the user
   before sending, or to send in batches via Brevo. Let me fix it.

● Update(skills\campaign-management\campaign-management\SKILL.md)
  
  [snipped for brevity]

● Now update the Key Rules section to reinforce the confirmation requirement:

● Update(skills\campaign-management\campaign-management\SKILL.md)
  
[snipped for brevity]

● The skill is updated and repackaged. Here's what was wrong and what I fixed:

  The Problem

  The original Step 2 was just four SQL INSERT/UPDATE statements in sequence. There was nothing telling Claude to stop
  and ask the user before executing, and no mention of batch sending. Claude treated it as "run these queries" rather
  than a conversational workflow with a gate.

  What Changed

  Step 2 now has 7 explicit sub-steps (a-g):
  - (a) Query the segment and show a full preview (names, emails, count)
  - (b) STOP and ask for explicit confirmation - with exact wording provided
  - (c) Create the communication record
  - (d) Send in batches of 50 via Brevo, with progress reporting between batches
  - (e-f) Update counts and campaign status
  - (g) Show a completion summary

  Key Rules updated:
  - Rule #1 is now MANDATORY CONFIRMATION in bold, stated as the most important rule
  - Rule #2 is batch sending (batches of 50, 300/day limit)
```
{{< gen-cap "Code Snippet 14" "Claude Code Debugging and Fixing the Campaign Management Skill" >}}

In *Code Snippet 14*, we see how Claude Code identified the issue with the original instructions in the campaign management skill: no explicit steps were telling Claude to ask for confirmation before sending the emails, nor any instructions to use batch sending with Brevo. It treated the instructions as a set of queries to run rather than a conversational workflow with a gate.

I updated the skill in Claude Desktop and tested again. This time, when I ran the same prompt to create and send a campaign, Claude Desktop correctly listed the recipients and asked for confirmation before sending. It also sent the emails in batches via Brevo. The improvements were successfully applied, and the campaign send process is now smoother and more efficient. This shows how we can iteratively improve our skills and instructions based on testing and feedback, and how Claude Code can assist in debugging and refining our skills to ensure they work as intended.

### Verifying the Campaign

Once the above was done, I wanted to verify the tracking data. In Claude Desktop:

```
Show me the status of the CFP Invitation campaign. How many emails were sent? List the recipients.
```
{{< gen-cap "Code Snippet 15" "Checking Campaign Status in Claude Desktop" >}}

The result was:

{{< imgfig2 "/images/posts/claude-code-11-13.png" "Figure 13: " "Claude Desktop Showing Campaign Status and Recipients" >}}

In *Figure 13*, Claude Desktop queries the `campaigns`, `communications`, `communication_recipients`, and `contacts` tables and presents a clean summary: the campaign name, status, total recipients, and a list of who received the email. This is the tracking visibility we set out to build.

---

## Querying Campaign History

One of the key benefits of campaign tracking is being able to answer questions about communication history. Now that we have data in the tracking tables, let's see what kind of queries Claude Desktop can handle. Let's start with a campaign-centric query:

{{< imgfig2 "/images/posts/claude-code-11-14.png" "Figure 14: " "Claude Desktop Showing Campaign History" >}}

And the inverse, querying by contact:

{{< imgfig2 "/images/posts/claude-code-11-15.png" "Figure 15: " "Claude Desktop Showing Contact Communication History" >}}

These queries in *Figure 14* and *Figure 15* are exactly the kind of questions that were impossible before this post. "Has this person been contacted?" is a fundamental event management question, and now it's a natural language query.

---

## What We've Accomplished

Let's step back and look at what we built in this post:

**Schema:**

- Designed `campaigns`, `communications`, `communication_recipients`, `marketing_assets` and `asset_distributions` tables conversationally with Claude Code
- Created and executed migration 003 via MCP
- Database now has 14 tables (up from 10)
- Structural duplicate prevention via `UNIQUE(campaign_id, contact_id)` constraint

**Email Sending:**

- Sent our first multi-recipient campaign with personalised emails
- Claude orchestrates between Postgres MCP and Brevo MCP across 7 steps
- Each recipient gets personalised parameters resolved from the database

**Campaign Tracking:**

- Full audit trail: who received what, when, with what Brevo message ID
- Campaign-aware queries: "Who hasn't received this yet?"
- Communication history per contact: "What has this person received?"

**Guardrails:**

- Confirmation prompt before all bulk sends

---

## ~ Finally

Part 10 gave our system a voice; it could speak. Part 11 gave it a memory; it remembers who it has spoken to.

That distinction matters more than you think. A system that can send emails is useful. A system that *knows who has already received what* is reliable. In event management, the distinction between "useful" and "reliable" is between accidentally spamming your speakers and running a professional operation.

**The key insight from this post:** The `UNIQUE(campaign_id, contact_id)` constraint is deceptively simple but architecturally powerful. It's a *structural* guarantee that duplicates cannot happen, regardless of whether Claude's logic has a bug. This is a principle worth generalising: design your schema to enforce business rules, not just store data. Let the database be the last line of defence.

**The orchestration pattern** is worth calling out. Claude coordinating between two MCP servers, Postgres and Brevo, across seven steps (query, create, resolve, send, record, update, confirm) is the most complex multi-MCP workflow we've built in this series. No custom middleware, no job queue, no workflow engine. Just Claude following a logical sequence. That's the AI-native architecture from Part 3 delivering on its promise.

**What didn't we cover?** Saved segments (reusable audience definitions like "all speakers from 2024 who haven't registered for 2026"), engagement tracking (open and click rates from Brevo webhooks), and AI-generated marketing content. These are the intelligence layer that sits on top of today's infrastructure.

### What Comes Next

In Part 12, we'll build the segmentation and marketing intelligence layer:

- Saved segments with natural language definitions
- Dynamic audience queries ("speakers who attended in 2024 but haven't registered for 2025")
- AI-assisted email content generation
- Campaign sequence planning

The question shifts from "Can we send emails?" (Part 10) and "Do we know who received what?" (Part 11) to "**Who *should* we email, and what should we say?**"

### Questions or thoughts?

- Ping me: [niels.it.berglund@gmail.com][ma]
- Follow on LinkedIn: [linkedin.com/in/nielsberglund][nblin]

**Found this helpful?** Share it with your network! Campaign tracking is a common need for any communications system, and the conversational approach shown here is reusable far beyond event management.

See you in Part 12, where we add segmentation and marketing intelligence!

---

**Series Navigation:**

- [✅ Part 1: Installation & Initialisation][part1]
- [✅ Part 2: IDE Integration][part2]
- [✅ Part 3: Architecture Planning][part3]
- [✅ Part 4: Database Infrastructure][part4]
- [✅ Part 5: Schema & Conversations][part5]
- [✅ Part 5.5: Schema Refinement][part55]
- [✅ Part 6: Import MCP Server Design][part6]
- [✅ Part 7: Import MCP Server Foundation][part7]
- [✅ Part 8: Implementing Import Functions][part8]
- [✅ Part 9: Autonomous Implementation][part9]
- [✅ Part 10: Email Infrastructure][part10]
- ✅ Part 11: Campaign Tracking & Batch Sending (this post)
- 🚀 Part 12: Segmentation & Marketing Intelligence (coming soon)

---

[ma]: mailto:niels.it.berglund@gmail.com

[nblin]: https://www.linkedin.com/in/nielsberglund/
[dataai]: https://aimldatadurban.org/

[part1]: {{< relref "2025-07-29-building-an-event-management-system-with-claude-code-claude-code-installation-and-initialisation.md" >}}
[part2]: {{< relref "2025-08-13-building-an-event-management-system-with-claude-code-part-2---ide-integration-and-advanced-features.md" >}}
[part3]: {{< relref "2025-12-28-building-an-event-management-system-with-claude-code-part-3---architecting-an-ai-native-system.md" >}}
[part4]: {{< relref "2026-01-01-building-an-event-management-system-with-claude-code-part-4---database-setup-and-first-conversations.md" >}}
[part5]: {{< relref "2026-01-04-building-an-event-management-system-with-claude-code-part-5---database-schema-and-natural-language-queries.md" >}}
[part55]: {{< relref "2026-01-12-building-an-event-management-system-with-claude-code-part-55---schema-refinement-when-real-data-reveals-the-truth.md" >}}
[part6]: {{< relref "2026-01-14-building-an-event-management-system-with-claude-code-part-6---architecture-and-design-of-a-custom-import-mcp-server.md" >}}
[part7]: {{< relref "2026-01-18-building-an-event-management-system-with-claude-code-part-7---implementing-the-import-mcp-server.md" >}}
[part8]: {{< relref "2026-01-24-building-an-event-management-system-with-claude-code-part-8---implementing-import-functions.md" >}}
[part9]: {{< relref "2026-01-29-building-an-event-management-system-with-claude-code-part-9---autonomous-implementation-letting-claude-code-loose.md" >}}
[part10]: {{< relref "2026-02-14-building-an-event-management-system-with-claude-code-part-10---email-infrastructure-with-brevo-mcp.md" >}}

[1]: https://gist.github.com/nielsberglund/PLACEHOLDER_CAMPAIGN_SCHEMA_GIST
[2]: https://medium.com/@joe.njenga/i-found-this-claude-code-statusline-that-makes-my-terminal-magically-beautiful-2413fa8effe7?sk=v2%2Ff53c7d89-123b-4db4-9f61-dc704e0df42d
[3]: https://gist.github.com/nielsberglund/9dbf155221bf6d70f7aaf5da4751ea57

<!--
  post reference
  [pkg1]: {{< relref "" >}}
-->  

<!--
  {{< sub-title "<sub-title>" >}}
  {{< gen-cap "<code snippet/Table, etc>" "Title" >}}
  {{< imgfig2 "<image-path /images/posts/image.ext" "Fig Num: " "Caption" >}}
  {{< callout tip >}}
  {{< /callout >}}
-->

