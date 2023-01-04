---
layout: post
title: Microsoft SQL Server R Services - Internals XIX
author: nielsb
date: 2018-01-20T19:42:49+02:00
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
  - BXL
  - Process Monitor
  - SqlSatellite
description: A drill down, using WinDbg, into how print statements in the external engine together with ack messages comes back to SQL Server.
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - RTerm.exe
  - BXL
  - Process Monitor
  - SqlSatellite   
---

This is the 20:th post in a series about **Microsoft SQL Server R Services**, and the 19:th post that drills down into the internal of how it works. To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

We are nearing the end of the **Internals** series, and if we look at what we have covered, we have almost come full circle.

<!--more-->

## Recap

In this *Recap*, let's look back at some of the posts that has "bearing" on this particular post.

The [Internals - I][si1] post discussed how SQL Server opened a named pipe connection into, and called the, launchpad service when the proc `sp_execute_external_script` is executed. In [Internals - VIII][si8] we looked at what different components are involved when the procedure executes:

* SQL Server calls into the launchpad service.
* The launchpad service calls into the `Rlauncher.dll`.
* The `Rlauncher.dll` creates Rterm processes.
* Through Rterm, the `R.dll` is loaded together with `RxLink.dll`.
* The `RxLink.dll` creates the `BxlServer.exe` process.
* To coordinate with SQL Server, `BxlServer.exe` loads `BxServerLink.dll`.

The above can be illustrated as in *Figure 1* below

![](/images/posts/sql_r_services_8_arch_overview.png)

**Figure 1:** *Components In Play*

Based on the above, the question we then tried to answer in [Internals - IX][si9] was how the components are communicating and what sort of communication mechanisms there are. We determined that there were different communication mechanisms, and used a figure to illustrate those various mechanisms:

![](/images/posts/sql_r_services_9_comms2.png)

**Figure 2:** *How Communication Happens*

The numbers indicate:

* 1 - named pipe.
* 2 - IOCP.
* 3 - named pipe. 
* 4 - TCP/IP

In Internals - [XVI][si16] and [XVII][si17] we looked at how result sets were returned from the SqlSatellite to SQL Server, and we realized the data were delivered via data packets over the TCP connection between the SqlSatellite and SQL Server. In [Internals - XVII][si17], we also tried to understand what happened, code wise, in SQL Server when data packets were returned, and the following figure were used to illustrate the flow:

![](/images/posts/sql_r_services_17_flow.png)

**Figure 3:** *Code Flow Receiving Data from SqlSatellite*

Finally, in [Internals - XVIII][si18] we talked about how output parameters are handled between the SqlSatellite and SQL Server and we saw how the output parameters come back in a data packet over the TCP connection between the SqlSatellite and SQL Server. They are handled in SQL Server as per this figure:

![](/images/posts/sql_r_services_18_flow.png)

**Figure 4:** *Code Flow Receiving Output Arguments from SqlSatellite*

The numbered arrows in both *Figure 3* and *Figure 4* show the communication out to and in from SQL Server, and in what order it happens:

1. SQL Server opens named pipe connection to the launchpad service.
1. Message sent to the launchpad service.
1. After the call above, the SqlSatellite opens a TCP/IP connection to SQL Server.
1. SQL Server sends the first packet to the SQL Satellite for authentication purposes.
1. A second authentication packet is sent to SqlSatellite.
1. The script is sent from inside `sqllang!CSatelliteProxy::PostSetupMessage`
1. The data for `@input_data_1` is sent together with two end packets.
1. Packet are coming back to SQL Server containing meta-data and the actual data.
1. `PullRow` is being signaled.
1. Execution continues to process meta-data as well as result rows.
1. After processing result rows, output arguments are processed.

So, we have seen in various posts how meta-data, result-sets and output parameters, etc. are send to SQL server from the SqlSatellite using the TCP connection. In this post we'll look at other types of data going back to SQL server.

## Housekeeping

Before we "dive" into todays topics let's look at the code and the tools we'll use. This section is here here for those of who want to follow along in what we're doing in the posts.

#### Helper Tools

To help us figure out the things we want, we will use *Process Monitor*, and *WinDbg*: 

* *Process Monitor*, will be used it to filter TCP traffic. If you want to refresh your memory about how to do it, we covered that in [Internals - X][si10] as well as in [Internals - XIV][si14].
* In the last few posts I have used *WinDbg preview* a my debugger, but in this post I am reverting back to *WinDbg* "classic". If you need help with setting it up, that is covered in [Internals - I][si1].

