---
type: post
layout: "post"
title: "Building an Event Management System with Claude Code: Part 10 - Email Infrastructure with Brevo MCP"
author: nielsb
date: 2026-02-14T07:08:35+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/claude-code-ai-10.png"
thumbnail: "/images/thumbnails/posts/claude-code-ai-10.png"
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

Welcome back to the **Building an Event Management System with Claude Code** series! In Part 9, we explored autonomous implementation with Claude Code, letting it implement three import functions with minimal intervention. We learned that autonomous and conversational approaches each have their place, and that verification is always essential.

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
- ✅ Sent our first transactional email via natural language
- ✅ Solved the template parameter mapping challenge
- ✅ Built a reusable template parameter registry

> **NOTE:** My track record of covering what I say we'll cover is... well, you know the drill by now. Let's see how far we get!

---

## Starting the Conversation: Brevo MCP Research

### Asking Claude Code About Our Options

Back in Part 3, we decided on Brevo for email, and we identified `@houtini/brevo-mcp` as our top candidate. But since then, multiple people have approached me with suggestions for alternatives. It's always good to double-check critical infrastructure, so I started Claude Code and asked:

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

As shown in *Code Snippet 2*, Claude Code compared several options and recommended `@houtini/brevo-mcp` as the best fit for our needs — confirming our earlier choice from Part 3.

### The Architecture Decision

Before committing to `@houtini/brevo-mcp`, I wanted to understand the trade-offs between transactional and campaign messaging. I asked Claude Code to explain the differences. After confirming that transactional mode was the right fit for our use case (no need for A/B testing or Brevo-side contact management), I wanted to see what the architecture would look like.

Claude Code provided a clear architecture diagram and explanation. The full analysis is published as a `gist` at: [Email Architecture - Transactional Mode][1], and the core architecture diagram is shown below:

{{< imgfig2 "/images/posts/claude-code-10-1.png" "Figure 1: " "Email Architecture - Transactional Mode" >}}

*Figure 1* shows the core architecture. The key points:

1. PostgreSQL = Single source of truth (contacts, history)
2. Brevo = Email delivery only (templates, sending)
3. Claude = Orchestrator (queries DB, loops through recipients, sends via Brevo)
4. Confirmation = Required before bulk sends (>10 recipients)

With this confirmation, I was ready to proceed.

---

## Setting Up Brevo with Claude Code's Guidance

The question is: what do we need to set up Brevo to start sending emails?

### Setting up Brevo

What do we need to configure in Brevo before we can start sending? As usual, I asked Claude Code:

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

Brevo templates are  a pre-designed email layout you create once in Brevo's drag-and-drop editor, containing your logo, colors, formatting, and placeholder text like `{{params.firstName}}` or `{{params.eventName}}`. When sending emails via the API, instead of passing raw HTML every time, you just reference the template by its ID (e.g., `templateId: 12`) and pass the dynamic values (e.g., `params: {firstName: "Jane", eventName: "Tech Conference"}`), and Brevo merges them together. 

This separates design from code; we can update email styling in Brevo's visual editor without touching any code, while Claude needs to know "use template 12 for registration confirmations" and provide the personalisation data.

---

## Creating Our First Email Template

How do we create a Brevo template? Before diving into that, what templates would we need for our **Data & AI Community Day Durban** events? Once again, I turned to Claude Code for guidance, and Claude Code responded:

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
{{< gen-cap "Code Snippet 10" "Claude Code's Recommended Email Templates for Event Management" >}}  

Shown in *Code Snippet 10* is Claude Code's recommended set of email templates for our event management system. Since our first event is coming up soon (March 14), I decided to start by creating the "CFP Invitation" (Call For Papers/Call For Speakers) template.

