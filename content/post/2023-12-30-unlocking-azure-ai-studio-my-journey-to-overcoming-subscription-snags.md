---
type: post
layout: "post"
title: "Unlocking Azure AI Studio: My Journey to Overcoming Subscription Snags"
author: nielsb
date: 2023-12-30T08:30:44+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/aistudio-subscription.jpg"
thumbnail: "/images/thumbnails/posts/aistudio-subscription.jpg"
categories:
  - Azure
  - Azure OpenAI Service
  - Azure AI Studio
tags:
  - Azure OpenAI Service
  - Azure AI Studio
description: "Dive into my journey with Azure AI Studio, where a baffling subscription issue meets its match. Discover the simple yet pivotal twist that unlocked my AI project potential in Azure's intricate ecosystem."
---

Microsoft's Azure stands out in the ever-evolving landscape of cloud services and artificial intelligence. Azure's AI services are no exception, offering a wide range of capabilities to help developers and data scientists build, train, and deploy models at scale. 

This blog post delves into a specific challenge I faced within this ecosystem - getting Azure AI Studio to recognize my Azure subscription.

<!--more-->

First,  let's set the stage by understanding the key components involved: Azure OpenAI Service, Azure OpenAI Studio, and Azure AI Studio.

## Azure OpenAI Service

Azure OpenAI Service comes from the collaboration between OpenAI and Microsoft. It provides REST API access to OpenAI's large language models (LLMs) and other OpenAI functionality with Azure's security and enterprise promises. Azure OpenAI co-develops the APIs with OpenAI, ensuring compatibility and a smooth transition from one to the other.

> **NOTE:** Azure OpenAI Service is not automatically available even if you have an Azure account and subscription. You need to apply for access to it and can do it from [here][2].

With Azure OpenAI Service, customers get the security capabilities of Microsoft Azure while running the same models as OpenAI. Azure OpenAI offers private networking, regional availability, and responsible AI content filtering.

#### Azure OpenAI Studio

To simplify the use of Azure OpenAI Service, Microsoft introduced, sometime in 2022, Azure OpenAI Studio. It is a web-based portal used to deploy, manage, and explore models. 

In addition to deploying, managing, and exploring models, it also has a playground where you can experiment with creating customized AI assistants, create completion models for various use cases, etc.

#### Azure AI Studio

At Ignite 2023 Microsoft introduced the evolution of Azure OpenAI Studio - the [Azure AI Studio][1].

> **NOTE:** Azure OpenAI Studio is not going away, at least not yet.

Azure AI Studio is a state-of-the-art platform designed to simplify generative AI application development, leveraging OpenAI models such as GPT4, alongside a wide array of other cutting-edge models and services. It empowers developers to explore, build, test, and deploy their AI innovations at scale - moving faster from idea to impact.

One of the cool things you can do with Azure OpenAI Studio is create your own Co-Pilots, which led me to write this blog post.

## The Problem

Seeing the various interesting things you can do with Azure AI Studio, my vision was to leverage Azure AI Studio to harness the capabilities of AI for my projects, more specifically, to initially create my own Co-Pilots. However, this vision was quickly clouded by an unexpected hurdle - my Azure subscription was not recognized by Azure AI Studio, hindering any progress in creating projects.

I could understand if it wouldn't work if I didn't have access to Azure OpenAI Service, but I do: 

![](/images/posts/azure-openai-1.png)

**Figure 1:** *Azure OpenAI Service*

In *Figure 1* you can see I can access Azure OpenAI Service. If I click on what is outlined in blue (Azure OpenAI Studio):

![](/images/posts/azure-openai-2.png)

**Figure 2:** *Azure OpenAI Studio*

You see in *Figure 2* how I am on the welcome page of Azure OpenAI Studio. So Azure OpenAI Service and Azure OpenAI Studio works fine.

But, when I click on what is outlined in red (Azure AI Studio):

![](/images/posts/azure-openai-3.png)

**Figure 3:** *Azure AI Studio*

When you first look at *Figure 3* you might think that everything looks OK. However, if you look at what is outlined in red and blue, you see that no subscription is picked up, and *Create Now* is greyed out.

OK, let's try and do it in another way:

* In your browser, go to https://ai.azure.com: the homepage for Azure AI Studio.
* You see how it looks the same as in *Figure 3* minus the dialogue box.
* Click on *Build* in the top menu.

That takes you to the *Projects* page, and when you click *New Project* you get a "Getting started" dialogue box and a *Project details* form. Just click next, and you come to the *Create a resource* form:

![](/images/posts/azure-openai-4.png)

**Figure 4:** *Create a Resource*

Part of creating a resource is to select a subscription, but as you can see in *Figure 4* no subscription is picked up! Obviously something is not right.