#### Code

In this post we won't need a specific database, we'll just execute variants of some very, very basic code:

```sql
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(10)
                             d <- 42';
```
**Code Snippet 1:** *Base Code to Execute*

The `Sys.sleep` is in the script to make it easier for us to see what happens, and in what order.

## Messages

What is this *Messages* in the header of this section? I am using that name for data that is not result-set data or output parameter values. E.g "stuff" that appears in the *Messages* tab in *SSMS*. Execute the code in *Code Snippet 2* and you see something like so (you can comment out the `Sys.sleep` if you wish):

![](/images/posts/sql_r_services_19_msgs1.png)

**Figure 5:** *Message in SSMS*

The question is that, were does the message in *Figure 5* originate from? What you see in *Figure 5* may not be the best example, so let's look at the following code:

```sql
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(10)
                             cat("Hello World")
                             d <- 42';
```
**Code Snippet 2:** *Code with Print*

When the code in *Code Snippet 2* is executed (once again, you can comment out the `Sys.sleep`), the output looks like so:

![](/images/posts/sql_r_services_19_msgs2.png)

**Figure 6:** *Message From cat Statement*

In *Figure 6* it is clear that the "message" comes from the R engine, and the question is how does it get to SQL Server? As mentioned above, we have seen in previous posts how the data has been sent in data packets over the TCP connection. Is that perhaps the same thing here, and how do we find out? We'll start with what we saw in *Figure 5* - the output from *Code Snippet 1*.

#### Acknowledgments

When writing this post I realized that what we see in *Figure 5* is the result of an acknowledgment from the R "environment", that the "job" is finished, and below we'll see how I came to that conclusion.

We'll use *Process Monitor* to begin with:

* Run *Process Monitor* as admin and load the filter we used in [Internals - XVI][si16] where we filtered for `TCP Send` and `TCP Receive` for `BxlServer.exe`.
* Execute the code in *Code Snippet 1* (without the `Sys.sleep` if you want) and look at the output from *Process Monitor*:

![](/images/posts/sql_r_services_19_procmon1.png)

**Figure 7:** *Return Packets*

As you see in *Figure 7* three packets are returned to SQL Server after execution (outlined in red), and we have discussed in previous posts what they are. Potentially the "Commands completed successfully." message could have been part of one of those three packets, but from what we know it is unlikely. We should be able to determine if a message is part of any of those three packets by executing the code in *Code Snippet 2*, but with a `cat` statement like this: `cat("A very, very, very long string to see if the packet sizes differ")`. 

The idea is that having a long message string, we should see an impact on either of the data packets being sent back to SQL Server. However after we execute, the packets sent back to SQL Server look no different, so it seems that the message is sent back by other means, or generated in some other way.

Ok, so if the data is not sent back on the TCP connection between the SqlSatellite and SQL Server, then the data has to go back over the launchpad connection. Can we somehow see if that is what's happening? If we believe that some data is passed from the R engine to SQL Server via the launchpad service, then the data has to be passed over the IOCP as well as the named pipes. So if we can "trap" the message when it arrives in the launchpad service, also see if/when it is sent back to SQL Server, and then finally "catch" it in SQL Server. That should "prove" out theory.

> **NOTE:** As we only have symbol files for SQL Server and the launchpad service, we need to do it the way it is outlined above.

Right:

* Start up two instances of *WinDbg* as admin.
* Attach *WinDbg* to the SQL Server process (`sqlservr.exe`), and the launchpad process (`launchpad.exe`) - **DO NOT DO THIS ON A PRODUCTION SERVER**.

Let's start with the launchpad service and search for routines that might be involved in reading data coming into the launchpad service as well as sending data out to SQL Server. So let's start with looking for routines in the `launchpad` module: `x launchpad!*Read*`. When you execute that, you see there are quite a few. However when browsing through the output, there are some that looks interesting in the `CSQLSatelliteConnection` class:

* `launchpad!CSQLSatelliteConnection::ReadCallBack`
* `launchpad!CSQLSatelliteConnection::ReadCallBackInternal`
* `launchpad!CSQLSatelliteConnection::ReadOneFullMessage`

