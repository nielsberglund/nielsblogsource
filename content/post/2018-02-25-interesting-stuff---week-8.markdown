---
layout: post
title: Interesting Stuff - Week 8
author: nielsb
date: 2018-02-25T11:06:52+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - flink
  - AI
description: Streaming with Kafka and Flink, AI chat-bots, and other interesting things!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - flink
  - AI   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* AI
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending.

<!--more-->

## .NET

* [Steeltoe and the Open Source .NET Renaissance][1]. A discussion about the .NET platform renaissance, the [Steeltoe][2] framework, and a demonstration how to build resilient microservices with ASP.NET Core.

## Streaming

* [Streaming SQL Foundations: Why I ❤Streams+Tables][3]. An [InfoQ][iq] presentation about what is required to provide robust stream processing support in SQL. It also and discusses concrete efforts that have been made in the stream processing area by the Apache Beam, Calcite, and Flink communities.
* [The Power of Distributed Snapshots in Apache Flink][4]. Another [InfoQ][iq] presentation. This time about how Apache Flink handles stateful stream processing and how to manage distributed stream processing and data-driven applications efficiently with Flink's checkpoints and savepoints.
* [Securing KSQL][5]. A blog post looking at stream processing examples using KSQL, as well as how to secure KSQL and the entire Confluent Platform with encryption, authentication, and authorisation.

## Data Science & AI

* [The Microsoft Artificial Intelligence Landscape – And What to use When][6]. A blog post by [Buck Woody][buckw], where he talks about what Microsoft offers in terms of AI.
* [Machine Learning in R with TensorFlow][7]. This post is from [David][revod] at [Revolution Analytics][re], and he talks about how to use [TensorFlow][8] in R.
* [Conversational AI chat-bot — Architecture overview][9]. Lately, I have become interested in AI chat-bots, so this article which gives an overview of a typical architecture to build a conversational AI chat-bot is right "down my ally".

## SQL Server R Services

I am starting to feel bad about not being able to publish the promised post about `sp_execute_external_script`. The reason for this is that a lot going on at work at the moment. In the meantime, [here][sinst] is the link to the first post in the **SQL Server R Services** series. 

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

[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}

[1]: https://www.infoq.com/presentations/steeltoe-net-microservices
[2]: https://steeltoe.io/
[3]: https://www.infoq.com/presentations/beam-model-stream-table=theory
[4]: https://www.infoq.com/presentations/distributed-stream-processing-flink
[5]: https://www.confluent.io/blog/securing-ksql/
[6]: https://blogs.msdn.microsoft.com/buckwoody/2018/02/22/the-microsoft-artificial-intelligence-landscape-and-what-to-use-when/
[7]: http://blog.revolutionanalytics.com/2018/02/r-with-tensorflow.html
[8]: https://www.tensorflow.org/
[9]: https://towardsdatascience.com/architecture-overview-of-a-conversational-ai-chat-bot-4ef3dfefd52e


