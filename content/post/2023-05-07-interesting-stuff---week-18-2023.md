---
type: post
layout: "post"
title: Interesting Stuff - Week 18, 2023
author: nielsb
date: 2023-05-07T12:56:57+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-18-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-18-23.jpg"
categories:
  - roundup
tags:
  - AI-ML
  - Kafka
  - Generative-AI
  - Confluent Platform
description: "This week: Generative AI, pluse some more Generative AI. Build ML segments using chatbots, ChatGPT and LangChain. Confluent Platform 7.4 is released, some interesting things in that release."
---

This week a lot of AI/ML in the roundup. Specifically Generative AI and AI self-play. Really "cool" stuff.

Of course, I have some Kafka coverage as well. This in the form of a post about Confluent Platform 7.4 and all the new "goodies" in that release.

<!--more-->

## AI/ML - OpenAI

* [AI self-play for algorithm design][1]. This blog post by Microsoft Research discusses how AI systems can improve their programming abilities using self-play. Researchers show that AI can create, solve, and train on its own puzzles using easy-to-check, hard-to-solve programming problems. The researchers detail their work in a new paper, [Language Models Can Teach Themselves to Program Better][2], which was accepted by the 2023 International Conference on Learning Representations (ICLR).
* [Chat With Your Data To Build ML-Driven Customer Segments Using a Chatbot Built With ChatGPT and LangChain][3]. The link is to a post about querying data using natural language, eliminating the need for SQL queries or coding skills. It explains how Natural Language Processing (NLP) and advanced AI technologies can allow users to interact with their data intuitively by asking questions in plain language.
* [Using generative AI to imitate human behavior][4]. This blog post discusses using diffusion models to mimic human behavior in interactive environments. The article explains how diffusion models can be used to generate diverse human behaviours and how they outperformed baselines in two aspects. The article also highlights the ability of diffusion to capture multimodal behaviour and how it can be leveraged to build agents that can behave in humanlike ways in interactive environments.
* [Inferring rewards through interaction][4]. This article discusses a new approach to solving the interaction-grounded learning (IGL) paradigm called IGL-P. IGL-P is the first IGL strategy for context-dependent feedback, the first use of inverse kinematics as an IGL objective, and the first IGL strategy for more than two latent states. This approach provides a scalable alternative to current personalized agent learning methods, which can require expensive high-dimensional parameter tuning, handcrafted rewards, and/or extensive and costly user studies. The success of IGL-P is demonstrated with experiments using simulations, as well as with real-world production traces.

## Streaming

* [Introducing Confluent Platform 7.4][6]. The blog post linked announces the release of Confluent Platform 7.4. This release enhances scalability and simplifies architecture with production-ready KRaft support for new clusters. It also provides a self-service control plane for developers with Confluent for Kubernetes Blueprints and ensures trusted, high-quality data streams by leveraging Data Quality Rules for Schema Registry. The blog post explores each of these enhancements in detail, taking a deeper dive into the major feature updates and benefits.

## WIND (What Is Niels Doing)

I am working on the fourth post in the **Develop a Real-Time Leaderboard Using Kafka and Azure Data Explorer** series. The post will cover how to query the data in **Azure Data Explorer** using Kusto Query Language (KQL), to satisfy the requirements for the leaderboard.

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

[1]: https://www.microsoft.com/en-us/research/blog/ai-self-play-for-algorithm-design/
[2]: https://arxiv.org/pdf/2207.14502.pdf
[3]: https://pub.towardsai.net/chat-with-your-data-to-build-ml-driven-customer-segments-using-a-chatbot-built-with-chatgpt-and-e43259d592fe
[4]: https://www.microsoft.com/en-us/research/blog/using-enerative-ai-to-imitate-human-behavior/
[5]: https://www.microsoft.com/en-us/research/blog/inferring-rewards-through-interaction/
[6]: https://www.confluent.io/blog/introducing-confluent-platform-7-4/
