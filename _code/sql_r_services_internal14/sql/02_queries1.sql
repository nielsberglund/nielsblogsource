


USE ResultData;
GO

sp_executesql N'SELECT TOP(1) ColIntN1,ColIntN2, ColIntN3 FROM dbo.tb_Tab1 WHERE RowID = 999'



sp_executesql N'SELECT TOP(2) ColInt1, ColInt2 FROM dbo.tb_Tab1'

sp_executesql N'SELECT TOP(1) ColInt1, ColInt2, ColInt3 FROM dbo.tb_Tab1 WHERE RowID = 999'

sp_executesql N'SELECT TOP(1) ColInt1 AS A, ColInt2 AS B FROM dbo.tb_Tab1' -- WHERE RowID = 100'


sp_executesql N'SELECT TOP(1) ColIntN1 AS A, ColInt2 AS B FROM dbo.tb_Tab1' -- WHERE RowID = 100'


SELECT TOP(1) ColInt1 AS A, ColInt2 AS B FROM dbo.tb_Tab1

SELECT DATALENGTH('sp_executesql N"SELECT TOP(1) ColInt1 AS B FROM dbo.tb_Tab1"' )
SELECT DATALENGTH('SELECT TOP(2) ColInt1, ColInt2 FROM dbo.tb_Tab1' )

sp_executesql N'SELECT TOP(1) ColInt1 AS A, ColInt2 AS B FROM dbo.tb_Tab1' -- WHERE RowID = 100'
sp_executesql N'SELECT TOP(1) ColIntN1 AS A, ColIntN2 AS B  FROM dbo.tb_Tab1' -- WHERE RowID = 100'


SELECT * FROM dbo.tb_Tab1

/*sp_executesql
45 bytes query overhead
8 bytes column header
colname * 2
data type size
*/

/* straight select
27 bytes query overhead


*/

44 + 5 + 8 + 12

1 column int nullable no rows  69 bytes (44 + 25) 44 meta data 25 int col
                        1 row   71 bytes (4 + 1)
						2 rows  76 bytes (4+ 4 + 2)

2 column int nullable no rows  94  bytes
                           1 row   97  bytes (4+4+1)
						   2 rows  106 bytes (4+4+4+4+2)

3 column int nullable no rows  110 bytes
                           1 row   71 bytes
						   2 rows  76 bytes


1 column int non nullable no rows  66 bytes (44 + 22) 44 meta data 22 int col
                           1 row   71 bytes (4 + 1)
						   2 rows  76 bytes (4+ 4 + 2)

2 column int non nullable no rows  88  bytes
                           1 row   97  bytes (4+4+1)
						   2 rows  106 bytes (4+4+4+4+2)

3 column int non nullable no rows  110 bytes
                           1 row   71 bytes
						   2 rows  76 bytes

1 column bigint non nullable no rows  72 bytes (44 + 28)
                           1 row   71 bytes (4 + 1)
						   2 rows  76 bytes (4+ 4 + 2)

2 column bigint non nullable no rows  100  bytes
                           1 row   97  bytes (4+4+1)
						   2 rows  106 bytes (4+4+4+4+2)

3 column bigint non nullable no rows  128 bytes
                           1 row   71 bytes
						   2 rows  76 bytes




SELECT RowID, 1 / ISNULL(ColIntN, 0) AS Calc FROM dbo.tb_Tab1 WHERE RowID = 2;

SELECT * FROM dbo.tb_Tab1 WHERE RowID = 2;

exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-42';



exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSet',
                @input_data_1 = N'SELECT RowID, ColInt FROM dbo.tb_Tab1';


exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSet',
                @input_data_1 = N'SELECT RowID, 1 / ISNULL(ColIntN3, 0) AS Calc FROM dbo.tb_Tab1';


@input_data_1 = N'SELECT RowID, 1 / ISNULL(ColIntN3, 0) AS Calc FROM dbo.tb_Tab1';

SELECT TOP(5) rand1, rand2 FROM dbo.rand_50M

sp_executesql N'SELECT RowID, 1 / ISNULL(ColIntN3, 0) AS Calc FROM dbo.tb_Tab1'

65536
1460



exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSet',
                @input_data_1 = N'SELECT TOP(17400) y FROM dbo.rand_1M';

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet',
				@input_data_1 = N'SELECT TOP(15800) y FROM dbo.rand_1M_N';

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet',
				@input_data_1 = N'SELECT TOP(1) ColInt1, ColintN1 FROM dbo.tb_Tab1';

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet',
				@input_data_1 = N'SELECT TOP(1) ColString FROM dbo.tb_Tab1';

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet',
				@input_data_1 = N'SELECT TOP(1) ColStringN FROM dbo.tb_Tab1';

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet',
				@input_data_1 = N'SELECT TOP(2) ColNString FROM dbo.tb_Tab1';

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet',
				@input_data_1 = N'SELECT TOP(1) ColStringMax FROM dbo.tb_Tab1 WHERE RowID  = 3';


exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet',
				@input_data_1 = N'SELECT TOP(1) ColInt1 FROM dbo.tb_Tab1';


exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet',
				@input_data_1 = N'SELECT TOP(1) ColBigInt1 FROM dbo.tb_Tab1';

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet',
				@input_data_1 = N'SELECT TOP(2) ColDec1 FROM dbo.tb_Tab1';

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet',
				@input_data_1 = N'SELECT TOP(2) ColString1, ColString2 FROM dbo.tb_Tab1';

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet',
				@input_data_1 = N'SELECT TOP(1) ColStringN2 FROM dbo.tb_Tab1 WHERE RowID = 2';

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet',
				@input_data_1 = N'SELECT TOP(1) ColDecN1 FROM dbo.tb_Tab1';



-- non nullable  int, bigint, dec, col overhead 32 - each row data size
-- non nullable string col overhead 32, row data size + 2 bytes

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet',
				@input_data_1 = N'SELECT TOP(1) ColStringMax FROM dbo.tb_Tab1 WHERE RowID  = 3';

				SELECT TOP(1) ColInt1 AS B FROM dbo.tb_Tab1

2019


SELECT * FROM dbo.tb_Tab1

SELECT DATALENGTH(ColNString) FROM dbo.tb_Tab1

SELECT DATALENGTH(ColStringMax) FROM dbo.tb_Tab1

UPDATE dbo.tb_Tab1
SET ColStringMax = 'Hello 41', ColStringMaxN = 'Hello 41'
WHERE RowID = 3

exec sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(10)
                 d<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) y  FROM dbo.rand_1M'

exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSet'
              , @input_data_1 = N'SELECT TOP(1) rand1  FROM dbo.rand_1M'

exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSet'
              , @input_data_1 = N'SELECT TOP(1) rand1, rand2  FROM dbo.rand_1M'

exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSet'
              , @input_data_1 = N'SELECT TOP(1) rand1, rand2, rand3  FROM dbo.rand_1M'

exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSet'
              , @input_data_1 = N'SELECT TOP(3) rand1, rand2  FROM dbo.rand_1M'


sp_executesql N'SELECT TOP(1) rand1 FROM dbo.rand_1M'

sp_executesql N'SELECT TOP(2) rand1, rand2 FROM dbo.rand_1M'

sp_executesql N'SELECT TOP(1) y, rand1 FROM dbo.rand_1M_N'

sp_executesql N'SELECT TOP(1) y, rand1, rand2 FROM dbo.rand_1M'

51042 SSMS
50980 SQL


sp_executesql N'SELECT TOP(1) y FROM dbo.rand_1M'
sp_executesql N'SELECT TOP(1) rand1, rand2 FROM dbo.rand_1M_N'

sp_executesql N'SELECT TOP(1) rand1 FROM dbo.rand_1M'

sp_executesql N'SELECT TOP(1) y 
                FROM dbo.rand_1M'
GO
sp_executesql N'SELECT TOP(1) rand1 
                FROM dbo.rand_1M' 
GO
sp_executesql N'SELECT TOP(1) rand1, rand2, rand3 FROM dbo.rand_1M' 
GO





CREATE TABLE dbo.an_extremely_extremely_extremely_long_table_name
(
  RowID int identity primary key,
  y int not null
);

INSERT INTO dbo.an_extremely_extremely_extremely_long_table_name(y)
VALUES(42), (42), (42);


sp_executesql N'SELECT TOP(1) y FROM dbo.an_extremely_extremely_extremely_long_table_name'

sp_executesql N'SELECT 42 As y'

