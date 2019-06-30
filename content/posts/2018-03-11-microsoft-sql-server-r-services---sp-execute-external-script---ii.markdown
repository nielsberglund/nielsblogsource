---
layout: post
title: Microsoft SQL Server R Services - sp_execute_external_script - II
author: nielsb
date: 2018-03-11T11:55:37+02:00
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
  - Launchpad
  - Process Monitor
  - SqlSatellite
  - WireShark
  - sp_execute_external_script   
description: A lowdown of sp_execute_external_script and its @params and @parameter1 parameters, using Process Monitor and WireShark
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - Launchpad
  - Process Monitor
  - SqlSatellite
  - WireShark
  - sp_execute_external_script      
---

This post is the 23:rd post about **Microsoft SQL Server R Services**, and a continuation of [sp_execute_external_script - I][sext1]. To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

I honestly thought this post would be the last in the series (I have thought quite a few times), but alas, that is not the case. There will be at least one more post about `sp_execute_external_script` after this.

<!--more-->

## Recap

In the last [post][sext1] we started looking at `sp_execute_external_script`, and we said that `sp_execute_external_script` is the bridge between SQL Server and external execution engines, like R or Python. The signature for the procedure looks like so:

``` sql
sp_execute_external_script 
             @language = N'language', 
             @script = N'script', 
             [ @input_data_1 = ] 'input_data_1' 
             [ , @input_data_1_name = ] N'input_data_1_name' ] 
             [ , @output_data_1_name = N'output_data_1_name' ] 
             [ , @parallel = 0 | 1 ] 
             [ , @params = ] N'@parameter_name data_type [ OUT | OUTPUT ] [ ,...n ]' 
             [ , @parameter1 = ] 'value1' [ OUT | OUTPUT ] [ ,...n ] 
[ WITH <execute_option> ] 
[;] 
```
**Code Snippet 1:** *Full Signature of sp_execute_external_script*

In the post we looked at the first five parameters:

* `@language` - tells the launchpad service what external engine to use. At the moment R and Python are supported. The parameter is required.
* `@script` - defines the script which the external engine executes. The script can be loaded as a literal value, a parameter or through the R `source(file_name)` command. The parameter is required.
* `@input_data_1` - specifies the input data used by the external script in the form of a Transact-SQL query (`SELECT` only, no procedure calls). The query can only generate one dataset. If more datasets are required, they have to be retrieved from inside the script. The parameter is optional.
* `@input_data_1_name` - specifies the name of the variable used to represent the query defined by @input_data_1. The parameter is optional, and defaults to `InputDataset`.
* `@output_data_1_name` - specifies the name of the variable in the external script that contains the data to be returned to SQL Server when the stored procedure completes. The parameter is optional, and defaults to `OutputDataSet`.

We also said the data type of the values of all parameters have to be `NVARCHAR`.

This post covers the `@params` and  `@parameter1` parameters.

## Housekeeping 

Before we "dive" into today's topics let us look at the code and the tools we use today. This section is here for those who want to follow along in what we are doing in the post.

#### Code

In this post we use the same database and database objects as in [sp_execute_external_script - I][sext1], so go there and grab the code if you need to create the database again.

#### Helper Tools

To help us figure out the things we want, we use *Process Monitor*, and *WireShark*: 

* *Process Monitor*, is used it to filter TCP traffic. If you want to refresh your memory about how to do it, we covered that in [Internals - X][si10] as well as in [Internals - XIV][si14].
* I use *WireShark* for network packet sniffing. If you want a refresher about *WireShark*, we covered the setup and so forth in [Internals - X][si10].

Now then, let us start.

## `@params` & `@parameter1`

Yeah, yeah - I know, in *Code Snippet 1* above, the `@parallel` parameter comes before the `@params` parameter. However, it makes more sense for me to cover `@params` before `@parallel`. 

The `@params` parameter is an optional parameter and when defined, it contains the definitions of all parameters embedded in the values for the `@input_data_1` and the `@script` parameters. The string must be either a Unicode constant or a Unicode variable. Each parameter definition consists of a parameter name and a data type. In [sp_execute_external_script - I][sext1] we had code looking like so:

