---
layout: post
title: Interesting Stuff - Week 4
author: nielsb
date: 2017-01-28T07:57:00+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - XACT_STATE
  - XACT_ABORT
  - Kafka
  - R
  - Microsoft R Server
  - managed data
description: Weekly roundup of what interesting stuff I have found.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - XACT_STATE
  - XACT_ABORT
  - Kafka
  - R
  - Microsoft R Server
  - managed data
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, this week. 

<!--more-->

This week it is mostly data science, so without further ado, let's get cracking:

## Data Science

* [Upcoming R Conferences][3]. A list of upcoming R conferences around the world. Among the conferences it lists the second ever **satRday**, this year held in Cape Town. I will be speaking there, and I do believe there still are tickets left. Check [here][4] for more.
* [Microsoft Training Options on AI, Machine Learning & Data Science][5]. This post lists a lot of various training options within data science, mostly based on **Microsoft** technologies
* [New Year & New Updates to the Windows Data Science Virtual Machine][6]. Microsoft has updated its **Azure** based [Data Science Virtual Machine][7], with some really, really interesting new stuff!
* [Building a machine learning model with the MicrosoftML package][8]. A post about [MicrosoftML][9], the new high performant R package included in [Microsoft R Server 9][10].

## Distributed Computing

* [Scaling Counting Infrastructure @Quora][11]. An [InfoQ][12] presentation about **Quanta**, which is **Quora**'s counting system powering their high-volume near-real-time analytics.
* [Making Sense of Stream Processing][13]. A download link for an eBook covering how stream processing can make your data processing systems more flexible and less complex. I include it here as the book discusses **Kafka** (which I think is awesome, Kafka I mean).

## SQL Server

* [Introducing SQL Server on Linux][14]. A YouTube video about SQL Server on Linux, including how you can: download and install SQL Server on a Linux Virtual Machine; run your SQL Server-based apps inside of Docker containers and improve the performance of your applications.
* [SQL Server on Linux: Debugging ELF and PE Images (dbgbridge)][15]. A very, very interesting post how Microsoft implemented the ability to debug from WinDbg, both SQL Server on Windows as well as on Linux!

## Shameless Self Promotion

So this is my shameless self promotion part. I have three blog-posts about error handling on SQL Server. Personally I think they are well worth reading :). In chronological order:

* [SQL Server Error Handling Gotchas][16]. How error handling in SQL Server can trip you up!
* [Abort, Abort, We Are XACT_ABORT:ing, Or Are We?!][17]. The dangers of using XACT_ABORT in SQL Server OLTP databases.
* [Doomed, We are All Doomed I Say!][18]. A blog-post about doomed transactions in SQL Server and XACT_STATE().

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[de]: (/derivco)
[1]: https://blog.acolyer.org
[2]: http://blog.revolutionanalytics.com
[3]: http://blog.revolutionanalytics.com/2017/01/upcoming-r-conferences.html
[4]: http://capetown2017.satrdays.org/
[5]: https://blogs.technet.microsoft.com/machinelearning/2017/01/25/a-plethora-of-microsoft-training-options-on-ai-machine-learning-data-science-including-moocs/
[6]: https://blogs.technet.microsoft.com/machinelearning/2017/01/27/new-year-new-updates-to-the-windows-data-science-virtual-machine/
[7]: https://azure.microsoft.com/en-us/marketplace/partners/microsoft-ads/standard-data-science-vm/
[8]: http://blog.revolutionanalytics.com/2017/01/microsoftml-taxi-trips.html
[9]: https://msdn.microsoft.com/en-us/microsoft-r/microsoftml-introduction
[10]: https://www.microsoft.com/en-us/cloud-platform/r-server
[11]: https://www.infoq.com/presentations/quora-analytics
[12]: https://www.infoq.com
[13]: https://www.confluent.io/making-sense-of-stream-processing-ebook-download/
[14]: https://www.youtube.com/watch?v=oEpJB87Xg9U
[15]: https://blogs.msdn.microsoft.com/bobsql/2017/01/24/sql-server-on-linux-debugging-elf-and-pe-images-dbgbridge/
[16]: {{< relref "2016-12-31-sql-server-error-handling-gotchas.markdown" >}}
[17]: {{< relref "2017-01-08-abort-abort-we-re-xact-aborting-or-are-we.markdown" >}}
[18]: {{< relref "2017-01-27-doomed-we-are-all-doomed.markdown" >}}
