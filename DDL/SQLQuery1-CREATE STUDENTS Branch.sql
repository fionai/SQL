--SQLQuery1-CREATE STUDENTS Branch
USE SPU_411_DDL;


--CREATE TABLE Directions 
--(
--	direction_id	TINYINT			PRIMARY KEY,
--	direction_name	NVARCHAR(150)	NOT NULL
--)

--CREATE TABLE Groups 
--(
--	group_id		INT				PRIMARY KEY,
--	group_name		NVARCHAR(24)	NOT NULL,
--	direction		TINYINT			NOT NULL
--	CONSTRAINT FK_Groups_Direction	FOREIGN KEY	REFERENCES	Directions(direction_id)
--);

CREATE TABLE Students
(
	student_id		INT				PRIMARY KEY,
	last_name		NVARCHAR(50)	NOT NULL,
	first_name		NVARCHAR(50)	NOT NULL,
	middle_name		NVARCHAR(50)	NULL,
	birth_date		DATE			NOT NULL,
	[group]			INT				NOT NULL
	CONSTRAINT FK_Students_Group FOREIGN KEY REFERENCES Groups(group_id)
)
