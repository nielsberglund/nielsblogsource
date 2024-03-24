---
type: post
layout: "post"
title: Interesting Stuff - Week 12, 2024
author: nielsb
date: 2024-03-24T08:47:07+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-12-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-12-24.jpg"
categories:
  - roundup
tags:
  - databases
  - generative ai
  - Kafka
  - streaming
  - OLTP
  - streamprocessing
  - Flink
description: "In this week's blog we explore the cutting-edge of tech: from the evolution of OLTP databases and AI-driven 'Self Learning GPTs' to Microsoft's AutoDev revolutionizing software development. Plus, get the highlights from Kafka Summit London 2024, where data streaming and Gen AI took center stage."
---

This week's exploration dives into the transformative realms of tech, from the evolution of OLTP databases to meet growing transactional demands to the innovative "Self-Learning GPTs" that adapt and grow through user feedback. 

We also delve into Microsoft's AutoDev, an AI-driven leap towards autonomous software development. We wrap up with highlights from Kafka Summit London 2024, where the fusion of data streaming platforms and Gen AI took the spotlight. 

<!--more-->

## Databases

* [Redesigning OLTP for a New Order of Magnitude][1]. In this [InfoQ][iq] presentation, the speaker delves into the rapidly evolving landscape of Online Transaction Processing (OLTP), highlighting the dramatic increase in transactional demands across various sectors, from energy to financial transactions. The speaker points out the inadequacy of popular OLTP databases like Postgres, MySQL, and SQLite, which, despite their robustness, were designed for a different era and scale. The presentation introduces TigerBeetle, a project aimed at reimagining OLTP databases to handle burgeoning transaction volumes efficiently, leveraging advancements in hardware and database design principles. The speaker's vision for TigerBeetle is not just about scaling up but doing so in a way that maintains, or even enhances, the safety and operational simplicity of transactional systems, a challenge that is both daunting and exhilarating for the future of database technology.

## Generative AI

* [Using Feedback to Improve Your Application: Self Learning GPTs][2]. The LangChain team has introduced an innovative demo app named "Self Learning GPTs," showcasing the potential of applications to evolve and enhance their performance over time through user feedback. This app leverages LangSmith to collect user feedback, which is then used to refine and improve the application's responses by incorporating this feedback into the prompt as a few-shot example. This approach demonstrates a practical method for enhancing application performance and underscores the significance of continuous learning and adaptation in the development of LLM systems. The concept is straightforward yet powerful, combining various LangSmith features to trace interactions, capture feedback, and utilize this data to tailor and improve future interactions. It is a compelling example of how feedback loops can drive the evolution of AI applications.
* [Microsoft Introduces AutoDev: A Fully Automated Artificial Intelligence-Driven Software Development Framework][3]. Hot on the heels of [Devin][4] follows AutoDev from Microsoft. AutoDev is an AI-driven framework designed to revolutionize how software engineering tasks are performed. AutoDev goes beyond traditional code assistance, enabling AI agents to autonomously handle a wide range of software engineering tasks, from complex code editing and extensive testing to advanced git operations. By operating within Docker containers, AutoDev streamlines development processes and prioritizes security and user privacy. This framework represents a significant leap towards a more autonomous, efficient, and secure approach to software development, empowering developers to focus on higher-level strategic tasks. At the same time, AI handles the intricacies of coding and testing. The evaluation of AutoDev using the HumanEval dataset has demonstrated its remarkable capabilities, achieving high success rates in code and test generation tasks and setting a new standard for AI-driven software engineering.

## Streaming

* [Confluent Cloud for Apache Flink Is Now Generally Available][5]. This blog post announces the official launch of Confluent's cloud-native Apache Flink service, making it generally available across all major cloud platforms. This service is designed to meet the increasing demand for scalable and efficient stream processing solutions in the cloud, offering a unified platform that combines Apache Kafka and Flink for real-time data processing. Confluent Cloud for Apache Flink is reimagined to allow users to focus on their business logic rather than operations, thanks to its serverless nature, which includes elastic autoscaling, an always-updated runtime, and usage-based billing. This launch marks a significant step forward in stream processing, providing developers with a powerful tool to handle complex tasks like filtering, joining, aggregating, and transforming data streams on the fly. With features like SQL support, user-defined functions (UDFs), and seamless integration with Kafka, Confluent's offering is poised to enhance the capabilities of businesses in real-time data processing and analytics.
* [Data Streaming Platforms, Gen AI, and Apache Flink® Reigned Supreme at Kafka Summit London][6]. Kafka Summit London 2024 was a vibrant gathering for the Apache Kafka community, drawing over 3,500 in-person and online attendees. The event celebrated significant milestones in Kafka's development, including the passage of the 1000th Kafka Improvement Proposal (KIP). Highlights from the summit included the announcement of the general availability of Confluent Cloud for Apache Flink, the unveiling of Tableflow for easier data lake and warehouse integration, and the revelation that Kora, the engine behind Confluent Cloud's Kafka service, is now 16x faster than open-source Kafka. Confluent's Stream Governance offering has been enhanced and is now enabled by default, with a 99.99% uptime SLA for Schema Registry. The summit also recognized Twinlabs.ai as the winner of Confluent's $1M Data Streaming Startup Challenge for their innovative AI-powered digital twin platform. The event featured a wide range of sessions, from lightning talks to in-depth workshops, covering topics like efficient Flink app development, querying streams, and the intricacies of large language models (LLMs). Kafka Summit London 2024 showcased the latest in data streaming and Gen AI, providing a platform for learning, networking, and community building among Kafka enthusiasts.

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

[1]: https://www.infoq.com/presentations/redesign-oltp/
[2]: https://blog.langchain.dev/self-learning-gpts/
[3]: https://www.marktechpost.com/2024/03/19/microsoft-introduces-autodev-a-fully-automated-artificial-intelligence-driven-software-development-framework/
[4]: https://easywithai.com/ai-developer-tools/devin/
[5]: https://www.confluent.io/blog/serverless-flink-confluent-cloud-generally-available/
[6]: https://www.confluent.io/blog/kafka-summit-london-2024-recap/
