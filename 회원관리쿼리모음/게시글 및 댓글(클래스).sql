-- 게시글 및 댓글(클래스)
SELECT 
	c.cls_id NO,	
	c.title title,
	c.intr intr,
	c.rgt_date rgtDate,
	u.name cname	
FROM 
cls c
inner JOIN user u
ON c.user_id = u.user_id