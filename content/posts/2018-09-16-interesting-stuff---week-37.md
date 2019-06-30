---
type: post
layout: "post"
title: Interesting Stuff - Week 37
author: nielsb
date: 2018-09-16T08:17:48+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Azure Data Lake Storage Gen 2
  - Kafka
  - KSQL
  - SQL Saturday
description: Kafka and KSQL, Azure Data Lake Storage Gen2, SQL Server Query Plans, and other interesting topics!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Azure Data Lake Storage Gen 2
  - Kafka
  - KSQL
  - SQL Saturday   
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

* [SQL Server Execution Plans, 3rd Edition][1]. The third edition of [Grant Fritchey's][grantf] excellent book about SQL Server Query Plans. If you are a developer or a DBA, you need to get this book (and read it).

## Distributed Computing

* [Complex Event Flows in Distributed Systems][2]. This is an [InfoQ][iq] presentation how lightweight and highly-scalable state machines ease the handling of complex logic and flows in distributed systems.

## Azure

* [Real-time data analytics and Azure Data Lake Storage Gen2][3]. Microsoft recently announced [Azure Data Lake Storage Gen 2][4] (ADLS2), and this blog post looks at how ADLS2 can be used for real-time analytics. ADLS2 is at the moment in preview. I certainly hope that MS releases it soon. 

## Streaming

* [Keystone Real-time Stream Processing Platform][5]. This is a blog post about Keystone; Netflix’s data backbone. It is an essential piece of infrastructure focusing on data analytics. I found this post very interesting, and if you are interested in stream processing, you should really read this post.
* [Streams and Tables: Two Sides of the Same Coin][6]. This blog post announces the availability of the white-paper [Streams and Tables: Two Sides of the Same Coin][7]. The paper introduces the Dual Streaming Model, which is used to reason about physical and logical order in data stream processing. This is a **MUST** read!
* [Hands on: Building a Streaming Application with KSQL][8]. In this blog post, we see how we can build a demo streaming application with KSQL, the streaming SQL engine for Apache Kafka. The application continuously computes, in real time, top music charts based on a stream of song play events.

## SQL Saturday

So the SQL Saturday "season" is over for me for this year. I did one talk in [Johannesburg][sqlsatjhb_1], two in Cape Town ([this][sqlsatcpt_ml] and [this][sqlsatcpt_sp]), and one in [Durban][sqlsatdbn_sp]. 

In addition to the conference talks I also did a full-day workshop in Cape Town and Durban about SQL Server Machine Learning Services: **[A Day of SQL Server Machine Learning Services with Niels Berglund][sqlsatdbn_pre]**.

When we talk about SQL Saturdays I want to thank the organisers in the various cities:

* [Michael Johnson][michael] and team in Johannesburg.
* [Jody Roberts][jodyr] and [Jeanne Combrink][jeanne] and their team in Cape Town.
* [Jodi Craig][jodic] and team in Durban.

They are doing a fantastic work, entirely voluntarily. A HUGE, HUGE **THANK YOU** to all of you!

## SQL Server Machine Learning Services

Now when SQL Saturday is over, I plan to get back to write about **SQL Server Machine Learning Services**. I am working right now on the third post in the [Install R Packages in SQL Server ML Services](/series/sql_server_ml_services_install_packages) series. I hope to be able to publish it in a week or two.

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
[grantf]: https://twitter.com/gfritchey
[jodic]: https://www.linkedin.com/in/jodi-craig-1827b844/
[michael]: https://twitter.com/MikeJohnsonZA/
[jodyr]: https://twitter.com/Jody_WP
[jeanne]: https://twitter.com/TheSQLGirl

[1]: https://www.red-gate.com/products/dba/sql-monitor/entrypage/execution-plans
[2]: https://www.infoq.com/presentations/event-flow-distributed-systems
[3]: https://azure.microsoft.com/en-us/blog/real-time-data-analytics-and-azure-data-lake-storage-gen2/
[4]: https://azure.microsoft.com/en-us/services/storage/data-lake-storage/
[5]: https://medium.com/netflix-techblog/keystone-real-time-stream-processing-platform-a3ee651812a
[6]: https://www.confluent.io/blog/streams-tables-two-sides-same-coin
[7]: https://www.confluent.io/thank-you/streams-and-tables-two-sides-of-the-same-coin/
[8]: https://www.confluent.io/blog/building-streaming-application-ksql/

[sqlsatjhb_1]: http://www.sqlsaturday.com/785/Sessions/Details.aspx?sid=84967
[sqlsatcpt]: http://www.sqlsaturday.com/793/EventHome.aspx
[sqlsatcpt_ml]: http://www.sqlsaturday.com/793/Sessions/Details.aspx?sid=84975
[sqlsatcpt_sp]: http://www.sqlsaturday.com/793/Sessions/Details.aspx?sid=84978
[sqlsatcpt_pre]: https://www.quicket.co.za/events/47683-sqlsaturday-cape-town-2018-precon-a-drill-down-into-sql-server-machine-learning/#/
[sqlsatdbn]: http://www.sqlsaturday.com/803/EventHome.aspx
[sqlsatdbn_sp]: http://www.sqlsaturday.com/803/Sessions/Details.aspx?sid=85097
[sqlsatdbn_pre]: https://www.quicket.co.za/events/55545-sqlsaturday-durban-precon-2018-a-day-of-sql-server-machine-learning-services/#/