At this stage, I was stumped. I had access to Azure OpenAI Service but not Azure AI Studio. I tried to find a solution on the Internet but to no avail. I was pretty much at a dead end.

## The Solution

Being an MVP has its benefits, so after having cursed Microsoft a bit for their useless products, I decided to reach out to my MVP peers with a **HELP**. Shortly after sending my email, I got a reply from [Andreas Erben][3]. Andreas is a Microsoft AI MVP and has experienced similar problems with other Azure services. His suggestion was to check:

* Who was I logged in as?
* Under what Azure directory did I try to use Azure AI Studio?

I was somewhat sceptical about this; all the other stuff works, so why not this. But I decided to give it a try:

![](/images/posts/azure-openai-5.png)

**Figure 5:** *Login and Directory*

In Azure AI Studio, I clicked on my account button in the top right corner and as in *Figure 5* (outlined in red), I could see that I was logged in with the correct account. However, when I clicked *Switch Directory* (highlighted in yellow): 

![](/images/posts/azure-openai-6.png)

**Figure 6:** *Directory*

The directory we see in *Figure 6* is definitely not the correct directory. So, when I click on the drop-down list:

![](/images/posts/azure-openai-7.png)

**Figure 7:** *Available Directories*

There are quite a few directories to choose from, as in *Figure 7*, but most likely, the `Default Directory` is the correct directory. So I selected it, and the welcome page refreshed. Clicking on the account button again, as in *Figure 5* followed by *Switch Directory*, I could see that the `Default Directory` was selected.

I clicked *Build* on the welcome page in the top menu. This time, when I clicked *New project* followed by *Next* in the *Project details* dialog, I see this in the *Create a resource* form:

![](/images/posts/azure-openai-8.png)

**Figure 8:** *Create Resource*

As shown in *Figure 8* the subscription is now picked up. In the form, I filled in the required fields, chose the subscription from the drop-down and clicked *Next*. Azure AI Studio "chugged" on for a bit, and eventually the project was created:

![](/images/posts/azure-openai-9.png)

**Figure 9:** *Azure AI Studio Project Created*

In *Figure 9* you now see the project on the home page of Azure AI Studio. Clicking on it you come to the project page:

![](/images/posts/azure-openai-10.png)

**Figure 10:** *Azure AI Studio Project Page*

In *Figure 10* you see the project page. From here, you can create a new model, explore the playground, etc.; I will cover more about this in a future blog post.

## Azure Accounts, Subscriptions & Directories

A slight detour here about directories.

As you can see, the problem was that I was logged in with the correct account but in the wrong directory. So, what is the relationship between Azure Accounts, subscriptions and directories? To be honest, I am not 100% sure but here is what Bing Chat says:

*In summary, an Azure account is used to access Azure services, an Azure subscription is used to manage resources in resource groups, and an Azure AD directory is used to manage access to resources in your organization.*

Clear as mud, right? It is a bit clearer than that, but still. What I do know is that when I switched to the correct directory, Azure AI Studio worked.

When chatting to Andreas about this and mentioning that the only thing that didn't work for me was Azure AI Studio; so why did this happen? Andreas replied:

*Different "Studios" that the Azure portal links to seem to "forget" what the Directory was that was used and seem to start with their own default or with something cached from a previous session. It took me a long time to figure it out to be honest, because usually a lot of things I was using were visible when selecting "Microsoft" in the list.. now I sometimes "Microsoft" even twice but none of the two would work. There are some weird artifacts sometimes when folks seem to query the available directories.*

There you have it! I am unsure if this is a bug or a feature, but it is what it is. You can see what directories are associated with your account by clicking the settings button in the top menu of the Azure portal:

![](/images/posts/azure-openai-11.png)

**Figure 11:** *Azure Portal Settings*

What is shown in *Figure 11* is the settings page in Azure Portal for my account. It defaults to *Directories + subscriptions* (outlined in blue). You see how I have many directories, half of which I don't know what they are :smile:. Surprisingly enough, I have two `Default Directory`. I am not sure why, but that is a problem for another day. Actually, for another year, as I am shutting down for New Year now :smile:.

## Summary

So, mu problem was that I had access to Azure OpenAI Service, and Azure OpenAI Studio but not Azure AI Studio. The way I solved it:

* Check who I am logged in as.
* Check what directory I am logged in to.

In my case, I was logged in as the correct user but in the wrong directory. Switching to the correct directory solved the problem.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me. Oh, and Happy New Year :smile:!



[aoai]: https://learn.microsoft.com/en-us/azure/ai-services/openai/overview

[1]: https://azure.microsoft.com/en-us/products/ai-studio/
[2]: https://aka.ms/oaiapply
[3]: https://www.linkedin.com/in/andreaserben/

