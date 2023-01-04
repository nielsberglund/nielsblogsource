---
type: post
layout: "post"
title: Interesting Stuff - Week 38
author: nielsb
date: 2018-09-23T06:47:28+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Kafka
  - Docker
  - Databricks
  - MSIgnite
description: Kafka and Donuts (I am serious), Docker on Windows, #MSIgnite, Databricks, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - Kafka
  - Docker
  - Databricks
  - MSIgnite   
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

## Streaming

* [The Changing Face of ETL][1]. An article by [Robin Moffat][rmoff] about the "new" ETL, based on event-driven architectures and streaming platforms. 
* [Kafka Donuts][2]. This post is the introduction and TOC to a series of posts about Kafka. The author is my colleague [Charl Lamprecht][charl], and in the series, he discusses the use of Kafka in a company who manufactures and sells Donuts. Reading the series introduction post, it is clear that this series is a **MUST** for everyone interested in Kafka. The first episode: **Donut Broker** is [here][3], and the second episode **Donut Baker** is [here][4].

## Misc.

* [Docker on Windows Subsystem for Linux using VirtualBox and Docker Machine][5]. This post by [Travis Illig][travisi] discusses how you can enable both **VirtualBox** as well as **Docker for Windows** on the same Windows box.

## Microsoft Ignite

So, **Microsoft Ignite** starts tomorrow (September 24). It looks to be an awesome conference with lots and lots of announcements of new "stuff", I for one cannot wait!

If you, like me, are not attending but still want to follow the key-notes and various sessions, [this link][6] takes you to the live stream.

The other day I looked at the sessions and here are some that interests me:

* [BRK2416 - The roadmap for SQL Server](https://myignite.techcommunity.microsoft.com/sessions/65955?source=sessions)
* [BRK2183 - SQL Server Machine Learning Services: An E2E platform for machine learning](https://myignite.techcommunity.microsoft.com/sessions/65356?source=sessions)
* [BRK3228 - What’s new in SQL Server on Linux and containers](https://myignite.techcommunity.microsoft.com/sessions/65957?source=sessions)
* [BRK2229 - The future of SQL Server and big data](https://myignite.techcommunity.microsoft.com/sessions/65956?source=sessions)
* [THR2168 - The next generation of SQL Server tools](https://myignite.techcommunity.microsoft.com/sessions/66199?source=sessions)
* [BRK4021 - Deep dive on SQL Server and big data](https://myignite.techcommunity.microsoft.com/sessions/65967?source=sessions)
* [THR2171 - Deploying a highly available SQL Server solution in Kubernetes](https://myignite.techcommunity.microsoft.com/sessions/66202?source=sessions)
* [BRK3154 - SQL Server in containers for application development and DevOps](https://myignite.techcommunity.microsoft.com/sessions/64634?source=sessions)
* [THR2308 - SQL Server vNext meets AI and Big Data](https://myignite.techcommunity.microsoft.com/sessions/66961?source=sessions)

As you see, mostly SQL Server related sessions, and I must say that the sessions around SQL Server and Big Data intrigues me.

## Data Science

* [How Machine Learning Works: 3 Resources To Learn And Develop ML Applications][7]. The [Lightbend][8] team has put together some resources about how to design, build, run and manage machine learning applications in production.
* [Simplify Market Basket Analysis using FP-growth on Databricks][9]. In retail, you want to recommend to shoppers what to purchase, and often you base the recommendations on items that are frequently purchased together. A key technique to uncover associations between different items is known as market basket analysis. This blog post talks about how you run your market basket analysis using **Apache Spark MLlib** `FP-growth` algorithm on **Databricks**.
* [Introduction to Deep Learning][10]. This blog post is the first in a series about **Deep Learning**. At a quick glance, the series looks very informative.

## SQL Server Machine Learning Services

I am still working on the third post in the [Install R Packages in SQL Server ML Services](/series/sql_server_ml_services_install_packages) series. I hope to be able to publish it soon:ish.

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
[travisi]: https://twitter.com/tillig

[1]: https://www.confluent.io/blog/changing-face-etl
[2]: https://charlla.com/kafka-donuts/
[3]: https://charlla.com/kafka-donuts-1/
[4]: https://charlla.com/kafka-donuts-2/
[5]: https://www.paraesthesia.com/archive/2018/09/20/docker-on-wsl-with-virtualbox-and-docker-machine/
[6]: https://www.microsoft.com/en-us/ignite
[7]: https://www.lightbend.com/blog/how-machine-learning-works-3-resources-to-learn-and-develop-ml-applications
[8]: https://www.lightbend.com/
[9]: https://databricks.com/blog/2018/09/18/simplify-market-basket-analysis-using-fp-growth-on-databricks.html
[10]: https://ziedhy.github.io/2018/08/Introduction_Deep_Learning.html
