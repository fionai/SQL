--SQLQuery1-INSERT ScheduleSemi PROCEDURE
USE SPU_411_Import;
GO

ALTER PROCEDURE sp_InsertScheduleSemistacionar
	@group_name				AS	NVARCHAR(24)	
	,@discipline_name		AS	NVARCHAR(150)
	,@teacher				AS	NVARCHAR(50)
AS	
BEGIN
	DECLARE @group_id			AS	INT			= (SELECT group_id		FROM Groups			WHERE group_name=@group_name);
	DECLARE @discipline_id		AS	SMALLINT	= (SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE @discipline_name);
	DECLARE @teacher_id			AS	SMALLINT	= (SELECT teacher_id	FROM Teachers		WHERE last_name = @teacher);
	--DECLARE @start_date			AS	DATE		= (SELECT start_date	FROM Groups			WHERE group_id=@group_id);
	DECLARE @start_date			AS	DATE		= dbo.GetStartDate (@group_name);
	DECLARE	@date				AS	DATE		= @start_date;
	DECLARE	@start_time			AS	TIME		= (SELECT start_time	FROM Groups			WHERE group_id=@group_id);
	DECLARE @last_date			AS	DATE		= dbo.GetLastDate(@group_name);
	DECLARE @lesson_number		AS	INT			= 0;
	DECLARE	@number_of_lessons	AS	TINYINT		= (SELECT number_of_lessons	FROM Disciplines WHERE discipline_id = @discipline_id);

WHILE (@lesson_number <= @number_of_lessons)
BEGIN
	PRINT ('---------------')
	PRINT @date
	
	SET @date = dbo.GetNextDate (@group_name);

	SET @lesson_number = @lesson_number + 1;
END


END

