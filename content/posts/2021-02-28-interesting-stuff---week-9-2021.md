---
type: post
layout: "post"
title: Interesting Stuff - Week 9, 2021
author: nielsb
date: 2021-02-28T09:46:34+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Analytics
  - Data architecture
  - Data lakes
  - Delta lake
  - Kafka
  - Pinot
description: Kafka @ Pinterest, GraphQL vs. Rest, Apache Pinot & massive datasets, Data Architecture & Data lakes, and other interesting topics.
keywords:
  - Analytics
  - Data architecture
  - Data lakes
  - Delta lake
  - Kafka
  - Pinot   
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

## Misc.

* [Beyond REST][1]. This [Netflix][netflx] blog post discusses how Netflix use [GraphQL microservices][2] as a backend platform, facilitating rapid application development. It looks very interesting. I wonder if we at [Derivco](/derivco) could use this?

## Analytics

* [Building a Climate Dashboard with Apache Pinot and Superset][3]. Hmm, somehow, I must have missed this blog post from back in September 2020. Anyway, better late than never. The post discusses how Apache Pinot can easily ingest, query, and visualize millions of events. In this case, the events are climate events, sourced from the NOAA storm database.
* [Fighting spam with Guardian, a real-time analytics and rules engine][4]. The post linked here looks at the evolution of Pinterest's spam-fighting rules and query and what they've learned throughout the process. 

## Data Architecture

* [How To Modernize Your Data Architecture Part 1 – Data Analytics Strategy Consulting][5]. This post is the first in a series about data architecture. It discusses what to avoid when building a data architecture and which questions to ask when building a future data 
* [From Data Lakes to Data Reservoirs][6]. The post linked to here looks at how you can "tame" your data lakes. How you can create clean, beautiful, and protected data resources with Apache Spark and Databricks Delta Lake.
* [The Building Blocks of a Modern Data Platform][7]. If you wonder what a "modern data platform" means, then this post is for you. The post breaks down what a modern data platform means in practice today. This includes the three core characteristics, six fundamental building blocks, and the latest data tools. I found this post extremely valuable.

## Streaming

* [Lessons Learned from Running Apache Kafka at Scale at Pinterest][8]. The post linked to shares how Pinterest runs Kafka and discusses some of the challenges they've faced and how they addressed them. 

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
[netflx]: https://netflixtechblog.com/


[1]: https://netflixtechblog.com/beyond-rest-1b76f7c20ef6
[2]: https://dev.to/mrfrontend/graphql-microservices-architecture-by-apollo-1m75
[3]: https://medium.com/apache-pinot-developer-blog/building-a-climate-dashboard-with-apache-pinot-and-superset-d3ee8cb7941d
[4]: https://medium.com/pinterest-engineering/fighting-spam-with-guardian-a-real-time-analytics-and-rules-engine-938e7e61fa27
[5]: https://www.theseattledataguy.com/how-to-modernize-your-data-architecture-part-1-data-analytics-strategy-consulting/
[6]: https://towardsdatascience.com/from-data-lakes-to-data-reservoirs-aa2efebb4f25
[7]: https://towardsdatascience.com/the-building-blocks-of-a-modern-data-platform-92e46061165
[8]: https://www.confluent.io/blog/running-kafka-at-scale-at-pinterest/
