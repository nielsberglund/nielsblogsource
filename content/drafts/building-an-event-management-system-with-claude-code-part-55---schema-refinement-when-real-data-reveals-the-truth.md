---
type: post
layout: "post"
title: "Building an Event Management System with Claude Code: Part 5.5 - Schema Refinement: When Real Data Reveals the Truth"
author: nielsb
date: 2026-01-10T08:31:59+02:00
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
description: 
---

Welcome to an unplanned post in the **Building an Event Management System with Claude Code** series. If you've been following along, you know we designed our database schema in Part 5, set up our infrastructure in Part 4, and we're ready to build import tools in Part 6.

* **To see all posts in the series, go to: [Building an Event Management System with Claude Code](/contact-event-claude-code).**

But there's a problem. A problem I didn't realize until I started working on Part 6.

<!--more-->

---

## The Problem: Designing from Mental Models vs Real Data

In Part 5, when we designed our database schema, I approached it the traditional way: I told Claude Code what I thought we needed based on my mental model of the system.

**What I said (sort of) to Claude Code in Part 5:**

```
We need tables for:
- contacts (people who attend or speak)
- events (our conferences)
- tickets (registration records)
- speaker_sessions (who spoke about what)
- speaker_ratings (feedback)
```
{{< gen-cap "Code Snippet 1:" "Initial Schema Design Based on Mental Models" >}}

Claude Code designed a clean, normalized schema. It looked great. We created the tables, generated test data, and everything worked perfectly with natural language queries.

**Then I started working on Part 6.**

Part 6 is about building a custom MCP server to import real data from:

- Quicket (ticketing platform, registration and check-in) - CSV exports
- Sessionize (speaker management) - CSV exports
- Microsoft Forms (walk-in check-ins, speaker feedback) - CSV exports

As I wrote the section on the actual CSV file formats, I kept noticing that many columns in the CSV files were not in the schema, and those columns could be important.

For example, the Quicket export had columns like:

* `Ticket Type`
* `Profession`
* `Area of Interest`
* `Link Campaign`

These fields could be very useful for segmentation and analysis, but they were not in our original schema. The same story with some of the other CSV files.

**I realised: I made a fundamental mistake in Part 5.**

---

## The Right Approach: Let Real Data Drive Schema Design

Here's what I should have done in Part 5:

**Instead of:**

```
Me: "We need tables for contacts, events, tickets, sessions, and ratings"
Claude Code: "Here's a schema based on your description"
```
{{< gen-cap "Code Snippet 2:" "What I Did" >}}

**I should have done:**

```
Me: "Here are the actual CSV files we'll be importing from. Design a schema that efficiently handles this real-world data."
[uploads quicket-registration.csv, sessionize-export.csv, feedback-form.csv]

Claude Code: "Based on these files, here's what you need..."
```
{{< gen-cap "Code Snippet 3:" "What I Should Have Done" >}}

**Why does this matter?**

Real data reveals requirements that mental models miss:
- Field names and types
- Relationships between entities
- Data quality issues (NULLs, formats)
- Hidden complexity (order numbers, purchaser vs attendee)
- Actual cardinality (one-to-many relationships)

This is a **core principle of AI-native development**: show the AI your real-world constraints first, then let it propose solutions. You get better designs faster because the AI sees patterns and edge cases you might overlook.

So let's do it right now. Let's iterate.

---

## Starting the Conversation with Claude Code

I re-engaged with Claude Code, and I needed Claude Code to analyze the actual CSV files and recommend schema changes.

### Prompt 1: Upload Real Data and Ask for Analysis

I started with setting the scene:

```
I think that when we created the database schema and tables a couple of days ago, I went about it in the wrong way. Instead of describing what was needed I should have uploaded the inividual csv/excel files to you - and you would thin about what columns etc., from the files would be needed, taking into account what we need for contacts but alos for analysis.
```
{{< gen-cap "Code Snippet 4:" "Prompt to Claude Code for Schema Reevaluation" >}}

Remember, this was after I alsready had started with the import tools in Part 6, so I thought I should make sure that Claude Code understood the context.

Claude Code's response:

```
You're absolutely right - that's excellent data-driven thinking! Looking at the actual CSV/Excel files would have given us:

  1. Exact column names - not our guessed "ticket_number", "first_name", etc.
  2. Real data formats - date formats, phone number patterns, how names are structured
  3. Hidden valuable fields - columns we didn't think about that could be useful for analysis
  4. Data quality issues - empty fields, inconsistencies, how duplicates actually appear
  5. Structural quirks - multiple sheets in Excel, header rows, footer notes, etc.

  This would have ensured our schema perfectly matches reality instead of our assumptions.

  Good news: We can still do this! We have a few options:

  Option 1: Review files now, adjust schema if needed

[snipped for brevity]

  Option 2: Review files, adjust import mappings only
  
[snipped for brevity]

  Option 3: Hybrid approach

[snipped for brevity]

  Would you like to upload the actual files now? I can analyze:
  - Quicket registration export (CSV)
  - Quicket check-in export (CSV)
  - Microsoft Forms walk-in export (CSV)
  - Sessionize export (CSV/Excel)
  - Speaker rating forms (CSV/Excel)

  This will give us a reality check before we build the import MCP server.
```
{{< gen-cap "Code Snippet 5:" "Claude Code's Response on Next Steps" >}}

As you see in *Code Snippet 6*, the response is positive, and Claude Code acknowledges the oversight and agrees that real data should drive schema design.

```
I prefer Option 1, but let's start with uploading files. I will upload them one by one, and I want you to THINK HARD about what columns from the various files would be useful, both to store as well as for analytical purposes. Just return the columns you think and why, and then afterwrads we will decide what to do and not to do.
```
{{< gen-cap "Code Snippet 6:" "User's Decision to Proceed with Option 1" >}}




```
● Perfect! I'm ready to analyze each file carefully. Let me set up a todo list to track this analysis process, then you can upload the first file.

● Excellent approach! I'm ready to analyze the files one by one.

  For each file, I'll:
  1. Read the entire structure - all columns, data types, sample values
  2. Think deeply about each column's value for:
    - Core contact/event management needs
    - Analytical queries (trends, patterns, insights)
    - Deduplication and data quality
    - Future reporting needs
  3. Recommend which columns to keep with detailed reasoning
  4. Flag any surprising/valuable data we might have missed in our schema design

  Go ahead and upload the first file - which one would you like to start with?
```







## ~ Finally

That's all for now. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me if you have any suggestions. Your input is highly valued and can help shape the direction of our discussions. If you found this post helpful, please consider sharing it with your network. Follow me on [LinkedIn][nblin] for more updates on this project and other AI-related topics.

[ma]: mailto:niels.it.berglund@gmail.com

[nblin]: https://www.linkedin.com/in/nielsberglund/
[dataai]: https://aimldatadurban.org/


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

