-- FUNCTION: proc_func.get_address()
-- DROP FUNCTION proc_func.get_address();

CREATE OR REPLACE FUNCTION proc_func.get_address(
	)
    RETURNS TABLE(states text) 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
BEGIN

return query 
select 
s.states_name
from
dimensions.states as s;

END; 

$BODY$;

-- FUNCTION: proc_func.get_location(text)

-- DROP FUNCTION proc_func.get_location(text);

CREATE OR REPLACE FUNCTION proc_func.get_location(
	statename text)
    RETURNS TABLE(location text) 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
BEGIN
return query 
select 
d.district_name
from
dimensions.districts as d
inner join dimensions.states as s 
on d.statesid = s.statesid
where s.states_name =  stateName;
END;

$BODY$;

-- FUNCTION: proc_func.get_services()
-- DROP FUNCTION proc_func.get_services();

CREATE OR REPLACE FUNCTION proc_func.get_services(
	)
    RETURNS TABLE(services text) 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
BEGIN

return query 
select 
s.service_name
from
dimensions.services as s;

END; 

$BODY$;