Let's set a breakpoint at `launchpad!CSQLSatelliteConnection::ReadOneFullMessage` and execute the code in *Code Snippet 1*, this time ensure that the `Sys.sleep` statement is in the code, so that if the breakpoint is hit, we'll know that it is after execution. Sure enough the breakpoint is hit almost immediately, and after letting the code continue, there is a pause and the breakpoint is hit a second time. At the second "hit" have a look at the call-stack: `k`:

```c++
launchpad!CSQLSatelliteConnection::ReadOneFullMessage
launchpad!CSQLSatelliteConnection::ReadCallBackInternal+0x37
launchpad!CSQLSatelliteConnection::ReadCallBack+0x39
launchpad!SNIReadDone+0x151
sqldk!SOS_Node::ListenOnIOCompletionPort+0x384
sqldk!SOS_Task::Param::Execute+0x231
sqldk!SOS_Scheduler::RunTask+0xaa
...
```
**Code Snippet 3:** *Call Stack at ReadOneFullMessage*

The call-stack we see in *Code Snippet 3* clearly shows that our "hunch" about IOCP seems correct (`sqldk!SOS_Node::ListenOnIOCompletionPort`), and we see that the call flow includes all three `Read...` routines that we found above. If we wanted to see what happens inside the routines, we can disable the break-point at `ReadOneFullMessage` and set a break-point at `ReadCallBackInternal`instead, and then execute the code in *Code Snippet 1* again. When the `ReadCallBackInternal` break-point is hit the second time (after the pause), do a "trace and watch" `wt` and let the code run to completion.

> **NOTE:** The reason why you set the break-point on `ReadCallBackInternal`, and not `ReadOneFullMessage` is that a `wt` on `ReadOneFullMessage` won't give you much information at all, whereas `ReadCallBackInternal` shows you quite a lot of interesting "stuff".

When the code has run to completion, copy the trace to a separate file, to make it easier to investigate:

```c++
launchpad!CSQLSatelliteConnection::ReadCallBackInternal
  launchpad!CSQLSatelliteConnection::ReadOneFullMessage
  ...
  launchpad!CSQLSatelliteConnection::DeliverMessage
  ...
  launchpad!EventInternal<SuspendQueueSLock>::SignalAll
  ...
    ...
      sqldk!SOS_Scheduler::PrepareWorkerForResume
      ...
      sqldk!SOS_Scheduler::RunnableQueueInsert
        sqldk!GroupWorkerQueue::Enqueue
        ...
      ...  
    sqldk!SOS_Scheduler::WakeUpScheduler
    ...
      launchpad!Np::ReadAsync
      ...
    ...  
    sqldk!SOS_RWLock::ReleaseLock
  ...    
```
**Code Snippet 4:** *Routines During ReadCallBackInternal*

When I looked at the trace, I found some interesting routines, which are shown in *Code Snippet 4*. When I see the code above, I can't help but to think about what we saw in [Internals - XVII][si17], where `sqllang!CUDXR_ExternalScript::PullRow` was signaled by `sqllang!EventInternal<SuspendQueueSLock>::SignalAll`. Here the signal happens through `launchpad!EventInternal<SuspendQueueSLock>::SignalAll`, and after the signal, "stuff" is enqueued and locks are released. If this is the case, what is being signaled then?

Hmm, let us think back one of the posts in the beginning of the **Internals** "journey", and specifically [Internals - II][si2]. In that post we looked at the code-flow, when SQL Server called into the launchpad service, and we saw a figure like so:

![](/images/posts/sql-launchpad-r-post.png)

**Figure 8:** *Launchpad Service Call Flow*

From *Figure 8* we see how the routine `launchpad!CLaunchContext::LaunchServTask` seems to be the "main" method. Maybe that's what's being signaled, let's see if we can figure it out:

* Disable the existing break-points in the launchpad process.
* Set a break-point at `launchpad!CLaunchContext::LaunchServTask`.
* Change the `Sys.sleep` in *Code Snippet 1* to `Sys.sleep(120)`.

Execute the code and when you hit the `LaunchServTask` break-point, do a `wt -l4` (trace four levels deep). The execution will continue, until the control has been passed over to the R engine, and its various components. At this stage `LaunchServTask` has not finished execution, and you'll see something like so at the end of the trace:

