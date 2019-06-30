---
layout: post
title: Microsoft SQL Server R Services - Internals XII
author: nielsb
date: 2017-10-31T19:57:36+02:00
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
  - SqlSatellite
description: More about the TCP/IPpackets sent from SQL Server to SqlSatellite.
keywords: 
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - SqlSatellite   
---

This is the 13:th post in a series about **Microsoft SQL Server R Services**, and the 12:th post that drills down into the internal of how it works. To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

The last few posts in this series has been about communication between SQL Server and SqlSatellite. We have discussed the connection between the two, and we have also seen how packets are sent from SQL Server to SqlSatellite. In this post we'll continue looking at what causes the packets to be send and what sends them. We will specifically look at the packet containing the external script, as well as the packet that contains the data (`@input_data_set_1`).

<!--more-->

## Recap

In [Internals - X][si10], we executed code looking like so:

```sql
exec sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(30)
                 d<-42'
               , @input_data_1 = N'
              SELECT TOP(1) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.rand_1M'
```
**Code Snippet 1:** *External Script with Data Select*

When executing the code in *Code Snippet 1*, and filtering on TCP event in *Process Monitor*, the output from the filtering looked like below:

![](/images/posts/sql_r_services_10_procmon_output3.png)

**Figure 1:** *Process Monitor Output Data Select*

By using *WireShark* we determined that the two highlighted packets (length 350, and 6300 respectively) contained the external script (packet with length 350), and the result from the `SELECT` (length 6300). We could however not determine what the two initial packets were, and what caused them to be sent - and in [Internals - XI][si11] we set out to try to find out more about those packets.

By doing some *WinDbg* ["spelunking"][1] we found out that the two packets are sent during authentication between SQL Server and the SqlSatellite and they are sent inside the `sqllang!CSQLSatelliteConnection::AuthenticateConnection` routine. The flow of calls can be illustrated as in the figure below:

![](/images/posts/sql_r_services_11_calls.png)

**Figure 2:** *Flow in SQL Server*

It is worth noting that the second `WriteAsync` is done on a separate thread from the first, but still within the `AuthenticateConnection` routine. We now know what causes the two first packets to be sent, and what routines are involved. We also know what the two following packets are for (script and data), but we do not know what routines are involved (other than `WriteMessage`), and we definitely don't know what the two packets with a length of 28 is for. As mentioned in the beginning of this post, this is now what we will try and figure out.

## Helper Tools

To help us figure out the things we want, we will use *WinDbg* and *Process Monitor*. In the case of *Process Monitor*, we'll use it to filter TCP traffic. If you want to refresh your memory about how to do it, we covered that in [Internals - X][si10].

#### WinDbg

We have used *WinDbg* throughout this series, and in [Internals - I][si1] we discussed how to set it up etc. The *WinDbg* we have used up until now is the "classic" *WinDbg*, that has been available throughout the years. In August Microsoft released a preview version of a more modern [*WinDbg* application][2].

It has been updated to have more modern visuals, faster windows, a full-fledged scripting experience, and Time Travel Debugging (whatever that is):

![](/images/posts/sql_r_services_12_windbg1.jpg)

**Figure 3:** *New WinDbg*

So, going forward in this series, the new *WinDbg* is the debugger I'll use.

## Script Packets

Let us first start with the script packets, and the code we'll use for this is what we also used in [Internals - XI][si11]:

```sql
exec sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(30)
                 d<-42'
```
**Code Snippet 2:** *Basic External Script*

The reason for using simple code like in *Code Snippet 1*, is that it might make it easier to understand what is happening, and we can compare with what is happening when executing some other, not so basic, code. Notice how in *Code Snippet 2* there is a `Sys.sleep`. It is there to make it easier to determine - when debugging - when data is sent to R and when data is coming back.

Before executing the code in *Code Snippet 2*: 

* start up *Process Monitor* and run it as admin 
* set up the filters we used in [Internals - X][si10]. 

After *Process Monitor* has been set up, you can execute the code. When you execute, look closely at the *Process Monitor* output, especially what it looks like at the time you hit `Sys.sleep`. After execution the output should look like so:

![](/images/posts/sql_r_services_12_procmon1.png)

**Figure 4:** *Process Monitor Output*

The red line in *Figure 4* illustrates where `Sys.sleep` happens. Now let us drill down into the two packets with length 204 and the packet with a length of 28. As we did in Internals - [X][si10] and [XI][si11], we'll set some breakpoints in *WinDbg*: 

* Start *WinDbg* as admin. 
* Attach to the SQL Server process - (as I have said so many times before, DO NOT do this on a production machine)

Let's now set some break-points:

* `bp sqllang!CUDXR_ExternalScript::ConnectToSatellite`
* `bp sqllang!CSQLSatelliteConnection::WriteMessage`
* `bp sqllang!Tcp::WriteAsync`

We use the `ConnectToSatellite` break-point as a "navigation" aid, e.g. we know that what we are interested in will happen after `ConnectToSatellite`. We should also keep in mind that there will be two `sqllang!Tcp::WriteAsync` calls after `ConnectToSatellite`, which is related to the authentication between SQL Server and SqlSatellite (see [Internals - XI][si11]), and whatever we are interested in comes after those two calls.

Execute the code in *Code Snippet 2*, and continue when you hit the first `WriteMessage` (this call is related top the named pipe connection between SQL Server and the launchpad service). Notice how you break at `ConnectToSatellite`, and when you continue, there are two `WriteAsync` straight after it (this is the authentication calls we covered in [Internals - XI][si11]). Now things are getting somewhat interesting; after the second `WriteAsync`, continue past `WriteMessage`, and you will break at `WriteAsync`, which is where the script is being sent to SqlSatellite.

At that point, let's have a look at the call-stack. If you use the old *WinDbg*, you do a `kc`, and in the new *WinDbg* you look at the call-stack window:

![](/images/posts/sql_r_services_12_windbg_callstack.png)

**Figure 5:** *Call-stack Window in New WinDbg*

In *Figure 5* we see the call-stack, and I have also copied it out to the code snippet below to get a "fuller" view of the stack, (I only show the stack from `sqllang!SpExecuteExternalScript` onwards):

```cpp
sqllang!Tcp::WriteAsync
sqllang!SNIWriteAsync + 0xb0
sqllang!CSQLSatelliteConnection::WriteMessage + 0x7d
sqllang!CSatelliteProxy::PostSetupMessage + 0x376
sqllang!CUDXR_ExternalScript::ConnectToSatellite + 0x62
sqllang!CUDXR_ExternalScript::Open + 0x96
sqlmin!CQScanUdx::Open + 0xe5
sqlmin!CQueryScan::StartupQuery + 0x316
sqllang!CXStmtQuery::SetupQueryScanAndExpression + 0x3fa
sqllang!CXStmtQuery::InitForExecute + 0x34
sqllang!CXStmtQuery::ErsqExecuteQuery + 0x4dc
sqllang!CXStmtSelect::XretExecute + 0x322
sqllang!CMsqlExecContext::ExecuteStmts<1,1> + 0x40d
sqllang!CMsqlExecContext::FExecute + 0xa9e
sqllang!CSQLSource::Execute + 0x983
sqllang!SpExecuteExternalScript + 0x140e
[snip]
```
**Code Snippet 3:** *Call Stack*

When we look at the call-stack in *Figure 5* or *Code Snippet 3* we see some "old friends"; `sqllang!CUDXR_ExternalScript::Open` and `sqllang!CUDXR_ExternalScript::ConnectToSatellite` amongst them. The routine that sends the packet seems to be `sqllang!CSatelliteProxy::PostSetupMessage`. 

To try to prove that we start by looking at code in `PostSetupMessage`, specifically around where `WriteMessage` is called. In the *WinDbg* console, do `uf sqllang!CSatelliteProxy::PostSetupMessage` and look for `sqllang!CSQLSatelliteConnection::WriteMessage`. The region containing `WriteMessage` looks something like so (I have taken out some memory addresses etc.):

