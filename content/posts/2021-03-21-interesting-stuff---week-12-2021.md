---
type: post
layout: "post"
title: Interesting Stuff - Week 12, 2021
author: nielsb
date: 2021-03-21T09:15:37+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - .NET
  - distributed tracing
  - Kafka
  - dbt
description: Kafka & RocksetDB & realtime analysis, distributed tracing in .NET, dbt for data pipelines, and other interesting topics.
keywords:
  - .NET
  - distributed tracing
  - Kafka
  - dbt  
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

.NET

* [Introducing Configurable Retry Logic in Microsoft.Data.SqlClient v3.0.0-Preview1][1]. This is so cool! One of the harder things to get right when writing applications accessing databases is retries. The post I  link to here discusses the new retry feature in the .NET SqlClient library. Very awesome!
* [OpenTelemetry .NET reaches v1.0][2]. As the title of the post implies, this blog-post discusses version 1 of OpenTelemetry .NET. It is cool to see that .NET supports OpenTelemetry!

## Data Architecture

* [Financial Times Data Platform: From zero to hero][3]. This blog post "drills" down into how Financial Times created and evolved their data platform.
* [Introducing dbt, the ETL & ELT Disrupter][4]. Admittedly, this post's title is somewhat click-bait:y, but the post is interesting nevertheless. It looks at [dbt][5], (Data Build Tool), which is a command-line data pipeline tool that allows collecting and transforming data for analytics really fast, and really easy! 

## Streaming

* [Building a Real-Time Customer 360 on Kafka, MongoDB and Rockset][6]. The post here looks at how one can build a holistic view of a customer, (Customer 360 Profile), and have the view being real-time. Very interesting!

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

[1]: https://devblogs.microsoft.com/azure-sql/configurable-retry-logic-for-microsoft-data-sqlclient/
[2]: https://devblogs.microsoft.com/dotnet/opentelemetry-net-reaches-v1-0/
[3]: https://medium.com/ft-product-technology/financial-times-data-platform-from-zero-to-hero-143156bffb1d
[4]: https://towardsdatascience.com/introducing-dbt-the-etl-elt-disrupter-4351adc34123
[5]: https://www.getdbt.com/
[6]: https://rockset.com/blog/building-a-real-time-customer-360-on-kafka-mongodb-and-rockset/