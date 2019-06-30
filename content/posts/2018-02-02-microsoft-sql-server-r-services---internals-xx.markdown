---
layout: post
title: Microsoft SQL Server R Services - Internals XX
author: nielsb
date: 2018-02-02T19:48:22+02:00
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
  - WireShark
description: A drill down, using WinDbg, WireShark, Process Monitor, into how error messages in the external engine is handled by SQL Server. 
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
  - WireShark   
---

This is the 21:th post in a series about **Microsoft SQL Server R Services**, (it is now called **Microsoft SQL Server Machine Learning Services**), and the 20:th post that drills down into the internal of how it works. 

Wow, 20 posts about internals - when I started this **Microsoft SQL Server R Services** series, I thought I might achieve five or six posts. I would never have - in my wildest fantasies - thought I would reach twenty!

To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

We are however now coming closer to the end of this whole series, and this post is the last for **Internals**. After this post, I foresee one, possibly two, more posts about other things related to **Microsoft SQL Server R Services**  - and then we are done! 

<!--more-->

In the last post: [Internals - XIX][si19] we discussed how "print" statements and acks came back to SQL Server from the external engine. When I started writing that post, I intended to cover error messages as well, but as I was investigating what happens, I realised it was more to error messages than what I initially thought. So in this post, we talk about how SQL Server and the launchpad service handle errors.

## Recap

Before we go into the details about errors, let us do a recap of the [Internals - XIX][si19] post, as there are many similarities between the handling of error messages and "print"/ack messages are.

The easiest way to recap is to use the two figures we had in [Internals - XIX][si19] which illustrated the flow of the launchpad service as well as SQL Server.


#### Launchpad Service

This is the flow (on a high level) in the launchpad service:

![](/images/posts/sql_r_services_19_launchpad_flow.png)

**Figure 1:** *Launchpad Flow*

In *Figure 1* we see the main calls of leading up to and including when messages come back from the external engine. The numbered arrows show some of the calls and the communication in the launchpad service:

1. During startup, an IOCP "listener" is set up.
1. Creates supporting directories and process, and initiates the connection to the external engine.
1. A call comes back from the external engine when work finishes.
1. The call causes the "listener" to call `Read...` routines.
1. `LaunchServTask` is signalled.
1. Execution in `LaunchServTask` continues into launchpad!CLaunchContext::Cleanup.
1. A call to  `launchpad!CSatelliteCargoContext::SendLogMessage` happens if a "print" message has been passed back from the external engine, eventually `launchpad!CSatelliteCargoContext::SendLogMessage` is called.
1. `launchpad!CSatelliteCargoContext::SendLogMessage` sends the message to SQL Server.
1. `LaunchServTask` continues into `launchpad!CSQLSatelliteCommunication::SendAckMessage`, which sends an ack that the "job is done" to SQL Server.

#### SQL Server

This is the high level flow in SQL Server:

![](/images/posts/sql_r_services_19_sql_flow.png)

**Figure 2:** *SQL Server Flow*

The numbered arrows in *Figure 2* illustrates:

1. During the launch of the launchpad service, an IOCP "listener" is set up.
1. Message sent to the launchpad service.
1. After the call above, the SqlSatellite opens a TCP/IP connection to SQL Server.
1. SQL Server sends authentication packets and script packet to the SqlSatellite.
1. If there is data for `@input_data_1`, it is sent, together with two end packets.
1. Packets are coming back to SQL Server containing meta-data and the actual data.
1. `PullRow` is being signalled, and processing of meta-data as well as result rows continues.
1. The launchpad service sends "print"/ack messages to SQL Server. In the figure, they appear as one packet, but there is one message for "print" and one for ack.
1.  `ErsqExecuteQuery` is signalled.
1. Execution continues by calling into `sqllang!CXStmtQuery::ShutdownNormal`, which calls into `FinalCleanup, `ShutdownService, and a call to `sqllang!CSQLSatelliteCommunication::WaitForAckMessage` is made followed by `sqllang!CSQLSatelliteConnection::GetNextMessage`.
1. If a "print" message has is sent to SQL Server, `ReadPayload` is called and then `sqllang!CUDXR_ExternalScript::HandleLogMessage`.  The code loops on `sqllang!CSQLSatelliteCommunication::WaitForAckMessage` if there is no "print" message. 
1. SQL Server loops on `sqllang!CSQLSatelliteCommunication::WaitForAckMessage` and waits for the ack message, 
1. After receiving the ack message, SQL Server sends relevant messages to the calling code.  


## Housekeeping

Before we "dive" into today's topics let us look at the code and the tools we use today. This section is here for those of who want to follow along in what we are doing in the posts.

#### Helper Tools

To help us figure out the things we want, we use *Process Monitor*, *WinDbg* and *WireShark*: 

