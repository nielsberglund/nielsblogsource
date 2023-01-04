---
layout: post
title: Interesting Stuff - Week 31
author: nielsb
date: 2017-08-06T19:36:25+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - .NET
  - SQL Server 2017
  - TensorFlow
  - MVP
description: Covering SQL Server 2017 Machine Learning, introduction to TensorFlow, H2O on Azure, and a lot of other interesting stuff.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - .NET
  - SQL Server 2017
  - TensorFlow
  - MVP   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, for the week just gone by. 

<!--more-->

## SQL Server

* [In the footsteps of a cooperative wait][1]. [Ewald][ew] is continuing on his journey of threads and tasks. This week it is about context switching and the cooperative wait.

## .NET

* [A look at the internals of 'boxing' in the CLR][2]. [Matthew Warren][mw] drills down into the mysteries of "boxing" in .NET. If you are a .NET developer then Matthew's blog is a must read!

## Distributed Computing

* [Serverless Design Patterns with AWS Lambda: Big Data with Little Effort][3]. An [InfoQ][iq] presentation by Tim Wagner about how to do Big Data on a server-less architecture.
* [Managing Data in Microservices][4]. Another [InfoQ][iq] presentation. This is about how to handle data in microservices. I found this presentation extremely informative.

## Programming

* [The 2017 Top Programming Languages][5]. [IEEE Spectrum's][6] annual roundup of programming languages. Interesting to see how Python is now at first place.

## Data Science

* [Data Science Simplified Part 4: Simple Linear Regression Models][7]. Part 4 of a series trying to simplify data science. This "episode" tackles linear regression. 
* [How to use H2O with R on HDInsight][8]. [H2O][9] is a leading open source deep learning platform. In this blog-post, David from [Revolution Analytics][re] points to an article how use H2O together with Azure HDInsight. Cool stuff!!
* [Data Curious 31.07.2017: A roundup of data stories, datasets and visualizations from last week][10]. So, I am not the only one doing roundups. This is a roundup concentrating on data by [Benjamin Cooley][11]. Seeing his roundups, I am thinking of packing up and go home. They are absolutely awesome!
* [A Gentle Introduction To Neural Networks Series — Part 1][12]. The start of a series covering introduction to Neural Networks.
* [Intro To Tensorflow][13]. Another introduction. This time introduction to TensorFlow.
* [Machine Learning Services in SQL Server 2017][14]. A blog-post about some of the highlights related to machine learning in the latest release (RC2) of SQL Server 2017.

## SQL Server R Services

I am still working on episode *Internals - IX* in the **SQL Server 2016 R Services** series. I hope to have it out at the end of next week, or - worst case scenario - following week. If you are interested in the previous "episodes" they can be found [here][si1].

## Shameless Self Promotion

In the beginning of last week I received an email "out of the blue", congratulating me to have been awarded **MVP** for *Microsoft Data Platform*. So it seems that writing blog-posts, answering forum questions and speaking at the "odd" conference now and then has its perks. I am chuffed!!

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mw]: http://mattwarren.org
[1]: http://sqlonice.com/footsteps-of-cooperative-wait/
[2]: http://mattwarren.org/2017/08/02/A-look-at-the-internals-of-boxing-in-the-CLR/
[3]: https://www.infoq.com/presentations/big-data-serverless-aws-lambda
[4]: https://www.infoq.com/presentations/microservices-data-centric
[5]: http://spectrum.ieee.org/computing/software/the-2017-top-programming-languages
[6]: http://spectrum.ieee.org
[7]: https://medium.com/towards-data-science/data-science-simplified-simple-linear-regression-models-3a97811a6a3d
[8]: http://blog.revolutionanalytics.com/2017/07/h2o-hdinsight.html
[9]: https://www.h2o.ai/
[10]: https://medium.com/towards-data-science/data-curious-31-07-2017-a-roundup-of-data-stories-datasets-and-visualizations-from-last-week-da8b8cf5ea9b
[11]: https://medium.com/@bnj_cooley
[12]: https://medium.com/towards-data-science/a-gentle-introduction-to-neural-networks-series-part-1-2b90b87795bc
[13]: http://sunilprakash.com/post/intro-to-tensorflow/
[14]: https://blogs.msdn.microsoft.com/rserver/2017/08/01/machine-learning-services-in-sql-server-2017/
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
