---
layout: post
title: SQL Server Machine Learning Services and SQL Server 2017 CU7
author: nielsb
date: 2018-06-01T19:43:01+02:00
comments: true
categories:
  - SQL Server
  - Microsoft R Server
  - Microsoft Machine Learning Server
  - Data Science
  - SQL Server R Services
  - SQL Server Machine Learning Services 
tags:
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - R
  - Python
  - SQL Server 2017 CU7
  - Process Monitor
  - SQL Server Machine Learning Services permission issues
description: We look at how we can fix issues with the R engine after installing SQL Server 2017 CU7.
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - R
  - Python
  - SQL Server 2017 CU7
  - Process Monitor
  - SQL Server Machine Learning Services permission issues   
---

This post is as much for you as it is for me to come back to when I wonder what to do when SQL Serer Machine Learning Services all of a sudden stops working after a SQL Server upgrade. 

## Background

Last week I did a complete reformat of my development box at home and installed the latest version of Windows 10: the 1803 build, also called the April 2018 update.

> **NOTE:** I usually try to reformat my box at least twice a year, to ensure it is not too "bogged" down by old "cruft", and that it has the latest and greatest.

After the reformat I installed all my necessary applications, among them SQL Server 2017 with the in-database analytics components (R and Python). After installation I tested that it all worked and made sure I could execute my usual test scripts for `sp_execute_external_script`:

```sql
EXEC sp_execute_external_script   @language = N'R'
                                , @script = N'd <- 42'
```
**Code Snippet 1:** *Test Script for R*

The "moral" equivalent to *Code Snippet 1* in Python also worked without an issue:

```python
EXEC sp_execute_external_script   @language = N'Python'
                                , @script = N'd = 42'
```                                
**Code Snippet 2:** *Test Script for Python*

Cool, all is "A-OK"! A couple of days go by, and I see that there is a Cumulative Update (CU) for SQL Server 2017 - CU7. I install it and does not think much about it. I mean: "what can go wrong, how hard can it be?". A couple of days later and I am busy writing the follow-up post to [sp_execute_external_script and SQL Compute Context - I][ctx1] when I try to execute `sp_execute_external_script`, and it falls over!

<!--more-->

> **NOTE:** If you do not know what CU's are, you can read more about them [here][1].

## Exception

The exception I received when I tried to execute `sp_execute_external_script` looked like so:

![](/images/posts/sql_ml_sql_cu7_error1.png)

**Figure 1:** *Exception when Executing*