```cpp
sqllang!CSatelliteProxy::PostSetupMessage+0x362:
  mov     eax,dword ptr [rax+4]
  mov     dword ptr [rcx+0A0h],eax
  mov     rdx,rcx
  mov     rcx,r12
  call    sqllang!CSQLSatelliteConnection::WriteMessage 
  jmp     sqllang!CSatelliteProxy::PostSetupMessage+0x37d Branch
```
**Code Snippet 4:** *PostSetupMessage and WriteMessage*

We know that `WriteMessage` causes the `WriteAsync` and in *Code Snippet 4* we see that after the `WriteMessage` call, the code "jumps" to `PostSetupMessage+0x37d`. Logically, we then can believe that when `PostSetupMessage+0x37d` is hit, the packet should have been sent. So now we set a break-point at `PostSetupMessage+0x37d`, and we use *Process Monitor* to capture TCP traffic, the same way we did above.  

Before you execute the code in *Code Snippet 2*, it is probably a good idea to clear the display in *Process Monitor*, so you more easily can see what happens. Execute the code, and let it continue until it breaks for the third time (after `ConnectToSatellite`) at `WriteAsync`. At this stage the *Process Monitor* output looks like this:

![](/images/posts/sql_r_services_12_procmon2.png)

**Figure 6:** *Process Monitor Output *

As we see in *Figure 6*, the packet containing the script has not been sent yet, but as soon as we continue the code in *WinDbg*, the packet is sent and is visible in *Process Monitor*. At this stage the code will hit the break-point at `PostSetupMessage+0x37d`, so we can now with certainty say that the script packet is sent from inside `PostSetupMessage`, and it has (in our example) a length of 204. So what about the packet with a length of 28?

We have seen how that packet is sent straight after the packet with a length of 204, so we'll investigate this packet in the same way we did with the "204" packet. Execute the code again, but at this time continue until you hit the `WriteAsync` that comes after the "204" packet. At that stage have a look at the call-stack:

```cpp
sqllang!Tcp::WriteAsync
sqllang!SNIWriteAsync + 0xb0
sqllang!CSQLSatelliteConnection::WriteMessage + 0x7d
sqllang!CSatelliteCargoContext::SendChunkEndMessage + 0x50
sqllang!CSatelliteCargoContext::SendChunkEnd + 0x3e
sqllang!CUDXR_ExternalScript::PushEOS + 0xa4
sqlmin!CQScanUdx::Open + 0x23b
sqlmin!CQueryScan::StartupQuery + 0x316
sqllang!CXStmtQuery::SetupQueryScanAndExpression + 0x3fa
sqllang!CXStmtQuery::InitForExecute + 0x34
sqllang!CXStmtQuery::ErsqExecuteQuery + 0x4dc
sqllang!CXStmtSelect::XretExecute + 0x322
sqllang!CMsqlExecContext::ExecuteStmts<1,1> + 0x40d
sqllang!CMsqlExecContext::FExecute + 0xa9e
sqllang!CSQLSource::Execute + 0x983
sqllang!SpExecuteExternalScript + 0x140e
```
**Code Snippet 5:** *Call Stack for "28" Packet*

At a cursory glance at the call-stack in *Code Snippet 5*, it looks quite similar to the call-stack in *Code Snippet 4*. However, when you start to look closer you can see it is not the same at all. There are no calls to `ConnectToSatellite` or `PostSetupMessage`, instead there are calls to some new routines:

* sqllang!CUDXR_ExternalScript::PushEOS
* sqllang!CSatelliteCargoContext::SendChunkEnd
* sqllang!CSatelliteCargoContext::SendChunkEndMessage

It seems that the call-stacks in code snippets 4 and 5 originates both from `sqlmin!CQScanUdx::Open`, however from different locations. What is somewhat strange is that if we were to do an `uf sqlmin!CQScanUdx::Open`, we would not see any calls to `sqllang!CUDXR_ExternalScript::PushEOS` from the `Open` routine, so they must be "hidden" down deep in the code. To get a better feel for what goes on we can try to trace through the calls in `sqlmin!CQScanUdx::Open`:

