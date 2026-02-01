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

## The Communication Architecture Decision

### Why Transactional, Not Campaigns?

[Explain the architectural decision we made in our research conversation]

When we designed this system back in Part 3, we chose Brevo specifically because it "doesn't require a contact database on its side." This was deliberate—we wanted PostgreSQL to be our single source of truth for contacts.

But here's the thing: most Brevo MCP servers (and Brevo's own campaign features) expect contacts to exist in Brevo's contact lists. That would mean:

1. Maintaining two contact databases (PostgreSQL + Brevo)
2. Syncing contacts before every send
3. Managing list membership alongside our own segmentation

Instead, we're using **transactional email mode**, which accepts recipients directly in the API call:

```
Query PostgreSQL → Get contact list → Send via Brevo API → Log in PostgreSQL
```

No sync. No duplicate data. PostgreSQL remains the single source of truth.

[Include diagram showing the transactional flow vs campaign flow]

{{< imgfig2 "/images/posts/claude-code-10-X.png" "Figure 1: " "Transactional vs Campaign Email Architecture" >}}

### What We Gain (and Lose)

**We gain:**
- Single source of truth (PostgreSQL)
- No contact sync complexity
- Full control over segmentation
- Simpler architecture

**We lose:**
- A/B testing (requires Brevo campaigns)
- Brevo's built-in automation workflows
- Campaign-level analytics in Brevo dashboard

For our use case—sending targeted emails to event participants—transactional mode is perfect. We'll build our own tracking in PostgreSQL.

---

## Setting Up Brevo

### Getting Your API Key

[Step-by-step with screenshots]

