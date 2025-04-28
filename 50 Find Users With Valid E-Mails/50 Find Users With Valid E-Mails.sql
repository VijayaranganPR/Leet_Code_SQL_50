SELECT 
	* 
FROM 
	Users
WHERE 
	substring(LOWER(MAIL),0, len(mail)-12) not like '%[^a-zA-Z0-9._-]%'  
	AND substring(LOWER(MAIL),0, len(mail)-12) like '[a-zA-Z]%'
	AND MAIL LIKE '%leetcode.com' 
