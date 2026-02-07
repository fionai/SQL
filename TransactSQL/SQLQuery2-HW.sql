USE SPU_411_Import

--DROP TABLE TabStud

SELECT 
	Groups.group_name AS Группа,
	Groups.direction AS DirTMP,
	COUNT(Students.stud_id) AS StudNum,
	CASE WHEN COUNT(Students.stud_id) = 0 THEN 1 ELSE 0 END AS IsEmptyGroup
INTO TabStud
FROM Groups 
LEFT JOIN Students ON Students.[group] = Groups.group_id
GROUP BY 
Groups.group_name, Groups.direction

--SELECT * FROM TabStud

SELECT 
	Directions.direction_name AS Направление,
	CASE WHEN TabStud.Группа IS NULL THEN 0 ELSE 1 END AS NotEmptyDir,
	TabStud.Группа,
	TabStud.StudNum,
	CASE WHEN TabStud.IsEmptyGroup IS NULL OR TabStud.IsEmptyGroup = 0 THEN 0 ELSE 1 END AS IsEmptyGroup2
INTO TabDir
FROM
	Directions
LEFT JOIN TabStud ON TabStud.DirTMP  = Directions.direction_id

--SELECT * FROM TabDir

SELECT 
	TabDir.Направление,
	SUM (TabDir.NotEmptyDir) AS N'Количество групп',
	SUM (TabDir.IsEmptyGroup2) AS N'Количество пустых групп',
	SUM (TabDir.NotEmptyDir) - SUM (TabDir.IsEmptyGroup2) AS N'Количество непустых групп'
FROM TabDir
GROUP BY TabDir.Направление


DROP TABLE TabStud
DROP TABLE TabDir