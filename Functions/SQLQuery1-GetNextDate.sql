--SQLQuery1-GetNextDate

USE SPU_411_Import
GO

ALTER FUNCTION GetNextDate (@group_name AS NVARCHAR(24))
RETURNS DATE
AS
BEGIN
	DECLARE		@group_id		AS INT		= (SELECT group_id FROM Groups WHERE group_name=@group_name);
	DECLARE		@last_date		AS DATE		= dbo.GetLastDate(@group_name);
	DECLARE		@last_weekday	AS TINYINT	= DATEPART(WEEKDAY, @last_date);
	DECLARE		@next_weekday	AS TINYINT	= dbo.GetNextDay(@group_name);
	DECLARE		@next_date		AS DATE		= @last_date;
	DECLARE		@between_days	AS TINYINT;--	= @next_weekday - @last_weekday;
	
	IF (@next_weekday > @last_weekday)
	BEGIN
		SET @between_days = @next_weekday - @last_weekday;
	END
	ELSE
	BEGIN
		SET @between_days = 7 + @next_weekday - @last_weekday;
	END
	SET @next_date = DATEADD(day, @between_days, @last_date);

	RETURN		@next_date;
END