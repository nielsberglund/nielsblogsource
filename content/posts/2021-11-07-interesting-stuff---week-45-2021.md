---
type: post
layout: "post"
title: Interesting Stuff - Week 45, 2021
author: nielsb
date: 2021-11-07T08:13:38+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server
  - Kafka
  - ksqlDB
  - PASS
  - Cloud Data Driven
description: Kafka, ksqlDB & streaming databases, Niels @ PASS & Cloud Data Driven, and other interesting topics.
keywords:
  - SQL Server
  - Kafka
  - ksqlDB
  - PASS
  - Cloud Data Driven   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth that has to do with things that interest me:

* AI/data science
* data in general
* data architecture
* streaming
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## SQL Server

* [Announcing the SQL Server 2022 Early Adoption Program][2]. The [Microsoft Ignite][3] conference was held during the week just gone by. As expected, there were quite a few announcements around new and improved products. One such announcement was related to this post; the next version of SQL Server is in the works, and Microsoft has just opened the **Early Adoption Program** (EAP) for **SQL Server 2022**. If you are interested in shaping the next version of SQL Server, I suggest you sign up!

## Streaming

* [Architecting a Kafka-centric Retail Analytics Platform — Part 2][4]. In [last weeks roundup][1], I linked to the first post in a series, of which this post is the second instalment. In this post, the author, [Dunith Dhanushka][dunith], looks at data ingestion into Kafka in detail. As the series is about retail, the post looks at the retail data landscape, what data to capture, and how it can be ingested into Kafka using the Kafka ecosystem.
* [Readings in Streaming Database Systems][5]. This post is the introduction/prequel to a series looking at streaming databases: **The Streaming Database Series**. This post gives a high level overview of what's coming in the posts in the series.  It also provides an overview of streaming databases.
* [The Future of SQL: Databases Meet Stream Processing][6]. This post is the first in the **The Streaming Database Series** mentioned above. The post discusses why the database world needs enhancements to handle data both at rest and in transit. The enhancements looked at are the `STREAM` abstraction, new query types, and extended semantics for handling time.
* [4 Key Design Principles and Guarantees of Streaming Databases][7]. The second in the series mentioned above, this post summarizes a few challenging design principles for modern streaming databases that act as a source of truth for stream data management and query processing systems. The post also presents ksqlDB's persistent log-based approach to following the design principles.
* [How Do You Change a Never-Ending Query?][8]. The post linked to is the third in the **The Streaming Database Series**. The post looks at how we can evolve queries in a streaming database and some of the pitfalls that may occur.

## WIND (What Is Niels Doing)

Now is the conference season, and I am presenting at [**Cloud Data Driven**][11]:

![](/images/posts/improve-clv.jpg)

**Figure 1:** *Cloud Data Driven*

I will be talking about how to calculate Customer Lifetime Value using Azure Databricks. If you are interested, the registration is **FREE**, so go ahead and [**register**][9].

As you see, the presentation is on Thursday, November 11. If you read the last week's [roundup][1], you may have noticed this:

![](/images/posts/PASS-I-am-speaking-800.png)

**Figure 2:** *PASS Session*

Yes, I am doing a live PASS Q&A the same day. The PASS session id for my [**Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer**][10] presentation. Fortunately, the PASS session is 3:15 - 3:45 pm UTC, and my Cloud Data Driven presentation is at 4 pm UTC. Phew!

So here is an idea; get a double dose of Niels:

* [Register][12] (FREE) for PASS now, view the [**Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer**][10] recorded video and come and chat to me [Thursday, Nov 11 15:15 - 15:45 UTC][10].
* [Register][9] and attend my Cloud Data Driven presentation.

Yay, Niels on Thursday from 3:15 UTC. What could be better than that? Actually, don't answer that question. 

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
[dunith]: https://twitter.com/dunithd

[1]: {{< relref "2021-10-31-interesting-stuff---week-44-2021.md" >}}
[2]: https://techcommunity.microsoft.com/t5/sql-server/announcing-the-sql-server-2022-early-adoption-program/ba-p/2910617
[3]: https://myignite.microsoft.com/home
[4]: https://medium.com/event-driven-utopia/architecting-a-kafka-centric-retail-analytics-platform-part-2-137bfac04001
[5]: https://www.confluent.io/blog/streaming-databases-vs-traditional-databases/
[6]: https://www.confluent.io/blog/databases-meet-stream-processing-the-future-of-sql/
[7]: https://www.confluent.io/blog/streaming-database-design-principles-and-guarantees/
[8]: https://www.confluent.io/blog/streaming-databases-cloud-data-in-motion-never-rests/
[9]: https://www.eventbrite.com/e/improve-customer-lifetime-value-using-azure-databricks-delta-lake-tickets-189230642947
[10]: https://passdatacommunitysummit.com/sessions/265026
[11]: https://www.linkedin.com/company/clouddatadriven/
[12]: https://reg.passdatacommunitysummit.com/flow/redgate/summit2021/registrationopeningpage/page/introlanding
