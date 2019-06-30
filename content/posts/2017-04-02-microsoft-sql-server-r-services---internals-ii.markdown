---
layout: post
title: Microsoft SQL Server R Services - Internals II
author: nielsb
date: 2017-04-02T09:38:00+02:00
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
description: SQL Server R Services series. In this post we look at what happens inside the launchpad service.
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad   
---

This is the third post in a series about **Microsoft SQL Server R Services**, and the second post that drills down into the internal of how it works. To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

In the [previous internals post][2] we looked at what happens inside the SQL Server engine when  we execute `sp_execute_external_script`. In that post we wrapped up when we reached the launchpad service (*Launchpad.exe*). This post will look closer at the launchpad service, and we will do it by some more "spelunking"

<!--more-->

## Recap

In both previous posts about SQL Server R Services I have mentioned that the launchpad service is responsible for launching an external runtime when we execute `sp_execute_external_script`. In the [Internals I][2] post the following picture showed what happened inside the SQL server engine when executing the procedure:

![](/images/posts/sql-launchpad_post.png)

**Figure 1:** *Call Flow Executing sp_execute_external_script* 

From *Figure 1* we see how an named pipe connection is opened from the SQL Server engine into the launchpad service, and eventually the routine `sqllang!CSQLSatelliteConnection::WriteMessage` writes a message to the service. The message will at one stage or another cause the `launchpad!CLaunchContext::Launch` routine in the launchpad service to be called. In a little while we'll see how we came to that conclusion.

## Launchpad 

Launchpad is a new service installed together with SQL Server 2016, and it is there to support execution of scripts targeting external runtimes/engines. The launchpad service calls into launchers, and it is the launcher's job to launch the correct runtime/engine. How does the launchpad service know what launcher dll to call into? To answer that, cast your mind back to the previous post about [internals][2], in that post we looked at the procedure used to execute external scripts: `sp_execute_external_script`, and we executed some code like so:

``` sql
EXEC sp_execute_external_script 
                    @language =N'R',
                    @script=N'OutputDataSet<-InputDataSet',
                    @input_data_1 =N'SELECT 42'
WITH RESULT SETS (([TheAnswer] int not null));
GO
``` 
**Code Snippet 1:** *Execute sp_execute_external_script*

Looking at the code in *Code Snippet 1* we see the first parameter being the `@language` parameter, and it is this parameter that tells the launchpad service to use (in this case) the launcher for R. 

### Launchers

The question still remains though; how does the launchpad service know what specific launcher dll to use? To answer that let us look a little bit more closely at the launchpad service, in the properties dialog: 

![](/images/posts/sql-launchpad_service.png)

**Figure 2:** *SQL Server Launchpad Service* 

If we look at the *Path to executable* setting under the *General* as in *Figure 2* tab we may get some more insight:

```
"C:\<path_to_SQL_instance\>\MSSQL\Binn\launchpad.exe" 
 -launcher RLauncher.dll 
 -pipename sqlsatellitelaunch
 -timeout 600000 
 -logPath "C:\<path_to_SQL_instance>\MSSQL\LOG\ExtensibilityLog" 
 -workingDir "C:\<path_to_SQL_instance>\MSSQL\ExtensibilityData" 
 -satelliteDllPath "C:\<path_to_SQL_instance>\MSSQL\Binn\sqlsatellite.dll"  
  ```
 **Code Snippet 2:** *Path to Executable for Launchpad.exe*

After having copied the value in *Path to executable* we see is shown in *Code Snippet 2*. And in there we can see a command line argument `-launcher` with a value of *RLauncher.dll*. If we search for a file named *RLauncher.dll* we find it in the *Binn* directory together with all other SQL Server files:

![](/images/posts/sql_r_services_rlauncher.png)

**Figure 3:** *RLauncher* 

So, a theory is that during startup, the launchpad service reads in the value of the -launcher argument, and perhaps even loads the dll. Is there any way we can prove that theory? We can try:

1. Go to *Services* and stop the launchpad service
1. Delete all files from the directory the `-logPath` parameter points to.
1. Start the launchpad service.

You should now see a couple of new files in the log directory, and when you open them you can see how there are log messages about *RLauncher.dll*. If you have *Process Explorer* installed you can also verify that *RLauncher.dll* is loaded by finding the launchpad service process and then look at dll's as in *Figure 4* below:

![](/images/posts/sql_r_services_launchpad_rlauncher.png)

**Figure 4:** *RLauncher Loaded* 

