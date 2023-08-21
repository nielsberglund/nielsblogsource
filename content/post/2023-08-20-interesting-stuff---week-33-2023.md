---
type: post
layout: "post"
title: Interesting Stuff - Week 33, 2023
author: nielsb
date: 2023-08-20T16:43:46+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-33-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-33-23.jpg"
categories:
  - roundup
tags:
  - generativeai
  - streaming
  - kafka
  - flink
description: "This week: AI/ML marvels and streaming sensations! Python Vector Databases, Real-Time ML, Apache Flink, Confluent Platform, and more. Relive the record-breaking Data Saturday Durban event!"
---

🚀 In this post: Unveil AI/ML marvels and streaming sensations! Python Vector Databases, Real-Time ML, Apache Flink, Confluent Platform, and more. 

Plus, relive the record-breaking Data Saturday Durban event! Join the innovation journey.

<!--more-->

## AI/ML

* [Python Vector Databases and Vector Indexes: Architecting LLM Apps][1]. This post provides an overview of vector databases and vector indexes in Python. It explains what they are, how they work, and their use cases and benefits. It also compares and contrasts vector databases and indexes, providing examples of Python libraries and tools that implement them. It concludes by highlighting the potential of vector search for developing AI-powered applications.
* [Real-Time Machine Learning: Architecture and Challenges][2]. In this [InfoQ][iq] presentation, the presenter discusses a topic very dear to me and a topic we try to solve at [Derivco](/derivco): Real-Time Machine Learning. The presenter discusses the value of fresh data, different types of architecture, and the challenges of online prediction. If you are into ML and real-time, you should watch this presentation!

## Streaming

* [Stream Processing Simplified: An Inside Look at Flink for Kafka Users][3]. The blog post introduces Apache Flink, a stream and batch processing framework that can work with Kafka. It explains the features and benefits of Flink, such as event-time processing, stateful computations, exactly-once guarantees, and flexible APIs. It also describes the architecture and components of Flink and how it integrates with Kafka to form a data streaming stack. It gives examples of Flink applications in various domains and links to resources and tutorials.
* [How Alex Bank built a real-time banking experience with Confluent][4]. This blog post from Confluent discusses how they helped a European bank to create a real-time banking experience using their platform. It explains how the Confluent Platform solved the challenges and opportunities of modernizing the banking industry with real-time data and event streaming. It describes the use cases and solutions the Confluent Platform provided for the bank, such as fraud detection, customer interactions, payments, and analytics. The post also shares some best practices and lessons learned from the bank's adoption of the Confluent Platform.

## WIND (What Is Niels Doing)

In last week's [roundup][6], I wrote I prepped for Data Saturday Durban. It took place yesterday (August 19) and was a resounding success! We had 100+ enthusiastic data professionals eager to sit in on the 14 presentations by 13 speakers. Having over 100 attendees for a free event on a Saturday in Durban, when there is a huge rugby game on the go (Boks vs Wales - go Boks), is a record!

![](/images/posts/auditorium-1.jpg)

**Figure 1:** *Attendees*

It is a validation that people are interested in hearing about what is happening in the industry, inspiring us to have more events and growing the community! If you are interested, please sign up for the local user group [Azure Transform User Group][5] - we will use that as a communication vehicle!

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

[1]: https://www.kdnuggets.com/2023/08/python-vector-databases-vector-indexes-architecting-llm-apps.html
[2]: https://www.infoq.com/presentations/ml-arch-challenges/
[3]: https://www.confluent.io/blog/apache-flink-for-stream-processing/
[4]: https://www.confluent.io/blog/real-time-banking-experience-built-with-confluent/
[5]: https://www.meetup.com/azure-transformation-labs/
[6]: {{< relref "2023-08-13-interesting-stuff---week-32-2023.md" >}}
