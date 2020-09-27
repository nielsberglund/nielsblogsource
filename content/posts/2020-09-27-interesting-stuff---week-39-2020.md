---
type: post
layout: "post"
title: Interesting Stuff - Week 39, 2020
author: nielsb
date: 2020-09-27T09:41:44+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - SQL Server
  - Azure Data Studio
  - Machine Learning
  - SQL Server extensibility framework
  - SQL Server language extensions
description: Kafka & machine learning, R & Python SQL Server language extensions, Azure Data Studio, and other interesting topics.
keywords:
  - Kafka
  - SQL Server
  - Azure Data Studio
  - Machine Learning
  - SQL Server extensibility framework
  - SQL Server language extensions   
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

* [Modern Banking in 1500 Microservices][1]. This is an [InfoQ][iq] presentation where the presenters explain how [Monzo][3] builds, operates, observes and maintains the banking infrastructure. They talk about how they compose microservices to add new functionality, deployment and incident tooling, monitoring practices and how they share knowledge effectively. Very interesting!
* [Pat Helland on Software Architecture and Urban Planning][2]. The link here is to a podcast by the legendary [Pat Helland][4] where he talks about the relationship between software architecture and urban planning. Pat explores planning for future growth, regulations/standards, and communication practices that cities - and software architecture - had to evolve to use. He uses these comparisons to distil lessons that architects can use in building distributed systems. If you are only going to listen to one podcast today, this week, month, etc., listen to this one!

## Azure Data Studio

* [The September 2020 release of Azure Data Studio is now available][5]. As the title of the post says: a new version of Azure Data Studio is out. It has quite a few new features and enhancements, new notebook functionality, support for Kusto Query Language, (KQL), and other stuff. After I have published this post I will download this version and take it through its paces.

## SQL Server

* [Open sourcing the R and Python language extensions for SQL Server][6]. Wow, this is big! Not only have the SQL Server language extensions for R and Python been open-sourced, but you can now use whatever version of R and Python you want, (well, more or less). Look out for some blog posts from me around this. Here are two links if you are interested in how it worked up until now: [Sql Server Machine Learning Services][7], and [Sql Server Extensibility Framework][8].

## Streaming

* [Apache Kafka DevOps with Kubernetes and GitOps][9]. The post linked to here looks at how we can do DevOps with Kafka and Kubernetes.
* [Streaming logging pipeline of Home timeline prediction system][10]. Twitter recently built a streaming data logging pipeline for its home timeline prediction system using Apache Kafka and Kafka Streams to replace the existing offline batch pipeline. This post looks at the architecture and how Twitter did it. In the post, it is mentioned that Twitter had to customise how KStreams left join semantic, and that is covered in the post: [Building a Machine Learning Logging Pipeline with Kafka Streams at Twitter][11].

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
[travw]: https://twitter.com/radtravis
[emilk]: https://twitter.com/IsTheArchitect


[1]: https://www.infoq.com/presentations/monzo-microservices/
[2]: https://www.infoq.com/podcasts/urban-planning-software-architecture/
[3]: https://en.wikipedia.org/wiki/Monzo_(bank)
[4]: https://www.linkedin.com/in/pathelland/
[5]: https://cloudblogs.microsoft.com/sqlserver/2020/09/22/the-september-2020-release-of-azure-data-studio-is-now-available/
[6]: https://cloudblogs.microsoft.com/sqlserver/2020/09/24/open-sourcing-the-r-and-python-language-extensions-for-sql-server/
[7]: https://nielsberglund.com/categories/sql-server-machine-learning-services/
[8]: https://nielsberglund.com/categories/sql-server-extensibility-framework/
[9]: https://www.confluent.io/blog/kafka-devops-with-confluent-kubernetes-and-gitops/
[10]: https://blog.twitter.com/engineering/en_us/topics/infrastructure/2020/streaming-logging-pipeline-of-home-timeline-prediction-system.html
[11]: https://www.confluent.io/blog/how-twitter-built-a-machine-learning-pipeline-with-kafka/
