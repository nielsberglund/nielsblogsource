---
type: post
layout: "post"
title: Interesting Stuff - Week 15, 2024
author: nielsb
date: 2024-04-14T09:43:48+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-15-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-15-24.jpg"
categories:
  - roundup
tags:
  - databases
  - OLTP
  - Generative AI
  - ai-agents
description: "This week's tech insights: on Scalable databases in the cloud, Microsoft's new Redis alternative, and transformative AI developments in data engineering and autonomous agents. Dive into practical applications in finance and streaming technology, and don't miss our updates on the upcoming Data and AI Community Days."
---

Welcome to this week's tech roundup! Dive into the evolving world of databases with insights on scalable OLTP systems in the cloud and the debut of Microsoft's Garnet, a cutting-edge alternative to Redis. 

In AI advancements, explore how Databricks transforms data engineering with Large Language Models and how autonomous AI agents like those described by Andrew NG are reshaping our technology expectations. 

Plus, get the latest on practical applications in finance and streaming technologies, and join us for the upcoming Data and AI Community Days for a firsthand experience of innovation in action.

<!--more-->

## Databases

* [Scalable OLTP in the Cloud: What's the BIG DEAL?][1]. The blog post discusses the evolving demands on Online Transaction Processing (OLTP) systems in cloud environments, focusing on scalability and database architecture. It presents insights from [Pat Helland's][2] [paper][3], which argues that scalability in cloud OLTP systems hinges on the interaction between database management and application design. Notably, it emphasizes the "Snapshot Isolation" concept, which strikes a balance between offering isolation guarantees and maintaining scalability by not serializing all operations. The article also explores a new database architecture that avoids predetermined data locations, facilitating easier repartitioning and scalability. I think this thoughtful exploration into OLTP systems emphasizes the critical balance between application needs and database capabilities, which could be particularly useful for those in cloud services and database management. It also provides a good overview of the challenges and opportunities in cloud OLTP systems, making it a valuable read for those interested in database architecture and scalability.
* [Microsoft Announces Garnet: a New Open-Source Cache-Store and Redis Alternative][4]. Microsoft has unveiled Garnet, an open-source cache store positioned as a more efficient alternative to Redis, which aims to enhance the performance of applications and services by leveraging modern hardware capabilities. This new technology, compatible with existing Redis clients, utilizes the RESP wire protocol to offer improved scalability, throughput, and lower latency. Garnet stands out with its robust feature set, including support for raw string, analytical, and object operations, and it introduces a storage layer that optimizes thread scalability and memory management. For developers looking for an alternative to Redis, especially after Redis's recent license changes, Garnet provides a compelling option that promises significant performance improvements. This announcement is a significant development in the caching space, and it will be interesting to see how Garnet is adopted and how it compares to Redis in real-world scenarios.

## Generative AI

