---
type: post
layout: "post"
title: Interesting Stuff - Week 5, 2023
author: nielsb
date: 2023-02-05T10:15:43+02:00
comments: true
highlight: true
draft: false
image: images/banner/posts/canary-wharf-resized.png
thumbnail: images/banner/posts/canary-wharf-resized.png
categories:
  - roundup
tags:
  - Azure SQL
  - Kafka
  - Flink
description: In this week's roundup, you'll read about optimized locking in Azure SQL (very cool) and why Flink is so popular. Related to Flink, we also look at operational use cases for Flink, as well as some Flink CEP "stuff".
---

In this week's roundup, you'll read about optimized locking in Azure SQL (very cool) and why Flink is so popular. Related to Flink, we also look at operational use cases for Flink, as well as some Flink CEP "stuff".

<!--more-->

## Azure SQL

* [Optimized locking][1]. In this post, a new SQL Database Engine feature is introduced, a feature that has been asked for by DBAs and developers for a long time: **optimized locking**. Optimized locking offers an improved transaction locking mechanism that reduces lock memory consumption and blocking amongst concurrent transactions. Very cool!

## Streaming

* [Five Drivers Behind the Rapid Rise of Apache Flink][2]. In 2022 we saw a substantial amount of venture capital being invested in startups building companies around Apache Flink. This post looks at the reasons why Flink is so "hot".
* [Operational Use case Patterns for Apache Kafka and Flink — Part 1][3]. We all know that Kafka and Flink go together like bread and butter, or maybe peanut butter and jelly. Anyway, this post is the first in, hopefully, a series that looks at operational use cases with Apache Kafka and Apache Flink. Some of the use cases looked at in this post are CQRS/read-optimized views and async task reply.
* [Announcing the Source Available Confluent CLI][4]. Confluent CLI is a command-line interface for the Confluent Platform, and it provides a unified interface for managing various components and tools within the Confluent Platform. Up until now, it has been licensed under the Confluent Enterprise License. This post announces how - coinciding with the release of Confluent CLI v3 - Confluent CLI is now open source. This is good!
* [Flink SQL: How to detect patterns with MATCH_RECOGNIZE][5]. In my [weekly roundup a couple of weeks ago][6], I mentioned how I had started to look into Flink. A big part of my interest in Flink is the ability to use it for Complex Event Processing (CEP). A big part of CEP is to be able to recognize patterns. The linked blog post discusses just that. It looks at the `MATCH_RECOGNIZE` statement in Flink SQL and what you can do with it.

## WIND (What Is Niels Doing)

In last week's roundup I wrote I was on my way to Barcelona. I had a great time there, meeting up with the architects from [Derivco Sports][7]. Yesterday I flew out to London to attend the [ICE][8] conference. I am staying at a hotel in Docklands, and the picture you see in the banner of this post is the view from my hotel room! Well, I don't see Uber Boats all the time, but anyway!

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

[1]: https://learn.microsoft.com/en-us/sql/relational-databases/performance/optimized-locking
[2]: https://www.datanami.com/2023/01/30/five-drivers-behind-the-rapid-rise-of-apache-flink/
[3]: https://medium.com/event-driven-utopia/operational-use-case-patterns-for-apache-kafka-and-flink-part-1-5a0f8742df90
[4]: https://www.confluent.io/blog/announcing-the-source-available-confluent-cli/
[5]: https://www.ververica.com/blog/flink-sql-match_recognize?utm_source=pocket_saves
[6]: https://nielsberglund.com/post/2023-01-15-interesting-stuff---week-2-2023/
[7]: https://www.linkedin.com/company/derivco-sports/
[8]: https://www.icelondon.uk.com/
