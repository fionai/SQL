--SQLQuery3-SELECT Count Group and Students
USE SPU_411_Import

SELECT 
			direction_name		AS N'направление обучения',
			COUNT(DISTINCT group_name)	AS N'количество групп',  --DISTINCT убирает дубликаты и возвращает уникальные значения
			COUNT( stud_id)		AS N'количествро студентов'
FROM		Students, Groups, Directions
WHERE		direction	=	direction_id
AND			[group]		=	group_id
--AND			COUNT(group_name) < 5  where НЕ ПОНИМАЕТ агрегирования
GROUP BY	direction_name
--HAVING		COUNT(group_name) < 5 --having обязаиельно должен идти сразу после group by
ORDER BY	N'количество групп'	
;