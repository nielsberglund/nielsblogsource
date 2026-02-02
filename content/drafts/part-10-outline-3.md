# Part 10 Outline: Email Infrastructure with Brevo MCP

## Post Metadata

```yaml
---
type: post
layout: "post"
title: "Building an Event Management System with Claude Code: Part 10 - Email Infrastructure with Brevo MCP"
author: nielsb
date: 2026-02-XX  # To be set when publishing
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
```

---

## Introduction

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
- ✅ Implemented batch sending with personalization

> **NOTE:** My track record of covering what I say we'll cover is... well, you know the drill by now. Let's see how far we get!

---

## Starting the Conversation: Brevo MCP Research

### Asking Claude Code About Our Options

Back in Part 3, we decided on Brevo for email. Now it's time to implement. But which Brevo MCP server should we use? I started Claude Code and asked:

```
We're ready to implement email integration with Brevo. In Part 3 we identified 
@houtini/brevo-mcp as an option. Before we proceed, I want to make sure this 
is still the best choice. 

Research the current Brevo MCP server options and compare them. Consider:
- What tools each provides
- Setup complexity  
- Whether they work with our architecture (PostgreSQL as single source of truth)
```
{{< gen-cap "Code Snippet 1" "Asking Claude Code to Research Brevo MCP Options" >}}

Claude Code went to work:

```
⏵ Researching Brevo MCP server options...

I found THREE viable options for Brevo MCP integration:

┌─────────────────────────────────────────────────────────────────────────────┐
│ OPTION 1: @houtini/brevo-mcp (Community)                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│ Tools: 14 tools                                                             │
│ - get_account_info, get_contacts, get_contact_analytics                     │
│ - create_email_campaign, update_email_campaign, get_email_campaigns         │
│ - send_campaign_now, send_test_email, send_email (transactional)           │
│ - get_campaign_analytics, get_campaigns_performance                         │
│                                                                             │
│ Setup: npx -y @houtini/brevo-mcp                                           │
│ API Key: Standard xkeysib- key                                              │
│ License: MIT                                                                │
├─────────────────────────────────────────────────────────────────────────────┤
│ OPTION 2: Official Brevo MCP (Hosted)                                       │
├─────────────────────────────────────────────────────────────────────────────┤
│ Tools: 26+ modular services                                                 │
│ - brevo_contacts, brevo_lists, brevo_segments                              │
│ - brevo_email_campaign_management, brevo_templates                          │
│ - brevo_campaign_analytics, brevo_deals, brevo_tasks                       │
│                                                                             │
│ Setup: Remote MCP via mcp-remote                                           │
│ API Key: Special MCP-specific key (different from standard)                │
│ Status: "Early Access"                                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│ OPTION 3: @samihalawa/brevo-mcp (Comprehensive)                            │
├─────────────────────────────────────────────────────────────────────────────┤
│ Tools: 8 organized tool categories                                          │
│ - Email, SMS, WhatsApp, Contacts, Campaigns                                │
│ - Conversations, Webhooks, E-commerce, CRM                                 │
│                                                                             │
│ Setup: npm install + build                                                  │
│ API Key: Standard xkeysib- key                                              │
│ Built on: Official @getbrevo/brevo SDK                                     │
└─────────────────────────────────────────────────────────────────────────────┘

Which would you like me to analyze further?
```
{{< gen-cap "Code Snippet 2" "Claude Code's Brevo MCP Server Comparison" >}}

Interesting! There are more options than we knew about in Part 3. I asked Claude Code to dig deeper:

```
Analyze these options against our specific architecture requirement: 
PostgreSQL is our single source of truth for contacts. We do NOT want 
to maintain contacts in Brevo's database. Which option works best for this?
```
{{< gen-cap "Code Snippet 3" "Asking Claude Code About Architecture Fit" >}}

### The Critical Discovery

Claude Code's response revealed something important:

```
⏵ Analyzing architecture compatibility...

⚠️  CRITICAL FINDING: Contact Database Implications

Most Brevo MCP tools assume contacts exist in Brevo's contact database:
- create_email_campaign uses listIds to target Brevo contact lists
- send_campaign_now sends to Brevo lists, not arbitrary emails
- Brevo's native segmentation works on their contact database

This conflicts with your requirement for PostgreSQL as single source of truth.

HOWEVER, I found a solution in @houtini/brevo-mcp:

The send_email tool supports TRANSACTIONAL MODE:
┌─────────────────────────────────────────────────────────────────┐
│ send_email({                                                    │
│   to: [                                                         │
│     { email: "person@example.com", name: "Person" }  ← Direct! │
│   ],                                                            │
│   templateId: 27,                                               │
│   params: { FIRSTNAME: "Sarah", ... }                          │
│ })                                                              │
└─────────────────────────────────────────────────────────────────┘

This means:
✅ No need to sync contacts to Brevo
✅ Query PostgreSQL → Pass emails directly to API
✅ PostgreSQL remains single source of truth
✅ Personalization via params object

Batch capabilities:
- 2,000 total recipients per API call
- messageVersions for individual personalization
- Each version can have different params

RECOMMENDATION: Use @houtini/brevo-mcp with transactional send_email
- Skip campaign features (they need Brevo contact lists)
- Use transactional for ALL sends
- Build our own campaign tracking in PostgreSQL
```
{{< gen-cap "Code Snippet 4" "Claude Code's Architecture Analysis" >}}