* *Process Monitor*, is used it to filter TCP traffic. If you want to refresh your memory about how to do it, we covered that in [Internals - X][si10] as well as in [Internals - XIV][si14].
* In the last few posts I have used *WinDbg preview* as my debugger, but in this post, I am reverting to *WinDbg* "classic". If you need help with setting it up, I covered that in [Internals - I][si1].
* I use *WireShark* for network packet sniffing. If you want a refresher about *WireShark*, we covered the setup and so forth in [Internals - X][si10].

#### Code

In this post we won't need a specific database, we'll just some basic code:

```sql
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(10)
                             d <- 42';
```
**Code Snippet 1:** *Base Code to Execute*

The code in *Code Snippet 1* is the code we use for "base-lining", e.g. what it looks like when everything works. The `Sys.sleep` is in the script to make it easier for us to see what happens, and in what order.

We also use variants of that code to create errors:

```sql
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(10)
                             d <- 42
                             #the function below does not exist
                             nonExistFunc(d)';
```
**Code Snippet 2:** *Script with Missing Function*

```sql
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(1)
                             d <- 42',
                 @input_data_1 = N'SELECT 1/ 0';
```
**Code Snippet 3:** *Error When Selecting Data*

We talk more about the two code snippets below.

## Error

When we discuss error messages, there are two main types of errors, and the code above exemplifies that:

* Errors generated from the external engine script - *Code Snippet 2*.
* Errors raised when generating the input data-set (`@input_data_1`) - *Code Snippet 3*.

So, let us look at what happens when we execute the code in *Code Snippet 2* and *Code Snippet 3*.

This is the output from *Code Snippet 2*:

![](/images/posts/sql_r_services_19_error1.png)

**Figure 3:** *R Script Error*

The output from executing the code in *Code Snippet 3*:

![](/images/posts/sql_r_services_20_error2.png)

**Figure 4:** *SQL Execution Error*

When looking at both *Figure 3* and *Figure 4*, we see that there are SQL Server error numbers assigned to the errors. However, compare the errors in *Figure 3*, and *Figure 4*. In *Figure 3* there are two errors; `39004` and `39019` - and in the error message they both refer to the external script. In *Figure 4* however, the error message is the usual message about division by zero, and no referral to external script whatsoever. There is though some text about SqlSatellite.

So it seems that for specific external script errors, SQL Server knows about them, but others not.

## Known SQL Errors

We start by looking at, what I call, known SQL errors - like we see in *Figure 3*. Just for fun, let us execute following code:

```sql
SELECT message_id, text FROM sys.messages
WHERE message_id BETWEEN 39000 AND 39999
AND language_id = 1033;
```
**Code Snippet 4:** *Selecting Error Messages*

On my SQL Server 2016 box the statement in *Code Snippet 4* returns 27 rows, and when browsing through the result I realise that most of them are related to the external script or the external engine:

![](/images/posts/sql_r_services_20_error_msgs.png)

**Figure 5:** *SQL Server Error Messages*

In *Figure 5* wee see some of the error codes related to the external script/engine - so the question is how SQL Server knows that, what originates from the external engine, is an error?

We know that error(s) are raised in SQL Server when something goes wrong in the external engine (see *Figure 3*), but what happens in the launchpad service? So, let us do this:

* Start up two instances of *WinDbg* as admin.
* Attach *WinDbg* to the SQL Server process (`sqlservr.exe`), and the launchpad process (`launchpad.exe`) - **DO NOT DO THIS ON A PRODUCTION SERVER**.
* In both instances of *WinDbg* enable an *Event Filter* for `C++ EH Exception`. If you need to refresh you memory about how to do it, [Internals - II][si2] goes into the details.
* Execute the code in *Code Snippet 2*.

When you execute, you see how you just continue through in the launchpad service, but you break with an exception in SQL Server. It looks like exceptions in the external engine does not affect the launchpad service at all. So let us start looking more in detail what happens in SQL Server.

#### SQL Server I

The exception in SQL server we received above looks like this:

```c++
(17d0.3744): C++ EH exception - code e06d7363 (first chance)
First chance exceptions are reported before any exception handling.
This exception may be expected and handled.
KERNELBASE!RaiseException+0x68:
00007ffe\`dbba2918 488b8c24c0000000 mov     
rcx,qword ptr [rsp+0C0h] ss:000000e1`817fb9c0=00001f7285a2fbf6
```
**Code Snippet 5:** *External Engine Exception in SQL*

As in *Code Snippet 5*, there is an error in SQL Server, and when you continue a second error is raised which you continue through as well. Now execute the code in *Code Snippet 2* again, and check the call-stack (`k`) when SQL Server breaks at the first error :

```c++
KERNELBASE!RaiseException+0x68
MSVCR120!_CxxThrowException+0xb3 
         [f:\dd\vctools\crt\crtw32\eh\throw.cpp @ 154] 