Before we start "spelunking" with WinDbg, let's look at the arguments used by the launchpad service (as seen in *Code Snippet 2*) and see what they mean:

* `-launcher`: Full path to the launcher.
* `-logPath`: The launchpad's base log path.
* `-satelliteDllPath`: The sql satellite dll path for the satellites, we'll talk more about them in subsequent posts.
* `-workingDir`: The launchpad and satellite process base working directory.
* `-cleanupLog`: Whether to cleanup the log directory after every execution [0|1] (not set above).
* `-cleanupWorkingDir`: Whether to cleanup the working directory after every execution [0|1] (not set above).
* `-pipeName`: Define the launchpad's name pipe's name - this is from connection from SQL Server.
* `-timeout`: Define the default timeout in ms.
* `-SqlInstanceName`: Define the SqlInstanceName as in MSSQLSERVER or blank for default or an instance name (not set above).  

Some of the arguments (most in fact) I found in what I copied from the properties dialog for the service and the field *Path to executable* mentioned above. However a couple of the arguments were found by, from command prompt, trying to run the launchpad executable like so: `C:\<path_to_sql_server_instance>\MSSQL\Binn>launchpad.exe` without any arguments. That resulted in an error and some help how to run the launchpad service.

What was interesting in that, was that it - apart from listing the arguments above - also gave an example:

```
Example:
launchpad.exe 
    -launcher RLauncher.dll 
    -launcher PythonLauncher.dll 
    -logPath C:\Temp 
    -pipeName mypipename 
    -timeout 60000 
    -SqlInstanceName MSSQLSERVER
```
**Code Snippet 3:** *Example of How to Launch Launchpad Defining Multiple Launchers*

Notice how in *Code Snippet 3* above, multiple launchers are defined, and a launcher for Python being one of them. Maybe we'll soon see Python being supported as well!

### WinDbg Investigations

By now we know (or at least we have a strong hunch) that during startup of the launchpad service, the launchers are loaded. Now it is time to start drilling down in what happens inside the launchpad service when we execute code as in *Code Snippet 1*. First, let us look at what happens during connection from the SQL Server engine to the launchpad service. In the [Internals - I post][2] I mentioned how SQL Server opens a named pipe connection to the launchpad service in the `sqllang!CSQLSatelliteConnection::OpenNPConnection` routine. 

When named pipes are used, the client connects to a certain named pipe through the `ConnectNamedPipe` routine. Let's do some "spelunking" in the launchpad service using WinDbg, and see if we can find anything that can have anything to do with named pipes:

1. Stop the launchpad service if it is running.
1. Restart the service.
1. Open an instance of WinDbg and attach to the *Launchpad.exe* process.
1. Reload the symbols: `.reload /f`.

> **NOTE:** The [internals - I post][2] has more information how to attach to a process, and what commands to use.

Now, do a search for routines named like `ConnectNamedPipe`: `x *!*ConnectNamedPipe*`:

![](/images/posts/sql_r_services_windbg_launchpad_connectnamedpipe.png)

**Figure 5:** *Routines Named ConnectNamedPipe* 

*Figure 5* shows the result after the search, and the `KERNELBASE!ConnectNamedPipe` routine looks promising. To find out what happens, we'll:

1. Open a second instance of WinDbg.
1. Attach it to the *sqlservr.exe* process.
1. Reload the symbols by: `.reload /f`.
1. Set a breakpoint at the `OpenNPConnection` routine: `bp sqllang!CSQLSatelliteConnection::OpenNPConnection`.

In the debugger attached to the launchpad service we set a breakpoint at `ConnectNamedPipe`: `bp KERNELBASE!ConnectNamedPipe`. We then execute the code in *Code Snippet 1* and see what happens:

1. The `sqllang!CSQLSatelliteConnection::OpenNpConnection` breakpoint is hit.
1. After continuing, the `KERNELBASE!ConnectNamedPipe` breakpoint in the launchpad service is hit.

The call-stack at this point looks something like so (call stack output by `k c`):

``` cpp
0:007> k c
 # Call Site
00 KERNELBASE!ConnectNamedPipe
01 launchpad!Np::AsyncAccept+0x143
02 launchpad!Np::PrepareForNextAccept+0x9b
03 launchpad!SNIAcceptDoneWrapper+0x83
04 sqldk!SOS_Task::Param::Execute+0x231
05 sqldk!SOS_Scheduler::RunTask+0xaa
06 sqldk!SOS_Scheduler::ProcessTasks+0x3cd
07 sqldk!SchedulerManager::WorkerEntryPoint+0x2a1
08 sqldk!SystemThread::RunWorker+0x8f
09 sqldk!SystemThreadDispatcher::ProcessWorker+0x2de
0a sqldk!SchedulerManager::ThreadEntryPoint+0x1d8
0b KERNEL32!BaseThreadInitThunk+0x14
0c ntdll!RtlUserThreadStart+0x21

```
**Code Snippet 4:** *Callstack at KERNELBASE!ConnectNamedPipe*

