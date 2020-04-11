--- insert data in country
COPY 
dimensions.country(
	countryid,
	countryname,
	created_at,
	created_by,
	modified_at,
	modified_by,
	is_deleted
)
FROM 'E:\Go_code\src\EventShoop\sql\data\country.csv' 
DELIMITER ',' 
CSV HEADER;

--- insert data in states
COPY 
dimensions.states(
	statesid,
	countryid,
	states_name,
	created_at,
	created_by,
	modified_at,
	modified_by,
	is_deleted
)
FROM 'E:\Go_code\src\EventShoop\sql\data\states.csv' 
DELIMITER ',' 
CSV HEADER;

--- insert data in districts
COPY 
dimensions.districts(
	districtid,
	statesid,
	district_name,
	created_at,
	created_by,
	modified_at,
	modified_by,
	is_deleted
) 
FROM 'E:\Go_code\src\EventShoop\sql\data\districts.csv' 
DELIMITER ',' 
CSV HEADER;


--- insert data in city
COPY 
dimensions.city(
	cityid,
	districtid,
	city_name,
	created_at,
	created_by,
	modified_at,
	modified_by,
	is_deleted
)
FROM 'E:\Go_code\src\EventShoop\sql\data\city.csv' 
DELIMITER ',' 
CSV HEADER;


--- insert data in services
COPY 
dimensions.services(
	serviceid,
	service_name,
	created_at,
	created_by,
	modified_at,
	modified_by,
	is_deleted
)
FROM 'E:\Go_code\src\EventShoop\sql\data\services.csv' 
DELIMITER ',' 
CSV HEADER;