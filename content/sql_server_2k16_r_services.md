---
layout: page
---

# SQL Server R Services Series TOC

Microsoft released **SQL Server 2016** mid 2016 and with the release came quite a few new features:

* **Query Store**.
* **Temporal tables**.
* **JSON** support.
* Other "cool stuff".

Among the other "cool stuff" was the introduction of **SQL Server 2016 R Services**, an in-database analytics engine for processing R script on resident data within a database engine instance.

> **NOTE:** Since the introduction of **Microsoft SQL Server 2016 R Services**, the functionality has been renamed to **Microsoft SQL Server Machine Learning Services**. Also, SQL Server 2017 introduced Python as an additional supported language.

At around the same time when SQL Server 2016 was released I had become interested in Data science and R, so SQL Server R Services intrigued me. I decided to try and figure out how the R integration worked, and at the same time - through blog-posts - document what I found out. I started the "journey" in the beginning of 2017 and I thought I might be able to come up with a couple of blog-posts, maybe maximum five or six. Boy was I wrong - over a year and 23 posts later I decided "enough was enough" and wrote the final post.

## Table of Content

1. [Microsoft SQL Server 2016 R Services Installation][sinst] - Installation of SQL server R Services.
1. [Microsoft SQL Server R Services - Internals I][si1] - What happens in the SQL Server engine when we execute `sp_execute_external_script`.
1. [Microsoft SQL Server R Services - Internals II][si2] - We look at what goes on inside the launchpad service when we execute `sp_execute_external_script`.
1. [Microsoft SQL Server R Services - Internals III][si3] - Creation of processes in the Launchpad service.
1. [Microsoft SQL Server R Services - Internals IV][si4] - More about process creation in the Launchpad service; number of processes etc.
1. [Microsoft SQL Server R Services - Internals V][si5] - The Launchpad service and RTerm processes in relation to parallelism in SQL Server R Services.
1. [Microsoft SQL Server R Services - Internals VI] [si6] - This post looks at the directories created by the Launchpad service in SQL Server R Services when executing an external script.
1. [Microsoft SQL Server R Services - Internals VII][si7] - We look at the files and sub-directories created when we execute `sp_execute_external_script`.
1. [Microsoft SQL Server R Services - Internals VIII][si8] - Here we look at some of the components the launchpad service loads; `Rterm.exe`, `BxlServer.exe`, etc.
1. [Microsoft SQL Server R Services - Internals IX][si9] - We look at SqlSatellite and communication between SQL Server R Services components.
1. [Microsoft SQL Server R Services - Internals X][si10] - In this post we look at how SQL server sends data to the SqlSatellite.
1. [Microsoft SQL Server R Services - Internals XI][si11] - What are the two strange TCP/IP packets SQL Server sends to SqlSatellite?
1. [Microsoft SQL Server R Services - Internals XII][si12] - More about the TCP/IPpackets sent from SQL Server to SqlSatellite.
1. [Microsoft SQL Server R Services - Internals XIII][si13] - In this post we look at when SQL statements are executed when executing external scripts?
1. [Microsoft SQL Server R Services - Internals XIV][si14] - The first post of a couple looking at the Binary eXchange Language (**BXL**) format.
1. [Microsoft SQL Server R Services - Internals XV][si15] - More about Binary eXchange Language and packet sizes.
1. [Microsoft SQL Server R Services - Internals XVI][si16] - Binary eXchange Language format and data coming back to SQL Server from SqlSatellite.
1. [Microsoft SQL Server R Services - Internals XVII][si17] - We look at what happens inside SQL Server when data is returned from SqlSatellite.
1. [Microsoft SQL Server R Services - Internals XVIII][si18] - A look at how output parameters are handled in SQL Server R Services.
1. [Microsoft SQL Server R Services - Internals XIX][si19] - Here we look at how print statements in the external engine together with ack messages comes back to SQL Server.
1. [Microsoft SQL Server R Services - Internals XX][si20] - This post drills down into how error messages in the external engine is handled by SQL Server.
1. [Microsoft SQL Server R Services: sp_execute_external_script - I][sext1] - The first post of three looking at parameters for `sp_execute_external_script`.
1. [Microsoft SQL Server R Services - sp_execute_external_script - II][sext2] - In this post we look at the `@params` and `@parameter1` parameters in `sp_execute_external_script`. 
1. [Microsoft SQL Server R Services: sp_execute_external_script - III][sext3]  - In this final post in the series we look at the `@parallel` and `@r_rowsPerRead` parameters, as well as discussing the SQL server Compute Context.
 

[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[si2]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
[si3]: {{< relref "2017-04-13-microsoft-sql-server-r-services---internals-iii.markdown" >}}
[si4]: {{< relref "2017-04-23-microsoft-sql-server-r-services---internals-iv.markdown" >}}
[si5]: {{< relref "2017-05-01-microsoft-sql-server-r-services---internals-v.markdown" >}}
[si6]: {{< relref "2017-05-16-microsoft-sql-server-r-services---internals-vi.markdown" >}}
[si7]: {{< relref "2017-07-11-microsoft-sql-server-r-services---internals-vii.markdown" >}}
[si8]: {{< relref "2017-07-22-microsoft-sql-server-r-services---internals-viii.markdown" >}}
[si9]: {{< relref "2017-08-18-microsoft-sql-server-r-services---internals-ix.markdown" >}}
[si10]: {{< relref "2017-08-29-microsoft-sql-server-r-services---internals-x.markdown" >}}
[si11]: {{< relref "2017-10-20-microsoft-sql-server-r-services---internals-xi.markdown" >}}
[si12]: {{< relref "2017-10-31-microsoft-sql-server-r-services---internals-xii.markdown" >}}
[si13]: {{< relref "2017-11-11-microsoft-sql-server-r-services---internals-xiii.markdown" >}}
[si14]: {{< relref "2017-11-25-microsoft-sql-server-r-services---internals-xiv.markdown" >}}
[si15]: {{< relref "2017-12-02-microsoft-sql-server-r-services---internals-xv.markdown" >}}
[si16]: {{< relref "2017-12-24--microsoft-sql-server-r-services---internals-xvi.markdown" >}}
[si17]: {{< relref "2018-01-03-microsoft-sql-server-r-services---internals-xvii.markdown" >}}
[si18]: {{< relref "2018-01-10-microsoft-sql-server-r-services---internals-xviii.markdown" >}}
[si19]: {{< relref "2018-01-20-microsoft-sql-server-r-services---internals-xix.markdown" >}}
[si20]: {{< relref "2018-02-02-microsoft-sql-server-r-services---internals-xx.markdown" >}}
[sext1]: {{< relref "2018-03-07-microsoft-sql-server-r-services-sp_execute_external_script-I.markdown" >}}
[sext2]: {{< relref "2018-03-11-microsoft-sql-server-r-services---sp-execute-external-script---ii.markdown" >}}
[sext3]: {{< relref "2018-03-21-microsoft-sql-server-r-services---sp-execute-external-script---iii.markdown" >}}
