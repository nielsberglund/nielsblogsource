---
type: post
layout: "post"
title: Interesting Stuff - Week 26, 2022
author: nielsb
date: 2022-07-03T10:03:19+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/data-vault.jpg"
categories:
  - roundup
tags:
  - SQL Server
  - Azure Data Explorer
  - Playfab
  - Databricks
  - Kafka
  - KStreams
description: Kafka & KStreams state store, SQL Server 2022 blog links, Azure Data Explorer & Playfab, Databricks Data Vault, other interesting topics!
keywords:
  - SQL Server
  - Azure Data Explorer
  - Playfab
  - Databricks
  - Kafka
  - KStreams   
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

This blog post is the "roundup" of the things that have been most interesting to me for the week just ending.

<!--more-->

## SQL Server

* [Microsoft SQL Server Blog][1]. If you follow what happens in the database world, you probably know that Microsoft SQL Server 2022 is now in Public Preview. This version of SQL Server promises to be a pretty impressive release, so I suggest two things: [download the preview][2] and test it out, and bookmark the SQL Server 2022 Blogging Series page in the linked post to follow along and see future blog posts.

## Azure Data Explorer

* [Take advantage of Azure Data Explorer with Playfab data connections][3]. PlayFab is a complete backend platform for live games with managed game services, real-time analytics, and LiveOps, and you can read more about it [here][4]. This post announces how there is now an **Azure Data Explorer** connector for PlayFab. Based on what we are doing in [Derivco](/derivco), PlayFab sounds like something we really should look into, and having **Azure Data Explorer** connectors makes it even more so.

## Data Architecture

* [Databricks strikes back][5]. Databricks held its [Data+AI Summit 2022][6] last week (June 27 - 30). The post linked to was published the same day as the Summit started, and it looks at the full range of announcements during the conference (yes, the author of the post was pre-briefed by Databricks). Some very cool "stuff" there!
* [Prescriptive Guidance for Implementing a Data Vault Model on the Databricks Lakehouse Platform][7]. Another Databricks-related post, this one by Databricks themselves. The post discusses Data Vault's and how to implement them within the Bronze/Silver/Gold layer. It also looks at how to get the best performance of Data Vault with Databricks Lakehouse Platform.

## Streaming

* [Kafka Streams: State Store][8]. Kafka Streams stateful processing enables grouping related events that arrive at different times. Operations such as joins, reduce, counts, and aggregations can then be performed on them. That is all well and good, but the previously mentioned functionality would require state to be stored. This post dives into how state is stored in KStreams, and I found it very informative!

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

[1]: https://cloudblogs.microsoft.com/sqlserver/2022/06/30/introducing-the-sql-server-2022-blog-series/
[2]: https://info.microsoft.com/ww-landing-sql-server-2022.html
[3]: https://blog.playfab.com/blog/take-advantage-of-azure-data-explorer-with-playfab-data-connections
[4]: https://docs.microsoft.com/en-us/gaming/playfab/what-is-playfab
[5]: https://venturebeat.com/2022/06/28/databricks-strikes-back/
[6]: https://databricks.com/dataaisummit/
[7]: https://databricks.com/blog/2022/06/24/prescriptive-guidance-for-implementing-a-data-vault-model-on-the-databricks-lakehouse-platform.html
[8]: https://medium.com/@robgolder/kafka-streams-state-store-30110bf4f24
