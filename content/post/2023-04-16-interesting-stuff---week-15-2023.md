---
type: post
layout: "post"
title: Interesting Stuff - Week 15, 2023
author: nielsb
date: 2023-04-16T12:03:01+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-15-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-15-23.jpg"
categories:
  - roundup
tags:
  - AI/ML
  - Generative AI
  - Flink
  - Kafka
  - Databricks
description: "This week: how Generative AI may shift focus from technology-driven to product-driven development. A game analytics framework/solution to help game developers analyze players. How to handle late-arriving events in Apache Flink. An introduction to materialized views and how they can help. Also, a plug for an upcoming post by me about how to build multi-platform Docker images."
---

Some very exciting things this week: Generative AI may shift focus from technology-driven to product-driven development. A game analytics framework/solution to help game developers analyze players. How to use synthetic data in ML.

How to handle late-arriving events in Apache Flink. An introduction to materialized views and how they can help. Also, a plug for an upcoming post by me about how to build multi-platform Docker images.

<!--more-->

## AI/ML

* [Generative AI: Shifting the Focus from Technology-driven to Product-driven Development][1]. This post discusses the concept of "generative AI" and how it can shift the focus of product development from technology-driven to product-driven. It provides examples of how generative AI is used in product development today, including creating realistic images, videos, natural language, and music. The post also highlights the potential ethical implications of generative AI, such as the creation of misleading or fake data. Overall, the article provides an excellent introduction to generative AI and its potential impact on product development.
* [Introducing Gamehouse: A Lovelytics Game Analytics Brickbuilder Solution][2]. This post interests us here at [Derivco](/derivco). The post announces the release of a new game analytics solution called GameHouse Lovelytics, built on top of Databricks' BrickBuilder framework. The solution is designed to help game developers analyze player behaviour, engagement, and monetization. GameHouse Lovelytics provides a unified view of data from multiple sources, enabling developers to gain insights and optimize their games more efficiently. The solution aims to help game developers make data-driven decisions and improve their games' performance.
* [Synthetic Data for Better Machine Learning][3]. Another interesting post for us ([Derivco](/derivco)). The post looks at the use of synthetic data in machine learning and highlights its potential benefits. Synthetic data is artificially generated data that resembles real-world data and can be used to train machine learning models. The article argues that synthetic data can help overcome some challenges associated with real-world data, such as privacy concerns and data bias. It also provides examples of how synthetic data is used in different industries, such as healthcare and finance. Overall, the article highlights the potential of synthetic data to improve the accuracy and fairness of machine learning models.

## Streaming

* [Flink SQL Secrets: Mastering the Art of Changelog Event Out-of-Orderness][4]. This post covers the challenges of dealing with out-of-order events in Apache Flink SQL and offers solutions for dealing with them. It introduces Flink SQL's windowing functions, which allow grouping events based on specific criteria and dealing with out-of-order events within a window. Additionally, the post explains the use of changelog events in Flink SQL, which provide a history of changes made to a stateful stream. The post includes code examples and practical advice on choosing the right windowing strategy and setting watermarks to trigger window computations effectively. Very interesting!
* [Materialized Views][5]. This blog post explains the concept of materialized views, which are precomputed views of data that can be used to speed up query processing. Materialized views can be used in various scenarios, such as data warehousing and online transaction processing (OLTP). The post provides examples of how materialized views can improve query performance and reduce the need for complex joins and aggregations. It also discusses some challenges associated with materialized views, such as maintaining their freshness and ensuring they are up to date.
* [Data Streaming is not a Race, it is a Journey!][6]. The article argues that data streaming is a journey involving continuous improvement and refinement, not a race to achieve the highest performance or throughput. The author emphasizes the importance of understanding the business value of streaming data and aligning it with the organization's overall strategy. The article also discusses some of the challenges associated with data streaming, such as data quality and consistency, and provides some best practices for addressing them. The article offers a valuable perspective on data streaming and its role in driving business value.

## WIND (What Is Niels Doing)

As you know (I hope) I am busy writing the **Develop a Real-Time Leaderboard Using Kafka and Azure Data Explorer**, and I released [**Develop a Real-Time Leaderboard Using Kafka and Azure Data Explorer - II**][7] two weeks ago.

While writing that, I was waylaid by some Docker container issues related to building multi-platform images. That led me to write a post about those issues, and I hope to publish that post later today or - more realistically - tomorrow.

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

[1]: https://garystafford.medium.com/generative-ai-shifting-the-focus-from-technology-driven-to-product-driven-development-64444f5b294
[2]: https://www.databricks.com/blog/2023/04/12/introducing-gamehouse-lovelytics-game-analytics-brickbuilder-solution.html
[3]: https://www.databricks.com/blog/2023/04/12/synthetic-data-better-machine-learning.html
[4]: https://www.ververica.com/blog/flink-sql-secrets-mastering-the-art-of-changelog-event-out-of-orderness
[5]: https://hubertdulay.substack.com/p/materialized-views
[6]: https://www.kai-waehner.de/blog/2023/04/13/data-streaming-is-not-a-race-it-is-a-journey/
[7]: {{< relref "2023-04-03-develop-a-real-time-leaderboard-using-kafka-and-azure-data-explorer---ii.md" >}}
