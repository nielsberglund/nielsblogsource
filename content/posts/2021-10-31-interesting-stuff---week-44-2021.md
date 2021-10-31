---
type: post
layout: "post"
title: Interesting Stuff - Week 44, 2021
author: nielsb
date: 2021-10-31T08:53:44+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Kafka
  - Databricks
  - machine learning
  - PASSDataCommunitySummit 
description: Kafka & retail, Azure Data Explorer & Kafka, Kafka Stream Governance, and other interesting topics.
keywords:
  - Azure Data Explorer
  - Kafka
  - Databricks
  - machine learning
  - PASSDataCommunitySummit 
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

# Machine Learning / Data Science

* [Open-Sourcing a Monitoring GUI for Metaflow, Netflix's ML Platform][2]. This Netflix post looks at **Metaflow GUI**. This GUI for their open-sourced, **Metaflow** library allows data scientists to monitor their workflows in real-time, track experiments, and see detailed logs and results for every executed task. The GUI can be extended with plugins, allowing the community to build integrations to other systems, etc.
* [Moneyball 2.0: Real-time Decision Making With MLB's Statcast Data][3]. Back in 2003, [Michael Lewis][5] wrote the book [Moneyball][4]. The book was about how a baseball manager used data analysis to identify undervalued players. The post here looks at how baseball teams today use streaming data and Databricks to do real-time analysis and decisions. Very interesting! Oh, BTW, Micheal Lewis is an excellent author, and the book mentioned is great!

## Azure Data Explorer

* [How to do Real-Time Analytics Using Apache Kafka and Azure Data Explorer][6]. In a couple of blog posts, I have mentioned how I did a session about Apache Kafka and Azure Data Explorer at the **Data Platform Summit 2021**. The recordings from the Summit has now been made available for FREE, and the link is to my session. Notice that you need to join Data Platform Geeks unless you are a member already, but it is free, and by joining, you get access to all recordings!
* [How to Ingest Into Azure Data Explorer From Apache Kafka using Kafka Connect][7]. This post is also from "yours truly". In the post we look at how to configure and set up Kafka Connect to allow ingestion into Azure Data Explorer.

## Streaming

* [Architecting a Kafka-centric Retail Analytics Platform — Part 1][8]. This post is the first of a series looking at building a Kafka-centric analytics platform that ingests and processes business data at scale. By the way, the author of the post, [Dunith Dhanushka][dunith], is someone you should follow if you are interested in event driven architecture, streaming, Kafka, etc. He is excellent, and I am subscribing to his writings on Medium!
* [Stream Governance – How it Works][9]. I have written previously about the new Stream Governance functionality Confluent introduced recently. This post is the first in a series about Stream Governance and how it works: **Stream Governance – How it Works**. This first post looks at some of the key features of Stream Governance. At [**Derivco**](/derivco), we are highly interested in the topic of data governance. I will follow this closely! 


## WIND (What Is Niels Doing)

Well, I have mentioned it before, but:

![](/images/posts/PASS-I-am-speaking-800.png)

**Figure 1:** *PASS Session*

Yeah, I am delivering [**Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer**][11]. The session is recorded and will be available for viewing from when the conference starts. Then [Thursday, Nov 11 15:15 - 15:45 UTC][10], (you have to [register][12] to access this link), is a virtual live Q&A with me where we discuss **Azure Data Explorer**.

So, [register][12] now, view the recorded video and come and chat to me [Thursday, Nov 11 15:15 - 15:45 UTC][10]. The registration is FREE, and besides me, you get to hear from the people that really know what they are talking about!

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
[dunith]: https://twitter.com/dunithd


[1]: {{< relref "2021-10-24-interesting-stuff---week-43-2021.md" >}}
[2]: https://netflixtechblog.com/open-sourcing-a-monitoring-gui-for-metaflow-75ff465f0d60
[3]: https://databricks.com/blog/2021/10/28/moneyball-2-0-real-time-decision-making-with-mlbs-statcast-data.html
[4]: https://en.wikipedia.org/wiki/Moneyball
[5]: https://en.wikipedia.org/wiki/Michael_Lewis
[6]: https://dps10.com/how-to-do-real-time-analytics-using-apache-kafka-and-azure-data-explorer/
[7]: {{< relref "2021-10-27-how-to-ingest-into-azure-data-explorer-from-apache-kafka-using-kafka-connect.md" >}}
[8]: https://medium.com/event-driven-utopia/architecting-a-kafka-native-retail-analytics-platform-part-1-bf1eba42a371
[9]: https://www.confluent.io/blog/stream-governance-how-it-works/
[10]: https://event.passdatacommunitysummit.com/widget/redgate/summit2021/sessioncatalog/session/1629311226474001sKl1
[11]: https://passdatacommunitysummit.com/sessions/265026
[12]: https://reg.passdatacommunitysummit.com/flow/redgate/summit2021/registrationopeningpage/page/introlanding
