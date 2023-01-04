---
layout: post
title: Interesting Stuff - Week 26
author: nielsb
date: 2018-07-01T05:51:55+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - Databricks
  - Azure Data Lake Store
description: Kafka (of course), Azure Data Lake store, Azure Databricks, RStudio and other interesting things! 
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - Databricks
  - Azure Data Lake Store   
---

Geez, does time fly or what? We are already past the halfway mark of the year! Anyway, throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending.

<!--more-->

## Databases

* [A one size fits all database doesn't fit anyone][13]. A very interesting post by [Werner Vogels][14], CTO at Amazon, where he argues that (from the article): *The days of the one-size-fits-all monolithic database are behind us, and developers are now building highly distributed applications using a multitude of purpose-built databases.*. As I said, a very interesting read!

## Streaming

* [We ❤ syslogs: Real-time syslog processing with Apache Kafka and KSQL—Part 3: Enriching events with external data][9]. This article is the third in the series about syslog processing and Apache Kafka. In this episode [Robin Moffat][rmoff] discusses how the inbound streams of syslog data can be enriched. Awesome article!

## Big Data / Cloud

* [Structured streaming with Azure Databricks into Power BI & Cosmos DB][1]. A post, discussing the concept of Structured Streaming and how a data ingestion path can be built using [Azure Databricks][2] to enable the streaming of data in near-real-time. The post also talks about how Databricks can be connected directly into Power BI for reporting etc., and to Cosmos DB for persistence. 
* [The emerging big data architectural pattern][3]. A very interesting blog post, discussing the popularity and success of the [Lambda][5] architecture as well as some of the shortcomings. The post then goes on to talk about how some of the shortcomings of Lambda can be solved by the use of Azure and [Azure Cosmos DB][4]. In essence, the post discusses how we can implement the [Kappa][6] architecture in Azure.
* [A closer look at Azure Data Lake Storage Gen2][7]. Microsoft recently announced [Azure Data Lake Storage Gen2][8] and this post discusses some of the new features and capabilities.

## Data Science

* [Announcing RStudio and Databricks Integration][10]. This post announces the integration of RStudio with the [Databricks Unified Analytics Platform][11]. Databricks "pops up" all over the place lately. I really need to look into it! 
* [The Data Analysis Maturity Model – Level Three: Distributed, consistent reporting systems][12]. The third "episode" in [Buck Woody's][buckw] series about data analysis maturity levels. In this post, Buck talks about distributed and consistent reporting systems.

## SQL Server Machine Learning Services

* [Installing R Packages in SQL Server Machine Learning Services - II][pkg2]. I published part 2 of the [Install R Packages in SQL Server ML Services Series](/sql_server_ml_services_install_packages). In this post, we discussed how to use functionality in RevoScaleR to install packages on a remote **SQL Server ML Services** instance.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/

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
[werner]: https://twitter.com/werner


<!-- [series1]: <> (/sql_server_2k16_r_services) -->
<!-- [series2]: <> (/sql_server_ml_services_install_packages) -->

[1]: https://azure.microsoft.com/en-us/blog/structured-streaming-with-databricks-into-power-bi-cosmos-db/
[2]: https://docs.microsoft.com/en-gb/azure/azure-databricks/what-is-azure-databricks
[3]: https://azure.microsoft.com/en-us/blog/the-emerging-big-data-architectural-pattern/
[4]: https://azure.microsoft.com/en-gb/services/cosmos-db/
[5]: https://en.wikipedia.org/wiki/Lambda_architecture
[6]: http://dataottam.com/2016/06/02/understand-kappa-architecture-in-2-minutes/
[7]: https://azure.microsoft.com/en-us/blog/a-closer-look-at-azure-data-lake-storage-gen2/
[8]: https://azure.microsoft.com/en-us/services/storage/data-lake-storage/
[9]: https://www.confluent.io/blog/real-time-syslog-processing-apache-kafka-ksql-enriching-events-with-external-data/
[10]: https://databricks.com/blog/2018/06/27/rstudio-integration.html
[11]: https://databricks.com/glossary/what-is-unified-analytics
[12]: https://blogs.msdn.microsoft.com/buckwoody/2018/06/28/the-data-analysis-maturity-model-level-three-distributed-consistent-reporting-systems/
[13]: https://www.allthingsdistributed.com/2018/06/purpose-built-databases-in-aws.html
[14]: https://en.wikipedia.org/wiki/Werner_Vogels

[pkg2]: {{< relref "2018-06-30-installing-r-packages-in-sql-server-machine-learning-services---ii.markdown" >}}
