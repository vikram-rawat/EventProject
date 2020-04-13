------------------------------------------------------
------------------------------------------------------
-- FUNCTION: proc_func.get_address()
-- DROP FUNCTION proc_func.get_address();
------------------------------------------------------
------------------------------------------------------

CREATE OR REPLACE FUNCTION proc_func.get_address(
	)
    RETURNS TABLE(states text) 
    LANGUAGE 'plpgsql'

AS $BODY$
BEGIN

return query 
	select 
		s.states_name
	from
		dimensions.states as s;

END; 

$BODY$;


------------------------------------------------------
------------------------------------------------------
-- FUNCTION: proc_func.get_location(text)
-- DROP FUNCTION proc_func.get_location(text);
------------------------------------------------------
------------------------------------------------------

CREATE OR REPLACE FUNCTION proc_func.get_location(
	statename text)
    RETURNS TABLE(location text) 
    LANGUAGE 'plpgsql'

AS $BODY$
BEGIN
return query 

with join_query as(
	select 
		d.district_name,
		d.districtid
	from
		dimensions.districts as d
		inner join dimensions.states as s 
		on d.statesid = s.statesid
	where 
		s.states_name =  stateName	
),
city_query as(
	select 
		c.city_name
	from
		dimensions.city as c
		inner join
		join_query as d
		on 
		c.districtid = d.districtid
),
main_query as(
	select 
		* 
	from 
		city_query
	union
	select 
		district_name 
	from
		join_query
)
select 
	* 
from 
	main_query;

END;

$BODY$;

------------------------------------------------------
------------------------------------------------------
-- FUNCTION: proc_func.get_services()
-- DROP FUNCTION proc_func.get_services();
------------------------------------------------------
------------------------------------------------------

CREATE OR REPLACE FUNCTION proc_func.get_services(
	)
    RETURNS TABLE(services text) 
    LANGUAGE 'plpgsql'

AS $BODY$
BEGIN

return query 
	select 
		s.service_name
	from
		dimensions.services as s;

END; 

$BODY$;

------------------------------------------------------
------------------------------------------------------
--- to verify userids
------------------------------------------------------
------------------------------------------------------
CREATE OR REPLACE FUNCTION proc_func.verify_userid(
	p_userid text)
    RETURNS TABLE(user_exists boolean) 
    LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
return query 
	select exists(
	select *	
	from
		details.main_user 
	where 
		userid = p_userid );
END;

$BODY$;

------------------------------------------------------
------------------------------------------------------
