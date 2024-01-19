---
type: post
layout: "post"
title: Interesting Stuff - Week 02, 2024
author: nielsb
date: 2024-01-14T07:13:48+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-02-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-02-24.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - streaming
  - Kafka
description: "Dive into this week's blog for exploration of advancements in Generative AI and Streaming Technologies. Discover how Ray Autoscaling's integration with Databricks revolutionizes AI workload scalability, and how Confluent Cloud's Kora engine is redefining streaming speeds, outperforming Apache Kafka."
---

This week's blog post is a journey through the latest advancements in Generative AI and Streaming Technologies. We explore the transformative integration of Ray Autoscaling with Databricks and Apache Spark, a game-changer in scaling AI and Python workloads efficiently. The post also delves into the innovative use of GPT-4's "Custom Instructions" for enhancing Python code creation, showcasing its potential in data visualization. 

In the streaming domain, we highlight Confluent's strides in trade settlements with the T+1 industry regulation, and the remarkable performance leap of Confluent Cloud's Kora engine, now 10x faster than Apache Kafka. 

<!--more-->

## Generative AI

* [Announcing Ray Autoscaling support on Databricks and Apache Spark][1]. This post announces the integration of Ray Autoscaling support with Apache Spark. Ray, an open-source unified compute framework, has successfully scaled AI and Python workloads in distributed environments. The new Ray version 2.8.0 brings autoscaling to Databricks, allowing dynamic adjustment of resources to meet fluctuating demands, optimizing performance and cost-efficiency. This integration simplifies the scaling process, eliminating the need for complex permissions and cloud initialization scripts. Users can now easily set up a Ray cluster on Databricks with autoscaling enabled, ensuring a balance between computational power and expenses without manual intervention. This feature, compatible with Databricks Runtime version 14.0 or above, significantly enhances scalability and cost-effectiveness in distributed computing environments. As we, [Derivco](/derivco), are a Databricks customer this is very interesting to me.
* [GPT-4 Custom Instructions To Optimize Python Code Creation][2]. In this recent article on Towards AI, a computer science professor shares their experience integrating GPT-4 into their data visualization workflow, specifically for creating Python Plotly dashboard code. They highlight two main challenges faced while using GPT-4: the AI's tendency to lose track of the conversation's context, especially in complex responses, and its habit of generating "placeholder" data when actual data or field names are unavailable. The author has adopted GPT-4's "Custom Instructions" tool to overcome these issues. This tool allows users to set system prompts that GPT-4 retains throughout a chat conversation, ensuring that it remains focused on the task and avoids generating fictitious data. This method significantly improves the efficiency and accuracy of GPT-4 in handling sequential tasks and complex data visualization requests.
* [Navigating the World of LLM Agents: A Beginner’s Guide][]. In this blog post, the author explores the concept of Large Language Models (LLMs) as agents capable of solving complex tasks independently. The article draws a parallel between human decision-making, which involves a continuous chain of observations, thoughts, and actions, and the way LLMs can be designed to mimic this process. By breaking down intricate problems into smaller, manageable segments and building upon the knowledge gained, LLMs can progressively approach solutions to more complex issues. This approach is likened to human progress, where incremental advancements have led to significant achievements like space exploration and automated factories. The author suggests that generative AI, particularly LLMs, could be a disruptive force in driving further progress, potentially leading to groundbreaking developments like building cities on Mars or achieving immortality. This is a very interesting read, and I have made this article a must-read for everyone in my team wanting to work with LLMs.

## Streaming

* [Tim and Viktor Together Again][4]. In this LinkedIn post, [Tim Berglund][5] (no, we are not related) announces that he and [Viktor Gamov][6] are joining forces again. Tim and Viktor worked together at Confluent and are now joining forces again at StarTree. That is awesome, but how it is announced is even more awesome! The post beats any assignment announcement in tech I've ever seen. I look forward to seeing what Tim and Viktor will do at StarTree.
* [T+1 and Beyond: Transforming Trade Settlement for Modern Markets With Confluent][7]. This blog post by Confluent delves into transforming trade settlements in the capital markets through data streaming, focusing on the T+1 industry regulation. This regulation aims to shorten the trade settlement cycle by one business day to reduce risk and improve operational efficiencies. The post highlights the challenges in the settlement process, such as integrating disparate applications and systems and maintaining data consistency across all involved applications. Confluent's data streaming platform is presented as a solution to these challenges, enabling financial institutions to create more effective settlement pipelines. The platform allows for collecting securities and counterparty information, storing it as an immutable log, and enabling multiple systems to consume this data concurrently. This approach not only meets the demands of the accelerated T+1 cycle but also prepares for a potential future of near real-time settlement. The post emphasizes the importance of modernizing data architecture to support the increasingly complex needs of the multi-step post-trade process, highlighting Confluent's role in facilitating this transformation.
* [Turbo-Charging Confluent Cloud To Be 10x Faster Than Apache Kafka][8]. The linked blog post presents a detailed comparison of latency between Apache Kafka and Confluent Cloud, highlighting the advancements made by Confluent Cloud's Kora engine. Announced at Current 2023, Confluent Cloud is now up to 10 times faster than Apache Kafka, a significant leap attributed to Kora. The post outlines how Confluent Cloud, powered by Kora, offers faster data delivery with more predictable latency across various workload profiles, maintains low latency even under cloud provider disruptions, and provides continuous performance optimizations. The benchmarks show that Confluent Cloud's Kora engine outperforms Apache Kafka by up to 16 times in terms of p99 end-to-end latencies across different workload profiles. This performance advantage is maintained even as throughput and partition scales, making Confluent Cloud's performance more predictable even at tail percentiles. In conclusion, the post emphasizes that engineering a data system for lower latency involves not just optimizing code and algorithms but also ensuring operational excellence in a production setting. This includes handling hardware failures, security patches, upgrades, and running monitoring and security software that competes for resources.

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

[1]: https://www.databricks.com/blog/announcing-ray-autoscaling-support-databricks-and-apache-sparktm
[2]: https://pub.towardsai.net/gpt-4-custom-instructions-to-optimize-python-code-creation-0a23019fbb8e
[3]: https://towardsdatascience.com/navigating-the-world-of-llm-agents-a-beginners-guide-3b8d499db7a9
[4]: https://www.linkedin.com/posts/tlberglund_viktor-gamov-joins-startree-epic-handshake-activity-7150162489127686144-A2Y1
[5]: https://www.linkedin.com/in/tlberglund/
[6]: https://www.linkedin.com/in/vikgamov/
[7]: https://www.confluent.io/blog/transforming-trade-settlements-with-data-streaming/
[8]: https://www.confluent.io/blog/kafka-vs-kora-latency-comparison/
