---
layout:     post
title:      "I Built a Mac App in a Language I Don't Know, for an OS I Barely Understand"
author:     "nielsb"
date:       2026-07-11T19:32:20+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/needle-1.png"
thumbnail: "/images/thumbnails/posts/needle-1.png"
categories:
    - macOS
    - Claude Code
tags:
    - Generative AI
    - Fable 5
    - Anthropic
    - AI Coding
    - macOS
    - Swift
description: "I've missed the Windows app Everything since switching to Mac. So I asked Claude Fable 5 to build it for me: Needle — instant file search for macOS, written in Swift, a language I don't know."
---

Up until 2021/22, I was a die-hard Windows user. Sure, I'd had brief "flings" with Mac and even Linux over the years ("this year is the year of Linux on the desktop..."; how many times have we heard that?), but I always came back to Windows.

Then, in 21/22, I was going to present at SQLBits in London. As I was packing, I tried to boot up my Microsoft Surface Laptop, which had been neglected during COVID and never used. Of course, it failed to boot. So I had to take my work Windows laptop to present from, and getting past all the built-in corporate security cr*p to actually present from it is a story for another day.

The presentation went fine, but the message was clear: I needed a new laptop. The MacBook Pro with Apple Silicon had just been released, so when I got back from London, I bought an M1.

---

## Three things I missed

Switching to a Mac was not as hard as I feared. But there were three things that really, really irritated me:

<!--more-->

* **The Mac Finder.:** What an utter piece of ... Give me Windows File Explorer any day!
* [**SysInternals ZoomIt:**][2] If you present, you know. There is nothing like it on the Mac.
* [**Everything:**][3] The app that indexes your hard drive (and other drives) and makes file searches super fast. Not "fast for search" fast. *Instant* fast.

Over time, I found the [Folders][1] app, which is about as close to File Explorer as I think I'll get on macOS. One down.

Then, about a week ago, [Mark Russinovich][4] posted on LinkedIn that he's releasing [ZoomIt as a Mac app][5], and that he'd used GenAI (GitHub Copilot and Opus 4.8) to build it. (Other SysInternals tools are apparently getting Mac versions too, all thanks to AI coding.) Two down.

Which left Everything. And Mark's post made me think: could I possibly build a Mac version of Everything *myself*?

## Enter Claude Code and Fable 5

Some context here: I have zero macOS knowledge. Zero. I have never written a line of macOS code in my life. I know nothing about how macOS handles file system indexing internally. My background is C#/.NET, SQL Server, and infrastructure.

So a couple of days ago, in between meetings at work, I asked Claude Code and Fable 5 to build me Everything for Mac. I told Claude Code what Everything was and how it worked, and pointed it to some of the Everything web pages so it could understand the behaviour I was after.

Here's the part that surprised me most. I expected the "toing and froing" to be me, the one who's used Everything for years, explaining to Claude Code what I wanted. It was often the other way around. Claude Code would tell *me* what I wanted, and how I wanted it: "an empty query should show all files", "clicking a column header should sort the entire result set, not just the visible rows", "content search should run last because it's the slow one, that's how Everything does it." It was as if Claude Code and Fable 5 knew Everything inside out. My job was less "specify the requirements" and more "confirm the requirements Claude Code already knew."

After a couple of sessions, I had a fully functional Everything for Mac.

I call it **Needle**. As in: find the Needle in the haystack.

{{< imgfig2 "/images/posts/needly-1.png" "Figure 1: " "Screenshot of Needle" >}}

It's written in Swift. And "under the hood" turned out to be far more serious than I expected. Claude Code and Fable 5 didn't just call some search API, it built the real thing:

* The initial scan uses `getattrlistbulk`, a low-level API that reads directory entries in bulk straight from the filesystem catalogue, parallelised across all CPU cores. A full scan of ~1,000,000 files takes about **8 seconds** on my M-series Mac.
* The index is then snapshotted to disk, so subsequent startups take about **10 milliseconds**. No rescanning.
* Live updates come from **FSEvents**, Apple's file system event notification API, roughly the macOS counterpart to the NTFS change journal that makes Everything so fast on Windows. Even better: macOS keeps a persistent event log, so changes made *while Needle isn't running* are replayed and reconciled on the next start. The index never goes stale.
* Search is accelerated with a trigram index: **0.02–0.5 milliseconds** for a single term over a million files. That is Everything-level instant.
* It even speaks Everything's query language: `ext:swift`, `size:>10mb`, `dm:today`, `!exclude`, quoted phrases, `content:` searches. And **⌥ + Space** summons it from anywhere, like a search-focused Spotlight replacement.

Do I understand all of that? Honestly, no. I can read the `README` Fable wrote and follow along, and I'm learning as I go, but `getattrlistbulk` and trigram posting lists were not in my vocabulary a couple of days ago. FSEvents could have been a Scandinavian furniture brand for all I knew. And yet, I have a working app that solves my problem, running on my machine, right now.

## What this actually means

Let me be clear about what I'm *not* claiming. Needle is not a product. I can't really debug it myself, yet. I don't know what I don't know about edge cases, and I wouldn't ship it to anyone else without a lot more work. Everything itself is the result of years of refinement by someone who deeply understands the Windows file system, and it shows. (And by the way, Everything is free, so this was never about money. A week ago, if there'd been a macOS pay-for version of Everything, I would happily have shelled out the dough)

But here's the thing: the constraint was never price. The constraint was **availability**. Nobody had built Everything for Mac. For years, my options were to live without it or learn Swift and macOS internals well enough to build it myself, which, realistically, means never.

That constraint is gone.

If a tool you rely on doesn't exist on your platform, you can now describe it to an AI, point it at documentation, iterate a bit, and get something that meets *your* requirements. Not everyone's requirements are yours. It may not be as robust or polished as software built by someone who lives and breathes the domain. But if it does what you need? Why not.

Mark Russinovich, one of the most accomplished Windows internals engineers on the planet, used GenAI to port ZoomIt to a platform outside his home turf. And a C#/.NET/SQL guy in Durban with no Swift knowledge whatsoever built a file search app for macOS between meetings. Both in the same couple of weeks.

The landscape for personal software has changed dramatically, and I don't think most people have realised it yet. The long tail of "apps that should exist but don't, because the market is too small" is about to get filled in, one frustrated user at a time.

**Question to you all:** Should I open-source Needle, warts and all? If yes, I'll link the repo.

Now, if you'll excuse me, I have some files to find. Instantly.



[1]: https://foldersapp.dev/
[2]: https://learn.microsoft.com/en-us/sysinternals/downloads/zoomit
[3]: https://www.voidtools.com/
[4]: https://www.linkedin.com/in/markrussinovich/
[5]: https://www.linkedin.com/posts/markrussinovich_are-you-a-macos-user-wishing-there-was-a-activity-7477874128805441536-qQ-A/