This was exactly the insight we needed. The campaign features in these MCP servers assume you're using Brevo's contact database—but transactional mode lets us bypass that entirely.

### The Architecture Decision

I wanted to make sure I understood the trade-offs:

```
What do we lose by using transactional mode instead of campaigns?
```
{{< gen-cap "Code Snippet 5" "Asking About Trade-offs" >}}

Claude Code laid it out clearly:

```
⏵ Trade-off Analysis: Transactional vs Campaign Mode

WHAT YOU GAIN (Transactional):
✅ PostgreSQL as single source of truth
✅ No contact sync complexity  
✅ Full control over segmentation (your SQL, your rules)
✅ Simpler architecture
✅ No Brevo contact list maintenance

WHAT YOU LOSE (vs Campaigns):
❌ A/B testing (requires Brevo campaigns + contact lists)
❌ Brevo's built-in automation workflows
❌ Campaign-level analytics in Brevo dashboard
❌ Send-time optimization per recipient
❌ Brevo's native segment builder

WHAT YOU CAN BUILD YOURSELF:
✅ Campaign tracking → PostgreSQL tables
✅ Segmentation → SQL queries (more powerful than Brevo's UI!)
✅ Analytics → Query your own campaign_sends table
✅ Suppression logic → "WHERE contact_id NOT IN recent sends"

For your use case (quarterly event emails to ~300 people), 
transactional mode is the RIGHT choice. You don't need A/B testing 
for speaker thank-you emails. You DO need architectural simplicity.

Shall I proceed with @houtini/brevo-mcp setup using transactional mode?
```
{{< gen-cap "Code Snippet 6" "Claude Code's Trade-off Analysis" >}}

This confirmed our direction. The "losses" are features we don't need for our use case, and we can build the tracking we DO need in PostgreSQL.

{{< imgfig2 "/images/posts/claude-code-10-X.png" "Figure 1: " "Transactional vs Campaign Email Architecture" >}}

---

## The Transactional Email Architecture

Based on Claude Code's analysis, here's our architecture:

```
┌─────────────────────────────────────────────────────────────┐
│                    CONVERSATIONAL LAYER                      │
│                      Claude Desktop                          │
└───────────────────────────┬─────────────────────────────────┘
                            │ "Send thank-you to speakers"
                            ▼
┌─────────────────────────────────────────────────────────────┐
│  Postgres MCP Pro              │  @houtini/brevo-mcp        │
│  ─────────────────             │  ───────────────────        │
│  • Query contacts              │  • send_email()            │
│  • Get personalization data    │  • Transactional mode      │
│  • Log campaign sends          │  • No contact sync!        │
└───────────────────────────┬────┴────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│  PostgreSQL (Neon)             │  Brevo API                 │
│  ─────────────────             │  ─────────                 │
│  • contacts (SOURCE OF TRUTH)  │  • Templates only          │
│  • campaigns                   │  • Send emails             │
│  • campaign_sends              │  • NO contact database     │
└─────────────────────────────────────────────────────────────┘
```
{{< gen-cap "Code Snippet 7" "Transactional Email Architecture" >}}

The key insight: Brevo becomes a **delivery mechanism only**. All intelligence—who to send to, what to personalize, tracking what was sent—lives in PostgreSQL where we control it.

---

## Setting Up Brevo with Claude Code's Guidance

### Getting Your API Key

I asked Claude Code to walk me through the setup:

```
Guide me through setting up Brevo for our transactional email integration.
What do I need to configure in Brevo before we can start sending?
```
{{< gen-cap "Code Snippet 8" "Asking Claude Code for Setup Guidance" >}}

Claude Code provided a checklist:

```
⏵ Brevo Setup Checklist for Transactional Email

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
{{< gen-cap "Code Snippet 9" "Claude Code's Brevo Setup Checklist" >}}

I followed the steps:

{{< imgfig2 "/images/posts/claude-code-10-X.png" "Figure 2: " "Brevo API Key Location" >}}

```
Done. I have:
- API key: xkeysib-... (stored securely)
- Verified sender: events@dataai.community
- Domain verification pending but email works for now
```
{{< gen-cap "Code Snippet 10" "Confirming Setup Complete" >}}

{{< callout tip >}}
Keep your API key secure! Store it in environment variables, never in code or committed files. Claude Code will help us configure this properly.
{{< /callout >}}

---

## Installing @houtini/brevo-mcp with Claude Code

### Generating the Configuration

With the API key ready, I asked Claude Code to set up the MCP server:

```
Configure @houtini/brevo-mcp for Claude Desktop. Generate the 
configuration I need to add to claude_desktop_config.json.
My API key is stored in environment variable BREVO_API_KEY.
```
{{< gen-cap "Code Snippet 11" "Asking Claude Code to Generate Config" >}}

Claude Code generated the configuration:

```
⏵ Generating Claude Desktop configuration for Brevo MCP...

