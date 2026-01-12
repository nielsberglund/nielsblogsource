---
type: post
layout: "post"
title: "Building an Event Management System with Claude Code: Part 6 - Building a Custom Import MCP Server"
author: nielsb
date: 2026-01-30T15:30:52+02:00
comments: true
highlight: true
draft: true
image: "/images/banner/posts/<file_name_incl_ext>"
thumbnail: "/images/thumbnails/posts/<file_name_incl_ext>"
categories:
  - Claude-Code
  - AI-Coding 
tags:
  - Generative AI
  - Claude Code
  - Anthropic
  - AI-assisted Coding
  - PostgreSQL
  - MCP Server
  - AI-Native Development
  - FastMCP
description: 
---

Welcome back to the **Building an Event Management System with Claude Code** series! If you've been following along, you know we've made significant progress: we've installed Claude Code, integrated it with our IDE, designed an AI-native architecture, set up our cloud database, and created a complete schema with natural language query capabilities.

* **To see all posts in the series, go to: [Building an Event Management System with Claude Code](/contact-event-claude-code).**

In Part 5, we accomplished something remarkable, we designed and populated our entire database schema conversationally, and verified we could query it naturally through Claude Desktop. We have contacts, events, tickets, speaker sessions, and ratings all properly structured and queryable with natural language.

But there's a problem: our database only has test data.

<!--more-->

---

## The Real-World Data Challenge

For real events, data comes from external platforms:

- **Quicket** (our ticketing platform): Registration CSVs with 400+ registrations and 200+ attendees per event
- **Sessionize** (speaker management): Speaker and session CSVs with 20-30 speakers
- **Microsoft Forms** (feedback): Rating CSVs with session titles that never quite match

I've been manually wrangling these imports for years. Every **Data & AI Community Day Durban** event, the process looks like this:

1. Download CSV from Quicket
1. Open it in Excel, fix formatting issues
1. Remove columns I don't need
1. Save the cleaned file
1. Upload to Brevo (my contact email marketing tool)
1. Only 60 - 70% of contacts import correctly due to duplicates, missing fields, etc.
1. Update my spreadsheet with "Imported 187 registrations on March 8, 2025"

