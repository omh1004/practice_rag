-- 게시판(중고거래 댓글)
SELECT
	concat(i.item_name,'-',u.name) iTitle,
	tr.trans_rpy_id NO ,
	tr.content content
FROM item i
INNER JOIN user u
ON i.user_id = u.user_id
LEFT JOIN trans_rpy tr
ON i.item_id = tr.item_id
WHERE tr.trans_rpy_id IS NOT null