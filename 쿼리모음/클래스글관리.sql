
 SELECT 
	c.cls_id no,
	u.name tName,
	c.title title,
	c.cost cost,
	c.st_date stDate,
	c.end_date endDate,
	(case
		when c.level = 'D'
			then 'DEVELOPMENT'
		when c.level = 'B'
			then 'BEGINNER'
		when c.level = 'I'
			then 'INTERMEDIATE'
		when c.level = 'A'
			then 'ADVANCED' 
		ELSE 'PRO'
	END) LEVEL
FROM cls c
INNER JOIN user u
ON c.user_id = u.user_id
