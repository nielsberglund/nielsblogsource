import pyodbc
import binascii

# get the file path to the jar file
# filePath = input("Provide full path to the JAR file you want to use - Example: 'W:\\javacodepath\\myJarFile.jar': ")
# # the name of the external library you want to create
extLibName = input("Provide a unique name for the external library you want to create: ")

# get db connection info
# dbServer = input("Provide name/ip address of your database server. If instance also instance name - Example: 'mydbServer\myInstance: ")
# dataBase = input("Provide name of the database where you want to create the external library: ")
# userName = input("Provide the user name with which you want to connect to the server. Notice - the user needs to be part of the 'dbo' schema: ")
# # here I'm inputting the pwd in cleartext, we should be using getpass or something similar.
# password = input("Provide password with which to connect to the database: ")

filePath = "W:\\javacodepath\\Calculator.jar"


with open(filePath, "rb") as binaryfile :
    myArr = binaryfile.read()
    hex_bytes = '0x' + binascii.hexlify(bytearray(myArr)).decode('utf-8')

# print(hex_bytes)

#print(f'This is the byte array: {hex_bytes}')

# connect to db

dbServer = 'localhost\s2k19_ctp23_1'
dataBase = 'JavaTest'
userName = 'sa'
password = 'sapwd'


drvr = '{ODBC Driver 17 for SQL Server}'
connStr = f'DRIVER={drvr};SERVER={dbServer};DATABASE={dataBase};UID={userName};PWD={password}'
print(connStr)
conn = pyodbc.connect(connStr)
cursor = conn.cursor()

execStmt = f"IF NOT EXISTS (SELECT * FROM sys.external_libraries WHERE name = '{extLibName}')\nBEGIN\n"
execStmt = execStmt + f'CREATE EXTERNAL LIBRARY {extLibName}\n'
execStmt = execStmt + f'FROM (CONTENT = {hex_bytes})\n'
execStmt = execStmt + f"WITH (LANGUAGE = 'Java');\n"
execStmt = execStmt + f'END'

cursor.execute(execStmt)
conn.commit()