Add this to your claude_desktop_config.json:

{
  "mcpServers": {
    "brevo": {
      "command": "npx",
      "args": ["-y", "@houtini/brevo-mcp"],
      "env": {
        "BREVO_API_KEY": "${BREVO_API_KEY}"
      }
    }
  }
}

⚠️  NOTE: Claude Desktop doesn't expand environment variables in config.
You have two options:

OPTION A: Hardcode the key (less secure, simpler)
──────────────────────────────────────────────────
"BREVO_API_KEY": "xkeysib-your-actual-key-here"

OPTION B: Set system environment variable (more secure)
───────────────────────────────────────────────────────
1. Add BREVO_API_KEY to your system environment
2. Use this config:
   "env": {
     "BREVO_API_KEY": "xkeysib-your-key-here"
   }

For development, Option A is fine. For production/shared machines, 
use Option B.

After adding, restart Claude Desktop to load the new MCP server.
```
{{< gen-cap "Code Snippet 12" "Claude Code's MCP Configuration" >}}

I added the configuration and restarted Claude Desktop.

### Verifying the Connection

Now the moment of truth—does it work? I switched to Claude Desktop (since we need the Brevo MCP server running) and asked:

```
Show me my Brevo account info to verify the connection is working.
```
{{< gen-cap "Code Snippet 13" "Testing Brevo MCP Connection" >}}

Claude Desktop responded:

```
I'll check your Brevo account status.

[Calling get_account_info via Brevo MCP]

✅ Connection successful! Here's your account info:

Account Details:
────────────────
Email: niels.it.berglund@gmail.com
Company: Data & AI Community
Plan: Free

Email Credits:
─────────────
Daily limit: 300 emails
Remaining today: 300

Verified Sender:
───────────────
events@dataai.community ✓

The Brevo MCP server is connected and ready. What would you like to do?
```
{{< gen-cap "Code Snippet 14" "Successful Brevo Connection" >}}

The connection works. We can now send emails through natural language commands.

---

## Exploring the Brevo MCP Tools with Claude Code

### Discovering Available Tools

Before diving into sending, I wanted to understand what tools we have available. Back in Claude Code:

```
Now that Brevo MCP is connected, list all the available tools and 
explain which ones we'll use for our transactional email approach.
```
{{< gen-cap "Code Snippet 15" "Asking Claude Code About Available Tools" >}}

Claude Code provided a comprehensive breakdown:

```
⏵ Analyzing @houtini/brevo-mcp tools for transactional use case...

TOOLS WE'LL USE:
────────────────
✅ get_account_info    - Check credits, verify setup
✅ send_email          - Our primary tool (transactional mode)
✅ send_test_email     - Test before live sends

TOOLS WE WON'T USE (require Brevo contact lists):
─────────────────────────────────────────────────
⏭️  get_contacts           - Our contacts are in PostgreSQL
⏭️  create_email_campaign  - Campaigns need Brevo lists
⏭️  send_campaign_now      - Sends to Brevo lists
⏭️  update_campaign_status - N/A for transactional

TOOLS FOR FUTURE CONSIDERATION:
──────────────────────────────
🔮 get_campaign_analytics  - Could track Brevo-side metrics
🔮 get_contact_analytics   - If we ever sync contacts

The send_email tool is our workhorse. Let me show you its full 
capabilities...
```
{{< gen-cap "Code Snippet 16" "Claude Code's Tool Analysis" >}}

### Deep Dive: The send_email Tool

I asked Claude Code to explain the send_email tool in detail:

```
Show me the full capabilities of the send_email tool, especially 
the batch sending with messageVersions. Include examples.
```
{{< gen-cap "Code Snippet 17" "Requesting send_email Details" >}}

```
⏵ send_email Tool - Complete Reference

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

LIMITS:
───────
• 2,000 total recipients per API call
• 99 recipients per message version
• 1,000 message versions per call
• 300 emails/day on free plan
• 100 API calls/minute rate limit

PRACTICAL IMPLICATION:
─────────────────────
For 287 attendees, we can send in ONE API call:
- Use messageVersions with one version per attendee
- Each gets personalized params
- Single API call, 287 personalized emails

This is MUCH more efficient than 287 separate API calls!
```
{{< gen-cap "Code Snippet 18" "Claude Code's send_email Reference" >}}

This batch capability is key. We can send all our speaker thank-you emails (22 people) or even all attendee emails (287 people) in a single API call, each fully personalized.

---

## Creating Our First Email Template

### Planning the Template with Claude Code

Before jumping into Brevo's editor, I asked Claude Code what our first template should include:

```
We need to create our first email template in Brevo for speaker 
thank-you emails. What placeholders should we include? What data 
do we have available in the database to personalize with?
```
{{< gen-cap "Code Snippet 19" "Asking Claude Code About Template Design" >}}

```
⏵ Analyzing database schema for personalization opportunities...

