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

I have been doing a couple of conference talks lately (virtual, of course) about streaming data from SQL Server to Kafka. The title of the presentation is **Free Your SQL Server Data With Kafka**.

In the presentation, I talk (and show) various ways of getting data from SQL Server to Kafka. One of the ways I cover is Microsoft CDC, together with Debezium. 

When I do the presentation, I always have a SQL Server installed locally, and I run Kafka in Docker. Without fail, every time I set up the environment, I cannot remember how to do the Docker "stuff". Therefore I decided to write this post to have something to go back to for next time.

<!--more-->

> **NOTE:** This post does not cover the intricacies of how to configure Debezium for SQL Server. I leave that for a future post.

## Background

Before diving into how to do this, let us look at the moving parts of this.

#### Debezium

Debezium is an open source distributed platform for change data capture, (I "stole" the preceding shamelessly from [here][1]). It captures changes in your database(s) and publishes those changes to topics in Kafka.

> **NOTE:** Debezium *can* work without a Kafka cluster, in which case it is embedded in your application, and the application receives the change notifications. Read more about that [here][2].

Debezium works by means of Connectors. A connector is a piece of code, specific to the underlying database system that that captures changes from the database. Regardless of underlying system it produces events with similar structures. When interacting with Kafka, the connector(s) is deployed to Kafka Connect.

#### Kafka Connect

Kafka Connect is a tool for streaming data between Apache Kafka and other systems in a scalable and reliable way. The way you move data between systems and Kafka is using connectors, such as the Debezium connectors mentioned above, and there are two flavors of connectors:

* Source connectors such as Debezium that understand how to interact with the source system send records into Kafka
* Sink connectors that propagate records from Kafka topics to other systems.

Kafka Connect is a JVM process, and it operates separately from the Kafka Broker. Connectors are `.jar` files loaded by the connect process. The diagram below shows a high-level overview of what it looks like:

![](/images/posts/kafka-connect-1.png)

**Figure 1:** *Kafka Connect Overview*

In *Figure 1* we see, (from left to right):

* Source systems, i.e. systems we want to get data from. These systems can be databases, Hadoop, files, etc.
* The Kafka Connect worker with source connectors. The connectors know how to interact with the source system, whether querying a database, using CDC, reading from a filesystem, etc. The connectors publish data to Kafka topics.
* The Kafka broker(s). The broker(s) contain topics that are the "sinks" for the source connectors.
* Kafka Connect worker with sink connectors. Source and sink connectors can be in the same Kafka Connect worker. The sink connectors know how to consume events from Kafka topics and ingest them into sink systems.
* Sink systems. These are systems we ingest data into. As with source systems, these can be databases, Hadoop, files, etc.

With the above in mind, let us look at how this works with SQL Server.

#### SQL Server, Debezium, and Kafka

As I mentioned at the beginning of this post, the aim is to get data out of some table(s) in a database(s) and stream it to a topic(s) in Kafka. 

We do not necessarily need to use Debezium as there are other Kafka Connect connectors. We could, for example, use the Confluent SQL Server connector. However, as we want to stream the data in near real-time, with the least amount of work on our side, the Debezium connector is our choice. Coming back to *Figure 1* it would look something like so:

![](/images/posts/kafka-connect-cdc.png )

**Figure 2:** *Kafka Connect SQL Server & Debezium*

We see in *Figure 2 how the source system is SQL Server and how the source connector is the Debezium SQL Server connector. In the diagram we publish to one topic as we only retrieve data from one table. If we were to retrieve data from multiple tables, we'd publish to multiple topics.

We have several sink connectors reading from our topic and ingest into various sink systems.

Ok, enough background; let us see how to set this up in Docker.

## Docker

In my case I have a local install of SQL Server, and for Kafka I use Docker. So let us get the necessary Docker images and compose files.

#### Docker Kafka Image

There are quite a few Docker images, and Docker composes files around for setting up Kafka and Kafka Connect. The ones I usually use are from Confluent's [`cp-all-in-one`][3] repository. Let us get started:

```bash
mkdir kafka
cd kafka
git clone https://github.com/confluentinc/cp-all-in-one.git
```
**Code Snippet 1:** *Clone the Repo*

In *Code Snippet 1* we create a directory for the repo files and clone the [`cp-all-in-one`][3]. After cloning we have a directory named `cp-all-in-one` under the `kafka` directory. The `cp-all-in-one` directory looks like so:

![](/images/posts/kafka-connect-docker-1.png)

**Figure 3:** *Kafka Connect SQL Server & Debezium*

We see in *Figure 3* that `cp-all-in-one`, (outlined in red), have some sub-directories. These directories contain Docker Compose files for various setups of Kafka. We are interested in the directory outlined in blue: `cp-all-in-one`, (yeah I know - same name as the parent directory).

When going into that directory we see a `docker-compose.yml`. Opening it in an editor it looks like:

```bash
---
version: '2'
services:
  zookeeper:
    image: confluentinc/cp-zookeeper:6.1.1
    hostname: zookeeper
    container_name: zookeeper
   ...
  broker:
    image: confluentinc/cp-server:6.1.1
    hostname: broker
    container_name: broker
    
    ...

  schema-registry:
    image: confluentinc/cp-schema-registry:6.1.1
    hostname: schema-registry
    container_name: schema-registry
    
    ...

  connect:
    image: cnfldemos/cp-server-connect-datagen:0.4.0-6.1.0
    hostname: connect
    container_name: connect
    
    ...

  control-center:
    image: confluentinc/cp-enterprise-control-center:6.1.1
    hostname: control-center
    container_name: control-center
   
   ...

  ksqldb-server:
    image: confluentinc/cp-ksqldb-server:6.1.1
    hostname: ksqldb-server
    container_name: ksqldb-server
    
    ...

  ksqldb-cli:
    image: confluentinc/cp-ksqldb-cli:6.1.1
    container_name: ksqldb-cli
   
   ...

  ksql-datagen:
    image: confluentinc/ksqldb-examples:6.1.1
    hostname: ksql-datagen
    container_name: ksql-datagen
   
   ...

  rest-proxy:
    image: confluentinc/cp-kafka-rest:6.1.1
    depends_on:
      - broker
      - schema-registry
    ports:
      - 8082:8082
    hostname: rest-proxy
    container_name: rest-proxy
   
   ...
```












https://github.com/confluentinc/demo-scene/blob/master/mssql-to-kafka-with-ksqldb/docker-compose.yml




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
[3]: https://github.com/confluentinc/cp-all-in-one/

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
