---
type: post
layout: "post"
title: How to Use Kafka Client with Azure Event Hubs
author: nielsb
date: 2022-01-02T09:48:17+02:00
comments: true
highlight: true
draft: false
categories:
  - Azure
  - Kafka
  - Event Hubs
tags:
  - Kafka
  - Event Hubs
  - python
  - Confluent Cloud
description: We look at how to use a Kafka client to connect to Azure Event hubs
keywords:
  - Kafka
  - Event Hubs
  - python
  - Confluent Cloud  
---

This blog post came by, by accident, lol. A couple of weeks ago, I started to prepare for a webinar: [**Analyze Billions of Rows of Data in Real-Time Using Azure Data Explorer**][7]. One of the demos in that webinar is about ingesting data from Apache Kafka into **Azure Data Explorer**. When prepping, I noticed that my Confluent Cloud Kafka cluster didn't exist anymore, so I had to come up with a workaround. That workaround was to use **Azure Event Hubs** instead of Kafka.

Since I already had the code to publish data to Kafka and knew that you could use the Kafka client to publish to Event Hubs, I thought I'd test it out. I did run into some minor snags along the way, so I thought I'd write a blog post about it. Then, at least, I have something to go back to. This post also looks at how to set up an Event Hubs cluster.

<!--more-->

## Background

Azure Event Hubs is similar to Apache Kafka in that it is a big data streaming platform and event ingestion service. It is a fully managed Platform-as-a-Service (PaaS) with little configuration or management overhead, very much like Apache Kafka in **Confluent Cloud**. The one difference between Azure Event Hubs and Apache Kafka is that Event Hubs does not have an on-prem solution.

#### Kafka vs Event Hubs Concepts

Event Hubs and Kafka are pretty similar, as I mentioned above. Let us compare the concepts of the two:

| Kafka | Event Hubs |
|-------|------------|
| Cluster | Namespace |
| Topic | EventHub |
| Partition | Partition |
| Consumer Group | Consumer Group |
| Offset | Offset |

**Table 1:** *Kafka vs Event Hubs Concepts*

As we see in *Table 1*, there is not much difference between Kafka and Event Hubs. The one difference worth noting is the Event Hubs namespace instead of the Kafka cluster.

#### Namespace

An Event Hubs namespace is a dedicated scoping container for event hubs, where an event hub as mentioned above is the equivalent to a Kafka topic. We can see it as a management container for individual event hubs (topics), and it provides a range of access control and network integration management features.

For this post, the important part is that the namespace provides IP endpoints allowing us to publish to the namespace and its individual event hubs (topics).

#### Event Hubs Kafka Endpoint

One of the endpoints the namespace provides is an endpoint compatible with the Apache Kafka producer and consumer APIs at version 1.0 and above. 

So if your application uses a Kafka client version 1.0+, you can use the Event Hubs Kafka endpoint from your applications without code changes, apart from configuration, compared to your existing Kafka setup.

> **NOTE:** When I above say you only need to change the configuration, I assume that the Kafka topics have corresponding EventHubs (remember Kafka topic = Event Hubs EventHub).

An interesting point here is that it is not only your Kafka applications that can consume from Event Hubs but any application that uses Kafka Client 1.0+, like Kafka Connect connectors!

## Pre-Reqs

This section is here if you want to follow along. This is what you need:

* An Azure account. If you don't have an Azure subscription, sign up for a [free account][1].
* Your favourite development language. In this post, I use Python.
* Kafka client for your favourite language as per above. [Here][2] you find a list of clients.
* Application publishing to Kafka. The idea is that you can switch from publishing to Kafka to publish to Event Hubs in this application. 

Ensure the client is installed. In Python, I do it using `pip`, like so:

```python
pip install confluent-kafka
```
**Code Snippet 1:** *Install the Client*

After having run the code in *Code Snippet 1*, or similar code for your language, you are good to go.

#### Kafka Application

Above I mentioned about an application publishing to Kafka being optional. Let us here take a look at a very simple example. 

In this example, I have an Azure Confluent Cloud cluster looking like so:

![](/images/posts/evthub-adx-confluent-cloud.png)

**Figure 1:** *Confluent Cloud Cluster*

In *Figure 1*, we see my Confluent Cloud cluster named `kafkaeventhubs` and how that cluster has one topic - `testtopic` - with four partitions.

> **NOTE:** To see how to run Confluent Cloud in Azure, see my post [**Run Confluent Cloud & Serverless Apache Kafka on Azure**][6].

