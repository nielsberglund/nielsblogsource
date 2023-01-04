---
type: post
layout: "post"
title: Interesting Stuff - Week 46
author: nielsb
date: 2018-11-18T08:22:25+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server 2019
  - SQL Server Machine Learning Services
  - Kafka
  - Flink
  - Power BI
  - .NET
  - Facebook Prophet
description: Kafka connectors, Flink, Facebook Prophet, Power BI and AI, and a lot of other topics!
keywords:
  - data science
  - distributed computing
  - SQL Server 2019
  - SQL Server Machine Learning Services
  - Kafka
  - Flink
  - Power BI
  - .NET
  - Facebook Prophet 
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

* [Building C# 8.0][1]. A post about new functionality in the upcoming C# 8 release. Some very interesting new features, and it looks like C# gets more and more features that you normally find in F#.
* [Sample performance investigation using BenchmarkDotNet and PerfView][2]. In this blog post [Adam][adsit] describes how he approaches sample performance problem using available free .NET tools and best practices for performance engineering. 

## Misc.

* [My Emacs journey][3]. This blog post by [Murat][murba], where he talks about Emacs, brings me back to the early days of .NET, (pre 1.0), where I created an Emacs .NET intellisense extension. Ah, those were the days!

## Distributed Computing

* [Overload control for scaling WeChat microservices][5]. In this blog post [Adrian][adcol] looks at a white paper discussing how [WeChat][4] handles overload control. Some very impressive numbers and quotes: *"WeChat’s microservice system accommodates more than 3000 services running on over 20,000 machines in the WeChat business system, and these numbers keep increasing as WeChat is becoming immensely popular… As WeChat is ever actively evolving, its microservice system has been undergoing fast iteration of service updates. For instance, from March to May in 2018, WeChat’s microservice system experienced almost a thousand changes per day on average."*. Think about that; 20,000 machines, thousand code changes per day, wow!

## Streaming

* [Stream processing: An Introduction to Event Time in Apache Flink][6]. Apache Flink supports multiple notions of time for stateful stream processing. This post focuses on event time support in Apache Flink. 
* [Kafka Connect Deep Dive – Converters and Serialization Explained][7]. In this article [Robin Moffat][rmoff] takes us through how serialization works in Kafka Connectors.

## SQL Server 2019

* [Creating a data hub for your analytics with PolyBase][8]. SQL Server 2019 CTP 2.0 introduces new connectors for PolyBase, and this blog post discusses how the new connectors enable customers to leverage PolyBase for creating a virtual data hub for a wide variety of data sources within the enterprise. Very interesting!  

## Data Science / AI

* [The Ultimate R Cheatsheet][9]. As the title says, this post points to an impressive cheatsheet for R.
* [Intro to Data Science for Managers [Mindmap]][10]. Data science is incredibly broad and complex discipline and can be daunting trying to get your head around. So this blog post tries to mind-map the various key data science concepts and techniques in order to make data science easier to grasp. 
* [Announcing new AI Capabilities for Power BI to make AI Accessible for Everyone][11]. I guess the title of this blog posts says it all. It announces new AI capabilities for Power BI. This is huge, and I can not wait to test it out!
* [Big Data and Deep Learning: A Tale of Two Systems][12]. An [InfoQ][iq] presentation about how Uber tackles data caching in large-scale deep learning, its ML architecture and discusses how Uber uses Big Data. The presentation concludes by sharing AI use cases.
* [Implementing Facebook Prophet efficiently][13]. I wrote back in 2017 about Facebook Prophet and how to run it in [Microsoft R Server][14] as well as [SQL Server Machine Learning Services][14]. The blog post I link to [here][13] discusses how to optimize Prophet. Very interesting!

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

[1]: https://blogs.msdn.microsoft.com/dotnet/2018/11/12/building-c-8-0/
[2]: https://adamsitnik.com/Sample-Perf-Investigation/
[3]: https://muratbuffalo.blogspot.com/2018/11/my-emacs-journey.html
[4]: https://www.wechat.com/en/
[5]: https://blog.acolyer.org/2018/11/16/overload-control-for-scaling-wechat-microservices/
[6]: https://data-artisans.com/blog/stream-processing-introduction-event-time-apache-flink
[7]: https://www.confluent.io/blog/kafka-connect-deep-dive-converters-serialization-explained
[8]: https://cloudblogs.microsoft.com/sqlserver/2018/11/13/creating-a-data-hub-for-your-analytics-with-polybase/
[9]: https://www.datasciencecentral.com/profiles/blogs/the-ultimate-r-cheatsheet
[10]: https://www.datasciencecentral.com/profiles/blogs/data-science-for-managers-mindmap
[11]: https://powerbi.microsoft.com/en-us/blog/power-bi-announces-new-ai-capabilities/
[12]: https://www.infoq.com/presentations/uber-big-data-dl-ml
[13]: https://towardsdatascience.com/implementing-facebook-prophet-efficiently-c241305405a3
[14]: {{< relref "2017-05-20-facebook-prophet-and-microsoft-r-server.markdown" >}}
