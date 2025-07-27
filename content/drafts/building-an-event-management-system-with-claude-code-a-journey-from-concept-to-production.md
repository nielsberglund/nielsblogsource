---
type: post
layout: "post"
title: "Building an Event Management System with Claude Code: A Journey from Concept to Production"
author: nielsb
date: 2025-07-21T07:57:51+02:00
comments: true
highlight: true
draft: true
image: "/images/banner/posts/<file_name_incl_ext>"
thumbnail: "/images/thumbnails/posts/<file_name_incl_ext>"
categories:
  - Claude-Code
  - AI-Coding
tags:
  - Data & AI Community Day Durban
  - Generative AI
description: "test"
---

If you follow my blog or LinkedIn, you know I'm a co-organiser of the [**Data & AI Community Day Durban**][dataai] events. Juggling the practical challenges of organising events can be rewarding, but I'll admit that managing contacts and logistics comes with its share of headaches. If you've faced similar struggles, you're not alone.

This post launches a series detailing my journey to build an AI-driven contact and event management system. The goal is to efficiently manage contacts, streamline communications, and generate actionable reports for the [**Data & AI Community Day Durban**][dataai]. At **Derivco**, as an Architect Lead, my team leverages AI to accelerate development and tackle complexity. I am now applying these principles to this project and sharing the process here.

<!--more-->

## Problem Statement

[**Brevo**][1] (formerly Sendinblue) has been our event and contact management system for our **Data & AI Community Day Durban** events for a couple of years now, and it has been satisfactory. However, how we want to do things may not match fully how Brevo does it, so limitations have become apparent:

* Workflows too generic for our events.
* Limited flexibility for managing contacts and participants.
* Reporting lacks necessary insights for our needs.

The limitations above are some of the reasons I'm developing a new system. I'll explore these issues and their impact in more detail in a future post.

## Why Claude Code?

If you're not familiar with Claude Code, it's Anthropic's agentic command-line tool that allows developers to delegate coding tasks directly from their terminal. Think of it as having an AI pair programmer who can understand context, write code, run tests, and even help with debugging—all from your command line. The appeal for me is multifaceted:

* **Speed of development:** Instead of spending hours researching APIs or writing boilerplate code, I can focus on the business logic and user experience
* **Learning opportunity:** I can explore new technologies and patterns with AI assistance
* **Documentation:** Every interaction is naturally documented, making it easier to understand decisions later
* **Quality assurance:** AI can help catch potential issues early in the development process

So, what am I aiming for with this project? 

## Project Goals

Before diving into the installation, let me outline what I'm planning to build:

#### Core Features

* Event creation and management
* Contact management with segmentation
* Participant registration with custom fields
* Automated email communications
* Comprehensive reporting and analytics

The features may be developed in stages. Initially, communications and reporting/analytics might come later.

#### Technical Goals

Apart from leveraging Claude Code for rapid development, I have some technical goals for this project:

* Modern, responsive web application
* Clean, maintainable codebase
* Robust testing strategy
* Scalable architecture
* Security best practices

#### Documentation Goals

I want to document the entire process, from initial setup to deployment, so that others can learn from my experience and benefit from it. This includes:

* Share the entire development journey
* Demonstrate practical AI-assisted coding
* Provide insights for other developers
* Create a resource for event organizers

## Installing Claude Code

To get started with Claude Code, you'll need to install it on your machine (duh). The installation is slightly different depending on your operating system, so I'll cover the steps for both Mac and Windows.

> **Note:** Regardless of your OS, you need to have `Node.js` (version 18+) installed.

### Mac

Installing Claude Code on a Mac is simple. Open your terminal and follow these steps:

1. If needed, use Homebrew to install `Node.js`:

   ```bash
   brew install node
   ```
   **Code Snippet 1:** *Install Node.js on Mac*

1. Verify the `Node.js` version installed:
  
    ```bash
    node --version
    ```
    **Code Snippet 2:** *Check Node.js Version*

1. Run the install command for Claude Code:

   ```bash
   npm install -g @anthropic-ai/claude-code
   ```
   **Code Snippet 3:** *Install Claude Code*

1. Confirm installation by checking the version:

   ```bash
   claude --version
   ```
    **Code Snippet 4:** *Check Claude Code Version*

