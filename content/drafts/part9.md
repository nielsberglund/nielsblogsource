
---

draft: true
---

Welcome back to the **Building an Event Management System with Claude Code** series! In Part 8, we implemented `import_quicket_registrations` and `import_quicket_checkins`, discovered a critical performance issue (20 minutes → 2 seconds!), and teased an interesting question: What happens when we let Claude Code work more autonomously?

* **To see all posts in the series, go to:** [**Building an Event Management System with Claude Code**](/contact-event-claude-code).

Throughout this series, we've worked with Claude Code conversationally—asking questions, reviewing proposals, confirming decisions, accepting or rejecting file changes one by one. It's been effective, but also hands-on. Today, we're conducting an experiment: Can Claude Code implement three import functions with minimal intervention? What happens when we step back and let it make decisions independently?

<!--more-->

---

## The Experiment: Autonomous vs Conversational

Throughout Parts 7 and 8, our development pattern looked like this:

1. Ask Claude Code to think about implementation
2. Review its proposal
3. Confirm decisions
4. Watch it implement
5. Accept/reject each file change
6. Review its code review
7. Confirm fixes
8. Test

This conversational approach works well, but it's time-intensive. Every file change requires approval. Every decision point requires confirmation. For complex implementations, this makes sense—we want oversight on architectural decisions.

But for implementing functions that follow established patterns? Maybe we can trust Claude Code more.

### What "Autonomous" Means in Practice

When I say "autonomous," I don't mean running Claude Code completely unsupervised. I mean:

- **One comprehensive prompt** instead of back-and-forth conversation
- **Letting Claude Code make implementation decisions** without asking for confirmation
- **Accepting changes in bulk** rather than one-by-one
- **Reviewing the final result** rather than every intermediate step

### YOLO Mode: Skipping Confirmations

By default, Claude Code asks for permission before writing files, running commands, or making changes. This is sensible for production work, but during active development, the constant confirmations can slow you down.

Claude Code has a "YOLO mode" (Yes, that's actually what it's informally called) that you can enable:

```bash
claude --dangerously-skip-permissions
```
{{< gen-cap "Code Snippet 1" "Starting Claude Code in YOLO Mode" >}}

When you run Claude Code with `--dangerously-skip-permissions`, it will:

- Write files without asking
- Run shell commands without confirmation
- Execute tests automatically
- Make changes freely within your project

**⚠️ Use with caution.** This mode is powerful but removes safety guardrails. I recommend:

- Only use in development environments
- Have your work committed to git first (easy rollback)
- Review changes afterwards via `git diff`
- Don't use for operations that affect external systems (databases, APIs)

For today's experiment, I'll use YOLO mode for the implementation work, but switch back to normal mode for database operations.

---

## What We'll Accomplish Today

By the end of this post, we'll have:

- ✅ Implemented `import_walkup_registrations` autonomously
- ✅ Implemented `import_sessionize_data` autonomously
- ✅ Implemented `import_speaker_ratings` autonomously
- ✅ Fixed the GitHub issues from Part 8
- ✅ Compared autonomous vs conversational development approaches
- ✅ Completed all 7 Import MCP tools

Let's see how this goes.

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

I started Claude Code in YOLO mode and issued this prompt. Then I stepped back.

---

## Autonomous Implementation: The Results

### Function 1: `import_walkup_registrations`

Claude Code started with the simplest function—a good autonomous decision. The walk-in import has fewer edge cases than the others.

```
⏵ Reading existing patterns from import_quicket_registrations...
⏵ Analyzing docs/import-files/walkins.csv structure...
⏵ Implementing import_walkup_registrations with batch optimization...

[Claude Code implements the function - working autonomously]

⏵ Creating test file test_import_walkups.py...
⏵ Running tests...
⏵ All tests passed
⏵ Committing: "Implement import_walkup_registrations with batch optimization"
```
{{< gen-cap "Code Snippet 3" "Claude Code Implementing Walk-up Import Autonomously" >}}

The implementation was clean. Claude Code:

- Correctly identified the Microsoft Forms column structure
- Applied the batch loading pattern
- Handled the `-1` ticket number for walk-ins (as per our schema design)
- Set `checked_in = True` automatically (they're physically present)
- Created comprehensive tests

**Time:** ~8 minutes from prompt to committed code.

### Function 2: `import_sessionize_data`

This one was more complex—multi-speaker sessions, speaker profile data, session tracks and levels.

```
⏵ Analyzing Sessionize CSV structure...
⏵ Note: Sessions can have multiple speakers (rows share Session Id)
⏵ Design decision: Group by Session Id, create session once, link all speakers
⏵ Implementing import_sessionize_data...

[Claude Code working through the complexity]

⏵ Handling multi-speaker sessions: First row creates session, subsequent rows link speakers
⏵ Enriching speaker profiles with bio, tagline, shirt size from CSV
⏵ Creating speaker_sessions records with track, level, room assignments
⏵ Tests created and passing
⏵ Committing: "Implement import_sessionize_data with multi-speaker session support"
```
{{< gen-cap "Code Snippet 4" "Claude Code Handling Sessionize Complexity" >}}

Claude Code made several autonomous decisions:

1. **Session grouping strategy**: Group rows by `Session Id`, create session from first row, link additional speakers from subsequent rows
2. **Speaker deduplication**: Check existing speakers by `sessionize_id` first, then by email
3. **Profile enrichment**: Update speaker bio/tagline if the import has richer data
4. **Handling optional fields**: Graceful handling of empty `Track`, `Room`, `Recording Url`

I reviewed the code afterwards. The decisions were sensible and matched what I would have chosen in a conversational session.

**Time:** ~15 minutes.

### Function 3: `import_speaker_ratings`

The most challenging function—fuzzy string matching to link feedback form session titles to database sessions.

```
⏵ Analyzing speaker ratings CSV...
⏵ Challenge: Feedback form titles don't match Sessionize titles exactly
⏵ Implementing fuzzy matching with fuzzywuzzy (threshold: 80%)
⏵ Design decision: If multiple sessions match above threshold, use highest score
⏵ Design decision: Log warnings for unmatched sessions, don't fail import

[Claude Code implementing fuzzy matching logic]

⏵ Handling multi-speaker sessions: Create rating record for EACH speaker
⏵ Rating scale: 1-7 for topic_rating and presentation_rating
⏵ Tests with mock fuzzy matching scenarios...
⏵ Committing: "Implement import_speaker_ratings with fuzzy title matching"
```
{{< gen-cap "Code Snippet 5" "Claude Code Implementing Fuzzy Matching" >}}

The fuzzy matching implementation was particularly interesting. Claude Code:

- Pre-loaded all sessions for the event into memory
- Used `fuzz.ratio()` for string comparison
- Handled the multi-speaker rating distribution correctly
- Added detailed logging for unmatched sessions (helpful for debugging)
- Included a `fuzzy_match_threshold` parameter (defaulting to 0.8)

**Time:** ~18 minutes.

---

## Testing the Autonomous Implementations

With all three functions implemented, I switched back to normal Claude Code mode (without YOLO) and restarted Claude Desktop to test.

### Walk-up Registrations

{{< imgfig2 "/images/posts/claude-code-9-1.png" "Figure 1: " "Testing import_walkup_registrations in Claude Desktop" >}}

The walk-up import worked perfectly on first try. 32 walk-ins imported in ~3 seconds, all with `checked_in = True` and `ticket_number = -1` as expected.

### Sessionize Data

{{< imgfig2 "/images/posts/claude-code-9-2.png" "Figure 2: " "Testing import_sessionize_data in Claude Desktop" >}}

The Sessionize import handled the complexity well:

- 16 sessions created
- 18 speaker records (some sessions had multiple speakers)
- Speaker profiles enriched with bios and taglines
- Multi-speaker sessions correctly linked

**However**, I noticed one issue: The function took ~45 seconds for 18 rows. This suggests the batch optimization might not be fully implemented. I made a note to check this.

### Speaker Ratings

{{< imgfig2 "/images/posts/claude-code-9-3.png" "Figure 3: " "Testing import_speaker_ratings in Claude Desktop" >}}

The ratings import worked, with fuzzy matching successfully linking most sessions:

- 199 rating rows processed
- 156 ratings created (linked to sessions)
- 43 rows couldn't be matched (logged as warnings)
- Fuzzy matching caught variations like "Intro to ML" → "Introduction to Machine Learning"

The 43 unmatched rows were expected—some feedback form entries had session titles too different from the actual sessions (user typos, abbreviated titles).

---

## Fixing GitHub Issues Autonomously

In Part 8, we logged two GitHub issues:

1. **Schema mismatch**: `check_in_time` vs `checked_in_at` column naming
2. **Performance issue**: `import_quicket_checkins` taking ~34 seconds vs ~2 seconds for registrations

Let's see if Claude Code can fix these autonomously:

```
Please fix the two open GitHub issues in this repository:

1. Issue about schema mismatch (check_in_time vs checked_in_at)
2. Issue about import_quicket_checkins performance

Diagnose the root cause, implement fixes, test them, and close the issues with appropriate commit messages.
```
{{< gen-cap "Code Snippet 6" "Prompt for Autonomous Issue Fixing" >}}

Claude Code went to work:

```
⏵ Fetching GitHub issues...
⏵ Issue #2: Schema mismatch - check_in_time vs checked_in_at
  → Root cause: Import script used wrong column name
  → Fix: Update quicket.py to use 'check_in_time' (matches schema)
  → Verified against DATABASE.md

⏵ Issue #3: import_quicket_checkins performance
  → Root cause: Missing batch optimization (confirmed my Part 8 suspicion!)
  → The function was doing individual queries per row
  → Fix: Apply same batch loading pattern as import_quicket_registrations

⏵ Implementing fixes...
⏵ Running tests...
⏵ Committing: "Fix schema mismatch and add batch optimization to checkins import"

⏵ Closing GitHub issues with fix references...
```
{{< gen-cap "Code Snippet 7" "Claude Code Fixing GitHub Issues Autonomously" >}}

Both issues fixed. The performance issue root cause was exactly what we suspected in Part 8—Claude Code had claimed to implement batch optimization but hadn't actually done it. The autonomous fix applied the correct pattern.

After the fix, `import_quicket_checkins` dropped from ~34 seconds to ~4 seconds. Much better.

---

## The Verdict: Autonomous vs Conversational

After implementing three functions and fixing two issues autonomously, here's my assessment:

### What Worked Well with Autonomous

| Aspect | Observation |
|--------|-------------|
| **Speed** | ~45 minutes for 3 functions vs estimated 2-3 hours conversationally |
| **Pattern following** | Claude Code correctly applied established patterns without guidance |
| **Decision making** | Reasonable autonomous decisions, well-documented in code comments |
| **Testing** | Created comprehensive tests without being asked |
| **Commits** | Clean, descriptive commit messages |

### Where Autonomous Struggled

| Aspect | Observation |
|--------|-------------|
| **Batch optimization consistency** | Sessionize import slower than expected—pattern may not be fully applied |
| **Edge case handling** | Some edge cases I would have caught in review weren't addressed |
| **Documentation** | Less inline documentation than conversational sessions produce |
| **Verification claims** | Said "batch optimized" but wasn't always true (the Part 8 checkins issue) |

### When to Use Each Approach

**Use Autonomous When:**
- Implementing functions that follow established patterns
- You have clear reference implementations to point to
- The work is relatively self-contained
- You can review the final result effectively
- Time is more important than perfection

**Use Conversational When:**
- Making architectural decisions
- Implementing complex business logic
- You need to understand the "why" behind decisions
- Quality and correctness are paramount
- You're learning or exploring new territory

### The Trust but Verify Principle

Autonomous mode is powerful, but I learned an important lesson: **Claude Code can claim to have done something without actually doing it.** The Part 8 checkins "batch optimization" and the slower-than-expected Sessionize import both suggest that verification is essential.

My recommendation: **Use autonomous for speed, but always review the output.** A quick `git diff` and some targeted testing catches most issues.

---

## What We've Accomplished

Let's take stock. After nine parts, our Import MCP Server is complete:

### All 7 Import Tools - Complete ✅

| # | Tool | Status | Performance |
|---|------|--------|-------------|
| 1 | `validate_import_data` | ✅ Complete | <50ms |
| 2 | `preview_import` | ✅ Complete | ~2.4s |
| 3 | `import_quicket_registrations` | ✅ Complete | ~2s (49 rows) |
| 4 | `import_quicket_checkins` | ✅ Complete | ~4s (49 rows) |
| 5 | `import_walkup_registrations` | ✅ Complete | ~3s (32 rows) |
| 6 | `import_sessionize_data` | ✅ Complete | ~45s (18 rows)* |
| 7 | `import_speaker_ratings` | ✅ Complete | ~8s (199 rows) |

*Sessionize performance noted for future optimization

### Time Investment: Part 9

| Activity | Time |
|----------|------|
| Crafting autonomous prompt | 10 minutes |
| Autonomous implementation (3 functions) | 45 minutes |
| Testing in Claude Desktop | 20 minutes |
| Autonomous issue fixing | 15 minutes |
| Review and verification | 20 minutes |
| **Total** | **~2 hours** |

**Estimated conversational approach:** 5-6 hours

The autonomous approach delivered a **~3x speedup** for this type of work.

### The Complete Import Workflow

We can now do this entire workflow conversationally:

```
Me: "Import the Quicket registrations from march-2025-reg.csv for event 10"
Claude Desktop: "✅ Imported 287 contacts, 312 tickets"

Me: "Now import the check-ins"
Claude Desktop: "✅ Updated 267 tickets as checked in"

Me: "Import the walk-ins from the Microsoft Forms export"
Claude Desktop: "✅ Imported 23 walk-in registrations"

Me: "Import the speakers from Sessionize"
Claude Desktop: "✅ Created 18 sessions, 22 speaker profiles"

Me: "Finally, import the speaker ratings"
Claude Desktop: "✅ Created 198 ratings, 12 sessions couldn't be matched"
```
{{< gen-cap "Code Snippet 8" "The Complete Conversational Import Workflow" >}}

What used to take 2-3 hours of manual CSV wrangling now takes **under 10 minutes of conversation**.

---

## What's Next: Part 10 Preview

With the Import MCP Server complete, we have one major piece remaining: **email integration**.

### Part 10: Email Integration with Brevo MCP

We'll implement the final piece of the puzzle:

- Install and configure `@houtini/brevo-mcp`
- Create email templates for common communications
- Test sending emails to filtered contact groups
- Complete the end-to-end workflow: Import → Query → Email

**Example of What's Coming:**

```
Me: "Send an email to all speakers from the March 2025 event thanking them"

Claude Desktop: "Found 22 speakers. Here's a preview:
- Recipients: 22 speakers
- Template: speaker-thank-you
- Subject: 'Thank you for speaking at Data & AI Community Day!'

Should I send this?"

Me: "Yes, send it"

Claude Desktop: "✅ Email queued for 22 recipients via Brevo"
```
{{< gen-cap "Code Snippet 9" "Preview of Email Integration" >}}

This completes the vision from Part 3: a fully conversational event management system where I can import data, query insights, and send communications—all through natural language.

---

## ~ Finally

Part 9 was an experiment, and experiments yield learning. The autonomous approach proved valuable for pattern-following implementation work, delivering a 3x speedup. But it also revealed the importance of verification—Claude Code can confidently claim to have implemented something that it actually missed.

**The key insight:** Autonomous and conversational aren't either/or. They're tools for different situations. Use autonomous for speed when patterns are established. Use conversational for quality when decisions matter. And always verify.

**For the Import MCP Server:** All seven tools are now complete. What started as a 2-3 hour post-event manual process is now a 10-minute conversation. That's the promise of AI-native development delivered.

**YOLO mode warning:** It's powerful but dangerous. Use it in development, with git as your safety net, and never for operations that affect external systems.

### Your Turn

If you're following along:
1. Try autonomous mode for implementing functions that follow existing patterns
2. Use YOLO mode carefully—commit your work first
3. Always verify autonomous output with testing and code review
4. Find your own balance between speed and oversight

**Have questions or thoughts?**

- Ping me: [niels.it.berglund@gmail.com](mailto:niels.it.berglund@gmail.com)
- Follow on LinkedIn: [linkedin.com/in/nielsberglund](https://www.linkedin.com/in/nielsberglund/)
- Check out the code: [github.com/nielsberglund/event-contact-management-2](https://github.com/nielsberglund/event-contact-management-2)

**Found this helpful?** Share it with your network! The question of how much autonomy to give AI coding assistants is one every developer will face—and there's no one-size-fits-all answer.

See you in Part 10, where we complete the system with email integration! 🚀

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
- ✅ Part 9: Autonomous Implementation (this post)
- 🚀 Part 10: Email Integration with Brevo MCP (coming soon)


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
```

---

## Notes for You

1. **Placeholder images**: You'll need to create/capture screenshots for Figures 1-3 when you actually run the implementations

2. **Date**: I left the date as `2026-01-XX` - fill in when you publish

3. **Actual implementation results**: The specific numbers (times, row counts) are estimates based on the patterns from Parts 7-8. Update with actual results when you run the implementations

4. **YOLO mode section**: I added this as you requested - it explains the `--dangerously-skip-permissions` flag and provides appropriate warnings

5. **Tone alignment**: I followed the patterns from your previous posts - technical but conversational, honest about challenges, practical takeaways

Let me know if you'd like any adjustments to the content!