```sql
EXEC sp_execute_external_script
            @language = N'R',
            @script = N'
                iris_dataset <- InputDataSet
                setosa <- iris_dataset[iris_dataset$Species == "setosa",]
                meanSepWidth <- mean(setosa$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanSepWidth))',
            @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full'
```
**Code Snippet 2:** *Using @input_data_1 with straight SELECT*

In *Code Snippet 2* we `SELECT` all data from the `dbo.tb_irisdata_full` table, and then in the script we filter out for the "setosa" species: `setosa <- iris_dataset[iris_dataset$Species == "setosa",]`. Instead of filtering in the script, our `SELECT` query can filter: `SELECT * FROM dbo.tb_irisdata_full WHERE species = 'setosa'`, and subsequently the `setosa` value becomes a parameter: `@specie`. The query (`@input_data_1`) then looks like this: `SELECT * FROM dbo.tb_irisdata_full WHERE species = @specie`. To use this in *Code Snippet 2* we now need to define the parameter in `@params`:

```sql
EXEC sp_execute_external_script
            @language = N'R',
            @script = N'
                setosa <- InputDataSet
                meanSepWidth <- mean(setosa$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanSepWidth))',
            @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full 
                              WHERE Species = @specie',
            @params = N'@specie nvarchar(20)';                              ;
```
**Code Snippet 3:** *Input Data with Parameter Definition*

That all looks good, but when you execute you get an error:

![](/images/posts/sql_r_services_ext_scriptII_param_error.png)

**Figure 1:** *Parameter Error*

So, the error says that `@specie` is missing, which makes kind of sense since we have not assigned a value to the parameter. So what about this then:

```sql
DECLARE @specie nvarchar(20) = 'setosa';
EXEC sp_execute_external_script
            @language = N'R',
            @script = N'
                setosa <- InputDataSet
                meanSepWidth <- mean(setosa$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanSepWidth))',
            @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full 
                              WHERE Species = @specie',
            @params = N'@specie nvarchar(20)';                              ;
```
**Code Snippet 4:** *Input Data with Parameter Definition*

In the code above (*Code Snippet 4*) we declare a `@specie` parameter and give it a value, but when we execute the procedure we get the same error as when we executed the code in *Code Snippet 3*. What gives, we are obviously missing something here?

What is missing is that we need to define the parameter as part of the procedure and also assign a value to it. Didn't we do that at the top of *Code Snippet 4*? No, what we did was we `DECLARE`: ed a new variable which had the same name as the parameter (`@specie`) but there is no reference to that variable anywhere, so it is not used.

To fix this, this is where `@parameter1` comes in (`@parameter1` is optional). In fact, there is no `@parameter1`, but it refers to the first parameter in the `@params` parameter list. When there is more than one parameter in the `@params` list, you have `@parameter2`, and so on. However, you do not refer to `@parameter1` as `@parameter1`, but you name it as per the name in the `@params` list:

```sql
EXEC sp_execute_external_script
            @language = N'R',
            @script = N'
                setosa <- InputDataSet
                meanSepWidth <- mean(setosa$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanSepWidth))',
            @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full 
                              WHERE Species = @specie',
            @params = N'@specie nvarchar(20)',
            @specie = 'setosa';                              ;
```
**Code Snippet 5:** *Defined the Actual Parameter*

In *Code Snippet 5* we see how the `@params` parameter lists the actual parameter, `@specie`, and how `@specie` is now a named parameter in the procedure. As with any parameters for stored procedures you can declare them as a variable, set the value, and assign them to the actual parameter:

```sql
DECLARE @sp nvarchar(20) = 'setosa'
EXEC sp_execute_external_script
            @language = N'R',
            @script = N'
                setosa <- InputDataSet
                meanSepWidth <- mean(setosa$SepalWidth)
                cat(paste("Seposa sepal mean width: ", meanSepWidth))',
            @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full 
                              WHERE Species = @specie',
            @params = N'@specie nvarchar(20)',
            @specie = @sp;                              ;
```
**Code Snippet 6:** *Use Parameter and Variable*

So that is parameters for the `@input_data_1` query. How about parameters in the script, where we want to send in values for those? In [sp_execute_external_script - I][sext1] we had code that looked like this:

```sql
EXEC sp_execute_external_script
      @language = N'R',
      @script = N'
          iris_dataset <- MyDataSet
          setosa <- iris_dataset[iris_dataset$Species == "setosa",]
          meanSepWidth <- mean(setosa$SepalWidth)
          cat(paste("Seposa sepal mean width: ", meanSepWidth))
          multiplier <- 5
          iris_dataset$SepalLength <- iris_dataset$SepalLength * multiplier
          OutputDataSet <- data.frame(iris_dataset$SepalLength)',
      @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full',
      @input_data_1_name = N'MyDataSet'
```
**Code Snippet 7:** *Return a Result Set*

In *Code Snippet 7* we see how the script uses the `multiplier` variable, whose value is hardcoded in the script. What if we want to send in a value to the script when the procedure runs? Well, we define a parameter for the variable and add it to the `@params` list, and then we name the parameter in the procedure and assign it a value. Merging *Code Snippet 6* with what we see in *Code Snippet 7*, we get something like so:

```sql
DECLARE @mult int = 5;
DECLARE @sp nvarchar(20) = 'setosa'
EXEC sp_execute_external_script
      @language = N'R',
      @script = N'
          setosa <- MyDataSet
          meanSepWidth <- mean(setosa$SepalWidth)
          cat(paste("Seposa sepal mean width: ", meanSepWidth))
          multiplier <- multip
          setosa$SepalLength <- setosa$SepalLength * multiplier
          OutputDataSet <- data.frame(setosa$SepalLength)',
      @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full 
                        WHERE Species = @specie',
      @input_data_1_name = N'MyDataSet',
      @params = N'@specie nvarchar(20), @multip int',
      @specie = @sp,
      @multip = @mult; 
```
**Code Snippet 8:** *Multiple Parameters*      

What we see in *Code Snippet 8* is how the `@multip` parameter is defined in the `@params` list and added to the stored procedure. We have also created a variable, `@mult`, which we have set a value for, we have then assigned the variable to the parameter.

> **NOTE:** When you refer to the parameters in the script file, you refer to them without the ampersand, so `@multip` becomes `multip` and so forth.

One more thing, we have now seen how parameters are used to assign to a query as well as pass into the script. When we look at the code in *Code Snippet 8* we see how we:

* Calculate the mean and assign it to a variable (`meanSepWidth <- mean(setosa$SepalWidth)`).
* Print out the mean using the `cat` function.

In a "real-world" scenario, you would not print out the variable, but instead wanting it passed back to the calling code. As with any code in SQL Server, when we want data passed back (data that is not resultsets that is), we use output parameters. By now we should know the "drill"; add a parameter to the `@params` list, mark it as `OUTPUT` and then add the parameter to the procedure:

```sql
DECLARE @meanOut float;
DECLARE @mult int = 5;
DECLARE @sp nvarchar(20) = 'setosa'
EXEC sp_execute_external_script
      @language = N'R',
      @script = N'
          setosa <- MyDataSet
          meanSepWidth <- mean(setosa$SepalWidth)
          multiplier <- multip
          setosa$SepalLength <- setosa$SepalLength * multiplier
          OutputDataSet <- data.frame(setosa$SepalLength)',
      @input_data_1 = N'SELECT * FROM dbo.tb_irisdata_full 
                        WHERE Species = @specie',
      @input_data_1_name = N'MyDataSet',
      @params = N'@specie nvarchar(20), @multip int, @meanSepWidth float OUT',
      @specie = @sp,
      @multip = @mult,
      @meanSepWidth = @meanOut OUT;
      
SELECT  @meanOut AS MeanSepWidth;
```
**Code Snippet 9:** *Use of Output Parameter*

In *Code Snippet 9* we see how the `@meanSepWidth` parameter is defined to the `@params` list as `OUTPUT` (`OUT` works as well) and added to the procedure. When we execute the code we get two resultsets coming back, one from the `OutputDataSet <- data.frame(setosa$SepalLength)` and the second from `SELECT  @meanOut AS MeanSepWidth`: 

![](/images/posts/sql_r_services_ext_scriptII_outparam.png)

**Figure 1:** *Resultsets Coming Back*

The last thing to discuss related to parameters are how it works internally, similar to how we in [sp_execute_external_script - I][sext1] discussed how the script knew about the input and output datasets. Here we discuss how the script and the engine know about parameters and their values. Oh, in [Internals - XVIII] we discussed the mechanism with which the value(s) of the output parameter(s) come back, so, therefore, we do not cover return values of output parameters in this post.

To begin with, in what packets are the parameters passed? To find this out, we use some much-simplified code from what we have used so far:

```sql
EXEC sp_execute_external_script
      @language = N'R',
      @script = N'
        d <- 42
        cat(paste("Answer:", d))';
     
EXEC sp_execute_external_script
      @language = N'R',
      @script = N'
        d <- multip
        cat(paste("Answer:", d))',      
      @params = N'@multip int',
      @multip = 42;
```
**Code Snippet 10:** *Execution with and without Parameters*

As we see in *Code Snippet 10* there are two instances of `sp_execute_external_script`, both are very similar, and both generate the same result. What differs is that the first one has the value `42` hard-coded where the other pass the value via a parameter. The idea is now to initially to use *Process Monitor* and compare the packets SQL Server sends to the SqlSatellite to see if we can figure out what packet passes the parameter(s). So:

* Run *Process Monitor* as admin and load the filter we used in [Internals - X][si10] where we filtered for `TCP Receive` for `BxlServer.exe`.
* Run the two `EXECUTE` statements in *Code Snippet 10* and compare the output from *Process Monitor*. Make also a note of the `Path` column and the last value. That value is the port number of the TCP port with which SQL Server communicates with the SqlSatellite. We use the port value in *WireShark* when we "sniff" network packets later.

When we execute the two statements in *Code Snippet 10*, *Process Monitor* outputs this: 

![](/images/posts/sql_r_services_ext_scriptII_param_packets.png)

**Figure 2:** *Packets Sent*

The black line in *Figure 2* separates the two executions, and we see how the third packet in each run differs in size (outlined in blue and red respectively). The packet outlined in red is bigger and comes from the second run - where we used the `@multip` parameter. The third packet is the packet where SQL Server sends the script to the SqlSatellite, and from what we can see so far it looks like some parameter information is part of this packet. Let us switch over to *WireShark* and see what goes on.

* Run *WireShark* as admin.
* Choose the network adapter to "sniff" on. See [Internals - X][si10] for discussion around loop-back adapters etc.
* Set a display filter on the port SQL Server communicates with SqlSatellite on (the port you saw in the `Path` column). In this case, we want to sniff outgoing packets, and - if we used what we saw in *Figure 2* - the filter should subsequently be: `tcp.srcport==50858`.
* Apply the filter.

Execute the code in *Code Snippet 10* where we use the `@multip` parameter and look at the output from *WireShark*. In the output is a packet with the same length as the packet outlined in red in *Figure 2*, let us have a look at the data part of that packet:

```c++
01 00 05 80 25 01 00 00  e3 01 86 81 e1 a2 2e 43   ....%... .......C
b8 e0 a7 31 0d d1 83 dd  00 00 01 00 00 00 01 00   ...1.... ........
00 00 00 00 1a 00 49 00  6e 00 70 00 75 00 74 00   ......I. n.p.u.t.
44 00 61 00 74 00 61 00  53 00 65 00 74 00 00 00   D.a.t.a. S.e.t...
1c 00 4f 00 75 00 74 00  70 00 75 00 74 00 44 00   ..O.u.t. p.u.t.D.
61 00 74 00 61 00 53 00  65 00 74 00 00 00 30 00   a.t.a.S. e.t...0.
00 00 30 00 00 00 01 00  03 00 00 00 00 00 00 00   ..0..... ........
12 00 45 00 78 00 70 00  72 00 31 00 30 00 30 00   ..E.x.p. r.1.0.0.
30 00 00 00 38 00 00 00  38 00 00 00 04 00 0a 00   0...8... 8.......
00 00 00 00 00 04 00 00  00 2a 00 00 00 10 00 40   ........ .*.....@
00 6d 00 75 00 6c 00 74  00 69 00 70 00 00 00 70   .m.u.l.t .i.p...p
00 00 00 01 80 0d 00 0a  00 20 00 20 00 20 00 20   ........ . . . . 
...
```
**Code Snippet 11:** *Hex Dump of Data Packet"

We see in *Code Snippet 11* the first 192 bytes of the packet containing the script which SQL Server sent to the SqlSatellite. In the text representation of the hex, we can see the parameter name (`@multip`), and it starts at byte 160 (the first byte in hex is `40`). So parameters are sent to the engine via the packet containing the script. What about the value of the parameter? 