* [Building LLMs on Databricks][5]. Databricks is making significant strides in the AI and LLM space, as highlighted by this blog post. The author of this post explores the transformative integration of Large Language Models (LLMs) into Databricks, a platform rapidly becoming a powerhouse in AI and machine learning. He delves into how this integration revolutionises Data Engineering, requiring professionals to evolve their skill sets. The article also highlights Databricks' user-friendly tools that democratise the creation and experimentation with LLMs and introduces the concept of Retrieval-Augmented Generation (RAG), which significantly enhances the capabilities of LLMs by providing them with contextual understanding. It's a compelling read that underscores the importance of staying ahead in the ever-changing tech landscape, especially for Data Engineers at the forefront of this AI-driven shift.
* [Large Language Models for Code][6]. Loubna Ben Allal's [InfoQ][iq] presentation discussed the development and potential of Large Language Models (LLMs) designed explicitly for coding tasks. She explored the lifecycle of these models, from pre-training on vast codebases to finetuning and customisation for specific coding languages or frameworks. Ben Allal highlighted several open-source platforms and tools that facilitate the development of such models, emphasising the importance of accessibility and transparency in model training data and methods. The discussion also covered the challenges of data bias and privacy concerns in developing these LLMs. I believe democratising AI tools, especially in the coding realm, could significantly enhance developer productivity and creativity. By making powerful tools like LLMs accessible and transparent, we foster innovation and ensure that a broader community can contribute to and benefit from AI advancements. 
* [Autonomous Coding Agents][8]. In the latest edition of [Andrew NG's][7] newsletter, Andrew explores the agentic capabilities of AI. He delves into how large language models (LLMs) can autonomously plan and execute complex tasks by breaking them into manageable subtasks. For instance, an AI agent tasked with online research might methodically divide the project into researching, synthesising, and reporting phases. The post shares a personal "AI Agentic moment" during a live demo, where an AI unexpectedly switched tools to successfully complete a task despite a technical hiccup, showcasing the AI's ability to adapt and find solutions autonomously. This revelation underlines the potential for AI to autonomously navigate challenges and optimise task execution in ways that may surprise even their creators. This narrative is particularly fascinating because it showcases not just the theoretical capabilities of AI but their practical, real-world applications and the sometimes unexpected autonomy they can exhibit. As AI continues to evolve, the anticipation of AI's autonomous decision-making becoming more commonplace presents a thrilling technological frontier. This aligns with my observation that while AI's potential to exceed our expectations exists, it also highlights the importance of robust system design to handle unexpected scenarios, ensuring AI systems can adapt and respond effectively in varied circumstances.
* [Building an Agentic Stock Analysis Tool with Langchain, OpenBB, and Claude 3 Opus][9]. In this blog post, the author details how to build an advanced stock analysis tool using Langchain, OpenBB, and the Claude 3 Opus language model from Anthropic. The tool integrates these technologies to assist traders and investors by providing valuable insights and recommendations on stock investments. It outlines the architecture and components of the system, including the setup of an AgentExecutor and the implementation of custom tools for financial data analysis. The author emphasises the potential of AI to revolutionise financial analysis by delivering deeper insights and more precise recommendations. My thoughts: I believe what is shown here exemplifies the intersection of finance and technology. It showcases how AI can be tailored to deliver specific market insights. This kind of innovation augments investors' analytical capabilities and democratises high-level financial analysis, potentially levelling the playing field between individual investors and large institutions. Using open-source tools and AI reflects a trend towards more transparent and accessible financial technologies.
* [AI-in-a-Box][10]. This Azure GitHub repo is designed to fast-track the deployment of AI and ML solutions using pre-built models and architectures. It's a collection of solution accelerators, enabling rapid and efficient setup of AI/ML environments with minimal friction. The project provides various accelerators, such as operationalising machine learning, implementing edge AI, and automating document processing. These accelerators are tailored for robustness and cost efficiency, enhancing deployment speed and quality. My thoughts: The initiative by Azure to package essential AI components into accessible, reusable modules could significantly reduce the technical barriers often associated with deploying advanced AI solutions. This approach not only streamlines the implementation process but also promotes the adoption of AI technologies across different sectors, potentially transforming how businesses innovate and operate.

## Streaming

* [Schema Registry Clients in Action][11]. This blog post on Confluent's website delves into the workings of Schema Registry clients within Apache Kafka environments, focusing on the producer and consumer interactions. It explains how these clients handle data schemas during message serialisation and deserialisation processes, ensuring data integrity and compatibility across different applications. The article offers insights into maintaining and evolving schemas with tools that enforce data quality rules, highlighting the role of Schema Registry in managing and validating schemas to streamline data communication in Kafka systems. My thoughts: This technical breakdown illustrates the critical importance of robust data governance in stream processing platforms. By managing schemas effectively, businesses can ensure that their data streams are efficient and reliable, which is essential for real-time data operations and analytics.
* [Highlights of RisingWave v1.8: The Open-Source Streaming Database][12]. This post looks at the latest version of RisingWave: v1.8. It introduces several enhancements to its Postgres-compatible streaming database, focusing on real-time data processing efficiency. Key updates include improvements to Python and Rust User-Defined Functions (UDFs) and new connectors, enhancing flexibility in database management. A significant change is the decoupling of sinks to streamline state cleaning, although this requires careful upgrade planning to avoid compatibility issues. Additionally, the update simplifies embedding UDFs directly within the database, eliminating the need for external APIs but limiting the use of external libraries. My thoughts: This release emphasises expanding functionality and simplifying the user experience in managing complex data workflows. For example, the move towards embedded UDFs could significantly streamline data operations within RisingWave, reflecting a broader trend in database technology towards greater integration and self-containment.

## WIND (What Is Niels Doing)

As I wrote last week, the CfS for [**Data and AI Community Day Durban**][13] on April 27 has closed, and all speakers and sessions have been selected. The agenda for the event is [here][14]. The event is shaping up to be a great day of learning and networking.

![](/images/posts/speaker-banner.jpg)

**Figure 1:** *Generative AI and CoPilot Studio*

Also, as last week, I am prepping for the [**Data and AI Community Day Johannesburg**][15] event on April 20. I am kind of glad that I am prepping, as this morning, I realised that my trial license for CoPilot Studio has expired. I am now frantically trying to get a new license so that I can show off the tool at the event. Wish me luck!

Both the **Data and AI Community Day** events are free. To attend, you register for:

* Johannesburg: [**Register for Data and AI Community Day Johannesburg**][10]
* Durban: [**Register for Data and AI Community Day Durban**][11]

Please register and join us for a day of learning and networking!

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

[1]: https://muratbuffalo.blogspot.com/2024/01/scalable-oltp-in-cloud-whats-big-deal.html
[2]: https://substack.com/@pathelland
[3]: https://www.cidrdb.org/cidr2024/papers/p63-helland.pdf
[4]: https://www.infoq.com/news/2024/04/microsoft-garnet-cache-store/
[5]: https://seattledataguy.substack.com/p/building-llms-on-databricks
[6]: https://www.infoq.com/news/2024/04/llms-code-qcon/
[7]: https://www.deeplearning.ai/the-batch/
[8]: https://www.deeplearning.ai/the-batch/issue-244/
[9]: https://sethhobson.com/2024/03/building-an-agentic-stock-analysis-tool-with-langchain-openbb-and-claude-3-opus/
[10]: https://github.com/Azure/AI-in-a-Box
[11]: https://www.confluent.io/blog/how-schema-registry-clients-work/
[12]: https://medium.com/@RisingWave_Engineering/highlights-of-risingwave-v1-8-the-open-source-postgres-compatible-streaming-database-09895273ec7a
[13]: https://aimldatadurban.org/events/2024/data-ai-community-day-dbn-1/
[14]: https://aimldatadurban.org/events/2024/data-ai-community-day-dbn-1/#agenda
[15]: https://www.dataandaicommunity.co.za/events/JHB-202404.html
[16]: https://www.quicket.co.za/events/253233-data-and-ai-community-day-joburg-april-2024/#/
[17]: https://www.quicket.co.za/events/254487-data-and-ai-community-day-durban/#/
