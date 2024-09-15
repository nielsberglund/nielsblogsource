---
type: post
layout: "post"
title: Interesting Stuff - Week 37, 2024
author: nielsb
date: 2024-09-15T09:30:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-37-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-37-24.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - AI Agents
description: "This week’s blog explores the latest AI breakthroughs, including automated agent design, LLMs for tabular data, and OpenAI's o1 model excelling in reasoning and coding. Plus, we dive into llama-deploy, a new tool for deploying AI-driven systems with ease."
---

This week's roundup dives into exciting developments in AI, from automated agent design with ADAS to the use of large language models (LLMs) for handling tabular data and improving semantic search with knowledge graphs. 

We also explore llama-deploy, a new open-source tool for deploying agent workflows, and OpenAI's o1 model, which excels in complex reasoning and coding competitions. These advancements highlight AI's growing role in automation, problem-solving, and production workflows.

<!--more-->

# Generative AI

* [Automated Design of Agentic Systems][1]. In this paper, researchers from the University of British Columbia, Vector Institute, and Canada CIFAR AI Chair introduce a fascinating new area called Automated Design of Agentic Systems (ADAS). They argue that like other areas of machine learning, automated learning systems will eventually replace manually designed agentic systems. Their research demonstrates the viability of Meta Agent Search, an algorithm that iteratively designs new agents using code and continues to improve upon them based on previous iterations. Notably, these auto-designed agents outperform traditional, hand-designed agents across domains such as math, reading comprehension, and problem-solving tasks. This shift toward automation in agent design suggests significant implications for AI's role in complex, real-world problem-solving. I find what is covered in this paper intriguing as it shows that ADAS could reduce the human effort required in AI system design while enabling more sophisticated and generalizable agents. However, it raises broader questions about the control and safety of such auto-generated systems. Should we be cautious as we move toward this new frontier, given its potential to create highly powerful agents without direct human intervention? This could be a double-edged sword in AI's rapid evolution.
* [How to Implement Graph RAG Using Knowledge Graphs and Vector Databases][2]. The author of this post provides a comprehensive tutorial on implementing Graph RAG (Retrieval-Augmented Generation) using knowledge graphs (KGs) and vector databases in this post. He discusses how KGs can be leveraged for improved semantic search, similarity recommendations, and context-augmented prompts for LLMs. The tutorial covers three key approaches: vector-based retrieval, prompt-to-query retrieval, and a hybrid approach combining vectors and SPARQL. Hedden emphasizes that combining KGs with vector databases offers enhanced explainability and reduces context poisoning risks, as shown through a detailed use case involving medical research articles. This practical and detailed resource is an excellent guide for developers looking to implement retrieval-augmented systems using both KGs and vector databases.
* [Large Language Models (LLMs) on Tabular Data: Prediction, Generation, and Understanding - A Survey][3]. This paper thoroughly explores how large language models (LLMs) are applied to structured, tabular data—a common format across industries such as finance and healthcare. Initially, the post covers traditional and deep learning methods for handling tabular data before delving into LLM-specific approaches. It highlights how LLMs are used in natural language processing (NLP) and for data prediction, augmentation, and question-answering tasks. A noteworthy section discusses the challenges in modelling tabular data, including the necessity of data preprocessing, like feature encoding and context interconnection, which can impact model performance. Overall, this post underscores the potential of LLMs to transform how we approach structured data, inspiring a new way of thinking about data handling  and opening up exciting possibilities for the future of AI. The paper also compares deep learning methods and traditional models, such as tree-based ensemble approaches, for handling tabular data. While traditional models like XGBoost remain highly effective for classification tasks, LLMs are emerging as an exciting alternative due to their ability to handle a wider variety of tasks, from prediction to data synthesis. However, LLMs are sensitive to data formats, and the post discusses key techniques like serialization to ensure proper data handling. It's clear that deep learning models may soon provide new benchmarks for working with tabular data, particularly as LLM capabilities evolve.
* [Llama-Deploy: A Fully Open-Source Way to Deploy Your Agents as Production Microservices][4]. In this post, Tanya Malhotra introduces llama-deploy, an open-source tool designed to easily deploy agent workflows built with LlamaIndex. It replaces llama-agents, allowing developers to transition from development to production with minimal effort. With its microservice architecture, llama-deploy ensures scalability, fault tolerance, and flexibility, making it a strong solution for AI-driven agentic systems. Key features include asynchronous operations, message queuing, and a control plane for managing tasks. For developers looking to scale workflows quickly, llama-deploy integrates seamlessly with infrastructure tools like RabbitMQ and Kubernetes.
* [Learning to Reason with LLMs][5]. In this post, OpenAI introduces o1, a new large language model designed to excel at complex reasoning tasks. Trained with reinforcement learning, o1 can think before responding, producing a chain of thought that boosts its problem-solving capabilities. The model's performance on exams like AIME and GPQA demonstrates its ability to outperform both human experts and earlier models like GPT-4o in reasoning-heavy tasks, making it an impressive leap forward in AI development and a testament to the potential of AI to surpass human capabilities. This post highlights o1's strength in competitive coding, ranking in the 49th percentile at the 2024 International Olympiad in Informatics. By leveraging its chain of thought and reinforcement learning techniques, o1 showcased impressive performance in programming contests, significantly surpassing earlier models like GPT-4o. It performed in the top 7% of Codeforces competitors, underlining its proficiency in coding tasks—a promising step for AI in algorithmic problem-solving. What stands out to me is how o1's chain of thought can be hidden from users but still influence its output. While this decision could be controversial, the potential for monitoring and improving alignment with human values is intriguing. Balancing user experience with safety considerations will be critical as these models continue to evolve.

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
[lemi]: https://www.linkedin.com/in/lemimasalu/
[michael]: https://www.linkedin.com/in/michaeladrianjohnson/

[1]: https://arxiv.org/pdf/2408.08435
[2]: https://towardsdatascience.com/how-to-implement-graph-rag-using-knowledge-graphs-and-vector-databases-60bb69a22759
[3]: https://arxiv.org/pdf/2402.17944
[4]: https://www.marktechpost.com/2024/09/09/llama-deploy-a-fully-open-source-way-to-deploy-your-agents-as-production-microservices/
[5]: https://openai.com/index/learning-to-reason-with-llms/
