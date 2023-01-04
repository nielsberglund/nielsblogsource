---
layout: post
title: "SQL Saturday Presentations"
author: nielsb
date: 2013-10-29T20:13:56+02:00
comments: true
categories: 
  - SQL Server
  - Derivco
tags:
  - SQL Saturday
  - Derivco
  - SQL Server
description: Post about the two SQL Saturday Presentations I did in Cape Town and Johannesburg
keywords: 
   - SQL Server Error Handling 
   - Queues and SQL Server
   - Derivco
   - Derivco Technology
   - Derivco SQL Server 
   - SQL Server Service Broker
   - Octopress blogging
   - Octopress Windows
---
The two first weekends in August I were in Cape Town and Johannesburg respectively presenting at **SQL Saturday** events. I had a great time, and the audience were terrific. My employer [**Derivco**](/derivco) graciously gave me some "swag" to hand out, and that went down a treat. Thanks Derivco!! 

<!--more-->

After the events some people have emailed me and asked for the presentations, so I thought I'd upload them to [**SlideShare**][1], so anyone that are interested can get to them. Seeing that I recently switched to a new [blog platform][2], [**Octopress**][3], and I a couple of days ago came across a **SlideShare** plugin for Octopress - I decided to test it out by posting the presentations here on my blog.

The two presentations I did were based about the "weird/wonderful (or not so wonderful)" things we have experienced at Derivco in our live production environments:

* **SQL Real World Error Handling** - Gotcha's when doing error-handling in SQL Server
* **Message Queues in SQL Server** - Enhance performance by using queues in SQL Server 

## SQL Real World Error Handling
This presentation talks about strange scenarios that can catch unaware developers out when mixing the new way of handling errors introduced in SQL Server 2005, with what we used to do before:

```sql New Style SQL Server Error Handling
BEGIN TRY
  -- do some stuff that may cause an error
END TRY
BEGIN CATCH
  --handle error, and perhaps re-raise
END CATCH
```

```sql Old Style SQL Server Error Handling
DECLARE @err int;
EXEC dbo.Some_Proc
SET @err = @@ERROR
IF(@err <> 0)
BEGIN
  --do error "stuff"
END
```

## Message Queues in SQL Server

Here I discussed the findings from research at Derivco about the most efficient implementations of queues inside SQL Server.

If anyone are interested in discussing this more, please post a comment.



[1]: http://www.slideshare.net/nielsb_11/
[2]: {{< relref "2013-10-02-moving-to-a-new-blog-engine.markdown" >}}
[3]: http://octopress.org/
