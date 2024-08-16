
-- Exploring the Master database
SELECT * FROM master.INFORMATION_SCHEMA.TABLES

SELECT * FROM master.INFORMATION_SCHEMA.SCHEMATA

SELECT * FROM master.sys.all_objects


-- Exploring the AdventureWorks Database
SELECT * FROM AdventureWorks2019.INFORMATION_SCHEMA.TABLES

SELECT * FROM AdventureWorks2019.INFORMATION_SCHEMA.SCHEMATA

SELECT * FROM AdventureWorks2019.sys.all_objects

SELECT * FROM AdventureWorks2019.sys.indexes

-- To Create a Database using SQL
CREATE DATABASE DW_Class_2;

-- Switch to new DB
USE [DW_Class]

-- Create Schema
CREATE SCHEMA test;
CREATE SCHEMA test2;

SELECT * FROM DW_Class_2.INFORMATION_SCHEMA.SCHEMATA

-- Data Types
INT  -- Integer Numbers
FLOAT -- Decimal Number
DOUBLE -- Decimal Number
CHAR  -- Character
NCHAR -- Character
VARCHAR -- Character
NVARCHAR  -- Character
DATE -- Date


-- create table
CREATE TABLE test.DimAddress (
	AddressKey INT PRIMARY KEY NOT NULL,
	AddressName NVARCHAR(50) NOT NULL,
	City NVARCHAR(30) NOT NULL,
	State NVARCHAR(30) NOT NULL,
	DataAdded DATE

)

INSERT INTO test.DimAddress (AddressKey,
	AddressName,
	City,
	State,
	DataAdded) VALUES (1, '30. Old Trafford', 'Manchester', 'Manchester', '2024-07-23')


select * from test.DimAddress


-- Change table
ALTER TABLE test.DimAddress 
ADD Lat FLOAT;

ALTER TABLE test.DimAddress 
ADD GeographyKey int;

-- create second table 
CREATE TABLE test.DimGeography (
	GeographyKey INT PRIMARY KEY NOT NULL,
	Region CHAR(2) NOT NULL,
	Continent NVARCHAR(20) NOT NULL
)

-- Create foreign key relationship
ALTER TABLE test.DimAddress
ADD CONSTRAINT fk_GeographKey foreign key (GeographyKey)
REFERENCES test.DimGeography (GeographyKey)

-- Create an Index
CREATE NONCLUSTERED INDEX idx_region 
ON test.DimGeography (Region)