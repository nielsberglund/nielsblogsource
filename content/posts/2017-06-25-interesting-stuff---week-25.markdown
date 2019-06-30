---
layout: post
title: Interesting Stuff - Week 25
author: nielsb
date: 2017-06-25T19:51:33+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - R
  - sqlrutils
  - SQL Server
  - SQL Server 2016 R Services
  - Power BI
  - DSVM
  - Apache Spark
description: This week we cover Azure Machine Learning, Apache Spark, SQL Server R Services, and other goodies.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - R
  - sqlrutils
  - SQL Server
  - SQL Server 2016 R Services
  - Power BI
  - DSVM
  - Apache Spark   
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

* [Creating R Stored Procedures in SQL Server 2016 Using sqlrutils][1]. A post from yours truly, how to create SQL Server wrapper procedures for `sp_execute_external_script` in R.

## Distributed Computing

* [Real-Time Notifications at Twitter][6]. An article discussing Twitter's real-time notification architecture.

## Data Science

* [Loading a Trained Model Dynamically in an Azure ML Web Service][2]. A post about a new Azure Machine Learning feature: the ability to load a trained model into an experiment at runtime. Let's say you have quite a few trained models, and you want to expose the models as web service calls. Previously you'd need to have one web endpoint for each model, whereas now you can at runtime decide what model to use.
* [Running BigDL Apache Spark Deep Learning Library on Microsoft Data Science Virtual Machine][3]. A post about how you now can run the Apache Spark distributed deep learning library BigDL on Microsoft Data Science Virtual Machines, running on Linux. As I wrote in a tweet: "Who'd 'thunk' some years ago, that MS would be on the forefront in Data Science and Open Source 'stuff'." Amazing!
* [Data Virtualization: Unlocking Data for AI and Machine Learning][4]. A post about how to handle big data efficient and easy by using data virtualization techniques.
* [Interactive R visuals in Power BI][5]. Some days ago we discussed at work, how to get interactive R visuals in Power BI. Couple of days later, this blog post by the guys at [Revolution Analytics][re], "popped" up, and told us what and how to do it. Cool!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: {{< relref "2017-06-25-creating-r-stored-procedures-in-sql-server-2016-using-sqlrutils.markdown" >}}
[2]: https://blogs.technet.microsoft.com/machinelearning/2017/06/19/loading-a-trained-model-dynamically-in-an-azure-ml-web-service/
[3]: https://blogs.technet.microsoft.com/machinelearning/2017/06/20/running-bigdl-apache-spark-deep-learning-library-on-microsoft-data-science-virtual-machine/
[4]: https://blogs.technet.microsoft.com/machinelearning/2017/06/21/data-virtualization-unlocking-data-for-ai-and-machine-learning/
[5]: http://blog.revolutionanalytics.com/2017/06/interactive-r-visuals-in-power-bi.html
[6]: https://www.infoq.com/news/2017/06/real-time-notifications-twitter
