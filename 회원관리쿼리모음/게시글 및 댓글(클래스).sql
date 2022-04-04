-- 게시글 및 댓글(클래스)
SELECT 
	c.cls_id clsId,	
	c.title title,
	c.intr intr,
	date_format(c.rgt_date, '%Y-%m-%d') rgtDate,
	u.name cName	
FROM 
cls c
inner JOIN user u
ON c.user_id = u.user_id