sp_executesql N'SELECT TOP(1) rand1 FROM dbo.rand_1M'

DROP TABLE dbo.test1
CREATE TABLE dbo.test1
(
  RowID int identity primary key,
  rand1 varchar(4) not null,
  rand2 varchar(4) NOT NULL
);

INSERT INTO dbo.test1
VALUES('1234', '1234'), ('1234', '1234')

exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSet'
              , @input_data_1 = N'SELECT TOP(2) col1  FROM dbo.test1'

SELECT * FROM dbo.test1



sp_executesql N'SELECT TOP(1) rand1, rand2 FROM dbo.test1'



CREATE TABLE dbo.rand_1M_ncci (  
    RowID int identity PRIMARY KEY,  
    rand1 int not null,  
    rand2 int not null,  
);  

--Create the columnstore index with a filtered condition  
CREATE NONCLUSTERED COLUMNSTORE INDEX rand_NCCI   
ON dbo.rand_1M_ncci (rand1, rand2)   
;  

INSERT INTO dbo.rand_1M_ncci
SELECT rand1, rand2
FROM dbo.rand_1M

CREATE TABLE dbo.rand_1M_cci 
(  
  RowID int identity PRIMARY KEY NONCLUSTERED,  
  rand1 int not null,  
  rand2 int not null,  
  INDEX idx_rand_1M_cci CLUSTERED COLUMNSTORE  
);

INSERT INTO dbo.rand_1M_cci 
SELECT rand1, rand2
FROM dbo.rand_1M

SELECT * FROM [dbo].[tb_Tab1]

sp_executesql N'SELECT TOP(2) rand1, rand2 FROM dbo.rand_1M_ncci'


sp_executesql N'SELECT TOP(1) rand1, rand2 FROM dbo.rand_1M_cci'


GO  




CREATE TABLE dbo.test2
(
  RowID int identity primary key,
  colint int,
  colbigint bigint,
  colfloat float,
  colmoney money,
  coldec decimal(4,2),
  coldec2 decimal(18, 10)
)

INSERT INTO dbo.test2
VALUES (1, 1, 1, 1, 1, 1),
       (1, 3147483647, 100.56, 1234.1234, 10.15, 123456.7891234)

DROP TABLE IF EXISTS dbo.test3;
CREATE TABLE dbo.test3
(
  RowID int identity primary key,
  coltiny tinyint not null,
  colsmallint smallint not null,
  colint int not null,
  colbigint bigint not null,
  colfloat float not null,
  colfloatsmall float(10) not null,
  colreal real not null,
  colmoney money not null,
  coldec decimal(4,2) not null,
  coldec2 decimal(18, 10) not null
)

INSERT INTO dbo.test3
VALUES (1, 1, 1,1, 1, 1, 1, 1, 1, 1),
       (1, 1, 1, 3147483647, 100.56, 1.1, 1, 1234.1234, 10.15, 123456.7891234)

INSERT INTO dbo.test2
VALUES (1, 1, 1, 1, 1, 1),
       (1, 3147483647, 100.56, 1234.1234, 10.15, 123456.7891234)

SELECT * FROM dbo.test2



DROP TABLE IF EXISTS dbo.test4;
CREATE TABLE dbo.test4
(
  RowID int identity primary key,
  colchar char(10) not null,
  colnchar nchar(20) not null,
  colvchar varchar(10) not null,
  colvcharlarge varchar(6000),
  colnvchar varchar(20) not null,
  colvcharmax varchar(max) not null,
  colvcharmaxsmall varchar(max) not null
);

INSERT INTO dbo.test4
VALUES ('Hello', N'Hello', 'Hello', REPLICATE('A', 6000),  N'Hello', 
        CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
        'Hello'),
        ('Hello', N'Hello', 'Hello', REPLICATE('A', 6000),   N'Hello', 
        CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
        'Hello');

SELECT * FROM dbo.test4

 

INSERT INTO dbo.test2
VALUES (1, 1, 1, 1, 1, 1),
       (1, 3147483647, 100.56, 1234.1234, 10.15, 123456.7891234)

SELECT * FROM dbo.test2






exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSet'
              , @input_data_1 = N'SELECT TOP(1) coldec2  FROM dbo.test2'


SELECT * FROM dbo.tb_Test1

