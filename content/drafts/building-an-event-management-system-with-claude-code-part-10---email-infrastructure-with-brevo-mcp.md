---
type: post
layout: "post"
title: "Building an Event Management System with Claude Code: Part 10 - Email Infrastructure with Brevo MCP"
author: nielsb
date: 2026-02-02T09:08:35+02:00
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
  - MCP Servers
  - AI-Native Development
  - Brevo
  - Email Marketing
description: "Part 10: Integrate Brevo MCP for transactional email sending. Set up email infrastructure, create templates, and send your first conversational emails—all without maintaining a separate contact database."
---
Welcome back to the **Building an Event Management System with Claude Code** series! In Part 9, we explored autonomous implementation with Claude Code, letting it implement three import functions with minimal intervention. We learned that autonomous and conversational approaches each have their place—and that verification is always essential.

* **To see all posts in the series, go to:** [**Building an Event Management System with Claude Code**](/contact-event-claude-code).

With the Import MCP Server complete, we've achieved the first half of our AI-native vision: **conversational data import**. Today, we tackle the second half: **conversational communication**. By the end of this post, you'll be able to ask Claude to "email all speakers from March 2025" and watch it happen.

<!--more-->

---

## What We're Building Today

By the end of this post, we'll have:

- ✅ Researched and selected the right Brevo MCP server
- ✅ Configured Brevo account (API key, verified sender)
- ✅ Installed and tested `@houtini/brevo-mcp`
- ✅ Created our first email template in Brevo's editor
- ✅ Added campaign tracking tables to PostgreSQL
- ✅ Sent our first transactional email via natural language
- ✅ Implemented batch sending with personalisation

> **NOTE:** My track record of covering what I say we'll cover is... well, you know the drill by now. Let's see how far we get!

---

## Starting the Conversation: Brevo MCP Research

You may wonder why we're doing research on the Brevo MCP Server: "... didn't we already decide to use `@houtini/brevo-mcp`?" Yes, we did. But since we decided on `@houtini/brevo-mcp` some posts ago, multiple people have approached me with suggestions for alternatives. It's always good to double-check, especially when it comes to critical infrastructure like email.

### Asking Claude Code About Our Options

Back in Part 3, we decided on Brevo for email. Now it's time to implement. But which Brevo MCP server should we use? I started Claude Code and asked:

```
Let us now start on the Brevo MCP Server implementation. In Part 3 we identified @houtini/brevo-mcp as an option. Before we proceed, I want to make sure this is still the best choice.

Research the current Brevo MCP server options and compare them. Consider:
- What tools each provides
- Setup complexity
- Whether they work with our architecture (PostgreSQL as single source of truth)
```
{{< gen-cap "Code Snippet 1" "Asking Claude Code to Research Brevo MCP Options" >}}

Claude Code went to work:

```
● Brevo MCP Server Options Comparison

  Based on my research, here are the main options:

[Claude Code listed the options and their pros and cons]

 ---
  Recommendation for Our Architecture

  Given our requirements:
  - PostgreSQL as single source of truth for contacts
  - Brevo for sending only (not contact management)
  - Transactional emails for event communications
  - Template support for consistent branding
  - Email logging in our database

  Recommended: @houtini/brevo-mcp

  Why:
  1. Focused scope - Email marketing focus matches our needs
  2. Simple setup - Single npm command, minimal config
  3. Active maintenance - Updated Dec 2025
  4. Right-sized - Has transactional email + campaigns without SMS/WhatsApp bloat
  5. Well-documented - Clear workflow for test → send

  Our workflow would be:
  1. Query contacts from PostgreSQL (via Postgres MCP Pro)
  2. Send emails via Brevo MCP (using templates)
  3. Log email activity back to PostgreSQL

  Setup complexity: Low - just need BREVO_API_KEY environment variable

  ---
  Would you like me to proceed with setting up @houtini/brevo-mcp?

```
{{< gen-cap "Code Snippet 2" "Claude Code's Brevo MCP Server Recommendation" >}}

Claude Code responded with a detailed comparison of several options, as shown in *Code Snippet 2*. It ultimately reaffirms that `@houtini/brevo-mcp` was the best fit for our needs.

### The Architecture Decision

