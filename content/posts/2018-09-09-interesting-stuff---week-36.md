---
type: post
layout: "post"
title: Interesting Stuff - Week 36
author: nielsb
date: 2018-09-09T21:11:32+02:00
comments: true
highlight: true
draft: false
categories:
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - ksql
  - Azure
  - flink
description: Kafka, KSQL, more Kafka, data Artisans, Azure and Durable Functions, SQL Saturday, and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - ksql
  - Azure
  - flink
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

## .NET

* [Async Streams in C# 8][1]. An [InfoQ][iq] article about, as the title says, C# support for async streams. This, proposed, new functionality in C# is to combine the async/awaiting feature with a yielding operator. Very interesting!

## Distributed Computing
 
* [Microservices in a Post-Kubernetes Era][2]. Another article from [InfoQ][iq]. This article questions some of the original microservices ideas and acknowledges the fact that they are not standing as strong in the post-Kubernetes era as they were before. Well worth a read! 

## Azure

* [Introduction to Azure Durable Functions][3]. This post, from one of the .NET engineering teams is about Azure Durable Functions. Azure Durable functions is a new programming model based on Microsoft serverless’ platform Azure Functions. It allows you to write a workflow as code and have the execution run with the scalability and the reliability of serverless with high throughput.

## Data Science

* [DevOps for Data Science ][4]. A series of posts by [Buck Woody][buckw] where he discusses various aspects of DevOps in a Data Science world. This is a must read!
* [Putting the Power of Apache Kafka into the Hands of Data Scientists][5]. A blogpost which combines two of my favorite topics: Kafka and Data Science, how good is that?! The post discusses how they at [Stitch Fix][6] exposes a multitude of data sources to their Data Scientists, and allow the Data Scientists to create new topics etc., on the fly. This is a **MUST** read post!

## Streaming

* [I Heart Logs: Event Data, Stream Processing, and Data Integration][7]. Registration page for downloading [Jay Kreps][jayk] e-book "I Heart Logs". If you are interested in streaming in general, you **SHOULD** really get this book! 
* [Serializable ACID Transactions on Streaming Data][8]. Guys, (and girls), this is **BIG**. This blogpost introduces *data Artisans Streaming Ledger*, a new technology that brings serializable ACID transactions to applications built on a streaming architecture!
* [Data Wrangling with Apache Kafka and KSQL][9]. A post by [Robin Moffat][rmoff] about how we can use Kafka and KSQL to manipulate data.
* [Democratizing Stream Processing with Apache Kafka® and KSQL - Part 2][10]. Part 2 in a series of posts by [Robin Moffat][rmoff] about Kafka and KSQL. In this post Robin covers how Apache Kafka® and KSQL can be used to build powerful data integration and processing applications. You find Part 1 in the series [here][11].

## SQL Saturday

This weekend I did two talks at SQL Saturday in Cape Town:

![](/images/posts/sqlsat793_speaking_300x225.png)

* [Cape Town][sqlsatcpt], September 8:
    * [Azure Machine Learning][sqlsatcpt_ml].
    * [The Ins and Outs of sp_execute_external_script][sqlsatcpt_sp].

I also did a full day workshop on the Friday (September 7) before the event: **[A Drill Down Into SQL Server Machine Learning Services with Niels Berglund][sqlsatcpt_pre]**. I had 16 people attending, and I believe it went quite well!

Now there is only one SQL Saturday left, in Durban:

* [Durban][sqlsatdbn], September 15:
    * [The Ins and Outs of sp_execute_external_script][sqlsatdbn_sp].

Even if you are not interested in the topics I present, please register and come and listen to a lot of interesting talks by some of the industry's brightest people.

In Durban I also do a full day workshop on the Friday, (September 14), before the event: **[A Day of SQL Server Machine Learning Services with Niels Berglund][sqlsatdbn_pre]**.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

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
[jayk]: https://twitter.com/jaykreps

[1]: https://www.infoq.com/articles/Async-Streams
[2]: https://www.infoq.com/articles/microservices-post-kubernetes
[3]: https://blogs.msdn.microsoft.com/dotnet/2018/09/05/introduction-to-azure-durable-functions/
[4]: https://buckwoody.wordpress.com/category/devops/
[5]: https://www.confluent.io/blog/putting-power-apache-kafka-hands-data-scientists/
[6]: https://www.stitchfix.com/
[7]: https://www.confluent.io/ebook/i-heart-logs-event-data-stream-processing-and-data-integration/
[8]: https://data-artisans.com/blog/serializable-acid-transactions-on-streaming-data
[9]: https://www.confluent.io/blog/data-wrangling-apache-kafka-ksql
[10]: https://www.infoq.com/articles/democratizing-stream-processing-kafka-ksql-part2
[11]: https://www.infoq.com/articles/democratizing-stream-processing-apache-kafka-ksql

[sqlsatcpt]: http://www.sqlsaturday.com/793/EventHome.aspx
[sqlsatcpt_ml]: http://www.sqlsaturday.com/793/Sessions/Details.aspx?sid=84975
[sqlsatcpt_sp]: http://www.sqlsaturday.com/793/Sessions/Details.aspx?sid=84978
[sqlsatcpt_pre]: https://www.quicket.co.za/events/47683-sqlsaturday-cape-town-2018-precon-a-drill-down-into-sql-server-machine-learning/#/
[sqlsatdbn]: http://www.sqlsaturday.com/803/EventHome.aspx
[sqlsatdbn_sp]: http://www.sqlsaturday.com/803/Sessions/Details.aspx?sid=85097
[sqlsatdbn_pre]: https://www.quicket.co.za/events/55545-sqlsaturday-durban-precon-2018-a-day-of-sql-server-machine-learning-services/#/