So that is how SQL Server connects into the launchpad service:

1. SQL Server calls `sqllang!CSQLSatelliteConnection::OpenNpConnection`.
1. The launchpad service is doing `launchpad!SNIAcceptDoneWrapper`.
1. Followed by `KERNELBASE!ConnectNamedPipe`, and the named pipe is now open.

> **NOTE:** The above is very simplified, in fact a lot of things happen in parallel, and we'll touch upon that a bit later. 

Let us now go on and have a look what happens after the connection has been made. How do we go about finding out what happens? Well, we can do it the "brute force" way:

We know that the launcher for R will try and load the R runtime, and if we look in the `MSSQL\Binn` folder where the `RLauncher.dll` resides we find a config file for the launcher: `rlauncher.config`. Let's see what it contains:

![](/images/posts/sql_r_services_rlauncher_config.png)

**Figure 5:** *RLauncher Configuration* 

In *Figure 5* we see that the configuration file for the launcher contains the `RHOME` path. With that in mind we can assume that the launcher will call into there and launch the runtime. What happens if the launcher cannot find the path? An exception would probably be thrown, and if we were debugging we could hopefully catch it and have a look at the stack. To test this theory:

1. Stop the launchpad service if it is running.
1. Remove the `R_SERVICES` directory and its content and place it somewhere else.
1. Delete all files from the directory the `-logPath` argument in *Code Snippet 3* points to.
1. Restart the launchpad service.

> **NOTE:** Please, please, please **DO NOT** do this on a production server!!

The restart should just go fine, and you can now attach WinDbg to the launchpad process:

* Open an instance of WinDbg and attach to the *Launchpad.exe* process.
* Reload the symbols: `.reload /f`.
* Hit F5 to let the debugger run.

When the debugger runs, you execute the code in *Code Snippet 1*, and you get an ugly error in management studio:

![](/images/posts/sql_r_services_rlauncher_exception.png)

**Figure 6:** *SQL Exception*

Yeah, kind of obvious that the runtime for R cannot be launched as it is nowhere to be found. WinDbg also reports some exceptions but the debugger is still running. When looking at the exceptions you see something like so:

```
(2fcc.34c8): C++ EH exception - code e06d7363 (first chance)
(2fcc.35c): C++ EH exception - code e06d7363 (first chance)
[2017-04-01 07:14:54.605][Error] 
ProcessPool::CreateProcess(MSSQLSERVER01-ss-2, 
  78A18DD6-14A7-4BFA-BC1C-664A653A070C) failed with: 
  Failed with (80070003) to start executable 
  C:\<path_to_sql_instance>\R_SERVICES\bin\x64\rterm.exe 
  with args  --slave --no-restore --no-save -e "library(RevoScaleR);
```
**Code Snippet 5:** *C++ EH Exception*

In *Code Snippet 5* we see that the launcher tries and create a process for `RTerm.exe` which is the entry-point to the R runtime. So the question is what was being called to get to this point. If you break out of the debugger and under the *Debug* menu choose *Event Filters*:

![](/images/posts/sql_r_services_windbg_eventfilters.png)

**Figure 7:** *Event Filter* 

In there you can choose how certain events are handled. In *Code Snippet 5* we see that the exception we encounter is a `C++ EH` exception, so in the *Event Filters* dialog you can set how that particular exception should be handled. We want it to be enabled, but not handled:

![](/images/posts/sql_r_services_windbg_eventfilters_enable.png)

**Figure 8:** *Enable C++ EH Exception* 

When you execute the code again after having enabled the exception as in *Figure 8*, the debugger will now break at the exception, and you can view the call-stack through the `k` command. In *Code Snippet 6* below I show an abbreviated part of the call-stack:

```cpp
0:010> k
...
06  RLauncher!GetInstance+0x3239f
07  RLauncher!GetInstance+0x32a5d
08  RLauncher!GetInstance+0x5aeee
09  RLauncher!GetInstance+0x3fbca
0a  RLauncher!GetInstance+0x1c864
0b  RLauncher!SQLSatellite_GetLauncherAPI+0x9dd
0c  launchpad!CLaunchContext::Launch+0x160
0d  launchpad!CLaunchContext::LaunchInternal+0x2df
0e  launchpad!CLaunchContext::LaunchServTask+0x357
0f  sqldk!SOS_Task::Param::Execute+0x231
```
**Code Snippet 6:** *Call Stack at Exception*

