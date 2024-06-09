---
type: post
layout: "post"
title: Interesting Stuff - Week 23, 2024
author: nielsb
date: 2024-06-09T09:57:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-23-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-23-24.jpg"
categories:
  - roundup
tags:
  - causal
  - Generative AI
  - Kafka
  - Streaming
description: "This week's blog covers Netflix's use of causal inference, the advantages of small language models, and dynamic prompting for AI adaptability. We also highlight best practices for reliable GenAI apps and guide you on integrating Flink SQL, Streamlit, and Kafka for real-time data applications. Dive in for the latest insights!"
---

This week's tech roundup delves into Netflix's advanced use of causal inference for data-driven decision-making, the efficiency of small language models over larger counterparts, and the importance of dynamic prompting for domain adaptation. 

Additionally, we explore the Generative AI Handbook for learning resources and best practices for reliable GenAI apps. Lastly, discover how to integrate Flink SQL, Streamlit, and Kafka for real-time data applications. Dive into these insights to stay ahead in the tech landscape!

<!--more-->

## Data Science

* [Round 2: A Survey of Causal Inference Applications at Netflix][1]. Netflix's latest blog post dives into their advanced use of causal inference to enhance decision-making across various aspects of their service. By leveraging methods like synthetic control and causal models, Netflix can simulate scenarios to understand the impacts of changes, such as delayed dubbing on viewing habits. This sophisticated approach ensures that their strategies are data-driven and effective in improving user experience and engagement. In my view, integrating causal inference into business strategies highlights how crucial data science is in today's competitive landscape. This methodology optimises operations and ensures that decisions are backed by solid evidence, leading to more reliable outcomes.

## Generative AI

* [Tiny Titans: How Small Language Models Outperform LLMs for Less][2]. This blog post underscores the potential and cost-effectiveness of small language models (SLMs) over large language models (LLMs). SLMs, trained on specific high-quality datasets for singular tasks, often outperform LLMs in accuracy and performance while being more computationally efficient. This approach paves the way for on-device AI applications, enhancing accessibility and privacy. Small models like Salesforce's xGen-Mobile are optimised for tasks such as customer support and field services, sparking excitement about the future of AI, where less can indeed be more in many business scenarios.
* [A Deep Dive into Fine-Tuning][3]. This Towards Data Science blog post is an insightful article on domain adaptation, with a focus on the technique of dynamic prompting. This method enhances the performance of large language models (LLMs) by adapting them to new domains without extensive retraining. Dynamic prompting involves guiding the model with carefully crafted prompts to improve its output on domain-specific tasks, ensuring high accuracy and relevance. I find this approach particularly exciting as it offers a practical solution to one of the biggest challenges in machine learning: generalizing models to perform well across diverse applications. By leveraging dynamic prompting, businesses can maximize the utility of their existing LLMs, reducing the need for costly retraining while maintaining high performance. This is a significant step forward in making AI more adaptable and cost-effective, opening up new possibilities for its use in various industries.
* [Efficient and Scalable Tool Usage for LLM Agents][4]. In this blog post, Towards Data Science explores efficient and scalable methods for leveraging tools within large language model (LLM) agents. The post underscores the importance of integrating external tools and utilities to enhance the capabilities of LLMs. Using techniques like zero-shot reasoning and dynamic tool selection, LLM agents can effectively manage complex tasks while maintaining high efficiency and scalability. The notion of scalable tool usage is particularly relevant in today's AI landscape, where the demand for versatile and powerful AI agents is ever-increasing. Integrating external tools not only expands the functionality of these models but also allows for more specialized and precise outputs, making them invaluable in various business and technical applications. This highlights the role of these tools in enhancing the capabilities of LLMs and their potential in various industries.
* [Extracting Concepts from GPT-4][5]. OpenAI's recent research focuses on enhancing the interpretability of GPT-4 by using sparse autoencoders to identify 16 million human-interpretable patterns. These patterns, or features, help decompose the complex internal representations of the model, making it easier to understand and analyze its behaviour. This approach promises to improve AI safety and reliability by providing more precise insights into the model's decision-making processes. This effort to demystify neural networks is a crucial step towards building more transparent and trustworthy AI systems, paving the way for broader and safer applications in various fields.
* [Generative AI Handbook: A Roadmap for Learning Resources][6]. The Generative AI Handbook offers a comprehensive guide to understanding modern AI systems. It organizes high-quality resources like blog posts, videos, and academic papers into a structured, textbook-style format. The handbook covers essential AI topics, from foundational machine learning concepts to advanced generative models, aiming to fill the knowledge gaps for those with a technical background. It's designed to be a living document, continuously updated to reflect new innovations and paradigms in AI.
* [5 Best Practices for Building Reliable GenAI Apps][7]. This New Stack post outlines five key best practices for creating reliable generative AI applications. Firstly, capturing expert knowledge and updating it regularly ensures that the AI's reasoning engine remains accurate and relevant. Embracing event-driven architecture enhances the responsiveness and efficiency of AI apps. Additionally, continuously streaming data between large language models (LLMs) and reasoning engines is crucial for maintaining up-to-date performance. Utilizing cloud-native architecture also significantly boosts scalability and reliability.

## Streaming

* [How to Use Flink SQL, Streamlit, and Kafka: Part 1][8]. Confluent's guide demonstrates integrating Flink SQL, Streamlit, and Kafka to build a real-time data application. Part 1 covers setting up a data pipeline where market data is streamed from the Alpaca API to Kafka, processed with Flink SQL, and visualized using Streamlit. This setup allows for live, interactive data displays, ideal for monitoring stock prices. The process highlights the power of combining these technologies for efficient and dynamic data handling.

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

[1]: https://netflixtechblog.com/round-2-a-survey-of-causal-inference-applications-at-netflix-fd78328ee0bb
[2]: https://www.salesforce.com/blog/small-language-models/
[3]: https://towardsdatascience.com/stepping-out-of-the-comfort-zone-through-domain-adaptation-a-deep-dive-into-dynamic-prompting-4860c6d16224
[4]: https://towardsdatascience.com/efficient-scalable-tool-usage-for-llm-agents-4359aff32438
[5]: https://openai.com/index/extracting-concepts-from-gpt-4/
[6]: https://genai-handbook.github.io/
[7]: https://thenewstack.io/5-best-practices-for-building-reliable-genai-apps/
[8]: https://www.confluent.io/blog/how-to-use-flinksql-streamlit-kafka-part-1/
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:

<!-- [postref]: {{< relref "file_name_incl_ext" >}} -->

<!-- [series1]: [SQL Server R Services](/sql_server_2k16_r_services) -->
<!-- [series2]: [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) -->
<!-- [series3]: [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) -->


<!-- [findstr]: findstr /I <word_to_find> * -->
<!-- [findstr]: findstr /I /c:<"phrase to find"> * -->