The value of the parameter is somewhat harder to figure out, seeing the value is an `int` and therefore not in clear-text. However, if we look closely at the hex, we see at byte 154 a hex value of `2a` which in decimal is 42. So SQL Server passes the value(s) of the parameter(s) as well in the "script" packet. In this case, it was one parameter with one value, what happens if we have multiple parameters and values, for example, something like this:

```sql
EXEC sp_execute_external_script
      @language = N'R',
      @script = N'
        d <- multip1 * multip2
        cat(paste("Answer:", d))',      
      @params = N'@multip1 int, @multip2 int',
      @multip1 = 42,
      @multip2 = 5;
```
**Code Snippet 12:** *Script using Multiple Parameters*

In the code in *Code Snippet 12* we send two parameters to the script (`@multip1` and `@multip2`) and the hex-dump we get after we execute the code looks like so:

```c++
01 00 05 80 6a 01 00 00  b8 b1 da 7e cc d0 4e 40   ....j... ...~..N@
90 95 c1 e3 e0 58 dd 7e  00 00 01 00 00 00 02 00   .....X.~ ........
00 00 00 00 1a 00 49 00  6e 00 70 00 75 00 74 00   ......I. n.p.u.t.
44 00 61 00 74 00 61 00  53 00 65 00 74 00 00 00   D.a.t.a. S.e.t...
1c 00 4f 00 75 00 74 00  70 00 75 00 74 00 44 00   ..O.u.t. p.u.t.D.
61 00 74 00 61 00 53 00  65 00 74 00 00 00 30 00   a.t.a.S. e.t...0.
00 00 30 00 00 00 01 00  03 00 00 00 00 00 00 00   ..0..... ........
12 00 45 00 78 00 70 00  72 00 31 00 30 00 30 00   ..E.x.p. r.1.0.0.
30 00 00 00 38 00 00 00  38 00 00 00 04 00 0a 00   0...8... 8.......
00 00 00 00 00 04 00 00  00 2a 00 00 00 38 00 00   ........ .*...8..
00 38 00 00 00 04 00 0a  00 00 00 00 00 00 04 00   .8...... ........
00 00 05 00 00 00 12 00  40 00 6d 00 75 00 6c 00   ........ @.m.u.l.
74 00 69 00 70 00 31 00  00 00 12 00 40 00 6d 00   t.i.p.1. ....@.m.
75 00 6c 00 74 00 69 00  70 00 32 00 00 00 86 00   u.l.t.i. p.2.....
00 00 01 80 0d 00 0a 00  20 00 20 00 20 00 20 00   ........  . . . .
```
**Code Snippet 13:** *Hex Dump from Multiple Parameters*

In *Code Snippet 13* we see the first 240 bytes of the hex-dump from *Code Snippet 12*. When I saw this dump for the first time I was surprised to see that the parameter names are together. I thought they would appear together with the values. However as we clearly can see the values come first. We see hex `2a` (decimal 42) at byte 154, and hex `05` (decimal 5) at byte 179 and the first parameter name starts at byte 185 (hex `40`). In essence, the parameter values come before the parameter names.

When we look at the two hex-dumps, there is something else worth noticing. If we look closely at where the values are and the parameter names we see how: 

* Four bytes before the value of each parameter there is a  hex value greater than 0.
* Two bytes before the parameter name is also a hex value greater than 0. 

After doing quite a few tests, I believe (almost 100% certain) that the value before the parameter value indicates the data size of the actual parameter value. In code snippets 11 and 13 that value is hex `04`, which is decimal 4 - the size of an integer. The value in front of the parameter name tells us the length of the parameter name in double-byte. In *Code Snippet 11* the value is hex `10` which is decimal 16, and that is the double-byte length of the parameter `@multip`. In *Code Snippet 13* the value is hex `12` before each parameter. Hex `12` is decimal 18, which is the double-byte length of `@multip1` and `@multip2`.

## Summary

Phew, that was quite a lot. So :

* The `@params` parameter is used to define what parameters we use in the execution. The query in `@input_data_1` can use those parameters as well as the external script.
* The parameters defined in the `@params` list need to be added as named parameters to the stored procedure. 
* In the case of parameters for the external script; the script references the parameters by name but without the `@` sign 
* SQL Server sends the parameters and their values to the SqlSatellite in the packet containing the external script.
* In the "script" packet, preceding the values and the parameter names are hex values indicating the size of the parameter value (data type) and the parameter name.

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

