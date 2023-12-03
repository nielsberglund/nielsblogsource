---
type: post
layout: "post"
title: Interesting Stuff - Week 48, 2023
author: nielsb
date: 2023-12-03T11:02:06+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-48-23.png"
thumbnail: "/images/thumbnails/posts/wrup-48-23.png"
categories:
  - roundup
tags:
  - Generative AI
  - streaming
  - streamprocessing
  - Kafka
description: "This week: dive into the latest in Generative AI and Data Streaming in this week's blog! Discover the impact of AI tools like GitHub Copilot, learn to create a Custom GPT model, and explore the synergy of AI with data streaming."
---

Welcome to this week's blog post where we delve into the fascinating realms of Generative AI and Data Streaming! 🌟 

Explore the transformative power of coding assistants like GitHub Copilot and ChatGPT, learn how to create your own Custom GPT model, and uncover the innovative approach of Programming with Representations (PwR). 

Dive into the world of data streaming with insights on librdkafka for Apache Kafka and the intriguing intersection of physics and data science in stream processing. Plus, get a glimpse of my recent experience at the .NET Conf 2023 in Johannesburg, where I shared insights on Kafka for .NET Developers. 🚀💻

<!--more-->

## Generative AI

* [Intro to Large Language Models][1]. This YouTube video by [Andrey Karpathy][2] is an excellent introduction to large language models. Andrey has a way of explaining things that makes it easy to understand. I highly recommend his [website][2] and [YouTube channel][3].
* [Exploring Generative AI][4]. This blog-post looks at the evolving role of Large Language Models (LLMs) in software development. The article delves into how these models, particularly coding assistants like GitHub Copilot and ChatGPT, are transforming how developers work. It highlights the various tasks these tools assist with, such as code generation, information retrieval, and code transformation into documentation. The article also explores different interaction modes with these tools, including chat and command-line interfaces, and the importance of prompt composition in enhancing their effectiveness. The piece reflects on the current use of these tools in coding, emphasizing their potential to improve software development practices while acknowledging the need for developers to maintain a critical approach to their output.
* [Build Your First Custom GPT in Less than 2 Minutes][5]. The blog-post linked to offers a straightforward guide for creating a custom GPT model. It begins by introducing the GPT Builder tool, accessible to ChatGPT Plus and Enterprise users, and provides a step-by-step process for using the GPT Editor. The focus is crafting a "Great Explainer" model designed to simplify complex topics into easy-to-understand language, suitable even for 5th graders. The article emphasizes the ease and speed of this process, making it accessible even for beginners. This approach to customizing AI models opens up possibilities for tailored educational tools and simplified explanations of intricate subjects.
* [PwR: Using representations for AI-powered software development][6]. This blog-post introduces an innovative approach called Programming with Representations (PwR). This method utilizes domain-specific languages (DSLs) to enhance communication between developers and AI tools, aiming to simplify code creation while ensuring software safety, reliability, and customization. PwR leverages large language models (LLMs) to transform natural language conversations into DSL programs, which are then converted into executable code. This process incorporates built-in guardrails within the DSL to ensure essential components like workflow starting states, clear transitions, and error handling are automatically included. PwR is particularly beneficial for non-technical domain experts, allowing them to create software tailored to their needs without deep coding knowledge. It also enhances productivity for complex software engineering teams. The blog post exemplifies PwR's application in creating a welfare scheme application, demonstrating its potential to democratize software development while prioritizing safety and reliability.

## Streaming

* [A Deep Dive Into Sending With librdkafka][7]. The blog-post linked to provides a comprehensive guide on using librdkafka for message production in Apache Kafka. The article begins by discussing the impact of Kafka cluster outages on applications, particularly those in finance. Then, it delves into the specifics of librdkafka, an essential client library used in non-JVM environments. It offers a detailed walkthrough of the message production process, including creating a config struct, setting a delivery report callback, and creating a producer instance. The post also explains the relationship between various data structures in librdkafka and the roles of different thread types involved in sending a message to Kafka. This guide is handy for developers working in C or C++ environments, providing a clear understanding of how to write code that interacts effectively with Kafka through librdkafka and how to handle error situations and responses.
* [A Relativity of Real-Time Data][8]. This blog-post by [Hubert Dulay][hubert] draws an intriguing parallel between the theory of relativity in physics and stream processing in data science. The author explores how similar to the concept of time dilation in relativity, the temporal order of events in stream processing is not absolute but varies based on the system's perspective. This comparison highlights the challenges in maintaining accurate event order in distributed systems, where data travels through various nodes with different processing speeds and latencies. The article delves into the concepts of Event Time and Process Time in stream processing, emphasizing the importance of understanding the relativity of event timing for designing effective systems. It also touches on the concept of entropy in information theory and its impact on stream processing, such as network latency and jitter, event ordering uncertainty, and data anomalies. The author concludes by discussing the importance of systems adapting to the dynamic nature of real-time data streams and the ability to control data along the time dimension.
* [Life Happens in Real Time, Not in Batches: AI Is Better With Data Streaming][9]. This blog-post highlights the synergy between data streaming and artificial intelligence (AI) in driving modern business applications. The post, part of a series on real-time data streaming and processing technologies, emphasizes how streaming analytics combined with AI and machine learning (ML) is revolutionizing various industries, from fraud prevention to predictive maintenance. It explains that streaming AI/ML leverages dynamic features of real-time data for contextually relevant predictions, offering businesses a competitive edge and enhanced operational efficiency. The article also discusses the two main types of streaming AI/ML systems: those that make real-time predictions (Online Predictions) and those that incorporate new data to update models in real-time (Continual Learning). It covers a range of use cases across different sectors, such as finance, healthcare, and transportation, where time-sensitive decision-making is crucial. The post concludes by highlighting the role of Confluent Cloud in simplifying the integration of streaming data into AI/ML models, enabling businesses to efficiently leverage real-time data for predictive analytics and decision-making.

## WIND (What Is Niels Doing)

It is Sunday morning, and I came back from Johannesburg yesterday evening:

![](/images/posts/jhb-banner.png)

**Figure 1:** *Johannesburg .NET Conference*

I was in Johannesburg for the second leg of the .NET Conf 2023 MSDUG Community South Africa Edition. I presented the same talk as in Cape Town the week before: **Streaming with Style: Unleashing the Power of Kafka for .NET Developers**. I am happy to say that the demo gods were with me and everything worked as expected, and I had a great time!

The Johannesburg conference was the last for me for this year. Now is the time to rest for a while and then start planning Community Events for next year!

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

[1]: https://youtu.be/zjkBMFhNj_g
[2]: https://karpathy.ai/
[3]: https://www.youtube.com/@AndrejKarpathy
[4]: https://martinfowler.com/articles/exploring-gen-ai.html
[5]: https://pub.towardsai.net/build-your-first-custom-gpt-in-less-than-2-minutes-8bbe524efd80
[6]: https://www.microsoft.com/en-us/research/blog/pwr-using-representations-for-ai-powered-software-development
[7]: https://www.confluent.io/blog/how-to-send-messages-with-librdkafka
[8]: https://hubertdulay.substack.com/p/a-relativity-of-real-time-data
[9]: https://www.confluent.io/blog/ai-is-better-with-data-streaming
