---
type: post
layout: "post"
title: "Set Your SQL Server Data Free Using Kafka: Extensibility Framework"
author: nielsb
date: 
comments: true
highlight: true
draft: true
categories:
  - SQL Server 2019
  - SQL Server Extensibility Framework
  - Kafka
tags:
  - Kafka
  - SQL Server 2019
  - R
  - Python
  - Java
  - SQL Server Extensibility Framework
description: 
keywords:
  -   
---

As many of you may know, (or not), is that my background is SQL Server. Ever since I started programming, SQL Server has been my "trusty companion", and if you don't have SQL Server as a backend, then there is something wrong. At work, ([Derivco](/derivco)), it is the same thing, and we are jokingly saying that we do not have business logic in the database, we have full-blown applications!

However, both me personally and at work, we do realise the value of streaming data, both for real-time processing as well as to distribute data without having to rely on replication. In the ideal world, we would change the applications/systems that are the source of the data to both publish the data as event streams as well as persisting the data to the database. However, it may not be possible to change those applications/systems - at least not in the time frame we would like. So what we want to do is to use the database as the source of the data, but treat the data, not as rows in a database but, as streaming events. 

This is the first post in a "mini" series where we look at how we can do what is outlined above. In this post, we look at how to use the **SQL Server Extensibility Framework**, and more specifically the Java language extension to solve the issue.

<!--more-->

## Scenario & Code

In this post we look at a scenario somewhat like what we have at [Derivco](/derivco). We have online Casino gameplay where the user (player) plays Casino games, (slots, table games, etc.), on his PC, tablet or mobile. The game play is persisted to a SQL Server database:

``` sql
USE master;
GO

DROP DATABASE IF EXISTS GamePlayDB;
GO

CREATE DATABASE GamePlayDB;
GO

USE GamePlayDB;
GO

CREATE TABLE dbo.tb_GamePlay
(
  RowID bigint identity PRIMARY KEY,
  UserID int NOT NULL,
  GameID int NOT NULL,
  WagerAmount decimal(10, 2) NOT NULL,
  PayoutAmount decimal(10, 2) NOT NULL,
  EventTime datetime2 DEFAULT SYSUTCDATETIME()
);
GO

```
**Code Snippet 1:** *Game Play Database*

In *Code Snippet 1* we see some SQL code which creates:

* The database `GamePlayDB`.
* A table, `dbo.tb_GamePlay`, to persist each outcome of a spin, hand, etc.

> **NOTE:** The code is as simplistic it can be, and let you still follow along with what we are doing.

When the player spins, etc., the gameplay goes via various services, and finally the last service in the chain calls a stored procedure which persists the gameplay:

``` sql
CREATE PROCEDURE dbo.pr_LogWager @UserID INT,
                                 @GameID INT,
                                 @WagerAmount decimal(10, 2),
                                 @PayoutAmount decimal(10, 2)
AS
BEGIN

  BEGIN TRY
    BEGIN TRAN
      INSERT INTO dbo.tb_GamePlay(UserID, GameID, WagerAmount, 
                                  PayoutAmount)
      VALUES(@UserID, @GameID, @WagerAmount, @PayoutAmount);
      --do more tx "stuff" here
    COMMIT TRAN;

  END TRY
  BEGIN CATCH
    ROLLBACK TRAN;
  END CATCH

END  
GO
```
**Code Snippet 2:** *Game Play Procedure*

We see how the procedure in *Code Snippet 2* takes relevant game play details and inserts them into the `dbo.tb_GamePlay` table.

In our scenario we now want to stream the individual game play events, but we cannot alter the services which generates the gameplay. We instead decide to generate the event from the database using, as we mentioned above, the SQL Server Extensibility Framework.

## SQL Server Extensibility FrameworkBack 

Together with the release of SQL Server 2016, Microsoft introduced the feature to be able to execute R script code from inside SQL Server against an external R engine. In SQL Server 2017 added the ability to do the same but using Python. 

The ability to call R/Python is enabled by a SQL Server framework: the **SQL Server Extensibility Framework**, and you can read more about it in my blog post [SQL Server 2019 Extensibility Framework & External Languages][]. For SQL Server 2019, Java is available as an external language and that is what we use in this post.

