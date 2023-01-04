---
layout: post
title: 'F#, Mono and Mac'
author: nielsb
date: 2010-11-19T09:27:56+02:00
categories:
  - NET
  - Mono
tags:
  - 'F#'
  - Mac
  - osx
comments: true
---

This is a first post about my experiences with running F# and Mono on a Mac.

In a [previous post][1] I wrote about how I have started to play with F#. As that post also covered SQLCLR it was obvious I was on Windows. Even though I make my living from development in a Windows environment, my main machine is a MacBook, and I run OSX as my main OS. I have previously also been running Linux (ArchLinux) on this machine as my main OS. Naturally I have heard about Mono (and also installed it a couple of times - and quickly un-installed again, but I have not really done anything with it. I have always run Windows in a VM on my MacBook for development etc. However after the announcement that F# was going [Open Source][2], and [Tomas P][3] [posted][4] about his F# MonoDevelop plug-in</a>, I decided that I should have a look at what it would be like to do F# "stuff in OSX.

<!--more-->

This is what I did:

1. [Downloaded Mono][5]
2. [Downloaded F#][6]. You want to download the zip file.

Having downloaded what I thought was necessary (I decided to hold off with MonoDevelop until I had everything running), I started the installation process. Installing Mono was straight forward, just mount the `.dmg` and then run the `.pkg` file. The only slight issue after installation was where it had been installed. Mostly for my own reference for later installations; Mono is located at: `/Library/Frameworks/Mono.framework`.

After I had installed Mono, I copied the bin directory from the unzipped F# file to a directory I created in the same root folder as where Mono was: `/Library/Frameworks/FSharp`. I copied the `install-mono.sh` file to the FSharp directory and was ready to start the installation. Fortunately before I executed the `install-mono.sh` file, I read the comments in the file. At this stage I realised I had not downloaded everything necessary.

One of the F# dll's `FSharp.Core.dll` needs to be installed in the gac. In order to do that, the dll needs to be re-signed with the `mono.snk` key. The installation file mentions how you can download the file using `wget`. As I did not have `wget` I found a link to it and downloaded it by right-clicking on the link and choose "Save Link As". Once again mostly for my future reference; the file can be found [here][7], (just right click and choose "Save Link As"). I saved it into the F# root folder (the same folder where the `install-mono.sh` is).

So, now everything should be ready to go. I executed the install file and promptly got an error saying that the `FSharp.Core.dll` could not be installed in the gac. Hmm, not good! Fortunately the error message mentioned something about a possible permission error, so I looked at the permissions on the gac folder (`../Mono.framework/Versions/2.8/lib/mono/gac`), and sure enough - I did not have write permissions. I gave myself write permissions, and re-ran the installation and everything went OK. Cool!!

After this it was time to test it out. From the F# bin directory I ran the following from a terminal window to execute the compiler: `mono fsc.exe`. It seemed to work as I got this error back:

![](/images/posts/fsc.exe.png)

I then tried the interactive window: `mono fsi.exe`. I wrote some simple test code:

![](/images/posts/fsi-exec.png)

As you can see, that worked as well!! So I am now well on the way of running (and learning) F# on Mono. Next step is to install MonoDevelop and Tomas P's plugin for F#. Stay tuned...

[1]: {{< relref "2010-11-15-using-fsharp-in-sqlclr.md" >}}
[2]: http://blogs.msdn.com/b/dsyme/archive/2010/11/04/announcing-the-f-compiler-library-source-code-drop.aspx
[3]: http://tomasp.net/blog
[4]: http://tomasp.net/blog/fsharp-in-monodevelop.aspx
[5]: http://www.go-mono.com/mono-downloads/download.html
[6]: http://www.microsoft.com/downloads/en/details.aspx?FamilyID=f8c623ae-aef6-4a06-a185-05f59be47d67&displaylang=en
[7]: http://github.com/mono/mono/raw/master/mcs/class/mono.snk
