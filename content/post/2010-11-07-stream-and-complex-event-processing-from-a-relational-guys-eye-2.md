---
layout: post
title: "Stream and Complex Event Processing from a Relational Guy's Eye"
author: nielsb
date: 2010-11-07T09:27:56+02:00
categories:
  - CEP
  - SQL Server
tags:
  - StreamInsight
comments: true
---
This is a re-post from my previous blog. However, as that blog has now gone to the big blog repository in the sky (or wherever blogs go to when they are no more), I decided to repost this, seeing how **CEP** and **StreamInsight** are becoming more and more popular.

<!--more-->

This is the first in (hopefully) a series of blog posts where I will be looking into Microsoft's new technology for **Complex Event Processing** (CEP); **StreamInsight** (SI). This post is an overview of the problem domain that Microsoft tries to target SI at. As I am a relational database guy at heart, I look at it from a relational guy's perspective.

### Relational Database Systems

The relational database system (**RDBMS**) is the backbone from almost any enterprise application today, and the various RDBMS's are highly optimized to deliver the best performance available, for its particular type of applications. The particular type of applications a RDBMS is (mostly) optimized for is an application where updates to the data don't happen that frequently (i.e. not like 100,000's of updates per second) and queries against the database are queries against (from what can be described as) a snapshot of the database.

The last couple of decades we have seen the emergence of types of applications that has somewhat different requirements and characteristics than a typical RDBMS based application. Examples of these type of applications are OLAP, Data Mining as well as storage and querying new data types such as XML, media and spatial. This has required the RDBMS to add new functionality as well as extending existing functionality.

### Streaming Data

The last few years there has been yet another type of data intensive applications arriving on the scene, but these applications has somewhat different requirement's than "just" being able to query "static" data. These are types of applications where data can potentially arrive with very high frequency and we may need to run queries against this data continuously and / or from the arriving data derive new types of data (change the schema of the original data) - which we also may want to run queries against. I am talking about **Stream Data Processing** (**SDP**) and **Complex Event Processing** (**CEP**) applications.

The main differences between a typical RDBMS application and a SDP/CEP application are:

*   The data in a SDP/CEP application can be never ending. I.e. the data continuously arrives.
*   When we query data in a RDBMS app, we do it against a static snapshot of the data at that particular time.  The data is being evaluated once - and output once.
*   Querying against SDP/CEP data however is typically done in a continuous fashion. The data is continuously evaluated and output.

### RDBMS vs. SDP/CEP

We can use RDBMS systems for SDP/CEP applications; we load the incoming data into the database and then we run queries continuously against the stored data. This will work OK, but we will run into some issues with it:

*   By storing the data before we query it, we are adding latency as per Figure 1 below.
*   We may have to write some convoluted queries in order to be able to querying the data in a continuous manner.

![](/images/posts/SI-1.png)

**Figure 1:** *RDBMS's Handling Stream Data*


So, even if we can use RDBM's for SDP/CEP type applications it is fairly obvious that this may not be the best approach. Hence the rise of another type of management systems for SDP/CEP applications: the **Data Stream Management Systems** (**DSMS**).

The DSMS systems work under the premises that we have some sort of server (running in memory), which serves up application(s) that handles the incoming data. The incoming data is fed to the application(s) by the use of input adapters. In the application(s) there are continuous queries running over the data from the input adapters. The results of the queries are then being fed to output adapters which serve up the data to applications that need the data. Figure 2 tries to illustrate a DSMS system.

![](/images/posts/SI-2.png)

**Figure 2:** *General Overview of DSMS*

Dependent on the DSMS system the language of the query may vary. Quite a few systems are using languages that are fairly similar to SQL, whereas SI is using LINQ. As we can see from Figure 2, the main part of the DSMS runs in a low latency environment, and it is only if we need any sort of look-up data loaded from a RDBMS that we may run into high latency issues.

### Complex Event Processing

So what is the difference between processing the streaming data and doing CEP? In CEP we look at the individual events, try to correlate them and look at the impact on a macro-level. A typical example of this (quite a few DSMS systems, are using this as an example) is where we collect sensor signals from cars, let's say each car sends out a signal every 30:th second. This signal contains information about position, speed, road, lane in the road etc. When analyzing these event signals we say that a car-crash has happened if any given car has during 4 consecutive signals the same position and 0 speed. We have analyzed the individual events and from them derived a new event: a **Complex Event**.

This was a very rudimentary explanation. To get a fuller (and much better and in-depth) explanation have a look at a series of [blog posts][1] by [Tim Bass][2].

### Finally

As mentioned at the very beginning; this was a repost, and in the original post I said that I would in the next instalment write about the architecture of StreamInsight. The blog disappeared before that, but look out for a post shortly here about the architecture. 

 [1]: http://www.thecepblog.com/what-is-complex-event-processing/
 [2]: http://www.thecepblog.com
