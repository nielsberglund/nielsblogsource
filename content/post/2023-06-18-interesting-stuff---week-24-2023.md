---
type: post
layout: "post"
title: Interesting Stuff - Week 24, 2023
author: nielsb
date: 2023-06-18T14:45:04+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-24-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-24-23.jpg"
categories:
  - roundup
tags:
  - OpenAI
  - Generative AI
  - VSCode
  - DataSaturDayDurban
  - Kafka
  - AI/ML
description:  This week I share how generative AI can help with analytics, content creation, and natural language queries, and how to train a machine learning model on a Kafka stream. Furthermore, I look at how to debug Jupyter notebooks in VSCode.
---

This week, I came across debugging Jupyter notebooks in VSCode. I learned about some amazing applications of generative AI for analytics, content creation, and natural language queries. I also explored how to train a machine-learning model on a Kafka stream using Python libraries.

The [CfS][6] for **Data Saturday Durban 2023** is still open, and we have already received quite a few submissions. If you are interested in attending, I suggest you [book your seat][7] NOW, as there are a limited number of seats for this **FREE** event, and the event promises to be awesome!

If you are interested in these topics, read further, and you see the links to the articles and resources that inspired me.

<!--more-->

## Misc.

* [Debug your code and notebooks by using Visual Studio Code][1]. Earlier this year, Databricks released a VS Code extension for working with Databricks. This post announces that they have added new features to the extension: the ability to debug your code and notebooks and local Jupyter notebook development. The post also provides a step-by-step tutorial on how to install and use the extension. Very cool!

## OpenAI

* [OpenAI Just Introduced Function Callings Feature: Everything You Need to Know][2]. This blog post explains how OpenAI has added a new feature to its API that allows users to call functions within the text input. This feature enables users to perform tasks such as data analysis, text summarization, translation, and more using natural language commands. The post also provides examples of using function callings with different models and parameters.
* [Generative AI for Analytics: Performing: Natural Language Queries on Amazon RDS using SageMaker, LangChain, and LLMs][3]. The blog post linked demonstrates how to use LangChain's SQL Database Chain and SQL Database Agent with OpenAI's text-davinci-003 model to ask natural language questions of an Amazon RDS for a PostgreSQL database. The post also shows how to use LangChain's Prompt Template, Query Checker, few-shot prompting, and retrieval-augmented generation (RAG) to improve the accuracy and quality of the generated SQL queries and textual explanations. This is so awesome!

## Streaming

* [Training a Machine Learning Model on a Kafka Stream][4]. The blog post Training a Machine Learning Model on a Kafka Stream shows how to use Kafka and River Python libraries to train a machine learning model on streaming data. The post explains how to set up a Kafka producer and consumer, generate synthetic data using River, and train and evaluate a logistic regression model using River's online learning API. The post also shows how to use the model to make predictions on streaming data. This is an excellent example of using Kafka and River to train a machine-learning model on streaming data.

## WIND (What Is Niels Doing)

In the [roundup][5] from last week, I wrote about how Data Saturday Durban is happening on August 19 and how we were looking for Speakers. The Call for Speakers is still open, and we have already received quite a few submissions. If you have some cool data-related stuff you would like to present, please submit your session [here][6]. Having looked at the submissions earlier today, we have some really exciting sessions in the pipeline.

![](/images/posts/data-saturday-durbs-2023-1.jpg)

**Figure 1:** *Data Staurday Durban 2023* 

Without officially announcing the event (apart from the CfS), we already have 50+ registrations! As there are a limited number of seats for this **FREE** event, I suggest you [register][7] ASAP to take advantage of what looks to be **THE** Data Event of the Year in Durban. I will be posting more information about the event in the coming weeks.

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

[1]: https://www.databricks.com/blog/debug-your-code-and-notebooks-using-visual-studio-code
[2]: https://pub.towardsai.net/openai-just-introduced-function-callings-feature-everything-you-need-to-know-f42c42ac38df
[3]: https://garystafford.medium.com/generative-ai-for-analytics-performing-natural-language-queries-on-amazon-rds-using-amazon-f0e5c4132f6b
[4]: https://towardsdatascience.com/training-a-machine-learning-model-on-a-kafka-stream-a5079f543e98
[5]: {{< relref "2023-06-10-interesting-stuff---week-23-2023.md" >}}
[6]: https://sessionize.com/data-saturday-durban2023/
[7]: https://datasaturdays.com/2023-08-19-datasaturday0043/
