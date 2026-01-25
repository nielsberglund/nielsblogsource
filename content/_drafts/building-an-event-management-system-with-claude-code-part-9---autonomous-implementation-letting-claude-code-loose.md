---
type: post
layout: "post"
title: "Building an Event Management System with Claude Code: Part 9 - Autonomous Implementation: Letting Claude Code Loose"
author: nielsb
date: 2026-01-24T11:43:05+02:00
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
description: "Part 9: Test autonomous Claude Code by implementing 3 import functions with minimal guidance. Compare results with conversational development. Includes YOLO mode, fixing GitHub issues, and lessons on when to let AI work independently."
---

Welcome back to the **Building an Event Management System with Claude Code** series! In Part 8, we implemented `import_quicket_registrations` and `import_quicket_checkins`, discovered a critical performance issue (20 minutes → 2 seconds!), and teased an interesting question: What happens when we let Claude Code work more autonomously?

* **To see all posts in the series, go to:** [**Building an Event Management System with Claude Code**](/contact-event-claude-code).

Throughout this series, we've worked with Claude Code conversationally, asking questions, reviewing proposals, confirming decisions, and accepting or rejecting file changes one by one. It's been effective, but also hands-on. Today, we're conducting an experiment: Can Claude Code implement three import functions with minimal intervention? What happens when we step back and let it make decisions independently?

<!--more-->

---

## The Experiment: Autonomous vs Conversational

Looking at the previous parts, our development pattern looked something like this:

1. Ask Claude Code to think about implementation
2. Review its proposal
3. Confirm decisions
4. Watch it implement
5. Accept/reject each file change
6. Review its code review
7. Confirm fixes
8. Test

This conversational approach works well, but it's time-intensive. Every file change requires approval. Every decision point requires confirmation. For complex implementations, this makes sense; we want oversight on architectural decisions.

But for implementing functions that follow established patterns? Maybe we can trust Claude Code more.

### What "Autonomous" Means in Practice

When I say "autonomous," I don't mean running Claude Code completely unsupervised. I mean:

- **One comprehensive prompt** instead of back-and-forth conversation
- **Letting Claude Code make implementation decisions** without asking for confirmation
- **Accepting changes in bulk** rather than one-by-one
- **Reviewing the final result** rather than every intermediate step

### YOLO Mode: Skipping Confirmations

By default, Claude Code asks for permission before writing files, running commands, or making changes. This is sensible for production work, but during active development, the constant confirmations can slow you down.

Claude Code has a "YOLO mode" (Yes, that's actually what it's informally called) that you enable with the `--dangerously-skip-permissions` flag at startup. I started Claude Code:

``` bash
claude --continue --dangerously-skip-permissions
```
{{< gen-cap "Code Snippet 1" "Starting Claude Code in YOLO Mode" >}}

When I executed the code in *Code Snippet 1*, Claude Code gave me a warning:

{{ < imgfig2 "/images/posts/claude-code-9-1.png" "Figure 1: "  "Starting Claude Code in YOLO Mode" >}}

Claude Code basically asked me if I knew what I was doing, and wanted to make sure I understood the risks. After confirming, it started up normally.

When you run Claude Code with `--dangerously-skip-permissions`, it will:

- Write files without asking
- Run shell commands without confirmation
- Execute tests automatically
- Make changes freely within your project

**⚠️ Use with caution.** This mode is powerful but removes safety guardrails. It is no accident that YOLO stands for "You Only Live Once"! I recommend:

- Only use in development environments
- Have your work committed to git first (easy rollback)
- Review changes afterwards via `git diff`
- Don't use for operations that affect external systems (databases, APIs)

For today's experiment, I'll use YOLO mode for implementation, then switch back to normal mode for database operations.

---

## What We'll Accomplish Today

By the end of this post, we'll have:

- ✅ Implemented `import_walkup_registrations` autonomously
- ✅ Implemented `import_sessionize_data` autonomously
- ✅ Implemented `import_speaker_ratings` autonomously
- ✅ Fixed the GitHub issues from Part 8
- ✅ Compared autonomous vs conversational development approaches
- ✅ Completed all 7 Import MCP tools

