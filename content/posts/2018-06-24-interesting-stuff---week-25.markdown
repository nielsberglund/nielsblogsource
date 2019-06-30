---
layout: post
title: Interesting Stuff - Week 25
author: nielsb
date: 2018-06-24T20:36:32+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - Pulumi
  - Postgres
  - kafka
  - flink
description: Kafka, Flink, Joe Duffy and Pulumi, posts about SQL Server Machine Learning Services, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - Pulumi
  - Postgres
  - kafka
  - flink   
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

## Cloud

* [Hello, Pulumi!][1]. Back in 2017, I wrote in [Weekly Roundup 22][wr22_17] about Joe Duffy and his startup Pulumi. At that time, no one knew what Pulumi was all about. Well, that changed with today's linked post. Joe explains about Pulumi, and it does sound extremely exciting. Go forth and read all about it!

## Databases

* [The Future of Distributed Databases Is Relational][2]. This is an [InfoQ][2] presentation about creating a more modern relational database. It is about Postgres and the journey to scale out and make it truly distributed. Fascinating!

## Streaming

* [Streaming SQL to Unify Batch & Stream Processing w/ Apache Flink @Uber][3]. Another [InfoQ][iq] presentation. This presentation is about exploring SQL’s role in the world of streaming data and its implementation in Apache Flink and covering streaming semantics, event time, and incremental results. Interesting!
* [Getting Started with dA Platform on Google Kubernetes Engine][4]. This article describes the setup of the [dA Platform][5] using Google Cloud's Kubernetes engine.
* [Introducing Confluent Hub][6].  From the post: "Confluent Hub is a place for the Apache Kafka and Confluent Platform community to come together and share the components the community needs to build better streaming data pipelines and event-driven applications.". Sounds intriguing!

## Data Science

* [The Data Analysis Maturity Model – Level Two: Reliable Data Storage and Query Systems][7]. The second post in a series by [Buck Woody][buckw] about defining a *Data Analysis Maturity Model*. In this post, Buck discusses data storage and querying.
* [PYPL Language Rankings: Python ranks #1, R at #7 in popularity][8]. A post by [David][revod] at [Revolution Analytics][re] about a popularity index of programming languages.

## SQL Server Machine Learning Services

Boy, have I been a busy bee this week. I have managed to get two posts published, which must be a record. But none of the posts is the follow-up post to my [sp_execute_external_script and SQL Compute Context - I][ctx1] post from five weeks ago. This is getting stupid!

* [Installing R Packages in SQL Server Machine Learning Services - I][pkg1]. This post, which is the first post in a [series](/sql_server_ml_services_install_packages), came about due to a mate of mine asking how he could install R packages into **SQL Server Machine Learning Services**. In this particular post, we look at using R packet managers to install packages.
* [sp_execute_external_script and Permissions][perm]. While researching the [Installing R Packages](/sql_server_ml_services_install_packages) series I came about some issues related to permissions and `sp_execute_external_script`. This post tries to clarify and explain how it works.

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


[wr22_17]: {{< relref "2017-06-04-interesting-stuff---week-22.markdown" >}}


<!-- [series1]: <> (/sql_server_2k16_r_services) -->
<!-- [series2]: <> (/sql_server_ml_services_install_packages) -->

[pkg1]: {{< relref "2018-06-23-installing-r-packages-in-sql-server-machine-learning-services---i.markdown" >}}
[perm]: {{< relref "2018-06-24-sp-execute-external-script-and-permissions.markdown" >}}

[1]: http://joeduffyblog.com/2018/06/18/hello-pulumi/
[2]: https://www.infoq.com/presentations/future-distributed-database-relational
[3]: https://www.infoq.com/presentations/sql-streaming-apache-flink
[4]: https://data-artisans.com/blog/getting-started-with-da-platform-on-google-kubernetes-engine
[5]: https://data-artisans.com/platform
[6]: https://www.confluent.io/blog/introducing-confluent-hub/
[7]: https://blogs.msdn.microsoft.com/buckwoody/2018/06/20/the-data-analysis-maturity-model-level-two-reliable-data-storage-and-query-systems/
[8]: http://blog.revolutionanalytics.com/2018/06/pypl-programming-language-trends.html

