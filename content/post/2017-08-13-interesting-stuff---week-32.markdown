---
layout: post
title: Interesting Stuff - Week 32
author: nielsb
date: 2017-08-13T20:12:03+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - CNTK
  - microservices
description: Interesting stuff about microservices, Microsoft Cognitive Toolkit, HDInsight, Azure and a lot of other "stuff".
keywords:
  - data science
  - distributed computing
  - SQL Server
  - CNTK
  - microservices   
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

## Distributed Computing

* [Patterns of Microservices Architecture][1]. [Phil Calcado][2] is an expert on microservices architecture. The post I am pointing to contains links to articles about patterns in microservices architecture.

## Data Science

* [Selling Analytics to your Stakeholders][3]. If you are a data scientist, or a data nerd in general, or a manager - this article is a **MUST** read. Enough said!
* [Tutorial: Publish an R function as a SQL Server stored procedure with the sqlrutils package][4]. "Aw schucks, blush" - the guys at [Revlution Analytics][re] points to a [blog-post][5] of mine, how to use the `sqlrutils` package to create SQL Server stored procedures from R code. Thanks guys!!!
* [Using Microsoft R Server Operationalization on HDInsight][6]. Microsoft R Server has an awesome operationalization story! This blog-post talks about how to do it on HDInsight!

The guys at [Revolution Analytics][re] have really been busy the last week. Apart from the post above about `sqlrutils`, the rest of the content under Data Science comes from them!

* [Tutorial: Deep Learning with R on Azure with Keras and CNTK][8]. [Microsoft Cognitive Toolkit][9] (CNTK) is a commercial-grade and open-source framework for deep learning tasks. Unfortunately for you if you are an R programmer, CNTK does not have an R interface (too bad, so sad!). Fortunately however, the RStudio team has developed an R interface for [Keras][7] making it possible to run CNTK (plus other deep learning backends), from within an R session.
* [dplyrXdf 0.10.0 beta prerelease][10]. The **dplyr** package is a toolkit for data transformation and manipulation. It is a great package, but it has the "usual" R limitations of everything being in-memory. The **dbplyrXdf** package however, does not requires all data to be stored in memory, but it allows it to be stored on disk as well, which will make it ideal for handling really large datasets.
* [In case you missed it: July 2017 roundup][11]. The monthly roundup from [Revolution Analytics][re], quite a few interesting things to have a look at!

## SQL Server R Services

I am still working on episode *Internals - IX* in the **SQL Server 2016 R Services** series. I had aimed to have it published this weekend, but work "reared its ugly head, so ...". However, I am fairly confident I'll be able to publish it before the coming weekend! If you are interested in the previous "episodes" they can be found [here][si1].

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: http://philcalcado.com/microservices-patterns.html
[2]: https://twitter.com/pcalcado
[3]: https://medium.com/towards-data-science/selling-analytics-to-your-stakeholders-3e516cd6cc2b
[4]: http://blog.revolutionanalytics.com/2017/08/tutorial-sqlrutils.html
[5]: {{< relref "2017-06-25-creating-r-stored-procedures-in-sql-server-2016-using-sqlrutils.markdown" >}}
[6]: https://blogs.msdn.microsoft.com/rserver/2017/08/07/using-microsoft-r-server-operationalization-on-hdinsight/
[7]: https://keras.io/
[8]: http://blog.revolutionanalytics.com/2017/08/keras-and-cntk.html
[9]: https://www.microsoft.com/en-us/cognitive-toolkit/
[10]: http://blog.revolutionanalytics.com/2017/08/dplyrxdf-0100-beta-prerelease.html
[11]: http://blog.revolutionanalytics.com/2017/08/in-case-you-missed-it-july-2017-roundup.html
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
