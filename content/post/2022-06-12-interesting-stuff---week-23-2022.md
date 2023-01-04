---
type: post
layout: "post"
title: Interesting Stuff - Week 23, 2022
author: nielsb
date: 2022-06-12T15:27:08+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/snowflake.jpg"
categories:
  - roundup
tags:
  - Microsoft-Intelligent-Data-Platform
  - Databricks Unity
  - Snowflake
  - Debezium
  - Confluent Cloud
description: Kafka & scaling of Confluent Cloud clusters, Microsoft Intelligent Data Platform, Debezium & Snowflake, and other interesting topics. 
keywords:
  - Microsoft-Intelligent-Data-Platform
  - Databricks Unity
  - Snowflake
  - Debezium
  - Confluent Cloud  
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

## Data

* [A New Microsoft Platform in Town: the Microsoft Intelligent Data Platform][1]. This [InfoQ][iq] post looks at the recently introduced Microsoft Intelligent Data Platform. This new platform fully integrates Microsoft's database, analytics, and governance offerings. It encompasses everything already available in the Azure Data space (Azure Data Factory, Azure Data Explorer, etc.) to the Synapse Analytics products, Power BI, and the newly rebranded Purview data governance service.
* [Announcing the Availability of Data Lineage With Unity Catalog][2]. This post talks about the Databricks Data Lineage offering using the Unity Catalog. It looks at how the Unity Catalog provides automated and real-time data lineage at a granular level for all workloads (SQL, R, Python, Scala) and across all asset types (notebooks, workflows, dashboards). Very cool!

## Streaming

* [Debezium to Snowflake: Lessons learned building data replication in production][3]. This blog looks at lessons learned when using Debezium to replicate data at scale in near real-time to Snowflake. There are some very useful tidbits in the post, even though we don't use Snowflake at [Derivco](/derivco)!
* [How to Elastically Scale Apache Kafka Clusters on Confluent Cloud][4]. In last week's [roundup][5], I mentioned Confluent Cloud's elasticity compared with on-prem Kafka, and we saw how much better it was in Confluent Cloud. The post here covers how we can easily resize a Confluent Cloud cluster and how it works internally. Very interesting!

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

[1]: https://www.infoq.com/news/2022/06/new-intelligent-data-platform/
[2]: https://databricks.com/blog/2022/06/08/announcing-the-availability-of-data-lineage-with-unity-catalog.html
[3]: https://medium.com/shippeo-tech-blog/debezium-to-snowflake-lessons-learned-building-data-replication-in-production-a5430a9fe85b
[4]: https://www.confluent.io/blog/elastically-scale-apache-kafka-clusters-in-confluent-cloud/
[5]: {{< relref "2022-06-05-interesting-stuff---week-22-2022.md" >}}
