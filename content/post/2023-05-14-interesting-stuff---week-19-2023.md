---
type: post
layout: "post"
title: Interesting Stuff - Week 19, 2023
author: nielsb
date: 2023-05-14T11:34:50+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-19-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-19-23.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Kafka
  - Python
  - Vector DB
  - SQL Server
description: ADX as Vector DB & Similarity search. Polars for Rust. ChatGPT and Pandas = PandasAI. Real-time streaming ecosystem and other cool stuff.
---

Some very cool stuff this week. Polars for Rust! Azure Data Explorer as a Vector DB. ChatGPT and Pandas = PandasAI.;  and real-time streaming ecosystem.

LangChain, Streamlit, and Pinecone for LLM. Real-time sentiment analysis with Docker, Kafka, and Spark Streaming. And more!

<!--more-->

## Misc.

* [Rust Polars: Unlocking High-Performance Data Analysis — Part 1][1]. I have in previous roundups mentioned Polars, but in those cases, it has been Polars for Python. The article here is about Polars for Rust. The article compares Polars with Pandas and shows some of the benefits of Polars, such as no index, Apache Arrow arrays, parallel operations, and lazy evaluation. It also demonstrates how to install and use Polars for basic data manipulation. The article concludes by saying that Polars is a promising alternative to Pandas for data analysis.

## Azure Data Explorer

* [Azure Data Explorer for Vector Similarity Search][2]. The article shows how to use Azure Data Explorer (ADX) for vector similarity search, a technique for finding similar vectors in a dataset. It explains the concepts of vector database, vector similarity, vector embeddings, and vector similarity function (VSF). It also demonstrates how to use ADX to search various Wikipedia pages. I found this very interesting, and I will do some tests with this myself.    

## AI/ML

* [Deploying a Langchain Large Language Model (LLM) with Streamlit & Pinecone][3]. As the title implies, this post demonstrates how to deploy a large language model (LLM) application using Streamlit, Pinecone, and Langchain. It explains how to use Langchain to create a chain that connects an LLM model, a vector database, and a vector similarity function (VSF). It also shows how to use Streamlit to create a web interface for the application and how to use Pinecone as a vector database. Very cool!
* [PandasAI — Pandas Newborn child from ChatGPT][4]. The article shows how to use PandasAI, a new library that enables data manipulation by the use of conversational AI. It uses ChatGPT to understand natural language queries and execute them using Pandas. It also demonstrates how to use PandasAI for data exploration and machine learning on a sample dataset.

## Streaming

* [Real-Time Streaming Ecosystem - Part 2][5]. This post is the second in a multi-series exploring the real-time streaming ecosystem and its various components. The post covers connectors, change data capture (CDC), ELT, and rETL solutions and providers. Excellent article. I am looking forward to the next in the series!
* [Real-Time Sentiment Analysis with Docker, Kafka, and Spark Streaming][6]. This is a continuation of a previous article that compared different classification algorithms and feature extraction functions for tweet sentiment analysis with PySpark. This post is about performing real-time sentiment analysis on tweets using Docker, Kafka, and Spark Streaming. It explains how to set up a data pipeline that extracts tweets from the Twitter API, sends them to a Kafka producer, consumes them with a Spark Streaming application, and loads the results to MongoDB or Delta Lake. The article also provides a pre-trained PySpark model for tweet classification and shows how to use it in the Spark Streaming application. Very interesting!

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

[1]: https://towardsdatascience.com/rust-polars-unlocking-high-performance-data-analysis-part-1-ce42af370ece
[2]: https://techcommunity.microsoft.com/t5/azure-data-explorer-blog/azure-data-explorer-for-vector-similarity-search/ba-p/3819626
[3]: https://pub.towardsai.net/deploying-a-langchain-large-language-model-llm-with-streamlit-pinecone-190cd2577ae2
[4]: https://pub.towardsai.net/pandasai-pandas-new-born-child-from-chatgpt-1aa976214319
[5]: https://hubertdulay.substack.com/p/real-time-streaming-ecosystem-part-3d1
[6]: https://pub.towardsai.net/real-time-sentiment-analysis-with-docker-kafka-and-spark-streaming-952c06549de1
