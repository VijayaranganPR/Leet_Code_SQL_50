﻿SELECT 
	teacher_id, 
	COUNT(DISTINCT(SUBJECT_ID)) AS cnt 
FROM 
	TEACHER
GROUP BY 
	teacher_id