> **NOTE:** Looking at *Code Snippet 10*, I do have some concerns about the templates and the exact parameters. The reservations I have are for the "Session Accepted" and "Speaker Thank You + Ratings" templates. Acceptance emails (and rejections) are sent from the Sessionize platform, so no template is needed. For the "Speaker Thank You + Ratings" template, I believe the parameters need to change somewhat, as one speaker may present multiple topics, and should receive separate ratings for each. Also, for each topic, the ratings cover both the presentation and the content individually. I will revisit this with Claude Code at a later stage to refine the template parameters.

So, how do we create Brevo templates?

### Creating a Template in Brevo

The "CFP Invitation" template is the one I want to start with (as per above). My assumption is that it will serve as a good starting point for our email communications. I also assume I will create the template using a Brevo editor. What I do not know is how to include the parameters we see in *Code Snippet 10*. So I asked Claude Code:

```
I have decided to create the "CFP Invitation" email template in Brevo as my first template. Can you guide me through creating this template. What I use to create it. etc., and how to add the dynamic parameters like {{params.firstName}}, {{params.eventName}}, etc.?
```
{{< gen-cap "Code Snippet 11" "Creating the 'CFP Invitation' Template with Claude Code's Guidance" >}}

You see in *Code Snippet 11* how I "hedged" my bets about where to create the template (I assume in Brevo's editor), and how I asked about the dynamic parameters. Claude responded:

```
● Creating Your First Brevo Template: CFP Invitation

  Step 1: Access the Template Editor

  1. Log into https://app.brevo.com
  2. Navigate to Campaigns → Templates
  3. Click New Template → Drag & Drop Editor (recommended for beginners)

  Step 2: Basic Setup

  When prompted:
  - Template Name: CFP Invitation - Data & AI Community Day
  - Subject Line: {{params.firstName}}, speak at {{params.eventName}}!
  - From: Your verified sender email

  Step 3: Design the Email

  Use the drag-and-drop blocks to build your layout:

[Snipped for brevity]

  Step 4: Adding Dynamic Parameters

  In the drag-and-drop editor:

  1. Click on a Text Block
  2. Type your text normally
  3. Where you want a dynamic value, simply type {{params.variableName}}
  4. The editor will highlight it as a variable

  For the button link:
  1. Select the button
  2. In the Link URL field, enter: {{params.submitLink}}

  Step 5: Parameters Summary
  ┌────────────────────────┬─────────────────────────────────────┬────────────────────────┐
  │       Parameter        │            Example Value            │      Description       │
  ├────────────────────────┼─────────────────────────────────────┼────────────────────────┤
  │ {{params.firstName}}   │ Jane                                │ Recipient's first name │
  ├────────────────────────┼─────────────────────────────────────┼────────────────────────┤
  │ {{params.eventName}}   │ Data & AI Community Day Durban 2026 │ Full event name        │
  ├────────────────────────┼─────────────────────────────────────┼────────────────────────┤
  │ {{params.eventDate}}   │ March 15, 2026                      │ Event date             │
  ├────────────────────────┼─────────────────────────────────────┼────────────────────────┤
  │ {{params.venue}}       │ Durban ICC                          │ Event location         │
  ├────────────────────────┼─────────────────────────────────────┼────────────────────────┤
  │ {{params.cfpDeadline}} │ January 31, 2026                    │ Submission deadline    │
  ├────────────────────────┼─────────────────────────────────────┼────────────────────────┤
  │ {{params.submitLink}}  │ https://sessionize.com/your-event   │ Sessionize CFP URL     │
  └────────────────────────┴─────────────────────────────────────┴────────────────────────┘
  Step 6: Preview & Test

  1. Click Preview in the top right
  2. Click Send Test Email
  3. Enter test values for each parameter when prompted
  4. Send to yourself to verify formatting

  Step 7: Save & Note the Template ID

  1. Click Save & Quit
  2. Back in the Templates list, hover over your template
  3. Note the Template ID (visible in the URL or template details) - you'll need this for the API

  ---
  Using the Template via Claude

  Once saved, Claude can send emails using:

[snipped for brevity]

  Let me know once you've created the template and I can help you test it
```
{{< gen-cap "Code Snippet 12" "Claude Code's Step-by-Step Guide to Creating the 'CFP Invitation' Template" >}}

As shown in *Code Snippet 12*, Claude Code provided a detailed step-by-step guide to creating the "CFP Invitation" template in Brevo's drag-and-drop editor, including how to add dynamic parameters like `{{params.firstName}}` and `{{params.eventName}}`.

I logged into my Brevo account and navigated to the "Marketing -> Campaigns ->Templates" section. From there, I clicked on **Create Template** and chose **Email template**. I proceeded to design a very minimalistic template for testing, and I added the dynamic parameters:

{{< imgfig2 "/images/posts/claude-code-10-4.png" "Figure 4: " "The 'CFP Invitation' Template in Brevo's Editor" >}}

In *Figure 4*, you see the template I created in Brevo's editor, with the dynamic parameters highlighted in red. The parameters are added by simply typing `{{params.variableName}}` in the text blocks or link fields, and Brevo automatically recognises them as variables.

{{< callout tip >}}
Brevo templates use `{{params.variableName}}` syntax. The `params.` prefix is required. Using just `{{variableName}}` won't work for transactional sends.
{{< /callout >}}

After creating the template, I saved it and noted the Template ID, which is required to send emails via the API. The next step is to test sending an email using this template through Claude Desktop, which we will cover in the next section.

---

## Sending Our First Email via Claude Desktop

Time for the moment of truth: can we send an email using our new Brevo MCP server and the "CFP Invitation" template we just created? 

### The Test Send

In Claude Desktop (where Brevo MCP is running), I asked:

```
I want you to send a Call for Speakers email to Niels Berglund. It is for the event at March 14, 2026. You should use the template with an ID of 49.
```
{{< gen-cap "Code Snippet 13" "Sending a Test Email via Claude Desktop" >}}

Before I asked Claude Desktop to send the email, I had created a new event. This event is the one we are having on March 14, [**Data & AI Community Day Durban: AI Unplugged**][2]. I added this event to the database using the Import MCP Server, and I ensured the required details were included for the email template parameters.

Having prompted Claude Desktop as in *Code Snippet 13*, Claude Desktop responded:

{{< imgfig2 "/images/posts/claude-code-10-5.png" "Figure 5: " "Claude Desktop Confirming Sending Email via Brevo MCP" >}}

Claude Desktop did not just send the email immediately. Instead, it confirmed the details with me first, as shown in *Figure 5*. This is a great safety feature to prevent accidental bulk sends. Everything looked good, so I confirmed I wanted to send. The response was like so:

{{< imgfig2 "/images/posts/claude-code-10-6.png" "Figure 6: " "Claude Desktop Confirming Email Sent and Showing Response" >}}

Yes! In *Figure 6*, we see that Claude Desktop says it successfully sent the email via Brevo MCP. So I went to my email client and waited, and waited and waited... and no email. After a few minutes, I checked the Brevo dashboard to see if the email was sent:

{{< imgfig2 "/images/posts/claude-code-10-7.png" "Figure 7: " "Brevo Dashboard Showing the Sent Email" >}}

As shown in *Figure 7*, the email was not sent successfully; an error (highlighted in red) occurred. When clicking on the error:

{{< imgfig2 "/images/posts/claude-code-10-8.png" "Figure 8: " "Template Disabled" >}}  

Ah — as we see in *Figure 8*, the template was disabled. I had forgotten to click the **Activate** toggle in Brevo's template settings after creating it. Easy fix.

But there's a more concerning problem. Looking back at the logs in *Figure 7*, the parameters for `{{params.firstName}}` and `{{params.eventName}}` were not passed. This is a problem because these parameters are required for the template to render properly. Going back to *Figure 6* and expanding what is highlighted in red, we see:

```
Request

{
  "to": [
    {
      "email": "niels.it.berglund@gmail.com",
      "name": "Niels Berglund"
    }
  ],
  "templateId": 49
}
Response

{
  "messageId": "<202602120526.70190096631@smtp-relay.mailin.fr>",
  "status": "sent",
  "to": [
    {
      "email": "niels.it.berglund@gmail.com",
      "name": "Niels Berglund"
    }
  ],
  "subject": "Template-based email"
}
```
{{< gen-cap "Code Snippet 14" "Brevo MCP Request and Response for the Test Email" >}}

I guess the problem is what we do **NOT** see in *Code Snippet 14*; the `params` object that should have been passed in the request. This is a problem because without the parameters, the template cannot render properly. Clearly, the parameters aren't being passed correctly from Claude Desktop to the Brevo MCP server. Back to Claude Code.

### Debugging the Missing Parameters Issue

I asked Claude Code:

```
So I just tried to send an email from Claude Desktop to a Brevo teamplate. Claude desktop correctly identified the email to send to and the template, but it did not acknowledge the parameters for the template. How do I solve this?
```
{{< gen-cap "Code Snippet 15" "Debugging Missing Template Parameters with Claude Code" >}}

I thought I would get a simple answer, but instead, Claude Code responded:

```
● This is a common issue — Claude Desktop needs to know what parameters the template expects. There are a few things to
  check:

  1. Check what the Brevo MCP tool accepts

[snipped for brevity]

  2. Be explicit in your prompt

  When asking Claude Desktop to send, be very specific about the parameters:

[snipped for brevity]

  3. Possible root cause

  The @houtini/brevo-mcp tool might not expose template params as a tool parameter. If that's the case, you have two
  options:

[snipped for brevity]

  Can you try the explicit prompt first and share what happens? Also, what exactly did Claude Desktop respond when it
  sent the email — did it show the tool call it made?
```
{{< gen-cap "Code Snippet 16" "Claude Code's Troubleshooting Steps for Missing Template Parameters" >}} 

This was a bit disappointing. Instead of a quick fix, I got a rather generic troubleshooting response from Claude Code — check the tool schema, be more explicit in the prompt. Not particularly helpful.

When checking if the MCP server has a tool/function to retrieve parameter information, I found that it does not, bummer!

Back to the drawing board, I asked Claude Code:

```
So it looks like the MCP server does not expose any tool/function to retrieve parameters for a template id. I do definitely not want to  define the parameters in each call, for each template id. Do you have any ideas how to solve this?
```
{{< gen-cap "Code Snippet 17" "Finding a Solution for Missing Template Parameters with Claude Code" >}}

The response to the prompt/question in *Code Snippet 17*: 

```
● Good thinking — you shouldn't have to repeat parameters every time. Here are a few approaches, from simplest to most
  robust:

  Option A: Template registry in your database (Recommended)

  Store template metadata in PostgreSQL. Claude already has the Postgres MCP, so it can look up what any template needs
  before sending.

[snipped for brevity]

  The workflow becomes:
  1. You say: "Send the CFP invitation to all 2024 speakers"
  2. Claude queries email_templates to find template 49 and its parameters
  3. Claude queries contacts/events to resolve the source fields automatically
  4. Claude asks you only for values it can't resolve (like cfpDeadline, submitLink)
  5. Claude sends via Brevo with all params filled in

  Option B: JSON config file in the project

  A simpler version — just a templates.json file Claude reads before sending. Less powerful (no auto-resolution from DB
  fields) but quick to set up.

  Option C: Custom MCP tool that calls Brevo API

[snipped for brevity]

  ---
  My recommendation: Option A. It uses your existing Postgres MCP, lets Claude auto-resolve most parameters from
  database fields, and scales cleanly as you add more templates. You'd essentially tell Claude once how a template maps
  to your data, and it figures out the rest.

  Want me to design the full table schema and create the migration?
```
{{< gen-cap "Code Snippet 18" "Claude Code's Proposed Solutions for Managing Template Parameters" >}}

The response we see in *Code Snippet 18* is better. Claude Code acknowledged the problem and provided multiple solutions to solve it, which is great. For now, I am going to go with Option B, the JSON config file, as it is the quickest to set up. I can always migrate to Option A later when I have more templates and want the auto-resolution from database fields. 

So I indicated to Claude Code that I want to go with Option B, and asked what the file should look like. The file looked good, but it only listed the template parameters, not mapped them to what is in the database. So I asked Claude Code how to map the JSON file parameters to the database fields so that Claude Desktop can automatically resolve them when sending emails. Claude Code's response was:

```
● Claude Desktop won't reliably resolve that on its own — it would have to guess which database field maps to which
  template parameter every time. Sometimes it'll get it right, sometimes not.

  You should add the mapping explicitly. Just add a source field:

  {
    "templates": [
      {
        "brevo_template_id": 49,
        "name": "CFP Invitation",
        "description": "Invite speakers to submit sessions for Call for Papers",
        "parameters": {
          "firstName": {
            "description": "Recipient's first name",
            "source": "contacts.first_name",
            "required": true
          },
          "eventName": {
            "description": "Full event name",
            "source": "events.name",
            "required": true
          },

[snipped for brevity]

          "bannerImageUrl": {
            "description": "Event-specific banner image URL",
            "source": null,
            "required": false
          }
        }
      }
    ]
  }

  The logic is simple:
  - source has a value → Claude queries the database to get it automatically
  - source is null → Claude must ask you or you provide it in the prompt

  So when you say "Send the CFP invitation to all 2024 speakers for Data & AI Community Day 2026", Claude would:

  1. Read templates.json → find template 49
  2. Auto-resolve firstName from contacts.first_name for each recipient
  3. Auto-resolve eventName, eventDate, venue from the events table
  4. Ask you for cfpDeadline, submitLink, and optionally bannerImageUrl

  Want me to create this file in the project?
```
{{< gen-cap "Code Snippet 19" "Claude Code's Explanation of Mapping Template Parameters to Database Fields" >}} 

This is great, I like the idea of having a `source` field that tells Claude Desktop where to look for the parameter value in the database. This way, we can automate the resolution of parameter values based on what is stored in the database, and only ask for values that are not stored (like `cfpDeadline` and `submitLink`). 

> **NOTE:** Maybe I should list parameters like `cfpDeadline` and `submitLink` in the JSON file as well. For now, I will ask for them in the prompt, but in the future, it may be better to include them in the JSON file with a `source` of `null` to make it clear they are required parameters.

I asked Claude Code to create this file in the project:

```
Can you please create the file for me. The CFP template have the following parameters:

  * params.firstName
  * params.eventName
  * params.eventDate
  * params.venue
  * params.cfpDeadline
  * params.submitLink
  * params.bannerImageUrl

  Please match them against what we have in the database, and create the file. The templateId is 49
```
{{< gen-cap "Code Snippet 20" "Requesting Claude Code to Create the Template Parameters JSON File" >}}

Based on my prompt in *Code Snippet 20*, Claude Code went ahead:

```
● Let me check the database schema first to get the exact column names.

[snipped for brevity]

● Got the events table. Let me retry contacts.

[snipped for brevity]

● Got both tables. Here's the mapping:
  ┌────────────────┬─────────────────────┐
  │   Parameter    │      DB Source      │
  ├────────────────┼─────────────────────┤
  │ firstName      │ contacts.first_name │
  ├────────────────┼─────────────────────┤
  │ eventName      │ events.name         │
  ├────────────────┼─────────────────────┤
  │ eventDate      │ events.event_date   │
  ├────────────────┼─────────────────────┤
  │ venue          │ events.location     │
  ├────────────────┼─────────────────────┤
  │ cfpDeadline    │ no match — manual   │
  ├────────────────┼─────────────────────┤
  │ submitLink     │ no match — manual   │
  ├────────────────┼─────────────────────┤
  │ bannerImageUrl │ no match — manual   │
  └────────────────┴─────────────────────┘

● Write(templates.json)
  ⎿  Wrote 1 lines to templates.json
       1 {
       2   "templates": [
       3     {
       4       "brevo_template_id": 49,
       5       "name": "CFP Invitation",
       6       "description": "Invite speakers to submit sessions for Call for Papers",
       7       "parameters": {
       8         "firstName": {
       9           "description": "Recipient's first name",
      10           "source": "contacts.first_name",

● Created templates.json. Here's a summary:

  Auto-resolved from database (per recipient/event):
  - firstName → contacts.first_name
  - eventName → events.name
  - eventDate → events.event_date
  - venue → events.location

  Manual (you provide in the prompt):
  - cfpDeadline — no DB field for this
  - submitLink — no DB field for this
  - bannerImageUrl — optional, no DB field

  So a typical Claude Desktop prompt would be:

  "Send the CFP invitation to all 2024 speakers for Data & AI Community Day 2026. CFP deadline is January 31, 2026.
  Submit link is https://sessionize.com/data-ai-durban-2026"

  Claude would handle the rest by reading templates.json and querying the database for the four auto-resolved fields.

  You'll want to reference this file in your Claude Desktop system prompt or project instructions so Claude knows to
  consult it before sending emails.

```
{{< gen-cap "Code Snippet 21" "Claude Code Creating the Template Parameters JSON File and Explaining the Resulting Workflow" >}}

We see in *Code Snippet 21* that Claude Code successfully created the file, along with a description of the workflow and a potential prompt for Claude Desktop. In addition, Claude Code said that I could reference this file in the Claude Desktop project instructions so that Claude knows to consult it before sending emails. This is a good point, and I will do that next. 

### Configure Claude Desktop to Use the Template Parameters File

I took the `templates.json` file Claude Code created and added it to the Claude Desktop project. I also referenced it in the project instructions. A Claude Desktop project has the notions of **Instructions**, which are guidelines or information that Claude Desktop reads before performing any actions. My instructions look like so:

```
This is the project for the Data & AI Contact and Event Management system. The underlying database is a PostgreSQL database, so for direct database queries, always use the PostgreSQL MCP Server - unless otherwise informed.

When sending emails use the Brevo MCP server. As the emails are templated, a file named templates.json is uploaded to the project. For emails read the parameters for the template in question and query the database for the values. If any parameters are not in the database, ask the user for the values.
```
{{< gen-cap "Code Snippet 22" "Claude Desktop Project Instructions Including Reference to Template Parameters File" >}}

Having updated the instructions as in *Code Snippet 22*, I am now ready to test sending the email again, this time with the expectation that Claude Desktop will read the `templates.json` file, understand what parameters are needed for the template, and query the database for the values it can resolve, while asking me for any values it cannot resolve.

#### Test Send with Template Parameters

Before doing anything, I made sure to activate the template in Brevo, as that was the issue last time. Then I prompted Claude Desktop with the same CFP invitation request from *Code Snippet 13*, and Claude Desktop started working:

{{< imgfig2 "/images/posts/claude-code-10-9.png" "Figure 9: " "Claude Desktop Resolving Template Parameters from JSON File and Database" >}}

As shown in *Figure 9*, Claude Desktop read the `templates.json` file, identified the required template parameters, and queried the database to retrieve the values for `firstName`, `eventName`, `eventDate`, and `venue`. For the parameters it couldn't resolve (`cfpDeadline` and `submitLink`), it asked me for their values. I provided them, and Claude Desktop then sent the email.

As before, I checked my email client, and ... the email was there! It worked (sort of):

{{< imgfig2 "/images/posts/claude-code-10-10.png" "Figure 10: " "Received Email with (almost) Rendered Template Parameters" >}}

In *Figure 10*, we see the email I received. The template rendered — mostly. The parameters highlighted in yellow are all correct. However, the values highlighted in red are not rendered. That's strange, as those parameters were read from the database and should have been passed. I checked the Brevo dashboard to confirm the parameters were included in the request, and they were.

Eventually, I checked the template in Brevo (*Figure 4*), and the issue became obvious. Remember what I said about adding parameters in the Brevo editor? You have to type `{{params.variableName}}` for Brevo to recognise it as a parameter. For some reason, I had typed `{{firstName}}` and `{{eventName}}` instead of `{{params.firstName}}` and `{{params.eventName}}` in the template. That's why they weren't rendering. I fixed the template and sent the email again, and this time it rendered correctly. Yay!

Is all well and good now? Not quite. I still need to figure out how to include an image in the email. I have the `bannerImageUrl`, but I do not know how to set that parameter. I am uploading images to Brevo, but I cannot find a way to get the correct URL for them. For now, I am happy, and I will make the image thing a problem for another day.

---

## What We've Accomplished

Let's step back and look at what we built in this post:

**Infrastructure:**

- Researched and validated `@houtini/brevo-mcp` as our email MCP server
- Set up Brevo account with API key and verified sender
- Installed and configured the MCP server in Claude Desktop
- Created our first email template with dynamic parameters in Brevo's editor

**The Template Parameter Challenge:**

- Discovered that the Brevo MCP server doesn't expose template parameter metadata
- Designed a `templates.json` registry that maps template parameters to database fields
- Configured Claude Desktop project instructions to use the registry automatically
- Achieved automatic parameter resolution: Claude queries the database for what it can, asks for what it can't

**First Emails Sent:**

- Sent our first transactional email via natural language
- Debugged template activation and parameter passing issues
- Confirmed end-to-end: prompt → database query → Brevo API → email delivered

The debugging journey was arguably the most valuable part. Real systems have real problems, and seeing how to diagnose issues across the MCP boundary (Claude Desktop → Brevo MCP → Brevo API) is knowledge you can't get from documentation alone.

---

## ~ Finally

Part 10 marks a significant milestone in this series. The system we envisioned back in [Part 3][part3] is now functional end-to-end:

1. **Import data** via conversational commands (Parts 6-9)
2. **Query and analyse** via natural language (Parts 4-5)
3. **Send communications** via conversation (this post)

What used to require switching between multiple tools, databases, Excel, and email platforms now happens in a single conversation with Claude.

**The key insight from this post:** By choosing transactional email over campaigns, we kept PostgreSQL as the single source of truth. No contact sync, no duplicate data, no architectural complexity. The trade-off (no A/B testing, no Brevo-side analytics) is well worth the simplicity for our use case.

**The template parameter challenge** taught us something important about working with third-party MCP servers: they won't always expose everything you need. The `templates.json` registry we built is a simple yet effective bridge; it provides Claude with the context it needs to resolve parameters automatically, without requiring changes to the MCP server itself.

**What didn't we cover?** Campaign tracking tables for logging who received what email and when, batch sending to multiple recipients, and handling the 300/day free-tier limit. These are all important for a production workflow, and they'll be the focus of Part 11.

### What Comes Next

In Part 11, we'll build on today's foundation with:

- Campaign tracking tables in PostgreSQL (who got what, when)
- Batch sending with personalisation to multiple recipients
- Segmentation queries ("email all speakers who haven't been contacted in 30 days")
- Handling the 300/day free-tier limit with smart batching

The questions that naturally arise: "How do I know who's already received this?", "How do I avoid emailing the same person twice?" are exactly the problems Part 11 will solve.

### Questions or thoughts?

- Ping me: [niels.it.berglund@gmail.com][ma]
- Follow on LinkedIn: [linkedin.com/in/nielsberglund][nblin]

**Found this helpful?** Share it with your network! Email integration is a common need, and the MCP-based approach shown here is reusable beyond event management.

See you in Part 11, where we add campaign tracking and batch sending!

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
- ✅ Part 10: Email Infrastructure (this post)
- 🚀 Part 11: Campaign Tracking & Batch Sending (coming soon)

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

[1]: https://gist.github.com/nielsberglund/c4d428d2ec6ec18ee939cf4f7cc9e35f
[2]: https://aimldatadurban.org/events/2026/ai-unplugged/


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