1. Log into your Brevo account at [app.brevo.com](https://app.brevo.com)
2. Navigate to **Settings → API Keys**
3. Create a new API key (or copy existing)
4. The key starts with `xkeysib-`

{{< imgfig2 "/images/posts/claude-code-10-X.png" "Figure 2: " "Brevo API Key Location" >}}

{{< callout tip >}}
Keep your API key secure! We'll store it in environment variables, never in code or committed files.
{{< /callout >}}

### Verifying Your Sender

[Explain sender verification requirements]

Brevo requires verified senders before you can send emails. You need either:
- A verified email address, OR
- A verified domain

For testing, a verified email address is sufficient. For production, consider verifying your domain for better deliverability.

```
I verified: events@dataai.community
```

---

## Installing @houtini/brevo-mcp

### The MCP Server Landscape

[Brief overview of the options we researched]

During our research, we found three viable Brevo MCP options:

| Option | Approach | Best For |
|--------|----------|----------|
| `@houtini/brevo-mcp` | Standard API key, local | Campaign-focused workflows |
| Official Brevo MCP | Hosted, MCP-specific key | Full Brevo ecosystem |
| `@samihalawa/brevo-mcp` | SDK-based, comprehensive | Multi-channel (SMS, WhatsApp) |

We chose `@houtini/brevo-mcp` because:
1. Uses standard API key (no special setup)
2. Well-documented campaign workflow
3. Supports transactional `send_email` with batch capabilities
4. MIT licensed, community maintained

### Configuration

[Show Claude Desktop config addition]

Add to your `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "brevo": {
      "command": "npx",
      "args": ["-y", "@houtini/brevo-mcp"],
      "env": {
        "BREVO_API_KEY": "xkeysib-your-api-key-here"
      }
    }
  }
}
```
{{< gen-cap "Code Snippet 1" "Brevo MCP Server Configuration for Claude Desktop" >}}

After adding, restart Claude Desktop.

### Verifying the Connection

[Test that it works]

Let's verify the connection. I asked Claude Desktop:

```
Show me my Brevo account info
```
{{< gen-cap "Code Snippet 2" "Testing Brevo MCP Connection" >}}

Claude Desktop responded:

```
[Claude Desktop calls get_account_info]

Your Brevo account:
- Email: niels@example.com
- Plan: Free
- Email credits: 300/day
- Sender: events@dataai.community (verified)

The connection is working! What would you like to do?
```
{{< gen-cap "Code Snippet 3" "Successful Brevo Connection" >}}

---

## Exploring the Brevo MCP Tools

### Available Tools

[List and explain the tools we'll use]

The `@houtini/brevo-mcp` server provides these tools:

**Account & Contacts:**
- `get_account_info` - Account details, plan, credits
- `get_contacts` - List contacts (we won't use this—our contacts are in PostgreSQL)
- `get_contact_analytics` - Engagement history

**Campaign Management:**
- `create_email_campaign` - Create campaigns with templates
- `update_email_campaign` - Modify campaigns
- `get_email_campaigns` - List campaigns
- `update_campaign_status` - Pause, resume, archive

**Sending:**
- `send_campaign_now` - Send to Brevo lists (not for us)
- `send_test_email` - Test before sending
- **`send_email`** - Transactional sending ← This is our workhorse

**Analytics:**
- `get_campaign_analytics` - Detailed metrics
- `get_campaigns_performance` - Compare campaigns
- `get_analytics_summary` - Dashboard view

### The send_email Tool

[Deep dive into our primary tool]

The `send_email` tool is the heart of our integration. It supports:

```javascript
send_email({
  // Direct recipients (no Brevo contact list needed!)
  to: [
    { email: "person@example.com", name: "Person Name" }
  ],
  
  // Content options
  templateId: 27,           // Use Brevo template
  // OR
  htmlContent: "<h1>...</h1>",  // Direct HTML
  
  // Personalization
  params: {
    FIRSTNAME: "Sarah",
    SESSION_TITLE: "RAG at Scale"
  },
  
  // Batch sending (up to 2000 recipients per call!)
  messageVersions: [
    { to: [...], params: {...} },
    { to: [...], params: {...} }
  ]
})
```
{{< gen-cap "Code Snippet 4" "send_email Tool Structure" >}}

Key limits:
- **2,000 total recipients** per API call
- **99 recipients** per message version
- **1,000 message versions** per call
- **300 emails/day** on free plan

---

## Creating Our First Email Template

### Using Brevo's Drag-and-Drop Editor

[Step-by-step template creation in Brevo]

Rather than generating HTML dynamically, we'll create templates in Brevo's visual editor. This gives us:
- Professional designs without HTML skills
- Easy updates without code changes
- Preview before sending
- Brevo handles responsive layout

I created a "Speaker Thank You" template:

1. Navigate to **Templates → Email Templates → New Template**
2. Choose "Drag & Drop Editor"
3. Design the email with placeholders:

```html
Hi {{params.FIRSTNAME}},

Thank you for presenting "{{params.SESSION_TITLE}}" at Data & AI Community Day Durban!

Your session received an average rating of {{params.RATING}}/7.

[... rest of template ...]
```
{{< gen-cap "Code Snippet 5" "Template with Personalization Placeholders" >}}

{{< imgfig2 "/images/posts/claude-code-10-X.png" "Figure 3: " "Creating Email Template in Brevo Editor" >}}

4. Save and note the **Template ID** (e.g., `27`)

### Template Placeholders

[Explain the params system]

Brevo templates use `{{params.VARIABLE_NAME}}` for personalization. These are populated from the `params` object in our API call.

Common placeholders we'll use:
- `{{params.FIRSTNAME}}` - Contact's first name
- `{{params.EVENT_NAME}}` - Event name
- `{{params.SESSION_TITLE}}` - Speaker's session title
- `{{params.RATING}}` - Session rating
- `{{params.REGISTRATION_DATE}}` - When they registered

---

## Adding Campaign Tracking to PostgreSQL

### The Schema Addition

[New tables for tracking email sends]

Before we send emails, we need to track what we've sent. Let's add tables using Claude Code:

```
Add email tracking tables to our schema:
1. campaigns - Campaign definitions  
2. campaign_sends - Individual recipient records

Follow the existing schema patterns. Include fields for:
- Campaign type (cfp, registration, reminder, thank-you)
- Status tracking
- Brevo message IDs for reference
```
{{< gen-cap "Code Snippet 6" "Prompting Claude Code for Schema Addition" >}}

Claude Code generated:

```sql
-- Campaign definitions
CREATE TABLE campaigns (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    campaign_type VARCHAR(50) NOT NULL,  -- cfp, registration, reminder, thank-you
    description TEXT,
    event_id INTEGER REFERENCES events(id),
    template_id INTEGER,  -- Brevo template ID
    subject VARCHAR(500),
    status VARCHAR(20) DEFAULT 'draft',  -- draft, sent, cancelled
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
    brevo_message_id VARCHAR(255),  -- For tracking
    status VARCHAR(20) DEFAULT 'sent',  -- sent, delivered, opened, clicked, bounced
    UNIQUE(campaign_id, contact_id)
);

-- Indexes for common queries
CREATE INDEX idx_campaign_sends_campaign ON campaign_sends(campaign_id);
CREATE INDEX idx_campaign_sends_contact ON campaign_sends(contact_id);
CREATE INDEX idx_campaigns_event ON campaigns(event_id);
CREATE INDEX idx_campaigns_type ON campaigns(campaign_type);
```
{{< gen-cap "Code Snippet 7" "Campaign Tracking Schema" >}}

[Show running the migration with Claude Code/Desktop]

---

## Sending Our First Email

### The Test Send

[Sending a test email to yourself]

Let's test the full flow. I asked Claude Desktop:

```
Send a test email to niels.it.berglund@gmail.com using the 
speaker-thank-you template (ID 27). Use these test values:
- FIRSTNAME: Niels
- SESSION_TITLE: Building AI-Native Systems
- RATING: 6.5
```
{{< gen-cap "Code Snippet 8" "Test Email Request" >}}

Claude Desktop:

```
[Calls send_email via Brevo MCP]

✅ Test email sent successfully!

Details:
- To: niels.it.berglund@gmail.com
- Template: speaker-thank-you (ID: 27)
- Message ID: <abc123@brevo.com>

Check your inbox to verify the email looks correct.
```
{{< gen-cap "Code Snippet 9" "Test Email Sent" >}}

{{< imgfig2 "/images/posts/claude-code-10-X.png" "Figure 4: " "Received Test Email" >}}

### A Real Send: Thank-You to Speakers

[The moment of truth - sending to real recipients]

Now let's send to actual speakers. First, I need to query who to send to:

```
Find all speakers from the March 2025 event and show me their 
names, emails, session titles, and average ratings.
```
{{< gen-cap "Code Snippet 10" "Querying Speakers for Email Send" >}}

Claude Desktop queries PostgreSQL:

```
[Queries via Postgres MCP Pro]

Found 22 speakers for March 2025:

| Name           | Email                  | Session                    | Avg Rating |
|----------------|------------------------|----------------------------|------------|
| Sarah Jones    | sarah@example.com      | RAG at Scale               | 6.2        |
| John Smith     | john@example.com       | Building Data Pipelines    | 5.8        |
| Thabo Molefe   | thabo@example.com      | MLOps in Production        | 6.5        |
| ...            | ...                    | ...                        | ...        |

Would you like me to send thank-you emails to these speakers?
```
{{< gen-cap "Code Snippet 11" "Speaker Query Results" >}}

Now the actual send:

```
Yes, send thank-you emails to all 22 speakers using template 27. 
Create a campaign called "Speaker Thank You - March 2025" and 
log all sends.
```
{{< gen-cap "Code Snippet 12" "Sending Thank-You Emails" >}}

Claude Desktop orchestrates:

```
[Creates campaign record in PostgreSQL]
[Prepares 22 personalized message versions]
[Calls send_email with batch messageVersions]
[Logs each send to campaign_sends table]

✅ Campaign "Speaker Thank You - March 2025" sent!

Summary:
- Recipients: 22 speakers
- Template: speaker-thank-you (ID: 27)
- Campaign ID: 1
- Status: All 22 emails queued successfully

Message IDs logged for tracking. Would you like to see the 
campaign details?
```
{{< gen-cap "Code Snippet 13" "Batch Send Complete" >}}

---

## The Complete Workflow

### What Just Happened

[Explain the full orchestration]

Let's trace what Claude Desktop did behind the scenes:

```
┌─────────────────────────────────────────────────────────────┐
│  1. User: "Send thank-you to March 2025 speakers"           │
└─────────────────────────┬───────────────────────────────────┘
                          ▼
┌─────────────────────────────────────────────────────────────┐
│  2. Postgres MCP: Query speakers + sessions + ratings       │
│     SELECT c.*, ss.session_title, AVG(sr.rating)            │
│     FROM contacts c                                          │
│     JOIN speakers s ON ...                                   │
│     WHERE event_id = 5                                       │
└─────────────────────────┬───────────────────────────────────┘
                          ▼
┌─────────────────────────────────────────────────────────────┐
│  3. Postgres MCP: Create campaign record                    │
│     INSERT INTO campaigns (name, type, event_id, ...)       │
└─────────────────────────┬───────────────────────────────────┘
                          ▼
┌─────────────────────────────────────────────────────────────┐
│  4. Brevo MCP: send_email with 22 messageVersions           │
│     - Each version has personalized params                   │
│     - Returns message IDs for each recipient                │
└─────────────────────────┬───────────────────────────────────┘
                          ▼
┌─────────────────────────────────────────────────────────────┐
│  5. Postgres MCP: Log each send to campaign_sends           │
│     INSERT INTO campaign_sends (campaign_id, contact_id,    │
│       email, brevo_message_id, ...)                          │
└─────────────────────────┬───────────────────────────────────┘
                          ▼
┌─────────────────────────────────────────────────────────────┐
│  6. User: "✅ 22 emails sent, campaign logged"              │
└─────────────────────────────────────────────────────────────┘
```
{{< gen-cap "Code Snippet 14" "Email Send Orchestration Flow" >}}

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

The complexity hasn't disappeared—it's been absorbed by the conversational layer. Claude Desktop orchestrates multiple MCP servers, composes queries, handles API calls, and manages state across systems.

---

## Handling the 300/Day Limit

### Planning Around Free Tier Constraints

[Practical advice for the limit]

The Brevo free plan limits us to 300 emails per day. For our events:

| Scenario | Recipients | Days Needed |
|----------|------------|-------------|
| Speaker thank-you | 22 | 1 day |
| Attendee thank-you | 287 | 1 day |
| CFP announcement | 500 | 2 days |
| Multiple campaigns same day | 300+ | Spread across days |

For larger sends, ask Claude to batch across days:

```
Send CFP announcement to all past attendees, but stay under 
300/day. Split across multiple days if needed.
```
{{< gen-cap "Code Snippet 15" "Handling Daily Limits" >}}

Claude can query how many have already been sent today and plan accordingly.

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
