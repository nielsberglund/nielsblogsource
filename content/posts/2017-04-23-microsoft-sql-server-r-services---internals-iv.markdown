---
layout: post
title: Microsoft SQL Server R Services - Internals IV
author: nielsb
date: 2017-04-23T14:42:01+02:00
comments: true
categories:
  - SQL Server
  - Microsoft R Server
  - Data Science
  - SQL Server R Services Series
  - SQL Server R Services
  - SQL Server Machine Learning Services
tags:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - RTerm.exe
description: Launchpad service, number of processes, process pool. More about process creation in the launchpad service
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - RTerm.exe   
---

This is the fifth post in a series about **Microsoft SQL Server R Services**, and the fourth post that drills down into the internal of how it works. To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

In [Internals - III][si3], I wrote about how the launchpad service creates multiple processes when executing an external script. 

Seeing that some of the conclusions I came to was somewhat educated guesses, I asked you guys to correct me where I was in-correct and/or add more information. After that post - Bob Albright ([@bob_albright][ba]) - wrote me an email and pointed me to some resources around process creation, as well as some demo code. Thanks Bob!

So today we'll drill even further into the creation of processes, and see how they are used.

<!--more-->

## Recap

In [Internals - III][si3], we talked about how, during installation of an R enabled SQL Server instance, 20 Windows accounts are created. These accounts are created for the purpose to be able to provide isolation between users when executing external scripts.

In addition to the Windows user accounts created during installation, folders named as the individual Windows accounts are also created in the `c:\<sql_instance_path>\MSSQL\ExtensibilityData` folder. These folders act as storage for files, results, objects, etc., during execution of an external script. 

When a user executes an external script in SQL Server, that account is being mapped to one of the 20 Windows account created, and it is under that Windows account the external part of the script is executed. Subsequently the files, etc., mentioned above, ends up in that folder somewhere. I write somewhere, because it is not entirely correct to say that the files, results, etc., are stored directly in the user folder. They are in fact stored in sub-folders of the user folder.

During execution the launchpad service creates working directories (the sub-folders above) and processes, and assigns the working directories and processes the same names (`Guid` values).

*Figure 1* below shows the flow when executing a script:

![](/images/posts/sql-launchpad_processes_post.png)

**Figure 1:** *Flow when Executing a Script*

As per the figure:

* We see backing folders in `c:\<sql_instance_path>\MSSQL\ExtensibilityData` for the group of user accounts that are mapped to SQL Server users when executing code via `sp_execute_external_script`. 
* When executing, `launchpad!CLaunchContext::LaunchServTask` is called, and a satellite session and a session object is created.
* Then the working directories (the sub-folders mentioned above), and RTerm processes are created. In the figure the working directories are named `WorkingDir1` etc., whereas in reality the names are `Guid` values. The processes are RTerm processes and are assigned the same `Guid` as the working directory name. So a RTerm process always executes "under" one user account sub-folder.
* After two initial directories and processes have been created, one of the two processes are assigned to the created session.
* When the process has been assigned to the session, the script is executed via; `launchpad!CSQLSatelliteCommunication::SendResumeWithLoginInfo` and `launchpad!CSQLSatelliteConnection::WriteMessage`. This normally happens while the third process is created.
* Processes and working directories 4 - 6 are created. These processes are available for subsequent executions.
* When the execution has finished the session is torn down together with the process.
    * At this stage we now have 5 processes running, and 5 working folders. 

The above is in essence what [Internals - III][si3] covered, and if you want all the "nitty-gritty", please read that [post][si3].

## Processes

