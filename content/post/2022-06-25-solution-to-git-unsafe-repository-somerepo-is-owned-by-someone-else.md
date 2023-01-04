---
type: post
layout: "post"
title: > 
    Solution to GIT: "unsafe repository ('some-repo' is owned by someone else)"
author: nielsb
date: 2022-06-25T19:16:19+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/git.jpg"
tags:
  - Git
  - GitHub
description: "A look at what causes the Git error: unsafe repository ('some-repo' is owned by someone else), and how to solve it."
keywords:
  - Git
  - GitHub   
---

Every 6 - 9 months (or so), I clean up my development PC just to keep it "lean and mean". I do it by formatting the hard-drive partition the OS (in this case, Windows) is on, followed by a new install. Recently I had a four-day weekend here in SA. Four glorious days off, a perfect time to "nuke" my PC and re-install!

<!--more-->

Off I go, everything goes to plan ([Chocolatey][1] is my friend), and after a while, I am done (or as done as one can be). At this stage, I needed to do my [weekly roundup blog post][3] for the week gone by, and as I had done some changes to the GitHub repo from my **MacBook Pro**, I wanted to do a `git pull` in the repo directory for my blog. Part of the story is that on my dev PC, I have all my repos on a separate partition from the system partition, so the non-system partition was un-affected by the reformat (or so I thought). Imagine my surprise when doing the `git pull` I got:

![](/images/posts/git-unsafe-repo-1.png)

**Figure 1:** *Unsafe Repository*

Hmm, the error we see in *Figure 1* does not make any sense at all. It is my repo, I created it, so what is the problem?

## The Problem

Trying to narrow down the issue, I did a `git clone` into a new directory of the same repo I couldn't `pull`, which worked perfectly! I went over to my MacBook and did a `pull` against the same repo that failed previously, and that worked as well. By now, I was utterly dumbfounded, so I started to do proper research (read Googled), and I came across [this post][2], which talked about security vulnerabilities in the Git client, and how they had been fixed in version `2.35.2`. When I checked my version, it was `2.36.1`, so I might be on to something here. 

When reading about the security vulnerability in the link above, I came across this:

*This version changes Git's behavior when looking for a top-level `.git` directory to stop when its directory traversal changes ownership from the current user.*

Hmm, ownership and current user, let's look at the directory where the `pull` failed:

![](/images/posts/git-unsafe-repo-owner-1.png)

**Figure 2:** *Directory Ownership*

When looking at the advanced security settings for the directory, I saw something like in *Figure 2*, a "weird" looking owner of the directory. Actually, it is not that weird; it is a security identifier (`SID`). A `SID` in the Windows OS identifies a user, user group, or other security principal.

> **NOTE:** To get to the advanced security settings, I right-clicked on the directory, chose **Properties**, clicked on the **Security** tab, and in the **Security** tab, I clicked the **Advanced** button.

From what we see in *Figure 2*, it is evident that the directory owner is not the same as the current user, i.e. me. Before we look at ways to fix the issue, let's understand why the owner is not myself. I created the directory at one point, so the owner should be me. 

The answer is that the directory sits on a different partition/hard drive. When I reformatted the machine, the ownership was transferred to the particular `SID` since I was not "around". 

So now we know the reason and why it happened; let's fix it.

## Fix the Issue

The obvious way to fix the problem is to change the directory owner to me. This can be done in the **Advanced Security Settings** we saw before:

![](/images/posts/git-unsafe-repo-change-owner.png)

**Figure 3:** *Change Owner*

In *Figure 3*, we see how it is done. I clicked the **Change** button (outlined in blue), which brought up the *Select User or Group* dialog. I entered my user name in the textbox (outlined in red) and then clicked **OK**. I am now back to being the directory owner, and when doing a `git pull`, everything works!

This is one way to change the owner. The problem with this is that if you have quite a few repo directories under a "root" directory (as I do), then it can become a bit tedious to do it: right-click directory, **Properties**, **Security**, **Advanced**, **Change** - for each directory. It would be cool if one could do something more batch-like. 

On Windows, we have a pretty neat tool that allows taking ownership of a file or folder using the command-line interface. The tool is `takeown.exe`:

``` bash
$ takeown /f . /r /d Y
```
**Code Snippet 1:** *Take Ownership*

In *Code Snippet 1*, we see how I am in the root directory of my Git repos and how I call `takeown`. The parameters are:

* `/f`: the directory or file to take ownership of. We see how I have defined `/f .`, (dot), which indicates the current directory.
* `/r`: performs a recursive operation on all files in the specified directory and subdirectories.
* `/d`: suppresses the confirmation prompt that is displayed when the current user does not have the `List Folder` permission on a specified directory and instead uses the specified default value. In my case, I used `Y`, which indicates to take ownership.

Be aware that the above recurses through all directories and files, so it may take a while.

Another way to solve the issue, which does not involve changing ownership, is to tell Git that the directory is safe. To mark a directory safe, you use the `git config --global --add safe.directory <option>` command. The `option` can be a path to a directory or `*`, wherein Git treats any directory as safe.

When running `git config --global --add safe.directory`, the end result is that a `[safe]` section is being added to the `~/.gitconfig file`, and the section indicates what is safe:

``` bash
[user]
  email = niels.it.berglund@gmail.com
  name = Niels Berglund
[safe]
  directory = *
```
**Code Snippet 2:* *Git Config File*

In *Code Snippet 2* we see my `~/.config` file after I executed `git config --global --add safe.directory *`.  

Remember that if you add a specific directory as `safe`, any changes to the directory name or path will cause the error to re-occur. However, if you add all directories as safe (or change ownership), you do not need to worry about name or path changes. It will just work.

## Summary

This post looked at what causes the *unsafe repository ('some-repo' is owned by someone else)* Git error. We said that this error occurs when you run a Git client with a version of `2.35.2` or higher and execute a Git command in a directory owned by someone else than the user executing the command.

The way to solve this is to either change the ownership of the directory/directories or mark them as safe.

Having re-installed Windows, it is now time to do my **MacBook Pro** as well. Wish me luck!

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com

[1]: https://community.chocolatey.org/
[2]: https://stackoverflow.com/questions/71901632/fatal-error-unsafe-repository-home-repon-is-owned-by-someone-else/71949648#71949648
[3]: {{< relref "2022-06-19-interesting-stuff---week-24-2022.md" >}}
[4]: https://github.blog/2022-04-12-git-security-vulnerability-announced/