sp_executesql N'SELECT TOP(1) rand1 FROM dbo.tb_Test1';

sp_executesql N'SELECT TOP(1) ColInt1 as rand1, ColDec1 AS rand2 FROM dbo.tb_Tab1';



ColDec1

...C.5.............8.r.a.n.d.1.Ñ....ÿ..Á.........y....þ..à.........
...L.5.............§....Ð.4.r.a.n.d.1.Ñ..sizeÿ..Á.........y....þ..à.........


...^.5.............8.r.a.n.d.1.......j....r.a.n.d.2.Ñ).....ÒW..ÿ..Á.........y....þ..à.........



...H.5.............j....r.a.n.d.1.Ñ..ÒW..ÿ..Á.........y....þ..à.........


sp_executesql N'SELECT TOP(1) rand1 FROM dbo.tb_Test1'


sp_executesql N'SELECT TOP(1) rand1, rand2 FROM dbo.tb_Test1'

sp_executesql N'SELECT TOP(2) rand1, rand2 FROM dbo.tb_Test1'

exec sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSet'
              , @input_data_1 = N'SELECT TOP(2) rand1 FROM dbo.tb_Test1' --38

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) rand4 FROM dbo.tb_Test1' --44

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) rand1, rand2 FROM dbo.tb_Test1' --76

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) rand1, rand2 FROM dbo.tb_Test1' --88


exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) ColBigInt1 FROM dbo.tb_Tab1' --40

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'Sys.sleep(10)
				d<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) ColBigInt1 FROM dbo.tb_Tab1' --48

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) ColDec1 FROM dbo.tb_Tab1' --38

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) ColDec1 FROM dbo.tb_Tab1' --44


exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) ColString1 FROM dbo.tb_Tab1' --39

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) ColString1 FROM dbo.tb_Tab1' --46

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) ColNString1 FROM dbo.tb_Tab1' --44

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) ColNString1 FROM dbo.tb_Tab1' --56

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) ColStringMax_S1 FROM dbo.tb_Tab1' --41

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) ColStringMax_S1 FROM dbo.tb_Tab1' --50

SELECT * FROM dbo.tb_Tab1

SELECT TOP(1) ColBigInt1 FROM dbo.tb_Tab1


SELECT * FROM dbo.test3

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Coltiny FROM dbo.test3' --33

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Coltiny FROM dbo.test3' --34

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colsmallint FROM dbo.test3' --34

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colsmallint FROM dbo.test3' --36


exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colfloat FROM dbo.test3' --40

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colfloat FROM dbo.test3' --48

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colfloatsmall FROM dbo.test3' --36

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colfloatsmall FROM dbo.test3' --40

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colreal FROM dbo.test3' --36

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colreal FROM dbo.test3' --40

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) ColMoney FROM dbo.test3' --40

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) ColMoney FROM dbo.test3' --48

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) ColDec FROM dbo.test3' --38

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) ColDec FROM dbo.test3' --44

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) ColDec2 FROM dbo.test3' --42

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) ColDec2 FROM dbo.test3' --52



SELECT * FROM dbo.test4
exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colchar FROM dbo.test4' --44 char(10)

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colchar FROM dbo.test4' --56

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colnchar FROM dbo.test4' --74 nchar(20)

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colnchar FROM dbo.test4' -- 116

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colvchar FROM dbo.test4' -- 39

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colvchar FROM dbo.test4' -- 46

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colvcharlarge FROM dbo.test4' -- 39

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colvcharlarge FROM dbo.test4' -- 46

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colnvchar FROM dbo.test4' -- 39

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colnvchar FROM dbo.test4' -- 46

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colvcharmax FROM dbo.test4' -- 14132

SELECT DATALENGTH(Colvcharmax) FROM dbo.test4 == 14000


exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colvcharmax FROM dbo.test4' -- 28232

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colvcharmaxsmall FROM dbo.test4' --41

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colvcharmaxsmall FROM dbo.test4' -- 50


-- https://docs.microsoft.com/en-us/sql/t-sql/data-types/float-and-real-transact-sql

UPDATE dbo.test4
SET Colvcharmaxsmall = REPLICATE('A', 6000)

UPDATE dbo.test4
SET Colvchar = REPLICATE('A', 7000)

