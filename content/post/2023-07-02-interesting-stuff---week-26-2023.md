---
type: post
layout: "post"
title: Interesting Stuff - Week 26, 2023
author: nielsb
date: 2023-07-02T11:48:53+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-26-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-26-23.jpg"
categories:
  - roundup
tags:
  - data engineering
  - streaming
  - Kafka
  - Databricks
  - Data Saturday Durban
description: This week I cover Hoptimator for data pipelines, using Confluent Kafka to reduce churn, materialized views and streaming tables for Databricks SQL, and Data Saturday Durban.
---

We've got everything from data pipelines to streaming platforms in this week's blog post: Hoptimator, the tool designed to streamline and optimize data pipelines. Mobile Premier League (MPL) and how they reduced player churn using Confluent Cloud. Materialized views and streaming tables for Databricks SQL.

Finally, **Data Saturday Durban** on August 19. It is still time to submit a talk.

<!--more-->

## Data Engineering

* [Declarative Data Pipelines with Hoptimator][1]. This blog post from LinkedIn Engineering introduces Hoptimator, a tool designed to streamline and optimize data pipelines. Hoptimator enables developers to specify their pipelines declaratively, improving efficiency and maintainability. The blog post delves into the architecture and key features of Hoptimator, highlighting its potential to enhance data engineering workflows and facilitate collaboration among teams working on complex data processing tasks.

## Streaming

* [Reducing Player Churn with Confluent Cloud: A Mobile Premier League Case Study][2]. This blog post by Confluent focuses on Mobile Premier League (MPL), a mobile gaming platform, and how they successfully reduced player churn using Confluent Cloud. The post explores MPL's challenges in retaining players and how they leveraged Confluent Cloud's streaming platform to address the issue. By implementing real-time data processing and analytics, MPL gained deeper insights into player behaviour, allowing them to personalize user experiences and offer targeted incentives. This data-driven approach enabled MPL to reduce player churn significantly, leading to improved user satisfaction and retention rates. This blog post is an excellent example of how streaming data platforms can help businesses gain a competitive edge by leveraging real-time data.
* [Introducing Materialized Views and Streaming Tables for Databricks SQL][3]. This blog post from Databricks introduces materialized views and streaming tables for Databricks SQL. Materialized views are precomputed views that can be used to accelerate queries. Streaming tables are continuously updated tables that can be used to query streaming data. The blog post delves into the architecture and key features of materialized views and streaming tables, highlighting their potential to enhance data analytics workflows and facilitate collaboration among teams working on complex data processing tasks. Very cool!

## WIND (What Is Niels Doing)

We are getting closer to the Premier Data Event in Durban: **Data Saturday Durban** on August 19. I am happy to say that, based on the submissions for talks, it will be a very exciting event. The CfS (Call for Speakers) ends July 14, so there is still time to [submit][4] a talk. Please do so if you have something to share.

On the same note, we are quickly running out of seats for the event. If you want to attend, please [register][5] as soon as possible.

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
[hubert]: https://www.linkedin.com/in/hkdulay/

[1]: https://engineering.linkedin.com/blog/2023/declarative-data-pipelines-with-hoptimator
[2]: https://www.confluent.io/blog/how-mobile-premier-league-reduced-player-churn-with-confluent-cloud/
[3]: https://www.databricks.com/blog/introducing-materialized-views-and-streaming-tables-databricks-sql
[4]: https://sessionize.com/data-saturday-durban2023/
[5]: https://www.eventbrite.com/e/data-saturday-durban-tickets-654900674547