In the [Internals - III][si3], we figured out that, by default, the launchpad service creates 5 processes, plus the process that is used for execution, when executing an external script. In the post I assumed that the reason for creating 5 (well 6 actually), was for performance, and I also wondered where that magic number 5 came from - seeing I couldn't find it in any config files. That's where [Bob's][ba] email comes in, as he pointed me to a [blog-post][1] by the [SQL Server engineering][2] team, a.k.a TIGER (cool name!). 

So, that particular blog-post mentions that the number of processes spun up can be controlled by a setting in the `rlauncher.config` file: `PROCESS_POOL_SQLSATELLITE_GROWTH`. If not set, it defaults to 5, and in the end, when executing, the setting + 1 processes has been created as per above. 

The post also "kind of" confirms that my assumption about performance being a reason for spinning up multiple processes is correct, considering that a user may execute concurrent requests and it takes around 100 ms to spin up a process. In [Internals - III][si3] I mentioned how the processes that are created are added to a pool of processes. So, the  assumption on my part is that when there are multiple processes available, a new request will not execute on a newly created process, but will use a process from the pool.

Let us see if we can confirm the points about the config setting as well as performance.

### Controlling Number of Processes

Initially we'll begin with looking into the `PROCESS_POOL_SQLSATELLITE_GROWTH` setting and see if it has any effect on the number of processes being created. In [Internals - III][si3] we looked at the number of processes having been spun up while the code was executing and we saw something like so:

![](/images/posts/sql-launchpad-rterm_processes.png)

**Figure 2:** *RTerm Processes*

So 6 processes alive while the code is executing. After the code has finished, the executing process is torn down, and we have 5 processes in the pool. That was without having changed any settings, so let's change the settings:

1. Stop the launchpad service.
1. Open the `rlauncher.config` file with your text editor of choice (you need to run the editor as administrator).

The config file looks something like what you see in *Figure 3*:

![](/images/posts/sql_r_services_rlauncher_config.png)

**Figure 3:** *RLauncher Configuration*    

As you see, there is no `PROCESS_POOL_SQLSATELLITE_GROWTH` setting. Let us add the setting with a value of 15: `PROCESS_POOL_SQLSATELLITE_GROWTH=15` and see what happens.

1. Save the config file after you have added the setting as per above.
1. Restart the launchpad service.

Well, it looks like the launchpad service started, so the setting is not causing any issues (yet). We'll now execute some code and try and figure out if more processes will be created. We use the same code as we did in [Internals - III][si3], where the code has a pause statement, so we can easier look at what is happening:

``` sql
EXEC sp_execute_external_script 
                    @language =N'R',
                    @script=N'OutputDataSet<-InputDataSet;
                              Sys.sleep(120);',
                    @input_data_1 =N'SELECT 42'
WITH RESULT SETS (([TheAnswer] int not null));
```
**Code Snippet 1:** *Execute with Sys.sleep*

As in [Internals - III][si3], I use [*Process Explorer*][3] from **Sysinternals**. So, let's go ahead and see what happens:

1. Start *Process Explorer*, order by Process, and scroll down to where you see process names starting with "RT" (on my box there are none at this stage), or where those processes should be.
    * If you at this stage see RTerm, restart the launchpad service again and kill those processes.
1. Execute the code in *Code Snippet 1*.

While the code is running, take a quick look in *Process Explorer*, and you should see something like so:

![](/images/posts/sql_r_services_rterm_processes15.png)

**Figure 4:** *RTerm Processes after Setting Change*

In *Figure 4* you can now see 16 `RTerm.exe` processes running. Once again, the reason for 16 instead of 15 is that the launchpad service spins up the number it is supposed to, plus one more. After the execution has finished, you will see 15 RTerm processes. 

So yes, the setting does have impact. If you want, you can now delete the setting from the config file and restart the launchpad service.

### Process Pool Impact on Executions from the Same Session / Concurrent Executions

Above I mentioned that I thought that by spinning up these processes, we'll get a performance benefit when executing concurrently or if we are, under the same `SPID`, doing subsequent executions. After all, as mentioned above, the processes are added to a process pool, and they should then be available for usage. A bit like connection pooling in ADO.NET or thread pooling in the .CLR.


#### Same Session Multiple Execs

Let us start with looking what happens when doing multiple executions in the same SQL Server session (`SPID`).

So the way we will do this is to look at the process id of the RTerm processes, and the process id of the executing code. The process id's of the RTerm process we get from *Process Explorer*, and in *Figure 5* below you see the process id's in the outlined column furthest to the right:

![](/images/posts/sql_r_services_rterm_processids.png)

**Figure 5:** *RTerm ProcessId's*

*Figure 5* tells us how we can see the id's of the RTerm processes, but how can we see the process id under which the code executes? It's not like we have `@@SPID` in the external engine. Fortunately R has a function to get the process id of the process in which the code is executing: `Sys.getpid()`. So if we change the code to something like in *Code Snippet 2*, we should be able to see the process id, and then be able to compare what we see from the RTerm processes:

``` sql
EXEC sp_execute_external_script 
                    @language =N'R',
                    @script=N'
                    pid <- Sys.getpid()
                    data<-InputDataSet
                    data$pid <- pid
                    OutputDataSet<-data;
                    Sys.sleep(120);',
                    @input_data_1 =N'SELECT 42'
WITH RESULT SETS (([TheAnswer] int not null, ProcessID int));
```
**Code  Snippet 2:** *Get the Process Id*

Notice how we create and add a new column, `pid`, to the R data-frame, `data`, by: `data$pid` (the names `pid` and `data`could be anything). Now, the way we will do this is to, in the same session:

* Execute the code
* Capture the process id's of the created RTerm processes, before the code has finished executing.
* Look at the result from executing the code in *Code Snippet 2* and compare the process id which is part of the result with the process id's we captured from the RTerm processes.

When we have done the steps above we repeat it a second time. If my assumption is correct that during a subsequent execution, a process will be used from the pool that was created at first execution; then the process id that comes back from the result of the second execution, should be found in the process id's that were captured during the first execution. 

> **NOTE:** It is important that the second run of the code is done immediately after the first. If not, some of the pooled processes may have been torn down.

Let's do this:

* If you haven't deleted the `PROCESS_POOL_SQLSATELLITE_GROWTH` setting from the config file, go ahead and do that.
* Restart the launchpad service.
* Navigate to the `Launchpad.exe` process in *Process Explorer*.
* Execute the code in *Code Snippet 2*.
* While the code is executing capture the process id's from the `RTerm.exe processes`.

The capture of the first execution is shown in *Figure 6* below:

![](/images/posts/sql_r_services_rterm_processids_executing.png)

**Figure 6:** *Process Id's from First Run*

The result from the code came back with a process id of 16956. If you were to look at the processes directly after the result came back, you would see 5 processes, as process 16956 (the executing process) has been torn down. Now execute the code a second time. The captured processes are now like so:

![](/images/posts/sql_r_services_rterm_processids_executing2.png)

**Figure 7:** *Process Id's from Second Run*

In *Figure 7* we indeed see that process 16956 is not there any more. When the result comes back the process id is 19028 as in *Figure 8*:

![](/images/posts/sql_r_services_rterm_processids_result2.png)

**Figure 8:** *Result from 2:nd Run*

So, looking back at *Figure 6*, we see how process id 19028 is part of the processes initially created, so it seems that the assumptions about how processes are used are correct. 

But wait a second when we look at *Figure 8*, we see a new process id - 19192, and if we were to look at the processes right after the code has finished running, it would look something like so:

![](/images/posts/sql_r_services_rterm_processids_after_executing2.png)

**Figure 9:** *After 2:nd Run*

In *Figure 9* we see that the process that we executed under in the second run is gone as expected, but we have a new process running - 19192. So what happens is that, in parallel with R executing the code, the launchpad service is spinning up a new process.

The theory that for executions by the same user and `SPID` - the launchpad service uses processes from the pool seems to be correct.

#### Concurrent Executions Different Sessions

To see what happens for concurrent executions, by the same user but from different `SPID`'s, we'll do it in almost the same way as above. Start with restarting the launchpad service, so we don't have any "hangers on-ers" from previous runs. We copy the code in *Code Snippet 2* to a new query window in *SQL Server Management Studio*, (this ensures a new `SPID`), and then we:

1. Execute the code in query window 1.
1. Capture the RTerm process id's.
1. Execute the code in query window 2, while the code in query window 1 still executes.
1. Capture the RTerm process id's.

After both queries have finished executing, you will see that executing concurrently from the same user but different sessions will behave the same was as executing multiple times from the same session:

1. A process will be picked up from the pool and the code will execute under that session.
1. The launchpad service creates a new process, and adds it to the pool.
1. When the code has finished executing, the process which it executed under is being torn down,

So the theory holds true here as well.

#### Concurrent Executions Different Sessions Different Users

So what happens then if there are multiple users executing code concurrently? In this scenario nothing is different from when a single user executes for the first time:

* The second user will be mapped to another user account,
* The launchpad service creates it's normal 5 processes, plus one.
* The code is executed. 

![](/images/posts/sql_r_services_rterm_processids_mult_users.png)

**Figure 10:** *Two Users Executing Concurrently*

*Figure 10* shows what it looks like in *Process Explorer* when two different users executes concurrently. I either of these users would then execute another statement, it would be exactly as above where we looked at the single user scenario.

> **NOTE:** When looking in *Process Explorer* at the RTerm processes you can actually see what process is active. The active process has a value in the *CPU* column.

## Summary

In this blog-post I set out to prove/disprove two things:

1. That the setting `PROCESS_POOL_SQLSATELLITE_GROWTH` can be used to control the number of processes being created by the launchpad service.
1. Processes that are added to the pool is being picked up and used for subsequent executions for a user.

What we saw was:

* When `PROCESS_POOL_SQLSATELLITE_GROWTH` is absent from the `rlauncher.config` file, the launchpad service creates 5 processes plus 1 by default, and after execution the executing process is torn down. The others are added to the pool.
* When a value has been set for `PROCESS_POOL_SQLSATELLITE_GROWTH`, the launchpad service creates that number of processes plus one, and after execution the executing process is torn down. The others are added to the pool.
* When a user executes subsequent requests, or concurrent requests from different sessions, processes are picked up and used from the pool.
    * The launchpad service simultaneously creates a new process.

So, thanks [Bob][ba] for sending me the mail with the link the the [post][1]. That made me look deeper into how this "stuff" works! In that email Bob also sent some code, which will be used as a topic for another internals blog-post. That post will be about parallelism and the RTerm processes.    

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright
[1]: https://blogs.msdn.microsoft.com/microsoftrservertigerteam/2016/09/20/tips-sql-r-services-optimization-for-concurrent-execution-of-in-database-analytics-using-sp_execute_external_script/
[2]: https://blogs.msdn.microsoft.com/sql_server_team/
[3]: https://technet.microsoft.com/en-us/sysinternals/processexplorer.aspx

[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[si2]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
[si3]: {{< relref "2017-04-13-microsoft-sql-server-r-services---internals-iii.markdown" >}}

