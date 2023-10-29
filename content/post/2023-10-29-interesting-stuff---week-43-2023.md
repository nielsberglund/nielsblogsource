---
type: post
layout: "post"
title: Interesting Stuff - Week 43, 2023
author: nielsb
date: 2023-10-29T09:02:50+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-43-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-43-23.jpg"
categories:
  - roundup
tags:
  - generativeai
  - autogen
  - risingwave
  - streamprocessing
  - kafka
  - aimldatainfusiondbn
description: "Stay updated with the latest in Generative AI and Streaming tech! From AutoGen to LLM-based agents. TimeGPT, RisingWave 1.3, and a blog series on Generative AI. Not to forget the AI/ML & Data Infusion Roadshow Durban!"
---

🚀 This week, we delve into game-changing developments like Microsoft Research's AutoGen, which accelerates AI development with automated features. Explore the remarkable growth of LLM-based autonomous agents and their potential to achieve human-like intelligence. Learn about TimeGPT, a cutting-edge model for time series forecasting 

Read about RisingWave 1.3, an open-source streaming database with advanced features. Plus, get ready for an exciting blog series on Generative AI and Kafka. Lastly, join Niels at the **AI/ML & Data Infusion Roadshow Durban** for an exceptional tech event. Stay updated with the latest tech trends - read on! 💡

<!--more-->

## Generative AI

* [Why AutoGen Is So Important][1]. In this blog-post, the author, [Matthew Berman][2], introduces AutoGen, a project from Microsoft Research that enables developers to create teams of AI agents that can write and run code, give feedback, plan, and more. He explains how AutoGen can speed up and simplify AI development by providing features such as automated iteration, code execution, drop-in replacement for ChatGPT API, and open-source model support. As a side note, the post's author also has a [YouTube channel][3] where he demonstrates AutoGen and other AI tools. Well worth [subscribing][3] to.
* [The Growth Behind LLM-based Autonomous Agents][4]. The author of this blog-post presents the results of a survey on the growth of LLM-based autonomous agents. He shows how LLM-based agents have achieved remarkable success in the past two years, indicating their potential to reach human-like intelligence in various domains. He also explains how LLM-based agents are designed with four modules: memory, planning, action, and profiling, which allow them to learn from the environment and execute code. He then discusses the applications and evaluation strategies of LLM-based agents in three areas: social science, natural science, and engineering, giving examples of how they can influence multiple fields and how they are measured. 
* [TimeGPT: The First Foundation Model for Time Series Forecasting][5]. The blog-post linked to discusses TimeGPT, a new project that aims to create a foundation model for time series forecasting using large language models (LLMs). The post introduces TimeGPT, a novel model that uses the Transformer architecture with a self-attention mechanism to handle time series data. The model can learn from historical and exogenous data and generate forecasts using an encoder and a decoder. The article explains how TimeGPT was trained on a massive dataset of over 100 billion data points from various domains, such as finance, weather, web traffic, and more. Looks like a very interesting project!

## Streaming

* [Highlights of RisingWave v1.3: The Open-Source Streaming Database][6]. This blog-post announces the release of RisingWave 1.3. [RisingWave][7] is an open-source streaming database similar to Apache Flink, [Timeplus][8], etc. The post explores some of the prominent new features in the release. This includes advanced support for regular expression functions, a syntax update for creating Kafka, Kinesis, and Pulsar sinks, and more. I am interested in checking out RisingWave as I believe we have some use cases for it at [Derivco](/derivco).
* [Getting Started with Generative AI][9]. You may wonder why this blog-post is under the Streaming section and not in the GenerativeAI, as it clearly has Generative AI in the title. Well, the reason is that the post is the first in a series of posts about Kafka and GenerativeAI and how the two can be used together. This particular post acts as an introduction to GenerativeAI and covers the basics of the topic. I am definitely looking forward to the rest of the series!


## WIND (What Is Niels Doing)

This:

![](/images/posts/ai-infusion.png)

**Figure 1:** *AI/ML & Data Infusion Roadshow Durban*

I am busy prepping for the event you see in *Figure 1*, the [**AI/ML & Data Infusion Roadshow Durban**][10]. I am not speaking at the event, but I am part of the organizing committee. The event looks to be spectacular, with great [speakers][11] and an awesome [agenda][12]! If you are in the Durban area, I highly recommend you attend. The event is free, but you need to register. You can register [here][13]. 

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

[1]: https://matthewberman.substack.com/p/why-autogen-is-so-important
[2]: https://www.linkedin.com/in/matthewberman/
[3]: https://www.youtube.com/@matthew_berman
[4]: https://www.kdnuggets.com/the-growth-behind-llmbased-autonomous-agents
[5]: https://towardsdatascience.com/timegpt-the-first-foundation-model-for-time-series-forecasting-bf0a75e63b3a
[6]: https://risingwave.com/blog/highlights-of-risingwave-v1-3-the-open-source-streaming-database/
[7]: https://risingwave.com/
[8]: https://www.timeplus.com/
[9]: https://www.confluent.io/blog/get-started-with-generative-ai/
[10]: https://aimldatadurban.org/ai-ml-infusion-dbn/
[11]: https://aimldatadurban.org/ai-ml-infusion-dbn/#speakers
[12]: https://aimldatadurban.org/ai-ml-infusion-dbn/#agenda
[13]: https://aimldatadurban.org/ai-ml-infusion-dbn/#registration
