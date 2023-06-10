---
type: post
layout: "post"
title: Interesting Stuff - Week 20, 2023
author: nielsb
date: 2023-05-21T09:35:25+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-20-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-20-23.jpg"
categories:
  - roundup
tags:
  - AI/ML
  - Streaming
  - Kafka
  - Spark
  - Data Saturday
description: "This week: Reinforcement Learning, Real-Time Streaming Ecosystem, Apache Spark Structured Streaming, Kafka Summit 2023, Data Saturday Johannesburg, Data Saturday Durban" 
---

In this week's post, I will share with you some of the most interesting and relevant articles I have read this week on various topics related to data and streaming. You will find links to:

* The latest research developments in reinforcement learning and how they can be applied to different domains and challenges.
* The real-time streaming ecosystem and how to design and implement a streaming solution using various tools and technologies.
* The performance and latency improvements of Apache Spark Structured Streaming and how they enable more use cases for real-time data processing.
* The highlights of Kafka Summit 2023, the largest conference for Apache Kafka users and enthusiasts, and the new features and announcements from Confluent, the leading provider of Kafka solutions.
* **Data Saturday** in Johannesburg in August and planning for the upcoming **Data Saturday - Durban**.

If you are curious about these topics and want to stay updated on the latest trends and innovations in the data and streaming world, read on!

<!--more-->

## AI/ML

* [5 Papers You Can't-Miss: Reinforcement Learning][1]. If you are interested in reinforcement learning, this post by Ulrik Thyge Pedersen is a must-read. The post covers topics such as meta-learning, imitation learning, natural language processing, instruction manuals, and curiosity-driven exploration. The author briefly overviews each paper, its main contributions, and links to the original papers and code. The post is a great starting point for further exploration of the topics covered.

## Streaming

* [Real-Time Streaming Ecosystem - Part 3][2]. It seems that not a week goes by without me linking to a post by [Hubert Dulay][3] :smile:. This week is no exception. In this third part of his series about the real-time streaming ecosystem, he covers streaming platforms. Streaming platforms are distributed publish and subscribe systems for events. In the post, Hubert compares streaming platforms with stream processing platforms and discusses the differences between the two. He also covers the different streaming platforms available. As always, a great post.
* [Latency goes subsecond in Apache Spark Structured Streaming][4]. This post describes how Databricks improved the latency of Apache Spark Structured Streaming by optimizing offset management. The authors explain how offsets are used to track the progress of streaming queries and how they can cause delays when they are stored and retrieved from external storage systems. The authors propose a new design that uses an in-memory cache to store and fetch offsets, reducing the latency by 68-75%. Very cool! We are looking at it at work ([Derivco](/derivco)) to see if we can use it to improve the latency of our streaming queries.
* [Ready to Relive the Excitement of Kafka Summit 2023? Here's What Went Down!][5]. As the title implies, this is a recap of what happened at Kafka Summit 2023. The post covers the keynote sessions, the sessions, and the announcements. The most exciting thing for me was the announcement of the Early Access Program for Confluent's fully managed service for Apache Flink. I have signed up; let's see if I am accepted. The post is a great way to catch up on what happened at the summit if you did not attend.

## WIND (What Is Niels Doing)

Sigh, so much cool "stuff", so little time "smile"! By now, I'd like to have published the fourth post in the **Develop a Real-Time Leaderboard Using Kafka and Azure Data Explorer** series. But no, I have been busy with other "stuff". I am working on it, though... :smile:.

Some of the "other stuff" mentioned above is looking at using **Azure Data Explorer** as a vector database together with **Azure OpenAI**. 

The "old" SQL Saturday is back, but now in the form of [**Data Saturdays**][9]. One is coming up in Johannesburg on August 5, and I am busy preparing sessions for it. If you want to attend, check out the [Data Saturday - Johannesburg][6] site. If you are interested in presenting at the event, the [call for speakers][8] is open until May 31.

Speaking of Data Saturday, [Lawrance Reddy][10] and I are planning a **Data Saturday** in Durban a week or two after the one in Johannesburg. We are still working on the details, but I will post more information once we have it. If you would like to be part of planning and running the event, please [get in touch][ma]!

Oh, last thing - most likely, there won't be a post next week. I am flying out to Australia on Saturday (May 27), so I wonder if I am in shape to get a post out on Sunday. I will most certainly be back the week after, though.

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

[1]: https://pub.towardsai.net/5-papers-you-cant-miss-reinforcement-learning-fca7a12c676d
[2]: https://hubertdulay.substack.com/p/real-time-streaming-ecosystem-part-3af
[3]: https://www.linkedin.com/in/hkdulay/
[4]: https://www.databricks.com/blog/latency-goes-subsecond-apache-spark-structured-streaming
[5]: https://www.confluent.io/blog/kafka-summit-2023-recap/
[6]: https://datasaturdays.com/2023-08-05-datasaturday0036/
[7]: https://www.eventbrite.com/e/data-saturday-36-johannesburg-2023-tickets-567744036697
[8]: https://sessionize.com/data-saturday-johannesburg2023/
[9]: https://datasaturdays.com/
[10]: https://www.linkedin.com/in/lawrance-reddy-29201126/
