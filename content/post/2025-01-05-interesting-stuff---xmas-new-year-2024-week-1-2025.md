---
type: post
layout: "post"
title: Interesting Stuff - Xmas, New Year 2024, Week 1 2025
author: nielsb
date: 
comments: true
highlight: true
draft: false
image: "/images/banner/posts/<file_name_incl_ext>"
thumbnail: "/images/thumbnails/posts/<file_name_incl_ext>"
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
description: Weekly roundup of what interesting stuff I have read in blogs etc.
---



<!--more-->

<!--
## Podcast

If you rather listen to the summary:



Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here]().
-->



## AI/ML

* [Understanding the Mathematics of PPO in Reinforcement Learning][4]. This post by Manelle Nouar dives into the mathematical underpinnings of Proximal Policy Optimization (PPO) in reinforcement learning. PPO, a favourite among RL practitioners, strikes a balance between exploration and exploitation while ensuring stability in policy updates. Using innovative techniques like clipping functions and generalized advantage estimation (GAE), PPO avoids large, destabilizing updates and ensures efficient learning. *My thoughts:* My favorite part is the introduction of entropy as a deliberate mechanism to encourage exploration. This clever addition prevents agents from prematurely settling on suboptimal strategies, a brilliant nod to the unpredictability of real-world environments. It's a reminder of how much thought goes into balancing exploration with exploitation in AI. Nouar's breakdown of Markov Decision Processes (MDPs) and the policy gradient theorem is also a highlight for those looking to understand RL fundamentals. Overall, this article offers a crisp yet profound look at why PPO remains a cornerstone in reinforcement learning research. Have you worked with PPO, or are there other RL algorithms you find more exciting? Let's discuss!

## Data & AI

* [Data and AI in 2025: Looking Beyond the Hype][1]. In this post, Dunith Danushka explores the evolving landscape of Data and AI in 2025, emphasizing trends like the rise of Small Language Models (SLMs), on-device AI, and multi-agent AI workflows. SLMs, with their compact design and domain-specific capabilities, are positioned to redefine efficiency and privacy, particularly in industries like healthcare and finance. Meanwhile, advancements in AI hardware and neuromorphic computing pave the way for Sovereign AI, promoting privacy and reducing reliance on cloud infrastructures. Danushka also highlights the growing dominance of Apache Iceberg in data engineering, poised to become the universal table format with innovations like Role-Based Access Control (RBAC) and materialized views. The development of Graph RAG systems, combining retrieval-augmented generation with knowledge graphs, hints at a future where AI can handle complex, multimodal queries with precision. *My thoughts:* What struck me most was the focus on AI observability—a crucial component as organizations move from experimentation to full-scale AI implementation. The emphasis on ensuring models remain cost-effective, fair, and compliant reflects a maturing industry striving for responsible AI deployment. This thoughtful exploration underscores the dynamic shifts in AI and data engineering. Which trend do you think will impact your work the most in 2025? 

## Generative AI