* Remove all breakpoints.
* Set a breakpoint at `sqlmin!CQScanUdx::Open`.

Execute the code again, and when you hit the breakpoint at `Open`, you execute the `wt`, (Trace and Watch), command. However do it with the `-l` option, which specifies the maximum depth of the calls to display. If you don't set the `-l` option, the `wt` will just go on and on and on. When I do it on my server I use a level of 4 (`wt -l 4`), and the end of the trace looks like so: 

```cpp
//lot of other code
  sqllang!CUDXR_ExternalScript::Open
    sqllang!CUDXR_ExternalScript::EstimateDataChunkRows
      sqllang!GetTypeSizeInBytes
    sqllang!CUDXR_ExternalScript::EstimateDataChunkRows
      sqllang!floor
      MSVCR120!floor
    sqllang!CUDXR_ExternalScript::EstimateDataChunkRows
  sqllang!CUDXR_ExternalScript::Open
sqlmin!CQScanUdx::Open
  sqllang!CUDXC_ExternalScript::EUdxTypeGet
sqlmin!CQScanUdx::Open
  sqllang!CUDXR_ExternalScript::PushEOS
    sqllang!CSatelliteCargoContext::SendChunkEnd
      sqllang!CSatelliteCargoContext::SendChunkEndMessage
        sqllang!CSatelliteCargoContext::PrepareChunkEndPacket
      sqllang!CSatelliteCargoContext::SendChunkEndMessage
        sqllang!CSQLSatelliteConnection::WriteMessage
      sqllang!CSatelliteCargoContext::SendChunkEndMessage
    sqllang!CSatelliteCargoContext::SendChunkEnd
      sqllang!CSQLSatelliteConnection::WaitWriteDone
    sqllang!CSatelliteCargoContext::SendChunkEnd
  sqllang!CUDXR_ExternalScript::PushEOS
sqlmin!CQScanUdx::Open
```
**Code Snippet 6:** *Trace and Watch of sqlmin!CQScanUdx::Open*

In *Code Snippet 6* we definitely see how the routines mentioned above are being called during `sqlmin!CQScanUdx::Open`. Based on their names we understand that the packet being sent has to do with informing the SqlSatellite that no more script data is coming.

> **NOTE:** In the code in *Code Snippet 6*, you can for now dismiss the first lines of code that has to do with `EstimateDataChunkRows`.

So the flow looks something like this (heavily abbreviated):

```cpp
sqllang!CXStmtQuery::ErsqExecuteQuery
  sqlmin!CQScanUdx::Open
    sqllang!CUDXR_ExternalScript::ConnectToSatellite
      sqllang!CSatelliteProxy::PostSetupMessage
  sqlmin!CQScanUdx::Open
    sqllang!CUDXR_ExternalScript::PushEOS
      sqllang!CSatelliteCargoContext::SendChunkEndMessage
```
**Code Snippet 7:** *Abbreviated Flow*

Please note that the flow in *Code Snippet 7* is for when no result data (no `@input_data_1`) is being sent. When we have result data the flow will look somewhat different as we will see below.    

## Input Data

Above we saw the packets for the external script and the end of script; how they were sent and what did send them. Now we'll have a look at the packets that are sent for data which is input for the script (`@input_data_1`). The code we'll use looks like this: 

```sql
exec sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(30)
                 d<-InputDataSet',
                 @input_data_1 = N'SELECT 42';
```
**Code Snippet 8:** *External Script with SELECT*

The difference between the code in *Code Snippet 8* and the code in *Code Snippet 2*, is that in *Code Snippet 8* we are selecting an input data set, that will be passed to the SqlSatellite together with the script. 

We'll use *Process Monitor* to be able to see when the packets are being sent, and initially we'll just run through the code and see the output in *Process Monitor*. Remove whatever breakpoints you have, and execute the code in *Code Snippet 8*. As you did above have a close look at the output from *Process Monitor* when the external code hits `Sys.sleep`. The output looks like this:

![](/images/posts/sql_r_services_12_procmon3.png)

**Figure 7:** *Process Monitor Output*

