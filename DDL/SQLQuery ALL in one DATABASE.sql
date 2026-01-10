-- SQLQuery ALL in one

CREATE DATABASE SPU_411_ALL
ON
(
	NAME		= SPU_411_ALL,
	FILENAME	= 'C:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\data\SPU_411_ALL.mdf',
	SIZE		= 8 MB,
	MAXSIZE		= 500 MB,
	FILEGROWTH	= 8 MB
)
LOG ON
(
	NAME		= SPU_411_ALL_Log,
	FILENAME	= 'C:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\data\SPU_411_ALL.ldf',
	SIZE		= 8 MB,
	MAXSIZE		= 500 MB,
	FILEGROWTH	= 5 MB
)

--USE SPU_411_ALL;

--CREATE TABLE Teachers
--(
--	teacher_id		INT				PRIMARY KEY,
--	last_name		NVARCHAR(50)	NOT NULL,
--	first_name		NVARCHAR(50)	NOT NULL,
--	middle_name		NVARCHAR(50)	,
--	birth_date		DATE			NOT NULL,
--	rate			MONEY			NOT NULL
--)