When I looked at various Brevo MCP servers earlier, I noticed mentions of Transactional and Campaign messaging. Before choosing `@houtini/brevo-mcp`, I wanted to understand the trade-offs, so I asked Claude Code to explain the differences between the two modes and suggest the best option for our use case.

Claude Code clarified the differences, confirming that transactional messaging was indeed what we needed for our event management system. With this understanding, I wanted to know what the architecture would look like, so I asked Claude Code. 

Claude Code provided a clear architecture diagram and explanation, confirming that our approach was sound. The explanation of the architecture is published as a `gist` at: [Email Architecture - Transactional Mode][1], and the core architecture diagram is shown below:

{{< imgfig2 "/images/posts/claude-code-10-1.png" "Figure 1: " "Email Architecture - Transactional Mode" >}}

Key points of the architecture as shown in *Figure 1*:

1. PostgreSQL = Single source of truth (contacts, history)
2. Brevo = Email delivery only (templates, sending)
3. Claude = Orchestrator (queries DB, loops through recipients, sends via Brevo)
4. Confirmation = Required before bulk sends (>10 recipients)

With this confirmation, I was ready to proceed.

---

## Setting Up Brevo with Claude Code's Guidance

The question is: what do we need to set up Brevo to start sending emails?

### Setting up Brevo

The answer to the question above was (as usual) that I asked Claude Code:

```
Before I can setup and start use @houtini/brevo-mcp, can you guide me through setting up Brevo for our transactional email integration.
What do I need to configure in Brevo before we can start sending?
``` 
{{< gen-cap "Code Snippet 3" "Preparing Brevo Account for MCP Server Use" >}}

Claude Code provided a checklist:

```
● Brevo Setup Guide for Transactional Email

STEP 1: Get Your API Key
─────────────────────────
1. Log into Brevo at https://app.brevo.com
2. Navigate to: Settings → API Keys
3. Create new key or copy existing
4. Key format: xkeysib-xxxxxxxx...

⚠️  IMPORTANT: Use the STANDARD API key (starts with xkeysib-)
    NOT the "MCP API key" option (that's for Official Brevo MCP only)

STEP 2: Verify Your Sender
──────────────────────────
Brevo requires verified senders before sending. You need:
- A verified email address, OR
- A verified domain (better for deliverability)

For testing: Verified email is fine
For production: Verify your domain (dataai.community)

Navigate to: Settings → Senders & IP → Add a Sender

STEP 3: Create a Test List (Optional but Recommended)
─────────────────────────────────────────────────────
@houtini/brevo-mcp has a send_test_email tool that sends to a 
pre-configured test list. If you want to use it:
1. Create a list in Brevo called "Test Recipients"
2. Add your test email addresses
3. Configure as default test list in Settings

For transactional mode, this is OPTIONAL since we can send 
directly to any email address.

Ready to proceed? Let me know when you have your API key.
```
{{< gen-cap "Code Snippet 4" "Claude Code's Step-by-Step Brevo Setup Guide" >}}  

As we see in *Code Snippet 4*, Claude Code provided a step-by-step guide to setting up our Brevo account, including how to generate an API key and verify the sender email address. Following Claude Code's instructions, I successfully prepared our Brevo account for integration:

{{< imgfig2 "/images/posts/claude-code-10-2.png" "Figure 2: " "Brevo API Key Generated" >}}

In *Figure 2*, the generated API key is outlined in red (partially redacted for security). I generated it by browsing to the Brevo URL, clicking to generate a new API key (outlined in blue), and copying it for later use. 

{{< callout tip >}}
Keep your API key secure! Store it in environment variables, never in code or committed files. Claude Code will help us configure this properly.
{{< /callout >}}

Since I have been using Brevo for a while through their Web UI, I already had a verified sender email address, so I didn't need to repeat that step.

---

## Installing @houtini/brevo-mcp with Claude Code

We should now be ready to install `@houtini/brevo-mcp`. 

### Generating the Configuration

With the API key ready, I asked Claude Code to set up the MCP server:

```
Configure @houtini/brevo-mcp for Claude Desktop. Generate the configuration and add it to Claude Desktop. Please also document the configuration.
```
{{< gen-cap "Code Snippet 5" "Setting Up @houtini/brevo-mcp with Claude Code" >}}

Claude Code generated the configuration:

```
● I can see your current Claude Desktop config. I'll add the Brevo MCP configuration. However, I need your Brevo API
  key to complete the setup.

● Please provide your Brevo API key (the one you generated in Step 2 of the setup - starts with xkeysib-).

[I provided the key, Claude Code generated the config, and documentation]

● Done! Here's what was configured:

  Configuration Added

  Claude Desktop config (C:\Users\niels\AppData\Roaming\Claude\claude_desktop_config.json):

  "brevo": {
    "command": "npx",
    "args": ["-y", "@houtini/brevo-mcp"],
    "env": {
      "BREVO_API_KEY": "xkeysib-25ac9167..."
    }
  }

  Documentation Created

  docs/mcp-servers-config.md - Complete documentation of all MCP servers:
  - PostgreSQL MCP Pro (database operations)
  - Import MCP (CSV imports)
  - Brevo MCP (email sending)

Next Steps

1. Restart Claude Desktop - Quit completely (check system tray) and relaunch
2. Verify Brevo MCP loaded - In Claude Desktop, the Brevo tools should be available
3. Test the connection - Ask Claude Desktop: "What is my Brevo account info?"

---
⚠️ Security Note: Your API key is now visible in this conversation. Consider regenerating it in Brevo if this
conversation is shared. The key in the config file is fine - just be careful with this chat log.

Would you like me to commit the documentation to git?
```
{{< gen-cap "Code Snippet 6" "Claude Code's Generated @houtini/brevo-mcp Configuration" >}}

The only issue with the generated configuration in *Code Snippet 6* is that the key is visible in this conversation as well as hardcoded in the config file. To mitigate this, I regenerated the API key in Brevo after completing the setup.

> **NOTE:** All of you reading this are probably groaning out loud, and thinking: "Niels, why didn't you just use environment variables properly instead of hardcoding the key in the config file?". Good question. The answer is: cast your minds back to part 7 in this series. There, we realised that Claude Desktop cannot "see" environment variables. We do have a GH issue open to see how to solve this. Until we've solved that, hardcoding the key in the config file is the only way to get Claude Code to work with MCP servers requiring authentication.

I restarted Claude Desktop to load the new MCP Server.

### Verifying the Connection

Now, the moment of truth: does it work? I switched to Claude Desktop (since we need the Brevo MCP server running) and asked:

{{< imgfig2 "/images/posts/claude-code-10-3.png" "Figure 3: " "Verifying Brevo MCP Connection in Claude Desktop" >}}

Yay! In *Figure 3*, we see that Claude Desktop successfully connected to Brevo and retrieved account information, confirming that our setup was correct. We are now one step closer to sending emails through conversations.

---

## Exploring the Brevo MCP Tools with Claude Code

Before we send our first email, let's explore the tools the Brevo MCP server provides.

### Discovering Available Tools

So far, the whole process has been very conversational. Let's continue that trend by using Claude Code to list the available tools:

```
Now that Brevo MCP is connected, list all the available tools and explain which ones we'll use for our transactional email approach.
```
{{< gen-cap "Code Snippet 7" "Listing Available Brevo MCP Tools with Claude Code" >}}

Claude Code provided a breakdown:

```
● Analyzing @houtini/brevo-mcp tools for transactional use case...

[Claude Code investigates the MCP Server]

● @houtini/brevo-mcp - All Available Tools

  Based on the https://github.com/houtini-ai/brevo-mcp:

  Complete Tool List
 
[Claude Code lists many tools - snipped for brevity]

  ---
  Tools We'll Use

  Primary Tool: send_email

  This is our main tool for transactional emails.

  Capabilities:
  - Send to individual recipients (one at a time)
  - Use Brevo templates with dynamic personalization
  - Custom HTML content if needed
  - Attachment support
  - Reply tracking

[Snipped for brevity]

  Secondary Tool: get_account_info

  Use for:
  - Verify API connection works
  - Check remaining email credits
  - Confirm account plan/limits

  ---
  Our Transactional Workflow

[Claude Code outlines the workflow, see diagram below - snipped for brevity]

  ---
  What We're NOT Using (and Why)

[Claude Code lists unused tools - snipped for brevity]

  ---
  Template Parameters

  When using send_email with templates, you can pass dynamic parameters:
  ┌────────────┬────────────────────┬─────────────────────────┐
  │ Parameter  │      Example       │    Usage in Template    │
  ├────────────┼────────────────────┼─────────────────────────┤
  │ first_name │ "John"             │ {{ params.first_name }} │
  ├────────────┼────────────────────┼─────────────────────────┤
  │ event_name │ "Data & AI Day"    │ {{ params.event_name }} │
  ├────────────┼────────────────────┼─────────────────────────┤
  │ event_date │ "March 15, 2025"   │ {{ params.event_date }} │
  ├────────────┼────────────────────┼─────────────────────────┤
  │ talk_title │ "AI in Production" │ {{ params.talk_title }} │
  ├────────────┼────────────────────┼─────────────────────────┤
  │ venue      │ "DUT, Durban"      │ {{ params.venue }}      │
  └────────────┴────────────────────┴─────────────────────────┘
  ---
  Would you like me to test the Brevo connection by calling get_account_info in Claude Desktop?
```
{{< gen-cap "Code Snippet 8" "Claude Code's Breakdown of Brevo MCP Tools" >}}

*Code Snippet 8* is just a small excerpt of what Claude Code listed. There were many tools, but the key takeaway is that we will primarily use `send_email` for our transactional emails, with `get_account_info` as a secondary tool for verification and monitoring.

You may notice in *Code Snippet 8* that Claude Code mentioned the transactional workflow, which I snipped for brevity. The workflow looks very much like what you see in *Figure 1* earlier.

### Deep Dive: The `send_email` Tool

Since a lot of our email sending will revolve around the `send_email` tool, I asked Claude Code to explain it in more detail, and Claude Code obliged:

```
● Brevo send_email Tool - Full Capabilities

BASIC USAGE (Single Recipient):
───────────────────────────────
send_email({
  to: [{ email: "person@example.com", name: "Person Name" }],
  subject: "Your Subject Line",
  
  // Content: Choose ONE of these
  templateId: 27,                    // Use Brevo template
  // OR
  htmlContent: "<h1>Hello!</h1>",    // Direct HTML
  
  // Personalization
  params: {
    FIRSTNAME: "Sarah",
    CUSTOM_VAR: "any value"
  }
})

BATCH USAGE (Multiple Recipients, Personalized):
────────────────────────────────────────────────
send_email({
  templateId: 27,           // Global template
  subject: "Default Subject", // Global default
  
  messageVersions: [
    {
      to: [{ email: "sarah@example.com", name: "Sarah" }],
      params: { FIRSTNAME: "Sarah", RATING: "6.2" }
    },
    {
      to: [{ email: "john@example.com", name: "John" }],
      params: { FIRSTNAME: "John", RATING: "5.8" },
      subject: "Custom subject for John"  // Override!
    },
    // ... up to 1000 versions
  ]
})

[snipped for brevity]

```
{{< gen-cap "Code Snippet 9" "Claude Code's Detailed Explanation of the send_email Tool" >}}

The batch capabilities shown in *Code Snippet 9* are particularly exciting, as they enable us to send personalised emails to multiple recipients in a single go, using a single Brevo template.

### Brevo Templates Explained

Brevo templates are  a pre-designed email layout you create once in Brevo's drag-and-drop editor, containing your logo, colors, formatting, and placeholder text like {{params.firstName}} or {{params.eventName}}. When sending emails via the API, instead of passing raw HTML every time, you just reference the template by its ID (e.g., templateId: 12) and pass the dynamic values (e.g., params: {firstName: "Jane", eventName: "Tech Conference"}), and Brevo merges them together. 

This separates design from code; we can update email styling in Brevo's visual editor without touching any code, while Claude needs to know "use template 12 for registration confirmations" and provide the personalisation data.

---

## Creating Our First Email Template

So how do we go about creating a Brevo template? Before diving in on that, what templates would we need for our **Data & AI Community Day Durban** events? Once again, I turned to Claude Code for guidance:

```
● Based on the Data & AI Community Day Durban workflow (Quicket registrations, Sessionize speakers, ~300 attendees,
  ~20-30 speakers), here are the essential templates:

  Attendee Templates
  ┌──────────────────────┬───────────────────────┬─────────────────────────────────────────┐
  │       Template       │       When Used       │               Key Params                │
  ├──────────────────────┼───────────────────────┼─────────────────────────────────────────┤
  │ Event Reminder       │ 1 week + 1 day before │ firstName, eventDate, venue, ticketType │
  ├──────────────────────┼───────────────────────┼─────────────────────────────────────────┤
  │ Post-Event Thank You │ Day after event       │ firstName, eventName, feedbackLink      │
  └──────────────────────┴───────────────────────┴─────────────────────────────────────────┘
  Speaker Templates
  ┌───────────────────────────┬──────────────────────────┬───────────────────────────────────────────────────────────┐
  │         Template          │        When Used         │                        Key Params                         │
  ├───────────────────────────┼──────────────────────────┼───────────────────────────────────────────────────────────┤
  │ CFP Invitation            │ When opening submissions │ firstName, eventName, cfpDeadline, submitLink             │
  ├───────────────────────────┼──────────────────────────┼───────────────────────────────────────────────────────────┤
  │ Session Accepted          │ After Sessionize         │ firstName, sessionTitle, sessionTime, room                │
  │                           │ selection                │                                                           │
  ├───────────────────────────┼──────────────────────────┼───────────────────────────────────────────────────────────┤
  │ Speaker Logistics         │ 1-2 weeks before         │ firstName, sessionTitle, arrivalTime, avRequirements      │
  ├───────────────────────────┼──────────────────────────┼───────────────────────────────────────────────────────────┤
  │ Speaker Thank You +       │ After event              │ firstName, sessionTitle, avgRating, attendeeCount,        │
  │ Ratings                   │                          │ topComments                                               │
  └───────────────────────────┴──────────────────────────┴───────────────────────────────────────────────────────────┘
  Recommended Starting Set (4 Templates)

  1. Event Reminder - highest impact, reduces no-shows
  2. CFP Invitation - recurring annual need
  3. Speaker Logistics - critical for smooth event day
  4. Speaker Ratings Report - valuable feedback speakers appreciate

  The registration confirmation is typically handled by Quicket automatically, so you likely don't need to duplicate
  that.
```
{{< gen-cap "Code Snippet 11" "Claude Code's Recommended Email Templates for Event Management" >}}  






















Claude Code provided a step-by-step guide to setting up our Brevo account, including generating an API key and verifying the sender email address. Following these instructions, I successfully prepared our Brevo account for integration.







`@houtini/brevo-mcp` stood out because it aligned perfectly with our requirements:


[ma]: mailto:niels.it.berglund@gmail.com

[nblin]: https://www.linkedin.com/in/nielsberglund/
[dataai]: https://aimldatadurban.org/

[part1]: {{< relref "2025-07-29-building-an-event-management-system-with-claude-code-claude-code-installation-and-initialisation.md" >}}
[part2]: {{< relref "2025-08-13-building-an-event-management-system-with-claude-code-part-2---ide-integration-and-advanced-features.md" >}}
[part3]: {{< relref "2025-12-28-building-an-event-management-system-with-claude-code-part-3---architecting-an-ai-native-system.md" >}}
[part4]: {{< relref "2026-01-01-building-an-event-management-system-with-claude-code-part-4---database-setup-and-first-conversations.md" >}}
[part5]: {{< relref "2026-01-04-building-an-event-management-system-with-claude-code-part-5---database-schema-and-natural-language-queries.md" >}}
[part55]: {{< relref "2026-01-12-building-an-event-management-system-with-claude-code-part-55---schema-refinement-when-real-data-reveals-the-truth.md" >}}
[part6]: {{< relref "2026-01-14-building-an-event-management-system-with-claude-code-part-6---architecture-design-custom-import-mcp-server.md" >}}
[part7]: {{< relref "2026-01-18-building-an-event-management-system-with-claude-code-part-7---implementing-the-import-mcp-server.md" >}}
[part8]: {{< relref "2026-01-24-building-an-event-management-system-with-claude-code-part-8---implementing-import-functions.md" >}}
[part9]: {{< relref "2026-01-29-building-an-event-management-system-with-claude-code-part-9---autonomous-implementation-letting-claude-code-loose.md" >}}

[1]: https://gist.github.com/nielsberglund/c4d428d2ec6ec18ee939cf4f7cc9e35f

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

