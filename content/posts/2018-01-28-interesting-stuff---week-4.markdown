---
layout: post
title: Interesting Stuff - Week 4
author: nielsb
date: 2018-01-28T14:05:43+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server on Linux
  - Python
  - Keras
  - flink
  - SQL Server R Services
description: SQL Server on Linux, use JSON for de-normalizing data, Apache Flink, Keras, Python and other cool "stuff"!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server on Linux
  - Python
  - Keras
  - flink
  - SQL Server R Services  
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

* [SQL Server 2017 on Linux webcast series][1]. I guess that anyone interested in SQL Server knows about SQL Server on Linux. This blog-post announces a series of webcasts covering SQL Server on Linux.
* [Simplify data access using de-normalized models][2]. A very interesting post by [Jovan][jovpop] how to use JSON to de-normalise database models.

## .NET

* [Resources for Learning about .NET Internals][3]. [Matthew][mattw] posts some very awesome links if you want to learn about .NET internals!

## Misc.

* [A practitioner’s guide to reading programming languages papers][6]. A "cheat-sheet" from [Adrian][adcol] about how to read programming language white-papers.

## Data Science

* [Data Science Virtual Machine][4]. This is the first episode of the AI Show from [Channel9][5] talking about the Data Science Virtual Machine (DSVM).
* [How to build your own AlphaZero AI using Python and Keras][7]. In the [week 2 roundup][int2] I linked to a post about AlphaZero, the AI application from [DeepMind][8], who teaches itself to play multiple board-games, like GO, chess, etc. In this post, David Foster - from Applied Data Science - shows how you can build something similar with Python and Keras. Very cool!!

## Streaming

* [Streaming Data in the Enterprise Hits a Tipping Point: Our 2018 Predictions][9]. Prediction from dataArtisans about the streaming and streaming technologies in 2018.
* [Managing Large State in Apache Flink: An Intro to Incremental Checkpointing][10]. An introduction to check-pointing, which is the mechanism Apache Flink uses to make application state fault tolerant. Extremely interesting!

## SQL Server R Services

I am busy finishing off the last post about SQL Server R Services internals: **Internals - XX**, and I hope to be able to publish it this coming week sometime. After the *Internals - XX*, there will be one or two more posts in the series, but then I am done.

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

[int2]: {{< relref "2018-01-14-interesting-stuff---week-2.markdown" >}}


[1]: https://blogs.technet.microsoft.com/dataplatforminsider/2018/01/22/sql-server-2017-on-linux-webcast-series/
[2]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2018/01/24/simplify-data-access-using-de-normalized-models/
[3]: http://mattwarren.org/2018/01/22/Resources-for-Learning-about-.NET-Internals/
[4]: https://channel9.msdn.com/Shows/AI-Show/Data-Science-Virtual-Machine
[5]: https://channel9.msdn.com/
[6]: https://blog.acolyer.org/2018/01/26/a-practitioners-guide-to-reading-programming-languages-papers/
[7]: https://medium.com/applied-data-science/how-to-build-your-own-alphazero-ai-using-python-and-keras-7f664945c188
[8]: https://en.wikipedia.org/wiki/DeepMind
[9]: https://data-artisans.com/blog/streaming-data-in-the-enterprise-hits-a-tipping-point
[10]: https://data-artisans.com/blog/managing-large-state-apache-flink-incremental-checkpointing-overview