```c++
...
  launchpad!CSQLSatelliteConnection::GetNextMessage
    launchpad!EventInternal<SuspendQueueSLock>::Wait
    ...
      sqldk!SOS_Scheduler::Suspend
      sqldk!SOS_Scheduler::SuspendNonPreemptive
``` 
**Code Snippet 5:** *Wait for Continuation*    

So, in *Code Snippet 5*, we see where `LaunchServTask` "waits" for something to complete. When the script code has finished executing (after the `Sys.sleep`), you'll see the trace continue - and it will continue with: 

```c++
        sqldk!SOS_Scheduler::SwitchContext
        sqldk!SOS_Scheduler::Switch
      sqldk!SOS_Scheduler::SuspendNonPreemptive
    launchpad!EventInternal<SuspendQueueSLock>::Wait
      sqldk!SOS_Task::PostWait
...
```
**Code Snippet 6:** *Code Continues*

What we see in *Code Snippet 6* is the continuation of the code, based on the "signal" in *Code Snippet 4*. If we then investigate the latter part of the trace further we'll see: 

```c++
launchpad!CLaunchContext::LaunchServTask
  ...
    launchpad!CSQLSatelliteCommunication::GetSQLSatelliteMessage
  ...
    launchpad!ConnectionStore::RemoveConnection
      ...
    launchpad!TListElem<TList<SatelliteSessionList,SatelliteSession,0,TListSLock> >::RemoveAndDestroy
      ...
    launchpad!CSQLSatelliteCommunication::SendAckMessage
    ...
      launchpad!CSQLSatelliteConnection::WriteMessage
    ...
  ...
...
```
**Code Snippet 7:** *Tear Down Connection and Send Ack*

In *Code Snippet 7* we see how after continuing the execution and being signaled in *Code Snippet 6*, we: 

* Retrieve the message
* Tear down the connection
* Removes the session
* Sending an ack message, through `WriteMessage`

> **NOTE:** Seeing the `launchpad!CSQLSatelliteCommunication::SendAckMessage` was what made me realize that we were looking at acknowledgments.

Seeing that the connection to the SqlSatellite is torn down, we can with some certainty say that the ack will be sent to SQL Server. So now, let's include SQL Server in our debug session as well:

* Disable the `LaunchServTask` break-point in the launchpad process.
* Set a break-point in the launchpad process at `launchpad!CSQLSatelliteCommunication::SendAckMessage`.
* In the SQL Server process set a break-point at `sqllang!NP::ReadAsync`.

The theory with the above is that after we break at the `SendAckMessage`; when we continue we should immediately break at the SQL Server `ReadAsync` break-point. Change the `Sys.sleep` back to `Sys.sleep(10)` and execute the code in *Code Snippet 1*. You'll now break in the SQL Server process at `ReadAsync`, this is when the connections etc., are set up between SQL Server and the launchpad. Just continue on from there, and there will be a couple of more breaks before `SendAckMessage` - three more on my box, so four in total. Now wait until the break-point is hit at `SendAckMessage`, continue on from there and watch how you immediately break in the SQL Server process at `ReadAsync`. The call-stack at this stage:

```c++
sqllang!Np::ReadAsync
sqllang!SNIReadAsync+0xc7
sqllang!CSQLSatelliteConnection::ReadCallBackInternal+0xc8
sqllang!CSQLSatelliteConnection::ReadCallBack+0x39
sqllang!SNIReadDone+0x13c
sqldk!SOS_Node::ListenOnIOCompletionPort+0x384
...
```
**Code Snippet 8:** *Call Stack at ReadAsync*

Hmm, there are some routines we recognize in the call-stack in *Code Snippet 8*, we see the `ReadCallback...` which we also saw in the launchpad process and if you remember [Internals - XVII][si17], we realized that `ReadCallbackInternal` was used to signal to `PullRow`, that data had arrived. The question is if something is signaled here as well? I doubt it is `PullRow`, seeing that this has nothing to do with processing result-sets. How can we find out about this?

In [Internals - XVII][si17] we saw how after `PullRow` was signaled, `ProcessResultRows` were called and in there as one of the first calls were a call to `sqllang!CSQLSatelliteCommunication::GetSQLSatelliteMessage`. Maybe something similar is happening here. The way we can find is to set a break-point in the SQL Server process at `sqllang!CSQLSatelliteCommunication::GetSQLSatelliteMessage`, but disable it initially. 

