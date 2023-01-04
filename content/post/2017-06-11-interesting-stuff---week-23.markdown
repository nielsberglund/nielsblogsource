---
layout: post
title: Interesting Stuff - Week 23
author: nielsb
date: 2017-06-11T19:49:02+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - R
description: SQL Server, distributed computing and data science in this weeks roundup.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - R  
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

For one reason or another I have not found that much interesting articles/posts this week. A reason for this can be that I have done some traveling the last week and not had time to read that much. Tuesday I was at the [Microsoft Cloud Society - Data Science Roadshow][1] where I did a talk about Azure Machine Learning. It was fun doing some conference talks again, and I may do some more if there is anything interesting coming up.

Anyway, a couple of things caught my eye the week past, so let's get to it.

## SQL Server

* [OLEDB waits in #SQLServer checktable Part I - Disappearing Act][2]. This is the first "episode" in a series of blogposts by [Lonny Niederstadt][ln] about the OLEDB wait type during checktable operations. The posts are really, really worth reading if you are interested in deep level SQL Server "stuff".
* [Increased SOS_SCHEDULER_YIELD waits on virtual machines][3]. More about waits. This time by Paul Randal from [SQLskills][sqsk], and wait stats when SQL Server is running in a virtual machine.

## Distributed Computing

* [Distributed Systems Theory for Practical Engineers][4]. An [InfoQ][iq] presentation by Alvaro Videla. In this presentation Alvaro discusses asynchronous vs. synchronous distributed systems, message passing vs shared memory communication, failure detectors and leader election problems, etc. Very Cool!!!
* [Real-time & Personalized Notifications @Twitter][5]. Another [InfoQ][iq] presentation about the hybrid push/pull-based architecture adopted by the Twitter Notification platform.

## Data Science

* [Introducing the new Data Science Virtual Machine on Windows Server 2016][6]. A blog-post introducing the Microsoft Azure Data Science Virtual Machine for Windows server 2016. There are quite a fee new interesting features in this release; Docker container support, unified support for Deep Learning on GPU or CPU-only based virtual machines, etc. Quite a lot of new exciting things to play with.
* [DEEP LEARNING RESEARCH PAPER LISTS FOR SUMMER 2017][8]. In the [roundup last week][8] I covered a post with a list of Data Science research papers. This post is similar, but for papers about deep learning.
* [Analyze your data in Azure Data Lake with R (R extension)][9]. A blog-post about how you can run R code on Azure Data Lake Analytics in the cloud, so you don't have to move the data to somewhere locally.

## SQL Server R Services

I can see the light in the end of the tunnel and I hope to have the next installation of my [SQL Server R Services][sinst] series ready to be published soon:ish.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright
[ln]: https://twitter.com/sqL_handLe
[1]: https://www.microsoft.com/middleeast/azure/cloud-society/engage-data-science-roadshow.aspx
[2]: http://sql-sasquatch.blogspot.co.za/2017/06/oledb-waits-in-sqlserver-checktable.html
[3]: https://www.sqlskills.com/blogs/paul/increased-sos_scheduler_yield-waits-on-virtual-machines/
[4]: https://www.infoq.com/presentations/distributed-systems-theory
[5]: https://www.infoq.com/presentations/twitter-notifications
[6]: https://blogs.technet.microsoft.com/machinelearning/2017/06/06/introducing-the-new-data-science-virtual-machine-on-windows-server-2016/
[7]: {{< relref "2017-06-04-interesting-stuff---week-22.markdown" >}}
[8]: http://101.datascience.community/2017/06/06/deep-learning-research-paper-lists-for-summer-2017
[9]: https://blogs.msdn.microsoft.com/tsmatsuz/2017/06/08/azure-data-lake-r-extension/
[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