sqldk!ExceptionBackout::GetCurrentException+0x385
sqldk!ex_raise2+0x52f
sqldk!ex_raise+0xc4
sqlmin!CQScanUdx::GetRow+0x172
sqlmin!CQueryScan::GetRow+0x81
sqllang!CXStmtQuery::ErsqExecuteQuery+0x4dc
...
sqllang!SpExecuteExternalScript+0x140e
...
ntdll!RtlUserThreadStart+0x21
```
**Code Snippet 6:** *Call Stack at Exception*

Interesting, in *Code Snippet 6* we see the call to `sqlmin!CQScanUdx::GetRow` raise an error - even though we are not retrieving any data from the engine! What happens here?

Remember back to the last posts, where we spoke about how the SqlSatellite returns packets to SQL Server after execution. We saw an example of what it looks like if we execute the code in *Code Snippet 1*:

![](/images/posts/sql_r_services_19_procmon1.png)

**Figure 6:** *Return Packets*

We saw *Figure 6* in [Internals - XIX][si19], and we discussed in that post, how the SqlSatellite returns the three packets outlined in red above to SQL Server. The first packet contains metadata information about potential result-sets returned, and if there is no result-set, we still get the packet. The second packet is a packet indicating the end of the result-set, and the third packet can potentially contain values of output parameters. Rows returned for a result-set, appear in packets, between the first and second packet in the figure above.

So, in the case of an error, like in *Figure 3* above, are there any changes in what the SqlSatellite returns? By now, you probably realise that if I ask a question like that - there is a difference, but let us find out regardless:

* Run *Process Monitor* as admin and load the filter we used in [Internals - XVI][si16] where we filtered for `TCP Send` and `TCP Receive` for `BxlServer.exe`.
* Execute the code in *Code Snippet 2* (without the `Sys.sleep` if you want) and look at the output from *Process Monitor*:

![](/images/posts/sql_r_services_20_procmon1.png)

**Figure 7:** *Process Monitor Output Error*

It is interesting, that when an error happens, we do not get the packets referred to above. In *Figure 7* we only see one packet sent back from the SqlSatellite (outlined in red) after the SqlSatellite has received the various packets from SQL Server. While you look at the output from *Process Monitor*, also make a note of the `Path` column and the last value (in the figure it is 55538). That value is the port SQL Server receives packets. We use this now in *WireShark* to try and see if we can get any more information about what is happening.

So, let us switch over to *WireShark*:

* Run *WireShark* as admin.
* Choose the network adapter to "sniff" on. See [Internals - X][si10] for discussion around loop-back adapters etc.
* Set a display filter on the port SQL Server listens on (what you saw in the `Path` column). In this case we want to sniff incoming packets, and if we did it based on what we saw in *Figure 7* the filter should be: `tcp.dstport==55538`.
* Apply the filter.

To start with, we try to see what the packets look like when everything works - and the packets we are interested in, are the two packets with a length of 28. When we execute the code in *Code Snippet 1* and showing the two data packets as hex, it looks like so:

```c++
//first 28 bytes packet
01 00 06 80 1c 00 00 00  b8 16 27 5d 86 b9 95 47
a3 fc 06 0a 17 f1 92 ca  00 00 00 00            

//2:nd 28 bytes packet
01 00 0d 80 1c 00 00 00  b8 16 27 5d 86 b9 95 47
a3 fc 06 0a 17 f1 92 ca  00 00 00 00
```
**Code Snippet 7:** *Packets When No Error*

When looking at the packets in *Code Snippet 7*, it looks like the first 4 bytes determines some packet type. Why I say that is when you execute the code multiple times, the first four bytes for packet 1 always look the same, and the same goes for the second packet. The second 4 bytes in both first and second packet, indicates the packet size (`1c` = 28). I have no "clue" what the following 16 bytes identify, but it is interesting to notice that the values are the same between packet 1 and 2. The values differ though in between executions. The last four bytes are always 0 in packet 1, in packet two the first byte indicates how many output parameters are returned (if there are any). Remember it is the second packet that contains the output parameters. The last byte in packet 2 is an "end" byte if parameters are returned, otherwise 0.

So the above is when there are no errors. What when it is? Clear the display in *WireShark* (easiest way is to stop capturing packets, and start again) and execute the code in *Code Snippet 2*. As we know from the discussion around *Figure 7*, we only get one packet back - and when we look at the data as hex it looks like this:

```c++
01 00 04 80 1c 00 00 00  31 0b 6c fe b0 9f 7d 43
a4 75 79 5a 70 4c e1 05  12 00 2a 00            
```
**Code Snippet 8:** *Packet When Error*

The packet in *Code Snippet 8* is somewhat similar to what we see in *Code Snippet 7*, in that the first four bytes are always the same, irrespective of the error packet and the second four bytes part indicating the size. What is different and potentially points out that this is an error packet, is the last four bytes. The four last bytes are always the same for any error packet, and as we see - they are not 0.

To summarize what we know so far when an error happens in the external engine:

* SQL Server receives one 28 bytes data packet back from the SqlSatellite.
* The four last bytes always are `12 00 2a 00`.

Let's go back to the call-stack we see in *Code Snippet 6* and try to figure out what happens in the code. We have already said the error happens in `sqlmin!CQScanUdx::GetRow`. We have not spoken much about `GetRow` at all, but if you remember in [Internals- XVII][si17] we discussed about how `sqllang!CXStmtQuery::ErsqExecuteQuery` called `sqllang!CUDXR_ExternalScript::PullRow`. In fact `sqllang!CXStmtQuery::ErsqExecuteQuery` calls `sqlmin!CQueryScan::GetRow` which in turn calls `sqlmin!CQScanUdx::GetRow` and it calls `PullRow`.

In [Internals - XVII][si17] we traced the `PullRow` call and saw how SQL Server handled returning data. To see what happens during an error, let us do the trace one step up - in `sqlmin!CQScanUdx::GetRow`. We start with the code that works (*Code Snippet 1*):

* Change the `Sys.sleep` in the script in *Code Snippet 1` to 30 seconds.
* Set a break-point in the SQL Server process at `sqlmin!CQScanUdx::GetRow`.
* Execute the code in *Code Snippet 1*.
* When `sqlmin!CQScanUdx::GetRow` hits the breakpoint, do a `wt -l8` (trace and watch the execution 8 levels deep).