DROP TABLE IF EXISTS dbo.test5;
CREATE TABLE dbo.test5
(
  RowID int identity primary key,
  coltiny tinyint,
  colsmallint smallint,
  colint int,
  colbigint bigint,
  colfloat float,
  colfloatsmall float(10),
  colreal real,
  colmoney money,
  coldec decimal(4,2),
  coldec2 decimal(18, 10)
)

INSERT INTO dbo.test5
VALUES (1,1,1,1, 1, 1, 1, 1, 1, 1),
       (1,1, 1, 1, 100.56, 1.1, 1, 1234.1234, 10.15, 123456.7891234),
	   (1,NULL, 1, NULL, 100.56, NULL, 1, NULL, 10.15, NULL),
	   (NULL,1, NULL, 1, NULL, 1.1, NULL, 1234.1234, NULL, 123456.7891234)

SELECT * FROM dbo.test5

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Coltiny FROM dbo.test5' --7313

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Coltiny FROM dbo.test5' --7314

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colsmallint FROM dbo.test5' --3889

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colsmallint FROM dbo.test5' --3891

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colint FROM dbo.test5' --2023

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colint FROM dbo.test5' --2017

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colbigint FROM dbo.test5' --1050

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colbigint FROM dbo.test5' --1058


exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colfloat FROM dbo.test5' --1050

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colfloat FROM dbo.test5' --1058

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colfloatsmall FROM dbo.test5' --2023

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colfloatsmall FROM dbo.test5' --2027

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colreal FROM dbo.test5' --2023

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colreal FROM dbo.test5' --2027

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) ColMoney FROM dbo.test5' --1050

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) ColMoney FROM dbo.test5' --1058

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) ColDec FROM dbo.test5' --38

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) ColDec FROM dbo.test5' --44

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) ColDec2 FROM dbo.test5' --42

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) ColDec2 FROM dbo.test5' --52


exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colint FROM dbo.test5 WHERE RowID = 4' --2019

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colint FROM dbo.test5 WHERE RowID > 2' --2023

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colbigint FROM dbo.test5 WHERE RowID > 2' --1050

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) ColDec FROM dbo.test5 WHERE RowID = 4' --38

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colint FROM dbo.test5' --2017

SELECT * FROM dbo.test5


exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colbigint FROM dbo.test5 WHERE RowID = 3' --1050




DROP TABLE IF EXISTS dbo.test6;
CREATE TABLE dbo.test6
(
  RowID int identity primary key,
  colchar char(10),
  colnchar nchar(20),
  colvchar varchar(10),
  colvcharlarge varchar(6000),
  colnvchar varchar(20),
  colvcharmax varchar(max),
  colvcharmaxsmall varchar(max)
);
GO

INSERT INTO dbo.test6
VALUES ('Hello', N'Hello', 'Hello', REPLICATE('A', 6000),  N'Hello', 
        CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
        'Hello'),
        ('Hello', N'Hello', 'Hello', REPLICATE('A', 6000),   N'Hello', 
        CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
        'Hello'),
		('Hello', N'Hello', NULL, REPLICATE('A', 6000),   N'Hello', 
        CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
        'Hello'),
		('Hello', N'Hello', 'Hello', REPLICATE('A', 6000),   N'Hello', 
        CAST(REPLICATE(CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
        'Hello');

SELECT * FROM dbo.test6

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colvchar FROM dbo.test6' -- 39

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(2) Colvchar FROM dbo.test6' -- 46

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colvchar FROM dbo.test6' -- 39

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colvcharlarge FROM dbo.test6' -- 46

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) Colvchar FROM dbo.test6 WHERE RowID = 3' -- 39



12 + 5 + 8 + 1 + 1 = 27

sp_executesql N'SELECT TOP(1) ColDec FROM dbo.test3' --74
sp_executesql N'SELECT TOP(2) ColDec FROM dbo.test3' --81

sp_executesql N'SELECT TOP(1) ColDec FROM dbo.test5'

sp_executesql N'SELECT TOP(1) ColDec FROM dbo.test5 WHERE RowID = 4'

SELECT * FROM dbo.test5

exec sp_execute_external_script
				@language = N'R' ,
				@script = N'd<-InputDataSet'
				, @input_data_1 = N'SELECT TOP(1) ColDec FROM dbo.test5 WHERE RowID = 4' -- 46