Claude Code is now installed. Unless you are interested in seeing how to install Claude Code on Windows, you can continue to [Initialising Claude Code](#initialising-claude-code).

### Windows

To install Claude Code on Windows, use either **Windows Subsystem for Linux** (WSL) or **Git for Windows**. This guide uses WSL. Open PowerShell as Administrator and:

1. Run the command to install WSL if it's not already installed:

   ```powershell
   wsl --install
   ```
   **Code Snippet 5:** *Install WSL*

  WSL installs a default Linux distribution (usually Ubuntu). During setup, you will be prompted for a default user account name. Enter a username and press Enter when prompted. If you miss this prompt, installation will pause until you respond.

   > **NOTE:** If you are on an older version of Windows (Windows 10), you may need to follow the manual installation steps from the [WSL documentation][2].

1. Once WSL is installed, open your WSL terminal from the Start menu (search for 'WSL' or 'Ubuntu').

1. Make sure your Linux distribution is up to date:

   ```bash
   sudo apt update && sudo apt upgrade -y
   ```
   **Code Snippet 6:** *Update Linux Distribution*

1. Install `curl` to be able to download packages, and `git` for "git stuff":

   ```bash
   sudo apt install curl git -y
   ```
   **Code Snippet 7:** *Install curl and git*

   > **NOTE:** Both curl and git might be part of the distro, so if you see a message like "curl is already the newest version", you can ignore it.

Once tools are installed, proceed to install Node.js and then Claude Code. Let us start with `Node.js`.

#### Installing Node.js 

We have already said that Claude Code requires `Node.js` version 18 or newer. Since we may want to use different versions of `Node.js` in our development projects, I recommend using `nvm` (Node Version Manager) to manage `Node.js` versions. Here are the steps (using the WSL/Ubuntu terminal from above):

1. Install `nvm` (Node Version Manager):

   ```bash
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
   ```
   **Code Snippet 8:** *Install nvm*

   Close and reopen your terminal to load `nvm`.

1. Verify that `nvm` is installed correctly:

   ```bash
   nvm -v
   ```
   **Code Snippet 9:** *Check nvm Version*

Having installed `nvm`, we can now install `Node.js`:

1. Install the latest long-term support (LTS) version of `Node.js`:

   ```bash
   nvm install --lts
   ```
   **Code Snippet 10:** *Install Node.js*

Next, install Claude Code.

#### Installing Claude Code

To install Claude Code, we will use the Node Package Manager (`npm`), which comes with `Node.js`.

1. We follow the same steps as for macOS to install Claude Code:

   ```bash
   # Install Claude Code
   npm install -g @anthropic-ai/claude-code
   ```
   **Code Snippet 11:** *Install Claude Code*

1. After installation, you verify it by running:

   ```bash
   claude --version
   ```
   **Code Snippet 12:** *Check Claude Code Version*

When I run the command in *Code Snippet 12*, I get the following output:

![](/images/posts/claude-code-win-1.png)

**Figure 1:** *Claude Code Version*

We have now successfully installed Claude Code, whether on Windows or Mac. Before we start using Claude Code and doing cool stuff with it, we need to configure/initialise it. This is a one-time setup that you will do when you run Claude Code for the first time.

## Initialising Claude Code

When you start Claude Code for the first time, it performs an initial setup, and here we examine what that entails.

1. In your terminal (on Windows use the WSL terminal) create a new directory for where you want to test Claude Code:

   ```bash
   mkdir claude-test
   cd claude-test
   ```
   **Code Snippet 13:** *Create Project Directory*


1. In the above directory, start Claude Code:
   ```bash
   claude
   ```
   **Code Snippet 14:** *Start Claude Code*

When you run the command above, it will start Claude Code's interactive shell. If this is the first time you run it, you will be asked to do some initial configuration as well as logging in to Anthropic. You will see output similar to the following:

![](/images/posts/claude-code-win-2.png)

**Figure 2:** *Claude Code Text Style*

As you see in *Figure 2*, Claude Code will ask you to choose text style. After choosing a text style, you will be asked how to log in to Anthropic:

![](/images/posts/claude-code-win-3.png)

**Figure 3:** *Claude Code Login Prompt*

Choose whether you want to log in using a subscription or by an API key. If you choose the subscription option, it will open your default web browser and ask you to authorize Claude Code to connect to your Claude chat account:

![](/images/posts/claude-code-auth.png)

**Figure 4:** *Claude Code Authentication Prompt*

You just click on the **Authorize** button outlined in red in *Figure 4*. Clicking on the button authenticates you against your Claude subscription and opens a new page with an authentication code:

![](/images/posts/claude-code-auth-2.png)

**Figure 5:** *Claude Code Authentication Code*

When you seleced the subscription option as per *Figure 3* the interactive shell changed to a form where you enter the authentication code:

![](/images/posts/claude-code-win-4.png)

**Figure 6:** *Claude Code Interactive Shell Authentication*

Enter your authentication code you received in the browser, and press `Enter`. 

> **NOTE:** If your browser doesn't open automatically (*Figure 3*), you can copy the URL from the terminal as in *Figure 6* (outlined in yellow), open the URL in a browser and you will see the same as in *Figure 4*, and go from there.

When you click `Enter` after entering the code, you will see a message confirming that you are logged in:

![](/images/posts/claude-code-win-5.png)

**Figure 7:** *Claude Code Login Confirmation*

Having logged in successfully you will see a message confirming that you are logged in, as in *Figure 7* above, and when you press `Enter` again, you are almost there:

![](/images/posts/claude-code-win-6.png)

**Figure 8:** *Claude Code Trust Files*

In *Figure 8* you are asked to trust the files in the current directory. This is a security measure to ensure that Claude Code can access the files it needs to work with. 

> **NOTE:** Whenever you start Clude Code in a new directory, you will be asked to trust the files in that directory.

You press `Enter` to trust the files:

![](/images/posts/claude-code-win-7.png)

**Figure 9:** *Claude Code CLI*

You are now in the Claude Code interactive shell.

## Using Claude Code

Claude Code is a powerful tool that can help you with various coding tasks. You can use it to generate code snippets, refactor code, write tests, and more. You can even ask it to create entire applications/systems based on your requirements. This is what we will do in subsequent posts in this series. For now however just do a couple of simple things to get a feel for how it works.

The assumption is that you are in the Claude Code intereactive shell as in *Figure 9*. If you are not, you can start it by running the command `claude` in your terminal.

Let's start by looking at what shortcutes there are. To list shortcuts you enter `?` in the Claude Code's textbox (highlighted in yellow in *Figure 9*). That displays a list of shortcuts that you can use:

![](/images/posts/claude-code-win-shortcuts.png)

**Figure 10:** *Claude Code Shortcuts*

These shortcuts can help you navigate and use Claude Code more efficiently. 

Let's try a simple command to get a feel for how Claude Code works. You can type `/help` in the input box and press `Enter`. This will display a list of commands that you can use. I am not going to list all the commands here, but you can try it out yourself. Actually I will list, not commands, but `Usage Modes`, which appears when you do `/help`:

![](/images/posts/claude-code-win-usage-modes.png)

**Figure 11:** *Claude Code Usage Modes*

This shows you the different usage modes of Claude Code. Why I bring this up is that in addition to the interactive shell, `REPL` mode in *Figure 11* above, you can use Claude Code almost as a chatbot:

![](/images/posts/claude-code-win-chatbot.png)

**Figure 12:** *Claude Code Non-interactive Mode*

In *Figure 12* you can see that Claude Code is running in a non-interactive mode, where you can ask it questions and get answers without having to type commands. This is similar to how you would interact with a chatbot.

### Write Code

Let us now finish this post by writing some code. In the interactive shell, type what you want Claude Code to do:









, it opens an interactive shell where you can type commands and ask Claude Code to help you with your project. You can use it to generate code snippets, refactor code, write tests, and more.

## Using Claude Code

What we want to do is to create a very simple `Node.js` application that we can use to test Claude Code. We will create a simple "Hello World" application, and then we will use Claude Code to add some functionality to it.

### Initializing Claude Code

There are a couple of ways you can use Claude Code. The most straightforward way is to run it directly from your terminal, which opens an interactive shell where you can type commands and ask Claude Code to help you with your project. Alternatively, you can use it from inside your code editor, such as Visual Studio Code, by installing the Claude Code extension. In this post we look at using Claude Code from the terminal.



To start using Claude Code, you can run it directly from your terminal. This will open an interactive shell where you can type commands and ask Claude Code to help you with your project.

### Create a Simple Node.js Application

1. Open your terminal (or WSL terminal on Windows) and create a new directory for your project:

   ```bash
   mkdir claude-test
   cd claude-test
   ```
   **Code Snippet 13:** *Create Project Directory*

2. Initialize a new Node.js project:

   ```bash
   npm init -y
   ```
   **Code Snippet 14:** *Initialize Node.js Project*

3. Create a new file called `index.js` in the project directory:

   ```bash
   touch index.js
   ```
   **Code Snippet 15:** *Create index.js*

4. Open `index.js` in your preferred code editor and add the following code:

   ```javascript  
   console.log("Hello World");
   ```
   **Code Snippet 16:** *Hello World Code*

5. Save the file and run the application:

   ```bash

   node index.js
   ```

   **Code Snippet 17:** *Run Hello World Application*

   You should see the output:

   ```
   Hello World
   ```
   **Figure 2:** *Hello World Output*

### Using Claude Code to Enhance the Application

Now that we have a basic Node.js application up and running, we can use Claude Code to enhance it. Claude Code can help us with various tasks, such as generating code snippets, refactoring code, and even writing tests.

In this section, we will explore how to use Claude Code to add a new feature to our application. Let's say we want to add a new endpoint to our application that returns a list of events.

1. First, we need to install the necessary dependencies for our application. We will use the `express` framework to create our API:

   ```bash
   npm install express
   ```
   **Code Snippet 18:** *Install Express*

2. Next, we need to update our `index.js` file to use Express and create a new endpoint:

   ```javascript
   const express = require("express");
   const app = express();
   const port = 3000;

   app.get("/events", (req, res) => {
       res.json([
           { id: 1, name: "Event 1" },
           { id: 2, name: "Event 2" },
       ]);
   });

   app.listen(port, () => {
       console.log(`Server is running at http://localhost:${port}`);
   });
   ```
   **Code Snippet 19:** *Create Events Endpoint*

3. Save the file and run the application:

   ```bash
   node index.js
   ```

   **Code Snippet 20:** *Run Application*

4. You can test the new endpoint by sending a GET request to `http://localhost:3000/events`. You should see a JSON response with the list of events:

   ```json
   [
       { "id": 1, "name": "Event 1" },
       { "id": 2, "name": "Event 2" }
   ]
   ```
   **Code Snippet 21:** *Test Events Endpoint*
