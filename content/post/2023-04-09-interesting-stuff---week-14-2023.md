---
type: post
layout: "post"
title: Interesting Stuff - Week 14, 2023
author: nielsb
date: 2023-04-09T09:34:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-14-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-14-23.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - leaderboards
  - openAI
  - Kafka
  - Flink
  - ai/ml
description: "This week: **Azure Data Explorer** (ADX) workshop, the third post in the series of building a real-time leaderboard using Kafka and ADX. Also links to building a GPT-powered application and a really interesting intro to reinforcement learning."
---

This week's exciting stuff: cool video from an **Azure Data Explorer** (ADX) workshop. Speaking of ADX, I published my third post in the series of building a real-time leaderboard using Kafka and ADX. On the AI/ML side, "stuff" about building a GPT-powered application and a really interesting intro to reinforcement learning. 

It wouldn't be a roundup without something about Kafka. So, a link to a post about Kafka and fraud detection. Also, a link to the second post in the series about machine learning and streaming data.

<!--more-->

## Azure Data Explorer

* [Azure Data Explorer L300 workshop – Time Series analytics, high concurrency apps and visualization][1]. This YouTube video is from an **Azure Data Explorer** workshop. The video is from the last day of the workshop, and it covers time series analytics, optimising for concurrency, and visualising data. It is excellent!
* [Develop a Real-Time Leaderboard Using Kafka and Azure Data Explorer - II][2]. This is my third post in the series about using Kafka and **Azure Data Explorer** (ADX) to develop a real-time leaderboard for online gaming. In this post, I cover more about ingesting data into ADX and some "cool stuff" related to that. Specifically, what to do if you need to update/transform the data you ingest.

## AI/ML

* [LangChain 101: Build Your Own GPT-Powered Applications][3]. LangChain is a framework for developing applications powered by language models. This post explores LangChain and what you can build with it. The post also contains an example of creating a simple question-answering app with LangChain.
* [Our Learnings from the Early Days of Generative AI][4]. The blog post discusses LinkedIn's experience with generative AI in its early stages, including the challenges faced and lessons learned. It emphasizes the importance of ethics, transparency, and collaboration when working with AI. It suggests that organizations prioritize investing in people and technology to ensure responsible and effective use of AI in the future.
* [Introduction to Reinforcement Learning Series. Tutorial 1; Motivation, States, Actions, and Rewards][5]. This article is the first in a series of tutorials around reinforcement learning: **Introduction to Reinforcement Learning**. The article covers the basic concepts of RL, including the Markov Decision Process (MDP), rewards, and value functions. It also provides an overview of different RL algorithms, such as Q-learning and policy gradient methods, and discusses their strengths and weaknesses. The article concludes by highlighting some of the current challenges in RL and potential future developments in the field.

## Streaming

* [Fraud Detection with Apache Kafka, KSQL and Apache Flink][6]. Fraud detection is vital in a digital world, and real-time data processing with Apache Kafka is the de facto standard to correlate and prevent fraud continuously before it happens. This blog post explores case studies for fraud prevention from companies such as Paypal, Capital One, ING Bank, Grab, and Kakao Games that leverage stream processing technologies like Kafka Streams, KSQL, and Apache Flink.
* [Uniting the Machine Learning and Data Streaming Ecosystems - Part 2][7]. This is the second post in a series looking at machine learning and streaming data. This post explores the opportunities and pitfalls of SQL as an ecosystem bridge. It looks at solutions to interface the JVM and Python interpreter and, finally, dives into code examples that show how to build a streaming machine-learning solution today.

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

[1]: https://youtu.be/qT2NS_caxBE
[2]: {{< relref "2023-04-03-develop-a-real-time-leaderboard-using-kafka-and-azure-data-explorer---ii.md" >}}
[3]: https://www.kdnuggets.com/2023/04/langchain-101-build-gptpowered-applications.html
[4]: https://engineering.linkedin.com/blog/2023/our-learnings-from-the-early-days-of-generative-ai
[5]: https://pub.towardsai.net/introduction-to-reinforcement-learning-series-23492a319735
[6]: https://www.kai-waehner.de/blog/2022/10/25/fraud-detection-with-apache-kafka-ksql-and-apache-flink/
[7]: https://www.confluent.io/blog/uniting-machine-learning-data-streaming-2/
