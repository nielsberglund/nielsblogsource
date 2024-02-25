---
type: post
layout: "post"
title: Interesting Stuff - Week 08, 2024
author: nielsb
date: 2024-02-25T09:51:01+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-08-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-08-24.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - LLMs
description: "In this week's blog: We explore groundbreaking Generative AI innovations, from Andrej Karpathy's minbpe to OpenAI's Sora, and beyond. Discover how Meta's TestGen-LLM and the 'Mind Mapper' project are pushing the boundaries of technology and AI. Join me on a journey through the latest in AI that's reshaping our digital landscape."
---

This week's journey through the realm of Generative AI has been nothing short of exhilarating. 

From Andrej Karpathy's enlightening dive into Byte Pair Encoding with minbpe to the revolutionary strides in video creation by OpenAI's Sora, we're witnessing a new era of innovation. 

Meta's TestGen-LLM is redefining software testing, while the "Mind Mapper" project showcases the power of network analysis and LLMs in extracting complex knowledge. Join me as we explore these groundbreaking advancements that are setting new benchmarks in the field of AI and technology.


<!--more-->

## Generative AI

* [minbpe][1]. In this GitHub repository, Andrej Karpathy presents a minimalistic and clean implementation of the Byte Pair Encoding (BPE) algorithm, widely utilized in the tokenization process of Large Language Models (LLMs). This repository stands out for its straightforward approach, making the complex BPE algorithm accessible and understandable. It's an invaluable resource for developers and researchers interested in natural language processing, offering insights into the inner workings of tokenization in LLMs. The repository's focus on clarity and minimalism helps demystify a critical component of LLM architecture. Oh, I came across this from a [LinkedIn post][3] by [Theo Martin][4].
* [How OpenAI's Sora is Changing the Game: An Insight into Its Core Technologies][2]. This Medium article discusses OpenAI's latest innovation, Sora, and how it is making waves as a groundbreaking technology capable of generating videos from textual prompts. Unveiled on February 15, 2024, Sora represents a significant leap forward, building on the momentum created by the earlier release of ChatGPT in late 2022. The technology's name, "Sora," which translates to "sky" in Japanese, hints at its lofty ambitions and potential, although its naming's intentional nature remains unconfirmed. This article delves into the technical underpinnings and research that fuel Sora, promising to be a pivotal moment in the evolution of content creation.
* [Automated Unit Test Improvement using Large Language Models at Meta][5]. This paper presents an innovative approach to enhancing the quality of unit tests in software development at Meta Platforms Inc. The authors introduce TestGen-LLM, a tool that leverages Large Language Models (LLMs) to automatically extend and improve existing human-written Kotlin test classes for Android applications. This tool not only generates additional test cases to cover previously missed corner cases but also ensures that these enhancements provide measurable improvements over the original tests without regressing existing functionalities. The deployment of TestGen-LLM during Meta's test-a-thons for Instagram and Facebook platforms demonstrated significant success, with a notable percentage of the generated test cases being integrated into production, highlighting the potential of LLMs in automating and improving software testing processes at scale.
* [Let's build the GPT Tokenizer][6]. More "stuff" from Andrej Karpathy. The Tokenizer is a necessary and pervasive component of Large Language Models (LLMs), where it translates between strings and tokens (text chunks). Tokenizers are a completely separate stage of the LLM pipeline: they have their own training sets, training algorithms (Byte Pair Encoding), and after training, implement two fundamental functions: `encode()` from strings to tokens and `decode()` back from tokens to strings. In this YouTube lecture, Andrej Karpathy, builds from scratch the Tokenizer used in the GPT series from OpenAI. In the process, he points out that many weird behaviors and problems of LLMs trace back to tokenization. He goes through a number of these issues, discusses why tokenization is at fault, and why someone out there ideally finds a way to delete this stage entirely. Awesome video, and I can wholeheartedly agree with one of the comments made about the video: *I'm amazed at the times we live in. One of the top AI experts in the world is sharing free tutorials and teaches technologies in great detail including examples and code.*
* [Beyond RAG: Network Analysis through LLMs for Knowledge Extraction][7]. This article introduces an innovative data science project named "Mind Mapper." This project leverages the Retrieval-Augmented Generation (RAG) framework and Large Language Models (LLMs) like GPT-4 to create a more dynamic way of navigating and understanding knowledge through network analysis. The Mind Mapper tool is designed to ingest various forms of text, including audio, and utilizes an SQLite database and the Upstash vector database for efficient data management. By chunking text and analyzing it with LLMs, the tool constructs knowledge graphs that offer insightful visualizations of relationships and entities within the data. The project, accessible as a Streamlit application, demonstrates a practical application of combining state-of-the-art AI technologies to enhance knowledge extraction and comprehension.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. Please comment on this post or [ping][ma] me if you have ideas for what to cover.

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

[1]: https://github.com/karpathy/minbpe
[2]: https://towardsdatascience.com/how-openais-sora-is-changing-the-game-an-insight-into-its-core-technologies-bd1ad17170df
[3]: https://www.linkedin.com/posts/theomart_andrej-karpathy-released-a-new-repo-breaking-activity-7164990207975501824-SD8G/
[4]: https://www.linkedin.com/in/theomart/
[5]: https://arxiv.org/pdf/2402.09171.pdf
[6]: https://www.youtube.com/watch?v=zduSFxRajkE
[7]: https://towardsdatascience.com/beyond-rag-network-analysis-through-llms-for-knowledge-extraction-4d107eb5282d
