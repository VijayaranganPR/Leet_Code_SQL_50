﻿SELECT 
	*, 
	case 
		when x + y > z and x + z > y and y + z > x
		then 'Yes'
		else 'No' 
	end as triangle
FROM 
	Triangle