---
type: post
layout: "post"
title: How to Stream Data to Event Hubs from Databases Using Kafka Connect & Debezium in Docker - I
author: nielsb
date: 2022-01-10T19:05:33+02:00
comments: true
highlight: true
draft: false
categories:
  - Kafka Connect
  - Debezium
  - Event Hubs
tags:
  - CDC
  - Azure Event Hubs
  - Kafka Connect
  - streaming
  - Kafka
  - Azure
description: In this post we look at how to configure Kafka Connect if we want to stream data to Event Hubs, using Debezium and Docker.
keywords:
  - CDC
  - Azure Event Hubs
  - Kafka Connect
  - streaming
  - Kafka
  - Azure   
---

This post is the first of two looking at if and how we can stream data to Event Hubs from Debezium. Initially I had planned only one post covering this, but it turned out that the post would be too long, so therefore I split it in two.

The second post in the series is:

* [**How to Stream Data to Event Hubs from Databases Using Kafka Connect & Debezium in Docker - II**][8]. Here we look at the Debezium connector configuration needed if we want to stream data to Event Hubs.

It started with the post, [**How to Use Kafka Client with Azure Event Hubs**][1]. In that post, I looked at how the Kafka client can publish messages to - not only - **Apache Kafka** but also **Azure Event Hubs**. In the post, I said something like:

*An interesting point here is that it is not only your Kafka applications that can publish to Event Hubs but any application that uses Kafka Client 1.0+, like Kafka Connect connectors!*

Obviously, for you who know me, I said that without having tested it properly, but: *how hard can it be? What could possibly go wrong?*. Well, I was called upon it by a guy who had read the post. He told me he had tried what I said at one time or the other, and it hadn't worked.

In this post (the first), we look at configuring Kafka Connect to connect to Event Hubs.

<!--more-->

## Background

Let us look at some of the moving parts of this.

#### Azure Event Hubs

Azure Event Hubs is a big data streaming platform and event ingestion service. It is a fully managed Platform-as-a-Service (PaaS) with little configuration or management overhead, very much like Apache Kafka in **Confluent Cloud**.

The concepts are fairly similar between Event Hubs and Kafka, especially if we look at Apache Kafka in Confluent Cloud. There are however a couple of differences in terminology:

* In Kafka, we create/have a *cluster*, whereas, in Event Hubs, we have a *namespace*.
* When we publish messages to Kafka, we publish to a *Topic*, where the topic is part of a cluster. In Event Hubs we publish to an *Event Hub* in an Event Hubs namespace. Even though the names (topics, Event Hub) are different, the underlying concepts are the same. I.e. both have partitions, and messages are located based on offsets in a partition.

An Event Hubs namespace exposes API endpoints to where clients can connect. One such endpoint is the Kafka client protocol endpoint (protocol version 1.0 and above) which is exposed on port `9093` of the host of the namespace.

The previously mentioned [post][1] discusses this in more detail.

#### Kafka Connect

Kafka Connect is a JVM process (worker process) running separately from a Kafka broker. It is used for streaming data between Apache Kafka and other systems in a scalable and reliable way. Kafka Connect moves the data using **connectors**, where a connector is a `.jar` file, and the connector is loaded by the Kafka Connect process. Basically the worker acts as a host for one or more connectors. The connectors come in two flavours:

* Source connectors, which understand how to interact with the source system, publish records to Kafka topics (Kafka acts as a sink).
* Sink connectors propagate records from Kafka topics to other systems.

Connectors are Kafka specific, but since Event Hubs exposes the Kafka client endpoint, we can use (or at least supposedly can) connectors that use Kafka as a sink. 

#### Debezium

Debezium is an open-source distributed platform for change data capture (CDC). It captures changes in your database(s) and publishes those changes to topics in Kafka.

Debezium has Kafka Connect connectors for many source systems; Oracle, PostgresSQL, SQL Server, etc., and in this post, we use the Debezium SQL Server connector. As with other Kafka Connect connectors, the Debezium connectors are deployed to Kafka Connect. 

The post [**How to Deploy the Debezium SQL Server Connector to Docker**][2] looks at Kafka Connect, Debezium, and SQL Server in more detail.

Having had some background information, let's see what you need if you want to follow along.

## Pre-reqs

