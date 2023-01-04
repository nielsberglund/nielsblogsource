---
type: post
layout: "post"
title: Interesting Stuff - Week 33, 2021
author: nielsb
date: 2021-08-15T09:27:43+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - Kafka
  - Azure
  - Confluent Cloud
  - Big Data
description: Kafka via Confluent Cloud on Azure, the cost of Big Data, real-time retraining, and other interesting topics.
keywords:
  - Kafka
  - Azure
  - Confluent Cloud
  - Big Data   
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

## Big Data

* [Challenges and Opportunities to Dramatically Reduce the Cost of Uber's Big Data][1]. I think we all agree that Big Data is good. However, there is no doubt that Big Data incurs costs, especially in large organisations. This post from Uber looks at the top challenges they had when assessing their Big Data Platform's costs and the overall strategy they devised to address them. Very interesting!
* [Cost-Efficient Open Source Big Data Platform at Uber][2]. Another post by Uber. In the previous post, Uber discussed their initiative to reduce costs on their data platform. They looked at three broad pillars: platform efficiency, supply, and demand. In this post, they discuss the efforts to improve the efficiency of the data platform and bring down costs.

## Streaming

* [Lambda Learner: Nearline learning on data streams][3]. In this post, LinkedIn discusses an in-house system called Lambda Learner. Lambda Learner is a library for iterative, incremental training of a class of supervised machine learning models. The discussion is about how the Lambda Learner system allows for near real-time re-training of machine learning models. This is a very interesting post!
* [Run Confluent Cloud & Serverless Apache Kafka on Azure][4]. This is a post by yours truly. As you may know, I have some conferences coming up, and Azure features in quite a few of the talks, together with Apache Kafka. I thought it would be cool if I could run Apache Kafka on Azure and bonus points if I could run it as SaaS, i.e. Confluent Cloud. So in this post, I look at what it takes to deploy Confluent Cloud on Azure.

## WIND (What Is Niels Doing)

Apart from publishing the blog post mentioned above, I am prepping for the upcoming [**2021 Data Platform Summit**][12]. Speaking about the **Data Platform Summit**, the organizers have managed to increase the capacity of the virtual platform to 10,000! So, they have opened up **FREE** booking for **LIVE** attendance for a limited time. They have an internal quota, and once that is full, the free booking will close. Hurry up to [**https://dataplatformgeeks.com/dps2021/complimentary-registration**][5] to register for **FREE**!

Related to conferences; during the last couple of weeks, I did two webinars, of which one is up on YouTube (I expect the other one to be up soon as well):

* [**Stream Processing with Apache Kafka and .NET**][6]. A presentation about Apache Kafka for the .NET developer and some stuff about stream-processing and ksqlDB. Due to a power failure, there is a break and some distortion in this video; sorry about that.

Obviously I'll let you know when the second webinar is up.

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



[1]: https://eng.uber.com/challenges-opportunities-to-reduce-cost-ubers-big-data/
[2]: https://eng.uber.com/cost-efficient-big-data-platform/
[3]: https://engineering.linkedin.com/blog/2021/lambda-learner--nearline-learning-on-data-streams
[4]: {{< relref "2021-08-14-run-confluent-cloud--serverless-apache-kafka-on-azure.md" >}}
[5]: https://dataplatformgeeks.com/dps2021/complimentary-registration
[6]: https://youtu.be/dmsM_NKjFGs
[12]: https://dataplatformgeeks.com/dps2021/
