---
type: post
layout: "post"
title: Interesting Stuff - Week 16, 2023
author: nielsb
date: 2023-04-23T09:46:22+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-16-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-16-23.jpg"
categories:
  - roundup
tags:
  - OpenAI
  - Databricks
  - Azure Data Explorer
description: "In this week's roundup, I cover some 'cool stuff': Azure Databricks Delta Engine, multi-platform Docker image for Kafka Connect and Kusto Sink. Generative AI for Synthetic Data creation. Using Databricks SQL together with LLMs."
---

A mixed bag this week: Azure Databricks and its Delta engine. In Azure Data Explorer "land" a combined Kusto Sink Connector and Kafka Connect image targeting multi-platform. Databricks has released MLflow 2.3 with new interesting features.

Speaking of Databricks; new functions in Databricks SQL allowing integration of large language models (LLMs) into SQL queries. Oh, and let's not forget using Generative AI to create Synthetic Data.

<!--more-->

## Big Data

* [Azure Databricks - Delta Engine and it's Optimizations][6]. In this post, the author discusses the Delta Engine, a feature in Azure Databricks that enables faster queries and data transformations on Delta Lake tables. The author explains how the Delta Engine works and its benefits, such as dramatically improving query performance compared to traditional Apache Spark queries. The article also discusses some best practices for using the Delta Engine, such as partitioning tables to improve query performance, caching and data skipping, and using the `z-order` clustering algorithm to further optimize data access. The article provides a helpful overview of the Delta Engine and its optimizations. It highlights how it can help data engineers and data scientists achieve faster query performance and more efficient data transformations on Delta Lake tables.


## Azure Data Explorer

* [Cross-Platform Compatibility Made Easy with Multi-Platform Docker Images: Azure Data Explorer Sink Connector & Kafka Connect][1]. Wow, that title is a "mouthful". The post is by "yours truly" and discusses how to create Docker multi-platform images. You may say: "Just build them with the correct `--platform` tag and push them to your Docker Hub image repo" - yup, that's what I also thought. I ran into that I wanted the images to have the same name and tag(s) regardless of platform. Something like, `nielsb/myimage:latest` built both for AMD64 and ARM64. I could easily build those two images using the `--platform` tag, but when I pushed them to my Docker Hub, they overwrote each other. Anyway, the post talks about how to handle that. I put the link in the **Azure Data Explorer** section because my test case was an image containing the Azure Data Explorer Kust Sink connector and Kafka Connect. That image is, by the way, publicly available [here][2]. I will maintain it and upload new versions whenever new Kafka Connect and/or Kusto Sink images are released.

## AI/ML

* [Introducing MLflow 2.3: Enhanced with Native LLM Support and New Features][3]. MLflow is an open-source platform that enables organizations to manage their end-to-end machine learning workflows, from data preparation to deployment and monitoring. Databricks recently announced the release of version 2.3 of MLflow. The new version offers several enhancements that improve the user experience and make working with low-level machine-learning frameworks easier. The new features include native low-level machine learning (LLM) support for TensorFlow, PyTorch, and other popular frameworks, allowing better integration with those tools. Overall, MLflow 2.3 is designed to help data scientists and machine learning engineers streamline their workflows and improve their productivity when working with complex machine learning projects.
* [Unlocking the Potential of Generative AI for Synthetic Data Generation][4]. In last week's [roundup][8], I had a link to a post about Synthetic Data; the same goes for this week. This post examines how you can use Generative AI to create realistic synthetic data for software development, analytics, and machine learning. The post looks at using tools like ChatGPT and GitHub CoPilot to create the data. The article provides an interesting perspective on the potential of Generative AI for synthetic data generation. It highlights some key considerations and challenges that data scientists should consider when using these algorithms.
* [Introducing AI Functions: Integrating Large Language Models with Databricks SQL][5]. This article discusses the release of AI Functions, a new feature in Databricks SQL that enables users to integrate large language models (LLMs) into their SQL queries. With AI Functions, data analysts and data scientists can use LLMs such as GPT-3 to generate text, perform sentiment analysis, and other natural language processing tasks directly within their SQL queries. The article highlights the potential of AI Functions for accelerating the adoption of machine learning and natural language processing in the enterprise. AI Functions can help democratize access to these powerful tools and enable more data-driven decision-making across organizations by making using LLMs within SQL queries easier.

## Streaming

* [Real-time Messaging][7]. All of us have probably heard of Slack, the cloud-based messaging and collaboration platform. The company has over 12 million daily active users sending and receiving millions of real-time messages 24/7. This blog post describes Slack's architecture to send real-time messages at scale. The post looks at the services that send chat messages and various events to these online users in real-time. Very interesting!

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



[1]: {{< relref "2023-04-17-cross-platform-compatibility-made-easy-with-multi-platform-docker-images-azure-data-explorer-sink-connector--kafka-connect.md" >}}
[2]: https://hub.docker.com/repository/docker/nielsb/kafkaconn-kustosink/general
[3]: https://www.databricks.com/blog/2023/04/18/introducing-mlflow-23-enhanced-native-llm-support-and-new-features.html
[4]: https://garystafford.medium.com/unlocking-the-potential-of-generative-ai-for-synthetic-data-generation-f42907cf0879
[5]: https://www.databricks.com/blog/2023/04/18/introducing-ai-functions-integrating-large-language-models-databricks-sql.html
[6]: https://www.linkedin.com/pulse/azure-databricks-delta-engine-its-optimizations-hitesh-hinduja/
[7]: https://slack.engineering/real-time-messaging/
[8]: {{< relref "2023-04-16-interesting-stuff---week-15-2023.md" >}}