My caveat from Part 8 still stands: "*My track record of covering what I say we'll cover is not the best, so don't be surprised if we don't get to everything today*". Let's see how this goes.

---

## The Autonomous Prompt

Instead of multiple back-and-forth exchanges, I crafted a single comprehensive prompt:

```
I want you to implement the three remaining import functions for the Import MCP Server:

1. import_walkup_registrations - For Microsoft Forms walk-in CSV
2. import_sessionize_data - For Sessionize speaker/session CSV  
3. import_speaker_ratings - For speaker evaluation CSV with fuzzy matching

Requirements:
- Follow the batch loading pattern from import_quicket_registrations (pre-fetch reference data, in-memory lookups, batch inserts)
- Use the same code structure and error handling patterns
- Reference the import analysis in docs/planning/import-analysis-and-recommendations.md for CSV column mappings
- Reference the sample CSV files in docs/import-files/
- Create or update tests for each function
- Commit each function separately with descriptive commit messages

For import_speaker_ratings, implement fuzzy matching using fuzzywuzzy to match session titles from the feedback form to sessions in the database (threshold 80%).

Do not ask me questions. Make reasonable decisions based on the existing codebase and patterns. If something is unclear, document your assumption in a code comment.

Go.
```
{{< gen-cap "Code Snippet 2" "The Autonomous Implementation Prompt" >}}

Notice what's different about this prompt:

- **"Do not ask me questions"** - Forces autonomous decision-making
- **Clear requirements** - Batch pattern, existing code structure, reference files
- **Specific guidance where needed** - Fuzzy matching threshold
- **"Go."** - Signals to start immediately without confirmation

I issued the prompt and let Claude Code run in YOLO mode.

---

## Autonomous Implementation: The Results

So Claude Code started running and as it went along it output to the terminal:

```
✔ Task #1 created: Implement import_sessionize_data
✔ Task #2 created: Implement import_speaker_ratings
✔ Task #3 created: Implement import_walkup_registrations
✔ Task #1 updated: status → in progress

[Claude Code read doumentation, code files, and data files]

● Now let me read the database schema and server.py to understand the full structure.

[Claude Code read files]

● Now I have all the context I need. Let me implement the three functions one by one, starting with
  import_sessionize_data.
```
{{< gen-cap "Code Snippet 3" "Claude Code Starting Autonomous Implementation" >}}

In *Code Snippet 3*, we see Claude Code creating tasks for each import function and reading the necessary files. It then begins implementing `import_sessionize_data`.

### Implementation of `import_sessionize_data`

This function is responsible for importing session and speaker data from Sessionize CSV files. The function is somewhat complex; multi-speaker sessions, speaker profile data, and session tracks. 

```
⏵ Analyzing Sessionize CSV structure...
⏵ Note: Sessions can have multiple speakers (rows share Session Id)
⏵ Design decision: Group by Session Id, create session once, link all speakers
⏵ Implementing import_sessionize_data...

[Claude Code working through the complexity]

⏵ Handling multi-speaker sessions: First row creates session, subsequent rows link speakers
⏵ Enriching speaker profiles with bio, tagline, shirt size from CSV
⏵ Creating speaker_sessions records with track, level, room assignments
```
{{< gen-cap "Code Snippet 4" "Claude Code Handling Sessionize Complexity" >}}

Claude Code made several autonomous decisions:

1. **Session grouping strategy**: Group rows by `Session Id`, create session from first row, link additional speakers from subsequent rows
2. **Speaker deduplication**: Check existing speakers by `sessionize_id` first, then by email
3. **Profile enrichment**: Update speaker bio/tagline if the import has richer data
4. **Handling optional fields**: Graceful handling of empty `Track`, `Room`, `Recording Url`

I reviewed the code afterwards. The decisions were sensible and matched what I would have chosen in a conversational session.

**Time taken**: ~2 minutes!

### Implementation of `import_speaker_ratings`

The most challenging function; fuzzy string matching to link feedback form session titles to database sessions.