Look at the *WinDbg* output when the `Sys.sleep(30) is hit in the script, and notice the last few lines look like so:

```c++
sqllang!EventInternal<SuspendQueueSLock>::Wait
 KERNEL32!TlsGetValueStub
 KERNEL32!TlsGetValue
sqllang!EventInternal<SuspendQueueSLock>::Wait
 sqldk!SystemThread::GetCurrentId
sqllang!EventInternal<SuspendQueueSLock>::Wait
 sqldk!SOS_Task::PreWait
sqllang!EventInternal<SuspendQueueSLock>::Wait
 sqldk!SOS_Scheduler::Suspend
```
**Code Snippet 9:** *wt Output at Sys.sleep*

The code in *Code Snippet 9* is what precedes the code we saw in [Internals - XVII][si17] where the execution waited for a signal. After the trace has finished, copy it to a text file to make it easier to investigate what happens. Then execute the code in *Code Snippet 2* and do a new trace, and copy that result into a new file as well. When you then compare the two files you see how the first part is identical:

```c++
sqlmin!CQScanUdx::GetRow
  sqllang!CUDXR_ExternalScript::PullRow
    sqllang!CUDXR_ExternalScript::ProcessOutputSchema
      sqllang!CUDXR_ExternalScript::GetOutputSchema
        sqllang!CServerCargoContext::ReadSchemaInternal
          sqllang!CSQLSatelliteCommunication::CSQLSatelliteCommunication
          ...
          sqllang!CServerCargoContext::ReadAllPackets
            sqllang!CSQLSatelliteConnection::GetNextMessage
              ...
              sqllang!EventInternal<SuspendQueueSLock>::Wait
                sqldk!SOS_Scheduler::Suspend
              //here is Sys.sleep

              //here we continue
                sqldk!SOS_Scheduler::SuspendNonPreemptive
              sqllang!EventInternal<SuspendQueueSLock>::Wait
               ...
            sqllang!CSQLSatelliteConnection::GetNextMessage
              sqllang!CSQLSatelliteConnection::RetrieveMessage
                ...
          sqllang!CServerCargoContext::ReadAllPackets
            sqllang!CSQLSatelliteCommunication::BindReadSNIPacket
              sqllang!CSQLSatelliteCommunication::GetSQLSatelliteMessage
              ...
            ...
          sqllang!CServerCargoContext::ReadAllPackets
          ...
```
**Code Snippet 10:** *Common Code Path*

In *Code Snippet 10* we recognise from [Internals - XVII][si17] the calls to retrieve rows, and they are the same in both trace files up until around line 50, after the `ReadAllPackets` in the next to last line above. Continuing,  what we see in the files change. In the no error trace file nothing out of the ordinary happens, and eventually, the trace ends with the call to `sqllang!CUDXR_ExternalScript::ProcessOutputArguments`, which we discussed in [Internals - XVIII][si18]. The error trace file looks completely different though from after the last `ReadAllPackets` above:

```c++
sqlmin!CQScanUdx::GetRow
  sqllang!CUDXR_ExternalScript::PullRow
    sqllang!CUDXR_ExternalScript::ProcessOutputSchema
      sqllang!CUDXR_ExternalScript::GetOutputSchema
        sqllang!CServerCargoContext::ReadSchemaInternal
        ...
          
          sqllang!CServerCargoContext::ReadAllPackets
            sqllang!CSQLSatelliteCommunication::BindReadSNIPacket
              sqllang!CSQLSatelliteCommunication::GetSQLSatelliteMessage 
              ...
          //this is the last ReadAllPackets above
           sqllang!CServerCargoContext::ReadAllPackets
            sqllang!CServerCargoContext::HandleSpecialMessage
              sqllang!CServerCargoContext::HandleAbortMessage
              ...
            ...
    sqllang!CUDXR_ExternalScript::ProcessOutputSchema
  sqllang!CUDXR_ExternalScript::PullRow
