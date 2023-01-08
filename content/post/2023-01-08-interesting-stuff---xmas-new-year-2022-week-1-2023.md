---
type: post
layout: "post"
title: Interesting Stuff - XMas, New Year 2022, Week 1 2023
author: nielsb
date: 2023-01-08T12:04:35+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/sunrise.jpg"
categories:
  - roundup
tags:
  - Kafka
  - Flink
  - ksqlDB
  - Azure Data Explorer
  - ChatGPT
description: In this post we look at a excellent resource for Azure Machine Learning. Of course, when we talk about machine learning, we need to mention ChatGPT. We look at the "Tinder" app for **Azure Data Explorer** - "Find my partner". The BIG one the post looks at is how Confluent acquires Immerok, which offers a fully managed Flink implementation!
---

This is the "roundup" of the posts that have been most interesting to me over the Christmas, New Year period 2022, and week 1 2023. Oh, and welcome to 2023!

This post consists of a mixed bag: We look at an excellent resource for Azure Machine Learning. Of course, when we talk about machine learning, we need to mention ChatGPT. We look at the "Tinder" app for **Azure Data Explorer** - "Find my partner". The BIG one the post looks at is how Confluent acquires Immerok, which offers a fully managed Flink implementation!

<!--more-->

## AI/ML

* [Advent of 2022, Day 24 – Further reading and code material for Azure Machine Learning][1]. My friend [Tomaž Kaštrun][2] ran an "Advent Calendar" series of posts about Azure Machine Learning in December 2022. This post is a summary of the individual posts in the series. A lot of "goodies" in there!
* [ChatGPT and DALL·E 2 in a Panel App][3]. ChatGPT hit us like a sledgehammer at the end of last year, and there have been countless of blog posts about it since then. It will only get worse (or better - depending on how you look at it) this year. Anyway, the post linked here looks at how you can programmatically access both ChatGPT and DALL-E 2. The post uses the OpenAI APIs to create an app in Python. How cool is this?! 

## Azure Data Explorer

* [Find my partner][4]. You all know how "cool" **Azure Data Explorer** is! It is so cool that Microsoft has created a dating app, (like Tinder) for it. Actually it is not an app, but a website where you can find your partner. Partner in this case is someone that can help you come to grips with ADX; consulting, training, etc. The post explains it all, but browse to [here][5] and then run:

``` t-sql
Partner
| where Partner like 'Niels'
```

Yes, you found me! I am an ADX partner. So if you need training - "swipe right" and ping me!

## Streaming

* [The Data Streaming Landscape 2023][6]. This is an excellent post where [Kai Waehner][7] explores the data streaming landscape of 2023 to summarize existing solutions and market trends.
* [UI for Apache Kafka][8]. One of the biggest gripes, especially from Windows developers, is "why is there no UI for Kafka?". There are quite a few. The one linked to here has quickly become my favourite, and I use it for almost anything involving Kafka.
* [Showcasing JDBC Sink Connector on Schema-less Data][13]. We all know that relational databases require a schema. If you want to use the Kafka Connect JDBC connector to write from a topic to a relational database, the JDBC Sink Connector requires this schema. This post looks at using ksqlDB to transform the data from the source system into a form that can be consumed by the JDBC Sink Connector and to use streams instead of tables within KSQL to allow for more flexibility in the retention of Kafka topics.
* [Confluent + Immerok: Cloud Native Kafka Meets Cloud Native Flink][10]. This is a biggie! This post announces Confluent acquiring Immerok, a startup offering a fully managed service for Apache Flink. Confluent believes that Flink is the future of stream processing and will be the de facto standard for building applications that process, react, and respond to streams. This is awesome, but at the same time, I'm curious about what the future is for ksqlDB. Well, we'll see!

## WIND (What Is Niels Doing)

I am just finishing my holiday period leave. I will be back at work on the 11th. When I started my vacation, I had "grand" plans for what I would accomplish during the leave. Well, you know what they say about "best-laid plans of mice and men" :smile:. I did not get done what I wanted to.

What I managed to do was:

* I completed all five [Kusto Detective Agency][11] cases! The Kusto Detective Agency is a gamified way to learn the Kusto Query Language (KQL). It consists of five cases (challenges), and after each successfully solved case, you get a badge. After completion of all cases, you get a completed badge like so:

![](/images/posts/kda-complete.png)


* [Revolutionizing My Blog: Why I Changed my Hugo Theme][12]. I finally upgraded my Hugo executable to the latest version (my old exe was 5 years old), and at the same time changed the theme.

Let's see what the new year brings!

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

[1]: https://tomaztsql.wordpress.com/2022/12/24/advent-of-2022-day-24-additional-reading-material-books/
[2]: https://tomaztsql.wordpress.com/about/
[3]: https://towardsdatascience.com/chatgpt-and-dall-e-2-in-a-panel-app-1c921d7d9021
[4]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/find-my-partner/ba-p/3701506
[5]: https://dataexplorer.azure.com/clusters/help/databases/FindMyPartner
[6]: https://www.kai-waehner.de/blog/2022/12/21/data-streaming-landscape-2023/
[7]: https://www.kai-waehner.de/about/
[8]: https://github.com/provectus/kafka-ui
[9]: https://www.kineticedge.io/blog/jdbc-sink-noschema/
[10]: https://www.confluent.io/blog/cloud-kafka-meets-cloud-flink-with-confluent-and-immerok/
[11]: https://detective.kusto.io/
[12]: {{< relref "2023-01-07-revolutionizing-my-blog-why-i-changed-my-hugo-theme.md" >}}
[13]: https://www.kineticedge.io/blog/jdbc-sink-noschema/