-- FUNCTION: public.get_address()

-- DROP FUNCTION public.get_address();

CREATE OR REPLACE FUNCTION public.get_address(
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
statics.states as s;

END; 

$BODY$;

ALTER FUNCTION public.get_address()
    OWNER TO postgres;


-- FUNCTION: public.get_location(text)

-- DROP FUNCTION public.get_location(text);

CREATE OR REPLACE FUNCTION public.get_location(
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
statics.districts as d
inner join statics.states as s 
on d.statesid = s.statesid
where s.states_name =  stateName;
END;

$BODY$;

ALTER FUNCTION public.get_location(text)
OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.get_services(
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
statics.services as s;

END; 

$BODY$;

ALTER FUNCTION public.get_services()
    OWNER TO postgres;
