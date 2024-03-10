---
type: post
layout: "post"
title: Interesting Stuff - Week 10, 2024
author: nielsb
date: 2024-03-10T13:54:27+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-10-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-10-24.jpg"
categories:
  - roundup
tags:
  - generative AI
  - streaming
  - kafka
  - databricks
description: "This week we explore groundbreaking advancements in Generative AI and Streaming, from revolutionizing sales with SalesGPT to Uber's scalable chat solutions. Plus, don't miss out on the upcoming Data and AI Community Day Durban, a must-attend for tech enthusiasts!"
---

This week's blog post delves into the fascinating world of Generative AI and Streaming, showcasing innovations like SalesGPT's transformative sales conversations, the future of coding with Multi-Agent LLM Frameworks, and the intricacies of real-time sentiment analysis in Yelp reviews. 

We also spotlight Uber's journey to scaling real-time chat for improved customer service. Plus, exciting news for the local tech community: the Data and AI Community Day Durban is on the horizon, promising a day filled with insightful sessions. 

<!--more-->

## Generative AI

* [SalesGPT: Elevating Sales Conversations with Langchain Intelligence][1]. In the dynamic realm of sales, integrating artificial intelligence with human expertise is becoming increasingly crucial. SalesGPT is introduced in the blog post and emerges as a groundbreaking AI-driven sales assistant, enhanced by Langchain's advanced decision-making capabilities, marking a significant advancement in sales automation. It boasts an exceptional ability to understand the nuances of sales conversations, acting as a Context-Aware AI Sales agent. This enables SalesGPT to engage in natural dialogues with prospects, mimicking the sophisticated behaviour of experienced sales professionals and dynamically adjusting to the conversation's stage to optimize sales development representatives' activities, particularly in outbound sales calls. I do not care that much about the sales part, but the way to work with agents is interesting.
* [Future of Coding — Multi-Agent LLM Framework using LangGraph][2]. The software development landscape is on the cusp of a significant transformation driven by integrating artificial intelligence, particularly by using Large Language Models (LLMs). The article explores the innovative concept of a Multi-Agent Coder framework utilizing LangGraph, which enhances the LangChain ecosystem by facilitating the development of sophisticated agent runtimes. These runtimes leverage LLMs for reasoning and decision-making within complex graph structures, enabling a more autonomous and efficient approach to software development tasks such as coding, testing, and debugging. The framework represents a leap towards reducing human intervention in software development, promising a future where coding is more about orchestrating intelligent agents than manually writing every line of code.
* [Improving LLM understanding of structured data and exploring advanced prompting methods][3]. Microsoft Research's recent paper, presented at the 17th ACM International Conference on Web Search and Data Mining (WSDM 2024), delves into the intriguing question of how well Large Language Models (LLMs) understand structured table data. The study introduces a new benchmark called Structural Understanding Capabilities (SUC) to evaluate LLMs' ability to interpret and work with tables. Through various experiments, the research highlights that while LLMs like GPT-3.5 and GPT-4 have a basic grasp of table structures, their performance varies significantly based on the input format, content order, and partition marks. Notably, HTML formats and few-shot learning methods consistently improved LLM performance. However, the overall accuracy in understanding table structures remains modest, indicating substantial room for improvement. This research underscores the potential of advanced prompting methods and the integration of structured data understanding in enhancing the capabilities of LLMs.
* [Databricks' Ultimate Guide to Game Data and AI][4]. Since [Derivco](/derivco) is in the iGaming industry, this blog post is really interesting: Databricks has released the 2nd Edition of its Ultimate Guide to Game Data and AI, just in time for the Game Developers Conference. This comprehensive guide is a treasure trove for gaming studios of all sizes, emphasizing the importance of a data-driven approach in game development and operations. With the gaming industry projected to generate $187.7 billion in revenue in 2024, the guide underscores the critical role of data in every aspect of video games, from development to launch and beyond. It introduces the concept of a Data Intelligence Platform as the foundation of analytics practice. It covers three essential areas for 2024: the responsible use of generative AI in game development, democratizing insights, and the importance of streaming data for player engagement. The guide also delves into various game data and AI use cases, including 360-game analytics, GenAI player segmentation, player lifetime value, and many more, providing valuable insights for enhancing player experience and engagement.
* [Easy Introduction to Real-Time RAG][5]. I had a hard time deciding if this blog post should be in the Generative AI section or the streaming section. Eventually, Generative AI won. [Hubert Dulay's][hubert] Substack post provides an accessible introduction to Real-Time Retrieval-Augmented Generation (RAG). This technique enhances the accuracy of responses from large language models (LLMs) by incorporating external data sources. The post outlines a workflow where an AI chatbot answers questions based on a set of documents, using a vector store to ensure accurate and up-to-date responses. The process involves using Python and LangChain to load website content into Kafka, converting text into embeddings, and then writing these embeddings to Kafka for real-time updates. The post explains how to use Apache Pinot for real-time data updates and how to construct prompts that combine user questions with relevant context extracted from documents to generate accurate responses from the LLM. This approach allows for dynamic and informed interactions with AI systems, leveraging the latest information available.

## Streaming

* [Sentiment Analysis of Yelp Restaurants Reviews in Real-Time][6]. The article on Towards AI provides a comprehensive guide on performing real-time sentiment analysis of Yelp restaurant reviews. The process begins with fetching reviews using the Yelp API, followed by data ingestion and processing through Apache NiFi, and then sending the processed data to Apache Kafka. Apache Spark is utilized to consume the Kafka data, where sentiment analysis is conducted using Python's NLTK library. The article outlines a data pipeline setup using Docker-compose. It provides a step-by-step walkthrough of ingesting reviews into Kafka with NiFi, including setting up HTTP requests to Yelp API and configuring Kafka topics. The sentiment analysis in Spark involves reading review data streams from Kafka, applying the NLTK VADER tool for sentiment analysis, and outputting the sentiment scores. The article highlights the potential for integrating sentiment analysis data with analytical tools like Grafana and Kibana for advanced visualization and monitoring, promising to explore this in a future article.
* [Building Scalable, Real-Time Chat to Improve Customer Experience][7]. Uber, a global business with a diverse customer base, including riders, drivers, eaters, couriers, and merchants, strives to provide support at a global scale through various live and non-live channels. To manage millions of weekly support interactions efficiently and within a predefined service level agreement (SLA), Uber has found the chat channel to be most cost-effective, allowing agents to handle multiple contacts concurrently while maintaining lower average costs and achieving high customer satisfaction (CSAT) scores. However, scaling the chat infrastructure to support a significant portion of the contact volume presented challenges such as reliability issues in message delivery, lack of insights into chat contact health, and limitations due to legacy architecture. To address these challenges and meet the growing business demands, Uber's engineering team embarked on scaling the chat channel, aiming to improve CSAT and first contact resolution (FCR) by migrating a large volume of contacts from in-app messaging and phone channels to chat. The team's efforts resulted in a scalable, real-time chat infrastructure that improved customer experience and agent efficiency, enabling Uber to handle millions of weekly support interactions with high reliability and low latency. The blog post provides a detailed overview of the challenges faced, the architecture of the new chat infrastructure, and the benefits realized from the migration.

## WIND (What Is Niels Doing)

Last year, we, the [**Azure, AI/ML & Data Community Durban**][8], organized some quite popular community events. At the last event in October 2023, we said we were thinking of having the next event in February this year. Well, it is mid-March now, and no event has happened or been planned (we are lazy). That is until now:

![](/images/posts/data-ai-dbn-april-24.png)

**Figure 1:** *Data and AI Community Day Durban*

YES! The next event is **Data and AI Community Day Durban** on the 27th of April. It will be an in-person event held at the [BETSoftware][9] offices in Umhlanga. It will be a full-day event, with a few sessions in the morning and a few sessions in the afternoon. 

We are working on the agenda, and the [Call for Speakers][10] opened earlier this morning. So, to all of you interested in speaking, veteran or newbie, submit your session(s) at https://sessionize.com/data-and-ai-community-day-dbn-april-24/.

The attendee registration will open soon, so keep an eye open for that!

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

[1]: https://ai.gopubby.com/salesgpt-elevating-sales-conversations-with-langchain-intelligence-a1e1be461ee4
[2]: https://medium.com/@anuragmishra_27746/future-of-coding-multi-agent-llm-framework-using-langgraph-092da9493663
[3]: https://www.microsoft.com/en-us/research/blog/improving-llm-understanding-of-structured-data-and-exploring-advanced-prompting-methods/
[4]: https://www.databricks.com/blog/databricks-ultimate-guide-game-data-and-ai
[5]: https://hubertdulay.substack.com/p/easy-introduction-to-real-time-rag
[6]: https://pub.towardsai.net/sentiment-analysis-of-yelp-restaurants-reviews-in-real-time-a62370894482
[7]: https://www.uber.com/en-AU/blog/building-scalable-real-time-chat/
[8]: https://www.meetup.com/azure-transformation-labs/
[9]: https://betsoftware.com/
[10]: https://sessionize.com/data-and-ai-community-day-dbn-april-24/
[11]:
[12]:
[13]:
[14]:
[15]:

<!-- [postref]: {{< relref "file_name_incl_ext" >}} -->

<!-- [series1]: [SQL Server R Services](/sql_server_2k16_r_services) -->
<!-- [series2]: [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) -->
<!-- [series3]: [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) -->


<!-- [findstr]: findstr /I <word_to_find> * -->
<!-- [findstr]: findstr /I /c:<"phrase to find"> * -->