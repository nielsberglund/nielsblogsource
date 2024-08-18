---
type: post
layout: "post"
title: Interesting Stuff - Week 33, 2024
author: nielsb
date: 2024-08-18T09:37:29+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-33-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-33-24.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Season of AI
  - Kafka
  - Streaming
  - AI Agents
description: "This week we explore key advancements in AI and data streaming, including the MindSearch framework, SQL Generator 2.0, and Multi-Agent-as-a-Service. Plus, don’t miss the highlights of the upcoming Current 2024 event and a preview of my Season of AI presentations in Cape Town and Johannesburg."
---

This week's roundup explores groundbreaking developments in AI and data streaming. From the innovative MindSearch framework that enhances AI-driven web searches to the evolution of SQL Generator 2.0, which simplifies complex database queries, these advancements are pushing the boundaries of technology. 

We also dive into the rapidly growing concept of **Multi-Agent-as-a-Service** and highlight the must-attend **Current 2024** event for data streaming professionals. Plus, a quick update on my upcoming presentations at the **Season of AI** events in Cape Town and Johannesburg!

<!--more-->

## Generative AI

* [MindSearch][1]. In this white paper, the authors introduce MindSearch, a new multi-agent framework combining Large Language Models (LLMs) and search engines to tackle complex information-seeking tasks. The framework addresses the challenges of retrieving and integrating information from multiple web pages, often overwhelming traditional LLMs. By modelling the process as a dynamic graph construction, MindSearch efficiently decomposes queries and retrieves relevant information across large-scale web searches, outperforming existing tools like ChatGPT-Web and Perplexity.ai in both depth and breadth of responses. This post highlights a significant advancement in AI-driven search, showing how a multi-agent framework can dramatically enhance the precision and comprehensiveness of web-based information retrieval. The idea of mimicking human cognitive processes in web searches is intriguing and points to the potential of open-source models in competing with proprietary solutions, opening up new possibilities for researchers and developers in the field.
* [SQL Generator 2.0: How I build AI Query Wizard for Enterprise-Scale with 500+ Tables][2]. This post by How AI Build This offers an intriguing look into the development of an AI-driven SQL generator, version 2.0, aimed at simplifying complex query building. The author walks through the challenges and triumphs of refining the AI model to better understand and generate SQL queries that are accurate and optimized for performance. This post is a testament to the ongoing advancements in AI tools that are becoming increasingly essential for developers, particularly those who aren't database experts but need to interact with databases efficiently. It's impressive to see how AI is being leveraged to lower the barrier to entry in technical fields, allowing more people to harness the power of databases without needing deep SQL knowledge. This approach could reshape how we think about database management and development in the near future.
* [Multi-Agent-as-a-Service — A Senior Engineer’s Overview][3]. This post focuses on the rapidly growing discussion around AI Agents and, more specifically, the concept of **Multi-Agents-as-a-Service** (MAaaS). The author looks at how AI agents, powered by technologies like LLM-based RAG, are transforming various sectors, from e-commerce to customer service, by offering human-like interactions and streamlining processes. However, the post also addresses the challenges engineers face when deploying these agents in enterprise production environments, such as ensuring high availability, accuracy, scalability, and security. This post highlights the importance of defining clear Service Level Objectives (SLOs) for AI agents, particularly regarding availability and accuracy, to ensure these systems meet the required performance standards in production settings. The author's perspective on applying cloud-native principles and best practices to develop a robust MAaaS framework is a thought-provoking approach that could lead to more reliable and scalable AI systems in the future.

## Streaming

* [Current 2024: What's on Tap in Data Streaming][4]. In this post, the spotlight is on **Current 2024**, the premier event for data streaming enthusiasts set to take place in Austin, Texas, on September 17-18. This conference promises to be a hub for learning everything related to Apache Kafka and Apache Flink, featuring nearly 100 sessions, including keynotes, breakouts, and lightning talks. Attendees will have the opportunity to dive deep into topics ranging from the basics of message brokers to advanced real-time systems implementation, making it an unmissable event for anyone involved in data streaming. This post captures the excitement and anticipation building around Current 2024, highlighting the diverse sessions and keynotes that will explore the evolving landscape of data streaming technologies. With additional opportunities for networking, training, and engaging with the community, the event is poised to be a significant milestone for professionals looking to stay ahead in the fast-paced world of real-time data processing. If you're involved in the data streaming community, this is an event you will want to attend.

## WIND (What Is Niels Doing)

In last week's [roundup][6], I wrote that [**Lemi Masalu**][lemi] and I are going to present **Unlocking the Magic: An Intro to Generative AI and Large Language Models** at the **Seasson of AI** events in Cape Town and Johannesburg on the 24th and 31st of August, respectively:

![](/images/posts/unlock-magic-cpt.png)

**Figure 1:** *Season of AI - Cape Town*

The website for the events in Cape Town and Johannesburg is now live. The details are [**here**][5]. The events are free, so hurry up and register! 

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post or [ping][ma] me if you have suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

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
[rmoff]: https://www.linkedin.com/in/robinmoffatt/
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
[lemi]: https://www.linkedin.com/in/lemimasalu/
[michael]: https://www.linkedin.com/in/michaeladrianjohnson/

[1]: https://arxiv.org/pdf/2407.20183
[2]: https://howaibuildthis.substack.com/p/sql-generator-20-how-i-build-ai-query
[3]: https://towardsdatascience.com/multi-agent-as-a-service-a-senior-engineers-overview-fc759f5bbcfa
[4]: https://www.confluent.io/blog/current-2024-whats-on-tap-in-data-streaming/
[5]: https://cptmsdug.dev/
[6]: {{< relref "2024-08-11-interesting-stuff---week-32-2024.md" >}}
