---
type: post
layout: "post"
title: Interesting Stuff - Week 28, 2024
author: nielsb
date: 2024-07-14T12:28:44+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-28-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-28-24.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Data & AI Community Day Durban
  - Season of AI
  - Kafka
  - Streaming
  - DuckDB
description: "Discover the latest in Generative AI and Streaming tech, including graph construction with Neo4j and LangChain, synthetic data for LLMs, and in-memory analytics with DuckDB and Kafka. Plus, insights on building robust applications and notification systems, and updates on the upcoming Data & AI Community Day Durban!"
---

This week's tech roundup delves into the latest advancements in Generative AI and Streaming technologies. Explore seamless graph construction with Neo4j and LangChain, the revolutionary potential of synthetic data for LLM training, and the power of in-memory analytics with DuckDB and Kafka. 

Plus, get insights into building robust full-stack applications and scalable notification systems. Don't miss the exciting updates on the upcoming [**Data & AI Community Day Durban: Season of AI**][7] event!

<!--more-->

## Generative AI

* [Implementing 'From Local to Global' GraphRAG with Neo4j and LangChain: Constructing the Graph][1]. In this post, the author looks at the process of implementing GraphRAG using Neo4j and LangChain, focusing on constructing the graph. The tutorial provides a step-by-step guide to building a robust graph structure that transitions from local to global scope. It emphasizes the practical applications and benefits of using Neo4j for such tasks. What stands out and should reassure the readers is the seamless integration between Neo4j and LangChain, making the graph construction intuitive and efficient. The author's approach to breaking down the complex topic into digestible parts is commendable, making it accessible even for those new to graph databases.
* [Training LLMs with Synthetic Data][2]. This post explores the innovative approach of using synthetic data for training large language models (LLMs). The author explains the benefits of synthetic data, such as its ability to generate large, diverse datasets that can improve model performance while mitigating privacy concerns associated with real data. The detailed analysis of the trade-offs between synthetic and real data offers a nuanced perspective, highlighting the potential of synthetic data to revolutionize LLM training. The discussion on the future implications of this method is particularly thought-provoking, especially regarding accessibility and ethical AI development, and it's sure to excite the readers about the potential of this approach.

## Streaming

* [Delivering Millions of Notifications within Seconds During the Super Bowl][3]. In this [InfoQ][iq] presentation, the presenter discusses the architecture and implementation of an on-demand notification system, providing a comprehensive overview of its design principles. The presentation stresses the importance of scalability and reliability in notification systems, reassuring the audience about the robustness of their systems. It demonstrates how to achieve these through a combination of asynchronous processing and event-driven architecture. What I found particularly insightful is the focus on real-world use cases and the practical challenges faced during implementation. This post is a must-read for anyone looking to build or improve their notification infrastructure, offering valuable lessons and best practices.
* [Building a Full-Stack Application With Kafka and Node.js][4]. In this post, the author takes us through the process of building a full-stack application using Kafka and Node.js, offering a detailed walkthrough from setup to deployment. The integration of Kafka for real-time data streaming adds a layer of complexity and efficiency, making the application robust and scalable. The step-by-step guide is well-structured, providing clear instructions and code snippets that are easy to follow. This post not only demonstrates the technical prowess required to marry Kafka with Node.js but also underscores the practical benefits of using these technologies together. The author's hands-on approach and practical insights make this a valuable resource for developers looking to enhance their skill set with cutting-edge tools.
* [In-Memory Analytics for Kafka Using DuckDB][5]. The author, in this post, explores the integration of DuckDB with Kafka for performing in-memory analytics, showcasing a powerful combination for real-time data analysis. The discussion covers the advantages of using DuckDB’s in-memory processing capabilities to handle Kafka streams efficiently, highlighting significant performance improvements. The author provides a detailed walkthrough of setting up this integration, complete with code examples and performance benchmarks. What stands out is the practical application and potential impact of this integration on data-intensive applications. The insights into leveraging in-memory analytics for real-time data processing are particularly compelling, offering a glimpse into the future of data analytics. This post is a must-read for developers and data engineers looking to optimize their Kafka workflows and enhance their analytics capabilities.

## WIND (What Is Niels Doing)

When organizing events, you always try to get as many attendees as possible. Well, watch out for what you wish for; it may come true! We have had so much interest in the upcoming event [**Data & AI Community Day Durban: Season of AI**][7] this coming Saturday, so we have had to move to a bigger venue. This is an excellent problem, but it also means that we have to do a lot of extra work to ensure everything is in place. Especially ensuring people are aware of the change of venue.

We are hosted at [**Coastlands Umhlanga Hotel and Convention Centre**][6] in Umhlanga's affluent business district. The venue is easily accessible by car and has ample parking. It is equipped with state-of-the-art facilities, including a large auditorium, breakout rooms, and a spacious lobby area for networking.

![](/images/posts/coastlands-I.jpg)

**Figure 1:** *Coastlands Umhlanga Hotel and Convention Centre*

If you have registered for the event, please ensure you have the correct venue details. If you still need to register, please do so immediately. We have some great speakers lined up, and it promises to be a fantastic day of learning and networking!

* Date: 20th of July 2024
* Venue: Coastlands Umhlanga Hotel and Convention Centre (329 Umhlanga Rocks Dr, Umhlanga Ridge, Umhlanga) 
* Time: 08:30 - 18:00 (registration starts at 08:00)
* Registration link: https://aimldatadurban.org/events/2024/season-of-ai-1/#registration
* Agenda: https://aimldatadurban.org/events/2024/season-of-ai-1/#agenda 
* Price: Free 😀

So, if you are in Durban and are interested in Data & AI, please join us! 

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

[1]: https://medium.com/neo4j/implementing-from-local-to-global-graphrag-with-neo4j-and-langchain-constructing-the-graph-73924cc5bab4
[2]: https://pub.towardsai.net/training-llms-with-synthetic-data-649c34337f06
[3]: https://www.infoq.com/presentations/on-demand-notification-system/
[4]: https://www.confluent.io/blog/building-full-stack-app-with-kafka-and-nodejs/
[5]: https://yokota.blog/2024/07/11/in-memory-analytics-for-kafka-using-duckdb/
[6]: https://www.coastlands.co.za/umhlanga/
[7]: https://aimldatadurban.org/events/2024/season-of-ai-1/