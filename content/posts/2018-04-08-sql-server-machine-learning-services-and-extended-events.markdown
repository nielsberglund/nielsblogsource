---
title: SQL Server Machine Learning Services and Extended Events
layout: post
author: nielsb
date: 2018-04-08T08:06:46+02:00
comments: true
categories:
  - SQL Server
  - Microsoft R Server
  - Data Science 
  - SQL Server R Services
  - SQL Server Machine Learning Services 
tags:
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - R
  - Python
  - Extended Events
  - XEvents
description: SQL Server extended events (XEvents) and SQL Server Machine Learning Services
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - R
  - Python
  - Extended Events
  - XEvents
---

Back in the day when I started with the **SQL Server R Services - Internals** posts, I thought I would use [SQL Server Extended Events][1] (XEvents) to figure things out. I knew SQL Server and the extensibility architecture supported XEvents because I had come across [this][2] documentation, where it (amongst other things) said:

"*SQL Server provides a set of extended events to use in troubleshooting operations related to the SQL Server Trusted Launchpad, as well as Python or R jobs sent to SQL Server.*"

From the above, it is pretty clear that XEvents is the way to go when drilling down into how things "hang together". However, how hard I tried, I could not make "head or tails" of how to get things to work (I should probably have tried harder), so in the end, I went the **WinDbg** and **WireShark** route. 

Fast forward a year (and a bit) and someone asked a question on an internal forum about XEvents and **SQL Server Machine Learning Services**, and I decided to look into it and to try to understand it a bit better. So this post is the result of me ~~playing around with~~ researching XEvents and SQL Server Machine Learning Services.

<!--more-->

## Extended Events

Let us first look quickly at what Extended Events are.

> **NOTE:** Please feel free to skip this part if you know about XEvents already.

Once upon a time, the only way for DBA's, developers, and others to identify problems with performance, deadlocks and so forth was to use SQL Trace and SQL Server Profiler together with DBCC and various trace flags. When SQL Server 2005 came along, it expanded upon the diagnostic capabilities with the introduction of Dynamic Management Views (DMV's). However, the diagnostic tools were still intrusive, and you would not want to keep a SQL Trace or SQL Profiler running for an extended period.

So, in SQL Server 2008 Microsoft introduced Extended Events, which is a general event-handling system for server systems. The Extended Events infrastructure supports the correlation of data from SQL Server, and under certain conditions, the correlation of data from the operating system and database applications. Compared to SQL Profiles and SQL Trace XEvents are less intrusive with minimal negative impact (if any) on performance. Some of the essential concepts/objects are:

* Package
* Event
* Action
* Target
* Event Session

> **NOTE:** The list above of concepts/objects are by no means complete. For example, I do not mention Predicates. The list and following explanations are just meant to give a quick, high-level overview of Extended Events.

Let us look at the concepts/objects:

#### Package

SQL Server Extended Events consists of different type of objects and the **Package** is the "top level" container for these objects. A *Package* is registered in the XEvents engine by a binary **Win32** module, and the package exposes objects/functionality related to that module. The following code lists the packages and their respective modules:

```sql
SELECT xp.name PackageName, xp.Description PackageDesc, 
       lm.name ModuleName, lm.description ModuleDesc
FROM sys.dm_xe_packages xp
JOIN sys.dm_os_loaded_modules lm
  ON xp.module_address = lm.base_address
```
**Code Snippet 1:** *Packages and Modules*

When you execute the code in *Code Snippet 1*, you see how there is a one to many relationships between modules and packages, and how all modules are SQL Server dll's. When you work with XEvents you use objects from one or more packages, and objects from different packages can be mixed in an event session (we talk more about event sessions in a bit).

#### Event

The Event is the "thing" you want to monitor, and it is some point of interest that may or may not happen when executing an application. When the event fires - if it fires - it carries with it the payload (data) related to the occurrence of that point of interest. Execute following code to see all different events:

```sql
SELECT xo.name EventName, xo.description EventDesc, 
       xp.name PackageName 
FROM sys.dm_xe_objects xo
JOIN sys.dm_xe_packages xp
  ON xo.package_guid = xp.guid
WHERE object_type = 'event'  
```
**Code Snippet 2:** *Events and Packages*

As you can see, there are quite a few events, and they cover a variety of things. The payload of the Event differs obviously between various events, but you can see the individual data elements in the payload for an Event via  `sys.dm_xe_object_columns`:

```sql
SELECT oc.name ColumnName, oc.column_id,
       oc.object_name Event 
FROM sys.dm_xe_object_columns oc
JOIN sys.dm_xe_objects xo
  ON oc.object_name = xo.name
WHERE xo.object_type = 'event'
  AND oc.object_name = 'sql_statement_completed'
```
**Code Snippet 3:** *Retrieve Payload Columns for an Event*