sqlmin!CQScanUdx::GetRow
  sqllang!CUDXC_ExternalScript::EUdxTypeGet
sqlmin!CQScanUdx::GetRow
  ...
...
  sqldk!ex_raise
    sqldk!ex_raise2
    ...
           ntdll!RtlRaiseException
           ...
```           
**Code Snippet 11:** *Code Path for Exception*

Included in *Code Snippet 11* is the start of the routine, the same as in *Code Snippet 10*, but we see how after the last `ReadAllPackets` the call goes into `sqllang!CServerCargoContext::HandleSpecialMessage` and `sqllang!CServerCargoContext::HandleAbortMessage`. These two calls are still inside the `PullRow` and `ProcessOutputSchema` calls, e.g. while SQL Server processes the packet from the SqlSatellite. The `HandleSpecialMessage` and `HandleAbortMessage` explains the packet in *Code Snippet 8*: it is an abort packet.

Further down in the code in *Code Snippet 11* is a call to `sqllang!CUDXC_ExternalScript::EUdxTypeGet`, where - I believe - SQL Server retrieves the type of error and then raises the error in the `sqldk!ex_raise` call-chain. The question now is how SQL Server knows the error message? What I mean is: when we look at the `text` column in the result from *Code Snippet 4* we see for error number the text being: `An external script error occurred: %.*ls%.*ls`. The `%.*ls%.*ls` characters are substitution parameters and when we look at the actual error message in *Figure 3*, the replacement for the substitution parameters is what we see outlined in red below:

![](/images/posts/sql_r_services_20_error3.png)

**Figure 8:** *Substitution Text*

So, where do the substitution outlined in *Figure 8* come from, and what is the text outlined in blue in the same figure? We know that the actual error-text is not part of the 28 bytes packet from the SqlSatellite, as no matter how long the error message is, the length of the packet is always the same. So where have we seen messages being passed back to SQL Server, without being in any data packets from the SqlSatellite? Well, we saw it in [Internals - XIX][si19] where the launchpad service did send "print" messages as well as ack messages from the external engine to SQL Server. So, let us go to the launchpad service and ["spelunk"][1] around a bit:

#### Launchpad

We know, from [Internals - XIX][si19], that the two routines used when sending messages are:

* `launchpad!CSatelliteCargoContext::SendLogMessage`
* `launchpad!CSQLSatelliteCommunication::SendAckMessage`

First, we try to find any routines handling error messages specifically: `x *!*Send*Error*`. That returns one routine: `launchpad!HostErrorReportingManager:: SendErrorToUserWithTracing `. I did however not get a hit at a break-point set at the routine, when I executed the code in *Code Snippet 2*. So it looks like our best bet is one of the previously mentioned routines, and we try `launchpad!CSatelliteCargoContext::SendLogMessage` first:

* Set a break-point `launchpad!CSatelliteCargoContext::SendLogMessage`.
* Execute the code in *Code Snippet 1* (no error code).

You see how the code executes all the way through, and the breakpoint is not hit. However, the execution breaks at the break-point when you run  *Code Snippet 2* (error)! The only difference between the two code snippets is the error in *Code Snippet 2*, so it looks like the launchpad service sends a message to SQL Server with the error text from the external engine.

#### SQL Server II

We know from [Internals - XIX][si19] that `sqllang!CUDXR_ExternalScript::HandleLogMessage` handles messages that are sent through `launchpad!CSatelliteCargoContext::SendLogMessage`. I wonder if that is the case when there is an exception as well:

* Disable the break-points in the launchpad *WinDbg* instance.
* Disable any break-points in the SQL Server *WinDbg* instance.
* Set a break-point at `sqllang!CUDXR_ExternalScript::HandleLogMessage`.
* Run the *Code Snippet 2* code.
* Continue through the exceptions.

Cool, we hit the `HandleLogMessage` break-point, so let us look at the call-stack (`k`):

```c++
sqllang!CUDXR_ExternalScript::HandleLogMessage
sqllang!CSQLSatelliteCommunication::WaitForAckMessage+0x164
sqllang!CUDXR_ExternalScript::ShutdownService+0x250
sqlmin!CUDXR_ExternalScriptCleanup::Close+0xe
sqlmin!CQueryExecContext::FinalCleanupNoX+0x116
sqlmin!CQueryScan::DestroyQueryOnException+0x129
sqllang!CXStmtQuery::ShutdownOnException+0xc8
sqllang!CXStmtQuery::FinishOnExceptionImp+0x67
sqllang!_isa_available_init+0xe8cf3
MSVCR120!_CallSettingFrame+0x20 
               [f:\dd\vctools\crt\crtw32\eh\amd64\handlers.asm @ 51] 