Execute the code in *Code Snippet 1* again, and continue until you hit the `ReadAsync` break-point in the SQL server process, after the `SendAckMessage` (as we did above). While you are in the `ReadAsync` break-point, enable the `GetSQLSatelliteMessage` in the SQL Server process, and continue the code execution. You'll see how the `GetSQLSatelliteMessage` break-point is hit immediately after you have enabled it and continued from `ReadAsync`. When you look at the call-stack (`k`), it looks something like so:

```c++
sqllang!CSQLSatelliteCommunication::GetSQLSatelliteMessage
sqllang!CSQLSatelliteCommunication::BindReadSNIPacket+0x6f
sqllang!CSQLSatelliteCommunication::WaitForAckMessage+0x7a
sqllang!CUDXR_ExternalScript::ShutdownService+0x250
sqlmin!CUDXR_ExternalScriptCleanup::Close+0xe
sqlmin!CQueryExecContext::FinalCleanup+0x51
sqlmin!CQueryScan::DestroyQuery+0x224
sqllang!CXStmtQuery::ShutdownNormal+0x151
sqllang!CXStmtQuery::ErsqExecuteQuery+0x1014
...
```
**Code Snippet 9:** *Call Stack at GetSQLSatelliteMessage*

It looks like we are onto something here, e.g there is the `sqllang!CSQLSatelliteCommunication::WaitForAckMessage` routine, which seems to be called during shutdown of the session. From what we can see from the call-stack it also looks like the "main" routine `is sqllang!CXStmtQuery::ErsqExecuteQuery`, and my guess it is that routine which is being signaled. That's what it looks like for code like in *Code Snippet 1*:

In the launchpad service:

* It gets an IOCP notification.
* It reads the notification through the `Read...` routines, and signals it.
* The `LaunchServTask` wakes up and calls `launchpad!CSQLSatelliteCommunication::SendAckMessage`.

In SQL Server:

* It reads the message sent from the launchpad service.
* Signals into `ErsqExecuteQuery`
* Handles the message.

What about code like in *Code Snippet 2* where there is the equivalent of a "print" statement - what happens there?

#### Messages Generated in the External Script

What I noticed when I was ~~playing~~ researching this post, was that when I executed the code in *Code Snippet 1* - I saw one `sqllang!Np::ReadAsync` in the SQL Server process after the sleep in the code, and we now know it is because of the the `SendAckMessage`. However, when executing the code in *Code Snippet 2* (with the `cat` statement), all of a sudden I saw two `ReadAsync` but only one `SendAckMessage`. So something else seems to send a packet to SQL Server, but what?

I started trying to trace through `launchpad!CLaunchContext::LaunchServTask` with `wt`, but couldn't do it completely as I received errors. So instead I looked at sending of packets in the launchpad service, and I set a break-point at `launchpad!CSQLSatelliteConnection::WriteMessage`. When executing the code in *Code Snippet 1*, the break-point was hit initially once immediately and the once after the sleep. The call-stack at this point looked like so:

```c++
launchpad!CSQLSatelliteConnection::WriteMessage
launchpad!CSQLSatelliteCommunication::SendAckMessage+0x191
launchpad!CLaunchContext::LaunchServTask+0x958
launchpad!CLaunchContext::LaunchServTask+0x722
sqldk!SOS_Task::Param::Execute+0x231
...
ntdll!RtlUserThreadStart+0x21
```
**Code Snippet 10:** *Call Stack in Launchpad SendAckMessage*

The call-stack we see in *Code Snippet 10*, is more or less what we see in *Code Snippet 7*. However, when we execute the code in *Code Snippet 2*, and we break at the first `WriteMessage` after the sleep, the call-stack looks as follows:

```c++
launchpad!CSQLSatelliteConnection::WriteMessage
launchpad!CSatelliteCargoContext::SendLogMessage+0x2b0
launchpad!SQLSatellite_LogWString+0x99
RLauncher!GetInstance+0x3eb28
RLauncher!GetInstance+0x3e7d1
RLauncher!GetInstance+0x3e9be
RLauncher!GetInstance+0x3d15b
RLauncher!GetInstance+0x1751d
RLauncher!GetInstance+0x1c30c
RLauncher!SQLSatellite_GetLauncherAPI+0xe50
launchpad!CLaunchContext::Cleanup+0x11a
launchpad!CLaunchContext::LaunchServTask+0x8fa
launchpad!CLaunchContext::LaunchServTask+0x722
sqldk!SOS_Task::Param::Execute+0x231
...
ntdll!RtlUserThreadStart+0x21
```
**Code Snippet 11:** *Call Stack in Launchpad with Print Message*

