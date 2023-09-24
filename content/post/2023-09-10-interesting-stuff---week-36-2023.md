---
type: post
layout: "post"
title: Interesting Stuff - Week 36, 2023
author: nielsb
date: 2023-09-10T09:25:38+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-36-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-36-23.jpg"
categories:
  - roundup
tags:
  - distributed computing
  - Kubernetes
  - Dapr
  - Kafka
  - RisingWave
  - Streamprocessing
  - AI/ML
description: "This week: explore event-driven systems, AI compilers, and real-time data pipelines! Join me at Data Saturday Cape Town on September 30th, and mark your calendar for AI & Data Infusion Roadshow Durban on November 11th."
---

This week, discover event-driven systems with Dapr in Kubernetes, delve into AI compilers by Microsoft Research, and learn about OpenTelemetry for observability. 

Uncover Formula 1 streaming data pipelines with Python, Kafka, RisingWave, and Confluent Cloud's role in real-time insurance quotes. 

Join me at Data Saturday Cape Town on September 30th, and save the date for AI & Data Infusion Roadshow Durban on November 11th. 

<!--more-->

## Distributed Computing

* [Building event-driven systems at scale in Kubernetes with Dapr — Part I: Why Dapr?][1]. This blog post is by [Simon Headley][2], who is a mate and colleague of mine at [Derivco](/derivco). For the last few months, we have been working together on a project where one of the requirements was to handle thousands of events per second and be stateful. Simon has been the driving force behind the architecture and implementation of said event-driven system. In the blog post, Simon explains why we chose [Dapr](https://dapr.io/) as the framework for the system and a little bit about what Dapr is. Simon is a very smart guy, and I am looking forward to the rest of this series. I am also looking forward to the next time we can have a beer together. :smile:
* [Effective and Efficient Observability with OpenTelemetry][3]. The link is an [InfoQ][iq] presentation. The presentation is about [OpenTelemetry](https://opentelemetry.io/), a framework for collecting telemetry data from distributed systems. The presenter shares his experiences of OpenTelemetry based on a large-scale observability initiative adopting OpenTelemetry across hundreds of services.

## AI/ML

* [Microsoft Research Introduces Not One, Not Two, But Four New AI Compilers][4]. This blog post is about Microsoft Research's four new AI compilers: Rammer, Roller, Welder, and Grinder. These compilers are designed to optimize different aspects of deep neural network (DNN) computation on hardware accelerators. The post explains the main features and benefits of each compiler, such as reducing scheduling overhead, memory access traffic, and control flow complexity. The post also claims that these compilers mark a significant leap forward in AI compiler technology.
* [Architecting an Enterprise-grade AI Pipeline with Databricks and Azure Machine Learning — Part 1, Start with the end in Mind][]. This post is another post by a mate and colleague, [Dean Martin][5]. In the post, Dean shares his experience of building an enterprise-grade AI pipeline with Databricks and Azure Machine Learning1. He explains how these two platforms can work together to handle big data AI applications requiring data warehousing and model lifecycle management. He also outlines the requirements and features of the AI pipeline, such as seamless integration, automatic retraining, and elastic scaling. This is the first part of a series that will cover the details of the AI pipeline implementation. Oh, it goes without saying that Dean is very smart, too, and I look forward to the next time we can have a beer together. :smile:
* [What OpenAI Really Wants][6]. I guess we all have heard about ChatGPT by now and the company that created it, OpenAI. But what do we know about OpenAI? The post linked to is a "long-read" explaining what what OpenAI is, what they are doing, and why they are doing it. I found the article extremely interesting!

## Streaming

* [Building a Formula 1 Streaming Data Pipeline With Kafka and Risingwave][7]. This blog post covers creating a streaming data pipeline with Python, Kafka, RisingWave, and Grafana. The author uses a Python script to extract the data from a JSON file and send it to a Kafka topic. The post demonstrates using RisingWave as a streaming database to pull data from a Kafka topic and create materialized views to process and join the data in real-time. Next, the author explains how to create tables in RisingWave to store more static information and join them with the streaming data using SQL queries. The post is an excellent example of using Kafka and RisingWave to build a streaming data pipeline with Python and Grafana.
* [Easy and Instant Insurance Quotes Using Data Streaming with Confluent Cloud][8]. The blog post explains how data streaming with Confluent Cloud can enable real-time insurance quotes for customers. The post describes the challenges and opportunities of the insurance industry in the digital era, and how Confluent Cloud can help insurance companies and Insurtechs to stream data from legacy systems and databases, enrich and process data in real time, and deliver data to various downstream applications and services. 

## WIND (What Is Niels Doing)

[**Data Saturday Cape Town**][9] is coming up on the 30th of September. I am presenting two sessions:

* **Unleash the Power of Azure OpenAI: Transforming AI Development on Microsoft Azure** - This is the session I presented at the Data Saturdays in Johannesburg and Durban a month or so ago. I am looking forward to presenting it again.
* **ksqlDB - The Real-Time Streaming Database** - As the title implies, I look at the awesomeness of ksqlDB and how it can be used. I have presented this session before, but never in South Africa.

Data Saturday Cape Town is FREE, so if you are in the area, please [register][9] and come along. I am looking forward to seeing you there!

The following is "hot of the presses":

After Data Saturday Durban's success, we have started planning a new conference: **AI & Data Infusion Roadshow Durban**. The plan is to run it on November 11, and as the name implies, it will be a lovefest of AI and data. We are still working on the details, but mark your calendar for  November 11. 

As more details emerge, I will keep you posted. I am looking forward to seeing you there, too!

And the last thing about what I am doing: I will probably not publish anything next week. I am taking some time off to re-charge the batteries. I will be back the week after with more interesting stuff.

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
[jserra]: https://www.linkedin.com/in/jamesserra/

[1]: https://headleysj.medium.com/building-event-driven-systems-in-kubernetes-with-dapr-part-i-dapr-vs-azure-functions-48f68a68fc22
[2]: https://www.linkedin.com/in/headleysj/
[3]: https://www.infoq.com/presentations/opentelemetry-observability/
[4]: https://pub.towardsai.net/microsoft-research-introduces-not-one-not-two-but-four-new-ai-compilers-1e28b227e3e5
[5]: https://www.linkedin.com/in/deanmartinza/
[6]: https://www.wired.com/story/what-openai-really-wants/
[7]: https://www.kdnuggets.com/building-a-formula-1-streaming-data-pipeline-with-kafka-and-risingwave
[8]: https://www.confluent.io/blog/real-time-insurance-quotes/
[9]: https://datasaturdays.com/2023-09-30-datasaturday0044/