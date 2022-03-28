
SELECT  
	f.field_id fieldId,
	f.name fName, -- 구장명,
	f.addr addr,-- 구장주소,
	(case
		when ct.name = 'H'
			then '하드코트'
					when ct.name = 'C'
			then '클레이코트'
					when ct.name = 'G'
			then '잔디코트'
			
			else '앙투라코트'
	end) courtType,
	c.fee fee,-- 이용요금,
	f.court_cnt courtCnt, 
	(case
		when f.parking_area = 0 
			then '불가'
		ELSE '가능'
	END) parkingAvt,  -- 주차가능여부,
	(CASE
		when ind_yn = 0
			then '실외'
		ELSE '실내'
	END) indYn , 
	(CASE
		WHEN light_yn =0
			then '무'
			ELSE '유'
	END) lightYn		
FROM field f
left JOIN court c
ON f.field_id = c.field_id
left JOIN court_type ct
ON c.court_type_id = ct.court_type_id
GROUP BY f.field_id
HAVING f.field_id =2