I have a very basic Python application publishing to the `testtopic` looking like so:

![](/images/posts/evthub-adx-kafka-app.png)

**Figure 2:** *Python Publish App*

As we see in *Figure 2* the app is not doing anything advanced. It publishes a comma-delimited message containing the random key value, "Hello World", and a timestamp.

What is interesting in the code is the configuration string (assigned to the variable `conf`) in lines 14 - 19, and specifically the following properties:

* `bootstrap.servers`: The cluster endpoint.
* `security.protocol`: The protocol used to communicate with brokers. In this case, we use `SASL_SSL`, which uses SASL for authentication and SSL for encryption.
* `sasl.mechanism`: This indicates how we authenticate. By setting it to `PLAIN`, we use a "simple" username/password based authentication mechanism.
* `sasl.username`: The username to use. In Confluent Cloud, we use an API key mechanism, where the `username` is the API key, and the password is the API key's secret.
* `sasl.password`: As per above, this is the API key's secret.

Why I say these are interesting is these are the ones that are in play if we want to publish to Event Hubs.

Having seen the pre-reqs lets us create a namespace in Event Hubs.

## Create Event Hubs Namespace

There are multiple ways we can create an Event Hubs resource, where the Azure Portal is one of them.

Instead of doing a step-by-step explanation of creating an Event Hubs namespace, I suggest you read the Microsoft article [**Quickstart: Create an event hub using Azure portal**][5]. While you are doing that, I will create an Event Hubs test namespace for this post.

> **NOTE:** When you create the namespace, you have to ensure you create it under the *Standard* pricing tier (or higher), as *Basic* does not support Kafka.

We are all back? Cool, I ended up with this:

![](/images/posts/evthub-adx-topics-1.png)

**Figure 3:** *Event Hubs Namespace with EventHub*

As you see in *Figure 3* I ended up with an Event Hubs namespace called `kafkaeventhubs` and an Event Hub named `testtopic`, the same as I have in Confluent Cloud. 

## Event Hubs Security & Authentication

So now we have all we need to replace Kafka with Event Hubs - almost. We still need to see how to configure the Event Hubs security and authentication.

When using Event Hubs, all data in transit is TLS encrypted, and we can satisfy that by using `SASL_SSL`. This is exactly as in the Kafka code. Using `SASL_SSL` we have basically two options for authentication: OAuth 2.0 or Shared Access Signature (SAS). In this post, I use SAS, which matches what I do using Kafka.

#### Create Shared Access Signature

In Event Hubs, we can create a SAS for either a namespace or an individual EventHub in a namespace. Let us create a SAS for our `testtopic` Event Hub.

If you click into the `testtopic` Event Hub we see in *Figure 3* and look at the left-hand side; you see something like so:

![](/images/posts/evthub-adx-topic-sas.png)

**Figure 4:** *Event Hub Shared Access Policies*

We see under *Settings* in *Figure 4* *Shared access policies* (outlined in red). When we click on it:

![](/images/posts/evthub-adx-topic-sas-2.png)

**Figure 5:** *Shared Access Policies*

We are being told that we don't have any policies set up, as outlined in yellow in *Figure 5*. Cool, let us create a policy. We do that by clicking on the *+ Add* button, which is outlined in red in *Figure 5*:

![](/images/posts/evthub-adx-topic-sas-create.png)

**Figure 6:** *Add Policy*

By clicking the *+ Add* button, we get a dialog *Add SAS Policy* as shown in *Figure 6*. We give it a name and the claims (what it allows), and then we click the *Create* button at the bottom of the dialog (not shown in *Figure 6*):

![](/images/posts/evthub-adx-topic-sas-created.png)

**Figure 7:** *Policy Created*

In *Figure 7*, we see the generated policy and the claims. Clicking on the policy, we get yet another dialog:

![](/images/posts/evthub-adx-topic-sas-policy-keys.png)

**Figure 8:** *Policy Keys & Connection Strings*

The policy we created consists of two keys and corresponding connection strings as in *Figure 8*. The reason for having two is that in a production environment, you may want to cycle and regenerate the keys, so while you regenerate one, you can use the other.

Copy one of the connection strings as that is what we use for the Kafka client configuration:

![](/images/posts/evthub-adx-topic-sas-policy-connstring.png)

**Figure 9:** *Connection String*

In *Figure 9*, we see one of my connection strings. I have outlined in red the endpoint URL, and this is the one we use for the `bootstrap.servers` property in the configuration.

Now we should have everything we need to use the Kafka client to publish to the EventHub.