In *Code Snippet 3* we see how we select the individual data elements for the Event `sql_statement_completed`. So, the information returned in the payload is what you see in `sys.dm_xe_object_columns`. However, if you want more information you can achieve that by using Actions.

#### Actions

We can think of an Action as an internal function bound to the Event, and it performs a specified task when the Event fires. There are two types of tasks the Action does; either collecting additional information and add it to the Event payload or do something inside the engine, like performing a memory dump, or breaking execution in the default debugger. Run following code to see what actions are available:

```sql
SELECT xo.name [Action], xo.description ActionDesc
FROM sys.dm_xe_objects xo
WHERE object_type = 'action'
```
**Code Snippet 4:** *Get Actions*

We have seen see that for both events as well as actions, we can collect information. What do we now do with this information? 

#### Targets

The Target is what consumes an Event, and the Target can write to a file, aggregate event data, or start a task that is related to the event. The Target processes the data either synchronously or asynchronously. The code below lists what targets there are:

```sql
SELECT xo.name [Target], xo.description TargetDesc
FROM sys.dm_xe_objects xo
WHERE object_type = 'target'
```
**Code Snippet 5:** *Available XEvents Targets*

When you run the code in *Code Snippet 5* you see how a Target is either a file target, like the event file target and the ETW target, or an in-memory target, like event bucketing, event pairing, ring buffer target and so forth. Shortly we see how we use a Target (as well as events and actions).

#### Event Session

The Event Session is what ties Events, Actions, Targets and all the other XEVents objects together. In essence, an Event Session is a collection of events, corresponding actions, and the targets that are the destinations for the events we collect.

When you create an Event Session, it exists in the Extended Events Engine until you drop the Event Session. The Event Session can be started and stopped as needed without having to recreate the session. The flow of creating an Event Session is as follows:

* You first create the Event Session.
* You add Events. Each Event can have additional Actions.
* You add one or more Targets.
* You start the Event Session.

#### Example Code

With all the above in mind, let us see what it can look like when creating an Extended Event session:

```sql
IF EXISTS(SELECT 1 
          FROM sys.server_event_sessions 
          WHERE name='SimpleTest')
BEGIN
  DROP EVENT SESSION SimpleTest ON SERVER;
END
GO

CREATE EVENT SESSION SimpleTest ON SERVER
  ADD EVENT sqlserver.sql_statement_completed
  ADD TARGET package0.ring_buffer;
GO

ALTER EVENT SESSION SimpleTest
ON SERVER STATE = START 
GO 
```
**Code Snippet 6:** *Create Event Session*

In *Code Snippet 6* we see how we:

* First check whether the Event Session already exists, and if so - we drop it.
* Create the Event Session through the `CREATE EVENT SESSION session_name ON SERVER` syntax.
* Add the Event(s) we are interested in: `ADD EVENT package_name.event_name`.
* Add the Target(s): `ADD TARGET package_name.target_name`.
* Start the session.

You see in *Code Snippet 6* how we reference the package name for the Event as well as Target, and how the package for the target is `package0`. You may wonder what `package0` is: it is the default package in XEvents, and it contains (among other things) all actions and targets. 

As the Event Session is now running, let us see what happens if we execute a SQL statement, for example: `SELECT * FROM sys.databases`. When we execute the statement, nothing visible happens, but hopefully, our Target has consumed some event information. The Target for our Event Session is the ring buffer, and to read data from the ring buffer we use code looking like so:

```sql
SELECT CAST(stargets.target_data AS XML) AS targetdata
FROM sys.dm_xe_session_targets stargets 
INNER JOIN sys.dm_xe_sessions sessions 
ON sessions.address = stargets.event_session_address 
WHERE sessions.name = 'SimpleTest' 
  AND stargets.target_name = 'ring_buffer';
```
**Code Snippet 7:** *Reading Event Data from the Ring Buffer*

When you execute the code in *Code Snippet 7*, the output is in XML format, and the XML you see below is heavily edited for display:

```xml
<event name="sql_statement_completed" package="sqlserver" timestamp="2018-03-30T17:35:16.226Z">
    <data name="duration">
      <type name="int64" package="package0" />
      <value>2115</value>
    </data>
    <data name="cpu_time">
      <type name="uint64" package="package0" />
      <value>0</value>
    </data>
    <data name="physical_reads">
      <type name="uint64" package="package0" />
      <value>0</value>
    </data>
    <data name="logical_reads">
      <type name="uint64" package="package0" />
      <value>266</value>
    </data>
    <data name="writes">
      <type name="uint64" package="package0" />
      <value>0</value>
    </data>
    <data name="row_count">
      <type name="uint64" package="package0" />
      <value>10</value>
    </data>
    <data name="last_row_count">
      <type name="uint64" package="package0" />
      <value>10</value>
    </data>
    <data name="line_number">
      <type name="int32" package="package0" />
      <value>2</value>
    </data>
    <data name="offset">
      <type name="int32" package="package0" />
      <value>4</value>
    </data>
    <data name="offset_end">
      <type name="int32" package="package0" />
      <value>56</value>
    </data>
    <data name="statement">
      <type name="unicode_string" package="package0" />
      <value>SELECT * FROM sys.databases</value>
    </data>
    <data name="parameterized_plan_handle">
      <type name="binary_data" package="package0" />
      <value />
    </data>
  </event>
```
**Code Snippet 8:** *Event Information for sql_statement_completed*