As in *Figure 4*, the red line you see in *Figure 7* illustrates where control has been handed over to the SqlSatellite (we hit `Sys.sleep()`). The packets we are interested in are the three just above the red line, with lengths of 2023, 28, and 28. We do know that the "2023" packet contains the data from the `SELECT`, and that one of the "28" packets is the "end of script" packet from above. We do not know which one it is, and we do not know what the second "28" packet is. 

> **NOTE:** From above, if you wonder why a packet sending just one integer has a size of 2023, that's something we'll look a bit into in next post.

To look more into the three packets we are interested in, we set breakpoints at:

* `bp sqllang!CSQLSatelliteConnection::WriteMessage`
* `bp sqllang!Tcp::WriteAsync`
* `bp sqllang!CUDXR_ExternalScript::PushEOS`

Clear the display in *Process Monitor* and execute the code in *Code Snippet 8*. Let the code continue through until you hit the break-point for `PushEOS`. At this stage the output in *Process Monitor* looks like so:

![](/images/posts/sql_r_services_12_procmon4.png)

**Figure 8:** *Process Monitor Output at PushEOS*

Based on what we saw when we looked at how script packets were sent, what we see in *Figure 8* is what we expected. We see how the script packet has been sent (length 234), and we are waiting for the end of script packet. What is somewhat different though, is the call-stack (from `SpExecuteExternalScript`):

```cpp
sqllang!CUDXR_ExternalScript::PushEOS
sqlmin!CQScanUdx::PushNextChildRow + 0x1af
sqlmin!CQScanUdx::GetRow + 0x79
sqlmin!CQueryScan::GetRow + 0x81
sqllang!CXStmtQuery::ErsqExecuteQuery + 0x4dc
sqllang!CXStmtSelect::XretExecute + 0x322
sqllang!CMsqlExecContext::ExecuteStmts<1,1> + 0x40d
sqllang!CMsqlExecContext::FExecute + 0xa9e
sqllang!CSQLSource::Execute + 0x983
sqllang!SpExecuteExternalScript + 0x140e
```
**Code Snippet 9:** *Call Stack at PushEOS with Input Data*

Notice in *Code Snippet 9* how `sqlmin!CQScanUdx::Open` is not in the stack at all. We'll come back to that in a little bit. Continue the execution from the break-point and stop at `WriteMessage`, and wait a second or two. Look at the output from *Process Monitor*:

![](/images/posts/sql_r_services_12_procmon5.png)

**Figure 9:** *Process Monitor Output at WriteMessage*

In *Figure 9* we now see how the input data packet (length 2023) have been sent, even though we haven't executed `WriteMessage`! When we now continue execution we will see how we hit:

* `sqllang!Tcp::WriteAsync`, which sends a packet with a length of 28.
* another `WriteMessage`, followed by
* `sqllang!Tcp::WriteAsync`, which sends a second packet with a length of 28.

At this stage we are now at the red line in *Figure 7*. Having seen this, there are some questions:

1. where did the data packet originate from, but no `sqllang!Tcp::WriteAsync` were called?
1. we saw two packets with a length of 28, we know one must be the script end packet, but which is it, and what is the other packet?

Let's start with point 1, where does the input data come from? For one reason or another it doesn't originate from a `WriteMessage` followed by an `sqllang!Tcp::WriteAsync`. However, we do know that the data is sent as a TCP packet, so somewhere some code having to do with sockets need to be called. If we "spelunk" down in Windows documentation, we can see that there is a function named `WSPSend`. According to the [documentation][3]: "The WSPSend function sends data on a connected socket.".

With that in mind, perhaps there is something in SQL Server that would be named something similar; `x *!*WSPSend*`:

```cpp
mswsock!WSPSend (void)
mswsock!MSAFD_WSPSendMsg (void)
mswsock!WSPSendTo (void)
mswsock!WSPSendDisconnect (<no parameter info>)
```
**Code Snippet 10:** *Low Level Socket Calls*

What we see in *Code Snippet 10* looks promising! Let's start from the top, and set a break-point at `mswsock!WSPSend`. After having cleared out the display in *Process Monitor* we then execute the code in *Code Snippet 8* again. It seems our hunch about `WSPSend` being used for low level socket sends is correct, as when the code executes each `WriteAsync` is followed by a `WSPSend`. 