MSVCR120!__CxxCallCatchBlock+0xf5 
               [f:\dd\vctools\crt\crtw32\eh\frame.cpp @ 1281] 
ntdll!RcConsolidateFrames+0x3
sqllang!CMsqlExecContext::FExecute+0xa9e
sqllang!CSQLSource::Execute+0x983
sqllang!SpExecuteExternalScript+0x140e
...
ntdll!RtlUserThreadStart+0x21
```
**Code Snippet 12:** *HandleLogMessage Call Stack*

The call-stack we see in *Code Snippet 12* indicates a similar code path for `HandleLogMessage` as we saw in *Code Snippet 12* in the [Internals - XIX][si19] post . They are similar, but there are some differences which becomes clear when we compare the code paths between the two call-stacks. In a no error scenario we have a code path like this:

```c++
sqllang!CMsqlExecContext::FExecute
  sqllang!CMsqlExecContext::ExecuteStmts<1,1>
    sqllang!CXStmtSelect::XretExecute
      sqllang!CXStmtQuery::ErsqExecuteQuery
        sqllang!CXStmtQuery::ShutdownNormal
          sqlmin!CQueryScan::DestroyQuery
            sqlmin!CQueryExecContext::FinalCleanup
              sqlmin!CUDXR_ExternalScriptCleanup::Close
              ...
              ...
                sqllang!CUDXR_ExternalScript::HandleLogMessage

```  
**Code Snippet 13:** *Code Path HandleLogMessage No Error*             

Whereas the code path for an exception looks like so:

```c++
sqllang!CMsqlExecContext::FExecute
  ...
  ...
  sqllang!CXStmtQuery::FinishOnExceptionImp
    sqllang!CXStmtQuery::ShutdownOnException
      sqlmin!CQueryScan::DestroyQueryOnException
        sqlmin!CQueryExecContext::FinalCleanupNoX
          sqlmin!CUDXR_ExternalScriptCleanup::Close
            ...
            ...
              sqllang!CUDXR_ExternalScript::HandleLogMessage
```              
**Code Snippet 14:** *Code Path HandleLogMessage with Error*    

When we compare *Code Snippet 13* and *Code Snippet 14* we see how - in both cases - the code goes into shutdown and cleanup routines, but in the error case these routines are "exception" routines:

* `sqllang!CXStmtQuery::FinishOnExceptionImp`
* `sqllang!CXStmtQuery::ShutdownOnException`
* `sqlmin!CQueryScan::DestroyQueryOnException`

The question now is how the message received from the external engine via the launchpad service is "hooked" up to the actual exception. The assumption is that the answer to that has something to do with `HandleLogMessage`. So, let us compare what happens in `HandleLogMessage` when we run code that logs a message (as we did in [Internals - XIX][si19]), with running code that causes an exception. 

This is the code with no exception:

```sql
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(10)
                             cat("Hello World")
                             d <- 42';
```
**Code Snippet 15:** *Code with Print*

The code in *Code Snippet 15* is the same code we used in [Internals - XIX][si19], and this is what we do: 

* Set a breakpoint at `sqllang!CUDXR_ExternalScript::HandleLogMessage`. 
* Run the code in *Code Snippet 15*. 
* Do a trace, (`wt -l6`), of the `HandleLogMessage` call when you hit the breakpoint.
* Copy the output of the trace into a new text file.
* Make sure the `C++ EH Exception` event filter is still enabled.
* Run the code in *Code Snippet 2*.
* Continue through the exceptions.
* Do a trace, (`wt -l6`), of the `HandleLogMessage` call when you hit the breakpoint.
* Copy the output of the trace into a new text file.

When you compare the two files you see they are similar, but at around line 190, or so, there is a difference. In the "no-error" file you see something like so:

```c++
sqllang!CErrorReportingManager::CwchFormatAndPrint
  sqllang!CAutoInterceptErrorForTsqlCatch::Initialize
    KERNEL32!TlsGetValueStub
    KERNEL32!TlsGetValue
  sqllang!CAutoInterceptErrorForTsqlCatch::Initialize
sqllang!CErrorReportingManager::CwchFormatAndPrint
  sqllang!CErrorReportingManager::SetError
    KERNEL32!TlsGetValueStub
    KERNEL32!TlsGetValue
  sqllang!CErrorReportingManager::SetError
  sqllang!getret
    KERNEL32!TlsGetValueStub
    KERNEL32!TlsGetValue
  sqllang!getret
    KERNEL32!TlsGetValueStub
    KERNEL32!TlsGetValue
  sqllang!getret
sqllang!CErrorReportingManager::CwchFormatAndPrint
  sqllang!CErrorReportingManager::SendErrorToUser
  ...
  sqllang!ErrorReportedAutoPublish::Publish
