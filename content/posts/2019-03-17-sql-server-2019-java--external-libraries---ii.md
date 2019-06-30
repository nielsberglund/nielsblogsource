---
type: post
layout: "post"
title: "SQL Server 2019, Java & External Libraries - II"
author: nielsb
date: 2019-03-17T17:13:45+02:00
comments: true
highlight: true
draft: false
categories:
  - SQL Server 2019
  - SQL Server Machine Learning Services
  - SQL Server Extensibility Framework
tags:
  - SQL Server 2019
  - R
  - Python
  - Java
  - SQL Server Extensibility Framework
  - CREATE EXTERNAL LIBRARY
description: We look at how to use CREATE EXTERNAL LIBRARY to deploy Java code without having access to SQL Server's filesystem. 
keywords:
  - SQL Server 2019
  - R
  - Python
  - Java
  - SQL Server Extensibility Framework
  - CREATE EXTERNAL LIBRARY 
---

This post is part of the [**SQL Server 2019 Extensibility Framework & Java**](/s2k19_ext_framework_java) series of posts, and it is the second post discussing SQL Server 2019, Java and the creation and use of external libraries.

In the previous post about external libraries, we said that they were beneficial as they reduced complexities when deploying code, but there were still some caveats. So, in this post, we look at how to overcome those caveats

<!--more-->

## Recap

Let us start with a recap of what we covered in the previous post.

In the last post we saw how we can make the use of Java in SQL Server somewhat less complex (permissions, code paths, etc.), by using external libraries.

We create the external library using the DDL statement `CREATE EXTERNAL LIBRARY`, and we saw in the post that the signature, somewhat simplified, looks like so:

```sql
CREATE EXTERNAL LIBRARY library_name  
[ AUTHORIZATION owner_name ]  
FROM <file_spec> [ ,...2 ]  
WITH ( LANGUAGE = <language> )  
[ ; ]
```
**Code Snippet 1:** *Signature CREATE EXTERNAL LIBRARY*

To be able to use external libraries for your Java code, the code need be packaged either in a `.jar` file or your class files need to be archived into a `.zip` file. We give the external library a name, in the `file_spec` we point to where the file resides, and finally, we set the `LANGUAGE` parameter to `Java`:

```sql
USE JavaTest;
GO

CREATE EXTERNAL LIBRARY myCalc
FROM (CONTENT = 'W:\javacodepath\MyCalcJar.jar')
WITH (LANGUAGE = 'Java');
```
**Code Snippet 2:** *Create External Library*

The code we see in *Code Snippet 2* is fairly self-explanatory, where we name the external library `myCalc` and the code is at `W:\javacodepath\MyCalcJar.jar`. What is interesting when creating external libraries for Java is that the name does not matter (apart from that it has to be unique).

To see that it has worked we use catalog views to investigate:

```sql
SELECT el.name, el.[language], ef.content
FROM sys.external_libraries el
JOIN sys.external_library_files ef
  ON el.external_library_id = ef.external_library_id
```
**Code Snippet 3:** *View External Libraries*

In *Code Snippet 3* we do a `SELECT` against `sys.external_libraries` and `sys.external_library_files`, and when we execute the result looks like so:

![](/images/posts/sql_2k19_java_view_ext_lib.png)

**Figure 1:** *External Libraries View*

We see in *Figure 1* some information about the external library. The `content` column outlined in red is interesting in that it contains the binary representation of the external library. This is like assemblies in SQLCLR. They are persisted to system tables and, when needed, loaded from the tables based on the binary representation. External libraries are the same, persisted to system tables, and when needed they are loaded from those tables.

So by loading the code from the database, we no longer need to worry about permissions and where to load the code from. An additional benefit is that the external libraries are database bound. If you backup and restore the database to another machine, the external libraries are there, as opposed to if you load them from a file location.

As good as this is, there is a problem or rather a caveat. What we have done so far requires the code for the external library to be in a location SQL Server can read. I as a developer may not have access to the file system of the SQL box. So in the rest of this post, we look at some options how we can create an external library on a remote SQL Server, where we do not have access to the file system, but we can access the SQL Server instance via SSMS or in my case, [Azure Data Studio][1].

