SELECT 
	post_id no,
	(select
		name
	 FROM club
	 WHERE club_id =  cp.club_id) cName,
	 cp.title title
FROM 
club_post cp
INNER JOIN user u
ON cp.user_id = u.user_id 