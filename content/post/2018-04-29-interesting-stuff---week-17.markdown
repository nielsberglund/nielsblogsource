---
layout: post
title: Interesting Stuff - Week 17
author: nielsb
date: 2018-04-29T19:17:32+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - kafka
  - Titus
  - Deep Learning
description: Titus - Netflix container management platform, copy objects across JVM clusters, Kafka book, Kafka Summit videos, deep learning and other cool stuff.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server Machine Learning Services
  - kafka
  - Titus
  - Deep Learning   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending.

<!--more-->

## Distributed Computing

* [More Environments Will Not Make Things Easier][1]. I found this blog-post - and [Tyler][tylert]'s excellent blog - by "accident" . In the post [Tyler][tylert] discusses microservices and the challenges we have in an enterprise with development environments. This is a topic close to my heart as we struggle with this at [Derivco](/derivco). Oh and BTW, when you read this post - do yourself a favour and browse the other posts on the [site][2], they are worth their weight in gold!
* [Titus, the Netflix container management platform, is now open source][3]. A blog post announcing Netflix open sourcing its container management platform: [Titus][4]. From the post: *Titus offers a convenient model for managing compute resources, allows developers to maintain just their application artifacts, and provides a consistent developer experience from a developer’s laptop to production by leveraging Netflix container-focused engineering tools.* Very interesting! 
* [Skyway: connecting managed heaps in distributed big data systems][5]. In this post [Adrian][adcol] dissects a white paper about how to create a cluster of JVMs, and efficiently copy objects across remote heaps in the cluster. 

## Streaming

* [Concepts and Patterns for Streaming Services with Apache Kafka][6]. Back in the [Interesting Stuff - Week 12][wr12_18] post, I linked to a presentation by [Ben Stopford][benstop] discussing microservices and streaming using Kafka. It turns out [Ben][benstop] has authored a book about how service-based architectures and stream processing tools such as Apache Kafka can help you build business-critical systems. The link is for a free download of that book. I can warmly recommend the book!
* [Kafka Summit London][11]. The Kafka summit in London just ended. This post is to a page where you find links to the keynote presentations. They are well worth watching! 

## Data Science

* [Transfer Learning for Text using Deep Learning Virtual Machine (DLVM)][7]. A blog post which compares multiple Machine Reading Comprehension models with each other. For the model creation as well as the comparison, the [Deep Learning Virtual Machine][8] was used.
* [MACHINE LEARNING YEARNING][9]. This link is to a sign-up page for a book which [Andrew NG][10], of deep learning fame, is in the process of writing.

## SQL Server Machine Learning Services

I am busy writing a post correcting some errors I did in the last post ([sp_execute_external_script - III][sext3]) in the [SQL Server R Services](/sql_server_2k16_r_services) series. I hope to publish it in a week or so.

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
[jesrod]: https://twitter.com/jrdothoughts
[tomaz]: https://twitter.com/tomaz_tsql
[dataart]: https://twitter.com/dataartisans
[luis]: https://twitter.com/luis_de_sousa
[benstop]: https://twitter.com/benstopford
[conflu]: https://twitter.com/confluentinc
[tylert]: https://twitter.com/tyler_treat
[andrewng]: https://twitter.com/AndrewYNg

[wr12_18]: {{< relref "2018-03-25-interesting-stuff---week-12.markdown" >}}
[sext3]: {{< relref "2018-03-21-microsoft-sql-server-r-services---sp-execute-external-script---iii.markdown" >}}

[series]: <> (/series/sql_server_2k16_r_services)

[1]: https://bravenewgeek.com/more-environments-will-not-make-things-easier/
[2]: https://bravenewgeek.com/
[3]: https://medium.com/netflix-techblog/titus-the-netflix-container-management-platform-is-now-open-source-f868c9fb5436
[4]: https://github.com/Netflix/titus
[5]: https://blog.acolyer.org/2018/04/26/skyway-connecting-managed-heaps-in-distributed-big-data-systems/
[6]: https://www.confluent.io/designing-event-driven-systems
[7]: https://blogs.technet.microsoft.com/machinelearning/2018/04/25/transfer-learning-for-text-using-deep-learning-virtual-machine-dlvm/
[8]: https://docs.microsoft.com/en-us/azure/machine-learning/data-science-virtual-machine/deep-learning-dsvm-overview
[9]: http://www.mlyearning.org/
[10]: https://en.wikipedia.org/wiki/Andrew_Ng
[11]: https://kafka-summit.org/events/kafka-summit-london-2018/
