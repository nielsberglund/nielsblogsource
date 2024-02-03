---
type: post
layout: "post"
title: Interesting Stuff - Week 05, 2024
author: nielsb
date: 2024-02-03T07:09:23+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-05-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-05-24.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - One Billion Row Challenge
  - AutoGen
  - Generative AI
  - Kafka
description: "In this this week's blog I explore Azure Data Explorer and how it fared in the One Billion Row Challenge, the innovative integration of AutoGen with OpenAI, and a groundbreaking GenAI demo that's transforming sales strategies. From vector databases to smart load balancing, discover the latest tech breakthroughs before I jet off to London for the iGaming ICE conference!"
---

This week's blog post takes you on a tech adventure, from tackling the [**One Billion Row Challenge**][2] using **Azure Data Explorer to explore the collaborative potential of AutoGen and OpenAI assistants. Dive into the simplicity and power of vector databases and discover a smart load-balancing solution for OpenAI endpoints. 

Plus, get a sneak peek into a GenAI demo revolutionizing sales processes with Kafka, Flink, LangChain, and OpenAI. Join me as I share these insights before heading to London for an exciting week of customer visits and the iGaming ICE conference.

<!--more-->

## Azure Data Explorer

* [One Billion Row Challenge & Azure Data Explorer][1]. You who read my blog, may have noticed that I like **Azure Data Explorer** (ADX). So, when [Gunnar Morling][1] announced his [**One Billion Row Challenge**][2], I decided to try it out using ADX. The blog post is about my experience with the challenge. I did face some unexpected hurdles, but I did manage to get through them. I also learned a lot about ADX. I hope you find the post interesting.

## Generative AI

* [AutoGen Meets GPTs][4]. AutoGen has taken a significant leap forward by integrating OpenAI assistants into its framework, enabling multiple GPTs to collaborate on complex tasks. The blog post here looks at this. The integration, facilitated through the `GPTAssistantAgent`, allows for creating custom ChatGPTs that can work together, expanding the possibilities of what AI can achieve. With example notebooks provided, users can explore basic setups, code interpretation, and function calls, showcasing the potential of combining multiple AI agents. This development enhances AutoGen's capabilities and opens up new avenues for AI applications, promising exciting advancements in multi-agent workflows and AI collaboration.
* [Easy Introduction to Vector Databases][5]. In this post, [Hubert Dulay][hubert] demystifies vector databases in a way that's accessible to all, highlighting their growing importance in the AI landscape. He explains vectors as arrays of numbers representing unstructured data, such as text or images, and discusses the limitations of traditional "bag of words" models. Dulay introduces more sophisticated techniques like word embeddings, which capture semantic information by considering the context of words and using neural networks to predict neighboring words. He then transitions to the practical application of these concepts, illustrating how vector databases efficiently store and retrieve these embeddings. By integrating the `pg_vector` extension into Postgres, Dulay showcases how vector databases can enhance capabilities, allowing for efficient similarity searches and retrieval of complex data types like images. This approach simplifies the process and opens up new possibilities for managing and querying vector data in databases.
* [Smart load balancing for OpenAI endpoints using containers][6]. This article introduces an intelligent load-balancing solution for OpenAI endpoints designed to optimize the use of Azure OpenAI services by efficiently managing service limits and ensuring application resilience. This solution, built on the high-performance YARP C# reverse-proxy framework, allows for seamless integration of multiple OpenAI or API backends into a single endpoint, prioritizing them based on availability and predefined priorities. Unlike traditional round-robin load balancers, this intelligent system is aware of OpenAI's specific throttling responses, such as the HTTP 429 error code and the "Retry-After" header, and intelligently reroutes traffic to other available backends without unnecessary delays. This approach enhances the user experience by avoiding service interruptions. It maximizes resource utilization by prioritizing certain endpoints, such as those with fixed pricing models or in specific geographic regions. The solution is containerized, making it easy to deploy and scale within Azure's ecosystem, and it's detailed on GitHub for further updates and community contributions.
* [GenAI Demo with Kafka, Flink, LangChain and OpenAI][7]. This blog post delves into an innovative architecture that leverages Generative AI (GenAI) to automate and enhance various industry processes. The demo presented showcases a synergistic blend of Python, LangChain with OpenAI's Large Language Models (LLM), Apache Kafka for event streaming and data integration, and Apache Flink for stream processing. The practical application of this setup is demonstrated through a use case involving Salesforce CRM, where the system correlates data from the CRM with public datasets like Google and LinkedIn. This integration aids sales representatives by recommending personalized ice-breaker conversations based on lead information, streamlining the sales process. The architecture highlights the potential of GenAI in transforming enterprise operations and emphasizes the importance of real-time data streaming and processing in realizing these advancements.

## WIND (What Is Niels Doing)

The eagle-eyed of you may have noticed how this post (weekly roundup) is published on a Saturday rather than as usual on a Sunday. The reason is that this evening, I am flying to London to visit customers and also to attend the iGaming [ICE][8] conference. I should be back home next Saturday.

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

[1]: https://nielsberglund.com/post/2024-01-28-one-billion-row-challenge--azure-data-explorer
[2]: https://www.linkedin.com/in/gunnar-morling-2b44b7229/
[3]: https://www.morling.dev/blog/one-billion-row-challenge/
[4]: https://microsoft.github.io/autogen/blog/2023/11/13/OAI-assistants
[5]: https://hubertdulay.substack.com/p/easy-introduction-to-vector-databases
[6]: https://techcommunity.microsoft.com/t5/fasttrack-for-azure/smart-load-balancing-for-openai-endpoints-using-containers/ba-p/4017550
[7]: https://www.kai-waehner.de/blog/2024/01/29/genai-demo-with-kafka-flink-langchain-and-openai/
[8]: https://www.icegaming.com/