Notice in *Code Snippet 8* how we can see the row count (`<data name="row_count">`) and also the SQL statement which caused the event to fire (`<data name="statement">`).

>**NOTE:** You can also use the UI in **SQL Server Management Studio** (SSMS) to set up Event Sessions.

#### Event File Target

Using the ringbuffer as target fort the events is OK, and it is a "quick and dirty" way to get things underway. However, it can be somewhat cumbersome to read the data as it is in XML format and there is no UI support for it and so forth. Therefore, in the rest of this post the `event_file` target is the target of choice for us, instead of the ringbuffer.

> **NOTE:** Read this [blog-post][7] by, "Mr Extended Events", [Jonathan Kehayias][5] for more information about why not to use the ringbuffer.

Just to see the `event_file` target in action:

* Create a new directory on the SQL Server box, and give it necessary permissions so that various processes can write to the directory (on my machine I created `C:\ExtLogs`).
* Alter the `SimpleTest` session like so:

```sql
ALTER EVENT SESSION SimpleTest ON SERVER
  DROP TARGET package0.ring_buffer

ALTER EVENT SESSION SimpleTest ON SERVER
  ADD TARGET package0.event_file
             (
               SET filename = 'C:\ExtLogs\SimpleTest.xel',
               max_file_size = 5
             );
GO
```
**Code Snippet 9:** *Alter Session to Use Event File Target*

In the code in *Code Snippet 9* we see how we first drop the original `ring_buffer` target and then add the `event_file` target. 

>**NOTE:** The assumption in the code in *Code Snippet 9* is that the event session exists and is in the `START` `STATE`. Oh - and it is not necessary to `DROP` the `ring_buffer` target as we can have more than one target in a session.

To see this in action: 

* Execute the code we used before: `SELECT * FROM sys.databases`. 
* If everything works, you now see in your directory, a file named something like so: `SimpleTest_0_some_long_number.xel`
* Drag and drop the file into SSMS and you see something like so:

![](/images/posts/sql_ml_services_xevents_ssms_event_file.png)

**Figure 1:** *Output Event File*

In *Figure 1* you see the top part of what is on the SSMS canvas and what you see are the individual events that fired. When you click on one of the events you see the details as so:

![](/images/posts/sql_ml_services_xevents_ssms_event_file_details.png)

**Figure 2:** *Event Details*

In *Figure 2*, in the `Details` pane, we see the individual `data` elements, and their values from the event outlined in red. To me, I very much prefer what I see in *Figure 2* to what is in *Code Snippet 8*, especially since the information is the same.

You do not explicitly have to drag and drop the event file to the SSMS canvas, you can use the SSMS UI for this:

![](/images/posts/sql_ml_services_xevents_ssms_target.png)

**Figure 3:** *Event Details*

When you click on the *View Target Data* as you see in *Figure 3*, you get the same as in *Figure 1* and *Figure 2*.

#### More Information

As I mentioned above - this is a very simplified overview of XEvents, and I have skipped a lot of relevant information. Below follows a couple of links if you want to read more about SQL Server Extended Events:

* [Extended Events][3]. Microsoft Extended Events documentation.
* [An XEvent A Day: 31 days of Extended Events][4]. Blog post series by [Jonathan Kehayias][5] about Extended Events. Jonathan know what he talks about when it comes to Extended Events, among other things he wrote the [definitive white-paper][6] on Extended Events for Microsoft.
* [Event File Target][8]. Documentation about the Event File target.

## XEvents and SQL Server Machine Learning Services

At this stage I hope we all have at least some basic knowledge of XEvents, so let us now see how XEvents plays with **SQL Server Machine Learning Services**. When you looked through the results from the code in *Code Snippet 1* (XEvents packages), you might have noticed this:

![](/images/posts/sql_ml_services_xevents_1.png)

**Figure 4:** *SqlSatellite Package*

Starting with SQL Server 2016, there is a new XEvents package: `SQLSatellite`, and as there is a new package, the chance is high that there are events exposed through that package as well:

```sql
SELECT xo.name EventName, xo.description EventDesc, 
       xp.name PackageName 
FROM sys.dm_xe_objects xo
JOIN sys.dm_xe_packages xp
  ON xo.package_guid = xp.guid
WHERE object_type = 'event'
  AND xp.name = 'SQLSatellite'
```
**Code Snippet 10:** *Retrieving Events from the SQLSatellite Package*

When I execute the code in *Code Snippet 10*, I get 34 rows back:

![](/images/posts/sql_ml_services_xevents_2.png)

**Figure 5:** *SqlSatellite Events*

So, *Figure 5* shows all events from the `SQLSatellite` package, and I have outlined in red five events that look interesting. Now, let us create an event session with these five events, and see what happens:

```sql
IF EXISTS(SELECT 1 
          FROM sys.server_event_sessions 
          WHERE name='SatelliteTest1')
BEGIN
  DROP EVENT SESSION SatelliteTest1 ON SERVER;
END
GO

CREATE EVENT SESSION [SatelliteTest1] ON SERVER 
  ADD EVENT SQLSatellite.satellite_authentication_completion,
  ADD EVENT SQLSatellite.satellite_authorization_completion,
  ADD EVENT SQLSatellite.satellite_cleanup,
  ADD EVENT SQLSatellite.launchpad_launch_start,
  ADD EVENT SQLSatellite.launchpad_resume_sent
  ADD TARGET package0.event_file
             (
               SET filename = 'C:\ExtLogs\SatelliteTest1.xel',
               max_file_size = 5
             )
WITH(MAX_DISPATCH_LATENCY = 2 SECONDS);
GO

ALTER EVENT SESSION SatelliteTest1
ON SERVER STATE = START
GO 
```
**Code Snippet 11:** "Event Session for SQLSatellite"

The code in *Code Snippet 11* looks similar to the code in *Code Snippet 9*, except for the `WITH(MAX_DISPATCH_LATENCY = 2 SECONDS)` event session option. The `MAX_DISPATCH_LATENCY` option specifies the amount of time that events sit in memory before being dispatched to event session targets. By default, this value is 30 seconds. In the code above, as you can see, the time in memory is 2 seconds. 

Execute the code in *Code Snippet 11*, and then execute the following:

```sql
EXEC sp_execute_external_script 
              @language = N'R'
            , @script = N'd <- 42'
```
**Code Snippet 12:** *External Script*

When we have executed the code in *Code Snippet 12*, let us see if some events have fired. Once again, if everything has gone to plan, you now see in your directory, a file named something like so: `SatelliteTest1_0_some_long_number.xel`. When you drop it on the SSMS canvas you get this:

![](/images/posts/sql_ml_services_xevents_ssms_ext_script_1.png)

**Figure 6:** *Captured Events*

Hmm - Ok, looking at *Figure 6* I have good news and bad news. The good news is that we captured events from our code execution! The bad news is that we have missing events (`satellite_cleanup`, `launchpad_launch_start`, `launchpad_resume_sent`), and the events we have, look like duplicates (two of both `satellite_authentication_completion` and `satellite_authorization_completion`). What is happening?

Let us look at the "alleged" duplication issue first. Click on the first `satellite_authentication_completion` event and you see this:

![](/images/posts/sql_ml_services_xevents_ssms_ext_script_2.png)

**Figure 7:** *Event Data*

In *Figure 7* you see the `data` element of the first `satellite_authentication_completion` event, and you see how the `connection_provider` is of type `ConnectionProviderNamedpipe`. The same `connection_provider` type shows for the first `satellite_authorization_completion` event as well. However, if you click on either of the second events, the `connection_provider` type is no longer `ConnectionProviderNamedpipe` but `ConnectionProviderTCP`. Ah, so we have two types of connections happening with separate authentication and authorisation events:

* Named Pipes
* TCP Sockets

That we see two connection types should not come as a surprise to those of you who have read my [**Internals - I**][si1] and [**Internals - IX**][si9] posts in the **Microsoft SQL Server R Services** series. In those two posts we discussed how SQL Server makes a named pipes connection to the Launchpad service, and how there is a TCP socket connection established between the SqlSatellite and SQL Server. So, making authorisation and authentication calls for named pipe and TCP socket connections are why we see "duplicates".

What about why we do not see the `satellite_cleanup`, `launchpad_launch_start` and `launchpad_resume_sent` events in *Figure 3*? Well, I did not read the [documentation][2] I linked to above thorough enough because in there it says:

*Additional extended events are available for components that are related to and used by SQL Server Machine Learning Services, such as the SQL Server Trusted Launchpad, and BXLServer, the satellite process that starts the R runtime. **These additional extended events are fired from the external processes, and thus must be captured using an external utility**.*

