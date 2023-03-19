---
type: post
layout: "post"
title: Interesting Stuff - Week 8, 2023
author: nielsb
date: 2023-02-26T14:43:28+02:00
comments: true
highlight: true
draft: false
image: /images/banner/posts/wrup-08-23.jpg
thumbnail: /images/thumbnails/posts/wrup-08-23.jpg
categories:
  - roundup
tags:
  - Azure Data Explorer
  - Kafka
  - Python
  - Derivco
  - OpenAI
  - SQL Server
  - MacOS
description: This week I cover Linux containers on Apple Silicon. There is also how to use Mastodon, Kafka and Open Search together. Let us not forget my post about leaderboards and Azure Data Explorer.
---

As opposed to last week with no Kafka related "stuff", this week there is a fair chunk. So, in this roundup you get a link to Linux containers on Apple Silicon. A deep dive into Microsoft LMOps, Mastodon, Kafka and OpenSearch.

I appear in this roundup with a link to the first post in a series about developing Leaderboards using Kafka and Azure Data Explorer. Oh, there is also something about running Kafka on Kubernetes.

<!--more-->

## Misc.

* [You can run a SQL Server Docker container on Apple M1 and M2 Silicon][2]. This link is thanks to a colleague (and mate) of mine [Yannick Dufour][2]. He is a "sh*t hot" SQL Server Developer and DBA. He went over to the "dark side" (Apple Mac) many, many years ago while MacOS was still Intel based. Since then, he has upgraded to the newer Macs with Apple Silicon. He has been despondent since the Apple Silicon upgrade as he needs to run SQL Server, and SQL Server containers have not been supported on Apple Silicon (no ARM-based SQL containers). As you may know, I also switched over to Mac [a while ago][3] and have had the same issues as Yannick. So back to the link that Yannick sent me - the linked post discusses how you can now run Linux based containers on Apple Silicon. Yay!   

## AI/ML

* [Microsoft Open Sources LMOps: A New Research Initiative to Enable Applications Development with Foundation Models, Part I][5]. Some [weeks ago][4], I wrote about Microsoft Open-Sourcing, their AI Prompt Optimization Toolkit LMOps. The post linked to is the first in a series drilling deeper into LMOps and looking at what it can do. Very interesting! 

## Streaming

* [Develop a Real-Time Leaderboard Using Kafka and Azure Data Explorer - Prelude][1]. This is a post from yours, truly. As the title implies, it is the first post in a series looking at developing an online gaming leaderboard using Kafka and **Azure Data Explorer**. This first post lays the foundation and introduces a Python application for generating and publishing events running in a Docker container. 
* [Exploring Mastodon data with Apache Kafka and OpenSearch][6]. This post describes how Mastodon can be integrated with Kafka and OpenSearch. Kafka can be used to process Mastodon's data streams, allowing for real-time processing and analysis. OpenSearch can be used to store and search Mastodon's data, making it easy to find and analyze information.
* [What Is Kafka On Kubernetes?][7]. This post explains how Kafka can be deployed on a Kubernetes cluster, which can provide benefits such as improved scalability, fault tolerance, and resource utilization. It provides a detailed walkthrough of deploying Kafka on a Kubernetes cluster using the Strimzi operator, an open-source Kubernetes operator for running Kafka on Kubernetes. The article also covers some critical benefits of using Kafka on Kubernetes, including the ability to scale up and down dynamically, automate the deployment and management of Kafka, and other "cool" Kubernetes features.

## WIND (What Is Niels Doing)

Let me first start with what I have been doing. At [Derivco](/derivco), we take in graduates every year. Part of the graduate programme is that the graduates meet with Derivco staff who talks to them about "life at Derivco":

* [Derivco Graduates][9]. In this link you see me and [Mike Mallet][8], who is one of our Execs, "imposing" :smile: our "wisdom" on the graduates.

So, onto what I am doing. You may have seen me publishing the [first post][1] in a series: **Develop a Real-Time Leaderboard Using Kafka and Azure Data Explorer**. So right now I am figuring out what to cover in the next post in the series.

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

[1]: {{< relref "2023-02-26-develop-a-real-time-leaderboard-using-kafka-and-azure-data-explorer---prelude.md" >}}
[2]: https://www.linkedin.com/in/yannickdufour/
[3]: {{< relref "2022-04-03-interesting-stuff---week-13-2022.md" >}} 
[4]: {{< relref "2023-02-12-interesting-stuff---week-6-2023.md" >}}
[5]: https://pub.towardsai.net/microsoft-open-sources-lmops-a-new-research-initiative-to-enable-applications-development-with-d6d7e7ca2059
[6]: https://aiven.io/blog/mastodon-kafka-opensearch
[7]: https://www.c-sharpcorner.com/article/what-is-kafka-on-kubernetes/
[8]: https://www.linkedin.com/in/michael-mallett-1b1b9970/
[9]: https://www.linkedin.com/posts/derivco_derivco-graduate-programme-2023-activity-7033424856700329984-_ET6
