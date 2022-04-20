-- 게시판(중고거래 게시글)
SELECT 
 i.item_id itemId,
 i.item_name itemName,
 i.content content,
 i.rgt_date rgtDate,
 u.name name
FROM 
item i
INNER JOIN user u
ON i.user_id = u.user_id