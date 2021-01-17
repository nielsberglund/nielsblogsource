---
type: post
layout: "post"
title: "SQL Server 2019 External Libraries and Your Python Runtime"
author: nielsb
date: 
comments: true
highlight: true
draft: true
categories:
  - SQL Server 2019
  - SQL Server Machine Learning Services
  - SQL Server Extensibility Framework
tags:
  - SQL Server Machine Learning Services
  - SQL Server 2019
  - Python
  - SQL Server Extensibility Framework
description: 
keywords:
  -   
---

The last month or so I have written some blog posts about how Microsoft open-sourced the SQL Server language extensions for R and Python back in September 2020.  These language extensions add to the Java extension which was open-sourced in March 2020. My posts have been about bringing your own Python runtime into SQL Server 2019, and the potential pitfalls you may encounter:

* [**Bring Your Own R & Python Runtimes to SQL Server Extensibility Framework**][1]
* [**Write a Python 3.9 Language Extension for SQL Server Machine Learning Services**][2]
* [**Solve Python Issues in SQL Server Machine Learning Services After Deploying Python 3.9**][3]

In the [first post][1] we looked at how to use the open-sourced extension and run on a later 3.7 version of Python than what is installed with SQL Server Machine learning Services. The following looked at how to recompile the language extension from the open-source code. We would need to do this if we wanted to use another Python version than 3.7.x, as the binary release, (the dll), of the language extension is version specific, (3.7.0 - 3.7.9). 



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



[1]: {{< relref "2020-12-29-bring-your-own-r--python-runtimes-to-sql-server-extensibility-framework.md" >}}
[2]: {{< relref "2021-01-05-write-a-python-39-language-extension-for-sql-server-machine-learning-services.md" >}}
[3]: {{< relref "2021-01-09-solve-python-issues-in-sql-server-machine-learning-services-after-deploying-python-39.md >}}
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