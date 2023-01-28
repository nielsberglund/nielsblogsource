---
type: post
layout: "post"
title: Interesting Stuff - Week 4, 2023
author: nielsb
date: 2023-01-28T12:45:43+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-04-23.jpg"
categories:
  - roundup
tags:
  - databases
  - Azure Data Explorer
  - Kafka
  - Flink
  - machine learning
description: This roundup, which arrives one day earlier than usual, looks at cloud OLTP databases and whether we can get them to be really scalable. There is a link to a post looking at *Azure Data Explorer** together with Azure Serverless functions - very cool! An interesting post about ML in online gaming, plus a lot of other cool stuff.  
---

If you see this post today, you may wonder why I have published on a Saturday instead of, as usual, on a Sunday. Well, I am flying out to Barcelona a bit later today and will be on a plane for most of tomorrow.

This roundup looks at cloud OLTP databases and whether we can get them to be really scalable. There is a link to a post looking at *Azure Data Explorer** together with Azure Serverless functions - very cool! An interesting post about ML in online gaming, plus a lot of other cool stuff. 

<!--more-->

## Databases

* [Is Scalable OLTP in the Cloud a Solved Problem? (CIDR 2023)][1]. In this post, [Murat][2] dissects the [Is Scalable OLTP in the Cloud a Solved Problem?][3] whitepaper. The paper discusses the divide between the conventional wisdom of building scalable OLTP databases using a shared-nothing architecture and how they are built and deployed on the cloud using a shared storage architecture. The whitepaper also provides an overview of ScaleStore, a multi-writer shared-storage database.

## Azure Data Explorer

* [Building a React Google Maps Data Cache to Reduce Query Latency][4]. What's not to like about this post? It discusses two of my favorite technologies: Azure Data Explorer and Azure Serverless Functions! The post looks at using Azure Data Explorer and Azure Functions to build a data cache to minimize API calls.

## AI/ML

* [How Does League Of Legends Deploy Machine Learning Models Into The Game?][5]. As you know, I work for [Derivco](/derivco), and we are in the iGaming industry (online gaming). That's why this post is so interesting. It talks about how a game provider deploys ML models into their games. The models are then used to improve the players' experience in the game. Very interesting!
* [Improving the customer's experience via ML-driven payment routing][6]. When doing online payments, the payments go through payment gateways. A payment gateway acts as a bridge between a merchant's website and the financial institutions that process the payment. A merchant uses multiple gateways, and to provide an optimal experience to the customer, it is crucial to choose a gateway that gives the best approval rates. The merchant often uses a rule-based engine to select the bet gateway for a particular customer. This post discusses how LinkedIn has replaced its rule-based approach with an ML-driven engine to optimize for payment approval rates to create a better customer experience.

## Streaming

* [Flink SQL: Queries, Windows, and Time - Part 2][8]. In last [weeks roundup][7], I wrote about part 1 of the Flink SQL series around windows and time. This post, part 2, provides a more in-depth look at how to create a time window. Very interesting!
* [Horizontally scaling Kafka consumers with rendezvous hashing][9]. As the title implies, this post looks at how you can horizontally scale Kafka consumers by using a clever partitioning strategy. This allows for assigning fewer Kafka consumers to topics reducing infrastructure costs.

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

[1]: http://muratbuffalo.blogspot.com/2023/01/is-scalable-oltp-in-cloud-solved.html
[2]: http://muratbuffalo.blogspot.com/
[3]: https://www.cidrdb.org/cidr2023/papers/p50-ziegler.pdf
[4]: https://medium.com/@olafwrieden/building-a-react-google-maps-data-cache-to-reduce-query-latency-656a3e8beac3
[5]: https://seattledataguy.substack.com/p/how-does-league-of-legends-deploy
[6]: https://engineering.linkedin.com/blog/2023/improving-the-customer-s-experience-via-ml-driven-payment-routin
[7]: {{< relref "2023-01-22-interesting-stuff---week-3-2023.md" >}}
[8]: https://www.ververica.com/blog/flink-sql-queries-and-time-part-2
[9]: https://www.tinybird.co/blog-posts/kafka-horizontal-scaling
