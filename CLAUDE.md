# CLAUDE.md

This repo is the Hugo source for **nielsberglund.com**, Niels Berglund's technical blog (SQL Server, .NET, Kafka/streaming, Azure Data Explorer, AI/ML, Generative AI, Claude Code). Most of the work here is writing and editing blog posts in Markdown. There is very little code.

## Build and preview

```bash
hugo server -D        # local preview with drafts at http://localhost:1313
hugo                  # build the site into ../blogsite (publishDir)
```

- Hugo extended is installed via Homebrew (`/opt/homebrew/bin/hugo`).
- `publishDir = "../blogsite"`: the generated site goes to a sibling folder, not `public/`. Don't commit build output here.
- The theme `themes/hugo-theme-cleanwhite` is a git submodule. If it's empty, run `git submodule update --init` before building.
- `config.toml` mounts `../miscblogstuff/drafts` as `content/drafts`. The relative path works on both Windows and macOS, as long as `miscblogstuff` is a sibling folder of this repo. Drafts are built even without `-D`, so a draft with invalid front matter (such as a placeholder `date: 2026-04-XX`) breaks the whole build. Leave `date:` out of a draft until it has a real date.

## Layout

- `config.toml`: site config (cleanwhite params, top menu links, goldmark `unsafe = true` so raw HTML is allowed, `solarized-light` highlighting with line numbers, Mermaid enabled).
- `content/post/`: all blog posts (600+, from 2006 to now), as flat files named `YYYY-MM-DD-slug.md`. The slug is the lowercased title, with punctuation dropped and spaces turned into `-`, so " - " becomes `---`.
- `content/*.md`: standalone pages, including series index pages (`series.md`, `sql_server_2k16_r_services.md`, `contact-event-claude-code.md`, …) and `presentations.md`.
- `content/top/`: About, Archive and Disclaimer pages, linked from the top menu.
- `layouts/`: site overrides of the theme (partials, `render-link.html`, custom shortcodes).
- `static/images/banner/posts/` and `static/images/thumbnails/posts/`: per-post banner and thumbnail images.
- `static/images/posts/`: images used inside posts.
- `_scratchpad/`: working material (PDF exports, notes). It isn't part of the site.

## Front matter

Recent posts use YAML front matter like this:

```yaml
---
type: post
layout: "post"
title: Interesting Stuff - Week 44, 2026
author: nielsb
date: 2026-11-01T07:45:33+02:00
comments: false
highlight: true
draft: false
image: "/images/banner/posts/wrup-44-26.jpg"
thumbnail: "/images/thumbnails/posts/wrup-44-26.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Claude Code
description: "One-sentence summary used for SEO/cards."
---
```

- Dates are in South African time (`+02:00`).
- Older posts also have a `keywords:` list. Keep the YAML valid: watch for duplicated keys such as a doubled `categories:`.

## Post conventions

- Put `<!--more-->` after the intro paragraph(s). It marks the summary cut-off.
- Use **reference-style links** at the bottom of the file:
  - numbered refs for article links: `[1]: https://...`
  - named refs for recurring links: `[ma]: mailto:...`, `[iq]: https://www.infoq.com/`, `[ems]: ...`
  - internal links through `relref`: `[2]: {{< relref "2018-09-24-sql-server-2019-public-preview.md" >}}`
- Use `##` for section headings. `*italics*` mark product/feature names, and `**bold**` is used for emphasis and key terms.
- The voice is first person, conversational and opinionated, with British/South African spelling ("recognise", "colour").

### Weekly roundup ("Interesting Stuff - Week NN, YYYY")

This is the most common post type, and it's usually committed as `New blog-post:w-NN-YY.`.

- File: `YYYY-MM-DD-interesting-stuff---week-NN-YYYY.md`. Category: `roundup`.
- Images: `wrup-NN-YY.jpg` in both `static/images/banner/posts/` and `static/images/thumbnails/posts/`.
- Structure:
  1. A bold theme sentence and a short intro.
  2. `<!--more-->`, then `---`.
  3. Topic sections (`## Generative AI`, …). Each item is a bullet `* [**Title**][n]. ...` followed by indented paragraphs: a summary first, then Niels's own take, often ending with a question to the reader.
  4. An optional `## WIND (What Is Niels Doing)` section.
  5. `## ~ Finally`, the sign-off.
  6. Link references.

### Long-form and series posts

Example: "Building an Event Management System with Claude Code – Part N". These posts use the shortcodes below for figures and code captions, and link to the series index page.

## Custom shortcodes (`layouts/shortcodes/`)

| Shortcode | Usage |
|---|---|
| `imgfig2` | `{{< imgfig2 "/images/posts/foo.png" "Figure 1: " "Caption" >}}`: numbered figure (most used) |
| `imgfig` | `{{< imgfig "/images/posts/foo.png" "Caption" >}}` |
| `gen-cap` | `{{< gen-cap "Code Snippet 1" "Caption" >}}`: caption placed under a code block |
| `sub-title` | `{{< sub-title "text" >}}` |
| `callout` | `{{< callout tip >}}...{{< /callout >}}`, where the type is one of `tip`, `warning`, `note`, `info`, `danger`, `success` |
| `mermaid` | `{{< mermaid >}}graph TD; ...{{< /mermaid >}}` |

Figures and snippets are numbered in order within a post.

## Working guidelines

- Don't change published posts (dates, slugs or filenames) unless asked. Changing them breaks URLs.
- Keep edits to a post's prose in Niels's voice. Fix typos and grammar, but don't rewrite the style.
- Don't commit or push unless asked. Image binaries go in the same commit as their post.
- `.gitattributes` disables line-ending conversion (`* -text`), so keep whatever line endings a file already has.
