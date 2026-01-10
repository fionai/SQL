--SQLQuery4-SELECT Teachers

SELECT
		[Преподаватель]	=	FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
		[Дисциплина]	=	discipline_name
FROM Teachers, Disciplines, TeachersDisciplinesRelation
WHERE	teacher			=	teacher_id
AND		discipline		=	discipline_id
--AND		last_name		=	N'Покидюк' 
AND		discipline_name	LIKE N'системное%'
;