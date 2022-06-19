---
type: post
layout: "post"
title: Interesting Stuff - Week 24, 2022
author: nielsb
date: 2022-06-19T13:40:48+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - AI
  - distributed computing
  - SQL Server
  - Azure Data Studio
  - Azure Data Explorer
  - Kafka
description: Kafka & Confluent Cloud incidents, performant software, tools 4 SQL Server, Azure Data Explorer features, and other interesting topics!
keywords:
  - AI
  - distributed computing
  - SQL Server
  - Azure Data Studio
  - Azure Data Explorer
  - Kafka
---
  
![](/images/posts/performance.jpg)

**Performance** *Photo by <a href="https://unsplash.com/@toddquackenbush?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Todd Quackenbush</a> on <a href="https://unsplash.com/s/photos/performance?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>*

Throughout the week, I read a lot of blog-posts, articles, and so forth that has to do with things that interest me:

* AI/data science
* data in general
* data architecture
* streaming
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## Misc.

* [Making Code Faster][2]. This post is a continuation of the post [here][4], which I covered in the roundup for [week 19, 2022][3]. The post discusses various approaches to performance testing of your code. Very interesting!

##  Machine Learning/AI

* [Distributed Computing for AI: A Status Report][5]. The post linked to looks at what role distributed computing plays in AI. The consensus is that it becomes more and more essential to understand distributed computing in AI projects. Also, when hiring for AI, you often compete with "pure" distributed computing roles.

## SQL Server

* [Recapping recent updates to client tools in SQL Server][6]. It has been a while since I have covered tools for SQL Server. Let me rectify that with this link. As the title implies, this post looks at SQL Server tools. What caught my eye was the notebook enhancements in **Azure Data Studio** and the containerization of Azure SQL Database! Cool stuff!

## Azure Data Explorer

* [5 Ways in which ADX can provide a leading edge to your Data Platform][7]. I am pretty "fond" of **Azure Data Explorer** as you know if you read my blog. I particularly like the super-fast ingestion and querying and the ability to do real-time analysis! However, there are other advantages of ADX, and the post I have linked to looks at 5 of those.

## Streaming

* [How Confluent Treats Incidents in the Cloud][1]. Since we at [Derivco](/derivco) looks at using Confluent Cloud, this post came in real handy. As the title says, the post looks at Confluent Cloud incidents and how they are handled. Very informative!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. Please comment on this post or [ping][ma] me if you have ideas for what to cover.

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
[ads]: https://twitter.com/azuredatastudio
[travw]: https://twitter.com/radtravis
[emilk]: https://twitter.com/IsTheArchitect
[netflx]: https://netflixtechblog.com/



[1]: https://www.confluent.io/blog/cloud-incident-management-at-confluent/
[2]: https://www.tbray.org/ongoing/When/202x/2022/06/10/Quamina-Optimizing
[3]: {{< relref "2022-05-15-interesting-stuff---week-19-2022.md" >}}
[4]: https://github.com/timbray/quamina
[5]: https://gradientflow.com/distributed-computing-for-ai-a-status-report/
[6]: https://cloudblogs.microsoft.com/sqlserver/2022/06/15/recapping-recent-updates-to-client-tools-in-sql-server/
[7]: https://www.linkedin.com/pulse/5-ways-which-adx-can-provide-leading-edge-your-data-platform-dixit/