---
layout: post
title: Interesting Stuff - Week 26
author: nielsb
date: 2017-07-02T19:23:56+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2017
  - Apache Flink
  - Graph Databases
description: We look at graph db in SQL Server 2017, Apache Flink, SQLCLR, Azure HDInsight, Spark and a lot of other cool stuff.
keywords: 
  - data science
  - distributed computing
  - SQL Server
  - SQL Server 2017
  - Apache Flink
  - Graph Databases   
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

## SQL Server

* [Graph Database with T-SQL][1]. [Tomaz][2] takes us through the new graph database functionality in SQL Server 2017. I so wanted to look into the graph capabilities of SQL Server 2017, but haven't had time, sigh!
* [Faster temp table and table variable by using memory optimization][3]. Oh, this is cool! The post talks about increasing performance for temp tables and table variables by using in-memory optimizations.
* [SQLCLR and Certificates][4]. A post by myself, discussing how to authorize SQLCLR assemblies for permissions other than `SAFE`. In this post I probably also offend some people by saying I don't think that `TRUSTWORTHY` is that bad.
* [SQL Server 2017, SQLCLR and Permissions][5]. Geez, I have been productive this week - a second post by me. While investigating the post above, I came across some changes in SQL Server 2017, regarding SQLCLR and permissions. This post is the result.

## Data Science

* [Using Azure Data Lake and R for Fraud Detection][6]. A post about peta-scale fraud detection using R and Azure Data Lake.
* [Saving Snow Leopards with Deep Learning and Computer Vision on Spark][7]. This is soooo cute! Using image analysis and Apache Spark to save Snow Leopards!!!
* [End to End Loan ChargeOff Prediction Built Using Azure HDInsight Spark Clusters and SQL Server 2016 R Service][8]. Monitoring loan charge-off using either R and Apache Spark, or SQL Server 2016 R Services.

## Streaming

* [Dynamically Configured Stream Processing: How BetterCloud Built an Alerting System with Apache Flink][9]. Building a real-time alerting system using Apache Flink.

## Misc.

* [#NoTDD][10]. A very thought provoking post regarding the advantages/disadvantages of TDD.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: https://tomaztsql.wordpress.com/2017/06/28/graph-database-with-t-sql/
[2]: https://tomaztsql.wordpress.com
[3]: https://docs.microsoft.com/en-us/sql/relational-databases/in-memory-oltp/faster-temp-table-and-table-variable-by-using-memory-optimization
[4]: {{< relref "2017-07-01-sqlclr--certificates.markdown" >}}
[5]: {{< relref "2017-07-02-sql-server-2017-sqlclr-and-permissions.markdown" >}}
[6]: https://blogs.technet.microsoft.com/machinelearning/2017/06/28/using-azure-data-lake-and-r-for-fraud-detection/
[7]: https://blogs.technet.microsoft.com/machinelearning/2017/06/27/saving-snow-leopards-with-deep-learning-and-computer-vision-on-spark/
[8]: https://blogs.msdn.microsoft.com/rserver/2017/06/29/end-to-end-loan-chargeoff-prediction-built-using-azure-hdinsight-spark-clusters-and-sql-server-2016-r-service/
[9]: https://data-artisans.com/blog/bettercloud-dynamic-alerting-apache-flink
[10]: https://blogs.msdn.microsoft.com/ericgu/2017/06/22/notdd/


