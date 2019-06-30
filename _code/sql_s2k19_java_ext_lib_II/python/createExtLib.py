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
userName = 'sa'
password = 'sapwd'

drvr = '{ODBC Driver 17 for SQL Server}'
connStr = f'DRIVER={drvr};SERVER={dbServer};DATABASE={dataBase};UID={userName};PWD={password}'
conn = pyodbc.connect(connStr)
cursor = conn.cursor()

execStmt = f'CREATE EXTERNAL LIBRARY {extLibName}\n'
execStmt = execStmt + f'FROM (CONTENT = {hex_bytes})\n'
execStmt = execStmt + f"WITH (LANGUAGE = 'Java');\n"

cursor.execute(execStmt)
conn.commit()