Clear as daylight, huh? Do not expect SQL Server to know when external processes fires events. If you want to capture events from processes outside of SQL Server, you need to do it in some other way, not `EVENT SESSION`.

## Events from External Processes

>**NOTE:** Some of the below are copied and re-worded from the [Extended events for SQL Server Machine Learning Services][2] page.

So how do we then capture events from external processes, or rather - how do we register with an external process to capture events, and also, how do we define the events we want to capture? Oh, and what processes do we talk about here?

We start with the last one first: the processes that interests us are:

* `Launchpad.exe` - called in `sp_execute_external_script` and "routes" the request to correct external engine.
* `BxlServer.exe` - this is the process that hosts the SqlSatellite.

To register for events as well as defining the events which interest us, we use a configuration file. This file is the "moral equivalent" of the `CREATE EVENT SESSION` statement for SQL Server. What I mean with that is that, in said file, you define pretty much what you do in `CREATE EVENT SESSION`. The format of the file (taken from the [link][2] above), looks like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<event_sessions>
  <event_session name="[session name]" 
                 maxMemory="1" 
                 dispatchLatency="1" 
                 MaxDispatchLatency="2 SECONDS">
    <description owner="you">XEvents.</description>
    <event package="SQLSatellite" name="[XEvent Name 1]" />
    <event package="SQLSatellite" name="[XEvent Name 2]" />
    <target package="package0" name="event_file">
      <parameter name="filename" value="[SessionName].xel" />
      <parameter name="max_file_size" value="10" />
      <parameter name="max_rollover_files" value="10" />
    </target>
  </event_session>
</event_sessions> 
```
**Code Snippet 13:** *Configuration File for External Extended Events*

When looking at *Code Snippet 13* we see we have a root element `<event_sessions>` followed by a child element `<event_session>`. With this in mind, we see how one config file can support multiple event sessions. The `<event_session>` element is like an amalgamation of `CREATE EVEN SESSION` and the `WITH` event session options in the T-SQL statement for creating an event session. The `<event_session>` element has following attributes:

* `name` - A mandatory attribute. If you do not set the name, "bad things" happen.
* `maxMemory` - An optional attribute and it is similar to `MAX_MEMORY` in SQL Server event session options, and it specifies the maximum amount of memory to allocate to the session for event buffering. 
* `MaxDispatchLatency` - Optional attribute, similar to `MAX_DISPATCH_LATENCY` in SQL Server event session options. The attribute has a default of 30 seconds, and it specifies the amount of time that events sit in memory before being dispatched to event session targets.
* `dispatchLatency` - Optional attribute and this has no equivalent (as far as I can tell) in the SQL Server event session options. However, it is similar to `MaxDispatchLatency`, in that the attribute specifies the time (in seconds), events sit in memory before being dispatched to event session targets. If both `MaxDispatchLatency` and `dispatchLatency` have values, `dispatchLatency` takes precedence.

The `<description>` element is optional, and I do not know what functionality it offers. I can only speculate, but perhaps, some event readers may display the description. Anyway, after the `<description>` element comes the actual `<event>` element(s), with attributes for `package` and `name` and this is equivalent of `ADD EVENT package.event`.

Finally, after the events, we set up the target in the `<target>` element. The only target I have tried with is the `event_file`, so keep that in mind. The package for all targets are `package0` and the `name` is `event_file`. The `<target>` element have child nodes of `<parameter>` nodes. For the `<event_file>` target the only required `<parameter>` is the `filename`.

So, `filename` - this is where things are getting interesting: Having seen how we define the file to write to for SQL Server XEvents (*Code Snippet 9* and *Code Snippet 11*), you expect it is the same for the external processes. But no, it is different, and it is even different between Launchpad and BxlServer!

**Launchpad:**

For Launchpad, the filename has to be the actual filename, no path: `<parameter name="filename" value="launchpadTest.xel" />` for example. Launchpad then writes the event file to the path that the `-logFile` parameter sets at startup. Default location is `C:\\<path_to_SQL_instance\>\MSSQL\LOG\ExtensibilityLog`.

>**NOTE:** You can read more about startup parameters for the Launchpad service in [**Internals - II**][si2]. 

**BxlServer:**

You would expect that Launchpad and BxlServer would be similar in how they handle the file name, but as I wrote above they are not. BxlServer requires you to define the file as a relative path to where the `BxlServer.exe` is, and the BxlServer process needs write permissions on the directory where it writes the file to. So if I want the BxlServer to write the file to the directory I created above, the directory where SQL Server writes the events to, the parameter looks like so: `<parameter name="filename" value="..\..\..\..\..\..\..\..\..\..\ExtLogs\bxlserver1.xel" />`.

>**NOTE:** I know the above purely due to [Umachandar Jayachandran][uc] (Program Manager in the SQL Server team) told me about it - so no great insight from me.

The two remaining `<parameter>` nodes: `max_file_size` and `max_rollover_files` are both optional and you can read more about them in the [Event File Target][8] documentation.

The final thing to cover before a couple of examples is where to place the configuration files and what to name them. You name the files`process_name.xevents.xml` ( `Launchpad.xevents.xml`, `bxlserver.xevents.xml`) and you place them together with the executables for the processes (remember that `BxlSever.exe` is in two locations, one for R and one for Python):

* Launchpad - `C:\\<path_to_SQL_instance\>\MSSQL\Binn`
* BxlServer R - `C:\\<path_to_SQL_instance\>\R_SERVICES\library\RevoScaleR\rxLibs\x64`
* BxlServer Python - `C:\\<path_to_SQL_instance\>\PYTHON_SERVICES\Lib\site-packages\revoscalepy\rxLibs`

#### Example

Having covered the basics of SQL Server extended events for external processes, let us see an example of what it can look like with SQL Server, Launchpad and BxlServer. So the assumption for this example is that we want to understand what happens when we send and receive data to and from the external engine.

The first thing we do is to set up a SQL Server event session. We expand and alter the code in *Code Snippet 11* slightly:

```sql
IF EXISTS(SELECT 1 
          FROM sys.server_event_sessions 
          WHERE name='SatelliteTest1')