The pre-reqs are the same (with a couple of additions) as in the [**How to Deploy the Debezium SQL Server Connector to Docker**][2] post, so look at that post to find out what you need. The additions are:

* As you'll be working with Event Hubs, you need an Azure account. If you don't have an Azure subscription, sign up for a [free account][1].
* An Event Hubs namespace to where the SQL data will be streamed. 

If you don't have an Event Hubs namespace and are unclear on how to create one, the Microsoft article [**Quickstart: Create an event hub using Azure portal**][4] covers it in detail. While creating the namespace, ensure you create it under the *Standard* pricing tier (or higher), as *Basic* does not support Kafka.

The Event Hubs namespace I use in this post looks like so:

![](/images/posts/dbz-evthub-namespace-1.png)

**Figure 1:** *Namespace*

In *Figure 1*, we see how the namespace is called `dbzeventhubs` (outlined in red) and that we don't have any Event Hub (topic) yet.

After you have downloaded and set up the pre-reqs as per the above [post][2], as well as the Event Hubs namespace, we are ready to go. We  should have:

* A SQL Server database: `DebeziumTest` (or whatever you named it).
* A table in the database: `dbo.tb_CDCTab1`.

We also have an Event Hubs namespace. I named it `dbzeventhubs` as in *Figure 1*.

## Event Hubs Security & Authentication

In the [Kafka Client and Event Hubs][1] post, I discussed how we need to configure Event Hubs security to allow Kafka clients to interact with Event Hubs. We did it by creating a Shared Access Signature (SAS) policy. We then used the policy's connection string as the `SASL` authentication password.

In this post, we do the same, with one difference. In the [previous post][1], we created the policy for the Event Hub (topic), whereas now we do it for the namespace. This is because both Kafka Connect and Debezium need permissions on the namespace level (create event hubs, etc.).

For this post, I created the policy in the same way as I did in the [Kafka Client and Event Hubs][1] post, and during creation, I saw something like so:

![](/images/posts/dbz-evthub-sas-create.png)

**Figure 2:** *Create Policy*

In *Figure 2*, we see how I created a policy called `KafkaConnect` and how the policy has `Manage` permissions. The `Manage` permission allows the policy to manage the topology of the namespace, i.e. adding deleting entities.

Having created the policy, you copy one of the policy's connection strings as that is what we use for the Kafka client configuration. My connection string looks like so:

```bash
Endpoint=sb://dbzeventhubs.servicebus.windows.net/; SharedAccessKeyName=KafkaConnect; \
SharedAccessKey=<secret-key>
```
**Code Snippet 1:** *SAS Policy Connection String*

The string we see in *Code Snippet 1* acts as the password for authentication. When setting up Kafka Connect, we need to define the `bootstrap.servers` (the server(s) to connect to). We get that value from the `Endpoint` field, `dbzeventhubs.servicebus.windows.net`. We append it with the port, `9093`, for the Event Hubs Kafka API endpoint.

> **NOTE:** I am aware that I have "glossed" over the details of SAS policies. Please look at the [Kafka Client and Event Hubs][1] post if you need more information.

Cool, we now have all we need to configure Kafka Connect in Docker.

## Kafka Connect & Docker

As mentioned before, we want to run Kafka Connect and the connector locally in Docker. We do it by using a `docker-compose.yml` file, similar to what we did in the post [**How to Deploy the Debezium SQL Server Connector to Docker**][2]. The difference here is that we only run Kafka Connect and the connector, no Kafka broker, etc.

This part, configuring Kafka Connect: *how hard can it be? What could possibly go wrong?*

Needless to say, it was not as easy as I thought.  

## Docker Compose

As mentioned before, we use a `docker-compose.yml` and to make things a bit more readable, I have divided the file into three parts: *basics*, *security*, and *connector*. The three parts are represented by the figures below.

#### Basics

The *basics* part looks like so:

![](/images/posts/dbz-evthub-docker-compose-1.png)

**Figure 3:** *Docker Compose - I*

In *Figure 3*, you see the start of the `docker-compose.yml`. If you have done any work using Docker Compose before, nothing there should come as a surprise. Let's have a look at the outlined areas:

* Yellow: this is the image we use. As you see, I am using the Kafka Connect base image, which contains the bare minimum for Kafka Connect.
* Red: defines the Kafka endpoint for the worker process. This is the Kafka endpoint of the Event Hubs namespace. You get the endpoint from the SAS policy's connection string.
* Green: Kafka Connect uses topics to store connectors config, offsets, and statuses. As this is Event Hubs, we see the Event Hub names we want to use (they will be auto-created). We also define the replication factor for the event hubs (topics). In Kafka, the default is 3, but Event Hubs works somewhat differently, so we set the replication factor to 1.

Let us go to the security part, where it got a bit interesting for me.

#### Security

In the [Kafka Client and Event Hubs][1] post, I discussed using the `SASL_SSL` security protocol with `PLAIN` as the mechanism. Using `PLAIN` gives us a username/password authentication mechanism. I also mentioned how the password should be set to SAS policy's connection string value and the username to the "magic" string `$ConnectionString` (notice the dollar sign). Applying that to this post and the SAS policy we created above, the username password "combo" would look something like this:

``` python
'sasl.username': "$ConnectionString",
'sasl.password': "Endpoint=sb://dbzeventhubs.servicebus.windows.net/; \
                  SharedAccessKeyName=KafkaConnect; SharedAccessKey=<secret-key>;"
```
**Code Snippet 2:** *User Name & Password*

In *Code Snippet 2* we see how I have taken the SAS policy's connection string and used that for the `sasl.password` value.

Kafka (brokers, Connect, etc.) uses JAAS (Java Authentication and Authorization Service) for SASL configuration. So when we set up security for Kafka Connect, we must provide JAAS configurations for this, where part of the configuration is username and password. In addition to the JAAS configuration, we need the security protocol and mechanism. With this in mind, connecting to Event Hubs would look like so:

``` bash
security.protocol=SASL_SSL
sasl.mechanism=PLAIN
sasl.jaas.config = org.apache.kafka.common.security.plain.PlainLoginModule \
                   required username="$ConnectionString" \ 
                   password="<policy-connection-string>";
```
**Code Snippet 3:** *JAAS Config*

We see in *Code Snippet 3* how we first set the security protocol and the mechanism, followed by the JAAS configuration. The `org.apache.kafka.common.security.plain.PlainLoginModule` in the JAAS configuration defines the class handling logins using the `PLAIN` mechanism. 

Wow, this was quite a detour; let us try to get back to track and talk about configuring this in a compose file. When configuring security in the compose file, we need to remember that we need to configure the security for the worker process and the connector, where the connector can be consumer, publisher or both.

> **NOTE:** In certain circumstances, you do not need to configure the connectors security in the compose file, as you can override it in the connector's configuration. Since I had quite a lot of problems with the security configuration, I did it in the compose file.

OK, so with all of the above in mind, the security configuration should look something like so:

``` bash
# connect worker
CONNECT_SECURITY_PROTOCOL: SASL_SSL
CONNECT_SASL_MECHANISM: PLAIN
CONNECT_SASL_JAAS_CONFIG: \ 
         "org.apache.kafka.common.security.plain.PlainLoginModule \ 
          required username=\"$ConnectionString\" \ 
                   password=\"<connection-string-from-policy>\";"
```
**Code Snippet 4:** *Security Config Compose*

In *Code Snippet 4*, we see the security configuration for the Kafka Connect worker process. This looks good; just be aware of the `\` as line continuations and being used for escaping double quotes `"` inside the JAAS configuration. 

I thought this looked good. However, when I tried to "spin up" the Kafka Connect process, I got strange errors saying the `ConnectionString` (notice without `$`) was blank. This was followed by the log file reporting authentication issues.

After a lot of head-scratching, I finally figured out that the problem was `$ConnectionString`, more specifically the `$` sign. The dollar sign indicates variable substitution in `docker-compose`, and when the file is parsed, there is no variable named `$ConnectionString`. Having finally figured out the issue, it was pretty simple to fix by using `$$`, which says I actually want to use `$` as a literal sign.

After all this the security part of the compose file looks like this:

![](/images/posts/dbz-evthub-docker-compose-2.png)

**Figure 4:** *Docker Compose - II*

We see in *Figure 4* how we configure security for the worker process `CONNECT_xxx` (outlined in red) and the connector, which acts as a producer: `CONNECT_PRODUCER_xxx` (outlined in yellow). As discussed earlier, `username` is set to `$$ConnectionString`.

#### Connector