If you are unsure about what I talk about here are some blogposts that may help:

* [Microsoft SQL Server R Services: sp_execute_external_script - I][sext1] - When calling out to R/Python/Java you do it from a specific procedure: `sp_execute_external_script`. This is the first post of three looking at `sp_execute_external_script`.
* [Microsoft SQL Server R Services - sp_execute_external_script - II][sext2] - The second post about `sp_execute_external_script`. 
* [Microsoft SQL Server R Services: sp_execute_external_script - III][sext3]  - The third post about `sp_execute_external_script`.
* [SQL Server 2019 Extensibility Framework & Java](/s2k19_ext_framework_java) - A series of posts discussing how to write Java code so we can call it from SQL server.

## Solution

As we mentioned above we want to generate the wager "event" from inside the database, and there are a couple of ways we can do that:

* [Change Data Capture][1] - CDC records insert, update, and delete activity that is applied to a SQL Server table, and makes the details of the changes available to consumers.
* [Change Tracking][2] - CT tracks and makes available rows that are changed in SQL Server tables. The difference 
between CT and CDC is that CT does not capture the changed values.

Both CDC, and CT can be used to get data from SQL Server to Kafka, and we will cover that in future posts. In this post, however, we look at doing the event generation in another way: hook-points in stored procedures.

The idea with stored procedure hook-points is that at a place in a stored procedure, a code block is inserted, (hooked in), and this code block executes some code. In this case it publishes a message to Kafka.

> **NOTE:** With the definition of a hook-point above, you may ask what the difference is between a hook-point and an ordinary procedure call? There is no real difference; the way I see it is that the hook-point executes code which is, to a large degree, un-related to what the procedure does. Oh, and the name "hook-point" sounds cool.

So, where do we insert the hook-point in our procedure we see in *Code Snippet 2*? As the `pr_LogWager` is transactional we insert the hook-point after the commit so we do not publish any messages for rolled back wagers. Now we know where the hook-point should be, but what should it do?

Obviously it should publish to Kafka, but what should it publish? In this case it should publish an event, so the hook-point also needs to generate the event. What the event should look like is very much up to you, for now let us assume the event looks something like so:

``` json
{
   "$schema": "http://json-schema.org/draft-04/schema#",
   "title": "Wager",
   "description": "A placed wager",
   "type": "object",
  
   "properties": {
  
      "eventTypeId": {
         "description": "Unique identifier for the event type",
         "type": "integer"
      },

      "userId": {
         "description": "The unique identifier for a user",
         "type": "integer"
      },

      "userId": {
         "description": "The unique identifier for a game",
         "type": "integer"
      },

      "wagerAmount": {
         "description": "Amount wagered",
         "type": "number"
      },

      "payoutAmount": {
         "description": "Amount paid out (win)",
         "type": "number"
      },
    
     
   },
  
   "required": ["eventTypeId", "userId", "userId", 
                "wagerAmount", "payoutAmount"]
}
```
**Code Snippet 3:** *Wager Schema*

We see in *Code Snippet 3* how the schema for the event looks very much like what we persist to the table in our stored procedure. The only difference is that we also define an `eventTypeId`. This can be used when we do stream processing to filter out various types of events.







``` sql
BEGIN TRY
  BEGIN TRAN
    -- insert statement
    --do more tx "stuff" here
  COMMIT TRAN;

  --insert hook-point here

END TRY

---

END  
GO
```
**Code Snippet 3:** *Hook Point Placement*




and we want it to be as real-time as possible, e.g. as close as possible to when the player made the wager. 












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

[sext1]: {{< relref "2018-03-07-microsoft-sql-server-r-services-sp_execute_external_script-I.markdown" >}}
[sext2]: {{< relref "2018-03-11-microsoft-sql-server-r-services---sp-execute-external-script---ii.markdown" >}}
[sext3]: {{< relref "2018-03-21-microsoft-sql-server-r-services---sp-execute-external-script---iii.markdown" >}}


[1]: https://docs.microsoft.com/en-us/sql/relational-databases/track-changes/about-change-data-capture-sql-server?view=sql-server-2017
[2]: https://docs.microsoft.com/en-us/sql/relational-databases/track-changes/about-change-tracking-sql-server?view=sql-server-2017
[3]:
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