So the call-stack in *Code Snippet 11* is completely different than in *Code Snippet 10*. Well, we are still inside `LaunchServTask`, but `LaunchServTask` calls a cleanup routine, and within that routine calls to log routines are called: `launchpad!SQLSatellite_LogWString`, and `launchpad!CSatelliteCargoContext::SendLogMessage`. The `SendLogMessage` routine is the routine which ultimately sends the message to SQL Server. When the code continues, the `WriteMessage` breakpoint is hit the second time, and at this stage the breakpoint looks exactly the same as in *Code Snippet 10*. This then means that the ack message is sent after the message from which to log.

What is worth noticing is that even though the launchpad service sends two messages to SQL Server - there is only one message coming in from the external engine, e.g. the actual "print" message comes together with the ack message, as in *Code Snippet 3*.

Now, let's see what it looks like at the SQL Server side, when we execute code like in *Code Snippet 2*:

* Disable all breakpoints in the launchpad service, except for `SendAckMessage`.
* Set a break-point at `launchpad!CSatelliteCargoContext::SendLogMessage`.
* Keep the  break-point in the SQL Server process for `ReadAsync`.
* Disable all other breakpoints in the SQL server process, including the `GetSQLSatelliteMessage` break-point.

Execute the code in *Code Snippet 2*, and let the code continue until you hit the `SendLogMessage` break-point in the launchpad process. Continue the execution, and when you hit `ReadAsync` in SQL server, enable the `GetSQLSatelliteMessage` break-point. Continue the execution and when the `GetSQLSatelliteMessage` breakpoint is hit, check the call-stack. Continue execution until the `SendAckMessage` break-point is hit in the launchpad process, and then continue until `GetSQLSatelliteMessage` in SQL Server is hit again. Check the call-stack, and compare them. 

You'll see how they are identical, and exactly like what we see in *Code Snippet 9*. So if the call-stacks look exactly the same (from what we can see), what then causes the "print" statement to be output? It turns out that it is somewhat similar to what happens in the launchpad process where the `Cleanup` routine leads into the `SendLogMessage` call. So in the SQL Server process, the `sqlmin!CQueryExecContext::FinalCleanup` routine calls into `sqllang!CUDXR_ExternalScript::ShutdownService`, which - dependent on if a message comes back from the R engine - will read it in and then call a routine which handles the message: `sqllang!CUDXR_ExternalScript::HandleLogMessage`:

```c++
sqlmin!CQueryExecContext::FinalCleanup
  sqlmin!CUDXR_ExternalScriptCleanup::Close
  ...
    sqllang!CUDXR_ExternalScript::ShutdownService
      sqllang!CSQLSatelliteCommunication::WaitForAckMessage
        sqllang!CSQLSatelliteConnection::GetNextMessage
        ...
        sqllang!CSQLSatelliteCommunication::BindReadSNIPacket
        ...
        sqllang!CSQLSatelliteMessageLog::ReadPayload
        ...
        sqllang!CUDXR_ExternalScript::HandleLogMessage
      sqllang!CSQLSatelliteCommunication::WaitForAckMessage
      ...
        sqllang!CSQLSatelliteConnection::GetNextMessage
      ...
  ...
```
**Code Snippet 12:** *Call Flow in SQL Server Log Message*

When a "log" message is passed into SQL Server the code path is as in *Code Snippet 12*, when no log message is passed in after the `BindReadSNIPacket` in *Code Snippet 12*, the code will drop out until the `GetNextMessage` at the end of *Code Snippet 12*

We started this blog-post by asking where the message we see in *Figure 5* comes from, and what causes it. By now is should be clear that what causes it; is the `SendAckMessage` routine in the launchpad service. The message indicates that all work has been done. For the actual message we see, I believe it is generated by *SSMS* directly, it does not come from the launchpad service.

When a message is explicitly generated in the R script, that message goes back to the launchpad service which calls `SendLogMessage`. After the `SendLogMesage` the `SendAckMessage` will be called as well.

## Error Messages

So far we've seen how "print" messages generated from R are handled. What about error messages?

