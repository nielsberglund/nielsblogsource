---
type: post
layout: "post"
title: Interesting Stuff - Week 30, 2023
author: nielsb
date: 2023-07-30T08:51:07+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-30-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-30-23.jpg"
categories:
  - roundup
tags:
  - Data Saturday Durban
  - distributed computing
  - Azure OpenAI
  - Azure PlayFab
  - Kafka
description: "In this week's blog post: managing and analyzing game data at scale using Azure PlayFab and Databricks. Ambassador Pattern for distributed systems. OpenAI Whisper on Azure OpenAI Service. Function calling in Azure OpenAI. Using Azure 'Prompt Flow'. Apache Kafka as a mission-critical data fabric for GenAI."
---

🌟 Discover the latest tech innovations in this week's blog post! From managing and analyzing game data at scale using Azure PlayFab and Databricks, to exploring the powerful Ambassador Pattern for distributed systems.  

Get ready for the exciting news about OpenAI Whisper's arrival on Azure OpenAI Service and Azure AI Speech, along with the introduction of function calling. Don't miss the insights on using Azure "Prompt Flow" and the fascinating potential of Apache Kafka as a mission-critical data fabric for GenAI. 

Join us on this tech journey and mark your calendar for the upcoming Data Saturday events! 🚀🌐

<!--more-->

## Misc.

* [Managing and Analyzing Game Data at Scale][1]. Azure PlayFab is a robust backend game platform for building and operating live-connected games. It offers a suite of cloud-based services for game developers, including player authentication, matchmaking, leaderboards, and more. The blog post explains how game developers can use Azure PlayFab and Databricks to collect, manage and analyze game data at scale. Very interesting!

## Distributed Computing

* [Understanding the Ambassador Pattern for Distributed Systems][2]. This blog post is written by a colleague of mine [Waldemar Muhl][3], and it introduces the Ambassador Pattern. The Ambassador Pattern is a design pattern that provides a decoupling mechanism between services in a distributed system. In addition to reducing the coupling between services, it can also improve a system's overall scalability and flexibility. The blog post explains the pattern and how it can be used in a distributed system.

## Azure OpenAI

* [OpenAI Whisper is Coming Soon to Azure OpenAI Service and Azure AI Speech][4]. This blog post is really cool! It announces that OpenAI Whisper, a multi-lingual model that offers transcription and translation of human speech, will be in preview soon in Azure OpenAI Service and Azure AI Speech. The OpenAI Whisper model has multi-lingual capabilities that offer precise and efficient transcription of human speech in 57 languages and translation into English. It also creates transcripts with enhanced readability. By running OpenAI Whisper in Azure, you get the benefits of the Azure ecosystem, such as enterprise-grade security, privacy controls, and data processing capabilities.
* [Function calling is now available in Azure OpenAI Service][5]. The blog post introduces the function calling feature in Azure OpenAI Service, which allows the latest versions of gpt-35-turbo and gpt-4 to produce structured JSON outputs based on functions that you describe in the request. The post looks at what function calling is, how it works, and how to use it. I am a "happy bunny" that this feature is now available in Azure OpenAI Service. I have been waiting for this feature for a while now, and I am looking forward to trying it out.
* [Querying a Corpus of Documents in GPT Mode with Azure "Prompt Flow"][6]. We all have probably by now been using ChatGPT and maybe even explored prompt engineering. But what if you want to query a corpus of documents? That would require you to use LangChain, together with vector stores etc. which may seem daunting. That is where Azure "Prompt Flow" comes in. It allows you to create and test prompts for Azure OpenAI Service, to query a corpus of documents in GPT mode. Read the post to learn more about Prompt Flow! 

## Streaming

* [Apache Kafka as Mission Critical Data Fabric for GenAI][7]. This blog post discusses how Apache Kafka can be used as a mission-critical data fabric for GenAI. The blog post explains the relationship between data streaming and GenAI and shows the enormous opportunities and some early adopters of GenAI beyond the buzz. The post is a very interesting read, and it is an excellent introduction to GenAI and how it can be used with Apache Kafka.

## WIND (What Is Niels Doing)

In the last few "roundups", I have spoken a lot about **Data Saturday Durban** and how it takes place on August 19. I am very excited about the event and look forward to presenting my session on Azure OpenAI Service and attending all the other excellent sessions. There are only a few seats left, so hurry up and register for this FREE event [here][9].

![](/images/posts/data-saturday-jhb.jpg)

**Figure 1:** *Data Saturday Johannesburg*

I have yet to mention that I am also presenting at [**Data Saturday Johannesburg**][8] this coming Sunday, August 5, where I am presenting the same session as at Data Saturday Durban. If you attend Data Saturday Johannesburg, please come by and say Hi! 

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

[1]: https://www.databricks.com/blog/managing-and-analyzing-game-data-scale
[2]: https://waldemar.bearblog.dev/ambassador-pattern
[3]: https://www.linkedin.com/in/waldemar-muhl/
[4]: https://techcommunity.microsoft.com/t5/azure-ai-services-blog/openai-whisper-is-coming-soon-to-azure-openai-service-and-azure/ba-p/3876671
[5]: https://techcommunity.microsoft.com/t5/azure-ai-services-blog/function-calling-is-now-available-in-azure-openai-service/ba-p/3879241
[6]: https://towardsdatascience.com/querying-a-corpus-of-documents-in-gpt-mode-with-azure-prompt-flow-3a79ec23f59c
[7]: https://www.kai-waehner.de/blog/2023/07/22/apache-kafka-as-mission-critical-data-fabric-for-genai/
[8]: https://datasaturdays.com/2023-08-05-datasaturday0036/
[9]: https://datasaturdays.com/2023-08-19-datasaturday0043/
