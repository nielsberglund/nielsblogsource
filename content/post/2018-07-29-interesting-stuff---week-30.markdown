---
layout: post
title: Interesting Stuff - Week 30
author: nielsb
date: 2018-07-29T19:11:58+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Azure SQL Database
  - kafka
  - Pulumi
  - R
  - Python
description: Cool Pulumi code, Kafka, Azure AI services, R and Python in Docker, and other interesting topics!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Azure SQL Database
  - kafka
  - Pulumi
  - R
  - Python  
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

## Distributed Computing

* [Properties of Chaos][1]. An [InfoQ][iq] presentation about how and why chaos engineering is being applied to autonomous vehicle safety, and how to advance chaos engineering practices to explore beyond basic properties like system availability and extend into verifying system correctness.

## Cloud

* [Program the Cloud with 12 Pulumi Pearls][2]. In the [week 25][wr25_18] roundup I wrote about [Joe Duffy][joeduff] and his [Pulumi][3]. This blog post by [Joe][joeduff] demonstrates some fun ways you can program the cloud using Pulumi. Very interesting!

## SQL Server

* [Pearl Abyss: Massive Scale using Azure SQL Database][4]. A blog post, showing off how you can achieve a massive scale of SQL Server by using Azure SQL Database. 7,500 cores, 46 instances 500,000 queries per second! Can I have two of those, please!

## Streaming

* [Demo: Build a Streaming Application with KSQL][5]. A YouTube video, illustrating how to build a streaming application using KSQL. 
* [Ansible Playbooks for Confluent Platform][6]. This blog post covers how [Confluent][7] wants to make it super easy to set up [Confluent Platform][8]. In this post, they introduce their first set of Ansible playbooks. It certainly seems easy! 

## Data Science / AI

* [A quick tour of AI services in Azure][9]. A post by [David][revod] at [Revolution Analytics][re] talking about a video giving a quick overview of some of the services available in Azure to build AI-enabled applications. Watch the video if you are interested in AI and Azure.
* [Dockerizing R and Python Web Services][10].  A post looking into how to build a Docker image containing **Machine Learning Server 9.3**using Dockerfiles and how-to-perform Both R and Python operations.

## SQL Server Machine Learning Services

I am close to finish the third post in the [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) series. I hope to have it out by the end of this upcoming week.

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
[jboner]: https://twitter.com/jboner
[joeduff]: https://twitter.com/funcOfJoe

[wr25_18]: {{< relref "2018-06-24-interesting-stuff---week-25.markdown" >}}

[1]: https://www.infoq.com/presentations/chaos-engineering-autonous-vehicles
[2]: https://blog.pulumi.com/program-the-cloud-with-12-pulumi-pearls
[3]: http://pulumi.com/
[4]: https://blogs.msdn.microsoft.com/sqlserverstorageengine/2018/07/23/pearl-abyss-massive-scale-using-azure-sql-database/
[5]: https://www.youtube.com/watch?v=ExEWJVjj-RA
[6]: https://www.confluent.io/blog/ansible-playbooks-for-confluent-platform/
[7]: https://www.confluent.io/
[8]: https://www.confluent.io/product/confluent-platform/
[9]: http://blog.revolutionanalytics.com/2018/07/a-quick-tour-of-ai-services-in-azure.html
[10]: https://blogs.msdn.microsoft.com/mlserver/2018/07/26/dockerizing-r-and-python-web-services/

<!-- [series1]: <> [SQL Server R Services](/sql_server_2k16_r_services) -->
<!-- [series2]: <> [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) -->
<!-- [series3]: <> [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) -->


<!-- [findstr]: <> findstr /I <word_to_find> * -->