```
● Now let me implement import_speaker_ratings with fuzzy matching.
✔ Task #1 updated: status → completed
✔ Task #2 updated: status → in progress

● Write(mcp-servers\import-mcp\src\import_mcp\tools\ratings.py)
  ⎿  Added 337 lines, removed 18 lines
       7  DEPENDENCY: Requires speaker_sessions records (run import_sessionize_data first)

⏵ Analyzing speaker ratings CSV...
⏵ Challenge: Feedback form titles don't match Sessionize titles exactly
⏵ Implementing fuzzy matching with fuzzywuzzy (threshold: 80%)
⏵ Design decision: If multiple sessions match above threshold, use highest score
⏵ Design decision: Log warnings for unmatched sessions, don't fail import

[Claude Code implementing fuzzy matching logic]

⏵ Handling multi-speaker sessions: Create rating record for EACH speaker
⏵ Rating scale: 1-7 for topic_rating and presentation_rating
```
{{< gen-cap "Code Snippet 5" "Claude Code Implementing Speaker Ratings With Fuzzy Matching" >}}

The fuzzy matching implementation was particularly interesting. Claude Code:

- Pre-loaded all sessions for the event into memory
- Handled the multi-speaker rating distribution correctly
- Added detailed logging for unmatched sessions (helpful for debugging)
- Included a `fuzzy_match_threshold` parameter (defaulting to 0.8)

**Time:** ~3 minutes.

### Implementation of `import_walkup_registrations`

The simplest of the three functions; importing walk-in registrations from a Microsoft Forms CSV:

```
● Now let me implement import_walkup_registrations.
✔ Task #2 updated: status → completed
✔ Task #3 updated: status → in progress

● Write(mcp-servers\import-mcp\src\import_mcp\tools\walkins.py)
  ⎿  Added 422 lines, removed 16 lines
       5  - import_walkup_registrations: Import walk-ins (10 columns, simplest format)
⏵ Reading existing patterns from import_quicket_registrations...
⏵ Analyzing docs/import-files/walkins.csv structure...
⏵ Implementing import_walkup_registrations with batch optimization...

[Claude Code implements the function - working autonomously]

⏵ Creating test file test_import_walkups.py...
⏵ Running tests...
⏵ All tests passed
⏵ Committing: "Implement import_walkup_registrations with batch optimization"
```
{{< gen-cap "Code Snippet 6" "Claude Code Implementing Walk-up Import Autonomously" >}}

The implementation was clean. Claude Code:

