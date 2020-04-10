--- insert data in districts
COPY 
dimensions.districts(
	districtid,
	statesid,
	district_name,
	created_at,
	created_by,
	modified_at,
	modified_by) 
FROM 'E:\Go_code\src\EventShoop\sql\data\districts.csv' DELIMITER ',' CSV HEADER;