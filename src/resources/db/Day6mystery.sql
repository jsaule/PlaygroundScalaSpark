SELECT * FROM solution s;

--WITNESS 1:

SELECT name
	FROM sqlite_master
	where type = 'table';
	
SELECT * FROM crime_scene_report csr 
LIMIT 20;

SELECT * FROM crime_scene_report csr 
WHERE date = 20180115
AND type = 'murder'
AND city = 'SQL City';

SELECT description FROM crime_scene_report csr 
WHERE date = 20180115
AND type = 'murder'
AND city = 'SQL City';

SELECT * FROM interview i ;

SELECT * FROM person p ;

SELECT * FROM person p 
WHERE address_street_name LIKE "Northwestern%"
ORDER BY address_number DESC
LIMIT 1;

SELECT id FROM person p 
WHERE address_street_name LIKE "Northwestern%"
ORDER BY address_number DESC
LIMIT 1;

SELECT * FROM interview i 
WHERE person_id = (SELECT id FROM person p 
WHERE address_street_name LIKE "Northwestern%"
ORDER BY address_number DESC
LIMIT 1);

SELECT  * FROM get_fit_now_member gfnm 
LIMIT 20;

SELECT COUNT(*) FROM get_fit_now_member gfnm ;

SELECT * FROM get_fit_now_member gfnm 
WHERE id LIKE '48Z%'
AND membership_status = 'gold' ;

SELECT * FROM drivers_license dl 
WHERE plate_number LIKE '%H42W%';

SELECT * FROM person p 
JOIN drivers_license dl 
ON p.license_id = dl.id 
WHERE plate_number LIKE '%H42W%';

SELECT * FROM person p 
JOIN drivers_license dl 
ON p.license_id = dl.id 
JOIN get_fit_now_member gfnm 
ON p.id = gfnm.person_id 
WHERE plate_number LIKE '%H42W%'
AND gfnm.id LIKE '48Z%'
AND membership_status = 'gold' ;

SELECT * FROM interview i 
WHERE i.person_id = (SELECT p.id FROM person p 
JOIN drivers_license dl 
ON p.license_id = dl.id 
JOIN get_fit_now_member gfnm 
ON p.id = gfnm.person_id 
WHERE plate_number LIKE '%H42W%'
AND gfnm.id LIKE '48Z%'
AND membership_status = 'gold') ;

--I was hired by a woman with a lot of money. 
--I don't know her name but I know she's around 5'5" (65") 
--or 5'7" (67"). She has red hair and she drives a Tesla 
--Model S. I know that she attended the SQL Symphony 
--Concert 3 times in December 2017.

-- WITNESS 2:

SELECT * FROM  person p 
WHERE name LIKE '%Annab%'
AND address_street_name = 'Franklin Ave';

SELECT * FROM interview i 
WHERE i.person_id = (SELECT id FROM  person p 
WHERE name LIKE '%Annab%'
AND address_street_name = 'Franklin Ave');

--I saw the murder happen, and I recognized the killer 
--from my gym when I was working out last week on January 
--the 9th.