```
**Code Snippet 16:** "HandleLogMessage No Error"    

However in the "error" file you see:

```c++
sqllang!CErrorReportingManager::CwchFormatAndPrint
  sqllang!CAutoInterceptErrorForTsqlCatch::Initialize
    KERNEL32!TlsGetValueStub
    KERNEL32!TlsGetValue
  sqllang!CAutoInterceptErrorForTsqlCatch::Initialize
    KERNEL32!TlsGetValueStub
    KERNEL32!TlsGetValue
  sqllang!CAutoInterceptErrorForTsqlCatch::Initialize
    KERNEL32!TlsGetValueStub
    KERNEL32!TlsGetValue
  sqllang!CAutoInterceptErrorForTsqlCatch::Initialize
    sqllang!PCXCtxtGetIfExistsEXPENSIVE
      KERNEL32!TlsGetValueStub
      KERNEL32!TlsGetValue
    sqllang!PCXCtxtGetIfExistsEXPENSIVE
  sqllang!CAutoInterceptErrorForTsqlCatch::Initialize
    sqllang!PCXCtxtGetIfExistsEXPENSIVE
      KERNEL32!TlsGetValueStub
      KERNEL32!TlsGetValue
    sqllang!PCXCtxtGetIfExistsEXPENSIVE
  sqllang!CAutoInterceptErrorForTsqlCatch::Initialize
    sqllang!CExecLvlRepresentation::FErrorModeJumpToCatch
  sqllang!CAutoInterceptErrorForTsqlCatch::Initialize
sqllang!CErrorReportingManager::CwchFormatAndPrint
  sqllang!CErrorReportingManager::SetError
    KERNEL32!TlsGetValueStub
    KERNEL32!TlsGetValue
  sqllang!CErrorReportingManager::SetError
  sqllang!getret
    KERNEL32!TlsGetValueStub
    KERNEL32!TlsGetValue
  sqllang!getret
    KERNEL32!TlsGetValueStub
    KERNEL32!TlsGetValue
  sqllang!getret
sqllang!CErrorReportingManager::CwchFormatAndPrint
  sqllang!CErrorReportingManager::SendErrorToUser
  ...
  sqllang!ErrorReportedAutoPublish::Publish
```
**Code Snippet 17:** "HandleLogMessage Exception"    

You can see how, in the "error" file (*Code Snippet 17*), the code loops on `sqllang!CAutoInterceptErrorForTsqlCatch::Initialize`, before it calls into `sqllang!CExecLvlRepresentation::FErrorModeJumpToCatch`. This loop does not happen in the "non-error" case. Oh, and it is interesting to see how in the case of "normal" log messages, the message is still considered being an error:

* `sqllang!CErrorReportingManager::SetError`
* `sqllang!CErrorReportingManager::SendErrorToUser`
* `sqllang!ErrorReportedAutoPublish::Publish`

## Errors Unknown to SQL Server

This post has become long, but let us talk a little bit about the type of error we saw in *Figure 4* before we finish. I refer to where SQL Server does not know about the error in the external engine (you see no specific external engine SQL Server error message).

If we look at how the error in *Code Snippet 2* is handled and compare it with the error in *Code Snippet 3*, we may think they are handled the same way (an error is an error, right?), and it may look like that. For example, if we look at *Process Monitor* we see the same 28 bytes packet sent to SQL Server as we saw in *Figure 7*. The packet itself looks the same as in *Code Snippet 8* (first 4 bytes - `01 00 04 80` second 4 bytes - `1c 00 00 00`, and the final 4 bytes - `12 00 2a 00`). These similarities led me to believe we would see the same flow as in *Code Snippet 11*, where the code goes into `sqllang!CServerCargoContext::HandleSpecialMessage` and further down into `sqllang!CServerCargoContext::HandleAbortMessage`. I was wrong! 

I realised the errors of my ways when I set a breakpoint at `sqllang!CServerCargoContext::HandleSpecialMessage`, ran the code in *Code Snippet 3*, and the code never hit the breakpoint! So what happened here? Well, the actual exception happened way before sending the `@input_data_1` data to the SqlSatellite, and that is the cause of what we see. So let us:

* Disable all breakpoints.
* Keep the `C++ EH Exception` event filter enabled.

When we run the *Code Snippet 3* code, we see how the execution breaks at exception three times in quick succession. When inspecting the call-stack of each of those three occurrences we see how all three exceptions are related to the ` sqlTsEs!ESArithErrorHandler` routine which handles, among other things, division by zero.

There is a slight pause when continuing after the third exception, and then we break once again with a new exception. The call-stack now looks like so:

```c++
KERNELBASE!RaiseException+0x68
MSVCR120!_CxxThrowException+0xb3 
          [f:\dd\vctools\crt\crtw32\eh\throw.cpp @ 154] 
