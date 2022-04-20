		SELECT  
					  f.field_id fieldId,
					  f.name name,
					  f.addr addr,
					  (case
					    when ct.name = 'H'
					      then '하드코트'
					          when ct.name = 'C'
					      then '클레이코트'
					          when ct.name = 'G'
					      then '잔디코트'
					      
					      else '앙투라코트'
					  end) courtName,
					  (case
					    when f.parking_area = 0 
					      then '불가'
					    ELSE '가능'
					  END) parkingArea,
					  (CASE
					    when ind_yn = 0
					      then '실외'
					    ELSE '실내'
					  END) indYn,
					  (CASE
					    WHEN light_yn =0
					      then '무'
					      ELSE '유'
					  END) lightYn,
					  f.court_cnt courtCnt    
		FROM field f
					left JOIN court c
					ON f.field_id = c.field_id
					left JOIN court_type ct
					ON c.court_type_id = ct.court_type_id
					GROUP BY f.field_id
					limit 10