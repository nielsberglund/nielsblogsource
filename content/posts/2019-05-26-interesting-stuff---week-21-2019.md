---
type: post
layout: "post"
title: Interesting Stuff - Week 21, 2019
author: nielsb
date: 2019-05-26T10:02:45+02:00 
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server
  - SQL Server 2019
  - SQL Server Extensibility Framework
  - Kafka
  - Kafka Summit
  - Java
  - VS Code
  - Maven
description: Kafka, Kafka Summit videos, SQL Server 2019, and other interesting topics.
keywords:
  - SQL Server
  - SQL Server 2019
  - SQL Server Extensibility Framework
  - Kafka
  - Kafka Summit 
  - Java
  - VS Code
  - Maven  
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

## Streaming

* [Schemas, Contracts, and Compatibility][1]. This blog post looks at how Kafka together with its schema registry can be used in a microservices environment, potentially as a replacement for REST. Very interesting!
* [Kafka Summit London 2019 Session Videos][2]. In last weeks [roundup][3] I mentioned that I had attended the Kafka Summit in London. The organizers have now made all session videos and slides available. So go to the post I link to and look at the sessions that interest you!

## SQL Server 2019

* [Java & SQL Server 2019 Extensibility Framework: The Sequel][5]. In SQL Server 2019 CTP 2.5, Microsoft made some changes to requirements for writing Java code to be used by SQL Server. In this post, I look at what those changes are, and what our Java code should look like going forward.
* [SQL Server 2019 community technology preview 3.0 is now available][4]. The title says it all. Microsoft just released SQL Server 2019 CTP 3.0. Go and get it while it is hot! Oh, above I mentioned about changes in CTP 2.5 impacting how we write Java code for SQL Server. The 3.0 release has some additional changes, so expect a follow-up blog post about that.

## Next Weeks Roundup

I am away the whole of next week, and not back until Tuesday, June 4. Due to this, the roundup for next week may be delayed for a couple of days.

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
[ads]: https://twitter.com/azuredatastudio

[1]: https://www.confluent.io/blog/schemas-contracts-compatibility
[2]: https://www.confluent.io/blog/kafka-summit-london-2019-session-videos
[3]: {{< relref "2019-05-19-interesting-stuff---week-20-2019.md" >}}
[4]: https://cloudblogs.microsoft.com/sqlserver/2019/05/22/sql-server-2019-community-technology-preview-3-0-is-now-available/
[5]: {{< relref "2019-05-26-java--sql-server-2019-extensibility-framework-the-sequel.md" >}}