## Configure Kafka Client

Above I listed the configuration properties used when I connect to Confluent Cloud. Let us see what they should be when publishing to Event Hubs:

#### Bootstrap Servers

The `bootstrap.servers` property defines the endpoint(s) where the client connects to. In *Figure 9*, I outlined the endpoint URL and said it would be used for `bootstrap.servers`. At the beginning of this post, I mentioned how Event Hubs exposes a Kafka endpoint. It does that on port `9093`. So:

``` python
`"bootstrap.servers": "kafkaeventhubs.servicebus.windows.net:9093"`
```
**Code Snippet 2:** *Bootstrap Servers*

Onto the security and authorization part.

#### Security Protocol` & SASL Mechanisms

As we use Shared Access Signature, We do not need to change `security.protocol` or `sasl.mechanism`; we keep them as `SASL_SSL` and `PLAIN`, respectively..

#### Username & Password

At the very beginning of this post, I mentioned how I ran into some snags when trying to use the Kafka client to publish to Event Hubs. This is the part that caused me issues.

Reading documentation and blog posts when trying to connect to Event Hubs, I concluded that `sasl.password` should be set to the whole connection string you get from the SAS policy. OK, that's cool - but what about the user name? 

Posts and docs talk about using `$ConnectionString`, but `$ConnectionString` looked like a variable to me, and I could not see where it was set. It finally dawned upon me that the user name property should literally be set to `$ConnectionString` - duh. So:

``` python
'sasl.username': "$ConnectionString",
'sasl.password': "Endpoint= sb://kafkaeventhubs.servicebus.windows.net/; \
                      SharedAccessKeyName=publishconsumepolicy; \
                      SharedAccessKey=<secret-key>, 
                      EntityPath=testtopic"

```
**Code Snippet 3:** *User Name & Password*

In *Code Snippet 3*, we see how `sasl.password` is set to the SAS policy's connection string and `sasl.username` to `$ConnectionString`. 

The complete configuration required to connect to and publish to Event Hubs looks like so:

``` python
conf = {'bootstrap.servers': 'kafkaeventhubs.servicebus.windows.net:9093',
         'security.protocol': 'SASL_SSL',
         'sasl.mechanisms': 'PLAIN',
         'sasl.username': "$ConnectionString",
         'sasl.password': "Endpoint= \
                      sb://kafkaeventhubs.servicebus.windows.net/; \
                      SharedAccessKeyName=publishconsumepolicy; \
                      SharedAccessKey=<secret-key>; \
                      EntityPath=testtopic",
         'client.id': socket.gethostname()}

```
**Code Snippet 4:** *Event Hubs Configuration*

You can now replace lines 14 - 19 that we see in *Figure 2* with what we have in *Code Snippet 4*, and you are good to go!

## Publish to Event Hubs

After editing the `conf` variable, you can run the application. Let it publish some messages and then check what you see in the overview for the `testtopic` Event Hub:

![](/images/posts/evthub-adx-publish.png)

**Figure 10:** *Publish Events*

There is no straightforward way to see if messages come into the Event Hub, so we look at the request stats. In *Figure 10*, we see how events have come into the Event Hub. Yay - it seems like it works!

I said above that there is no straightforward way to see if messages/events arrive into the Event Hub. Well, when we now know how to connect and publish to Event Hubs using the Kafka client, we could easily create a consuming application. However, I leave that up to you.

## Summary

In this post, we have seen how to use the Kafka client to connect and publish messages to an Azure Event Hub. 

We compared the terminology of Kafka with Event Hubs, and saw that it is more or less the same. The two major differences are: 

1. In Kafka, we talk about clusters, whereas in Event Hubs, we have namespaces.
1. A topic in Kafka is called an Event Hub in Event Hubs.

We use port `9093` on the Event Hubs endpoint to connect the Kafka client. When using `SASL_SSL` and the `PLAIN` `sasl.mechanism`, the user name we use is`$ConnectionString`, and the password is the entire connection string from the Event Hub's Shared Access Signature policy.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[adx]: https://docs.microsoft.com/en-us/azure/data-explorer/

[1]: https://azure.microsoft.com/en-us/free/
[2]: https://docs.confluent.io/platform/current/clients/index.htm
[3]: https://portal.azure.com/
[4]: https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-scalability#throughput-units
[5]: https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-create
[6]: {{< relref "2021-08-14-run-confluent-cloud--serverless-apache-kafka-on-azure.md" >}}
[7]: https://www.meetup.com/SQLCape-Meetup/events/282241220/