For speaker thank-you emails, you have this data available:

FROM contacts table:
────────────────────
• first_name, last_name
• email
• company

FROM speakers table:
───────────────────
• bio, tagline
• profile_picture_url

FROM speaker_sessions table:
───────────────────────────
• session_title
• description
• session_format (talk, workshop, panel)
• level (beginner, intermediate, advanced)

FROM speaker_ratings table:
──────────────────────────
• topic_rating (1-7)
• presentation_rating (1-7)
• time_investment_rating (1-7)
• AVG(rating) per session

RECOMMENDED TEMPLATE PLACEHOLDERS:
──────────────────────────────────
{{params.FIRSTNAME}}      - "Sarah"
{{params.SESSION_TITLE}}  - "RAG at Scale"
{{params.SESSION_FORMAT}} - "Talk" / "Workshop"
{{params.AVG_RATING}}     - "6.2"
{{params.FEEDBACK_QUOTE}} - Best comment (optional)
{{params.EVENT_NAME}}     - "Data & AI Community Day Durban"
{{params.EVENT_DATE}}     - "March 15, 2025"

Create your template in Brevo using these placeholders, then tell 
me the template ID.
```
{{< gen-cap "Code Snippet 20" "Claude Code's Template Placeholder Recommendations" >}}

### Building in Brevo's Drag-and-Drop Editor

Armed with Claude Code's recommendations, I created the template in Brevo:

1. Navigate to **Templates → Email Templates → New Template**
2. Choose "Drag & Drop Editor"
3. Design the email with placeholders:

```html
Hi {{params.FIRSTNAME}},

Thank you for presenting "{{params.SESSION_TITLE}}" at 
{{params.EVENT_NAME}}!

Your {{params.SESSION_FORMAT}} received an average rating of 
{{params.AVG_RATING}}/7 from attendees.

[... rest of template with call-to-action for next year ...]

Best regards,
The Data & AI Community Day Team
```
{{< gen-cap "Code Snippet 21" "Template with Personalization Placeholders" >}}

{{< imgfig2 "/images/posts/claude-code-10-X.png" "Figure 3: " "Creating Email Template in Brevo Editor" >}}

4. Save and note the **Template ID** (e.g., `27`)

### Registering the Template with Claude Code

Back in Claude Code, I documented the template:

```
I created a speaker thank-you template in Brevo with ID 27.
Placeholders: FIRSTNAME, SESSION_TITLE, SESSION_FORMAT, AVG_RATING, 
EVENT_NAME, EVENT_DATE. Please note this for future reference.
```
{{< gen-cap "Code Snippet 22" "Registering Template with Claude Code" >}}

```
⏵ Template registered!

TEMPLATE: speaker-thank-you
ID: 27
PLACEHOLDERS:
  • FIRSTNAME - Contact's first name
  • SESSION_TITLE - From speaker_sessions
  • SESSION_FORMAT - talk/workshop/panel
  • AVG_RATING - Calculated from speaker_ratings
  • EVENT_NAME - From events table
  • EVENT_DATE - From events table

I can now compose the SQL query to gather all this data for a 
batch send. When you're ready to send, just say "send thank-you 
to March 2025 speakers" and I'll:
1. Query PostgreSQL for speaker data
2. Calculate average ratings
3. Format messageVersions with params
4. Send via Brevo transactional API
5. Log sends to campaign_sends table
```
{{< gen-cap "Code Snippet 23" "Claude Code Confirms Template Registration" >}}

{{< callout tip >}}
Brevo templates use `{{params.VARIABLE_NAME}}` syntax. The `params.` prefix is required—using just `{{VARIABLE}}` won't work for transactional sends.
{{< /callout >}}

---

## Adding Campaign Tracking to PostgreSQL

### Why We Need Tracking Tables

Before we start sending emails, we need to answer questions like:
- "Who has already received this campaign?"
- "When did we last email this contact?"
- "What was the response rate for our CFP announcement?"

Brevo tracks some of this, but remember—we're using transactional mode, so Brevo sees individual emails, not campaigns. We need our own tracking. I asked Claude Code to design the schema:

```
Design campaign tracking tables for our email system. Requirements:
1. Track campaign metadata (name, type, template used)
2. Track individual sends (who received what, when)
3. Store Brevo message IDs for cross-reference
4. Support queries like "who hasn't been emailed in 30 days"

Follow our existing schema patterns from the contacts/events tables.
```
{{< gen-cap "Code Snippet 24" "Prompting Claude Code for Schema Design" >}}

### Claude Code's Schema Design

```
⏵ Designing campaign tracking schema...

Based on your requirements and existing schema patterns, here's my design:

┌─────────────────────────────────────────────────────────────────────┐
│ campaigns                                                           │
├─────────────────────────────────────────────────────────────────────┤
│ Tracks campaign-level metadata. One record per email blast.         │
│                                                                     │
│ • id, name, description                                             │
│ • campaign_type: cfp, registration, reminder, thank-you, announcement│
│ • event_id → links to specific event (nullable for general comms)  │
│ • template_id → Brevo template used                                │
│ • subject → email subject line (for reference)                     │
│ • status: draft, sent, cancelled                                   │
│ • sent_at, recipient_count                                         │
└─────────────────────────────────────────────────────────────────────┘
                              │
                              │ 1:many
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│ campaign_sends                                                      │
├─────────────────────────────────────────────────────────────────────┤
│ Tracks individual recipient records. One record per email sent.     │
│                                                                     │
│ • campaign_id → parent campaign                                    │
│ • contact_id → recipient (nullable for non-contact emails)         │
│ • email → actual email address sent to                             │
│ • sent_at → timestamp                                              │
│ • brevo_message_id → for Brevo tracking cross-reference            │
│ • status: queued, sent, delivered, opened, clicked, bounced        │
│                                                                     │
│ UNIQUE(campaign_id, contact_id) → prevent duplicate sends          │
└─────────────────────────────────────────────────────────────────────┘

This supports your queries:
────────────────────────────
• "Who received campaign X?" 
  → SELECT contact_id FROM campaign_sends WHERE campaign_id = X

• "Who hasn't been emailed in 30 days?"
  → SELECT c.* FROM contacts c 
    WHERE c.id NOT IN (
      SELECT contact_id FROM campaign_sends 
      WHERE sent_at > NOW() - INTERVAL '30 days'
    )

• "What campaigns has Jane received?"
  → SELECT cp.* FROM campaigns cp
    JOIN campaign_sends cs ON cs.campaign_id = cp.id
    WHERE cs.contact_id = (SELECT id FROM contacts WHERE email = 'jane@...')

Shall I generate the CREATE TABLE statements?
```
{{< gen-cap "Code Snippet 25" "Claude Code's Campaign Schema Design" >}}

```
Yes, generate the SQL and execute it against our database.
```
{{< gen-cap "Code Snippet 26" "Confirming Schema Creation" >}}

Claude Code generated and executed:

```sql
-- Campaign definitions
CREATE TABLE campaigns (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    campaign_type VARCHAR(50) NOT NULL,
    description TEXT,
    event_id INTEGER REFERENCES events(id),
    template_id INTEGER,
    subject VARCHAR(500),
    status VARCHAR(20) DEFAULT 'draft',
    created_at TIMESTAMP DEFAULT NOW(),
    sent_at TIMESTAMP,
    recipient_count INTEGER DEFAULT 0
);

-- Individual send records
CREATE TABLE campaign_sends (
    id SERIAL PRIMARY KEY,
    campaign_id INTEGER REFERENCES campaigns(id),
    contact_id INTEGER REFERENCES contacts(id),
    email VARCHAR(255) NOT NULL,
    sent_at TIMESTAMP DEFAULT NOW(),
    brevo_message_id VARCHAR(255),
    status VARCHAR(20) DEFAULT 'sent',
    UNIQUE(campaign_id, contact_id)
);

-- Indexes for common queries
CREATE INDEX idx_campaign_sends_campaign ON campaign_sends(campaign_id);
CREATE INDEX idx_campaign_sends_contact ON campaign_sends(contact_id);
CREATE INDEX idx_campaigns_event ON campaigns(event_id);
CREATE INDEX idx_campaigns_type ON campaigns(campaign_type);
```
{{< gen-cap "Code Snippet 27" "Campaign Tracking Schema SQL" >}}

```
⏵ Executing schema changes via Postgres MCP...

✅ Table 'campaigns' created
✅ Table 'campaign_sends' created  
✅ 4 indexes created

Schema updated. You now have campaign tracking ready.
```
{{< gen-cap "Code Snippet 28" "Schema Creation Confirmation" >}}

---

## Sending Our First Email

### The Test Send

Time for the moment of truth. In Claude Desktop (where Brevo MCP is running), I asked:

```
Send a test email to niels.it.berglund@gmail.com using the 
speaker-thank-you template (ID 27). Use these test values:
- FIRSTNAME: Niels
- SESSION_TITLE: Building AI-Native Systems
- SESSION_FORMAT: Talk
- AVG_RATING: 6.5
- EVENT_NAME: Data & AI Community Day Durban
- EVENT_DATE: March 15, 2025
```
{{< gen-cap "Code Snippet 29" "Test Email Request" >}}

Claude Desktop orchestrated the send:

```
I'll send a test email using the Brevo transactional API.

[Calling send_email via Brevo MCP]

Request:
─────────
to: [{ email: "niels.it.berglund@gmail.com", name: "Niels" }]
templateId: 27
params: {
  FIRSTNAME: "Niels",
  SESSION_TITLE: "Building AI-Native Systems",
  SESSION_FORMAT: "Talk",
  AVG_RATING: "6.5",
  EVENT_NAME: "Data & AI Community Day Durban",
  EVENT_DATE: "March 15, 2025"
}

✅ Test email sent successfully!

