--SQLQuery5 HW20260110


--1. Посчитать количество студентов в каждой группе			- DONE. 
--(желательно так же отобразить пустые группы)				- NOT DONE;
--SELECT
--		group_name	AS	N'Название группы',
--		COUNT(stud_id) AS	N'Количество студентов'
--FROM Groups, Students
--WHERE	[group]	=	group_id
--GROUP BY	group_name

--1. Посчитать количество студентов в каждой группе			- DONE. 
--(желательно так же отобразить пустые группы)				- DONE;
SELECT
		Groups.group_name	AS N'Группа',
		SUM (CASE WHEN Groups.group_id = Students.[group] THEN 1 ELSE 0 END) AS	N'Количество студентов'
FROM Groups, Students
GROUP BY	Groups.group_name
ORDER BY N'Количество студентов' DESC


--2. При вычислении количества групп (NOT DONE) и студентов (DONE) по каждому направлению, 
--также должны учитываться пустые группы и направления		- DONE
SELECT
		Directions.direction_name	AS N'Направление',
		--SUM (CASE WHEN Directions.direction_id = Groups.direction AND Students.[group] = Groups.group_id THEN 1 ELSE 0 END) AS N'Количество групп',
		SUM (CASE WHEN Directions.direction_id = Groups.direction AND Students.[group] = Groups.group_id THEN 1 ELSE 0 END) AS N'Количество cтудентов'
FROM Students, Groups, Directions
GROUP BY Directions.direction_name
ORDER BY N'Количество cтудентов' DESC

--2. При вычислении количества групп (DONE) и студентов (DONE) по каждому направлению, 
--также должны учитываться пустые группы и направления		- NOT DONE
SELECT
		Directions.direction_name	AS N'Направление',
		COUNT (DISTINCT Groups.group_id)  AS N'Количество групп',
		SUM (CASE WHEN Directions.direction_id = Groups.direction AND Students.[group] = Groups.group_id THEN 1 ELSE 0 END) AS N'Количество cтудентов'
FROM Students, Groups, Directions
WHERE Directions.direction_id = Groups.direction
GROUP BY Directions.direction_name

--3. Посчитать количество преподавателей по каждой дисциплине			- DONE
SELECT
	Disciplines.discipline_name		AS N'Дисциплина',
	COUNT (Teachers.teacher_id)		AS N'Количество преподавателей'
FROM Teachers, Disciplines, TeachersDisciplinesRelation
WHERE Teachers.teacher_id = TeachersDisciplinesRelation.teacher AND Disciplines.discipline_id = TeachersDisciplinesRelation.discipline
GROUP BY Disciplines.discipline_name

--4. Для каждого преподавателя вывести количество дисциплин, которые он может вести		- DONE
SELECT
	FORMATMESSAGE('%s %s %s', Teachers.last_name, Teachers.first_name, Teachers.middle_name)	AS	N'Преподаватель',
	COUNT (Disciplines.discipline_id)		AS N'Количество дисциплин'
FROM Teachers, Disciplines, TeachersDisciplinesRelation
WHERE Teachers.teacher_id = TeachersDisciplinesRelation.teacher AND Disciplines.discipline_id = TeachersDisciplinesRelation.discipline
GROUP BY Teachers.last_name, Teachers.first_name, Teachers.middle_name

--5. Вывести преподов, которые не ведут ни одну дисциплину		- DONE
SELECT
	FORMATMESSAGE('%s %s %s', Teachers.last_name, Teachers.first_name, Teachers.middle_name)	AS	N'Преподаватель',
	SUM (CASE WHEN Teachers.teacher_id = Schedule.teacher AND Disciplines.discipline_id = Schedule.discipline THEN 1 ELSE 0 END) AS N'Количество дисциплин'
FROM Teachers, Schedule, Disciplines
GROUP BY Teachers.last_name, Teachers.first_name, Teachers.middle_name
HAVING  SUM (CASE WHEN Teachers.teacher_id = Schedule.teacher AND Disciplines.discipline_id = Schedule.discipline THEN 1 ELSE 0 END) = 0

--6. Для выбранного направления вывести все дисциплины, которые изучаются на этом направлении - DONE;
SELECT
	Directions.direction_name		AS N'Направление',
	Disciplines.discipline_name		AS N'Дисциплина'
FROM Directions, Disciplines, DisciplinesDirectionsRelation
WHERE	DisciplinesDirectionsRelation.direction = Directions.direction_id AND DisciplinesDirectionsRelation.discipline = Disciplines.discipline_id
AND  Directions.direction_name = N'.NET Development'


--7. Для выбранной дисциплины выяснить, на каких направлениях она изучается			- DONE
SELECT
	Disciplines.discipline_name		AS N'Дисциплина',
	Directions.direction_name		AS N'Направление'
FROM Directions, DisciplinesDirectionsRelation, Disciplines
WHERE DisciplinesDirectionsRelation.direction = Directions.direction_id AND DisciplinesDirectionsRelation.discipline = Disciplines.discipline_id
AND		Disciplines.discipline_id = 3


--8. Экспортировать результаты запроса (любого) в Excel			- DONE 


-- 9. Добавить группу 'SPU_411'				- DONE;
--INSERT
--	Groups	(group_id,	group_name)
--VALUES
--			(12,		N'SPU_411')
--SELECT * FROM Groups

--10.Выставить расписание для своей группы начиная от первой дисциплины и заканчивая текущей дисциплиной;