## Demo Code

Before diving into what we want to do, let us look at the code we use today (it looks very similar to the code in the previous post):

``` sql
USE master
GO

DROP DATABASE IF EXISTS JavaTest;
GO

DROP DATABASE IF EXISTS JavaTestLocal;
GO

DROP DATABASE IF EXISTS JavaTestRemote;
GO

CREATE DATABASE JavaTestLocal;
GO

CREATE DATABASE JavaTestRemote;
GO
```
**Code Snippet 4:** *Create Databases*

We see in *Code Snippet 4* how we create a couple of databases. Since I do not have access to a remote SQL Server right now, I emulate the remote SQL by the `JavaTestRemote` database. Oh, and the first database I drop, that is the one we used in the previous post. We also need some Java code. We assume the code below is in a source file named `Calculator.java`:

``` java
public class Calculator {
    public static short numberOfOutputCols;
    public static int x;
    public static int y;

    static public int[] outputDataCol1;
    static public boolean[][] outputNullMap;

    public static void adder() {
        numberOfOutputCols = 1;
        outputDataCol1 = new int[1];
        outputDataCol1[0] = x + y;
        outputNullMap = new boolean[1][1];
    }
}
```
**Code Snippet 5:** *Java Calculator*

The code in *Code Snippet 5* is the same we used in [SQL Server 2019, Java & External Libraries - I][2]. As I mentioned in the [last post][2] that if you wonder about the variables in the code, the other posts in the Java [series](/s2k19_ext_framework_java) discuss them in detail.

The last thing to do before we can talk about how to solve the issue with having to have access to the file system of the box SQL Server is on is to compile the code in *Code Snippet 5* and create a `.jar` for it:

```java
$ javac .\Calculator.java
$ jar -cf MyCalcJar.jar .\Calculator.class
```
**Code Snippet 6:** *Compile and Create a jar File*

After running the code in *Code Snippet 6* we have a `.jar` file which we use to create the external library. 

## External Library

The question is now how to create the external library on a remote SQL Server instance if we do not have access to the file system on that server? Let us look at `CREATE EXTERNAL LIBRARY`'s signature again (we saw it in the previous [post][2]):

```sql
CREATE EXTERNAL LIBRARY library_name  
[ AUTHORIZATION owner_name ]  
FROM <file_spec> [ ,...2 ]  
WITH ( LANGUAGE = <language> )  
[ ; ]  
```
**Code Snippet 7:** *Signature CREATE EXTERNAL LIBRARY*

Remember how we said in [SQL Server 2019, Java & External Libraries - I][2], that `file_spec` points to the content of the package/code, and we saw in *Code Snippet 2* how we set `file_spec` to the path of the file. 

However, we also said in the last [post][2] that `file_spec` can be a hex literal, similar to what we do when we create assemblies in SQLCLR. The hex literal is the actual binary representation of the package, and if we can get hold of the binary somehow we are "golden". So, let us look at a couple of ways we can get hold of the binary package representation:

* From a local database.
* Generate binary from code.

#### Local Database

Let us start with a way to get the binary from a local database.

> **NOTE:** This is similar to what we do at [Derivco](/derivco) when we generate SQL statements to deploy SQLCLR assemblies.

We see in *Figure 1* the `content` column, which we said before contains the binary representation of the package. What we do is to log on to the local database `JavaTestLocal`, and create the external library from the `.jar` file we created in *Code Snippet 6*:

``` sql
USE JavaTestLocal;
GO

CREATE EXTERNAL LIBRARY myCalc
FROM (CONTENT = 'W:\javacodepath\MyCalcJar.jar')
WITH (LANGUAGE = 'Java');
```
**Code Snippet 8:** *Create Local External Library*

As SQL Server is installed on my local dev-machine, and SQL Server has access to the `W:\javacodepath` path, the code in *Code Snippet 8* executes ok.

We know from [SQL Server 2019, Java & External Libraries - I][2] and from the summary above how the binary representation of the package is stored in the `content` column of the `sys.external_library_files` catalog view. Let us grab the content of the `content` column:

``` sql
USE JavaTestLocal;
GO

DECLARE @binrep varbinary(max);

SELECT @binrep = lf.content
FROM sys.external_library_files lf
JOIN sys.external_libraries l
  ON lf.external_library_id = l.external_library_id
WHERE l.name = 'myCalc';

PRINT @binrep;
```
**Code Snippet 9:** *Retrieve the Binary Representation*

We see in *Code Snippet 9* how we `DECLARE` a variable `@binrep` which is a `varbinary`, and then we `SELECT` the value of the `content` column into the variable. We finally `PRINT` the content of the variable and we get something like so when we execute:

> **EDIT (2019-04-10):** The above method works only with packages with a size less than 8k. See [Installing R Packages in SQL Server Machine Learning Services - III][pkg3] for an explanation, and a way around it.

![](/images/posts/sql_2k19_java_ext_lib2_binrep.png)

**Figure 2:** *Binary Representation*

In *Figure 2* we see part of the binary value of the package. We copy that into a new query window connected to the remote server and database, and we do a new `CREATE EXTERNAL LIBRARY`, but instead of a file-path for the `CONTENT` parameter we paste in the binary representation:

``` sql
USE JavaTestRemote;
GO

CREATE EXTERNAL LIBRARY myCalcRemote
FROM (CONTENT = 0x504B03041400080808007B34684E...)
WITH (LANGUAGE = 'Java');
```
**Code Snippet 10:** *Use Binary as CONTENT*

We see how the `CONTENT` parameter in *Code Snippet 10* now contains the binary value of the external library. After we execute the code in *Code Snippet 10* we test to see that it has worked by executing on the remote SQL Server:

``` sql
USE JavaTestRemote;
GO

EXECUTE sp_execute_external_script
@language = N'Java',
@script = N'Calculator.adder',
@params = N'@x int, @y int',
@x = 21,
@y = 21;
```
**Code Snippet 11:** *Execute Against Calculator.adder*

The result of running the code in *Code Snippet 11* is:

![](/images/posts/sql_2k19_java_ext_lib2_queryres1.png)

**Figure 3:** *Result*

From what we see in *Figure 3*, everything has worked. 

We used the binary representation of an external library on our local SQL Server instance to create an external library on a remote instance. We do this without having access to the remote file system. 

That is all well and good, but what if we do not have access to a local SQL Server?

#### Generate Binary from Code

The second way we can get the binary representation is to generate it from code. When I started looking into this post and how to generate the binary representation I first started with C# as I am a .NET guy. However, boy, that was a lot of code (slight exaggeration), and wouldn't it be "cool" if I could just run a script, and send in a file-path to the package? Everyone told me that Python is what all the "cool kids" use, so I decided to go with Python, and this is the code I started with:

``` python
import binascii

filePath = "W:\\javacodepath\\MyCalcJar.jar"

with open(filePath, "rb") as binaryfile :
    myArr = binaryfile.read()
    hex_bytes = '0x' + binascii.hexlify( \
                       bytearray(myArr)).decode('utf-8')

print(hex_bytes)
```
**Code Snippet 12:** *Generate Binary from Python*

When we look at the code in *Code Snippet 12* we see how:

* I `import` the `binascii` module which contains a number of methods to convert between binary and various ASCII-encoded binary representations.
* I hardcode (for now) the file-path to where the `.jar` file is.
* I open the file in binary mode. The `"rb"` in the `open(filePath, "rb")` indicates I want the file as binary.
* I read the file into a byte array (`myArr`).
* I turn the byte-array into hex representation, and then I print the hex representation.

The code is in a source file named `outputBinary.py`, and when I execute it from a command prompt I see the following:

![](/images/posts/sql_2k19_java_ext_lib2_python1.png)

**Figure 4:** *Python Output*

The (cropped) binary output in *Figure 4* is the same as we used in *Code Snippet 10*. We can now copy the output as we see in *Figure 4* and do exactly what we did before.

However, why do copy and paste when we can connect directly from Python to the remote database and execute `CREATE EXTERNAL LIBRARY`:

``` python
import pyodbc
import binascii

filePath = "W:\\javacodepath\\MyCalcJar.jar"
extLibName = 'myCalcRemote'

with open(filePath, "rb") as binaryfile :
    myArr = binaryfile.read()
    hex_bytes = '0x' + binascii.hexlify(bytearray(myArr)).decode('utf-8')

# connect to db

dbServer = 'localhost\s2k19_ctp23_1'
dataBase = 'JavaTestRemote'
userName = '<some_user_name'
password = '<some_pwd>'

drvr = '{ODBC Driver 17 for SQL Server}'
connStr = f'DRIVER={drvr};SERVER={dbServer};DATABASE={dataBase};UID={userName};PWD={password}'
conn = pyodbc.connect(connStr)
cursor = conn.cursor()

execStmt = f'CREATE EXTERNAL LIBRARY {extLibName}\n'
execStmt = execStmt + f'FROM (CONTENT = {hex_bytes})\n'
execStmt = execStmt + f"WITH (LANGUAGE = 'Java');\n"

cursor.execute(execStmt)
conn.commit()
```
**Code Snippet 13:** *Create External Library from Python Code*

Before we look at the code in *Code Snippet 13* let us drop the external library we just created in the remote SQL Server instance: `DROP EXTERNAL LIBRARY myCalcRemote`. This to ensure we are back in a state with no external libraries installed.

So, what do we do in *Code Snippet 13*? Well, we use the same code as in *Code Snippet 12* to generate the binary representation, but we do not do a `PRINT` of it. Instead, we connect to the database using the `pyodbc` module, and the latest SQL Server ODBC driver. The `hex_bytes` variable is now a parameter in the `CREATE EXTERNAL LIBRARY` statement, and we have a hardcoded variable for the name of the external library.

As the code is just sample code, the connection details for the database is also hardcoded. In a real-world scenario, the script should prompt for the various details; file path, name, connection details etc., and assign the inputs to the variables: 

``` python
extLibName = input("Provide a unique name for \
                   the external library you want to create: ")
filePath = input("Provide full path to the JAR \
                  file you want to use - \
                  Example: 'W:\\javacodepath\\myJarFile.jar': ")
dbServer = input("Provide name/ip address of your \
                  database server. If instance also instance name \ 
                  - Example: 'mydbServer\myInstance: ")
dataBase = input("Provide name of the database where you \
                  want to create the external library: ")
userName = input("Provide the user name with which you \
                   want to connect to the server: ")
password = input("Provide password with which to \
                  connect to the database: ")
```
**Code Snippet 14:** *Input Variables*

It is worth noting that the way the script captures the password variable is not particularly secure. Instead of `input`, we should use `getpass` or something similar.
 
> **NOTE:** Unless the user with which you connect is part of `db_owner`, the user needs explicit permissions to execute `CREATE EXTERNAL LIBRARY`.

To test this, you replace the variables in *Code Snippet 13* with relevant values for your environment and run the code. The code should run OK, and you have now created an external library in a database in a remote SQL Server (well, in my case an emulated remote SQL Server).

## Summary

In this post, we set out to solve the issue of how to create an external library of some Java code without having access to the filesystem of the SQL Server where we want to create the external library.

We have seen two ways of doing it:

#### Local Datbase

1. Create the external assembly from a file-path in a local SQL Server where we have access to the filesystem (like `localhost`). 
1. Copy the binary representation from the `content` column in `sys.external_library_files`.
1. Assign the copied value to the `CONTENT` parameter in `CREATE EXTERNAL LIBRARY`.
1. Execute `CREATE EXTERNAL LIBRARY`.

#### Generate from Code

1. Write script code which generates the binary representation.
1. Follow from step 2 above (local database).

Alternatively, you in addition to generate the binary in the script, connect to the database from inside the script and call `CREATE EXTERNAL LIBRARY` from the script. 

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[1]: https://github.com/Microsoft/azuredatastudio
[2]: {{< relref "2019-03-10-sql-server-2019-java--external-libraries---i.md" >}}
[pkg3]: {{< relref "2019-04-10-installing-r-packages-in-sql-server-machine-learning-services---iii.md" >}}