When the code breaks at `PushEOS` things are getting interesting. As expected we see in *Process Monitor* that the 2023 packet has not been sent yet. When continuing we immediately hit `mswsock!WSPSend`, which indicates that a package is about to be sent. At this point, look at the call-stack:

```cpp
mswsock!WSPSend
WS2_32!WSASend + 0x16c
sqllang!Tcp::GatherWriteAsync + 0x181
sqllang!SNIGatherWriteAsync + 0xad
sqllang!CSQLSatelliteConnection::WriteGatherMessages + 0xa6
sqllang!CSatelliteCargoContext::SendPackets + 0x34
sqllang!CSatelliteCargoContext::SendRemainingChunk + 0x149
sqllang!CUDXR_ExternalScript::PushEOS + 0x2f
sqlmin!CQScanUdx::PushNextChildRow + 0x1af
sqlmin!CQScanUdx::GetRow + 0x79
sqlmin!CQueryScan::GetRow + 0x81
sqllang!CXStmtQuery::ErsqExecuteQuery + 0x4dc
sqllang!CXStmtSelect::XretExecute + 0x322
sqllang!CMsqlExecContext::ExecuteStmts<1,1> + 0x40d
sqllang!CMsqlExecContext::FExecute + 0xa9e
sqllang!CSQLSource::Execute + 0x983
sqllang!SpExecuteExternalScript + 0x140e
```
**Code Snippet 11:** *Call Stack Sending Data Packet*

We'll look closer at the call-stack as in *Code Snippet 11* shortly, but now we continue execution of the code. We immediately see the 2023 packet being sent, followed by hitting the `WriteMessage` break-point. Continuing on from there we hit `WriteAsync` followed by `WSPSend`, and at this stage the call-stack looks like this:

```cpp
mswsock!WSPSend
WS2_32!WSASend + 0x16c
sqllang!Tcp::WriteAsync + 0x174
sqllang!SNIWriteAsync + 0xb0
sqllang!CSQLSatelliteConnection::WriteMessage + 0x7d
sqllang!CSatelliteCargoContext::SendChunkEndMessage + 0x50
sqllang!CSatelliteCargoContext::SendChunkEnd + 0x3e
sqllang!CUDXR_ExternalScript::PushEOS + 0x7c
sqlmin!CQScanUdx::PushNextChildRow + 0x1af
sqlmin!CQScanUdx::GetRow + 0x79
sqlmin!CQueryScan::GetRow + 0x81
sqllang!CXStmtQuery::ErsqExecuteQuery + 0x4dc
sqllang!CXStmtSelect::XretExecute + 0x322
sqllang!CMsqlExecContext::ExecuteStmts<1,1> + 0x40d
sqllang!CMsqlExecContext::FExecute + 0xa9e
sqllang!CSQLSource::Execute + 0x983
sqllang!SpExecuteExternalScript + 0x140e
```
**Code Snippet 12:** *Call Stack First 28 packet*

Continuing on from there, a 28 packet is being sent, and we eventually break at `WSPSend` again, and now the call-stack looks like so:

```cpp
mswsock!WSPSend
WS2_32!WSASend + 0x16c
sqllang!Tcp::WriteAsync + 0x174
sqllang!SNIWriteAsync + 0xb0
sqllang!CSQLSatelliteConnection::WriteMessage + 0x7d
sqllang!CSatelliteCargoContext::SendChunkEndMessage + 0x50
sqllang!CSatelliteCargoContext::SendChunkEnd + 0x3e
sqllang!CUDXR_ExternalScript::PushEOS + 0xa4
sqlmin!CQScanUdx::PushNextChildRow + 0x1af
sqlmin!CQScanUdx::GetRow + 0x79
sqlmin!CQueryScan::GetRow + 0x81
sqllang!CXStmtQuery::ErsqExecuteQuery + 0x4dc
sqllang!CXStmtSelect::XretExecute + 0x322
sqllang!CMsqlExecContext::ExecuteStmts<1,1> + 0x40d
sqllang!CMsqlExecContext::FExecute + 0xa9e
sqllang!CSQLSource::Execute + 0x983
sqllang!SpExecuteExternalScript + 0x140e
```
**Code Snippet 13:** *Call Stack Second 28 packet*