The connector is the last piece of the `docker-compose.yml` file, and I looked in the [**How to Deploy the Debezium SQL Server Connector to Docker**][2] post at various ways of running the connector in Kafka Connect. In this post, I use the ability to in a `docker-compose.yml` file to execute arbitrary commands, using the `command` option:

![](/images/posts/dbz-evthub-docker-compose-3.png)

**Figure 5:** *Docker Compose - III*

In the `command` option (outlined in blue) in *Figure 5* we install the Debezium SQL Server connector. 

> *NOTE:** If you wonder about `confluent-hub`, then read more about it [here][6].

When you have come this far, you can do a test run. Before you run this, make sure your Event Hubs namespace does not have any event hubs (topics), or at least none with the same names as your storage topics.

## Test Run

The test run is to ensure that the Docker container "comes up" properly and the connector is loaded into the Kafka Connect worker.

So: 

* Ensure that Docker is running on your box
* Start the container with: `docker-compose up -d`. 

To check what is happening, you can use the Docker Desktop app. When you open it up:

![](/images/posts/dbz-evthub-docker-app-1.png)

**Figure 6:** *Docker Desktop App - I*

When the container starts up, you see what is in *Figure 6*. More specifically, if you click on the *Container / Apps* outlined in red, you see the running containers. In our case, it is the `dbz-eventhub-cont` outlined in red. If you want to drill down further, you click on the container (outlined in red):

![](/images/posts/dbz-evthub-docker-app-log.png)

**Figure 7:** *Docker Desktop App - II*

Having clicked on the container, you now see the log for the container as in *Figure 7*. This is a great help when trying to figure out issues.

OK, so looking at the logs, we do not see anything strange, so let us check two more things: that event hubs have been created, and the connector has loaded.

#### Event Hubs (topics)

In the Azure portal, browse to your namespace and click on the Event Hubs menu:

![](/images/posts/dbz-evthub-topics-1.png)

**Figure 8:** *Created Event Hubs*

In *Figure 8*, we see that the event hubs we defined for configs, offsets and status have all been created when the container started. Looking good so far.

#### Connector

The last thing we want to check is whether the connector is loaded. Kafka Connect exposes a REST API allowing us to configure/manage/etc. our connectors. To check whether the SQL Server connector is loaded, we use a `GET` call:

``` bash
GET http://127.0.0.1:8083/connector-plugins
```
**Code Snippet 5:** *GET Connectors*

In *Code Snippet 5* we see how we execute a `GET` call into `localhost` (as we host Kafka Connect on our box):

![](/images/posts/dbz-evthub-installed-connectors.png)

**Figure 9:** *GET Installed Connectors*

The result of the call in *Code Snippet 5* is what we see in *Figure 9*: we see "our" SQL Server connector together with three other connectors. These other three connectors are all part of the base image we use.

The container is up and running, the event hubs for the Kafka Connect worker has been successfully created, and the connector has loaded! What remains to be done is configuring the connector to capture data from our table. I leave that to the next post, so let us just sum up what we have done so far.

## Summary

We set out to prove/disprove the ability to stream data from Debezium to Azure Event Hubs. We still haven't proven that it is possible, but we have come a bit on the way.

The main takeaways from this post are:

* When configuring the security, you do it both for the Kafka Connect worker process and the connector.
* When setting up a username/password, you use a JAAS configuration.
* When using SASL with Event Hubs, the username is hard-coded to `$ConnectionString`. Using `docker-compose.yml` you need to use two dollar signs: `$$ConnectionString`. You can read more about it [here][7].

In the [next post][8], we look at configuring the connector, and we will see whether Debezium to Event Hubs actually works.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[1]: {{< relref "2022-01-02-how-to-use-kafka-client-with-azure-event-hubs.md" >}}
[2]: {{< relref "2021-08-07-how-to-deploy-the-debezium-sql-server-connector-to-docker.md" >}}
[3]: https://azure.microsoft.com/en-us/free/
[4]: https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-create
[5]: https://rmoff.net/2019/10/16/using-kafka-connect-and-debezium-with-confluent-cloud/
[6]: https://docs.confluent.io/home/connect/confluent-hub/
[7]: https://docs.docker.com/compose/environment-variables/#substitute-environment-variables-in-compose-files
[8]: {{< relref "2022-01-14-how-to-stream-data-to-event-hubs-from-databases-using-kafka-connect--debezium-in-docker---ii.md" >}}


