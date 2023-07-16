---
type: post
layout: "post"
title: Interesting Stuff - Week 28, 2023
author: nielsb
date: 2023-07-16T07:24:26+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-28-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-28-23.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - OpenAI
  - Python
  - Streaming
  - Kafka
  - Data Saturday Durban
description: "This week: become a detective in Kusto Detective Agency. Never write a README again, instead use GPT4Readability. Machine learning streaming with Kafka, Debezium, and BentoML. Stream processing performance report: Apache Flink and RisingWave. Data Saturday Durban 2023."
---

In this week's blog post, we dive into some exciting developments in the tech world. 

First, we explore the Kusto Detective Academy, a valuable resource for mastering the Kusto Query Language (KQL) in Azure Data Explorer. Then, we discover GPT4Readability, a new tool powered by advanced language models like GPT-3.5 and GPT-4, designed to simplify the process of writing documentation and README files. 

Additionally, we delve into the integration of Kafka, Debezium, and BentoML to build a machine-learning streaming pipeline and a preview of a stream processing performance report comparing Apache Flink with RisingWave. 

Lastly, we get a glimpse into the upcoming Data Saturday Durban event and the intriguing topics under consideration. If you want to expand your knowledge and meet industry experts, don't miss out on this exciting opportunity!

<!--more-->

## Azure Data Explorer

* [Kusto Detective Academy][1]. Last year I wrote about **Kusto Detective Academy** and how it was an excellent way to learn the **Kusto Query Language** (KQL) in **Azure Data Explorer**. Earlier this year, the academy opened for a second season. In this LinkedIn post, which I came across reposted by [Uri Barash][7], the author shares his positive experience with the Kusto Detective Academy. He highlights how the platform has enhanced his data analysis skills and how the hands-on courses and resources provided by the academy allowed him to expand his knowledge in utilizing Azure Data Explorer (ADX) and KQL. If you are working with ADX and KQL, I highly recommend you check out the Kusto Detective Academy!

## OpenAI

* [GPT4Readability — Never Write a README Again][3]. I really, really dislike writing README.md files, so you can imagine how happy I was seeing this blog post! The post discusses a new tool called **GPT4Readability**. This tool aims to simplify the process of writing documentation and README files by utilizing advanced language models like GPT-3.5 and GPT-4. It suggests that instead of spending time crafting detailed instructions or explanations, developers can provide high-level prompts to GPT4Readability, which will generate coherent and informative content. I have a couple of upcoming blog posts with code examples in Python, so I will definitely try out this tool to see if it can help me write the README.md files for those posts.

## Streaming

* [Machine Learning Streaming with Kafka, Debezium, and BentoML][4]. This post from last year (I am curious how I missed it back then) explores the integration of Kafka, Debezium, and BentoML to build a machine-learning streaming pipeline. It discusses the role of Kafka as a distributed streaming platform and Debezium as a change data capture tool for database streaming. The article then introduces BentoML, a framework for serving and deploying machine learning models. It demonstrates how it can be used in conjunction with Kafka and Debezium to create a real-time streaming pipeline for machine learning inference. Very interesting!
* [The Preview of Stream Processing Performance Report: Apache Flink and RisingWave Comparison][5]. This blog post previews a stream processing performance report comparing **Apache Flink** with the **RisingWave** stream processing engine. While the full report is not available at the time of the blog post, the author highlights some key points and findings. They discuss the importance of stream processing for real-time data analysis and highlight the specific features and capabilities of both Apache Flink and RisingWave. The post hints at a performance comparison between the two technologies, suggesting that the full report will provide detailed insights into their respective strengths and weaknesses in terms of throughput, latency, and scalability. Interesting read, but I can't help but wonder about the report's objectivity since it seems it originates from RisingWave.

## WIND (What Is Niels Doing)

As you know:

![](/images/posts/dsd-2023-1.jpg)

**Figure 1:** *Data Saturday Durban 2023*

Yes, Data Saturday Durban is just around the corner. Last Friday (July 14), the Call for Speakers closed. I am very excited about the quality of the submissions. We are right now in the process of reviewing the submissions and selecting the speakers and sessions for the event. I will keep you posted on the progress, but here is a little teaser about some of the topics under consideration:

* **Microsoft Fabric**
* **Azure Data Explorer**
* **Azure OpenAI**
* **Kafka**
* **Copilot & Data Curry**

If the above sounds interesting to you and you are in the Durban area on August 19, 2023, then please [**REGISTER**][6] for the event (we are quickly running out of seats). It is FREE, and you will get to meet industry experts across South Africa.

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

[1]: https://www.linkedin.com/feed/update/urn:li:activity:7085326539268993024/
[2]: https://detective.kusto.io/
[3]: https://pub.towardsai.net/gpt4readability-never-write-a-readme-again-4bb5f12e85b2
[4]: https://towardsdatascience.com/machine-learning-streaming-with-kafka-debezium-and-bentoml-c5f3996afe8f
[5]: https://www.risingwave.com/blog/the-preview-of-stream-processing-performance-report-apache-flink-and-risingwave-comparison/
[6]: https://datasaturdays.com/2023-08-19-datasaturday0043/
[7]: https://www.linkedin.com/in/uribarash/