Details:
────────
To: niels.it.berglund@gmail.com
Template: speaker-thank-you (ID: 27)
Message ID: <5f3a7b2c-1234-5678-abcd-ef1234567890@smtp-relay.brevo.com>

Check your inbox to verify the email looks correct. If the 
personalization placeholders didn't render, make sure your 
template uses {{params.VARIABLE_NAME}} format.
```
{{< gen-cap "Code Snippet 30" "Test Email Sent" >}}

I checked my inbox:

{{< imgfig2 "/images/posts/claude-code-10-X.png" "Figure 4: " "Received Test Email" >}}

The template rendered correctly with all the personalized values. Now for the real test.

### A Real Send: Thank-You to Speakers

This is where the AI-native magic happens. I don't need to export data, prepare a CSV, import to an email tool, or configure merge fields. I just ask:

```
Send thank-you emails to all speakers from the March 2025 event.
Use template 27. Create a campaign called "Speaker Thank You - March 2025"
and log all sends to the database.
```
{{< gen-cap "Code Snippet 31" "Real Batch Send Request" >}}

Watch Claude Desktop orchestrate across both MCP servers:

```
I'll send personalized thank-you emails to all March 2025 speakers.

STEP 1: Query speakers and their data
─────────────────────────────────────
[Calling execute_sql via Postgres MCP Pro]

SELECT 
    c.id as contact_id,
    c.email,
    c.first_name,
    ss.session_title,
    ss.session_format,
    e.name as event_name,
    e.event_date,
    ROUND(AVG(sr.topic_rating + sr.presentation_rating) / 2.0, 1) as avg_rating
FROM contacts c
JOIN speakers s ON s.contact_id = c.id
JOIN speaker_sessions ss ON ss.speaker_id = s.id
JOIN events e ON ss.event_id = e.id
LEFT JOIN speaker_ratings sr ON sr.session_id = ss.id
WHERE e.id = 5  -- March 2025 event
GROUP BY c.id, c.email, c.first_name, ss.session_title, 
         ss.session_format, e.name, e.event_date

Found 22 speakers:
┌────────────────────┬─────────────────────────────────┬─────────┐
│ Name               │ Session                         │ Rating  │
├────────────────────┼─────────────────────────────────┼─────────┤
│ Sarah Jones        │ RAG at Scale                    │ 6.2     │
│ John Smith         │ Building Data Pipelines         │ 5.8     │
│ Thabo Molefe       │ MLOps in Production             │ 6.5     │
│ ... (19 more)      │ ...                             │ ...     │
└────────────────────┴─────────────────────────────────┴─────────┘

STEP 2: Create campaign record
──────────────────────────────
[Calling execute_sql via Postgres MCP Pro]

INSERT INTO campaigns (name, campaign_type, event_id, template_id, 
                       subject, status, recipient_count)
VALUES ('Speaker Thank You - March 2025', 'thank-you', 5, 27,
        'Thank you for speaking at Data & AI Community Day!', 
        'sending', 22)
RETURNING id;

Campaign ID: 1 created

STEP 3: Prepare personalized messageVersions
────────────────────────────────────────────
Building 22 message versions, each with personalized params...

STEP 4: Send via Brevo
──────────────────────
[Calling send_email via Brevo MCP]

Sending batch with 22 messageVersions...

✅ Batch sent successfully!
   22 emails queued for delivery

Message IDs received:
- Sarah Jones: <msg-001@brevo.com>
- John Smith: <msg-002@brevo.com>
- ... (20 more)

STEP 5: Log sends to database
─────────────────────────────
[Calling execute_sql via Postgres MCP Pro]

INSERT INTO campaign_sends (campaign_id, contact_id, email, 
                            brevo_message_id, status)
VALUES 
  (1, 45, 'sarah@example.com', '<msg-001@brevo.com>', 'sent'),
  (1, 67, 'john@example.com', '<msg-002@brevo.com>', 'sent'),
  ... (20 more rows)

STEP 6: Update campaign status
──────────────────────────────
[Calling execute_sql via Postgres MCP Pro]

UPDATE campaigns SET status = 'sent', sent_at = NOW() WHERE id = 1;

════════════════════════════════════════════════════════════════════

✅ CAMPAIGN COMPLETE: "Speaker Thank You - March 2025"

Summary:
────────
• Recipients: 22 speakers
• Template: speaker-thank-you (ID: 27)  
• Campaign ID: 1
• Status: All emails queued successfully
• Logged: 22 records in campaign_sends

All 22 speakers will receive personalized thank-you emails with 
their session title and rating. Would you like to see the full 
recipient list or campaign details?
```
{{< gen-cap "Code Snippet 32" "Complete Batch Send Orchestration" >}}

That's **one natural language command** replacing what would have been:
1. Export speaker data from database
2. Calculate average ratings in Excel
3. Import to email tool
4. Configure mail merge
5. Test
6. Send
7. Export send log
8. Import back to database

All of that complexity is now handled by Claude orchestrating two MCP servers.

---

## The Complete Workflow

### Understanding the Orchestration

Let me ask Claude Code to explain what just happened:

```
Can you summarize the workflow that just occurred? I want to document 
how the MCP servers coordinated.
```
{{< gen-cap "Code Snippet 33" "Asking Claude Code to Explain the Orchestration" >}}

```
⏵ Workflow Analysis: Multi-MCP Email Send

