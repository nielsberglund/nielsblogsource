---
layout: post
title: Interesting Stuff - Week 8
author: nielsb
date: 2017-02-26T07:11:45+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - streaming
  - R Tools for Visual Studio
description: Weekly roundup of what interesting stuff I have found.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - streaming
  - R Tools for Visual Studio   
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

## SQL Server

* [Choosing a Primary Key][1]. Another post in [Sean Cremer's][2] series about database design. Full disclosure, he is a colleague of mine - but still a very good guy :). His SQL knowledge is immense!
* [SQL Server 2016 Developer Edition in Windows Containers][3]. Announcement and introduction to the availability of SQL Server 2016 Developer Edition in Windows containers. This is a "biggie" for me who often want to spin up a new SQL Server instance. Now I can just have a container with the instance on it and spin it up!
* [SQLskills SQL101: Stored Procedures][4]. First in a series of "back to the basics" by [Kimberly and Paul][5]. This covers my absolutely favorite feature in SQL Server: Stored Procedures! All you who are saying they are no good - I have a word for you: Heathens! :)
* [Architecting SQL Server on Linux: Slava Oks on Drawbridge, LibOS, & Addressing Between Windows/Linux][6]. A podcast with Slava Oks, where Slava talks the implementation of SQL Server on Linux.

## Streaming

* [Beam Graduates to Top-Level Apache Project][7]. [Beam][8] is an Apache project seeking to create a unified programming model for streaming and batch processing jobs, and to produce artifacts that can be consumed by a number of supported data processing engines.
* [Fundamentals of Stream Processing with Apache Beam][9]. More about Beam. This is a presentation about Beam's out-of-order stream processing as well as Beam tries to simplify complex tasks.
* [Kafka Summit New York][10]. If you are doing streaming, then you most likely are interested in or, at least, have heard about Kafka. The yearly Kafka conference are coming up, so go ahead and register.

## Data Science

* [Data Science in the Cloud @StitchFix][11]. A conference presentation about how the cloud enables over 80 data scientists to be productive at [StichFix][12].
* [Elastic Data Analytics Platform @Datadog][13]. Conference presentation about [DataDog's][14] cloud-based analytics platform and how it differs from a traditional datacenter-based analytics stack. 
* [R Tools for Visual Studio][15]. **R Tools for Visual Studio** are getting closer and closer to a version 1.0 release.
* [Prophet - Forecasting at Scale][16]. Prophet is an open-source package for R and Python that implements the time-series methodology that Facebook uses in production for forecasting at scale. Looks very, very interesting.
* [Microsoft R Server][17]. I have to do some shameless self-promotion :). This is a blogpost by me comparing how CRAN R handles large datasets compared to Microsoft R Server.


That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[de]: /derivco
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[1]: https://seancremer.github.io/ChoosingAPrimaryKey.html
[2]: https://seancremer.github.io
[3]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2017/02/21/sql-server-2016-developer-edition-in-windows-containers/
[4]: https://www.sqlskills.com/blogs/kimberly/sqlskills-sql101-stored-procedures/
[5]: https://www.sqlskills.com/
[6]: https://www.infoq.com/podcasts/slava-oks-linux-sql-server
[7]: https://www.infoq.com/news/2017/02/apache-beam-top-level
[8]: https://beam.apache.org/
[9]: https://www.infoq.com/presentations/stream-apache-beam
[10]: https://kafka-summit.org/events/kafka-summit-ny/
[11]: https://www.infoq.com/presentations/stitchfix-cloud
[12]: https://www.stitchfix.com/
[13]: https://www.infoq.com/presentations/datadog-cloud
[14]: https://www.datadoghq.com/
[15]: http://microsoft.github.io/RTVS-docs/
[16]: https://facebookincubator.github.io/prophet/
[17]: http://www.nielsberglund.com/2017/02/25/microsoft-r-server/
