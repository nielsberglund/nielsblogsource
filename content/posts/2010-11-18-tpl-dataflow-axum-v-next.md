---
layout: post
title: "TPL Dataflow, Axum v.NEXT?"
author: nielsb
date: 2010-11-18T09:27:56+02:00
categories:
  - .NET
tags:
  - Async / Parallel
  - 'F#'
  - LINQ
  - tpl
  - tpldataflow
comments: true
---

At PDC 2010 Microsoft showed the new [Async][1] features of coming C# (and VB.NET) versions, and quite a lot has been written about it already. Part of the Async CTP is **TPL Dataflow**, and this has gone somewhat un-noticed.

<!--more-->

[TPL Dataflow][2] is a library for building concurrent applications. It utilises an actor/agent-oriented designs via primitives for in-process message passing, dataflow, and pipelining. It looks and feels a bit like [Axum][3], and one can wonder if TPL Dataflow will be the productization (is this a word?) of Axum, especially as Axum's future seems a bit [unclear][4] at the moment.

I am at the moment writing some test-code for TPL Dataflow, which I will post as soon as I have tidied it up a bit. In the meantime [Matt Davey][5], has quite a few [posts about TPL Dataflow][6] on his blog. So if you are interested, go and have a look.

[1]: http://msdn.microsoft.com/en-us/vstudio/async.aspx
[2]: http://www.microsoft.com/downloads/en/details.aspx?FamilyID=d5b3e1f8-c672-48e8-baf8-94f05b431f5c&displaylang=en
[3]: http://msdn.microsoft.com/en-us/devlabs/dd795202.aspx
[4]: http://social.msdn.microsoft.com/Forums/en-US/axum/thread/f86881de-71af-4709-b197-64a6e6dc96dd
[5]: http://mdavey.wordpress.com/
[6]: http://en.wordpress.com/tag/tpldataflow/
