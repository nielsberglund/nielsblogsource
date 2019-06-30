---
layout: post
title: RabbitMQ - SQL Server
author: nielsb
date: 2017-02-11T12:39:51+02:00
comments: true
categories:
  - SQL Server
  - RabbitMQ
tags:
  - SQL Server
  - RabbitMQ
  - message brokers
  - streaming
description: SQL Server to RabbitMQ. A post about how SQL Server can communicate with RabbitMQ to push data out of the database.
keywords:
  - SQL Server
  - RabbitMQ
  - message brokers
  - streaming   
---

A week or two ago I came across a [post][1] on the [RabbitMQ Users][2] forum, about how to communicate from SQL Server to RabbitMQ. Seeing that we do that a lot at [Derivco](/Derivco), I came with some suggestions, and also said that I was writing a blog-post about how it can be done. The part of writing was not entirely correct - at least not until now (sorry Jim, it's been hectic at work). 

<!--more-->

**SQL Server** is awesome, and it is super easy to get data into the database. Getting data out is easy as well by querying the database. What is a bit tricker though is to get data out at the time the data is inserted or updated. Think real-time events; a purchase is made - someone needs to be notified about it at the very second it happens. We can arguable say that the data we are interested in should not be pushed out from the database, but from somewhere else. Sure, that is true - but quite often you don't have a choice.

This was the case for [us](/Derivco) - we needed to send events out of the database for some further processing, and the question was how to do it.

## SQL Server and External Communication

There has been a couple of initiatives in SQL Server to allow for communication out of the database; **SQL Server Notification Services** (NS), which was introduced in SQL Server 2000, and more recently **SQL Server Service Broker** (SSB) introduced in SQL Server 2005. I covered both NS and SSB in the book I wrote together with Bob Beauchemin and Dan Sullivan - [*A First Look at SQL Server 2005 for Developers*][3]. NS was introduced in SQL Server 2000, as I mentioned, and had an overhaul in the beta releases for SQL Server 2005. However, NS was cut before SQL Server 2005 went RTM.

> **NOTE:** If you read the [book][3], you can find us covering a couple of features that never made it to RTM.

SSB survived, and in SQL Server 2008 Feature Pack, Microsoft introduced [**Service Broker External Activator**][4] (EA). This is a way through SSB to be able to communicate outside of the local database. The theory sounds good, but in reality, it is cumbersome and convoluted. We did some tests with it, but we quickly realized it didn't do what we wanted. Also, SSB did not give us the performance we needed, so we had to come up with something else.

## SQLCLR

What we came up with was based on **SQLCLR**. SQLCLR is where the .NET framework is embedded in the SQL engine, and you execute .NET code in the SQL Server process. Since you execute .NET code, you can *almost* do anything you can in a "normal" .NET application.

> **NOTE:** I wrote "almost" above, as there actually are certain limitations. For this discussion however, the limitations have **almost** no impact on what we want to do.

The way SQLCLR works is that you compile your code into a dll, and you then register the **assembly** with SQL Server:

``` sql
CREATE ASSEMBLY [RabbitMQ.SqlServer]
AUTHORIZATION rmq
FROM 'F:\some_path\RabbitMQSqlClr4.dll'
WITH PERMISSION_SET = UNSAFE;
GO
```
**Code Snippet 1:** *Creating an Assembly from Absolute Path*

The code does the following: 

* `CREATE ASSEMBLY` - creates an assembly with a given name (whatever you want it to be).
* `AUTHORIZATION` - indicates the *owner* of the assembly. In this case `rmq` is a pre-defined SQL Server role.
* `FROM` - defines where the original assembly lives. The `FROM` statement can also take an UNC patch or a binary definition of the assembly. The installation files for this project uses the binary representation.
*  `WITH PERMISSION_SET` - sets the permissions. `UNSAFE` is the least restrictive, and needed in this case.

> **NOTE:** Whatever role/login the `AUTHORIZATION` sets, will also cause an appdomain to be created with that name, as well as loading the assembly into that domain, when the assembly is loaded. It is good practice to try and keep your assemblies separated in different appdomains to prevent an error in one assembly taking down multiple assemblies. If the assemblies have dependencies on each other however, they cannot be separated in different appdomains.

When the assembly is created you create wrappers around the .NET methods in your assembly:

``` sql
CREATE PROCEDURE rmq.pr_clr_PostRabbitMsg @EndpointID int, @Message nvarchar(max)
AS
EXTERNAL NAME  [RabbitMQ.SqlServer].[RabbitMQSqlClr.RabbitMQSqlServer].[pr_clr_PostRabbitMsg];
GO
```
**Code Snippet 2:** *.NET Method Wrappers*

The code above does:

* Create a T-SQL stored procedure named `rmq.pr_clr_PostRabbitMsg`, and it takes two parameters; @EndpointID and @Message.
* Instead of having a body, the procedure is created against an external source, which consists of:
    * An assembly named `RabbitMQ.SqlServer`, i.e. the assembly we created above in *Code Snippet 1*.
    * A fully qualified type (name-space and class): `RabbitMQSqlClr.RabbitMQSqlServer`
    * A method in the above name-space and class: `pr_clr_PostRabbitMsg`.

When executing  the procedure `rmq.pr_clr_PostRabbitMsg`, the method `pr_clr_PostRabbitMsg` will be called.

> **NOTE:** When creating the procedure, the assembly name is not case sensitive, however the fully qualified type and method name are. There is no requirement that the procedure name being created are the same as the method name. However, the eventual data types for the parameters have to match.

As I mentioned before, at [Derivco](/Derivco) we have the requirement to send data out of SQL server, and for that we use SQLCLR and **[RabbitMQ][rmq]** (RMQ).

## RabbitMQ

RMQ is an open source message broker software that implements the Advanced Message Queuing Protocol (AMQP), and is written in the Erlang programming language. As the RMQ is  a message broker, you need AMQP client libraries to connect to the broker. Your application references the client libraries, opens a connection and send messages - think ADO.NET to SQL Server. As opposed to ADO.NET, where you most likely opens a connection each time you communicate with the database, you will keep the connection open for the lifetime of the application.

So, in order to be able to communicate from the database to RabbitMQ we need an application and the .NET client library for RabbitMQ.

> **NOTE:** In the rest of this post three will be some code snippets showing RabbitMQ code, but there won't be much explanation what they do. If you are new to RabbitMQ I suggest you have a look at the various [RabbitMQ Tutorials][6], to get a feel for what the code is doing. The [*Hello World*][7] tutorial for *C#* is a good place to start. One thing different between the tutorials and the demo code is that in the demo code no exchanges are declared. The expectation is that they are pre-defined.

## RabbitMQ.SqlServer

**RabbitMQ.SqlServer** is an assembly that uses the .NET client library for RabbitMQ and exposes functionality to post messages from the database to one or more RabbitMQ endpoints (VHosts and Exchanges). The code can be downloaded/forked from my GitHub repository [RabbitMQ-SqlServer][5]. It contains source code of assemblies as well as install files (so you don't have to build from source).

> **NOTE: This is demo code, to give an idea how SQL Server can call RabbitMQ. This is NOT production ready code in any shape or form. If the code burns down your house and kills your cat - don't blame me - it is DEMO code.**

### Functionality

When the assembly is being loaded, either due to en explicit call to initialize it - or implicit by calling wrapper procedure, the assembly loads the connection-string to the local database where the assembly is installed, as well as RabbitMQ endpoints, to which it also connects:

``` cs
internal bool InternalConnect()
{
  try
  {
    _connFactory = new ConnectionFactory();
    _connFactory.Uri = _connString;
    _connFactory.AutomaticRecoveryEnabled = true;
    _connFactory.TopologyRecoveryEnabled = true;
    RabbitConn = _connFactory.CreateConnection();
    

    for (int x = 0; x < _channels; x++)
    {
      var ch = RabbitConn.CreateModel();
      _rabbitChannels.Push(ch);
    }

    return true;
  }
  catch(Exception ex)
  {
    return false;
  }
}
```
**Code Snippet 3:** *Connection to an Endpoint*

While part of connecting to the endpoint it also creates `IModel`s on the connection, and these are used when posting messages:

``` cs
internal bool Post(string exchange, byte[] msg, string topic)
{
  IModel value = null;
  int channelTryCount = 0;
  try
  {
    while ((!_rabbitChannels.TryPop(out value)) && channelTryCount < 100)
    {
      channelTryCount += 1;
      Thread.Sleep(50);
    }

    if (channelTryCount == 100)
    {
      var errMsg = $"Channel pool blocked when trying to post message to Exchange: {exchange}.";
      throw new ApplicationException(errMsg);
      }

    value.BasicPublish(exchange, topic, false, null, msg);
    _rabbitChannels.Push(value);
    return true;

  }
  catch (Exception ex)
  {
    if (value != null)
    {
      _rabbitChannels.Push(value);
    }
    throw;
  }
}
```
**Code Snippet 4:** *Sending a Message Using an IModel*

The `Post` method is called via the method `pr_clr_PostRabbitMsg(int endPointId, string msgToPost)` which is exposed as a procedure to the `CREATE PROCEDURE` statement in *Code Snippet 2*:

``` cs
public static void pr_clr_PostRabbitMsg(int endPointId, string msgToPost)
{
  try
  {
    if(endPointId == 0)
    {
      throw new ApplicationException("EndpointId cannot be 0");
    }
    if (!_isInitialised)
    {
      pr_clr_InitialiseRabbitMq();
    }
    var msg = Encoding.UTF8.GetBytes(msgToPost);
    if (endPointId == -1)
    {
      foreach (var rep in _remoteEndpoints)
      {
        var exch = rep.Value.Exchange;
        var topic = rep.Value.RoutingKey;
        foreach (var pub in _rabbitPublishers.Values)
        {
          pub.Post(exch, msg, topic);
        }
      }
    }
    else
    {
      RabbitPublisher pub;
      if (_rabbitPublishers.TryGetValue(endPointId, out pub))
      {
        pub.Post(_remoteEndpoints[endPointId].Exchange, msg, _remoteEndpoints[endPointId].RoutingKey);
      }
      else
      {
        throw new ApplicationException($"EndpointId: {endPointId}, does not exist");
      }
    }
  }
  catch
  {
    throw;
  }
}  
```
**Code Snippet 5:** *Method to be Exposed as Procedure*

When executing the method the assumption is that the caller sends in the id of the endpoint to which to send the message, as well as the actual message. If -1 is sent in as endpoint id, we loop through all endpoints and send it to all. The message comes in as a string and from the string we are getting bytes by using `Encoding.UTF8.GetBytes`. Calling `Encoding.UTF8.GetBytes` should in a production environment be replaced with some type of serialization.

### Installation

In the *src\sql* folder are all files needed for installing and running this demo code. To install:

1. Run the `01.create_database_and_role.sql` file. This creates: 
    * the test database `RabbitMQTest` where the assembly will be created.
    * a SQL Server `ROLE`: `rmq`, which will own the assembly when it is created.
    * a `SCHEMA`, also called `rmq`. The various database objects are created in this schema.
2. Run `02.create_database_objects.sql`. This script creates:
    * a table `rmq.tb_RabbitSetting`, in which the local database connection string will be stored.
    * a table `rmq.tb_RabbitEndpoint`, in which one or more RabbitMQ endpoints is stored.
1. Edit the `@connString` variable in `03.create_localhost_connstring.sql` to the correct connection string for the `RabbitMQTest` database created in step 1. Then run the script.

Before continuing, you need to have an RabbitMQ broker up and running and a VHost (the default VHost `/` will do). We tend to have quite a few VHosts, purely for isolation purposes. The VHost also needs an exchange, in the demo code we use `amq.topic`. When you have a RabbitMQ broker you edit the parameters in the `rmq.pr_UpsertRabbitEndpoint` procedure which is in the `04.upsert_rabbit_endpoint.sql` file:

``` sql
EXEC rmq.pr_UpsertRabbitEndpoint @Alias = 'rabbitEp1',
                                 @ServerName = 'RabbitServer',
                                 @Port = 5672,
                                 @VHost = 'testHost',
                                 @LoginName = 'rabbitAdmin',
                                 @LoginPassword = 'some_secret_password',
                                 @Exchange = 'amq.topic',
                                 @RoutingKey = '#',
                                 @ConnectionChannels = 5,
                                 @IsEnabled = 1
```
**Code Snippet 6:** *Creating a RabbitMQ Endpoint*

At this stage it is time to deploy the assemblies. What we deploy is different if the SQL Server version is pre SQL Server 2014 (2005, 2008, 2008R2, 2012), or version 2014 or later. The difference comes what version of CLR is supported. Pre SQL Server 2014, the .NET framework ran on version 2 of CLR, whereas for SQL Server 2014, and later, it is version 4.

#### SQL Server 2005 - 2012

Let us start with the SQL server versions that run on CLR 2, as it is not completely straight forward what to do. We know that we need to deploy the assembly we wrote, and we also need to deploy the .NET client library assembly for RabbitMQ (`RabbitMQ.Client`). The RabbitMQ client library should be referenced from our assembly. As we target CLR 2, our assembly as well as the `RabbitMQ.Client` need to be compiled against no later .NET version than 3.5. This is where there are some issues.

All the later versions of the `RabbitMQ.Client` libraries are compiled against CLR 4, which means they cannot be used by our assembly. The latest version of the client libraries compiled against CLR 2 is 3.4.3. However, if we try to deploy that assembly we get a "nasty" error message:

![](/images/posts/missing_assembly_servicemodel.png)

**Figure 1:** *Missing Assembly System.ServiceModel* 

This version of the `RabbitMQ.Client` references an assembly which is not part of CLR inside SQL Server. It is a WCF assembly, and when I - above - wrote of certain limitations in SQLCR, this is one of them: that particular assembly are for all intents and purposes not allowed to run within SQL Server. The latest versions of `RabbitMQ.Client` does not have this reference, and can therefore be used without any issues - apart from that "pesky" CLR 4 requirement. What to do?

Well, RabbitMQ is open source, and we are developers so, let's recompile from source. Before the latest releases of `RabbitMQ.Client` (i.e for versions <3.5.0) I removed the `System.ServiceModel` reference, and re-compiled. I did have to change a couple of lines of code which used functionality from `System.ServiceModel`, but it was minor changes.

For this demo code I did not use the 3.4.3 version, but grabbed the [3.6.6 stable release][8], and recompiled using .NET 3.5 (CLR 2). That almost worked :), except for that later releases of `RabbitMQ.Client` uses `Task`'s, which are not part of .NET 3.5 natively. 

Fortunately there is a version of [`System.Threading.dll`][9] for .NET 3.5 which includes `Task`. I downloaded that, referenced it and all is good! The implication this has is that `System.Threading.dll` need to be installed as well as an assembly.

> **NOTE:** The source for the `RabbitMQ.Client` from which I built the .NET 3.5 version is in my [**RabbitMQ Client 3.6.6 .NET 3.5**][10] GitHub repository. The compiled dll together with the `System.Threading.dll` for .NET 3.5 is also in the *lib\NET3.5* folder in the [demo code (RabbitMQ-SqlServer)][5] repo. 

To install the necessary assemblies (System.Threading, RabbitMQ.Client, and RabbitMQ.SqlServer) run the install scripts from *src\sql*, in following order:

1. `05.51.System.Threading.sql2k5-12.sql` - System.Threading
1. `05.52.RabbitMQ.Client.sql2k5-12.sql` - RabbitMQ.Client
1. `05.53.RabbitMQ.SqlServer.sql2k5-12.sql` - RabbitMQ.SqlServer

#### SQL Server 2014+

For SQL Server 2014 and later, you compile your assembly as .NET 4.xx (the demo code is 4.5.2), and you can reference any of the later `RabbitMQ.Client` versions, which you can get from [NuGet][11]. For the demo code I use 4.1.1. The `RabbitMQ.Client` is also in the *lib\NET4* folder in the [demo code (RabbitMQ-SqlServer)][5] repo.


To install you run the install scripts from *src\sql*, in following order:

1. `05.141.RabbitMQ.Client.sql2k14+.sql` - RabbitMQ.Client
1. `05.142.RabbitMQ.SqlServer.sql2k14+.sql` - RabbitMQ.SqlServer

#### SQL Method Wrappers

To create procedures that can be used from created assemblies (3.5 or 4), you run the `06.create_sqlclr_procedures.sql` script which creates T-SQL procedures for the three .NET methods:

* `rmq.pr_clr_InitialiseRabbitMq` calls `pr_clr_InitialiseRabbitMq`. Used to load and initialize the `RabbitMQ.SqlServer` assembly.
* `rmq.pr_clr_ReloadRabbitEndpoints` calls `pr_clr_ReloadRabbitEndpoints`. Loads the various RabbitMQ endpoints.
* `rmq.pr_clr_PostRabbitMsg` calls `pr_clr_PostRabbitMsg`. Used to post a message to RabbitMQ.

The script also creates a "pure" T-SQL procedure - `rmq.pr_PostRabbitMsg` - which executes against the `rmq.pr_clr_PostRabbitMsg`. This procedure is a "wrapper", which knows what to do with the data and handles errors etc. In production we have multiple procedures like this, handling different types of messages. More about that in **Usage** below.

### Usage

From all of the above we can see that to post a message to RabbitMQ we call the `rmq.pr_PostRabbitMsg` or `rmq.pr_clr_PostRabbitMsg` with an endpoint id and the message in string format. That is cool, but how would it be used in the "real world". 

What [we](/Derivco) do in the production systems - in the stored procedures that processes data and the data should be sent to RabbitMQ - is to build up the data we want to send and then in a "hook point" we call the equivalent of `rmq.pr_PostRabbitMsg`. Below is a very simplified example of such a procedure:

``` sql
ALTER PROCEDURE dbo.pr_SomeProcessingStuff @id int
AS
BEGIN
  SET NOCOUNT ON;
  BEGIN TRY
    --create a variable for the endpoint
    DECLARE @endPointId int;
    --create a variable for the message
    DECLARE @msg nvarchar(max) = '{'
    --do important stuff, and collect data for the message
    SET @msg = @msg + '"Id":' + CAST(@id AS varchar(10)) + ','
    -- do some more stuff
    SET @msg = @msg + '"FName":"Hello",';
    SET @msg = @msg + '"LName":"World"';
    SET @msg = @msg + '}';

    --do more stuff
    -- get the endpoint id from somewhere, based on something
    SELECT @endPointId = 1;
    --here is the hook-point
    --call the procedure to send the message
    EXEC rmq.pr_PostRabbitMsg @Message = @msg, @EndpointID = @endPointId;
  END TRY
  BEGIN CATCH
    DECLARE @errMsg nvarchar(max);
    DECLARE @errLine int;
    SELECT @errMsg = ERROR_MESSAGE(), @errLine = ERROR_LINE();
    RAISERROR('Error: %s at line: %d', 16, -1, @errMsg, @errLine);
  END CATCH
END
```
**Code Snippet 7:** *Procedure with Hook-point* 

In *Code Snippet 7* we see how the data to be sent is captured in the procedure, and when processing is done the data is sent. To use this procedure execute the `07.create_processing_procedure.sql` script in the *src\sql* folder.

### Make it All Happen

At this stage you should now be ready to send some messages. Before you test it, make sure you have a RabbitMQ queue bound to the exchange your end-point in `rmq.tb_RabbitEndpoint` points to. 

So, to test this:

* Open the script file `99.test_send_message.sql`.
* Execute `EXEC rmq.pr_clr_InitialiseRabbitMq;`, to initialize the assembly and load the RabbitMQ endpoints. This is not necessarily required, but it is good practice to "pre-load" the assembly after it has been created or altered.
* Execute `EXEC dbo.pr_SomeProcessingStuff @id = 101` (use any id value you want).

If no errors happened you should now see a message in your bound queue in the RabbitMQ broker! Congratulations, you have now used SQLCLR to send a message to a RabbitMQ broker. 

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[de]: (/Derivco)
[rmq]: http://www.rabbitmq.com/
[1]: https://groups.google.com/forum/#!searchin/rabbitmq-users/sql$20server%7Csort:relevance/rabbitmq-users/T8fA1KdVtYE/bkRz3JkOCwAJ
[2]: https://groups.google.com/forum/#!forum/rabbitmq-users
[3]: https://www.amazon.com/First-Look-Server-2005-Developers/dp/0321180593/ref=sr_1_1?ie=UTF8&qid=1486701050&sr=8-1&keywords=A+First+Look+at+SQL+Server+2005+for+Developers
[4]: https://blogs.msdn.microsoft.com/sql_service_broker/2008/11/21/announcing-service-broker-external-activator/
[5]: https://github.com/nberglund/RabbitMQ-SqlServer
[6]: http://www.rabbitmq.com/getstarted.html
[7]: http://www.rabbitmq.com/tutorials/tutorial-one-dotnet.html
[8]: https://github.com/rabbitmq/rabbitmq-dotnet-client/tree/stable
[9]: https://www.nuget.org/packages/System.Threading.dll/
[10]: https://github.com/nberglund/rabbitmq-dotnet-client-3.6.6-stable_net_3.5
[11]: https://www.nuget.org/packages/RabbitMQ.Client