Here's what happened when you said "send thank-you to speakers":

┌─────────────────────────────────────────────────────────────┐
│  1. USER REQUEST                                            │
│     "Send thank-you emails to March 2025 speakers"          │
└─────────────────────────┬───────────────────────────────────┘
                          │ Claude interprets intent
                          ▼
┌─────────────────────────────────────────────────────────────┐
│  2. POSTGRES MCP PRO: Data Gathering                        │
│     ─────────────────────────────────                       │
│     Query: SELECT speakers + sessions + ratings             │
│     Result: 22 speakers with personalization data           │
│     Time: ~200ms                                            │
└─────────────────────────┬───────────────────────────────────┘
                          │ Data flows to Claude
                          ▼
┌─────────────────────────────────────────────────────────────┐
│  3. POSTGRES MCP PRO: Campaign Tracking                     │
│     ─────────────────────────────────                       │
│     INSERT: Create campaign record                          │
│     Result: Campaign ID = 1                                 │
│     Time: ~50ms                                             │
└─────────────────────────┬───────────────────────────────────┘
                          │ Claude prepares batch
                          ▼
┌─────────────────────────────────────────────────────────────┐
│  4. CLAUDE: Message Preparation                             │
│     ─────────────────────────────                           │
│     For each speaker, create messageVersion with:           │
│     - to: [{ email, name }]                                │
│     - params: { FIRSTNAME, SESSION_TITLE, RATING, ... }    │
│     Result: 22 personalized message versions                │
└─────────────────────────┬───────────────────────────────────┘
                          │ Batch ready
                          ▼
┌─────────────────────────────────────────────────────────────┐
│  5. BREVO MCP: Email Delivery                               │
│     ──────────────────────                                  │
│     API Call: send_email with 22 messageVersions            │
│     Result: 22 emails queued, message IDs returned          │
│     Time: ~1.5s                                             │
└─────────────────────────┬───────────────────────────────────┘
                          │ Message IDs returned
                          ▼
┌─────────────────────────────────────────────────────────────┐
│  6. POSTGRES MCP PRO: Audit Logging                         │
│     ────────────────────────────                            │
│     INSERT: 22 rows into campaign_sends                     │
│     UPDATE: Campaign status = 'sent'                        │
│     Time: ~100ms                                            │
└─────────────────────────┬───────────────────────────────────┘
                          │ 
                          ▼
┌─────────────────────────────────────────────────────────────┐
│  7. USER RESPONSE                                           │
│     "✅ 22 emails sent, campaign logged"                    │
└─────────────────────────────────────────────────────────────┘

TOTAL TIME: ~2 seconds
MCP CALLS: 4 (2 queries, 1 send, 1 batch insert)
MANUAL STEPS REPLACED: 8

This is the power of MCP orchestration—multiple tools coordinated 
through natural language, each doing what it does best.
```
{{< gen-cap "Code Snippet 34" "Claude Code's Orchestration Explanation" >}}

### Why This Matters

This is the AI-native vision from Part 3 fully realized:

**Before (traditional approach):**
1. Export contacts from database
2. Import to email tool
3. Build segment manually
4. Create campaign
5. Configure personalization
6. Test
7. Send
8. Export results back to database

**After (AI-native approach):**
1. Ask Claude to send emails
2. Done.

The complexity hasn't disappeared—it's been absorbed by the conversational layer. Claude orchestrates multiple MCP servers, composes queries, handles API calls, and manages state across systems. **You never leave the conversation.**

---

## Handling the 300/Day Limit

### Asking Claude Code About Limits

I wanted to understand how to work within the free tier constraints:

```
How should we handle the 300 emails/day limit on the free plan? 
What if I need to send to 500 people?
```
{{< gen-cap "Code Snippet 35" "Asking About Free Tier Limits" >}}

```
⏵ Brevo Free Plan Limit Strategy

CURRENT LIMITS:
───────────────
• 300 emails per day (resets at midnight UTC)
• No rollover of unused emails
• "Sent with Brevo" branding on all emails

YOUR TYPICAL VOLUMES:
────────────────────
| Scenario              | Recipients | Days @ 300/day |
|─────────────────────--|────────────|────────────────|
| Speaker thank-you     | 22         | 1 day ✅        |
| Attendee thank-you    | 287        | 1 day ✅        |
| CFP announcement      | 500        | 2 days         |
| Full contact blast    | 800+       | 3 days         |

STRATEGIES FOR LARGER SENDS:
───────────────────────────

1. AUTOMATIC BATCHING
   "Send CFP to all contacts, respecting the 300/day limit"
   → I'll send 300 today, queue remainder for tomorrow
   → Track in campaign_sends what's sent vs pending