BEGIN
  DROP EVENT SESSION SatelliteTest1 ON SERVER;
END
GO

CREATE EVENT SESSION [SatelliteTest1] ON SERVER 
  ADD EVENT SQLSatellite.satellite_authentication_completion,
  ADD EVENT SQLSatellite.satellite_authorization_completion,
  ADD EVENT SQLSatellite.satellite_service_start_posted,
  ADD EVENT SQLSatellite.satellite_data_send_start,
  ADD EVENT SQLSatellite.satellite_data_chunk_sent,
  ADD EVENT SQLSatellite.satellite_data_send_completion,
  ADD EVENT SQLSatellite.satellite_schema_received,
  ADD EVENT SQLSatellite.satellite_outputArgument_received,
  ADD EVENT SQLSatellite.satellite_abort_sent,
  ADD EVENT SQLSatellite.satellite_abort_received,
  ADD EVENT SQLSatellite.satellite_abort_connection
  ADD TARGET package0.event_file
             (
               SET filename = 'C:\ExtLogs\SatelliteTest1.xel',
               max_file_size = 5
             )
WITH(MAX_DISPATCH_LATENCY = 2 SECONDS);
GO

ALTER EVENT SESSION SatelliteTest1
ON SERVER STATE = START 
GO 
```
**Code Snippet 14:** *XEvents SQL Server*

In *Code Snippet 14* we see how we use the authentication and authorisation events from *Code Snippet 11* and how we add data related events, output argument events and abort events to the session.

The Launchpad config file looks like so:

```xml
<?xml version="1.0" encoding="utf-8"?>
<event_sessions>
  <event_session name="dataEventsLaunchPad" 
                 maxMemory="1" 
                 dispatchLatency="1" 
                 MaxDispatchLatency="2 SECONDS">
    <event package="SQLSatellite" name="trace_event" />
    <event package="SQLSatellite" name="launchpad_launch_start" />
    <event package="SQLSatellite" name="launchpad_resume_sent" />
    <event package="SQLSatellite" 
           name="satellite_authentication_completion" />
    <event package="SQLSatellite" name="satellite_messaging" />
    <event package="SQLSatellite" name="satellite_message_summary" />
    <target package="package0" name="event_file">
      <parameter name="filename" value="launchpadDataEvents.xel" />
      <parameter name="max_file_size" value="5" />
      <parameter name="max_rollover_files" value="5" />
    </target>
  </event_session>
</event_sessions>
```
**Code Snippet 15:** *Launchpad.xevents.xel Configuration File*

For Launchpad we are interested in trace events, the start and resume events, authentication and then finally some message events. Notice how the file name is just the filename with no path. This is per what we discussed earlier.

Finally the BxlServer config file looks like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<event_sessions>
  <event_session name="dataEventsBxl" 
                 maxMemory="1" 
                 dispatchLatency="1" 
                 MaxDispatchLatency="2 SECONDS">
    <event package="SQLSatellite" name="trace_event" />
    <event package="SQLSatellite" 
           name="satellite_authentication_completion" />
    <event package="SQLSatellite" 
           name="satellite_data_receive_completion" />
    <event package="SQLSatellite" name="satellite_schema_sent" />
    <event package="SQLSatellite" 
           name="satellite_outputArgument_sent" />
    <event package="SQLSatellite" name="satellite_abort_connection" />
    <event package="SQLSatellite" name="satellite_cleanup" />
    <event package="SQLSatellite" name="satellite_messaging" />
    <event package="SQLSatellite" name="satellite_message_summary" />
    <target package="package0" name="event_file">
      <parameter name="filename" 
        value="..\\..\\..\\..\\..\\..\\..\\..\\..\\..\ExtLogs\bxlDataEvents.xel" />
      <parameter name="max_file_size" value="5" />
      <parameter name="max_rollover_files" value="5" />
    </target>
  </event_session>
</event_sessions>
```
**Code Snippet 16:** *bxlserver.xevents.xel Configuration File*