sqldk!ExceptionBackout::GetCurrentException+0x385
sqldk!ex_raise2+0x52f
sqldk!ex_raise+0xc4
sqlTsEs!ESArithErrorHandler+0x159
sqlTsEs!CTEsArith<3,56,56,1,0>::RsltArithArgArg+0x94
sqlTsEs!CEsExec::GeneralEval4+0xe7
sqllang!CUDXR_ExternalScript::PushRow+0x78
sqlmin!CQScanUdx::PushNextChildRow+0x13b
sqlmin!CQScanUdx::GetRow+0x79
sqlmin!CQueryScan::GetRow+0x81
sqllang!CXStmtQuery::ErsqExecuteQuery+0x4dc
...
sqllang!SpExecuteExternalScript+0x140e
...
ntdll!RtlUserThreadStart+0x21
```
**Code Snippet 18:** "Exception after Division by Zero"    

The call-stack we see in *Code Snippet 18* shows how an exception happens when we try to push data rows to a packet to send to SqlSatellite. So, even though there is a division by zero exception initially, SQL Server still tries to push data to the satellite. The question is if some data goes to the satellite? Remember from previous posts how we covered data sent to the SqlSatellite and how the satellite received end-packet(s) after the data. I wonder what happens in this case:

* Disable the `C++ EH Exception` event filter. 
* Run *Process Monitor* as admin, and use the event filter we used above.
* Execute the code in *Code Snippet 3* and look at the output from *Process Monitor*:

![](/images/posts/sql_r_services_20_procmon2.png)

**Figure 9:** *Process Monitor Output 2*

When we compare *Figure 9* with what we see in *Figure 7*, there is not much of a difference. In both figures we see SQL Server sending a 28 bytes end-packet to the SqlSatellite. In *Figure 9* it is outlined in red, and in *Figure 7* it is just above the highlighted packet. Even though the two figures look the same, the difference lies in the end-packet. I used *WireShark* to capture packets from *Code Snippet 1* (no error), *Code Snippet 2* (external engine error) and *Code Snippet 3* (SQL error):

```c++
//OK
01 00 06 80 1c 00 00 00  76 01 1b 35 fa 75 64 48
81 34 e2 ec ec 7d 2d c6  00 00 00 00   

//engine exception
01 00 06 80 1c 00 00 00  90 2b 8a 3f 60 5c d5 49
a0 8f f0 c4 c0 bf c0 cb  00 00 00 00            

//exception SQL
01 00 04 80 1c 00 00 00  7f 82 bc e0 3f 5a 29 48
83 d7 20 46 ad 79 04 21  00 00 00 00  
```
**Code Snippet 19:** *Different End Packet Types*

When we look at the packets in *Code Snippet 19* we see how the two first packets look like the success packets SQL Server receives from the SqlSatellite. Why I say that, is because the four first bytes are the same: `01 00 06 80`. The third packet, however, looks like the "error" packet SqlSatellite sends to SQL Server, with a header of `01 00 04 80`. The difference between the packet that SQL Server sends to the satellite, and the packet SQL Server receives are the last four bytes. Sending to the satellite the bytes are `00 00 00 00`, whereas when an error packet comes back from the satellite, it is - as we discussed when we saw *Code Snippet 8*  - `12 00 2a 00`. I do believe that this packet is what causes the SqlSatellite to raise the error we see `SqlSatellite cannot read data chunk ...`. 

So this is what happens:

* The exception happens in the SQL Server engine, before the process has been handed over to the SqlSatellite.
* An error packet is sent to the satellite.
* The satellite cannot process the packet.
* The SqlSatellite sends back the error message we see.
* This is handled by the `HandleLogMessage` routine in SqlServer.

In the bullet points above I say that the `HandleLogMessage` routine handles the message, and you can see this by setting a breakpoint on this routine.

## Summary

We have in this post seen how there are two types of errors related to the external engine:

* Error raised in the extern engine itself.
* Error happening before the external engine has taken over.

When an error happens in the external engine: 

* the SqlSatellite sends an error packet to SQL Server. 
* SQL Server receives the packet and handles it in `sqllang!CServerCargoContext::HandleSpecialMessage` and `sqllang!CServerCargoContext::HandleAbortMessage`. This raises a SQL Server exception related to the external engine. 
* The error message from the external engine is sent to the launchpad service.
* The launchpad service sends the message to SQL Server via `launchpad!CSatelliteCargoContext::SendLogMessage`
* SQL Server handles the message in `sqllang!CUDXR_ExternalScript::HandleLogMessage`.

When the error happens in SQL Server before the external engine:

* An error packet is sent to the satellite.
* The satellite cannot process the packet.
* The SqlSatellite sends back the error message via `launchpad!CSatelliteCargoContext::SendLogMessage`.
* SQL Server handles the message in `sqllang!CUDXR_ExternalScript::HandleLogMessage` and related routines.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[1]: http://queue.acm.org/detail.cfm?id=945136



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

