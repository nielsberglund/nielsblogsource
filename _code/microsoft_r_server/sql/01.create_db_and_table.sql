
--script to set up database for mortgages
--this required SQL 2016+

--create database

SET NOCOUNT ON;
GO

USE master;
GO

DROP DATABASE IF EXISTS MortgageDb;

CREATE DATABASE MortgageDb;
GO

USE MortgageDb;
GO

-- create table to store mortgage data
CREATE TABLE dbo.tb_MortgageData
(
  CreditScore int,
  HouseAge int,
  YearsEmp int,
  CreditCardDebt int,
  [Year] int,
  DidDefault bit,
);
GO
