---
type: post
layout: "post"
title: Interesting Stuff - Christmas, New Year, Week 1, 2019
author: nielsb
date: 2019-01-06T17:13:57+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - SQL Server 2019 Java Extensions
  - Kafka
  - Python
  - Java
  - Stream processing
description: Kafka, stream processing SQL Server 2019 & Java, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - SQL Server 2019 Java Extensions
  - Kafka
  - Python
  - Java
  - Stream processing  
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me over the Christmas and New Year period.

<!--more-->

## Misc.

* [Identifying impactful service system problems via log analysis][1]. This is the dissection by [Adrian][adcol] of a white-paper about [Log3C][2], which is a general framework that identifies service system problems from system logs. Go off and read [Adrian][adcol]'s take on it, and then go and download [Log3C][2]!
* [Towards a theory of software development expertise][3]. The last paper [Adrian][adcol] looked at in 2018. The paper is about what is a good software developer, and how do you get better?

## Databases

* [DevOps for the Database][4]. An [InfoQ][iq] presentation trying to find the answer to why it is difficult to apply principles of DevOps to databases.

## Distributed Computing

* [Two-phase commit and beyond][5]. An excellent post by [Murat][murba] discussing the two-phase commit protocol. It is an excellent read, and if you have any interest in distributed computing, you should read the post.

## Data Science

* [GitHub Python Data Science Spotlight: AutoML, NLP, Visualization, ML Workflows][6]. A blog post which spotlights a select group of open source Python data science projects with GitHub repos. I am particularly interested in [Auto-Keras][7], and [MLFlow][8].

## .NET

* [How to Test ASP.NET Core Web API][9]. This is an [InfoQ][iq] article investigating testing ASP.NET Core 2.0 Web API solutions. The article looks at internal testing with Unit Testing and externally testing with a new testing framework in ASP.NET Core called *Integration Testing*.
* [A Quick Tour of the .NET CLI][10]. Another [InfoQ][iq] article, this time it covers how several .Net OSS tools take advantage of the dotnet cli and how we can use the new cli tooling in our daily development.

## Streaming

* [Microsoft open sources Trill to deliver insights on a trillion events a day][11]. A blog post introducing [Trill][12]; a high-performance streaming analytics engine. This is something I want to keep my eyes on!
* [Easy Ways to Generate Test Data in Kafka][13]. As the title says, a post discussing how to generate data for testing in Kafka.

## What Did Niels Do During the Holidays

I was a, (somewhat), busy bee during the holidays and managed to publish three blog posts:

* [SQL Server 2019 Extensibility Framework & Java - Null Values][14]. A post where I look at how to handle null values when calling Java code from SQL Server 2019.
* [SQL Server ML Services - Multiple Input Data Sets][15]. We look at how to push in multiple datasets to external scripts.
* [SQL Server 2019 Extensibility Framework & Java - Misc. "Stuff"][16]. We look at SQL Server 2019 Java Extensions, and Java packages, the CLASSPATH and JAR files.

Right now I am working on two more posts related to the **SQL Server 2019 Extensibility Framework**. I hope to publish at least one this coming week.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/
[charlblog]: https://charlla.com/

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
[benstop]: https://twitter.com/benstopford
[conflu]: https://twitter.com/confluentinc
[tylert]: https://twitter.com/tyler_treat
[andrewng]: https://twitter.com/AndrewYNg
[lawr]: https://twitter.com/bytezn
[jue]: https://twitter.com/b0rk
[yan]: https://twitter.com/theburningmonk
[danny]: https://twitter.com/g9yuayon
[rmoff]: https://twitter.com/rmoff
[ryansw]: https://twitter.com/ryanswanstrom
[pabloc]: https://twitter.com/pabloc_ds
[mklep]: https://twitter.com/martinkl
[mdavey]: https://twitter.com/matt_davey
[jboner]: https://twitter.com/jboner
[joeduff]: https://twitter.com/funcOfJoe
[charl]: https://twitter.com/charllamprecht
[dbricks]: https://twitter.com/databricks
[adsit]: https://twitter.com/SitnikAdam
[vicky]: https://twitter.com/vickyharp
[dscentral]: https://twitter.com/DataScienceCtrl
[natemc]: https://twitter.com/natemcmaster

[1]: https://blog.acolyer.org/2018/12/19/identifying-impactful-service-system-problems-via-log-analysis/
[2]: https://github.com/logpai/Log3C
[3]: https://blog.acolyer.org/2018/12/21/towards-a-theory-of-software-development-expertise/
[4]: https://www.infoq.com/presentations/devops-database
[5]: https://muratbuffalo.blogspot.com/2018/12/2-phase-commit-and-beyond.html
[6]: https://www.kdnuggets.com/2018/08/github-python-data-science-spotlight.html
[7]: http://autokeras.com
[8]: https://mlflow.org/docs/latest/index.html
[9]: https://www.infoq.com/articles/testing-aspnet-core-web-api
[10]: https://www.infoq.com/articles/netcore-cli
[11]: https://azure.microsoft.com/en-us/blog/microsoft-open-sources-trill-to-deliver-insights-on-a-trillion-events-a-day/
[12]: https://github.com/Microsoft/trill
[13]: https://www.confluent.io/blog/easy-ways-generate-test-data-kafka
[14]: {{< relref "2018-12-19-sql-server-2019-extensibility-framework--java---null-values.md" >}}
[15]: {{< relref "2018-12-24-sql-server-machine-learning-services---multiple-input-data-sets.md" >}}
[16]: {{< relref "2018-12-30-sql-server-2019-extensibility-framework--java---misc-stuff.md" >}}
