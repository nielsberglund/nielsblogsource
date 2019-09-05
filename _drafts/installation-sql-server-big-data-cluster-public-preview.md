---
type: post
layout: "post"
title: Installation SQL Server Big Data Cluster Public Preview
author: nielsb
date: 
comments: true
highlight: true
draft: true
categories:
  - SQL Server 2019
  - SQL Server 2019 Big Data Cluster
tags:
  - SQL Server 2019 Big Data Cluster
  - Kubernetes
  - Azure Kubernetes Service
  - Azure Data Studio
  - Spark
  - Hadoop
  - Python
  - Azure South Africa
description: 
keywords:
  -   
---

SQL Server 2019 CTP 3.2 was released a week or two ago. This release had two major new "features" for me:

* Azul OpenJDK is included and can be installed together with SQL Server
* **SQL Server Big Data Cluster** is now in public preview. You no longer need to sign up for the SQL Server 2019 Early Adoption Program, (EAP).

I wrote about the Azul OpenJDK in the post [SQL Server 2019 CTP3.2 & Java][1], and in this post I cover installation of the **SQL Server 2019 Big Data Cluster**, (BDC), on **Azure Kubernetes Service** (AKS).

Some of you may remember that I, back in November, 2018, did a post about how to install **SQL Server 2019 BDC** on Azure. However, quite a few things have changed since then, so I thought it would be good to do another post about installation. In that post I installed the BDC in the West Europe Azure region. Since that post, Microsoft opened two new Azure Data Centers here in South Africa: South Africa North in Johannesburg, and South Africa West in Cape Town. Both data centers offer AKS, so in this post I install to South Africa North.

<!--more-->







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
[ba]: https://twitter.com/bob_albright


<!--
  post reference
  [pkg1]: {{< relref "" >}}
-->  



[1]: 2019-08-03-sql-server-2019-ctp32--java.md
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:   

<!--
[series1]: <> [SQL Server R Services](/series/sql_server_2k16_r_services)
[series2]: <> [Install R Packages in SQL Server ML Services](/series/sql_server_ml_services_install_packages)
[series3]: <> [sp_execute_external_script and SQL Server Compute Context](/series/spees_and_sql_compute_context)
-->

<!--
[findstr]: <> findstr /I \<word_to_find\> *
-->