The config file for BxlServer looks a little bit like the config file for Launchpad in that we are interested in authentication and trace events. In addition to to those events, we are interested in: data, output arguments, aborts and messages.

We now create the event session in *Code Snippet 14* by executing - in SSMS - the code in the code snippet. We then drop the configuration files for the Launchpad (`Launchpad.xevents.xel`) and BxlServer (`bxlserver.xevents.xel`) in respective directories (as we mentioned above).

>**NOTE:** Both Launchpad and BxlServer loads the configuration files at startup. This is not so much an issue with the BxlServer, as each execution results in a startup. However, for Launchpad it is different, as Launchpad starts when the service starts. So if you create a new configuration file for the Launchpad service (as we do here) or do changes to an existing file, you need to restart the Launchpad service afterwards.

Right, we can now execute some `sp_execute_external_script` code and see what happens (after having restarted the Launchpad service):

```sql
EXEC sp_execute_external_script 
            @language = N'R'
          , @script = N'OutputDataSet <- InputDataSet'
          , @input_data_1 = N'SELECT name, database_id 
                              FROM sys.databases'
```
**Code Snippet 17:** *External Script*

After execution, you now see in your log directory two `xel` files, one for the SQL Server `SatelliteTest1` session and one for the BxlServer. In the `..\Log\ExtensibilityLog` directory you see one `xel` file for the Launchpad extended events. If we drag and drop them to the SSMS canvas we see this:

![](/images/posts/sql_ml_services_xevents_sql_xevents.png)

**Figure 8:** *SQL Server Event Data*

![](/images/posts/sql_ml_services_xevents_launchpad_xevents.png)

**Figure 9:** *Launchpad Event Data*

![](/images/posts/sql_ml_services_xevents_bxl_xevents.png)

**Figure 10:** *BxlServer Event Data*

The three figures above show the extended events, after we executed the code in *Code Snippet 17*, from:

* SQL Server - *Figure 8*.
* Launchpad - *Figure 9*.
* BxlServer - *Figure 10*.

By looking at the events and the timestamps, we get an idea what the flow is when executing `sp_execute_external_script`, similar to what we covered in the **SQL Server R Services - Internals**. To see more clearly the flow, I inserted the different events into a table and selected out from the table in the order of the event time, and then it looks like this:

![](/images/posts/sql_ml_services_xevents_event_order2.png)

**Figure 11:** *Event Order*

I have in *Figure 11* highlighted some events worth saying a couple of words about:

* Green - `trace_event`. In the [documentation][2] it says that the `trace_event` can include events due to output to stdout and stderr from R. From my testing I can not see that, it only outputs internal trace events, and it looks like SQL Server does not output any trace events at all.
* Yellow - `satellite_messaging`. This event is really cool, as it fires when the different processes send messages to each other. Useful if you want to see what happens. I only included `satellite_messaging` for the Launchpad service, as otherwise, the trace becomes too big.
* Blue - `satellite_schema_sent/received`. BxlServer fires `satellite_schema_sent` when data goes back to SQL Server, and SQL Server fires `satellite_schema_received`. In fact regardless if any return data goes back to SQL Server, these two events fires.
* Red - `satellite_outputArgument_sent/received`. As the name implies, these two events are related to output arguments. They have the same behaviour as the schema events above in that that they fire regardless whether there is an output argument or not.

## Event Matrix

During my playing around with extended events for **SQL Server Machine Learning Services** I have tried to keep track and what events fire when and for what processes. There are events I have not been able to see fire at all, but that is most likely due to me not knowing what I am doing. Anyway, the table below lays out what I have seen:

| Event | SQL Server | Launchpad | BxlServer | Comments |
| --- | :---: | :---: | :---: | --- |
| `launchpad_launch_start` | | x | | |
| `launchpad_resume_sent` | | x | | |
| `trace_event` | | x | x | See above about `trace_event`.|
| `satellite_authentication_completion` | x | x | x | |
| `satellite_authorization_completion` | x | | | |
| `satellite_service_start_posted` | x | | | |
| `satellite_data_send_start` | x | | | |
| `satellite_data_chunk_sent` | x | | | |
| `satellite_data_send_completion` | x | | | |
| `satellite_data_receive_completion` | | | x | |
| `satellite_schema_sent` | | | x | See above about `satellite_schema_sent`. |
| `satellite_outputArgument_sent` | | | x | See above about `satellite_outputArgument_sent`.  |
| `satellite_error` | | x | x  | This event is output, regardless if there is an error or not. |
| `satellite_schema_received` | x | | | See above about `satellite_schema_received`. |
| `satellite_outputArgument_received` | x | | | See above about `satellite_outputArgument_received`. |
| `satellite_abort_sent` | x | | (x) | See below. |
| `satellite_abort_received` | x | | | |
| `satellite_abort_connection` | x | | x | |
| `satellite_cleanup` | | | x | |
| `satellite_message_summary` | x | x | x | |
| `satellite_messaging` | x | x | x | |
| `satellite_message_coalesced` | x | | | |
| | | | | |
| `connection_accept` | | | | See below. |
| `failed_launching` | | | | See below. |
| `extensibility_session_snapshot` | | | | Cannot get to fire. |
| `external_resource_pool` | | | | Cannot get to fire. |
| `extensibility_error_ring_buffer_record` | | | | Cannot get to fire. |
| `extensibility_session_snapshot` | | | | Cannot get to fire. |
| `satellite_unexpected_message_received` | | | | Cannot get to fire. |
| `stack_trace` | | | | Should fire if a memory dump is made of the process. |
| `satellite_message_ring_buffer_record` | | | | Cannot get to fire. Believe this is more for debug purposes. |
| `satellite_sessionId_mismatch` | | | | Cannot get to fire. Believe this is more for debug purposes. |
| `satellite_invalid_sized_message` | | | | Cannot get to fire. Believe this is more for debug purposes. |
| `satellite_message_version_mismatch` | | | | Cannot get to fire. Believe this is more for debug purposes. |
| `satellite_partial_message` | | | | Cannot get to fire. |

**Table 1:** *Event Matrix*

In *Table 1* there are a couple of "see below":

* `satellite_abort_sent` - If execution goes OK, SQL Server fires the `satellite_abort_sent` at the end of execution. If an exception happens in the external engine, SqlSatellite fires `satellite_abort_sent`.
* `connection_accept` - I am surprised that I cannot see this event fire.  I would have expected at least SQL Server or SqlSatellite to cause the event to happen when they connect.
* `failed_launching` - This I am also surprised not to see fire. I stopped the launchpad service and tried to execute `sp_execute_external_script`, but no, no `failed_launching` event.

I hope that Microsoft, at some stage, can explain to me what I did wrong when I could not see some of the events above fire. When that happens I will update this post.


## Summary

So what are the takeaway points in this post:

* With the introduction of R in SQL Server 2016, Microsoft also introduced new extended events for **SQL Server Machine Learning Services**.
* The `SQLSatellite` package contains the events.
* XEvents are available both for the SQL Server process as well as the external processes: `Launchpad.exe` and `BxlServer.exe`.
* The three processes do not publish all the same events.
* To capture events from SQL Server you use the "normal" `CREATE EVENT SESSION` syntax.
* For `Launchpad.exe` and `BxlServer.exe` you use a configuration file in XML format to register the events that interests you.
* You place the configuration file(s) in the same directory as the executable(s).
* When the external processes target the `event_file` `target`, the target filename (and path) differs between the Launchpad process and the BxlServer process.
    * For Launchpad the filename is the filename only, and Launchpad writes the file to the `..\Log\ExtensibilityLog` directory.
    * For BxlServer the path is a relative path (relative to BxlServer) to a directory which BxlServer has write access to.

As I mentioned at the beginning of this post, the post came about due to a question on an internal forum, and I just wanted to figure out for myself what goes on with extended events and **SQL Server Machine Learning Services**. The  [documentation][2] about extended events and SQL Server Machine Learning Services was a big help, and without the help from [Umachandar Jayachandran][uc] I would never have figured out why I could not see any events from `BxlServer.exe`.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright
[uc]: https://www.linkedin.com/in/umachandarjayachandran/

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


[1]: https://technet.microsoft.com/en-us/library/bb630354(v=sql.105).aspx
[2]: https://docs.microsoft.com/en-us/sql/advanced-analytics/r/extended-events-for-sql-server-r-services
[3]: https://technet.microsoft.com/en-us/library/bb630282(v=sql.110).aspx
[4]: https://www.sqlskills.com/blogs/jonathan/an-xevent-a-day-31-days-of-extended-events/
[5]: https://www.sqlskills.com/about/jonathan-kehayias/
[6]: https://msdn.microsoft.com/en-us/library/dd822788.aspx
[7]: https://www.sqlskills.com/blogs/jonathan/why-i-hate-the-ring_buffer-target-in-extended-events/
[8]: https://msdn.microsoft.com/en-us/library/ff878115.aspx
