---
type: post
layout: "post"
title: Interesting Stuff - Week 35, 2023
author: nielsb
date: 2023-09-03T14:50:22+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-35-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-35-23.jpg"
categories:
  - roundup
tags:
  - distributed computing
  - generativeai
  - chatgpt
  - python
  - Kafka
  - Flink
description: "This week: From transforming banking with Dapr to building a Neo4j Knowledge Graph with Chat-GPT. Streaming updates from Hubert and cool stream-processing using Kafka & Flink. Stay updated on the latest in AI and streaming tech."
---

Embark on a tech-filled journey this week! 

Learn how FYNDNA transformed HDFC Bank using Dapr. Explore Generative AI with Chat-GPT. 

Stay ahead in streaming tech with Hubert Dulay, and dive into real-world Flink applications. 

<!--more-->

## Distributed Computing

* [HDFC Bank][1]. The post is about how FYNDNA, an Indian software startup, used Dapr, a cloud-native framework, to develop and deploy a system called Governor for HDFC Bank, one of India's largest private sector banks. The post describes banks' challenges in handling UPI transactions, the benefits of using Dapr for microservices development, and the results of deploying Governor in production. The post also provides a system architecture diagram and links to learn more about Dapr and cloud-native technologies. This post is very interesting for us at [Derivco](/derivco) as we are looking at Dapr as a possible solution for some very cool projects we are working on.

## Generative AI

* [How to Use Chat-GPT and Python to Build a Knowledge Graph in Neo4j Based on Your Own Articles][2]. The post linked is about using Chat-GPT and Python to build a knowledge graph in Neo4j based on articles you are interested in. The author explains the steps and the code involved in extracting entities and relationships from articles using Chat-GPT and then structuring them into a graph using Cypher query language. The author also shows how to explore the graph and find connections between different articles and topics. The post demonstrates the potential of using large language models and graph technology to organize and analyze unstructured data. Very interesting!

## Streaming

* [SUP Aug 28][]. This post is the latest edition of [Hubert Dulay's][hubert] newsletter about everything streaming and real-time stream processing. In this edition, [Hubert][hubert] looks at streaming databases, async for Postgres, an opinionated framework for scalable, reliable stream processing - Kawa, and much more. I enjoy [Hubert's][hubert] newsletters and highly recommend subscribing.

* [Flink in Practice: Stream Processing Use Cases for Kafka Users][4]. The post linked is part of a series that explores the features and use cases of Apache Flink. The post showcases how Flink can be used for event-driven applications, real-time analytics, and streaming data pipelines, with examples from various industries and domains. The post also highlights how Flink integrates with Kafka and other systems and provides links to resources for learning more about Flink and stream processing.

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

[1]: https://www.cncf.io/case-studies/hdfc-bank/
[2]: https://towardsdatascience.com/how-to-use-chat-gpt-and-python-to-build-a-knowledge-graph-in-neo4j-based-on-your-own-articles-c622bc4e2eaa
[3]: https://hubertdulay.substack.com/p/sup-aug-28
[4]: https://www.confluent.io/blog/apache-flink-stream-processing-use-cases-with-examples/