5. Now, let's use Claude Code to enhance our application further. Open your terminal and run the following command:

   ```bash  
   claude code
   ```
   **Code Snippet 22:** *Run Claude Code*

   This will start the Claude Code interactive shell, where you can ask Claude Code to help you with your project.

6. In the Claude Code shell, you can ask Claude Code to add a new feature to your application. For example, you can type:

   ```
   Add a new endpoint to create an event
   ```

   and Claude Code will generate the necessary code for you.
7. Once Claude Code has generated the code, you can copy it and paste it into your `index.js` file. For example, Claude Code might generate the following code:

   ```javascript
   app.post("/events", (req, res) => {
       const newEvent = req.body;
       // Save the new event to the database
       res.status(201).json(newEvent);
   });
   ```

   This code creates a new POST endpoint for creating events. You can customize the code as needed.
8. Save the file and run the application again:

   ```bash  
   node index.js
   ```

   **Code Snippet 23:** *Run Application Again*
9. You can now test the new endpoint by sending a POST request to `http://localhost:3000/events` with a JSON body containing the event details. For example:

   ```json
   {
       "id": 3,
       "name": "Event 3"
   }
   ```

   You should see a response with the created event:

   ```json
   {
       "id": 3,
       "name": "Event 3"
   }
   ```      

   **Code Snippet 24:** *Test Create Event Endpoint*

## Conclusion

In this post, we explored the initial steps of building an event management system using Claude Code. We covered the problem statement, project goals, and the installation process for Claude Code on both Mac and Windows. We also created a simple Node.js application and used Claude Code to enhance it with new features.

This is just the beginning of our journey. In the next posts, we will dive deeper into the architecture of the event management system, explore how to structure the codebase, and discuss best practices for using Claude Code effectively.

Stay tuned for more updates as we continue to build this system and share our experiences along the way. If you have any questions or suggestions, feel free to reach out in the comments or on LinkedIn.

## Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.



<!--
  post reference
  [pkg1]: {{< relref "" >}}
-->  

[aoai]: https://learn.microsoft.com/en-us/azure/ai-services/openai/overview

[nblin]: https://www.linkedin.com/in/nielsberglund/
[dataai]: https://aimldatadurban.org/

[1]: https://www.brevo.com/
[2]: https://learn.microsoft.com/en-us/windows/wsl/install-manual
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:   

<!-- [findstr]: findstr /I <word_to_find> * -->
<!-- [findstr]: findstr /I /c:<"phrase to find"> * -->