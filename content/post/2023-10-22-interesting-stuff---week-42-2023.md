---
type: post
layout: "post"
title: Interesting Stuff - Week 42, 2023
author: nielsb
date: 2023-10-22T12:56:55+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-42-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-42-23.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Azure OpenAI Service
description: "This week we explore: LLM advancements - Prometheus to Table-GPT. Azure + GPT Models - Connect AI with your data. Bridging AI and Code - Kickstart projects with LLMs, but manual touch is vital!"
---

This week, Generative AI only: Uncover groundbreaking developments in Large Language Models (LLMs) like "Prometheus" and "Table-GPT," reshaping the AI landscape. Explore the power of Microsoft Azure in connecting GPT models with company data through a beginner's guide. 

Plus, learn how LLMs can jumpstart your projects and discover the critical role of manual adjustments for production-ready solutions. 

<!--more-->

## Generative AI

* [Top Important LLM Papers for the Week from 9/10 to 15/10][1]. This post provides a summary of important papers in the field of Large Language Models (LLMs) published during the second week of October. The papers cover various aspects of LLM research, including reasoning capabilities, text generation and summarization, progress and benchmarking, and fine-tuning. Notable papers include "Prometheus", an open-source LLM for evaluation tasks, "EIPE-text" for narrative text generation, and "Table-GPT" for table understanding. Additionally, there are papers on harmonizing natural language and code with "Lemur" and a zero-shot agent for computer control. Finally, one paper discusses joint language modelling for speech and text, and another introduces "LoftQ," a quantization framework for LLMs. These papers contribute to advancing LLMs in various domains. Very interesting!
* [Models with Company Data in Microsoft Azure][2]. The post linked to is a beginner tutorial on connecting GPT models with company data in Microsoft Azure using OpenAI Studio, Cognitive Search and Storage Accounts. The author explains how to upload internal documents to Azure Blob Storage and create a container for them, create an Azure Cognitive Search resource and an Azure OpenAI resource to index the documents and deploy a GPT model, use the Chat section in Azure OpenAI Studio to ask questions to the GPT model and get answers based on the indexed documents, and customize the system message, parameters, and web app deployment options for the GPT model. The post also provides screenshots and code snippets to illustrate the steps. We are looking at doing this at [Derivco](/derivco), so this is very interesting to me.
* [Mastering the Future: Evaluating LLM-Generated Data Architectures leveraging IaC technologies][3]. This blog-post discusses using Large Language Models (LLMs) in the application lifecycle, specifically in Infrastructure as Code (IaC). It explores LLMs' benefits in kickstarting projects but notes potential biases. The article covers three LLM tasks: provisioning AWS virtual machines, creating a FastAPI app for Elasticsearch, and generating Ansible scripts for Elasticsearch and Kibana. LLMs provide a structured foundation but require manual adjustments for production readiness. In conclusion, LLMs offer valuable support but necessitate expertise for refining the code.

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

[1]: https://pub.towardsai.net/top-important-llm-papers-for-the-week-from-9-10-to-15-10-5f995aa6043c
[2]: https://towardsdatascience.com/beginner-tutorial-connect-gpt-models-with-company-data-in-microsoft-azure-81177929da18
[3]: https://towardsdatascience.com/mastering-the-future-evaluating-llm-generated-data-architectures-leveraging-iac-technologies-dee75302a355
