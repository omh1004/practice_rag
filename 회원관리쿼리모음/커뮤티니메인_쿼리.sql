SELECT  
	post_id postId,
	title title,
	(SELECT
 			u.name 
	FROM
	member m 
	INNER JOIN user u
	ON m.user_id = u.user_id
	WHERE u.user_id = cp.user_id) NAME,
	date_format(cp.rgt_date,'%Y-%m-%d') rgtDate
FROM cmnty_post cp
