-- 게시글 댓글(커뮤니티)
SELECT  
	cp.post_id pNo,
	c.comment_id cNo,
	cp.title title,
	c.content content,	
	date_format(IFNULL(c.mdfy_date,c.rgt_date),'%Y-%m-%d') rgtDate,
	(SELECT 
		name 
	FROM user
	WHERE user_id = c.user_id) name
FROM cmnty_post cp
INNER JOIN comment c
ON cp.post_id = c.post_id

