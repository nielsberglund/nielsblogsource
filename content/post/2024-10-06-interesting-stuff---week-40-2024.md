---
type: post
layout: "post"
title: Interesting Stuff - Week 40, 2024
author: nielsb
date: 2024-10-06T10:15:17+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-40-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-40-24.jpg"
categories:
  - roundup
tags:
  - distributed computing
  - Generative AI
  - AI Agents
  - NotebookLM
description: "This week's blog covers Microsoft's Drasi for real-time event detection, AI-powered data visualization with Data Formulator, and cutting-edge AI tools like MotleyCrew and OpenAI's Realtime API for voice assistants. Plus, insights into AutoGen 0.4 and Promptriever's innovative retrieval model."
---

This week's tech roundup highlights Microsoft's Drasi, an open-source tool simplifying real-time event detection in complex systems, and Data Formulator, which enhances data visualization with AI-driven precision. 

We also explore the revolutionary MotleyCrew AI framework for multi-agent systems and OpenAI's Realtime API, streamlining voice assistant creation. Don't miss insights into AutoGen 0.4 and Promptriever, both pushing the boundaries of scalable AI and information retrieval.

<!--more-->

## Distributed Computing

* [Drasi: Microsoft's newest open-source project simplifies change detection and reaction in complex systems][1]. In this post, Microsoft introduces Drasi, an open-source data processing system. It is designed to simplify detecting critical events within complex infrastructures and automatically taking action based on these events. Drasi achieves this by providing a framework for event-driven architectures, enabling developers to define which changes to track and automate responses based on those changes. This streamlined approach eliminates the need for complex, inefficient, and error-prone manual methods, allowing businesses to gain real-time actionable insights and respond to changing conditions quickly and effectively. The post highlights the challenges of managing complex systems. It emphasizes the benefits of Drasi's lightweight approach to change detection, continuous query evaluation, and flexible reactions, which can be customized to suit various business needs.

## Generative AI

* [Data Formulator: Exploring how AI can help analysts create rich data visualizations][2]. This article from the Microsoft Research Blog introduces Data Formulator, an open-source research project that leverages AI to simplify creating data visualizations. It highlights the challenges of using AI in data visualization, particularly the need for intuitive and flexible tools that allow users to combine AI-powered precision with hands-on control. Data Formulator addresses these challenges by integrating user interface (UI) interactions with natural language input, enabling users to iteratively refine their visualizations through user actions and AI-driven code generation. The article explains how Data Formulator's unique architecture separates data transformation from chart configuration, resulting in a more efficient and user-friendly experience. It also explores the potential of Data Formulators for improving human-AI collaboration in data analysis and visualization while acknowledging the need for further research to address challenges like cleaning unstructured data and defining clear analysis goals.
* [MotleyCrew: A Flexible and Powerful AI Framework for Building Multi-Agent AI Systems][3]. This article introduces MotleyCrew, a novel multi-agent AI framework designed to address the limitations of traditional frameworks. Traditional approaches often need help with centralized control, scalability, and flexibility, making them inadequate for real-world applications involving complex, dynamic environments. MotleyCrew, on the other hand, adopts a decentralized architecture, allowing agents to make decisions autonomously based on local information, thereby enhancing scalability and efficiency. This framework boasts a modular design, enabling easy integration with existing systems and customization for various applications. Its key components include the Agent Manager, the Agent Communication System, and the Environment module, which work together to facilitate seamless coordination and communication between agents. The framework has demonstrated promising results across diverse applications, such as coordinating autonomous vehicles and managing robotic swarms, highlighting its potential to revolutionize multi-agent AI systems.
* [OpenAI unveils easy voice assistant creation at 2024 developer event][4]. This post provides an overview of OpenAI's annual DevDay event, explicitly focusing on the 2024 edition. The event, now a global series, showcases new API features and tools for developers to integrate OpenAI's AI models into their applications. The highlight of this year's event is the Realtime API, which allows developers to easily build voice assistants by streamlining the complex process of speech recognition, text processing, and text-to-speech conversion into a single API call. The article also highlights OpenAI's continued efforts to improve affordability and efficiency for developers through features like model distillation and prompt caching. Additionally, the text explores the absence of a keynote by CEO Sam Altman, who delivered a primary address at the previous year's event. This absence, the article suggests, could be attributed to the company's recent controversies and a focus on emphasizing the technology rather than a specific individual. Finally, the article concludes with Altman's optimistic statement regarding the company's progress and future direction towards achieving human-level artificial intelligence.
* [New AutoGen Architecture Preview][5]. The source describes a significant update to AutoGen, a framework for building AI systems. The authors discuss the limitations of the previous version (0.2) and how user feedback informed the development of a new architecture (0.4) based on the actor model of computing. This new architecture prioritises composability, flexibility, debugging and observability, and scalability through an event-driven system. The source outlines the key components of AutoGen 0.4, including the core libraries, and encourages the community to contribute to the development of this new version, which is currently in preview. The authors also announce a new community forum on GitHub Discussions for future discussions.
* [Promptriever: Instruction-Trained Retrievers Can BePrompted Like Language Models][6]. This paper introduces Promptriever, a novel retrieval model that can be instructed and prompted in a similar way to large language models (LLMs). Unlike traditional retrieval models which rely on a single semantic similarity score, Promptriever can dynamically adapt its notion of relevance based on natural language instructions. The authors achieve this by creating a new instance-level instruction training set based on MS MARCO, encompassing nearly 500,000 query-passage relevance pairs augmented with diverse, free-form instructions. They demonstrate that Promptriever achieves strong performance on standard retrieval tasks and significantly outperforms existing models in instruction-following tasks, particularly when it comes to robustness to lexical choices and query phrasing. Moreover, they show that Promptriever can be reliably improved by zero-shot prompting, highlighting its potential for aligning LLM prompting techniques with information retrieval. The paper highlights the value of instruction-training in boosting the performance and flexibility of retrieval models, opening up new avenues for developing more controllable and user-friendly information retrieval systems.
* [CopilotKit's CoAgents: The Missing Link that Makes It Easy to Connect LangGraph Agents to Humans in the Loop][7]. The source discusses a newly developed omni-modal large language model (LLM) called EMOVA. This model represents a breakthrough in AI research by seamlessly integrating vision, language, and speech capabilities, unlike previous models which were primarily focused on either vision and language or speech and language. The main advantage of EMOVA is its ability to process and generate outputs across all three modalities simultaneously, allowing it to engage in natural interactions, understand visual cues, interpret vocal instructions, and respond coherently in text and speech formats. EMOVA achieves this through a unique architecture that incorporates a continuous vision encoder and a speech-to-unit tokenizer, allowing for end-to-end processing of speech and visual inputs. Furthermore, EMOVA’s semantic-acoustic disentanglement mechanism separates the meaning of spoken content from its style attributes, allowing for the generation of speech with various emotional tones, crucial for real-time spoken dialogue systems. This advanced model has shown impressive performance on multiple benchmarks, surpassing existing models in both speech-language and vision-language tasks, marking a significant advancement in the field of AI research.
* [Introducing canvas][8]. OpenAI has introduced a new feature called "Canvas" for their language model ChatGPT. Canvas is a new interface designed for collaborative writing and coding projects, going beyond simple chat-based interactions. This interface allows users to work side-by-side with ChatGPT, editing and revising content in real-time. Canvas is powered by GPT-4o, which has been specifically trained to understand the context of projects and offer targeted feedback and suggestions. It offers a range of shortcuts for tasks like editing length, changing reading level, adding emojis, reviewing code, adding logs, and more. OpenAI highlights how Canvas was built to facilitate collaboration, with the model trained to understand when to trigger the canvas for specific tasks and to make targeted edits rather than completely rewriting content. The effectiveness of this training is demonstrated through a series of internal evaluations, highlighting the model's ability to generate relevant content and improve writing and coding quality. This release marks a significant step in the development of ChatGPT's user interface and demonstrates OpenAI's focus on making AI more useful and accessible through collaborative interactions.
* [How to Choose the Architecture for Your GenAI Application][9]. This Towards Data Science article by Lak Lakshmanan provides a framework for choosing the right architecture for a Generative AI (GenAI) application. It focuses on balancing the creativity required from the Large Language Model (LLM) with the risk associated with generating content that could be inaccurate, biased or toxic. The framework outlines eight architectural patterns that address different combinations of creativity and risk: from simple, low-risk options like generating content on demand or caching responses to more complex approaches like fine-tuning the LLM or building guardrails to mitigate multiple risks. The author emphasises the importance of understanding these different architectural patterns and choosing the one that best suits the specific use case in terms of creativity, risk, cost and latency.

## WIND (What Is Niels Doing)

A week or so ago, a colleague, [**Dean Martin**][deanm], spoke lyrically about this new AI tool from Google: [**NotebookLM**][10]. He told me how he used it to create podcasts summarizing papers, books, etc.

I decided to have a look at it and see if it could be useful for me. I have been using it for a few days now, and I must say I am impressed. It is a great tool for summarizing papers, blog posts, etc. While I was writing this post I thought about whether I could create a podcast based on the blog post - or rather, based on the underlying posts.

And yes, it is possible: 

<iframe title="Interesting Stuff - Week 40, 2024" allowtransparency="true" height="150" width="100%" style="border: none; min-width: min(100%, 430px);height:150px;" scrolling="no" data-name="pb-iframe-player" src="https://www.podbean.com/player-v2/?i=hfp23-16f7aec-pb&from=pb6admin&share=1&download=1&rtl=0&fonts=Arial&skin=1&font-color=auto&logo_link=episode_page&btn-skin=7" loading="lazy"></iframe>

Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here](https://nielsitberglund.podbean.com/e/interesting-stuff-week-40-2024/).

I hope you find it useful. Please let me know if you have any suggestions for improvements.

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post or [ping][ma] me if you have suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/
[charlblog]: https://charlla.com/

[jovpop]: https://twitter.com/JovanPop_MSFT
[bobw]: https://twitter.com/bobwardms
[revod]: https://twitter.com/revodavid
[lonny]: https://twitter.com/sqL_handLe
[ewtw]: https://twitter.com/sqlOnIce
[buckw]: https://twitter.com/BuckWoodyMSFT
[mattw]: https://twitter.com/matthewwarren
[murba]: https://twitter.com/muratdemirbas
[daveda]: https://twitter.com/davidthecoder
[adcol]: https://twitter.com/adriancolyer
[jesrod]: https://twitter.com/jrdothoughts
[tomaz]: https://twitter.com/tomaz_tsql
[dataart]: https://twitter.com/dataartisans
[luis]: https://twitter.com/luis_de_sousa
[benstop]: https://twitter.com/benstopford
[conflu]: https://twitter.com/confluentinc
[tylert]: https://twitter.com/tyler_treat
[andrewng]: https://twitter.com/AndrewYNg
[lawr]: https://twitter.com/bytezn
[jue]: https://twitter.com/b0rk
[yan]: https://twitter.com/theburningmonk
[danny]: https://twitter.com/g9yuayon
[rmoff]: https://www.linkedin.com/in/robinmoffatt/
[ryansw]: https://twitter.com/ryanswanstrom
[pabloc]: https://twitter.com/pabloc_ds
[mklep]: https://twitter.com/martinkl
[mdavey]: https://twitter.com/matt_davey
[jboner]: https://twitter.com/jboner
[joeduff]: https://twitter.com/funcOfJoe
[charl]: https://twitter.com/charllamprecht
[dbricks]: https://twitter.com/databricks
[adsit]: https://twitter.com/SitnikAdam
[vicky]: https://twitter.com/vickyharp
[dscentral]: https://twitter.com/DataScienceCtrl
[natemc]: https://twitter.com/natemcmaster
[ads]: https://twitter.com/azuredatastudio
[travw]: https://twitter.com/radtravis
[emilk]: https://twitter.com/IsTheArchitect
[netflx]: https://netflixtechblog.com/
[hubert]: https://www.linkedin.com/in/hkdulay/
[jserra]: https://www.linkedin.com/in/jamesserra/
[lemi]: https://www.linkedin.com/in/lemimasalu/
[michael]: https://www.linkedin.com/in/michaeladrianjohnson/
[deanm]: https://www.linkedin.com/in/deanmartinza/


[1]: https://www.microsoft.com/en-us/research/blog/data-formulator-exploring-how-ai-can-help-analysts-create-rich-data-visualizations/
[2]: https://www.microsoft.com/en-us/research/blog/data-formulator-exploring-how-ai-can-help-analysts-create-rich-data-visualizations/
[3]: https://www.marktechpost.com/2024/09/30/motleycrew-a-flexible-and-powerful-ai-framework-for-building-multi-agent-ai-systems
[4]: https://arstechnica.com/information-technology/2024/10/openai-unveils-easy-voice-assistant-creation-at-2024-developer-event/
[5]: https://microsoft.github.io/autogen/blog/2024/10/02/new-autogen-architecture-preview/
[6]: https://arxiv.org/pdf/2409.11136
[7]: https://www.marktechpost.com/2024/10/02/copilotkits-coagents-the-missing-link-that-makes-it-easy-to-connect-langgraph-agents-to-humans-in-the-loop/
[8]: https://openai.com/index/introducing-canvas/
[9]: https://towardsdatascience.com/how-to-choose-the-architecture-for-your-genai-application-6053e862c457
[10]: https://notebooklm.google.com/

