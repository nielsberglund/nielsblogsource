---
layout: post
title: "SQL Server 2005 and DMV's"
date: 2006-08-23T09:27:56+02:00
author: nielsb
comments: true
categories:
  - SQL Server
tags:
  - SQL 2005
---
One of the first thing I usually do after having installed a new version of SQL Server is to snoop around at the system tables to see what new tables there are and what they can give me information about.

<!--more-->

As you may know by now, in SQL Server 2005 the system tables are not longer visible. The information from the system tables are instead exposed as **Dynamic Management Views** (DMV). These DMV's gives you a lot of information about the state of your SQL Server, the problem is how to interpret the views and what views to look at when you try to solve a specific problem.

Fortunately [Slava Ok][1] from Microsoft is planning to post a series of blog entries about DMV's where he emphasizes on what actual problems the DMV's can be used to solve. The first installment is now up, and you can find it [here][2]. Happy reading!! 

 [1]: http://blogs.msdn.com/slavao
 [2]: http://blogs.msdn.com/slavao/archive/2006/08/22/713357.aspx
