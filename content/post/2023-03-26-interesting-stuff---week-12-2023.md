---
type: post
layout: "post"
title: Interesting Stuff - Week 12, 2023
author: nielsb
date: 2023-03-26T09:34:31+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-12-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-12-23.jpg"
categories:
  - roundup
tags:
  - OpenAI
  - gpt-4
  - ChatGPT
  - Kafka
description: This week I link to posts about creating customised chatbots using GPT-4. It is also a link to an interesting post about developing a realtime ticketing booking system. 
---

Not so much to cover this week. What you find in this post is a couple of links to posts about building customised chatbots based on GPT-4. There is also an interesting link to how to use Kafka and FastAPI to develop a realtime ticketing booking solution.

<!--more-->

## AI/ML

* [Building Customized Chatbots for the Web Using GPT-4][1]. This post begins with an introduction to the basics of natural language processing and GPT-4, followed by an overview of chatbot development. The post then provides a step-by-step guide on how to build a chatbot using GPT-4, including data preparation, training the model, and deploying the chatbot.
* [KafkaGPT - Chat with Confluent's documentation to quickly get the right answers to your Kafka and Confluent Cloud questions.][2]. This post is similar to the one above. The post looks at creating a ChatGPT like application over the Kafka documentation. The app scans [docs.confluent.io][5], stores them in a vectorstore and uses LLM chaining (with LangChain OSS). This allows chatting with the docs. Very cool!

## Streaming

* [Building a realtime ticket booking solution with Kafka, FastAPI, and Ably][3]. This post shows you how to build a ticket booking solution that allows you to process and distribute large quantities of ticket data for live, virtual or hybrid conferences to and from many customers - with reliability and speed. All this using Kafka, FastAPI, and Ably. I found this post very interesting!

## WIND (What Is Niels Doing)

Last week I published the second [post][4] in the **Develop a Real-Time Leaderboard Using Kafka and Azure Data Explorer** series. I am now busy writing the next instalment in the series. 

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

[1]: https://pub.towardsai.net/building-customized-chatbots-for-the-web-using-gpt-4-815a1a63916
[2]: https://www.linkedin.com/pulse/kafkagpt-chat-confluents-documentation-quickly-get-right-folino/
[3]: https://ably.com/blog/realtime-ticket-booking-solution-kafka-fastapi-ably
[4]: {{< relref "2023-03-19-develop-a-real-time-leaderboard-using-kafka-and-azure-data-explorer---i.md" >}}
[5]: https://docs.confluent.io/home/overview.html