In *Code Snippet 6* we see the `launchpad!CLaunchContext::Launch` routine, the same we identified in the [internals I post][2]. That routine has an important part to play when calling into the launcher. When you look at *Code Snippet 5* you also see routines from the `RLauncher` module. Unfortunately we cannot really see what goes on inside the launcher as there is no symbol file for it.

Coming back to `launchpad!CLaunchContext::Launch`; I said it has an important part to play, and it does. However the `launchpad!CLaunchContext::LaunchServTask` routine which you also can see in *Code Snippet 6* is even more important. That routine sets up most of the things that happen when SQL Server calls into the launchpad service. When I talked about the named pipe connection and how things happened in parallel, if you were to set a breakpoint at `launchpad!CLaunchContext::Launch` and then output the call-stack and compared that call-stack to what is shown in *Code Snippet 4*, you would see that both call-stacks have the same originating methods and addresses.  

Seeing that we don't have symbol files for the RLauncher module we have to "hunt" around in WinDbg as well as making some assumptions of what is happening if we want to go further in the "spelunking". When we, in *Code Snippet 5* looked at the exception we received in the debugger we saw something about `CreateProcess`, and we already saw the `Launch` routine in *Code Snippet 6*. What if we were to look for something like that in the `launchpad` module: `x launchpad!*Launch*Process*`. That reveals:

* `launchpad!SQLSatellite_LaunchProcess`
* `launchpad!PhysicalUserContext::LaunchProcess`

Especially the second; `launchpad!PhysicalUserContext::LaunchProcess`, is interesting - as when launching the R runtime it should be done in the context of a user. So let us set a couple of breakpoints and see what happens. Set one breakpoint at: `bp launchpad!CLaunchContext::Launch` and the other at: `launchpad!PhysicalUserContext::LaunchProcess`. Then execute the code again.

When executing we see how we first break at `bp launchpad!CLaunchContext::Launch`, followed by `launchpad!PhysicalUserContext::LaunchProcess`, and we still have not had any exceptions. If you now hit F5, you will hit the exceptions immediately. So it seems that the `launchpad!PhysicalUserContext::LaunchProcess`, is where it happens; where we try and load the R runtime.

To confirm this we can copy back the `R_SERVICES` directory to where it is supposed to be, and while still having a breakpoint at `launchpad!PhysicalUserContext::LaunchProcess` execute the code again. When you hit the breakpoint, go to process explorer and have a look at running processes where the process is named something with R. On my machine it looks something like so:

![](/images/posts/sql_r_services_launchpad_before_launch_process.png)

**Figure 9:** *Before LaunchProcess* 

After having continued the debugger, it looks like so:

![](/images/posts/sql_r_services_launchpad_after_launch_process.png)

**Figure 10:** *After LaunchProcess* 

In *Figure 10* we now see how some instances of `RTerm.exe` has been spun up. In next post we'll look at why there are multiple instances.

**UPDATE:** After "spelunking" for the **Microsoft SQL Server R Services - Internals III** post (still in the works), I realized that I over-simplified the above, so I have tried to make it somewhat more clearer below.

Though it is correct to say that the actual launch of R happens in the `launchpad!PhysicalUserContext::LaunchProcess`, it is more to it than that. If we were to set a breakpoint at `launchpad!CLaunchContext::Launch`, and when we reach that breakpoint we would do "Watch and Trace" ([`wt`][3]), we would get a very lengthy trace, containing all calls being made. 

> **NOTE:** Some routines (`launchpad!PhysicalUserContext::LaunchProcess` amongst them) may be too long for the WinDbg console, so `wt` can also be written to a log-file, using WinDbg menu *Edit | Open/Close Log File*.

During my "spelunking" I did a `wt` against `launchpad!PhysicalUserContext::LaunchProcess`, which resulted in a 7Mb file. When scrolling through the log-file, the following (extremely abbreviated) call-stack could be seen:

