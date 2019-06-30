---
layout: post
title: "SqlClrProject on GitHub"
author: nielsb
date: 2012-11-03T09:27:56+02:00
categories:
  - SQL Server
tags:
  - SQL Server
  - SQLCLR
  - SQLCLRProject
comments: true
---

As some of you may know, I - once upon a time - developed a project (VS add-in, templates, etc) for automatic deployment of CLR assemblies to SQL Server: **SqlClrProject**. That project has been dormant now for a couple of years, but I now and then get requests for where it can be downloaded from (I had it on CodePlex, but had to take it down as I didn't publish the source code).

<!--more-->

A while ago I decided to start to use Git and GitHub as source control (I have been using SVN since forever), and as part of the "getting to grips" with Git, I created a repo for **SqlClrProject** on GitHub. So the source for the project is now available on [GitHub][1].

If you are interested in the  fork it, play with it. The state of it is that it "should" work on VS 2008 / SQL 2008. It most likely will work on VS 2010 as well. And of course the standalone deployment executable will work regardless of VS version.


 [1]: https://github.com/nberglund/sqlclrproject
