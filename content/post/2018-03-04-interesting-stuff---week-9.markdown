---
layout: post
title: Interesting Stuff - Week 9
author: nielsb
date: 2018-03-04T19:29:44+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Microsoft Machine Learning Server
  - .NET
  - stream processing
description: Microsoft Machine Learning Server 9.3, stream processing, event databases, and other interesting topics! 
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Microsoft Machine Learning Server
  - .NET
  - stream processing   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending.

<!--more-->

## .NET

* [How generics were added to .NET][1]. A very, very interesting post by [Matthew][mattw] about the "history" of generics in .NET. I have said it before, and I say it again - if you are interested in the "plumbing" of .NET, Matthew's blog is a must-read!

## Databases

* [AxonDB, a New Implementation of an Event Store][2]. An article from [InfoQ][iq] presenting AxonDB, which is a new data storage purpose-built for event sourcing with support for transactions and pushed-based event publishing. AxonDB is something I want to look closer into, and also see how it plays with Kafka.

## Streaming

* [Data Decisions with Real-time Stream Processing][3]. A presentation from [InfoQ][iq] and its QCon conference. The presentation is about how Facebook is using stream processing at scale to deliver insights with data stream processing, and it also covers difficulties they have encountered and the solutions they have created to date.

## Data Science

* [LEARN DATA SCIENCE YOUTUBE CHANNEL][4]. [Ryan Swanstrom][ryansw] from [Data Science 101][5] launches a new YouTube channel to help to learn about data science. I have subscribed!
* [CONVERSATIONS WITH FUTURE DATA SCIENTISTS (YOUTUBE PLAYLIST)][6]. A video from [Ryan][ryansw] and the YouTube channel mentioned above. In this video, Ryan chats to some future data scientists about various topics. Exciting questions and answers!
* [Data Science Live Book][7]. An online data science book by [Pablo Casas][pabloc]. The book is about data preparation, data analysis and machine learning.
* [Azure Machine Learning and the Team Data Science Process – Part 1][8]. The first post in a series by [Buck Woody][buckw] how the Microsoft Team Data Science Process fits in with Azure Machine Learning, AI programming and Deep Learning.
* [Introducing the Microsoft Machine Learning Server 9.3 Release][10]. A blog post to announce the release of Microsoft Machine Learning Server 9.3. There are quite a few new features and lots of improvements, so go ahead and read the post and upgrade to the new version. I will!

## SQL Server R Services

Good news, I have come quite a bit on the way with my post about  `sp_execute_external_script`. I had hoped to be able to publish it today, but unfortunately, that seems out of the question. Expect it in a couple of days!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com

[jovpop]: https://twitter.com/JovanPop_MSFT
[bobw]: https://twitter.com/bobwardms
[revod]: https://twitter.com/revodavid
[lonny]: https://twitter.com/sqL_handLe
[ewtw]: https://twitter.com/sqlOnIce
[buckw]: https://twitter.com/BuckWoodyMSFT
[mattw]: https://twitter.com/matthewwarren
[murba]: https://twitter.com/muratdemirbas
[daveda]: https://twitter.com/davidthecoder
[adcol]: https://twitter.com/adriancolyer
[jesrod]: https://twitter.com/jrdothoughts
[tomaz]: https://twitter.com/tomaz_tsql
[dataart]: https://twitter.com/dataartisans
[ryansw]: https://twitter.com/ryanswanstrom
[pabloc]: https://twitter.com/pabloc_ds


[1]: http://mattwarren.org/2018/03/02/How-generics-were-added-to-.NET/
[2]: https://www.infoq.com/news/2018/02/axondb-event-store-cqrs
[3]: https://www.infoq.com/presentations/facebook-stream-processing
[4]: http://101.datascience.community/2018/02/26/learn-data-science-youtube-channel/
[5]: http://101.datascience.community/
[6]: http://101.datascience.community/2018/03/01/conversations-with-future-data-scientists-youtube-playlist/
[7]: https://livebook.datascienceheroes.com
[8]: https://blogs.msdn.microsoft.com/buckwoody/2018/02/27/azure-machine-learning-and-the-team-data-science-process-part-1/
[9]: https://docs.microsoft.com/en-us/azure/machine-learning/team-data-science-process/overview
[10]: https://blogs.technet.microsoft.com/machinelearning/2018/02/27/introducing-the-microsoft-machine-learning-server-9-3-release/