* [Did o3 Just Reach AGI?][2]. Louis-François Bouchard, in this post,  examines OpenAI's latest reasoning models, o3 and o3-mini, which have set new records on several benchmarks, including the ARC-AGI benchmark designed to assess general intelligence. These models demonstrate astonishing reasoning capabilities, achieving 88% on ARC-AGI under high-compute settings—a significant leap from GPT-4o's 5%. What caught my attention was the discussion about the trade-offs between computational costs and human equivalency. While o3's low-compute mode costs $17–20 per task, the trajectory of efficiency improvements could make these models economically competitive with human performance in a short time. It raises fascinating questions about the future of reasoning models in professional environments. The post also reflects on the rapid evolution from multi-agent frameworks like MetaGPT to single-prompt systems capable of complex outputs. The implications for software development, education, and problem-solving are profound. Are we witnessing the dawn of Artificial General Intelligence (AGI), or is this just another step in AI's extraordinary evolution?
* [Getting Started With Agentic Workflows][3]. This post by Omer Mahmood introduces the concept of agentic workflows, a transformative approach to automating complex processes using AI agents. These workflows move beyond traditional automation by leveraging agents capable of reasoning, decision-making, and improving over time. Mahmood highlights the shift from AI tools that assist humans to fully autonomous systems capable of executing high-value tasks independently. The post also explores software tools like Phidata, Project Mariner, and Vellum, which enable the development of agentic workflows. Each platform offers unique capabilities, from visual drag-and-drop interfaces to multi-agent orchestration. Mahmood emphasizes the potential for these systems to revolutionize productivity and decision-making in enterprise settings. The post also explores software tools like Phidata, Project Mariner, and Vellum, which enable the development of agentic workflows. Each platform offers unique capabilities, from visual drag-and-drop interfaces to multi-agent orchestration. Mahmood emphasizes the potential for these systems to revolutionize productivity and decision-making in enterprise settings. *My thoughts:* I found the modularity of these workflows fascinating. They allow agents to plan, execute, and refine tasks while integrating human feedback and memory systems. This evolution promises scalable and adaptive solutions for industries ranging from customer service to manufacturing and healthcare. Agentic workflows seem poised to reshape how we approach automation. Do you agree?
* [aiXplain Introduces a Multi-AI Agent Autonomous Framework for Optimizing Agentic AI Systems Across Diverse Industries and Applications][5]. This article introduces aiXplain Inc.'s Multi-AI Agent Autonomous Framework, designed to optimize agentic AI systems across various industries. The framework enables autonomous refinement by leveraging large language models like Llama 3.2-3B and implementing iterative feedback loops, addressing inefficiencies in traditional, manual configurations. Its scalability, adaptability, and ability to align outputs with dynamic objectives stand out. The framework's core strengths lie in its ability to reduce variability and enhance metrics like clarity and relevance by an average of 30%. It underscores how domain-specific agents and iterative refinement can unlock new levels of efficiency and adaptability. *My thoughts:* What impressed me most were the real-world applications. For example, the framework improved a Market Research Agent by incorporating specialized roles like Market Analyst, increasing clarity and relevance scores from 0.6 to 0.9. Similarly, a Medical Imaging Agent achieved better compliance and patient-centred design by adding agents like Regulatory Specialist and Patient Advocate. Agentic AI systems are clearly advancing rapidly. Do you see these innovations driving transformation in your field?
* [Top AI Stories of 2024! Agents Rise, Prices Fall, Models Shrink, and more...][6]. This post by Andrew Ng reflects on the remarkable advancements in AI throughout 2024, spotlighting the rise of agentic systems, the shrinking of models, and a significant reduction in costs. Agentic AI, which empowers systems to act autonomously, gained traction with tools like Autogen and Meta's Llama Stack and improvements in multi-agent workflows. These developments promise more personalized and efficient applications, a trend likely to dominate in 2025. What intrigued me was the push toward smaller, more efficient models. Techniques like knowledge distillation and quantization enabled the creation of compact models like Google's Gemma 2 and Microsoft's Phi-3, making advanced AI accessible even on low-powered devices. This democratization of AI is a game-changer for on-device applications. Additionally, price wars among major providers have drastically reduced costs. For example, OpenAI's GPT-4o saw price drops up to 90% since its release. This competitive landscape, bolstered by open-source contributions, is reshaping the economics of AI, making high-performance models affordable and fueling innovation across industries. The post closes with optimism for the future of AI. 

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

[1]: https://levelup.gitconnected.com/data-and-ai-in-2025-looking-beyond-the-hype-4b8ee4c724ac?sk=v2%2F1d2dffb5-4f2c-48cd-b1d8-7b07c0046c82
[2]: https://pub.towardsai.net/did-o3-just-reach-agi-915f45e18468?sk=v2%2Fd4e0c84e-3b23-4ce5-b881-6d4914b0de10
[3]: https://pub.towardsai.net/getting-started-with-agentic-workflows-9703ac6ded62?sk=v2%2F8932dab9-9461-4eae-af3a-fe81d640c595
[4]: https://towardsdatascience.com/understanding-the-mathematics-of-ppo-in-reinforcement-learning-467618b2f8d4
[5]: https://www.marktechpost.com/2024/12/28/aixplain-introduces-a-multi-ai-agent-autonomous-framework-for-optimizing-agentic-ai-systems-across-diverse-industries-and-applications/
[6]: https://www.deeplearning.ai/the-batch/issue-281/
[7]:
[8]:
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