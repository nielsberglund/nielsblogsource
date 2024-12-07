---
type: post
layout: "post"
title: Interesting Stuff - Week 48, 2024
author: nielsb
date: 2024-12-01T09:56:05+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-48-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-48-24.jpg"
categories:
  - roundup
tags:
  - Generative AI
description: "This week: we look at groundbreaking advancements in Generative AI, AI agents, and foundation models. From Tealium and Databricks' real-time insights to LangChain's framework for building AI applications, these innovations are reshaping the AI landscape. Explore how technologies like Foundry and GPT-4 are driving adoption while tackling real-world challenges."
---

This week's roundup explores cutting-edge developments in Generative AI, AI agents, and foundation models. From Tealium and Databricks' partnership driving real-time customer insights to LangChain's innovative framework for building AI-powered applications, the advancements are shaping the future of AI adoption. 

Highlights include the SQL Generation Showdown, Foundry's vision of an AI agent OS, and Microsoft's strategies for scaling massive models like GPT-4. Dive in for insights on how these technologies push boundaries while addressing real-world challenges.

<!--more-->

## Podcast

If you rather listen to the summary:

<iframe title="Interesting Stuff - Week 48, 2024" allowtransparency="true" height="150" width="100%" style="border: none; min-width: min(100%, 430px);height:150px;" scrolling="no" data-name="pb-iframe-player" src="https://www.podbean.com/player-v2/?i=9qxk9-17626c0-pb&from=pb6admin&share=1&download=1&rtl=0&fonts=Arial&skin=1&font-color=&logo_link=episode_page&btn-skin=7" loading="lazy"></iframe>

Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here](https://nielsitberglund.podbean.com/e/interesting-stuff-week48-2024/).

## Generative AI

* [Tealium and Databricks: Providing Real-Time Insights and AI-Driven Customer Experiences][1]. This post by Databricks and Tealium delves into how Tealium leverages Databricks to power its Customer Data Platform (CDP) for real-time insights and AI-driven customer experiences. The integration enables comprehensive customer profiles by unifying data across digital and offline channels, personalizing interactions with predictive ML models, and deploying cutting-edge GenAI applications. Notably, the collaboration prioritizes data privacy and security, addressing regulatory challenges while fostering real-time engagement. The piece also highlights Databricks' contributions, including its end-to-end collaborative environment for data processing, AI model development, and enhanced scalability. Features like Databricks Mosaic AI and Unity Catalog allow for enriched data governance and customer profile management. *My thoughts:* The emphasis on consent-based data collection and real-time activation showcases a thoughtful approach to balancing innovation and compliance. It's fascinating how tools like Databricks Mosaic AI transform raw data into actionable insights, creating a win-win for businesses and customers. What are your thoughts on the growing role of privacy in real-time customer engagement?
* [The SQL Generation Showdown: Testing Top AI Models][2]. In this post, Harika Govada in Towards AI takes a deep dive into the SQL generation capabilities of top AI platforms—ChatGPT Plus, Claude, Gemini Advanced, and Perplexity Pro—using real-world financial scenarios. The study evaluates their performance across tasks like query generation, optimization, and predictive analytics using messy datasets from 130 companies over a 5-year span. Claude emerged as the frontrunner with an impressive 39/40 points, excelling in technical SQL proficiency and financial domain understanding. ChatGPT Plus demonstrated notable strengths in query optimization, slashing execution times by over 50%, but struggled with financial-specific complexities. Perplexity Pro showcased strong fundamentals but was hampered by file size limitations. Meanwhile, though capable of simpler tasks, Gemini Advanced fell short in handling complex financial analyses and predictive modelling. The analysis reveals key risks, such as varying interpretations of base metrics for growth rates, silent data loss due to improper join strategies, and oversimplifications of complex financial relationships. *My thoughts:* The evaluation not only highlights the evolving role of AI in data analysis but also underscores the importance of domain expertise to complement AI capabilities. Considering how these tools could evolve to balance technical precision with contextual understanding is intriguing. How do you see AI's role shifting in financial analysis over the next few years?
* [Meet Foundry: An AI Startup that Builds, Evaluates, and Improves AI Agents][3]. This post by Shobha Kakkar introduces Foundry, a Y Combinator-backed startup aiming to be the "Operating System" for AI agents. Foundry simplifies the creation, deployment, and management of autonomous AI agents by offering no-code tools for non-developers and advanced customization capabilities for developers. These agents handle tasks like customer support and workflow automation powered by large language models such as GPT-4. Key features include intuitive debugging tools, real-time monitoring for trust and transparency, and seamless integration with existing enterprise systems like CRMs and ERPs. Foundry's focus on accessibility and scalability, combined with its emphasis on AI governance and compliance, sets it apart in the competitive AI automation market. *My thoughts:* Foundry's approach highlights a shift toward democratizing AI agent development while ensuring robust control mechanisms. Its vision of creating a cohesive ecosystem for AI automation could redefine how businesses approach AI-powered solutions. Could this be the breakthrough needed to make AI agents mainstream across industries?
* [Advances in run-time strategies for next-generation foundation models][4]. This paper by Microsoft Research explores the latest advancements in runtime strategies for next-generation foundation models, emphasizing their role in optimizing efficiency and performance. As foundation models like GPT-4 continue to grow in size and complexity, runtime innovations are crucial for deploying these models effectively across diverse use cases. Key advancements discussed include Dynamic Model Pruning, Adaptive Execution, Energy Efficiency, Integration with Specialized Hardware, and Context-Aware Inference. These strategies address challenges like computational load, energy consumption, and user experience in real-world applications. Notably, the paper highlights the need for adaptive execution techniques that allow models to adjust computation paths based on input complexity, ensuring optimal performance. *My thoughts:* These innovations signal a paradigm shift toward making massive foundation models more accessible and scalable for real-world applications. The focus on sustainability and adaptive execution aligns well with growing demands for responsible AI. What other breakthroughs do you think are necessary to ensure foundation models remain viable as they scale? 
* [Getting Started with LangChain: Building Applications with Large Language Models Part I][5]. This post by a colleague of mine, [Talent Qwabe][6], is the first part of a series about using LangChain to build applications with LLMs. The post highlights LangChain's ability to orchestrate multiple LLMs and external data sources within a single application, showcasing its key components like the LLM module, prompt templates, chains for linking processes, and indexes for external data access. The text emphasizes LangChain's versatility and ease of use, enabling developers to build complex NLP applications efficiently, from chatbots to summarisation tools, and detailing its supporting tools, LangServe and LangSmith. Ultimately, the post advocates for LangChain as a powerful and versatile tool for harnessing the full potential of LLMs. *My thoughts:* First of all Talent is just that, a talent, and I am so impressed with what he is doing. I will definitely follow his postings. So, what about LangChain; LangChain's user-centric approach to LLM development could democratize access to advanced AI capabilities, enabling developers to quickly build innovative applications. How do you see platforms like LangChain shaping the future of AI application development?

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

[1]: https://www.databricks.com/blog/tealium-databricks-ai-driven-cdp
[2]: https://pub.towardsai.net/the-sql-generation-showdown-testing-top-ai-models-58e547781724
[3]: https://www.marktechpost.com/2024/11/26/meet-foundry-an-ai-startup-that-builds-evaluates-and-improves-ai-agents/
[4]: https://www.microsoft.com/en-us/research/blog/advances-in-run-time-strategies-for-next-generation-foundation-models/
[5]: https://medium.com/@siphumelelotqwabe/getting-started-with-langchain-building-applications-with-large-language-models-part-i-65dfab66341b
[6]: https://www.linkedin.com/in/siphumelelo-talent-qwabe/
