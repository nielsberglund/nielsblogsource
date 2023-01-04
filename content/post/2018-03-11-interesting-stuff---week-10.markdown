---
layout: post
title: Interesting Stuff - Week 10
author: nielsb
date: 2018-03-11T14:17:55+02:00
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
  - Azure SQL Database Managed Instance
  - micro-services
  - consensus protocol
  - Python Anaconda
  - Open Neural Network Exchange
description: Azure SQL Database Managed Instance, Anaconda in VSCode, ONXX n Windows 10 and other interesting topics!.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Microsoft Machine Learning Server
  - Azure SQL Database Managed Instance
  - micro-services
  - consensus protocol
  - Python Anaconda
  - Open Neural Network Exchange 
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

## SQL Server

* [What is Azure SQL Database Managed Instance?][1]. A blog-post by [Jovan][jovpop] about a new **Azure SQL Server** offering: **Managed Instance**. Managed Instance is a new managed database service that represents a fully-managed SQL Server instance in the Azure cloud. It shares the same code with the latest version of SQL Server database engine and has the latest features, performance improvements, and security patches; for example SQLCLR is available - yay!

## Distributed Computing

* [Event-Driven Microservices at O'Reilly Software Architecture Conference NY][2]. A roundup from the O'Reilly Software Architecture Conference about micros-services. The topics are around how an event driven architecture can help when doing micro-services.
* [Impossibility of Distributed Consensus with One Faulty Process ][3]. A white paper covering some of the problems inherent in distributed asynchronous systems. A must read!
* [Settling payments fast and private: efficient decentralized routing for path-based transactions][8]. [Adrian][adcol] from [**the morning paper**][mp] dissects a white paper about Peer-to-peer path-based-transaction (PBT) networks. Very interesting! 

## Data Science

* [Popular Python Data Science Platform Anaconda Now Shipping with Microsoft VS Code][4]. An [InfoQ][iq] article about how release 5.1 of **Anaconda**, the data science and machine learning platform, now includes **Visual Studio Code** as an IDE. This is part of a wider collaborative effort between Anaconda Inc. and Microsoft. This is big!
* [ONNX Models to be Runnable Natively on 100s of Millions of Windows Devices][5]. An announcement how the next major update to Windows will include the ability to run [**Open Neural Network Exchange**][6] (ONNX) models natively with hardware acceleration.
* [Windows Machine Learning overview][7]. Related to the link above is this link about **Windows Machine Learning** (Windows ML). Windows ML is a platform for local evaluation of trained machine learning models on Windows 10 devices.
* [Best of Data Science Weekly][9]. A good friend of mine here in South Africa, [Luis de Sousa][luis], publishes a weekly data science newsletter of all the best data science related news and blog posts. If you are interested in data science, you really should go ahead and subscribe.
* [The Grim Conclusions of the Largest-Ever Study of Fake News][10]. Not a data science article as such, however there is a lot of data science related material in the article. The article itself talks about fake news. Very interesting!

## SQL Server R Services

I am awesome (if I may say so myself)! Since the last week's [roundup][wr9_18] I have manged to finish off two posts about **SQL Server R Services**:

* [Microsoft SQL Server R Services: sp_execute_external_script - I][sext1]. First post in a couple, (maybe three), about `sp_execute_external_script`. In this post I look at some of the parameters of `sp_execute_external_script`.
* [Microsoft SQL Server R Services - sp_execute_external_script - II][sext2]. Second post about `sp_execute_external_script`. Here I look at how parameters are handled in `sp_execute_external_script`.

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
[luis]: https://twitter.com/luis_de_sousa

[1]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2018/03/07/what-is-azure-sql-database-managed-instance-2/
[2]: https://www.infoq.com/news/2018/03/event-driven-oreilly
[3]: https://groups.csail.mit.edu/tds/papers/Lynch/jacm85.pdf
[4]: https://www.infoq.com/news/2018/03/AnacondaShippingVSCOde
[5]: https://blogs.technet.microsoft.com/machinelearning/2018/03/07/onnx-models-to-be-runnable-natively-on-100s-of-millions-of-windows-devices/
[6]: https://github.com/onnx/onnx
[7]: https://docs.microsoft.com/en-us/windows/uwp/machine-learning/overview
[8]: https://blog.acolyer.org/2018/03/09/settling-payments-fast-and-private-efficient-decentralized-routing-for-path-based-transactions/
[9]: https://www.getrevue.co/profile/datascienceweekly
[10]: https://www.theatlantic.com/technology/archive/2018/03/largest-study-ever-fake-news-mit-twitter/555104/

[wr9_18]: {{< relref "2018-03-04-interesting-stuff---week-9.markdown" >}}

[sext1]: {{< relref "2018-03-07-microsoft-sql-server-r-services-sp_execute_external_script-I.markdown" >}}
[sext2]: {{< relref "2018-03-11-microsoft-sql-server-r-services---sp-execute-external-script---ii.markdown" >}}
