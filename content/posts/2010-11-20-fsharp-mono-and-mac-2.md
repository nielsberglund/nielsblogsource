---
layout: post
title: "F#, Mono and Mac - Take II"
author: nielsb
date: 2010-11-20T09:27:56+02:00
categories:
  - NET
  - Mono
tags:
  - 'F#'
  - Mac
  - osx
comments: true
---

So yesterday [I wrote][1] about how I have started using F# and Mono on my MacBook.

I wrote about how I downloaded the F# bits, unzipped and put them in a specific directory I had created. Today after having browsed around a bit more I realized I had done it the hard way. To install the required bits for F# for Mac, you only have to download a zip file with an install package for Mac from the [F# Cross Platform][3] site on CodePlex. The actual zip-file for the November 2010 CTP is [here][1].

After you have downloaded the file you unzip it and run the `.pkg` file. This takes care of everything; no re-signing with the `.snk` file etc. The added benefit of installing from the `.pkg` file is that a couple of F# compiler dll's are automatically gac:ed (they are needed if you want to run the F# plugin for MonoDevelop), and aliases are created for the F# compiler and the F# interactive window.


[1]: {{< relref "2010-11-19-fsharp-mono-and-mac.md" >}}
[2]: http://fsxplat.codeplex.com/releases/view/55463#DownloadId=166558
[3]: http://fsxplat.codeplex.com/