When the code in *Code Snippet 13* continues, it will cause the second 28 packet to be sent. 

So at this stage we have now sent three packets, let's now go back to the call-stack in *Code Snippet 11* and see what causes the result data packet to be sent. Before we do that however let's address the question that was asked when we looked at *Code Snippet 9*: where is `sqlmin!CQScanUdx::Open`? 

Remember, when we did not send any result data into the SqlSatellite, the end of script was called from inside `sqlmin!CQScanUdx::Open` as in *Code Snippet 7*. When result data is sent to the SqlSatellite `sqlmin!CQScanUdx::Open` is still being called obviously (otherwise no connection to the satellite would be made etc.), but the end of script message is not sent by `Open`, but instead after the result data has been sent.

So, *Code Snippet 11* and the call-stack which sent result data: we can see how the result data is being sent from `sqllang!CSatelliteCargoContext::SendPackets` and an abbreviated flow looks like so:

```cpp
sqllang!CXStmtQuery::ErsqExecuteQuery
  sqlmin!CQScanUdx::PushNextChildRow
    sqllang!CUDXR_ExternalScript::PushEOS
      sqllang!CSatelliteCargoContext::SendPackets
```
**Code Snippet 14:** *Abbreviated Flow Result Data*

Then, as we've seen, two packets with a size of 28 is sent. One is the end packet for the external script, and one is to indicate that no more result data will be sent. The flow, including sending the result data, looks like this:

```cpp
sqllang!CXStmtQuery::ErsqExecuteQuery
  sqlmin!CQScanUdx::PushNextChildRow
    sqllang!CUDXR_ExternalScript::PushEOS
      sqllang!CSatelliteCargoContext::SendPackets
    sqllang!CUDXR_ExternalScript::PushEOS
      sqllang!CSatelliteCargoContext::SendChunkEndMessage
    sqllang!CUDXR_ExternalScript::PushEOS
      sqllang!CSatelliteCargoContext::SendChunkEndMessage
```
**Code Snippet 15:** *Abbreviated Flow Result Data*

From what we've seen we can assume that `sqlmin!CQScanUdx::PushNextChildRow` pushes data into `CSatelliteCargoContext` from which the data is sent through the `sqllang!CSatelliteCargoContext::SendPackets` routine. After the result data has been sent, packets are sent to indicate that no more data (or script) is coming.

## Summary

In this post we set out trying to figure out who and what sent the following packets from SQL Server to the SqlSatellite:

* External script packet
* Packet containing the input data

We also wanted to figure out what the packets with a length of 28 were for.

**EDIT:** The figure below, and the flow has been edited, as I had forgotten the sending of the actual external script. It is now in the flow as point 6.

Instead of "re-hashing" what we have covered above, the following figure depicts, from a high level, what is being sent and by who. The figure somewhat condenses what you see in *Figure 2*:

![](/images/posts/sql_r_services_12_calls.png)

**Figure 10:** *Flow in SQL Server*

The numbered arrows shows the communication out from SQL Server, and in what order it happens:

1. SQL Server opens named pipe connection to the launchpad service.
1. Message sent to the launchpad service.
1. After the call above, the SqlSatellite opens a TCP/IP connection to SQL Server.
1. SQL Server sends the first packet to the SQL Satellite for authentication purposes.
1. A second authentication packet is sent to SqlSatellite.
1. The script is sent from inside `sqllang!CSatelliteProxy::PostSetupMessage`
1. The data for `@input_data_1` is sent.
1. The first end packet is sent.
1. The second end packet is sent.

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
[2]: https://www.microsoft.com/en-us/store/p/windbg/9pgjgd53tn86
[3]: https://msdn.microsoft.com/en-us/library/windows/desktop/ms742292(v=vs.85).aspx

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

