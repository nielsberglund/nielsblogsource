---
layout: post
title: Interesting Stuff - Week 12
author: nielsb
date: 2017-03-26T19:59:37+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - transaction systems
  - R
  - Spark
  - Flink
  - R Tools for Visual Studio
description: Weekly roundup of what interesting stuff I have read in blogs etc.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - transaction systems
  - R
  - Spark
  - Flink
  - R Tools for Visual Studio   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, this week. 

<!--more-->

## Transaction Systems

* [Omid reloaded: scalable and highly-available transaction processing][1]. [the morning paper][mp] looks at [Apache Omid][2], which is a transactional framework that allowing ACID transactions on top of MVCC key/value NoSQL data-stores.

## SQL Server

* [Context in perspective 5: Living next door TLS][3]. [Ewald][ew] continues his series about context in SQL Server.
* [SQL Server on Linux: Will it Perform or Not?][4]. In the [roundup for week 10][5], I pointed to Slava Oks slide deck from QCon in London about SQL Server on Linux. This is the video from the presentation. 

## Streaming

* [Implementing The Schema Registry][6]. Interesting article about how [Sky Betting & Gaming][7] use the Confluent Schema Registry to ensure that various teams always encode and decode messages using the same schema.
* [Queryable State in Apache Flink® 1.2.0: An Overview & Demo][8]. A very interesting post about [Apache Flink][9] now allows you to query application state from external applications.

## Data Science

* [Convolutional neural networks, Part 1][10]. [the morning paper][mp] dissects some white papers about Convolutional Neural Networks (CNN). 
* [Is it possible to use RevoScaleR package in Power BI?][11]. [Tomaz][12] shows how RevoScaleR can be used from inside Power BI, pretty cool!
* [Alteryx integrates with Microsoft R][13]. [Revolution Analytics][re] posts about how Alteryx now supports Microsoft R Server as well as SQL Server R Services. Alteryx is a workflow tool combining data preparation, data blending, and analytics – predictive, statistical and spatial. It looks very interesting!
* [Running your R code on Azure with mrsdeploy][14]. Another blog-post from [Revolution Analytics][re], this explains how to provision and run an Azure virtual machine (VM), using the mrsdeploy library that comes installed with Microsoft’s R Server. 
* [Retail Customer Churn Prediction: How-To Guide Now Available][15]. Predicting customer churn is almost the "holy grail" in machine learning. Microsoft has done a lot of research about churn prediction, and have now released their *Retail Customer Churn Prediction Solution How-to Guide*.
* [End-to-End Data Science Walkthrough with Spark 2.0 on Azure HDInsight Hadoop Clusters][16]. Microsoft has published a tutorial how to use *pySpark* and *MLlib* for data science on Spark 2.0 clusters.
* [Announcing R Tools 1.0 for Visual Studio 2015][17]. More about R Tools for Visual Studio.

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[1]: https://blog.acolyer.org/2017/03/17/omid-reloaded-scalable-and-highly-available-transaction-processing/
[2]: https://omid.incubator.apache.org/
[3]: http://sqlonice.com/context-in-perspective-5-living-next-door-tls/
[4]: https://www.infoq.com/presentations/sql-server-linux
[5]: {{< relref "2017-03-12-interesting-stuff---week-10.markdown" >}}
[6]: http://engineering.skybettingandgaming.com/2017/03/22/implementing-the-schema-registry/
[7]: http://engineering.skybettingandgaming.com/
[8]: https://data-artisans.com/queryable-state-use-case-demo/
[9]: https://flink.apache.org/
[10]: https://blog.acolyer.org/2017/03/20/convolutional-neural-networks-part-1/
[11]: https://tomaztsql.wordpress.com/2017/03/20/is-it-possible-to-use-revoscaler-package-in-power-bi/
[12]: https://tomaztsql.wordpress.com/
[13]: http://blog.revolutionanalytics.com/2017/03/alteryx-integrates-with-microsoft-r.html
[14]: http://blog.revolutionanalytics.com/2017/03/running-your-r-code-azure.html
[15]: https://blogs.technet.microsoft.com/machinelearning/2017/03/22/retail-customer-churn-prediction-free-how-to-guide-now-available/
[16]: https://blogs.technet.microsoft.com/machinelearning/2017/03/22/end-to-end-data-science-walkthrough-with-spark-2-0-on-azure-hdinsight-hadoop-clusters/
[17]: https://blogs.technet.microsoft.com/machinelearning/2017/03/23/announcing-r-tools-1-0-for-visual-studio-2015/
