---
layout: post
title: "SQL Server Denali CTP 1 SUX"
author: nielsb
date: 2010-11-14T09:27:56+02:00
categories:
  - SQL Server
tags:
  - denali
  - SQL 11
  - SQLCLR
comments: true
---
.. from a relational developers perspective!!

Well, the title may be a bit harsh, but at least it grabbed your attention - did it not?!

A week ago, or so, I wrote a [wish list][1] to Santa for Denali from a relational developers perspective. In that wish list I wrote that there has been fairly little love for relational SQL developers in the recent versions of SQL Server, and that I hoped in this version (i.e Denali) Microsoft would "go back to the roots" and give us developers some new stuff.

<!--more-->

So I downloaded the CTP when it became available, and have been playing around with it for a bit, in order to see what new "stuff" I could find and how it stacked up against my wish list:

* Autonomous transactions - not a whiff of it. 
* Enhancements to SQLCLR - Denali is still loading version 2.0.50727 of the runtime (i.e. the original "SQL 2005" version). So nothing here either, and they have not even added Microsoft.SqlServer.Types (for the geo and hierarchy types) to the blessed list. This (lack of SQLCLR enhancements) is probably the one thing that saddens me the most - it seems that after all the initial hoopla and fanfare about SQLCLR when it was introduced in SQL Server 2005, Microsoft has decided to not fullfil its potentials. 
* Finally blocks - well, we do not have finally blocks but we now have a proper way of throwing and re-throwing exceptions; the `THROW` keyword. I wrote about it [here][2] and [here][3]. So at least this is something.
* Other T-SQL enhancements &#8211; this is an area where there are at least a couple of new things: `SEQUENCE` and `OFFSET`. Those are cool and useful and Aaron B wrote about them [here][4] and [here][5]. But this is still not very much, and no evidence of that Microsoft want to continue to enhance T-SQL as a first class development language (as they have stated in the past).

So, the report card does not look that good and that's the reason for the title of this post. Granted, there are things that are in the cards but not included in this CTP; things like:

*   Column storage - however, that is more a BI feature, but it will be usable in the OLTP world as well.
*   FileTable - a way of storing files in SQL Server. It looks like FileStream v.NEXT or (do I dare say it) WinFS (now I have most certainly condemned this to death). It looks interesting, but - as I said - not in this CTP.

As you can gather from the above, I am not that stoked about Denali. I hope later CTP's will bring more things, but somehow I doubt it.

What are your take on this, are you happy with what Denali gives you (from a relational developers perspective), and if not - what would you like to see included. Answers in the comments please.

 [1]: {{< relref "2010-11-07-what-new-programmability-features-will-there-be-in-sql-11.md" >}}
 [2]: {{< relref "2010-11-10-new-t-sql-features-in-sql-11-denali-error-handling.md" >}}
 [3]: {{< relref "2010-11-12-more-t-sql-error-functionality-in-denali-sql-11.md" >}}
 [4]: http://sqlblog.com/blogs/aaron_bertrand/archive/2010/11/11/sql-server-11-denali-using-sequence.aspx
 [5]: http://sqlblog.com/blogs/aaron_bertrand/archive/2010/11/10/sql-server-11-denali-using-the-offset-clause.aspx
