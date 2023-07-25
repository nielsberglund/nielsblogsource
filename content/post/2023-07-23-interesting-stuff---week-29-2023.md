---
type: post
layout: "post"
title: Interesting Stuff - Week 29, 2023
author: nielsb
date: 2023-07-23T14:20:12+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-29-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-29-23.jpg"
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Azure OpenAI
  - AI/ML
  - Databricks
  - Kafka
  - Data Saturday Durban
description: "This week read all about: Building a self-serve analytics platform with Azure Data Explorer and OpenAI, estimating customer lifetime value with Lakehouse architecture, Databricks + MosaicML, the best of Kafka Summit London 2023, and real-time order notifications with Confluent. Plus, don't miss the impressive lineup of industry experts and sessions at Data Saturday Durban!"
---

📚 Explore the latest tech wonders and data-driven innovations in this week's blog post! 

From empowering analysts with Azure Data Explorer to estimating customer lifetime value through Lakehouse architecture, and the exciting Databricks-MosaicML collaboration democratizing generative AI. 

Delve into the best sessions of Kafka Summit London 2023 and discover how Confluent revolutionizes real-time order notifications for businesses. 

Plus, don't miss the impressive lineup of industry experts and sessions at Data Saturday Durban! Join us as we journey through the fascinating world of technology and data insights! 🌟 

<!--more-->

## Azure Data Explorer

* [Building a self-serve analytics platform with Azure Data Explorer and OpenAI][1]. This blog post discusses the journey of creating a self-serve analytics platform using Azure Data Services. The platform aims to empower data analysts and democratize data access within the organization. The way to empower and democratize is by letting customers ask questions about data in plain English. The article highlights the challenges faced during development, the architecture of the platform, and the various Azure services utilized, such as **Azure Data Explorer** (ADX) and Azure OpenAI.

## AI/ML

* [Estimating Customer Lifetime Value with Lakehouse Architecture][2]. The blog post in the link explores how to estimate customer lifetime value (CLV) using the Lakehouse architecture, which combines data warehousing and data lakes. The article uses Apache Spark-powered Delta Lake and Databricks to calculate CLV effectively. It explains the process step-by-step, including data preprocessing, creating customer cohorts, computing CLV, and visualizing the results. Using the Lakehouse architecture, businesses can gain valuable insights into their customer base, make data-driven decisions, and enhance overall customer experiences.
* [Databricks + MosaicML][3]. In this blog post, Databricks announces the acquisition of MosaicML, a prominent platform for creating and customizing generative AI models for enterprises. The aim is to democratize data and AI for businesses by offering high-quality generative AI applications through reduced costs and increased accessibility. The collaboration will focus on three key areas: democratizing model capabilities, making generative AI models suitable for enterprise use, and unifying the AI and data stack. MosaicML's product will remain available for purchase, and it will be closely integrated with Databricks' Lakehouse AI Platform to enhance customer data capabilities and generative AI ambitions.

## Streaming

* [The Best of Kafka Summit London 2023][4]. As the title implies, this blog post summarises the best sessions from Kafka Summit London 2023. The post lists the top 10 sessions based on audience ratings and briefly overviews each. The sessions cover various topics such as Kafka performance, Kafka Streams, Kafka Connect, cloud environments, migration patterns, etc. The post also includes links to the videos of each session for those who want to watch them in full. Of the talks listed, my favourite talk is at number 2: [**Versioned State Stores in Kafka Streams**][5].
* [Real-time Order Notifications: How ACERTUS Drives Customer Updates with Confluent][]. The blog post is about how ACERTUS, a logistics company specialising in vehicle transportation and storage, uses Confluent to provide real-time order notifications to its customers. The post explains how ACERTUS leverages Confluent Cloud and ksqlDB to create streaming data pipelines from any source, preprocess and transform data, and deliver real-time features such as push notifications for vehicle pick-up. The post also briefly overviews the architecture and the benefits of using Confluent for real-time integration use cases. Very cool!

## WIND (What Is Niels Doing)

In last week's roundup, I wrote about how the Call for Speakers for **Data Saturday Durban** had closed and how we were busy reviewing the submissions. You should be happy to know that we have completed the review process and selected the speakers and sessions for the event. We will publish the full schedule once we have confirmed all speakers.

To whet your appetite, here are a couple of the speakers and sessions we have selected:

* **Technology Masquerading as Architecture**: This talk by [Sean Cremer][8] - Software Architect at **Bet Software** - looks at the ever-growing problem of adding new technology to ecosystems to solve existing design failings. I am looking forward to this session, as Sean always has a refreshing way of looking at things!
* **Let's throw Copilot in Power Apps, Power Automate and SQL into a pot to make some Data curry**: In this talk, [Carike Botha][9] - Development Consultant - will build an expense tracker app using Copilot in Power Apps and then extract the data from the expense slips, send it through an approval process using Power Automate, and write the information to a SQL DB. This promises to be an awesome session!

So, if you are interested in attending the event and meeting industry experts from across South Africa, [**REGISTER**][10] for this **FREE** event.

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

[1]: https://techcommunity.microsoft.com/t5/startups-at-microsoft/building-a-self-serve-analytics-platform-with-azure-data/ba-p/3875484
[2]: https://www.databricks.com/blog/estimating-customer-lifetime-value-lakehouse
[3]: https://www.databricks.com/blog/databricks-mosaicml
[4]: https://www.confluent.io/blog/best-kafka-summit-london-sessions-of-2023/
[5]: https://www.confluent.io/events/kafka-summit-london-2023/versioned-state-stores-in-kafka-streams/
[6]: https://www.confluent.io/blog/acertus-real-time-order-notifications/
[7]: {{< relref "2023-07-16-interesting-stuff---week-28-2023.md" >}}
[8]: https://linkedin.com/in/sean-cremer-9ab49243/
[9]: https://www.linkedin.com/in/carike-botha-859a2a141/
[10]: https://datasaturdays.com/2023-08-19-datasaturday0043/
