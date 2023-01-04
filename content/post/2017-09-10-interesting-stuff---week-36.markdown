---
layout: post
title: Interesting Stuff - Week 36
author: nielsb
date: 2017-09-10T08:56:44+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - apache kafka
  - apache flink
  - kubernetes
  - Microsoft Cognitive Toolkit
description: Apache Flink vs. Apache Kafka, Microsoft Cognitive Toolkit and lots more in this weeks roundup.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - apache kafka
  - apache flink
  - kubernetes
  - Microsoft Cognitive Toolkit  
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

* [Streaming SQL in Apache Flink, KSQL, and Stream Processing for Everyone][1]. In last weeks [roundup][wr35] I mentioned how Apache Kafka now supports querying the data by using [SQL][2]. I wondered what impact this would have on Esper and Apache Flink. Sure enough, the post here is a reply from Apache Flink, where they point out all the shortcomings the Kafka SQL has compared to Flink, "meow"! Heh, wait a second while I go and get the cola and the pop-corn, then the fight can begin.
* [The Simplest Useful Kafka Connect Data Pipeline In The World … or thereabouts—Part 3][3]. The series how to build a data pipeline using Apache Kafka Connect API continues. 

## Distributed Computing

* [Moving Our Trading Engine to AWS][4]. A very interesting article how Sky Betting moved their sports-book trading engine to the cloud and started using serverless functions.

## Data Science

* ["The Leicester City fairytale?": Utilizing new soccer analytics tools to compare performance in the 15/16 and 16/17 EPL seasons][5]. Adrian from [the morning paper][mp] looks at a new data science analytics tool for soccer. As a side note, I so wish I had put down $100 in August 2015 on Leicester winning the 15/16 English Premiership. I would have walked away with ~$500,000!
* [How To Apply Data Science To Real Business Problems][6]. A really interesting article about data science and how it can be used in the "real world".
* [Free Microsoft Webinar on Interactive Price Analytics, Now Available on Azure][7]. Invitation to a webinar about interactive price analytics. So what's so earth shattering about that, I can do price analytics today using data science? Sure, but this is a much simpler solution, and that's what is being covered at the webinar.
* [How to Train & Serve Deep Learning Models at Scale, Using Cognitive Toolkit with Kubernetes on Azure][8]. This blog post is about how to use Kubernetes clusters for deep learning together with [Microsoft Cognitive Toolkit][9].

## Shameless Self Promotion

As I wrote in last weeks [roundup][wr35], we are in the conference season now. I want to thank everyone that came and listed to my ramblings in [Johannesburg][12], [Port Elizabeth][10], and [Cape Town][11]. Much appreciated!! After next weeks SQL Saturday in [Durban][13], I am done for a little while, and can hopefully get back to write blog-posts about SQL Server Machine Learning Services again.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[wr35]: {{< relref "2017-09-03-interesting-stuff---week-35.markdown" >}}
[1]: https://data-artisans.com/blog/flink-streaming-sql-ksql-stream-processing
[2]: https://www.confluent.io/blog/ksql-open-source-streaming-sql-for-apache-kafka/
[3]: https://www.confluent.io/blog/simplest-useful-kafka-connect-data-pipeline-world-thereabouts-part-3/
[4]: http://engineering.skybettingandgaming.com/2017/09/07/trading-on-aws/
[5]: https://blog.acolyer.org/2017/09/04/the-leicester-city-fairytale-utilizing-new-soccer-analytics-tools-to-compare-performance-in-the-1516-and-1617-epl-seasons/
[6]: https://medium.com/towards-data-science/examples-of-applied-data-science-in-healthcare-and-e-commerce-e3b4a77ed306
[7]: https://blogs.technet.microsoft.com/machinelearning/2017/09/06/free-microsoft-webinar-on-the-interactive-price-analytics-solution-now-available-in-azure/
[8]: https://blogs.technet.microsoft.com/machinelearning/2017/09/06/how-to-use-cognitive-toolkit-cntk-with-kubernetes-on-azure/
[9]: https://www.microsoft.com/en-us/cognitive-toolkit/
[10]: https://www.quicket.co.za/events/33252-sql-in-pe-06-september-2017/#/
[11]: http://www.sqlsaturday.com/637/eventhome.aspx
[12]: http://www.sqlsaturday.com/648/eventhome.aspx
[13]: http://www.sqlsaturday.com/659/eventhome.aspx
