---
layout: post
title: Interesting Stuff - Week 2
author: nielsb
date: 2018-01-14T18:55:19+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - flink
  - microservices
description: Functional programming, Kafka, Flink, R in the cloud and some other cool things!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - flink
  - microservices   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, for the week just gone by. 

<!--more-->

## Programming

* [Functional Programming Languages and the Pursuit of Laziness with Dr. Simon Peyton Jones][1]. A transcript of a pod-cast with [Simon Peyton Jones][2], where the discussion is around functional programming and laziness :). Both the pod-cast as well as the transcript was very interesting (and entertaining).

## Streaming

* [How To Size Your Apache Flink® Cluster: A Back-of-the-Envelope Calculation][3]. Sizing an Apache Flink cluster can be a bit daunting. This post outlines a series of questions to ask to arrive at some numbers you can use as guidance.
* [Apache Mesos, Apache Kafka and Kafka Streams for Highly Scalable Microservices][4]. This blog post discusses how to build a highly scalable, mission-critical microservice infrastructure with Apache Kafka, its Streams API, and Apache Mesos respectively in their vendor-supported platforms from Confluent and Mesosphere. It's a must read!!

## Data Science

* [Mastering chess and shogi by self-play with a general reinforcement learning algorithm][5]. AlphaZero is an AI program from [DeepMind][6], which  masters Go, shogi and chess. In this blog-post [Adrian][adcol] from [the morning paper][mp] dissects a white-paper about AlphaZero. 
* [Services and tools for building intelligent R applications in the cloud][7]. A blog-post from [Revolution Analytics][re] about application areas and associated applications and Azure services that can be used to deploy high performance R enterprise applications

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com

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

[1]: https://www.microsoft.com/en-us/research/blog/functional-programming-languages-pursuit-laziness-dr-simon-peyton-jones/
[2]: https://en.wikipedia.org/wiki/Simon_Peyton_Jones
[3]: https://data-artisans.com/blog/how-to-size-your-apache-flink-cluster-general-guidelines
[4]: https://www.confluent.io/blog/apache-mesos-apache-kafka-kafka-streams-highly-scalable-microservices/
[5]: https://blog.acolyer.org/2018/01/10/mastering-chess-and-shogi-by-self-play-with-a-general-reinforcement-learning-algorithm/
[6]: https://en.wikipedia.org/wiki/DeepMind
[7]: http://blog.revolutionanalytics.com/2018/01/r-cloud-tools.html
