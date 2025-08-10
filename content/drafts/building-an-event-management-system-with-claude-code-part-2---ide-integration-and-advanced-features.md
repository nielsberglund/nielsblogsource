---
type: post
layout: "post"
title: "Building an Event Management System with Claude Code: Part 2 - IDE Integration and Advanced Features"
author: nielsb
date: 2025-08-08T17:09:38+02:00
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

Welcome back to our Claude Code development series! In Part 1, we successfully installed Claude Code on both macOS and Windows and created our first AI-assisted `Node.js` application. Today, we're taking our development workflow to the next level by integrating Claude Code with popular IDEs and exploring advanced features that will significantly boost our productivity.

IDE integration represents a crucial step in adopting AI-assisted development. While the terminal interface is powerful, most developers spend their time in IDEs like VSCode or JetBrains products. By bringing Claude Code directly into our editor, we can leverage AI assistance without disrupting our established workflows.

At **Derivco**, where we're implementing AI-assisted coding across development teams, IDE integration has proven to be where the most significant productivity gains occur. You're not just writing code faster; you're writing better, more maintainable code with a deeper understanding of your project's architecture.

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

Claude Code works directly within VSCode, providing contextual assistance right where you need it. Setting up Claude Code in VSCode is a straightforward process. However, if you are on Windows and using WSL, you need to enable VSCode for WSL. Next section discusses this. If you are on macOS, you can skip this step and go directly to [Integrating Claude Code into VSCode](#integrating-claude-code-into-vscode).  

### VSCode & WSL

To enable seamless integration between VSCode (who runs in Windows) and WSL, you need to install the [Remote Development extension pack][2] in your VSCode. The Remote Development extension pack is the "secret tunnel" that lets VSCode treat your Linux distro as if it were native. The bundle installs a tiny VSCode Server inside WSL (and also gives you Remote-SSH, Dev Containers and Remote Tunnels), so all the heavyweight work, IntelliSense, debugging, Git ops, even running your test suite—executes in Linux while the UI stays snappy on Windows. That means no duplicated tool-chains, no path-translation weirdness, and perfect environment parity with the Ubuntu box you’ll eventually deploy to.

#### Install the Remote Development Extension Pack

To install the Remote Development extension pack, in VSCode:

{{< imgfig2 "/images/posts/remote-dev-ext-I.png" "Figure 1: " "Install the Remote Development Extension pack" >}}

As you see in *Figure 1* you:

1. Go to the Extensions view by clicking on the **Extensions** icon in the Activity Bar on the side of the window (outlined in blue)
2. Search for "remote" in the Extensions Marketplace (outlined in yellow).
3. Click on the "Install" button for the **Remote Development** extension pack (outlined in red).

After the installation is complete, you should see in VSCode in the bottom left corner something like so:

{{< imgfig2 "/images/posts/remote-dev-ext-II.png" "Figure 2: " "Open a Remote Window" >}}

You see in *Figure 2* the **Open a Remote Window** option, which allows you to connect to your WSL environment seamlessly:

{{< imgfig2 "/images/posts/remote-dev-ext-III.png" "Figure 3: " "Connect to WSL" >}}

Clicking on the **Open a Remote Window** in *Figure 2*, you will be prompted to, as in *Figure 3*, select the WSL distribution you want to connect to. Choose your desired distribution, and VSCode will start to connect to the WSL environment:

{{< imgfig2 "/images/posts/remote-dev-ext-IV.png" "Figure 4: " "VSCode Connecting to WSL" >}}

In *Figure 4* you see how VSCode connects to WSL, and after a short while it is connected:

{{< imgfig2 "/images/posts/remote-dev-ext-V.png" "Figure 5: " "VSCode Connected to WSL" >}}

Once connected, you will see, as in *Figure 5*, the WSL distribution name in the bottom left corner of the VSCode window (outlined in red), and the terminal used by your distribution (outlined in yellow). You can now open any folder or workspace within WSL. 

To verify this, let us go back to what we did in the previous post in the series. We created a folder called `claude-test` in our home directory. You can open this folder in VSCode by opening the **Explorer** view: 

{{< imgfig2 "/images/posts/remote-dev-ext-VI.png" "Figure 6: " "Open Folder in WSL" >}}

As in *Figure 6*, you open the folder by clicking on the **Open Folder** button (outlined in yellow), choose the folder (here outlined in red), and click **OK**:

{{< imgfig2 "/images/posts/remote-dev-ext-VII.png" "Figure 7: " "Open Folder in WSL" >}}

In *Figure 7*, you see the folder `claude-test` opened in VSCode, and you can now start working on your project directly in WSL.

### Integrating Claude Code into VSCode

Now, whether you are a macOS or Windows user using WSL, you are ready to integrate Claude Code into VSCode. The integration process is straightforward and allows you to leverage Claude Code's AI capabilities directly within your IDE. To integrate Claude Code into VSCode, you need to have the **Claude Code for VSCode** extension installed. The extension provides a seamless experience for using Claude Code within your IDE.

You can install the extension as you would any other extension, go to the Extensions view in VSCode, search for "Claude Code", and click on the **Install** button. Once the extension is installed, when you choose a source file in the Explorer view, you will see a new button in the top right corner of the editor window:

{{< imgfig2 "/images/posts/claude-code-vscode-button.png" "Figure 8: " "Claude Code Button in VSCode" >}}

Clicking on the button, outlined in red in *Figure 8* will open the Claude Code interactive shell within VSCode, allowing you to interact with Claude Code directly from your IDE:

{{< imgfig2 "/images/posts/claude-code-vscode-shell.png" "Figure 9: " "Claude Code Shell in VSCode" >}}

In *Figure 9*, you see the Claude Code interactive shell opened inside VSCode.You can now start typing commands and interacting with Claude Code just like you would in the terminal. Why is this good?

#### Context Aware Development

IDE integration's key advantage is context awareness. Claude Code doesn't just see isolated code snippets, it understands your entire project structure, including:

* Project dependencies and their usage patterns
* Existing middleware and architectural decisions
* Database models and their relationships
* Error handling patterns and conventions
* Code style and naming conventions

Let us look at some of this, but before we do that, we need to look at integral part of Claude Code: the `CLAUDE.md` file.

## CLAUDE.md

The `CLAUDE.md` file is a crucial component of Claude Code, think of it as a project README specifically for your AI assistant. It serves as a centralized knowledge base that contains important information about your project, including:

* Project goals and objectives
* Key architectural decisions
* Important design patterns and best practices
* Common pitfalls and how to avoid them
* Any other information that would be helpful for developers working on the project

You can place `CLAUDE.md` files in several locations:

* The root of your repo, or wherever you run claude from (the most common usage). Name it `CLAUDE.md` and check it into git so that you can share it across sessions and with your team (recommended), or name it `CLAUDE.local.md` and .gitignore it
* Any parent of the directory where you run claude. This is most useful for monorepos, where you might run claude from root/foo, and have `CLAUDE.md` files in both `root/CLAUDE.md` and `root/foo/CLAUDE.md`. Both of these will be pulled into context automatically
* Any child of the directory where you run claude. This is the inverse of the above, and in this case, Claude will pull in `CLAUDE.md` files on demand when you work with files in child directories
* Your home folder (`~/.claude/CLAUDE.md`), which applies it to all your claude sessions

So, how do you create a `CLAUDE.md` file?

### Create CLAUDE.md

There are a couple of ways you can create a `CLAUDE.md` file:

1. **Manually create the file**: You can create a new file named `CLAUDE.md` in your project's root directory (or any other appropriate location, as per above) and start adding content to it. This is the simplest method and gives you complete control over the file's contents. This is probably what you'd do if you create a completely new project from scratch.
2. **Use Claude Code to create the file**: You can ask Claude Code to create the `CLAUDE.md` file for you. This is particularly useful if you want to ensure that the file contains all the necessary information and follows best practices. For example, you can run the `/init` command in the Claude Code shell in the root of your project directory.

The `/init` command in Claude Code is used to initialize a new project. When you run this command, it analyzes your codebase and creates a `CLAUDE.md` file in the root directory of your project. This file contains essential context about your project, helping Claude better understand and assist with your code.

#### Create `CLAUDE.md` in our project

In the previous post, when we used Claude Code to create the **Hello World** `node.js` application, we did not create a `CLAUDE.md` file. So, let us do it now. If you have followed along in the last post and up to now; you should be in the IDE with the Claude Code shell open as in *Figure 9*. In the input text box of the Claude Code shell, type `/init`:

[{{< imgfig2 "/images/posts/claude-code-vscode-init-small.png" "Figure 10: " "Claude Code: Processing Input" >}}](/images/posts/claude-code-vscode-init-large.png)

Clicking **Enter** will start the process of creating the `CLAUDE.md` file, as in at the top of *Figure 10* (click on the image to see the full image). After a while you see that the process has come to an end and Claude Code is ready to create the `CLAUDE.md` file (outlined in blue in *Figure 10*). At this stage you can see the file by the side of the Claude Code shell:

{{< imgfig2 "/images/posts/claude-code-vscode-claude-md.png" "Figure 11: " "CLAUDE.md File" >}}

The `CLAUDE.md` file you see in *Figure 11* has not been created yet in the filesystem. It exists only in the context of the Claude Code shell. To create the file in the filesystem, you need to accept the changes as outlined in *Figure 10* (outlined in red and highlighted in yellow).

> **NOTE:** If you want more informatio about `CLAUDE.md` the article [**What's a Claude.md File? 5 Best Practices to Use Claude.md for Claude Code**](/https://apidog.com/blog/claude-md/) is definitely worth reading.

Now, let's get onto "brass-tacks" and see how to use Claude Code in your IDE.

## Using Claude Code in VSCode

Above we said how IDE integration's key advantage is context awareness. Claude Code doesn't just see isolated code snippets, it understands your entire project structure, making it a powerful tool for developers. This means you can leverage Claude Code's capabilities to get more relevant suggestions and insights based on the context of your project. Some use cases:

### Understand Code Base

One of Claude Code's most underappreciated superpowers is its ability to serve as an intelligent onboarding assistant for new team members. At Derivco, we've discovered that Claude Code can dramatically reduce the time it takes for new developers to become productive contributors, turning what used to be weeks of confusion into days of focused learning.

When a new developer joins a project, they often face an overwhelming amount of code and documentation. Claude Code can help them quickly understand the project's architecture, key components, and how everything fits together. For example, you can ask Claude Code to explain the purpose of a specific module or function, and it will provide a concise summary based on the code and comments.

Let us see this in practice, based on what we have been doing so far. The assumption is that you are in VSCode in the `claude-test` project and Claude Code is loaded as in *Figure 9*. In Claude Code's input text box enter:

```bash
Analyze this repository and explain the overall architecture, key components, and how they interact. Focus on the main data flow and business logic.
```
<figcaption><br><b>Code Snippet 1:</b><em>Claude Code Command</em></br></figcaption>

When you run this command, Claude Code will analyze the entire repository and provide a detailed explanation of the architecture, key components, and their interactions. This can be incredibly helpful for new developers trying to understand the codebase:

[{{< imgfig2 "/images/posts/claude-code-vscode-interrogate-I-small.png" "Figure 11: " "Claude Code: Processing Input" >}}](/images/posts/claude-code-vscode-interrogate-I-large.png)

In *Figure 11* you see part of Claude Code processing the input command (click in the image to see the full output). This involves analyzing the codebase, understanding the project structure, and generating a comprehensive response that addresses the user's query. The result is a clear and concise explanation of the architecture, key components, and their interactions, which can be invaluable for onboarding new developers and helping them get up to speed quickly.


## ~ Finally

That's all for now. I hope you find this information valuable. Please share your thoughts and ideas on this post, or [ping][ma] me if you have any suggestions. Your input is highly valued and can help shape the direction of our discussions. If you found this post helpful, please consider sharing it with your network. Follow me on [LinkedIn][nblin] for more updates on this project and other AI-related topics.

[ma]: mailto:niels.it.berglund@gmail.com

[nblin]: https://www.linkedin.com/in/nielsberglund/
[dataai]: https://aimldatadurban.org/


[1]: https://docs.anthropic.com/en/docs/claude-code/ide-integrations#jet-brains
[2]: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack

<!--
  post reference
  [pkg1]: {{< relref "" >}}
-->  

<!--
{{< imgfig2 "<image-path /images/posts/image.ext" "Fig Num: " "Caption" >}}
<figcaption><br><b>Code Snippet 15:</b> <em>Claude Code Command</em></br></figcaption>
-->

