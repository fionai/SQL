--SQLQuery2-SELECT Schedule CREATE PROCEDURE
USE SPU_411_Import
GO

ALTER PROCEDURE sp_SelectScheduleFull
AS
BEGIN
	SELECT 
		[Группа]		= [group_name],
		[Время]			= [time],
		[Дата]			= [date],
		--[День недели]	= DATENAME(WEEKDAY, [date]),
		[День недели]	= FORMAT([date], N'ddd', 'ru-RU'),

		[Дисциплина]	= Disciplines.discipline_name,
		[Преподаватель]	= FORMATMESSAGE(N'%s %s %s', Teachers.last_name, Teachers.first_name, Teachers.middle_name),
		[Статус]		= IIF (spent = 1, N'Проведено', N'Запланировано')
	FROM Schedule
	JOIN Groups				ON [group] = group_id
	JOIN Disciplines		ON discipline = discipline_id
	JOIN Teachers			ON teacher = teacher_id
	ORDER BY [date]
END