``` cpp
launchpad!CLaunchContext::Launch
... loads of calls
  RLauncher!SQLSatellite_GetLauncherAPI
    RLauncher!GetInstance
    ... loads of RLauncher routines
      launchpad!SQLSatellite_LaunchProcess
        launchpad!CreateProcessForSatelliteSession
          launchpad!PhysicalUserContext::LaunchProcess
            KERNELBASE!CreateProcessInternalW
              ... The R process is created here somewhere
            KERNELBASE!CreateProcessInternalW
          launchpad!PhysicalUserContext::LaunchProcess
        launchpad!CreateProcessForSatelliteSession
      launchpad!SQLSatellite_LaunchProcess
    RLauncher!GetInstance
  RLauncher!SQLSatellite_GetLauncherAPI
launchpad!CLaunchContext::Launch
```
**Code Snippet 7:** *Trace output from launchpad!CLaunchContext::Launch*

Setting breakpoints and stepping through the code I saw how the R process (RTerm.exe) was spun up inside the `KERNELBASE!CreateProcessInternalW` routine.

So if that creates the R process, when and how is the actual data being passed over to the R runtime? Remember back from the [internals I post][2], where we saw how the actual data was written to the launchpad service in the `sqllang!CSQLSatelliteConnection::WriteMessage` routine. What if there is something similar in the launchpad service? Let us see what we find if we execute `x *!*WriteMessage*`. Oh, among the result is `launchpad!CSQLSatelliteConnection::WriteMessage`; that looks something that would be worth looking into. Let us set a breakpoint at `launchpad!CSQLSatelliteConnection::WriteMessage`, and execute the code again. We are breaking at out various breakpoints, and we also break at `WriteMessage`. If we output the call-stack, it looks like so:

``` cpp
00 launchpad!CSQLSatelliteConnection::WriteMessage
01 launchpad!CSQLSatelliteCommunication::SendResumeWithLoginInfo+0x239
02 launchpad!CLaunchContext::LaunchInternal+0x375
03 launchpad!CLaunchContext::LaunchServTask+0x357
04 sqldk!SOS_Task::Param::Execute+0x231
05 sqldk!SOS_Scheduler::RunTask+0xaa
06 sqldk!SOS_Scheduler::ProcessTasks+0x3cd
07 sqldk!SchedulerManager::WorkerEntryPoint+0x2a1
08 sqldk!SystemThread::RunWorker+0x8f
09 sqldk!SystemThreadDispatcher::ProcessWorker+0x2de
0a sqldk!SchedulerManager::ThreadEntryPoint+0x1d8
0b KERNEL32!BaseThreadInitThunk+0x14
0c ntdll!RtlUserThreadStart+0x21
```
**Code Snippet 7:** *Callstack for launchpad!CSQLSatelliteConnection::WriteMessage*

If we were to step through the routine we'd see it looks quite like the `sqllang!CSQLSatelliteConnection::WriteMessage` which we looked at in the [internals I post][2]. Having reached this point we can now with somewhat certainty assume that after we have launched the process, the launchpad service sends the actual data packet to the R engine through the `launchpad!CSQLSatelliteConnection::WriteMessage` routine. And this is where we leave it for now.

## Summary

We should now have a somewhat better understanding of what happens when the launchpad service is called from SQL Server. In *Figure 11* below shows some of the significant events/calls when `sp_execute_external_script` is executed:

![](/images/posts/sql-launchpad-r-post.png)

**Figure 11:** *Launchpad Service Call Flow*

The flow is something like this:

1. A call comes in from SQL Server.
1. Enters the launchpad process, and workers, schedulers, tasks, etc., comes into play.
1. Eventually `sqldk!SOS_Scheduler::RunTask` is called.
1. Named pipe connection is accepted and opened.
1. More or less in parallel, `launchpad!CLaunchContext::LaunchServTask` is called.
1. We get into `launchpad!CLaunchContext::Launch`.
1. The `launchpad!CLaunchContext::Launch` routine calls RLauncher routines.
1. Multiple RLauncher calls are being made.
1. An RLauncher routine calls `launchpad!SQLSatellite_LaunchProcess`.
1. That call is followed by `launchpad!CreateProcessForSatelliteSession`
1. Which is followed by `launchpad!PhysicalUserContext::LaunchProcess`.
1. The `KERNELBASE!CreateProcessInternalW` is called and the RTerm processes are started.
1. Finally after the processes have been launched, `launchpad!CSQLSatelliteConnection::WriteMessage` is called.

Some of the above are, somewhat, educated guesswork since I don't have the symbol file for `RLauncher.dll`. I do however believe it is more or less accurate. In the next internals post we'll look at what happens in the RTerm process.

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[1]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[2]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[3]: https://msdn.microsoft.com/en-us/library/windows/hardware/ff561497(v=vs.85).aspx