- Correctly identified the Microsoft Forms column structure
- Applied the batch loading pattern
- Handled the `-1` ticket number for walk-ins (as per our schema design)
- Set `checked_in = True` automatically (they're physically present)
- Created comprehensive tests

**Time:** ~2 minutes

### Committing and Finalising the Imports

With all three functions implemented, we are on the last lap:

```
✔ Task #3 updated: status → completed

● Now let me commit each implementation separately.

[Claude code commits each function with descriptive messages]

● Now let me update the documentation to reflect the completed implementations.

[Claude Code updates relevant docs files]

● Done. All three import functions have been implemented and committed separately.

Summary

  Implemented Functions
  Function: import_sessionize_data
  Lines: 617
  Key Features: Multi-speaker sessions, speaker enrichment (bio, tagline), batch loading
  ────────────────────────────────────────
  Function: import_speaker_ratings
  Lines: 337
  Key Features: Fuzzy matching (80% threshold), multi-speaker rating duplication, unmatched session
    tracking
  ────────────────────────────────────────
  Function: import_walkup_registrations
  Lines: 422
  Key Features: Phone cleanup (SA format), auto checked_in, sentinel ticket_number=-1
  ────────────────────────────────────────
  Function: Preview functions (validation.py)
  Lines: 255
  Key Features: Added preview_walkup_import and preview_ratings_import
  Commits (5 total)

  1. 746b8b5 - Implement import_sessionize_data with batch optimization
  2. 1e335e7 - Implement import_speaker_ratings with fuzzy matching
  3. b672a7a - Implement import_walkup_registrations for Microsoft Forms
  4. 08b5527 - Add preview support for walkup and ratings import types
  5. 1f31f18 - Update documentation: all 7 import tools now complete

  All Import Tools Now Complete

  - validate_import_data ✅
  - preview_import ✅
  - import_quicket_registrations ✅
  - import_quicket_checkins ✅
  - import_sessionize_data ✅
  - import_speaker_ratings ✅
  - import_walkup_registrations ✅

  Phase 1 Progress: ~95% complete

✻ Churned for 8m 59s
``` 
{{< gen-cap "Code Snippet 7" "Claude Code Final Summary After Autonomous Implementation" >}}

In *Code Snippet 7*, we see what Claude Code did:

- Committed each function separately with clear messages
- Updated documentation to reflect the new implementations
- Summarised the work done, lines added, key features

Something it did without being prompted, was to update the preview functions in `validation.py` to include the new import types. Nice touch! All this without any back-and-forth and no intervation from me!

**Time:** for all three implementations plus commits and docs: ~9 minutes!

### Testing

What we didn't see though, was anythong about testing the functions against a real database, even though I asked for it in my prompt. So I asked Claude Code to run tests:

```
Now that the three import functions are implemented, please run tests against a real database instance. Use the sample CSV files in docs/import-files/ for testing. Report any failures and fix them as needed.
```
{{< gen-cap "Code Snippet 8" "Prompting Claude Code to Run Tests Against Real Database" >}}

Claude Code went ahead and started the test process:

```
[compactation happened so I don't have the full output here]

All done. Let me provide a summary of what was fixed and the current status.

● All import tool tests pass and fixes have been committed   03:04 PM  claude-opus-4-5-20251101
  and pushed.

  Summary of Fixes
  Tool: sessionize.py
  Bug: live_link column doesn't exist
  Fix: Removed all live_link references (database only has
  recording_link)
  ────────────────────────────────────────
  Tool: sessionize.py
  Bug: Duplicate key on speakers.contact_id
  Fix: Added deduplication via pending_speaker_contact_ids
  set
  ────────────────────────────────────────
  Tool: ratings.py
  Bug: overall_score column doesn't exist
  Fix: Removed overall_score (was dropped in migration 002)
  ────────────────────────────────────────
  Tool: walkins.py
  Bug: Invalid registration_source "forms"
  Fix: Changed to "walk-in" (per CHECK constraint)
  ────────────────────────────────────────
  Tool: walkins.py
  Bug: Invalid status "confirmed"
  Fix: Changed to "registered" (per CHECK constraint)
  Test Results
  Import: import_sessionize_data
  Status: ✅ Pass
  Details: 16 sessions, 16 speakers, multi-speaker handling
  works
  ────────────────────────────────────────
  Import: import_speaker_ratings
  Status: ✅ Pass
  Details: 247 ratings, 9 sessions matched via fuzzy
  matching (80% threshold)
  ────────────────────────────────────────
  Import: import_walkup_registrations
  Status: ✅ Pass
  Details: 32 walk-ins processed, phone validation working

✻ Crunched for 9m 40s

```
{{< gen-cap "Code Snippet 9" "Claude Code Running Tests Against Real Database" >}}

Shown in *Code Snippet 9*, is how Claude Code identified and fixed several issues, autonomously. Some were due to schema changes we made earlier (removing `overall_score`, changing `registration_source` values). Others were due to data issues (duplicate speakers). Claude Code fixed them all without any intervention!

> **NOTE:** One thing: "Do as I say, don't do as I do". Claude Code ran all the tests in YOLO mode, which meant Claude Code went ahead and made changes directly to the database without asking for confirmation. This is a risk of YOLO mode - always be cautious when using it with operations that affect external systems.

Now then, with all tests passing, we have successfully implemented the three remaining import functions autonomously! Let us now see if I messed up allowing Claude Code to work in YOLO mode. Let's test using Claude Desktop.

---

## Testing the Autonomous Implementations

Having restarted Claude Desktop to load in the latest changes for the Import MCP server, I started with some basic sanity checks:

{{ < imgfig2 "/images/posts/claude-code-9-2.png" "Figure 2: "  "What Tables have Data" >}}

I started with asking what tables had data. As shown in *Figure 2*, we can see that all tables except for `email_log` have data. This is expected since we haven't implemented email functionality yet. I asked some other questions around the data, like unique contacts, contact with the same email, etc. Everything looked good.

One thing that confused me what is highlighted in *Figure 2*, there are more contacts (84) than tickets (81). How is that possible? Instead of me logging onto the database and figuring out what SQL queries to execute, I asked Claude Desktop:

{{ < imgfig2 "/images/posts/claude-code-9-3.png" "Figure 3: "  "Discrepancy Between Contacts and Tickets" >}}

You see in *Figure 3* what I asked Claude Desktop and that Claude Desktop quickly identified the issue: speakers who haven't registered for tickets! I don't know how long it would have takne me to figure that out manually, but Claude Desktop did it in seconds.

Once again, this is the beauty of AI-native applications, I can focus on asking high-level questions and let the AI handle the low-level details.

### Testing the Three Import Functions

So far so good. Next, I wanted to test each of the three import functions individually.

> **NOTE:** For the individual tests I cleaned out all data from the database, except for the `events` table. I then re-imported registrations and checkins, as in Part 8. This ensured a clean slate for each import test.

I will not go into detail on each test here. However, I can confirm that all three import functions worked as more or less expected:

#### `import_sessionize_data`

- ✅ **Sessions created**: 16 unique sessions
- ✅ **Speakers created**: 16 speaker records
- ✅ **Contacts created**: 15 new contacts (1 speaker already existed - Jadean Wright)
- ✅ **Speaker-session links**: 18 (2 sessions have 2 speakers each)
- ✅ **Contact roles**: 55 total (speakers now have the "speaker" role)
- ✅ **No errors or warnings**

#### `import_walkup_registrations`

- ✅ **Contacts created**: 30 new walk-in attendees
- ✅ **Contacts updated**: 1 (Mohammed Farhaan Buckas - who was already a speaker)
- ✅ **Walk-in tickets created**: 32 (all auto-checked-in)
- ✅ **Tickets skipped**: 0
- ⚠️ **Phone validation warning**: 1 invalid phone number stored as-is

#### `import_speaker_ratings`

This was the most complex test due to fuzzy matching, and the performance suffered due to the computational complexity of fuzzy matching session titles and creating duplicate ratings for multi-speaker sessions. That is something to keep in mind for large datasets.

- ✅ **Evaluation records processed**: 199
- ✅ **Ratings created**: 223 (includes duplicates for multi-speaker sessions)
- ✅ **Multi-speaker ratings**: 24 (12 evaluations × 2 speakers each)
- ✅ **Sessions matched**: 9 unique sessions
- ✅ **Sessions unmatched**: 0 (perfect match rate!)
- ✅ **Unique speaker-session combinations rated**: 10

### Final Take

Overall, the autonomous implementations worked very well. Claude Code made sensible decisions, followed established patterns, and produced high-quality code. The few issues that arose during testing were quickly identified and fixed by Claude Code itself. There are some performance considerations with fuzzy matching, but for our dataset size, it was acceptable.

---

## Fixing GitHub Issues Autonomously

In Part 8, we logged two GitHub issues:

1. **Schema mismatch**: `check_in_time` vs `checked_in_at` column naming
2. **Performance issue**: `import_quicket_checkins` taking ~34 seconds vs ~2 seconds for registrations

Let's see if Claude Code can fix these autonomously:

```
Please fix two open GitHub issues in this repository:

1. Issue about schema mismatch (check_in_time vs checked_in_at)
2. Issue about import_quicket_checkins performance

Diagnose the root cause, implement fixes, test them, and close the issues with appropriate commit messages.
```










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
[part55]: {{< relref "2026-01-12-building-an-event-management-system-with-claude-code-part-55---schema-refinement-when-real-data-reveals-the-truth.md" >}}
[part6]: {{< relref "2026-01-14-building-an-event-management-system-with-claude-code-part-6---architecture-design-custom-import-mcp-server.md" >}}
[part7]: {{< relref "2026-01-18-building-an-event-management-system-with-claude-code-part-7---implementing-the-import-mcp-server.md" >}}

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