2. PRIORITY SENDING
   "Send CFP to speakers first, then attendees"
   → Prioritize high-value contacts within daily limit
   → Continue with remaining contacts next day

3. CHECK REMAINING QUOTA
   Before sending, I can call get_account_info to check:
   → Remaining credits today
   → Adjust batch size accordingly

4. UPGRADE CONSIDERATION
   Brevo Starter: $9/month for 5,000 emails
   For quarterly events, this removes all friction

RECOMMENDATION:
──────────────
For your use case (quarterly events, ~300 per send):
• Free plan is usually sufficient
• Plan large sends across 2+ days
• Send speakers/VIPs first if splitting is needed

Want me to implement automatic batching logic for future sends?
```
{{< gen-cap "Code Snippet 36" "Claude Code's Limit Strategy" >}}

{{< callout tip >}}
If you need more than 300/day regularly, consider Brevo's Starter plan ($9/month for 5,000 emails). For our quarterly events, the free plan is sufficient with planning.
{{< /callout >}}

---

## What We've Accomplished

Let's recap what we built today:

### Technical Achievements

- ✅ Installed and configured `@houtini/brevo-mcp`
- ✅ Created email template with personalization
- ✅ Added campaign tracking tables to schema
- ✅ Sent first test email
- ✅ Sent batch personalized emails to real recipients
- ✅ Logged all sends for tracking

### The Bigger Picture

- ✅ Completed the communication half of our AI-native vision
- ✅ PostgreSQL remains single source of truth (no contact sync!)
- ✅ Full workflow: Import → Query → Email in one conversational interface

### By the Numbers

| Metric | Value |
|--------|-------|
| Setup time | ~30 minutes |
| Lines of custom code | 0 (used existing MCP server) |
| Time to send 22 personalized emails | ~2 minutes (including query) |
| Traditional approach | 30+ minutes |

---

## ~ Finally

Part 10 marks a significant milestone. The system we envisioned in Part 3 is now functional end-to-end:

1. **Import data** via conversational commands (Parts 6-9)
2. **Query and analyze** via natural language (Parts 4-5)  
3. **Send communications** via conversation (this post)

What used to require switching between multiple tools—database, Excel, email platform—now happens in a single conversation with Claude.

**The key insight:** By choosing transactional email over campaigns, we kept PostgreSQL as the single source of truth. No contact sync, no duplicate data, no complexity. The trade-off (no A/B testing) is worth the architectural simplicity.

**For email infrastructure:** The `@houtini/brevo-mcp` server handles the heavy lifting. We wrote zero email-related code, just configuration and templates.

### Your Turn

If you're following along:
1. Set up a Brevo account and get your API key
2. Create a simple email template with placeholders
3. Install `@houtini/brevo-mcp` and verify the connection
4. Send yourself a test email before going live
5. Remember the 300/day limit on the free plan

**Have questions or thoughts?**

- Ping me: [niels.it.berglund@gmail.com](mailto:niels.it.berglund@gmail.com)
- Follow on LinkedIn: [linkedin.com/in/nielsberglund](https://www.linkedin.com/in/nielsberglund/)

**Found this helpful?** Share it with your network! Email integration is a common need, and the MCP-based approach shown here is reusable for many projects.

See you in Part 11, where we build segmentation and campaign tracking! 🚀

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
- 🚀 Part 11: Segmentation & Campaign Tracking (coming soon)
- 📅 Part 12: AI-Assisted Marketing Engine

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

<!--
  {{< sub-title "<sub-title>" >}}
  {{< gen-cap "<code snippet/Table, etc>" "Title" >}}
  {{< imgfig2 "<image-path /images/posts/image.ext" "Fig Num: " "Caption" >}}
  {{< callout tip >}}
  {{< /callout >}}
-->

---

# Implementation Notes for Niels

## Sections to Write During Actual Implementation

The following sections need real content based on your actual implementation experience:

1. **Screenshots needed:**
   - Brevo API key location
   - Brevo template editor
   - Received test email
   - Transactional vs campaign architecture diagram

2. **Code snippets to capture:**
   - Actual Claude Desktop responses when testing connection
   - Real speaker query results
   - Actual batch send response
   - Any error handling scenarios

3. **Metrics to record:**
   - Actual setup time
   - Time to send batch emails
   - Any issues encountered

## Key Story Beats

1. **The "aha" moment:** When the first email arrives in your inbox
2. **The complexity absorption:** Traditional approach vs AI-native
3. **The single source of truth:** Why transactional > campaigns for this use case
4. **The free tier dance:** Planning around 300/day

## Potential Gotchas to Document

- API key format (must be `xkeysib-`)
- Sender verification requirements
- Template placeholder syntax (`{{params.X}}` not `{{X}}`)
- Free tier "Sent with Brevo" branding
- Rate limits on batch sends

## Part 11 Setup

End Part 10 by naturally leading into segmentation questions:
- "How do I know who's already received this?"
- "How do I avoid emailing the same person twice?"
- "How do I save this segment for reuse?"

These become the opening problems for Part 11.
