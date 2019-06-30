---
layout: post
title: "Debugging in SQL Server 2008"
date: 2008-07-16T09:27:56+02:00
author: nielsb
comments: true
categories:
  - SQL Server
tags:
  - SQL 2008
---
As good as SQL 2005 was (well, still are), one disappointment was that you needed Visual Studio if you wanted to debug your stored procedures. Seriously, what was MS thinking when they did that, especially as in SQL 2000, Query Analyzer had debug capabilities?!!

<!--more-->

Anyway, today I was ~~playing around~~, errm - doing serious stuff in the RC0 release of SQL Server 2008, and just by coincidence noticed that there is a debug menu entry in the toolbar (how blind can one be - I must have been looking at that toolbar quite a few times). So I wrote some T-SQL code, put in a couple of breakpoints and hit Alt + F5, and lo and behold - my bp's were hit and I could step through the code. I then wrote a very basic stored proc, wrote some code that called the proc, put a bp at the call into the proc and executed. When the execution stopped at the bp I hit F11 and I stepped into the proc - WoHoo!!! Call me sad, but stuff like this make me happy!!

Now, let's hope that MS will keep this feature in and not pull it at the last minute - anyone remember the XQuery designer in one of the very early SQL 2005 beta's?
