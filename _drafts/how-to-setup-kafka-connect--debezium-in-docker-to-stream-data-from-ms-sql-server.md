---
type: post
layout: "post"
title: "How to Setup Kafka Connect & Debezium in Docker to Stream Data from MS SQL Server"
author: nielsb
date: 
comments: true
highlight: true
draft: true
tags:
  -
description: 
keywords:
  -   
---

I have been doing a couple of conference talks lately, (virtual of course), about streaming data from SQL Server to Kafka. The title of the presentation is: **Free Your SQL Server Data With Kafka**.

In the presentation I talk, (and show), various ways of getting data from SQL Server to Kafka. One of the ways I cover is Microsoft CDC together with Debezium. 

When I do the presentation I always have a SQL Server installed locally and I run Kafka in Docker. Without a fail, every time I set up the environment I cannot remember how to do the Docker "stuff", so therefore I decided to write this post to have something to go back to for next time.

<!--more-->

> **NOTE:** This post does not cover the intricacies of how to configure Debezium for SQL Server. I leave that for a future post.

## Debezium

Debezium is an open source distributed platform for change data capture, (I "stole" the preceding shamelessly from [here][1]). It captures changes in your database(s) and publishes those changes to topics in Kafka.

> **NOTE:** Debezium *can* work without a Kafka cluster, in which case it is embedded in your application, and the application receives the change notifications. Read more about that [here][2].

Debezium works by means of Connectors. A connector is a piece of code that that captures changes from database systems and produces events with similar structures. When interacting with Kafka, the connector(s) is deployed to Kafka Connect.

## Kafka Connect




which is a framework for implementing source and sink connectors. 


So in our case we would like a Debezium MS SQL Server connector deployed to Kafka Connect, something like so:




 understands how to interact with the underlying database system's CDC implementation.


![](/images/posts/<image_name_incl_ext>)

**Figure 1:** **


## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com


[1]: https://debezium.io/
[2]: https://debezium.io/documentation/reference/1.4/development/engine.html

<!--
  post reference
  [pkg1]: {{< relref "" >}}
-->  


<!--
[series1]: <> [SQL Server R Services](/series/sql_server_2k16_r_services)
[series2]: <> [Install R Packages in SQL Server ML Services](/series/sql_server_ml_services_install_packages)
[series3]: <> [sp_execute_external_script and SQL Server Compute Context](/series/spees_and_sql_compute_context)
-->

<!--
[findstr]: <> findstr /I \<word_to_find\> *
-->
