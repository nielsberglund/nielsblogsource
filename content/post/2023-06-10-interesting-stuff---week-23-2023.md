---
type: post
layout: "post"
title: Interesting Stuff - Week 23, 2023
author: nielsb
date: 2023-06-10T14:45:43+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-23-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-23-23.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Kusto Detective Agency
  - Kafka
  - Generative AI
  - Microsoft Fabric
  - Data Saturday Durban
description: This week, I share some of the latest data and AI technologies from Azure and OpenAI. I also invite you to submit presetations for Data Saturday Durban 2023, a free online event for data enthusiasts.
---

In this week's post, I share some of the exciting things I have come across during the week related to data and AI: 

You'll learn about the new features and capabilities of Azure Data Explorer, Azure AI, and Microsoft Fabric. You'll also see how to combine ChatGPT and streaming data for real-time generative AI applications. 

Finally, there is a CfS for Data Saturday Durban 2023. If you are passionate about data and are interested in presenting any data-related topic, this is your chance to shine! 

If you're curious about these topics, check out this blog post!

<!--more-->

## Azure Data Explorer

* [What's New in Kusto – Build 2023 !][1]. The link here is to an announcement of what is new in the latest build of Kusto. Some cool stuff in the new build: **Azure Data Explorer** (ADX) is now part of [Microsoft Fabric][2]. I like Azure Functions, so I am pleased to see that there are now both input and output bindings for ADX. Having a Databricks Delta table as an external table in ADX! There are a lot more, but that was some of the things that I found interesting.
* [Kusto Detective Agency Season 2][3]. This was also in the announcement above, but it deserves its own link: Kusto Detective Agency - Season 2. Kusto Detective Agency is a cool way to learn Kusto. It is a game where you must solve a mystery by writing Kusto queries. I participated in season 1, which was a lot of fun. I am looking forward to season 2.

## Azure AI

* [Build next-generation, AI-powered applications on Microsoft Azure][4]. This post introduces the latest technologies and announcements for developers who want to build next-generation, AI-powered applications on Microsoft Azure. The post highlights the following areas: Generative AI, Cloud-native app platform and AI-assisted developer tooling. The last part is extremely interesting. I have seen some awesome demos with Copilot in PowrBI and being able to ask questions and get answers about the data!

## Microsoft Fabric

* [Microsoft Fabric: A New Era of Data Analytics and AI Integration][5]. In this post, you get an introduction to **Microsoft Fabric**, a new data platform for the era of AI. The post explains what Fabric is, how it works, and why it differs from other data platforms. 

## Streaming

* [GPT-4 + Streaming Data = Real-Time Generative AI][6]. This post explores how ChatGPT and streaming data can be used for real-time generative AI applications. The post demonstrates how to build a real-time generative AI application that uses ChatGPT and streaming data. It describes the application's architecture and components: a web app, a Kafka producer, a Kafka consumer, and a ChatGPT service. It also provides the code and instructions to run the application on Confluent Cloud.

## WIND (What Is Niels Doing)

We are coming into half-year, and the conference season starts up again!

I am so happy to announce that SQL Saturday is returning to Durban after a break while the pandemic was raging. Actually, it is not SQL Saturday coming back but something better: **Data Saturday**. We have renamed the event to Data Saturday to reflect that we are not only focusing on SQL Server but on all data-related technologies. The event will be on the 19th of August, and we're on the hunt for exceptional speakers to join our lineup! If you have expertise in SQL Server development, BI, Microsoft Fabric, Kafka Streaming, OpenAI, Azure OpenAI, or anything data-related, this is your chance to shine!

If you're passionate about data and have a captivating presentation on any of the above topics, we want to hear from you! To apply, please follow these steps:

1. Visit our website at [Data Saturday Durban 2023][7] 
1. Fill out the speaker submission form, providing details about your proposed sessions.
1. Include a brief bio highlighting your expertise and previous speaking engagements.
1. Submit your application by July 14th, 2023.

We are also looking for sponsors. If you are interested in sponsoring the event, please [email me][ma].

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

[1]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/what-s-new-in-kusto-build-2023/ba-p/3829467
[2]: https://blog.fabric.microsoft.com/en-us/blog/sense-analyze-and-generate-insights-with-synapse-real-time-analytics-in-microsoft-fabric
[3]: https://detective.kusto.io/
[4]: https://azure.microsoft.com/en-us/blog/build-next-generation-ai-powered-applications-on-microsoft-azure/
[5]: https://medium.com/@ruimigueltcarvalho/microsoft-fabric-a-new-era-of-data-analytics-and-ai-integration-2e35925b87e0
[6]: https://www.confluent.io/blog/chatgpt-and-streaming-data-for-real-time-generative-ai/
[7]: https://sessionize.com/data-saturday-durban2023/