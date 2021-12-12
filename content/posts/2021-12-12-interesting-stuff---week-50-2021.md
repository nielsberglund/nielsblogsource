---
type: post
layout: "post"
title: Interesting Stuff - Week 50, 2021
author: nielsb
date: 2021-12-12T10:37:02+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - kafka
  - SQL Server
  - ksqlDB
  - Databricks
  - Azure Data Explorer
  - Serverless
description: Kafka & serverless stream processing, dbt & Databricks, SQL Server plumbing, SQL Cape & Azure Data Explorer, and other interesting topics.
keywords:
  - kafka
  - SQL Server
  - ksqlDB
  - Databricks
  - Azure Data Explorer
  - Serverless   
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

> **NOTE:** *It is now coming up on Christmas and New Year, and I will take a break with these posts and come back at the beginning of next year.*

<!--more-->

## SQL Server

* [#SQLServer Column Store Object Pool -- the Houdini Memory Broker Clerk AND Perfmon [\SQLServer:Buffer Manager\Target pages]][3]. In this post by Mr SQL Server NUMA, [Lonny][lonny], he "spelunks" around in SQL Server Buffer Pool. If you are interested in the "innards" of SQL Server, you need to read this post. Actually, you need to read everything Lonny [posts][4].

## Big Data

* [Evolving LinkedIn's analytics tech stack][5]. This is a fascinating post looking at lessons learned from LinkedIn's data platform migration. This post is a goldmine of information for anyone migrating from "legacy" data architecture to a modern one. 
* [Deploying dbt on Databricks Just Got Even Simpler][6]. Those interested in Big Data have probably heard about [**dbt**][7], the open-source tool that allows you to build data pipelines using simple SQL. The post I link to announces the **dbt-databricks** adapter, which integrates dbt with the Databricks Lakehouse Platform. Cool stuff!

## Streaming

* [Chip Huyen on Streaming-First Infrastructure for Real-Time ML][8]. Even though you may do real-time ML predictions, you probably update your models manually. This [InfoQ][iq] article looks at a QCon presentation where the presenter looked at, among other things, how a streaming-first infrastructure can help you do ML in real-time, both online prediction and continual learning.
* [Apache Kafka for Conversational AI, NLP and Chatbot][9]. The post looks at how event streaming with Apache Kafka is used in conjunction with Machine Learning platforms for reliable real-time conversational AI, NLP, and chatbots. The post looks at examples from the carmaker BMW, the online travel and booking portal Expedia, and Tinder's dating app. Very cool!
* [Serverless Stream Processing with Apache Kafka, AWS Lambda, and ksqlDB][10]. This blog post defines what "serverless stream processing" is. Apart from just discussing concepts and implementations, it describes arguably the most essential pattern for building event streaming applications using ksqlDB. Read It! 

## WIND (What Is Niels Doing)

The year is coming to a close, and as for presentations, webinars, etc., I have two left:

![](/images/posts/sql-cape-adx.png)

**Figure 1:** *SQL Cape - Azure Data Explorer*

On Tuesday (Dec. 14), I deliver the last **Azure Data Explorer** presentation for this year:

* [**Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer**][1]. The presentation is a virtual event hosted by my mate [**Jody Roberts**][11]. If you are interested in ADX, please [sign up][1] (it is **FREE**) and come and join the fun. Any time Jody and I get together, regardless if it is IRL or a virtual event like this, some fun stuff happens!

The second event is also virtual:

![](/images/posts/tech-fun.jpg)

**Figure 2:** *Tech Fun Space*

The event takes place Thursday, Dec. 23. It is not a webinar but an event for the Global Data Community to get together to welcome 2022. The organiser is my good friend [**Jean Joseph**][12]. Read more about it (this event is also **FREE**) and [sign up here][2].

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. Please comment on this post or [ping][ma] me if you have ideas for what to cover.

Oh, and if I don't see you virtually or IRL before the holidays: **Happy Holidays**!

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

[1]: https://www.meetup.com/SQLCape-Meetup/events/282241220/
[2]: https://www.eventbrite.com/e/tech-fun-space-welcome-2022-tickets-215046428657
[3]: http://sql-sasquatch.blogspot.com/2021/12/sqlserver-column-store-object-pool.html
[4]: http://sql-sasquatch.blogspot.com/
[5]: https://engineering.linkedin.com/blog/2021/evolving-linkedin-s-analytics-tech-stack
[6]: https://databricks.com/blog/2021/12/06/deploying-dbt-on-databricks-just-got-even-simpler.html
[7]: https://www.getdbt.com/
[8]: https://www.infoq.com/news/2021/12/huyen-realtime-ml/
[9]: https://www.kai-waehner.de/blog/2021/12/08/apache-kafka-for-conversational-ai-nlp-chatbot/
[10]: https://www.confluent.io/blog/serverless-event-stream-processing/
[11]: https://www.linkedin.com/in/jodyrobertssql/
[12]: https://www.linkedin.com/in/jeandjoseph/