As we see in *Figure 1* the exception has something to do with not being able to create a directory, which points to permission issues. This, kind of, resonated with me as I had in the back of my mind that something similar happened in the early days of SQL Server 2016 R Services when R stopped working after service packs were applied. Regardless I did some investigation around the issue (read I Googled) and found [this][2] post by Jon Culp and also a post by my old friend [Greg Low][3]. Both posts mention the 8.3 file naming convention as the primary culprit for the error. However, seeing that this worked fine before I applied CU7, I did not believe that the 8.3 file names were the case.  Having said that, I did (to be sure) enable the 8.3 notation as per [Jon Culp's][2] post: `fsutil.exe behaviour set disable8dot3 0`. Unfortunately, that did not change anything because when I executed the code in *Code Snippet 1* it still errored out with the error in *Figure 1*. 

All this pointed me back to the error being due to permission issues. 

## Permissions

Ok, so above we said permission issues, but permissions on what? 

If you read my series about [SQL Server 2016 R Services](/sql_server_2k16_r_services) you may remember that in [Internals - VI][si6] and [Internals - VII][si7] we discussed how the Launchpad service and the RTerm processes create files and directories in the `ExtensibilityData` directory and its sub directories. This directory is where the permissions are supposed to be or, as in this case, are not.

> **NOTE:** In a default installation of SQL Server on a Windows box, the `ExtensibilityData` directory is located at `C:\<sql_instance_path>\MSSQL\ExtensibilityData`.

When you navigate the `ExtensibilityData` directory in *File Explorer* and look at the *Advanced Security Settings for ExtensibilityData* dialog you see something like so in an installation where everything works:

![](/images/posts/sql_ml_sql_cu7_permissions1.png)

**Figure 2:** *Permissions on ExtensibilityData*

In *Figure 2* we see the various users, groups and roles that have access to the `ExtensibilityData` directory and the highlighted part is the group that is of interest for this discussion. What is interesting is that when you look at this dialog before CU7 (when everything works) and after you deploy CU7, it looks the same. So, something is going on behind the scenes.

To further confirm that what I saw was a permission issue I used *Process Monitor* to see what file operations happened when I tried to execute the code in *Code Snippet 1*. After gradually filtering out events I ended up with was is shown in the figure below.

> **NOTE:** If you are interested in how you can use *Process Monitor* I covered that in [Internals - VII][si7].

![](/images/posts/sql_ml_sql_cu7_procmon1.png)

**Figure 3:** *Process Monitor Output*

Remember how we in the **Internals** posts [IV][si4] and [VII] [si7] in the [SQL Server R Services](/sql_server_2k16_r_services) series discussed how the Launchpad service creates RTerm processes. We also discussed how the RTerm processes create directories and files under the `ExtensibilityData` directory and its sub-directories. So what we see in *Figure 3* is how the RTerm processes cannot write to the root of the `ExtensibilityData` directory and this is what ultimately causes the error in *Figure 1*.

What I saw when I filtered out events was that even though the RTerm processes could not write to the root of the `ExtensibilityData` directory, they could write to subdirectories:

![](/images/posts/sql_ml_sql_cu7_procmon2.png)

**Figure 4:** *Successful Writes*

So based on what we see in *Figure 3* and *Figure 4* it seems like something has gone awry with permissions for the root of the `ExtensibilityData` directory. How to fix this?

## Fix

I must confess that I initially added *Everyone* with *Full control* to the security settings for the `ExtensibilityData` directory and it all worked:

![](/images/posts/sql_ml_sql_cu7_permissions2.png)

**Figure 5:** *Everyone Full Control*

However that did not seem like the correct way to do it, so I started playing around with the "Advanced" security properties on the `ExtensibilityData` directory:

![](/images/posts/sql_ml_sql_cu7_sec_properties.png)

**Figure 6:** *Security Properties*

In *Figure 6* we see how I have right clicked on the `ExtensibilityData` directory in *File Explorer* and chosen properties and then clicked on the *Security* (highlighted in the figure). The group that we work with is the `MSSQLLaunchpad`, outlined in red.

> **NOTE:** If you work on a SQL instance other than the default the group name is `MSSQLLaunchpad$instance_name`.

When I click on the "Advanced" button (also outlined in red in *Figure 6*) I see something like so:

![](/images/posts/sql_ml_sql_cu7_enable_inh.png)

**Figure 7:** *Advanced Security Settings*

In the "Advanced Security Settings" dialog in *Figure 7* I clicked on "Enable inheritance" (outlined in red) followed by "Apply", which showed an error dialog:

![](/images/posts/sql_ml_sql_cu7_enable_inh_1.png)

**Figure 8:** *Error Dialog*

I clicked on "Continue" and the error repeated for each subdirectory in the `ExtensibilityData` directory. After last error I was back in the "Advanced Security Settings" dialog where I saw something strange:

![](/images/posts/sql_ml_sql_cu7_enable_inh_2.png)

**Figure 9:** *Additional Security Principals*

What I saw was quite a few new security principals added to the security settings for the directory, and we see them outlined in red in *Figure 9*. I clicked OK until I exited all dialogs. Now, when I tried to execute the R code, it succeeded. However, I was not happy with the added principals, so I went back into the "Advanced Security Settings" dialog:

![](/images/posts/sql_ml_sql_cu7_disable_inh_1.png)

**Figure 10:** *Disable Inheritance* 

In the dialog as we see in *Figure 10* I clicked on the "Disable inheritance" button. When I clicked "Apply" the "Block Inheritance" dialog "popped up":

![](/images/posts/sql_ml_sql_cu7_convert_inh_1.png)

**Figure 10:** *Block Inheritance*

In the "Block Inheritance" dialog I clicked on the outlined part in *Figure 10*: "Convert inherited permissions ...", and the same error dialog as we see in *Figure 8* came up. As I did above, I clicked through the errors through the "Continue" button, and when I was back in the "Advanced Security Settings" dialog I saw that the added security principals were no longer there. That is not true, one principal from the added ones was still there, and that was `MSSQLSERVER`. I removed it and clicked OK out of the remaining dialogs. When I executed the code, it all worked, Yay!

## Summary

Above we see how I managed to fix the issue how R did not work in SQL Server 2017 after I had applied CU7. The steps I took:

1. Right-click on the `ExtensibilityData` directory and choose properties.
1. In properties click on the "Security" tab and then the "Advanced" button.
1. In the "Advanced Security Settings" dialog click "Enable inheritance" followed by "Apply".
1. In the error dialogs that appear click continue until you are back in the "Advanced Security Settings" dialog, and there you click OK out of all dialogs.
1. At this stage, you can execute the R code without any exceptions.
1. Go back into the "Advanced Security Settings" dialog and click "Disable inheritance" and "Apply".
1. In the "Block Inheritance" dialog chose "Convert inherited permissions ...".
1. "Continue" through the error dialogs until you are back in the "Advanced Security Settings" dialog.
1. In the "Advanced Security Settings" dialog "Remove" the `MSSQLSERVER` principal.

Oh, and I can warmly recommend the blogs I mention above by [Jon Culp][4] and [Greg Low][5].

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright



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

[ctx1]: {{< relref "2018-05-20-sp-execute-external-script-and-sql-compute-context.markdown" >}}

[1]: https://blogs.msdn.microsoft.com/sqlreleaseservices/announcing-the-modern-servicing-model-for-sql-server/
[2]: http://jonculp.com/2017/01/resolve-sql-server-fatal-error-cannot-create-r_tempdir/
[3]: https://blog.greglow.com/2018/05/16/machine-learning-testing-your-installation-of-r-and-python-in-sql-server-2017/
[4]: http://jonculp.com/
[5]: https://blog.greglow.com/
