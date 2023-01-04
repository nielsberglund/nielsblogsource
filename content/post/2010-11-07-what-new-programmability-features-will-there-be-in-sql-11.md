---
layout: post
title: "What New Programmability Features Will There Be in SQL 11?"
author: nielsb
date: 2010-11-07T11:27:56+02:00
categories:
  - SQL Server
tags:
  - SQL 11
  - SQL Server
  - SQLCLR
comments: true
---
There is probably no secret that Microsoft is working hard on next version of SQL Server. The rumour has it that it will be named SQL 11 (it apparently goes under the code name of Denali. Quiz; MS has used the Denali code name previously, what was it for? Answers in the comments ).

<!--more-->

Anyway, the SQL PASS summit is this coming week and another rumour says we might see a CTP being released during the conference. I, for one, cannot wait to see a CTP and see what new features it brings. Which brings me back to this post. If we look at some of the previous releases of SQL we can see that they have had a mixed bag of features for developers:

* SQL 2005: HUGE; SQLCLR, Service Broker, DDL Events, PIVOT, CTE's, XML, etc., etc.
* SQL 2008: Not so much; the table type and TVP's (which are cool), T-SQL enhancements (cool), some new data types, extended events, but not much more (unless you are a BI guy - which I am not).
* SQL 2008R2: Even less; some enhancements to Service Broker, and StreamInsight, but that is basically it.

So, IMHO, it is now time for relational developers to get some love from Microsoft in this release of SQL Server. Seeing that the Christmas is soon upon us here is my wish list to Santa SQL:

+ Autonomous Transactions: Nested transactions are independent.
+ Autonomous Transactions: see above (yes, I really, really do want this).
+ Enhancements to SQLCLR: I would love to be able to use TVP's in SQLCLR
+ Finally blocks: we have had `try...catch` since 2005, it is now time to finish this and introduce `finally`.
+ Other T-SQL enhancements: I would love to see T-SQL get new features that would make it more like a "real" programming language.

This is my wish-list, I wonder how much of this we will see, if any. Post your own wish-lists in the comments please.
