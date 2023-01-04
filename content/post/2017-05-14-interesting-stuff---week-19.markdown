---
layout: post
title: Interesting Stuff - Week 19
author: nielsb
date: 2017-05-14T18:05:53+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - RTVS
  - Azure
  - Azure Cosmos DB 
description: Here we cover Azure Machine Learning, R Tools for Visual Studio, Azure Cosmos DB, and a lot of other interesting stuff.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - RTVS
  - Azure 
  - Azure Cosmos DB 
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

## Misc.

* [The Microgaming Idea Factory: Innovation in Practice within a Leading Online Gaming Software Company][1]. This is interesting as it originates for the company I work for (indirectly). In essence it is a way for employees to submit their ideas, and potentially see them come to fruition.

## Distributed Computing

* [Welcome to Azure Cosmos DB][2]. In the beginning there was Azure Document DB. It has now grown up and become Cosmos DB, a globally distributed, multi-model database.

## Cloud

* [Taking an Application-Oriented Approach to Cloud Adoption][3]. An [InfoQ][iq] article about what to do, and not to do, when migrating to the "cloud". Quite a few interesting points in there.

## SQL Server

* [One SQL Cheat Code For Amazingly Fast JSON Queries][4]. An awesome article how to index JSON data in SQL Server!!

## Data Science

* [Optimization tips and tricks on Azure SQL Server for Machine Learning Services][5]. A post about optimization tips and tricks with R Services on Azure SQL Server. Those optimization techniques however, do not only work for R Services, but for any Machine Learning Services integrated with SQL Server. 
* [Semi-supervised knowledge transfer for deep learning from private training data][6]. [Adrian Colyer][mp] dissects a white paper about how to keep private data private when training deep learning models.
* [Serving AI with data: A summary of Build 2017 data innovations][7]. Microsoft Build was this week, and inevitably there were a lot of blog-posts about it. This post summarizes what new innovations are coming from MS in the data / AI field.
* [5 minutes to #DeepLearning on #Azure #DataScience GPUs VM with #Docker #NvidiaDigits #Caffe][8]. [Rui Quintino][rui] posts about how to do Deep Learning on GPU's on Azure. Well worth reading! Oh, and BTW, [Rui][8] is now on my Feedly feed for useful blog posts in the data science field.
* [Using IoT Sensors to Up Your Game][9]. In the roundup for [week 17][w17], I mentioned how [Adrian Colyer][mp] had a [post][10] about how IoT devices can be of help to analyze things in sports analytics. This post is more about the same, how sports people can "up their game" by using sensors and data science.
* [From DeployR to R Server Operationalization][11]. Initially Microsoft R Server used Deploy R for operationalization of R models. Since Microsoft R Server 9.x this has been changed to "Microsoft R Server Operationalization". This post covers some of the differences.
* [A lap around R Tools 1.0 for Visual Studio 2017][12]. A colleague of mine from DevelopMentor,John Lam, covers R Studio Tools for Visual Studio 2017.

## SQL Server R Services

Just an update about where I am with my series about **SQL Server R Services**. I am busy working on **Internals - VI**. I hope I will be able to publish it early this coming week. In the meantime you can always go back and read the previous posts :):

1. [Microsoft SQL Server 2016 R Services Installation] [sinst]
1. [Microsoft SQL Server R Services - Internals I][si1]
1. [Microsoft SQL Server R Services - Internals II][si2]
1. [Microsoft SQL Server R Services - Internals III][si3]
1. [Microsoft SQL Server R Services - Internals IV][si4]
1. [Microsoft SQL Server R Services - Internals V][si5]

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[rui]: https://rquintino.wordpress.com
[w17]: {{< relref "2017-04-30-interesting-stuff---week-17.markdown" >}}
[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[si2]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
[si3]: {{< relref "2017-04-13-microsoft-sql-server-r-services---internals-iii.markdown" >}}
[si4]: {{< relref "2017-04-23-microsoft-sql-server-r-services---internals-iv.markdown" >}}
[si5]: {{< relref "2017-05-01-microsoft-sql-server-r-services---internals-v.markdown" >}}
[1]: https://www.infoq.com/articles/microgaming-idea-factory
[2]: https://docs.microsoft.com/en-us/azure/cosmos-db/introduction
[3]: https://www.infoq.com/articles/cloud-application-principles
[4]: https://blog.bertwagner.com/one-sql-cheat-code-for-amazingly-fast-json-queries-1c2402b4b0d2
[5]: https://azure.microsoft.com/en-us/blog/optimization-tips-and-tricks-on-azure-sql-server-for-machine-learning-services/
[6]: https://blog.acolyer.org/2017/05/09/semi-supervised-knowledge-transfer-for-deep-learning-from-private-training-data/
[7]: https://blogs.technet.microsoft.com/dataplatforminsider/2017/05/10/serving-ai-with-data-a-summary-of-build-2017-data-innovations/
[8]: https://rquintino.wordpress.com/2017/05/11/5-minutes-to-deeplearning-on-azure-datascience-gpus-vm-with-docker-nvidiadigits-caffe/
[9]: https://blogs.technet.microsoft.com/machinelearning/2017/05/11/using-iot-sensors-to-up-your-game/
[10]: https://blog.acolyer.org/2017/04/24/bringing-iot-to-sports-analytics/
[11]: https://blogs.msdn.microsoft.com/rserver/2017/05/11/1885/
[12]: https://channel9.msdn.com/Events/Build/2017/P4096
