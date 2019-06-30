---
layout: post
title: "New T-SQL Features in SQL 11 / Denali - Error Handling"
author: nielsb
date: 2010-11-10T11:27:56+02:00
categories:
  - SQL Server
tags:
  - SQL 11
  - t-sql
comments: true
---
A couple of days ago I wrote my [wish-list][1] to Santa what I wanted to see in next version of SQL Server (SQL 11 / Denali). I was pleasantly surprised that I could find out for myself shortly after; i.e. SQL Server Denali CTP1 was released during the PASS Summit. I have literally finished installing the next version of SQL Server (Denali / SQL 11) on a new VM, like 10 minutes ago, and I have done a quick check of the new features of SQL Server Denali (what I could find at least) against my [wish-list][1].

<!--more-->

So it seems that my autonomous transactions have not been implemented. That does not necessarily meat that they won’t be there in later releases, but for now it is a downer. In my list I also mentioned finally blocks. From what I can see that has not been implemented either, **BUT** something else has…

### RAISERROR

No `RAISERROR` is not anything new. We have used `RAISERROR` since beginning of time to throw an error in SQL Server. When using `RAISERROR` we either indicate an error-number, or a message. If we were to raise based on a number, that error number had to exist in sys.messages. If we used a message instead, the error number we received back was 50000, i.e. something like so:

``` sql
RAISERROR('An error happened', 16, 1)
```

produced this:

``` sql
Msg 50000, Level 16, State 1, Line 1
An error happened
```

### TRY … CATCH

In SQL 2005 ~~proper~~ structured error handling was introduced using `TRY … CATCH` blocks. So instead of having to “litter” our code with `SELECT @@ERROR` statements, we could enclose our code in `BEGIN TRY END TRY` followed by `BEGIN CATCH END CATCH`. Something like so:

``` sql
BEGIN TRY
  SELECT 'hello';
  SELECT 1 / 0;
  SELECT 'world'
END TRY
BEGIN CATCH
  --handle the error
END CATCH
```

… and life was good (IMHO the structured exception handling was one of the greatest new features in SQL Server 2005). However, we are never completely satisfied, we always want more. And what we wanted to do, was to be able to handle the error, and then perhaps re-throw the error (like we can do in other modern development languages). Up until SQL Server Denali / SQL 11 the only way to do that was to use `RAISERROR`. That would not have been so bad apart from the fact that we are not allowed to raise an error with a system defined error number, i.e. `RAISERROR(8134 …)`. So instead we had to resort to various “hack” to achieve what we wanted.

### THROW

This has now been fixed in SQL Server Denali / SQL 11 by the introduction of **`THROW`**. `THROW` does not require that an error number being thrown exists in sys.messages, so you can raise an exception like so: `THROW 50001, ‘OOPS – something happened’, 1`. Notice how you do not define a severity when using `THROW`, all exceptions being raised by `THROW` has a severity of 16.

The really great thing with `THROW` however is how you can use it like you would use `THROW` in other languages. In other words you use use it to re-throw an exception:

``` sql
BEGIN TRY
  SELECT 'hello';
  SELECT 1 / 0;
  SELECT 'world'
END TRY
BEGIN CATCH
  --handle the error
  PRINT 'here we are handling the error'
  THROW
END CATCH
```

The above code snippet produces this output:

``` sql
here we are handling the error
Msg 8134, Level 16, State 1, Line 3
Divide by zero error encountered.
```
I do not know about you, but I think this is fairly cool. I do still want finally blocks and autonomous transactions, but right now I take what I can get.

As I mentioned in the beginning of this post; I have just installed SQL Server Denali, and have not had time to do much “spelunking”. Stay tuned for more posts in the coming days. You should also check [Simon Sabin’s][2] blog, where he has quite a lot of [SQL Server Denali coverage][3].

 [1]: {{< relref "2010-11-07-what-new-programmability-features-will-there-be-in-sql-11.md" >}}
 [2]: http://sqlblogcasts.com/blogs/simons/
 [3]: http://sqlblogcasts.com/blogs/simons/archive/2010/11/07/sql-server-denali-whats-new.aspx
