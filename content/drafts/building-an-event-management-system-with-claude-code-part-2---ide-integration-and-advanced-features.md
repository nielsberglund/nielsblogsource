---
type: post
layout: "post"
title: "Building an Event Management System with Claude Code: Part 2 - IDE Integration and Advanced Features"
author: nielsb
date: 2025-07-30T18:09:38+02:00
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

Welcome back to our Claude Code development series! In Part 1, we successfully installed Claude Code on Windows and created our first AI-assisted Node.js application. Today, we're taking our development workflow to the next level by integrating Claude Code with popular IDEs and exploring advanced features that will significantly boost our productivity.

IDE integration represents a crucial step in adopting AI-assisted development. While the terminal interface is powerful, most developers spend their time in IDEs like VS Code or JetBrains products. By bringing Claude Code directly into our editor, we can leverage AI assistance without disrupting our established workflows.

At **Derivc**o, where we're implementing AI-assisted coding across development teams, IDE integration has proven to be where the most significant productivity gains occur. You're not just writing code faster; you're writing better, more maintainable code with a deeper understanding of your project's architecture.

<!--more-->

## Recap: Part 1 Accomplishments

Before exploring IDE integration, let's quickly review what we covered in our previous post:

🎯 **Project Foundation:** We established our motivation for building a custom event management system to replace **Brevo** for [**Data & AI Community Day Durban**][dataai] events, addressing limitations in generic event management platforms.

🛠️ **Installation Process:** We completed the full Claude Code installation on macOS/Windows, including:

* Windows Subsystem for Linux (WSL) setup
* `Node.js` installation using Node Version Manager (`nvm`)
* Claude Code installation via `npm`
* Authentication and initial configuration

🚀 **First Steps with Claude Code:** We explored the interactive shell, learned about different usage modes (REPL vs. non-interactive), and discovered essential shortcuts and commands for efficient operation.

💻 **Hands-On Development:** We created a simple `Node.js` "Hello World" application with an HTML frontend, demonstrating Claude Code's planning capabilities, file creation workflow, and collaborative development approach.

🔧 **Core Features:** We experienced Claude Code's task breakdown into manageable to-dos, file creation confirmation process, and automatic dependency management capabilities.

With this foundation in place, we're ready to explore more sophisticated development workflows.

## IDE Integration: Bringing AI Into Your Editor

Claude Code works great with any Integrated Development Environment (IDE) that has a terminal. Just run `claude`, and you’re ready to go. However, while the terminal interface is powerful, whether in the Claude Code interactive shell or in the terminal window of your IDE, most developers prefer working within their IDE, seeing source files being created, file diffs, and more. Claude Code offers excellent integration with popular editors, allowing you to leverage AI assistance without leaving your familiar environment.

> **NOTE:** In this post, we talk only about VSCode integration. The steps below work for all VSCode forks, such as Cursor, Windsurf, etc. For JetBrains IDEs, like IntelliJ, PyCharm, Android Studio, WebStorm, PhpStorm and GoLand, you can find detailed instructions in the [Claude Code documentation][1].

So, let's see how to integrate Claude Code into your VSCode workflow.

### VSCode Integration

VSCode users are in for a treat. Claude Code can work directly within VSCode, providing contextual assistance right where you need it.

{{< imgfig2 "<image-path /images/posts/image.ext" "Fig Num: " "Caption" >}}


## ~ Finally

That's all for now. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me if you have any suggestions. Your input is highly valued and can help shape the direction of our discussions. If you found this post helpful, please consider sharing it with your network. Follow me on [LinkedIn][nblin] for more updates on this project and other AI-related topics.

[ma]: mailto:niels.it.berglund@gmail.com

[nblin]: https://www.linkedin.com/in/nielsberglund/
[dataai]: https://aimldatadurban.org/


[1]: https://docs.anthropic.com/en/docs/claude-code/ide-integrations#jet-brains

<!--
  post reference
  [pkg1]: {{< relref "" >}}
-->  

<!--
{{< imgfig2 "<image-path /images/posts/image.ext" "Fig Num: " "Caption" >}}
-->