**Time per event: 2-3 hours across multiple imports**  
**Stress level: High** (What if I mess up Brevo before the event?)  
**Accessibility: Only me** (my co-organizers can't do imports)

Remember the first time you spent three hours trying to handle CSV edge cases, duplicate emails, missing fields, mismatched names, only to have the export format change the next month? That's been my reality.

> **NOTE:** To be fair, this is a common pain point in contact/event management systems. Many platforms offer CSV exports, but the data quality and formatting can vary widely. Manual imports are error-prone and time-consuming, especially when dealing with large datasets.

Today, we're building something different.

---

## What We'll Accomplish Today

By the end of this post, the import workflow will look like this:

```
Event Organiser in Claude Desktop:
"Import the Quicket registrations from last night's event"
[attaches CSV file]

Claude Desktop: 
"Found 47 new registrations for Data & AI Day - March 2025.
3 people are returning attendees from 2024.
2 duplicate emails detected (same person, multiple tickets).

Import preview:
✅ 45 new contacts
✅ 47 tickets created  
✅ 2 existing contacts updated
✅ Linked to 'Data & AI Community Day Durban - March 2025'

Proceed with import?"

Event Organiser: "Yes"

Claude Desktop:
"✅ Import complete in 3.2 seconds.
Notable: 12 registrations in the past 24 hours—momentum is building!"
```
{{< gen-cap "Code Snippet 1:" "Custom MCP Import Workflow" >}}

**No scripts. No command line. No "let me check if that worked." Just conversation.**

Here's what we're building today:

- ✅ **Custom MCP Server** - Domain-specific import tools using FastMCP
- ✅ **Hybrid Architecture** - Leveraging csv-mcp-server + Postgres MCP Pro + custom logic
- ✅ **Four Import Sources** - Quicket registrations, check-ins, Sessionize speakers, feedback ratings
- ✅ **Fuzzy Matching** - Intelligent session title matching for ratings import
- ✅ **Preview Workflow** - See what will happen before committing data
- ✅ **Production Ready** - Configure for Claude Desktop (end-user interface)
- ✅ **Real-World Testing** - Verify with realistic data and edge cases
---

## The Paradigm Shift: Dual-Interface Architecture

But here's the key insight: **someone has to build the system that makes this conversation possible.**

That's what we're doing today: building a custom MCP server that understands our event data sources and makes imports conversational. And we're building it conversationally with Claude Code.

This demonstrates the full power of AI-native development:

**Claude Code** (developer tool):  
→ Developers build the custom MCP server through conversation  
→ Design tool signatures, implement logic, handle edge cases  
→ Test and refine through dialogue

**Claude Desktop** (production interface):  
→ Event organizers use the MCP server through conversation  
→ No code, no command line, works on any device  
→ Natural language requests with instant results

Both interfaces are conversational, but serve different audiences. **This is the architecture of the future.**

> **NOTE:** Above, I mention Claude Desktop as the end-user interface. This could also be a web app, mobile app, or any interface that connects to the MCP server via LLMs/AI -Agents. The key is that the MCP server handles the complex logic, while the front-end provides a simple conversational experience.

Let's build something real.

---

## Recap: Where We Left Off in Part 5

Before we start building, let's quickly review what we have in place:

**Infrastructure (Parts 1-4):**
- ✅ Claude Code installed and integrated with VSCode
- ✅ PostgreSQL database on Neon (cloud-hosted, production-ready)
- ✅ Postgres MCP Pro installed and working
- ✅ Project structure with Git version control
- ✅ Complete development conversation history

**Database (Part 5):**
- ✅ Complete schema designed conversationally
  - contacts (unified person records)
  - events (event definitions)
  - tickets (registration records)
  - speaker_sessions (who spoke about what)
  - speaker_ratings (feedback on sessions)
  - contact_roles (attendee/speaker/organiser)
- ✅ 60 test contacts, 10 events, 118 tickets, 90 sessions
- ✅ Natural language queries working through Claude Desktop

**The Gap We Need to Fill:**

Right now, our test data was created artificially by Claude Code. But for real events data comes from (also mentioned above):

1. **Quicket** (ticketing platform) → Registration and check-in CSVs
2. **Sessionize** (speaker management) → Speaker and session CSVs
3. **Microsoft Forms** (feedback) → Speaker rating CSVs with fuzzy session titles
4. **Microsoft Forms** (check-in) → Check-in CSVs for walk-ins

We need infrastructure to import real data from these sources. And critically, we want **event organisers** (not just developers) to be able to do imports through simple conversation in Claude Desktop.

That means building a custom MCP server.

## Understanding the Import Challenge

Before we start building, let me show you what we're dealing with. These are actual export formats from the platforms we use (anonymised).

### Quicket Registration Export (CSV)

A typical Quicket export looks like this:

{{< imgfig2 "/images/posts/claude-code-6-1-1.png" "Figure 1:" "Sample Quicket Registration Export CSV" >}}

In *Figure 1*, you see some of the key fields the file contains (there are 30+ columns).

> **NOTE:** Looking at the file now, I realise that I (Claude Code) need to add more columns to the `tickets` table to capture data I may require: `Link Campaign`, `Profession`, and `Area of Interest`, to mention a few. This is a good example of how building the MCP server may reveal gaps in the schema that we need to address. Oh, the file layout you see in *Figure 1* is a real export from Quicket, but I have modified the data for privacy.

**Challenges:**

* One physical person can "order" multiple tickets (e.g. family/friends); you see examples of that outlined in yellow and blue.
  * If we don't have this person as a contact yet, we need to create a new contact record.
  * However, in the case of duplicates where the name is different (blue), but the same email address. In this case, we need to add a second contact (unless it exists already). This could be a spouse or a friend using the same email address.
  * Regardless of whether it's one or multiple contacts, we need to create a ticket record for each ticket purchased, linked to the correct contact.
* Large number of columns we don't need.

### Quicket Check-in Export (CSV)

The Quicket check-in export looks like this:

{{< imgfig2 "/images/posts/claude-code-6-2-1.png" "Figure 2:" "Sample Quicket Check-in Export CSV" >}}

You can see in *Figure 2* that this file is identical to the registration file, but it shows a `Yes` in the `Checked In` column for those who attended.

The check-in is pretty straightforward: we need to match the ticket number to the ticket record, and update the `checked_in` field to true. The one thing to be aware of is that some tickets in the check-in export might not yet be in our database (an edge case: late registration). i.e., we need to create a new contact and ticket record if the ticket number is not found.

### Microsoft Forms Walk-Ins Export (CSV)

There are always walk-ins at the events (i.e. not registered on Quicket). For these, we use a simple Microsoft Forms survey to capture their details. The export looks like this:

{{< imgfig2 "/images/posts/claude-code-6-5.png" "Figure 3:" "Sample Microsoft Forms Walk-Ins Export CSV" >}}

**Challenges:**

* Since these attendees have not registered on Quicket (at least for this event), we do not have a ticket number for them (fortunately, the `tickets` table defaults to `-1`).
  * We need to create a new contact record for each walk-in, if they are not already in our contacts.
  * We also need to create a new ticket record, linked to the contact, with the `checked_in` field set to true.
  * We need to link the ticket to the correct event.

### Sessionize Speaker Export (CSV)

The Sessionize speaker export looks like this:

{{< imgfig2 "/images/posts/claude-code-6-3-1.png" "Figure 4:" "Sample Sessionize Speaker Export CSV" >}}

**Challenges:**

* Each speaker may have multiple sessions (see green highlight).
  * Need to deduplicate speakers while creating multiple session records
* Some speakers may already exist in our contacts (need to match by email )
* Sessions may have multiple speakers, which you can see is outlined in red and blue. We need to link the session to multiple contacts.
  * This becomes a challenge for speaker ratings.

### Microsoft Forms Speaker Ratings Export (CSV)

The speaker evaluations come from an "in-house" Microsoft Forms survey. The export looks like this:

{{< imgfig2 "/images/posts/claude-code-6-4.png" "Figure 5:" "Sample Microsoft Forms Speaker Ratings Export CSV" >}}

**Challenges:**

* There is only one set of ratings for a session, even if there are multiple speakers. You see that outlined in red in *Figure 5*. We need to link the rating to all speakers for that session.

### The Need for a Custom MCP Server

Given the above data sources, all CSV files, you may question the need for a custom MCP server.

**Why can't we use existing MCP servers:**
- `csv-mcp-server`: Excellent for validation and quality checks, but doesn't understand our specific formats or our database schema
- `Postgres MCP Pro`: Perfect for database operations, but can't parse these domain-specific exports

**What we need:**

A custom MCP server that bridges the gap and uses existing tools where possible, adds custom logic for domain-specific needs. All three sources (Quicket, Sessionize, Microsoft Forms) export CSV/Excel formats, but each has unique column structures, data relationships, quality issues, and business rules.

## A Learning Moment: Schema Design Should Start With Real Data

Looking at these actual CSV exports now, I realise I made a mistake in Part 5. When we designed the database schema, I told Claude Code what fields I thought we needed based on my mental model of the data. But **I should have started by uploading these actual CSV files to Claude Code and asking it to propose the schema.**

Why does this matter? Because real data reveals requirements that mental models miss. Looking at the Quicket export, I see `Link Campaign` (which I didn't account for in my original schema design), `Profession`, and `Area of Interest`, and the `NULL` ticket numbers for walk-ins (which I handled, but only because I've dealt with this specific edge case before). What else have I missed that Claude Code might have picked up? If I'd shown Claude Code these actual files first and said, "Design a schema that handles importing this data efficiently," it would have caught these nuances immediately. This is a key principle of AI-native development: **show the AI your real-world data and constraints first, then let it propose solutions.** You get better designs faster because the AI sees patterns and edge cases you might overlook. For this series, I'm continuing with the schema we built in Part 5 (it works fine). Still, I wanted to acknowledge this learning moment. In your own projects, start with real data samples when designing with Claude Code; you'll get better results.

---

## The Architecture: Hybrid MCP Approach

Based on our research in Part 3, we decided on a hybrid approach following the 80/20 principle:

{{< imgfig2 "/images/posts/claude-code-6-6.png" "Figure 6:" "Hybrid MCP Server Architecture" >}}

**Why this approach:**
1. **Leverage existing tools**: Don't rebuild validation/quality checks
2. **Custom where needed**: Domain-specific parsing for Quicket/Sessionize
3. **Composability**: MCP servers can call other MCP servers
4. **Maintainability**: Small custom codebase (~500 lines vs 2000+)

> **NOTE:** You see in *Figure 6* how there is one more tool in the custom MCP server: `import_walk-ins`, than initially planned. The requirement became clear when examining the various CSV files.

We can now finally do some code, or rather, have Claude Code do the code.

---

## Starting the Conversation with Claude Code

As before, I opened Claude Code with the `--continue` flag in the project directory. The `--continue` flag picks up where we left off in Part 5, preserving all context about our database schema and architecture decisions.

### Initial Design Discussion

I started with a high-level design conversation:

```
We need to build a custom MCP server for importing event data from real sources.

Based on the architecture in CLAUDE.md and plan.md, we need to handle:

1. Quicket registrations (CSV) - ticket number, attendee details, purchaser info, duplicates
2. Quicket check-ins (CSV) - updates attendance status for existing tickets
3. Microsoft Forms walk-ins (CSV) - new contacts/tickets without ticket numbers
4. Sessionize speakers/sessions (CSV) - speaker profiles, one row per session with speaker duplication
5. Speaker ratings (CSV/Excel) - feedback forms with fuzzy session title matching

The server should:
- Use csv-mcp-server for validation and quality checks
- Use Postgres MCP Pro for database insertion
- Provide 7 main tools: import for each source + validate + preview

Think carefully about:
- What parameters each tool needs (required vs optional)
- How to handle errors gracefully (bad data, duplicates, missing fields)
- Preview/dry-run capabilities (show what WOULD happen without committing)
- Return value structures (what information is useful to the caller?)
- Duplicate detection strategies (email-based matching)

Don't write any code yet, just design the tool signatures and explain your reasoning. 

Use the "think" approach to reason through the design.
```
{{< gen-cap "Code Snippet 2:" "Initial Design Prompt to Claude Code" >}}

You see in *Code Snippet 2* how I outlined the requirements and constraints for the custom MCP server. I asked Claude Code to think through the design before jumping into code.

{{< callout tip >}}
Notice I'm using "Think carefully" to trigger Claude Code's extended reasoning mode. This encourages deeper analysis before jumping to implementation.
{{< /callout >}}

Claude Code went off and thought through the design. After a few minutes, it came back with proposed tool signatures for all seven functions, parameter lists with types and defaults, return value structures, and a detailed explanation of its design choices.

I reviewed the proposal. The core design was solid, but I wanted to refine a few things.




---

## ~ Finally

That's all for now. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me if you have any suggestions. Your input is highly valued and can help shape the direction of our discussions. If you found this post helpful, please consider sharing it with your network. Follow me on [LinkedIn][nblin] for more updates on this project and other AI-related topics.

[ma]: mailto:niels.it.berglund@gmail.com

[nblin]: https://www.linkedin.com/in/nielsberglund/
[dataai]: https://aimldatadurban.org/

[part1]: {{< relref "2025-07-29-building-an-event-management-system-with-claude-code-claude-code-installation-and-initialisation.md" >}}
[part2]: {{< relref "2025-08-13-building-an-event-management-system-with-claude-code-part-2---ide-integration-and-advanced-features.md" >}}
[part3]: {{< relref "2025-12-28-building-an-event-management-system-with-claude-code-part-3---architecting-an-ai-native-system.md" >}}
[part4]: {{< relref "2026-01-01-building-an-event-management-system-with-claude-code-part-4---database-setup-and-first-conversations.md" >}}
[part5]: {{< relref "2026-01-04-building-an-event-management-system-with-claude-code-part-5---database-schema-and-natural-language-queries.md" >}}


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

