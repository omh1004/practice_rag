

-- 이름, 이메일 , 회원유형,가입일자, 라임캐시
-- 성별, 은행명, 계좌번호, 예금주명, 제재
SELECT 
	tt.userId userId,
	tt.name name,
	tt.email email,
	tt.userType userType,
	tt.rgtDate rgtDate,
	(case 
		when tt.sum IS null
		then 0
		ELSE tt.sum
	end	
	) SUM,
	tt.gender gender,
	tt.bankName bankName,
	tt.acnt_no acntNo,
	tt.acnt_holder acntHolder,
	block_date blockDate
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
				when 
					lc2.type_use = 'U'
					then CONCAT('-',lc2.amt)
					when lc2.type_use = 'C'
					then CONCAT(lc2.amt)
			ELSE lc2.amt
			end) 
	FROM lime_cash lc2
	WHERE lc2.user_id =u.user_id)	SUM,
	-- 성별, 은행명, 계좌번호, 예금주명, 제재
	(SELECT 
		case
			when 
				m2.gender = 'M'
				then '남성'
		   ELSE '여성'
		end	
	FROM member m2
	WHERE m2.user_id = m.user_id  
	)	gender,
	bi.name bankName,
	m.acnt_no acnt_no
	,m.acnt_holder acnt_holder
	,m.block_date block_date
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

