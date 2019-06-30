---
layout: post
title: SQL Server 2017 - Python Executing Inside SQL Server
author: nielsb
date: 2017-04-20T20:49:08+02:00
comments: true
categories:
  - SQL Server
  - Data Science 
tags:
  - SQL Server R Services
  - R
  - RevoScaleR
  - Python
  - Julia
description: Python in SQL Server 2017. Here we have a brief look at the Python support in SQL Server 2017.
keywords:
  - SQL Server R Services
  - R
  - RevoScaleR
  - Python
  - Julia   
---

On April 19, 2017 Microsoft held an on-line conference **Microsoft Data Amp** to showcase how Microsoft’s latest innovations put data, analytics and artificial intelligence at the heart of business transformation. The keynotes speakers were [Scott "Red Shirt" Guthrie][sc] who is an *Microsoft Executive Vice President* (fairly high on the food-chain), and [Joseph Sirosh][js] a *Corporate Vice President*, head of the Information Management and Machine Learning group. Joseph probably knows a thing or two about data, and Scott - well, Scott knows **A LOT**!

During the keynotes, Scott and Joseph shared how Microsoft’s latest innovations put data, analytics and artificial intelligence at the heart of business transformation. A big enabler for this is **SQL Server 2017** (the "artist" formerly known as SQL Server V.Next), which introduces a lot of very cool new "stuff". 

The keynote speeches were followed by recorded short:ish sessions drilling down into certain aspects of Microsoft's new offerings. If you are interested in the various presentations at **Microsoft Data Amp**, they all are on [Channel 9][amp].

What caught my eye was the announcement of how **SQL Server 2017** now supports Python as an extensible script engine. When Microsoft introduced support for R in SQL Server 2016, rumors immediately surfaced how other engines also would be supported, where Python was high on the list ([Julia][1] another one).

Seeing that I am somewhat into **SQL Server R Services** (the SQL Server 2016 flavor) [here][sinst], [here][si1], [here][si2], [here][si3], and more posts to come, I really had to have a look. 

The rest of this post is a brief introduction to executing Python code in **SQL Server 2017**, in essence I just want to be able to execute some sort of Python code.

<!--more-->

## Installation

The installation steps of external scripts engines doe not differ much (at all) from the installation in SQL Server 2016, apart from the fact you now can install Python. So if you feel you need more information abut the install process, please go and read my [**Microsoft SQL Server 2016 R Services Installation**][sinst] post.

I downloaded the **SQL Server 2017** CTP 2.0, and after battling trying to register (I assume a couple of other people had the same idea as myself), I managed to get an `iso` down to my machine and installed it as an instance. During *Feature Selection* at installation time we can see that the promise of Python was not a lie. It is part of *Machine Learning Services*, as in *Figure 1*:

![](/images/posts/sql2k17_python_install.png)

**Figure 1:** *Python Option In Database*

Looking further we also see how Python can be installed as a stand-alone engine:

![](/images/posts/sql2k17_python_standalone.png)

**Figure 2:** *Python Option In Database*

The stand-alone installation option is useful, for example,if a data scientist want to run Python (or R) on his or her own machine.

> **NOTE:** You may wonder why, in *Figure 2*, the check boxes for R as well as Python is checked, but "dimmed" out? This is because, on this particular machine, I have already installed the standalone versions once.

OK, so after successful installation, and if you have installed the SQL Server engine, R services and Python services you should see something like so in the `C:\path_to_instance` folder:

![](/images/posts/sql2k17_python_directories.png)

**Figure 3:** *Finished Install*

Now, let's test this "shiny new thing out". Oh, in this post I leave out all "grunge" about the launchpad service, etc. If you are interested go ahead and read about it in the [previously mentioned post][sinst].

## Execute Python Code in SQL Server 2017

After we have done the installation, but before we can execute the Python (or R) code we need to enable the execution of external scripts. As I covered in the post [**Microsoft SQL Server 2016 R Services Installation**][sinst] you enable external scripts by changing the configuration as in *Code Snippet 2* **AND** restarting the instance.

``` sql
EXEC sp_configure  'external scripts enabled', 1 
RECONFIGURE  WITH OVERRIDE  
```
**Code Snippet 2:** *Execute sp_configure*

After having enabled everything let's execute `sp_execute_external_script`. The code is very, very basic - more or less the least what we can get by with for Python. It does have some similarities with the code in the [**Microsoft SQL Server 2016 R Services Installation**][sinst] post, and *Code Snippet 2* shows the code:

``` sql
EXEC sp_execute_external_script 
@language =N'Python',
@script= N'print("The Answer Is 42!!!")';
GO 
```
**Code Snippet 3:** *Test That Python Installation Works*

In *Code Snippet 3*, we say that the language is Python (the `@language` parameter), and that the script we want to execute is a Python print statement: `print("The Answer Is 42!!!")`. That's all!

When executing this, something like so should be printed out in the *Messages* tab in **SQL Server Management Studio**:

![](/images/posts/sql2k17_python_execution_result.png)

**Figure 4:** *Result from Python Execution*

We have now executed our first Python code in **SQL Server 2017**. Just for "giggles", let us ensure that we still can execute R code:

``` sql
EXEC sp_execute_external_script  @language =N'R', 
                                 @script=N'OutputDataSet<-InputDataSet', 
                                 @input_data_1 =N'SELECT 42' 
      WITH RESULT SETS (([TheAnswer] int not null));  
GO 
```
**Code Snippet 4:** *Test That Execution of R Still Works*

That *should* work, and you will see something like so:

![](/images/posts/r_result_set.png)

**Figure 5:** *Result of Execution of R Script*

That seemed to work OK, let's ship it!

## Summary

We have in this post seen how **SQL Server 2017** introduces support for execution of Python in addition to R scripts. There is obviously a lot more to the above than what I have covered in the above, and I will definitely come back to both Python as well as R in future posts.

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[si2]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
[si3]: {{< relref "2017-04-13-microsoft-sql-server-r-services---internals-iii.markdown" >}}
[amp]: https://channel9.msdn.com/Events/Data-Science/Microsoft-Data-Amp-2017
[js]: https://social.technet.microsoft.com/Profile/Joseph%20Sirosh
[sc]: https://en.wikipedia.org/wiki/Scott_Guthrie
[1]: https://julialang.org/
