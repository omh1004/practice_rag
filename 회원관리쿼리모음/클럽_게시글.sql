SELECT 
	post_id postId,
	(select
		name
	 FROM club
	 WHERE club_id =  cp.club_id) cName,
	 cp.title title,
	 cp.content content
FROM 
club_post cp
INNER JOIN user u
ON cp.user_id = u.user_id 
WHERE 1=1
AND post_id = 1