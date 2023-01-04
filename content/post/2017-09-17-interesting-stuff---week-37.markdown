---
layout: post
title: Interesting Stuff - Week 37
author: nielsb
date: 2017-09-17T12:24:24+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - apache kafka
  - TensorFlow
  - SQL Server 2016
description: Apache Kafka, Tensorflow, Azure messaging, and other things is covered this week.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - apache kafka
  - TensorFlow
  - SQL Server 2016   
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

## Streaming

* [It’s Okay To Store Data In Apache Kafka][1]. An interesting post about using Kafka for data storage.

## Cloud

* [Events, Data Points, and Messages - Choosing the right Azure messaging service for your data][2]. For a while the messaging infrastructure of Microsoft Azure has consisted of the Azure Service Bus, and Azure EventHub. Recently Microsoft also introduced Azure EventGrid. In this post Clemens Vasters looks at what service to use when.
* [Azure Serverless end-to-end with Functions, Logic Apps, and Event Grid][3]. A [Channel 9][ch9] video, which gives a brief overview of each of the components of the Serverless story in Azure.

## Distributed Computing

* [Zero to Production-Ready in Minutes][4]. A presentation from [InfoQ][iq] about how Netflix is enabling engineers to go from "zero" to "production ready" in minutes.

## SQL Server

* [PowerShell connection to SQL Server: MARS enabled, pooling disabled][5]. [Lonny][6] posts about PowerShell, MARS and connection pooling. Cool stuff!!

## Data Science

* [Microsoft R Open 3.4.1 now available][7]. David at [Revolution Analytics][re] posts how Microsoft R Open have been upgraded to R version 3.4.1. Let's hope that Microsoft R Server will be upgraded soon too.
* [NEURAL NETWORKS DEMYSTIFIED 1: Classification Problems][8]. First post in a series attempting to make Neural Networks understandable for people who know nothing more than high school math (e.g. myself). I'll follow it with interest!
* [Simplifying The Use of Azure Data Science Virtual Machine with R][9]. This post talks about [AzureDSVM][10], an R package that makes it possible to directly manage an [Azure Data Science Virtual Machine][11] (DSVM).
* [How to write distributed TensorFlow code — with an example on TensorPort][12]. [TensorFlow][13] is an awesome framework for machine learning, but it is not straightforward to write TensorFlow code in a distributed fashion. This blog-post tries to describe/explain how to how to run distributed TensorFlow.
* [The Keys to Effective Data Science Projects – Explore the Data][14]. [Buck Woody][bw] continues his [The Keys to an Effective Data Science Project][15] series. This time he looks at how a data scientist should explore the data he works with. Some really useful tips and comments in there.

## SQL Server R Services

* [SQL Server R Services: The Basics][16]. I am happy to see that there are more people then me writing about SQL Server R Services. This is the first post in a series about SQL Server R Services, written by Robert Sheldon. Quite a lot of cool stuff in there.

Speaking of SQL Server R Services; I have now finished my speaking engagements (for now), and can start writing about SQL Server R Services again. By the end of September I should have **Internals - XI** ready to publish. In XI I cover the internal data transfer protocol **Binary eXchange Language** (**BXL**). If you are interested, **Internals - X** is [here][si10].

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ch9]: https://channel9.msdn.com
[bw]: https://buckwoody.wordpress.com/
[1]: https://www.confluent.io/blog/okay-store-data-apache-kafka/
[2]: https://azure.microsoft.com/en-us/blog/events-data-points-and-messages-choosing-the-right-azure-messaging-service-for-your-data/
[3]: https://channel9.msdn.com/Blogs/Azure/Azure-Serverless-end-to-end-with-Functions-Logic-Apps-and-Event-Grid/
[4]: https://www.infoq.com/presentations/netflix-deployment-practices
[5]: http://sql-sasquatch.blogspot.co.za/2017/09/powershell-connection-to-sql-server.html
[6]: http://sql-sasquatch.blogspot.com
[7]: http://blog.revolutionanalytics.com/2017/09/mro-341-now-available.html
[8]: https://medium.com/towards-data-science/this-series-is-an-attempt-to-make-neural-networks-understandable-for-people-who-know-nothing-more-df6695b6cd39
[9]: https://blogs.msdn.microsoft.com/rserver/2017/09/12/simplifying-the-use-of-azure-data-science-virtual-machine-with-r/
[10]: https://github.com/Azure/AzureDSVM
[11]: https://docs.microsoft.com/en-us/azure/machine-learning/machine-learning-data-science-provision-vm
[12]: https://medium.com/towards-data-science/how-to-write-distributed-tensorflow-code-with-an-example-on-tensorport-70bf3306adcb
[13]: https://www.tensorflow.org/
[14]: https://buckwoody.wordpress.com/2017/09/14/the-keys-to-effective-data-science-projects-explore-the-data/
[15]: https://buckwoody.wordpress.com/2017/04/14/the-team-data-science-process/
[16]: https://www.red-gate.com/simple-talk/sql/bi/sql-server-r-services-basics/
[si10]: {{< relref "2017-08-29-microsoft-sql-server-r-services---internals-x.markdown" >}}