That has to be covered in next post. When I started this post I thought I knew how error messages was handled - but when I looked at it closer, I realized there was more to it than I thought, so I need to do some more investigations. Sorry!

## Summary

In this post we have seen how "print" messages originating form the external script as well as acknowledgment messages from the external environment are handled by the launchpad service as well as SQL Server.

#### Launchpad

The launchpad service:

* Listens on callbacks from the external engine
* The callback signals `launchpad!CLaunchContext::LaunchServTask`.
* `LaunchServTask` continues after signal into `launchpad!CLaunchContext::Cleanup`
* If a "print" message comes from the external engine, `launchpad!CSatelliteCargoContext::SendLogMessage` is called.
* Regardless if there is a "print" message or not, launchpad will tell SQL Server that the external engine is "done" via `launchpad!CSQLSatelliteCommunication::SendAckMessage`.

The figure below tries to illustrate the launchpad part:

![](/images/posts/sql_r_services_19_launchpad_flow.png)

**Figure 9:** *Launchpad Flow*

In *Figure 9* we see the main calls of leading up to and including when messages come back from the external engine. The numbered arrows show some of the calls and the communication in the launchpad service:

1. During startup an IOCP "listener" is set up.
1. Creates supporting directories and process, and initiates the connection to the external engine.
1. After work is done, a call comes back from the external engine.
1. This causes the "listener" to call `Read...` routines.
1. `LaunchServTask` is signaled.
1. Execution in `LaunchServTask` continues into launchpad!CLaunchContext::Cleanup.
1. If a "print" message has been passed back from the external engine, eventually `launchpad!CSatelliteCargoContext::SendLogMessage` is called.
1. `launchpad!CSatelliteCargoContext::SendLogMessage` sends the message to SQL Server.
1. `LaunchServTask` continues into `launchpad!CSQLSatelliteCommunication::SendAckMessage`, which sends an ack that the "job is done" to SQL Server.


#### SQL Server

In SQL Server the flow is something like so:

* As in the launchpad service, SQL Server listens for callbacks, on the named pipe connection to the launchpad service.
* A callback comes in, is being read and signals `sqllang!CXStmtQuery::ErsqExecuteQuery`.
* Execution continues and `sqlmin!CQueryExecContext::FinalCleanup` is called.
* `FinalCleanup` calls into `sqllang!CUDXR_ExternalScript::ShutdownService`.
* If a "print" message has been sent, `sqllang!CUDXR_ExternalScript::HandleLogMessage` is called.
* Independent of whether a "print" message is sent or not, `sqllang!CSQLSatelliteCommunication::WaitForAckMessage` will handle the final ack message.

As with the launchpad service I have tried to create a figure illustrating the flow in SQL Server:

![](/images/posts/sql_r_services_19_sql_flow.png)

**Figure 10:** *SQL Server Flow*

The numbered arrows in *Figure 10* illustrates:

1. During launch of the launchpad service, an IOCP "listener" is set up.
1. Message sent to the launchpad service.
1. After the call above, the SqlSatellite opens a TCP/IP connection to SQL Server.
1. Authentication packets and script packet is sent to  the SqlSatellite.
1. If there is data for `@input_data_1`, it is sent, together with two end packets.
1. Packets are coming back to SQL Server containing meta-data and the actual data.
1. `PullRow` is being signaled, and processing of meta-data as well as result rows continues.
1. The launchpad service sends "print"/ack messages to SQL Server. In the figure it is illustrated as one packet, but there is one message for "print" and one for ack.
1. A signal is sent to `ErsqExecuteQuery`.
1. Execution continues by calling into `sqllang!CXStmtQuery::ShutdownNormal`, which calls into `FinalCleanup, `ShutdownService, and a call to `sqllang!CSQLSatelliteCommunication::WaitForAckMessage` is made followed by `sqllang!CSQLSatelliteConnection::GetNextMessage`.
1. If a "print" message has been sent to SQL Server `ReadPayload` is called and then `sqllang!CUDXR_ExternalScript::HandleLogMessage`. If no "print" message has been sent in, the code loops on `sqllang!CSQLSatelliteCommunication::WaitForAckMessage`.
1. SQL Server loops on `sqllang!CSQLSatelliteCommunication::WaitForAckMessage` and waits for the ack message, 
1. When the ack message has been received, the eventual messages are sent to the calling code.

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
