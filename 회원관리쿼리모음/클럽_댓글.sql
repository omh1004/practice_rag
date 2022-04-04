-- 클럽_댓글

SELECT 
cp.post_id NO,
(SELECT 
name
FROM 
club
WHERE club_id = cp.club_id) clubName,
cp.title title,
cpc.content content,
(SELECT 
	NAME 
FROM
user 
WHERE user_id =cp.user_id) pUserName,
(SELECT 
	NAME 
FROM
user 
WHERE user_id =cpc.user_id) cUserName,
date_format(IFNULL(cpc.mdfy_date,cpc.rgt_date),'%Y-%m-%d') rgtDate 
FROM club_post cp
inner JOIN club_post_comment cpc


