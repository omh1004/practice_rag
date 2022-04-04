-- 이름, 이메일 , 회원유형,가입일자, 라임캐시
SELECT 
	tt.userId,
	tt.name,
	tt.email,
	tt.userType,
	tt.rgtDate,
	(case 
		when tt.sum IS null
		then 0
		ELSE tt.sum
	end	
	) sum
from
	(SELECT
	u.user_id userId,
	u.name name,
   u.email email,
	(CASE 
		WHEN replace(u.user_type,'\r','') = "U" THEN '유저'
		WHEN replace(u.user_type,'\r','') = "M" THEN '매니저' 
	ELSE 'admin' END) userType,
	u.rgt_date rgtDate ,
	(SELECT 
		SUM(case
				when lc2.type_use = 'U'
					then CONCAT('-',lc2.amt)
					when lc2.type_use = 'C'
					then CONCAT(lc2.amt)
			ELSE lc2.amt
			end) 
	FROM lime_cash lc2
	WHERE lc2.user_id =u.user_id)	sum	
FROM user u
LEFT JOIN member m
ON u.user_id = m.user_id
left JOIN bank_info bi
ON m.bank_id = bi.bank_id
left JOIN lime_cash lc
ON m.user_id = lc.user_id
GROUP BY u.user_id
) tt
WHERE tt.userType = '유저'
LIMIT 10


