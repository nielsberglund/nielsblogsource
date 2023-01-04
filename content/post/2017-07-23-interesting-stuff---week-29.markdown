---
layout: post
title: Interesting Stuff - Week 29
author: nielsb
date: 2017-07-23T19:51:06+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQLCLR
  - sanddance
description: SQLOS, SQLCLR and neural networks are prominent is this weeks roundup! Plus some other goodies!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQLCLR
  - sanddance   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, for the week just gone by. 

<!--more-->

## SQL Server

* [The early life of a SQLOS thread][1]. "And on that day a SQLOS thread was born"! [Ewald][ew] talks about SQLOS threads in his normal entertaining style. Once again, if you are interested in the inner workings of SQL Server in general and SQLOS specifically, you have to follow [Ewald][ew]!!
* [SQLCLR Deployment Utility and Helper library][2]. A post on the [.NET Framework inside SQL Server][3] forum about a utility for SQLCLR functions as well as deployments. Have a look at the [GitHub][4] repo for all the supporting code. Very impressive!!
* [SQL Server 2017 SQLCLR - Whitelisting Assemblies][5]. A post by me about new functionality in SQL Server 2017 RC1 to be able to whitelist SQLCLR assemblies. Quite interesting if I may say so myself!

## Data Science

* [HOW GDPR AFFECTS DATA SCIENCE][6]. A very interesting post about the upcoming legislation in EU over data protection, the GDPR, and what effects it will have on Data Science.
* [useR! International R User 2017 Conference][7]. A Microsoft [Channel 9][8] post containing videos of most of the presentations from the **useR 2017** conference in Belgium in the early days of July. A lot of very interesting talks!
* [Neural Networks from Scratch, in R][9]. A post from Ilia Karmanov, (a Data Scientists at Microsoft), about how to build a neural-network from scratch in R. If I only would understand half of it ...
* [SandDance - Visually Explore, Understand, and Present Data][10]. SandDance is a Microsoft Research project aimed to help you find insights about your data. It looks very, very interesting!

## SQL Server R Services

* [Microsoft SQL Server R Services - Internals VII][si8]. Have I been a busy boy this week or what?! The [Internals - VIII][si8] covers some of the components the launchpad service loads; Rterm.exe, BxlServer.exe, etc.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: http://sqlonice.com/the-early-life-of-a-sqlos-thread/
[2]: https://social.msdn.microsoft.com/Forums/en-US/e78c8278-aeef-4a30-996e-cb80e385fea4/sqlclr-deployment-utility-and-helper-library?forum=sqlnetfx
[3]: https://social.msdn.microsoft.com/Forums/en-US/home?forum=sqlnetfx
[4]: https://github.com/vaseug/PowerLib
[5]: {{< relref "2017-07-23-sql-server-2017-sqlclr-white-listing-assemblies.markdown" >}}
[6]: https://thomaswdinsmore.com/2017/07/17/how-gdpr-affects-data-science/
[7]: https://channel9.msdn.com/Events/useR-international-R-User-conferences/useR-International-R-User-2017-Conference
[8]: https://channel9.msdn.com
[9]: http://blog.revolutionanalytics.com/2017/07/nnets-from-scratch.html
[10]: https://www.sanddance.ms/
[si8]: {{< relref "2017-07-22-microsoft-sql-server-r-services---internals-viii.markdown" >}}
